uint64_t sub_100000F9C(const char **a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uid_t v10;
  FILE *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  size_t v19;
  size_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29[256];
  char __s[256];
  byte_10004399D = 1;
  v1 = strdup(*a1);
  if (!v1) {
    novm((int)"+ua file name", v2, v3, v4, v5, v6, v7, v8);
  }
  v9 = v1;
  v10 = getuid();
  seteuid(v10);
  v11 = fopen(v9, "r");
  seteuid(0);
  if (!v11)
  {
    option_error("unable to open user login data file %s", v12, v13, v14, v15, v16, v17, v18, (int)v9);
    return 0LL;
  }

  sub_10000365C(v11, (int)v9);
  qword_100046200 = (uint64_t)v9;
  if (!fgets(__s, 255, v11) || !fgets(v29, 255, v11))
  {
    fclose(v11);
    option_error("unable to read user login data file %s", v22, v23, v24, v25, v26, v27, v28, (int)v9);
    return 0LL;
  }

  fclose(v11);
  v19 = strlen(__s);
  if (v19 && __s[v19 - 1] == 10) {
    __s[v19 - 1] = 0;
  }
  v20 = strlen(v29);
  if (v20 && v29[v20 - 1] == 10) {
    v29[v20 - 1] = 0;
  }
  return 1LL;
}

uint64_t sub_100001174( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return 1LL;
}

uint64_t sub_100001194( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return 1LL;
}

uint64_t sub_1000011B4(const char **a1)
{
  v2 = getgrnam(*a1);
  if (v2)
  {
    uint64_t v10 = ngroups;
    if (ngroups < 1)
    {
      return 1LL;
    }

    else
    {
      v11 = &groups;
      while (1)
      {
        int v12 = *v11++;
        if (v12 == v2->gr_gid) {
          break;
        }
        if (!--v10) {
          return 1LL;
        }
      }

      uint64_t result = 1LL;
      privileged = 1;
    }
  }

  else
  {
    option_error("group %s is unknown", v3, v4, v5, v6, v7, v8, v9, (int)*a1);
    return 0LL;
  }

  return result;
}

uint64_t sub_10000124C(const char **a1)
{
  v1 = *a1;
  size_t v2 = strlen(*a1);
  uint64_t v3 = malloc(v2 + 17);
  if (!v3) {
    novm((int)"allow-ip argument", v4, v5, v6, v7, v8, v9, v10);
  }
  v11 = v3;
  int v12 = v3 + 2;
  void *v11 = qword_100046220;
  v11[1] = v12;
  memcpy(v12, v1, v2 + 1);
  qword_100046220 = (uint64_t)v11;
  return 1LL;
}

uint64_t sub_1000012BC(const char **a1)
{
  v1 = *a1;
  size_t v2 = strlen(*a1);
  uint64_t v3 = malloc(v2 + 17);
  if (!v3) {
    novm((int)"allow-number argument", v4, v5, v6, v7, v8, v9, v10);
  }
  v11 = v3;
  int v12 = v3 + 2;
  void *v11 = qword_100046240;
  v11[1] = v12;
  memcpy(v12, v1, v2 + 1);
  qword_100046240 = (uint64_t)v11;
  return 1LL;
}

void link_terminated()
{
  if (phase)
  {
    if (pap_logout_hook)
    {
      pap_logout_hook();
    }

    else if (byte_100046208 == 1)
    {
      else {
        v0 = (const char *)&unk_100044CED;
      }
      bzero(&v9, 0x280uLL);
      v9.ut_type = -16376;
      strncpy(v9.ut_line, v0, 0x20uLL);
      pututxline(&v9);
      byte_100046208 = 0;
    }

    new_phase(0LL);
    notice("Connection terminated.", v1, v2, v3, v4, v5, v6, v7, v8);
  }
}

uint64_t link_down(uint64_t a1)
{
  uint64_t result = (uint64_t)notify((uint64_t **)link_down_notifier, 0);
  byte_10004620C = 0;
  if (byte_100046210 == 1 && dword_100046214 == 0)
  {
    update_link_stats(a1);
    byte_100046210 = 0;
    uint64_t result = sub_100001554("/etc/ppp/auth-down");
  }

  uint64_t v4 = protocols;
  if (protocols)
  {
    uint64_t v5 = (__int16 **)&off_10003F898;
    do
    {
      if (*((_BYTE *)v4 + 80))
      {
        unsigned int v6 = (unsigned __int16)*v4;
        if (v6 != 49185)
        {
          uint64_t v7 = (uint64_t (*)(uint64_t))*((void *)v4 + 5);
          if (v7)
          {
            uint64_t result = v7(a1);
            unsigned int v6 = (unsigned __int16)*v4;
          }

          if (v6 >> 14 <= 2)
          {
            int v8 = (uint64_t (*)(uint64_t, const char *))*((void *)v4 + 7);
            if (v8) {
              uint64_t result = v8(a1, "LCP down");
            }
          }
        }
      }

      utmpx v9 = *v5++;
      uint64_t v4 = v9;
    }

    while (v9);
  }

  dword_100046218 = 0;
  dword_10004621C = 0;
  if (phase) {
    return new_phase(9LL);
  }
  return result;
}

uint64_t sub_100001554(char *a1)
{
  uid_t v2 = getuid();
  uint64_t v3 = getpwuid(v2);
  if (!v3 || (pw_name = v3->pw_name) == 0LL)
  {
    getuid();
    pw_name = v7;
    slprintf((int)v7, 32, "%d");
  }

  slprintf((int)v8, 32, "%d");
  v6[0] = a1;
  v6[1] = &ifname;
  v6[2] = (char *)&peer_authname;
  v6[3] = pw_name;
  v6[4] = (char *)&devnam;
  v6[5] = v8;
  v6[6] = 0LL;
  uint64_t result = run_program(a1, v6, 0, (uint64_t)sub_100003F6C, 0LL);
  dword_100046214 = result;
  return result;
}

void link_established( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  utmpx v9 = protocols;
  if (protocols)
  {
    uint64_t v10 = (__int16 **)&off_10003F898;
    do
    {
      if ((unsigned __int16)*v9 != 49185)
      {
        if (*((_BYTE *)v9 + 80))
        {
          v11 = (void (*)(uint64_t))*((void *)v9 + 4);
          if (v11) {
            v11(a1);
          }
        }
      }

      int v12 = *v10++;
      utmpx v9 = v12;
    }

    while (v12);
  }

  int v13 = auth_required;
  if (auth_required) {
    BOOL v14 = 1;
  }
  else {
    BOOL v14 = qword_100046220 == 0;
  }
  if (!v14)
  {
    sub_1000019B4((void *)a1, 0LL, 0LL);
    int v13 = auth_required;
  }

  if (v13
    && !lcp_gotoptions[68 * (int)a1 + 5]
    && !lcp_gotoptions[68 * (int)a1 + 6]
    && !lcp_gotoptions[68 * (int)a1 + 7])
  {
    if (qword_100046220)
    {
      sub_1000019B4((void *)a1, 0LL, 0LL);
    }

    else
    {
      else {
        BOOL v36 = 0;
      }
      if (!v36 || !sub_100001D98((void *)a1))
      {
        warning("peer refused to authenticate: terminating link", a2, a3, a4, a5, a6, a7, a8, v43);
        lcp_close(a1, "peer refused to authenticate", v37, v38, v39, v40, v41, v42);
        *(_DWORD *)status = 11;
        return;
      }
    }
  }

  new_phase(5LL);
  if (lcp_gotoptions[68 * (int)a1 + 7])
  {
    EapAuthPeer(a1, (uint64_t)&our_name, v16, v17, v18, v19, v20, v21);
    char v22 = 0;
    int v23 = 32;
  }

  else if (lcp_gotoptions[68 * (int)a1 + 6])
  {
    int v24 = lcp_gotoptions[68 * (int)a1 + 24];
    if ((v24 & 1) != 0)
    {
      uint64_t v25 = 129LL;
    }

    else if ((v24 & 2) != 0)
    {
      uint64_t v25 = 128LL;
    }

    else
    {
      uint64_t v25 = (v24 << 29 >> 31) & 5;
    }

    chap_auth_peer(a1, (uint64_t)&our_name, v25, v17, v18, v19, v20, v21, v43);
    char v22 = 0;
    int v23 = 8;
  }

  else if (lcp_gotoptions[68 * (int)a1 + 5])
  {
    upap_authpeer(a1);
    char v22 = 0;
    int v23 = 2;
  }

  else
  {
    int v23 = 0;
    char v22 = 1;
  }

  if (lcp_hisoptions[68 * (int)a1 + 7])
  {
    EapAuthWithPeer(a1);
    int v26 = 16;
LABEL_44:
    v23 |= v26;
    dword_10004622C[(int)a1] = v23;
    auth_done[(int)a1] = 0;
LABEL_45:
    notify((uint64_t **)auth_start_notify, v23);
    return;
  }

  if (lcp_hisoptions[68 * (int)a1 + 6])
  {
    int v27 = lcp_hisoptions[68 * (int)a1 + 24];
    if ((v27 & 1) != 0)
    {
      uint64_t v28 = 129LL;
    }

    else if ((v27 & 2) != 0)
    {
      uint64_t v28 = 128LL;
    }

    else
    {
      uint64_t v28 = (v27 << 29 >> 31) & 5;
    }

    chap_auth_with_peer(a1, (uint64_t)&user, v28, v17, v18, v19, v20, v21, v43);
    int v26 = 4;
    goto LABEL_44;
  }

  if (lcp_hisoptions[68 * (int)a1 + 5])
  {
    if (!(_BYTE)passwd)
    {
      byte_100046228 = 1;
    }

    upap_authwithpeer(a1, &user, (const char *)&passwd);
    int v26 = 1;
    goto LABEL_44;
  }

  dword_10004622C[(int)a1] = v23;
  auth_done[(int)a1] = 0;
  if ((v22 & 1) == 0) {
    goto LABEL_45;
  }
  sub_100001FFC(a1, v15, v16, v17, v18, v19, v20, v21);
}

void *sub_1000019B4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2;
  v65 = a2;
  uint64_t v6 = (int)a1;
  uint64_t v7 = (void *)qword_100046238[(int)a1];
  if (v7) {
    free(v7);
  }
  qword_100046238[v6] = 0LL;
  uint64_t result = (void *)qword_100046248;
  if (qword_100046248)
  {
    do
    {
      utmpx v9 = (void *)*result;
      free(result);
      uint64_t result = v9;
    }

    while (v9);
  }

  qword_100046248 = a3;
  for (i = 0; v4; uint64_t v4 = (void *)*v4)
    ++i;
  uint64_t v11 = qword_100046220;
  if (qword_100046220)
  {
    int v12 = 0;
    int v13 = (void *)qword_100046220;
    do
    {
      ++v12;
      int v13 = (void *)*v13;
    }

    while (v13);
  }

  else
  {
    int v12 = 0;
  }

  int v14 = v12 + i;
  if (v14)
  {
    uint64_t result = malloc(12LL * (v14 + 1));
    if (result)
    {
      uint64_t v15 = result;
      v61 = a1;
      uint64_t v62 = v6;
      uint64_t v16 = (uint64_t *)&v65;
      do
      {
        uint64_t v17 = v16;
        uint64_t v16 = (uint64_t *)*v16;
      }

      while (v16);
      *uint64_t v17 = v11;
      uint64_t v18 = v65;
      if (v65)
      {
        int v63 = 0;
        int v19 = 0;
        while (1)
        {
          uint64_t v20 = (const char *)v18[1];
          if (!strcmp(v20, "-")) {
            goto LABEL_65;
          }
          int v21 = strcmp(v20, "*");
          char v22 = (_DWORD *)v15 + 3 * v19;
          *char v22 = 1;
          if (!v21)
          {
            v55 = (char *)v15 + 12 * v19;
            *((_DWORD *)v55 + 1) = 0;
            *((_DWORD *)v55 + 2) = 0;
            ++v19;
            goto LABEL_65;
          }

          if (*v20 == 33)
          {
            *char v22 = 0;
            ++v20;
          }

          int v23 = strchr(v20, 47);
          int v24 = v23;
          if (v23)
          {
            int v25 = strtol(v23 + 1, &__endptr, 10);
            uint64_t v32 = "invalid address length %v in auth. address list";
            if ((v25 - 33) < 0xFFFFFFE0
              || ((int v33 = *__endptr, v33 != 43)
                ? (unsigned int v34 = 0)
                : (v34 = ifunit + 1, int v33 = __endptr[1]),
                  uint64_t v32 = "invalid address length syntax: %v",
                  v33))
            {
              warning(v32, (uint64_t)v32, v26, v27, v28, v29, v30, v31, (_DWORD)v24 + 1);
              goto LABEL_61;
            }

            *int v24 = 0;
            uint64_t v35 = (-1 << (32 - v25));
          }

          else
          {
            unsigned int v34 = 0;
            uint64_t v35 = 0xFFFFFFFFLL;
          }

          BOOL v36 = gethostbyname(v20);
          if (v36 && v36->h_addrtype == 2)
          {
            uint64_t v44 = **(unsigned int **)v36->h_addr_list;
            if (v24) {
              goto LABEL_48;
            }
          }

          else
          {
            v45 = getnetbyname(v20);
            if (!v45 || v45->n_addrtype != 2)
            {
              uint64_t v44 = inet_addr(v20);
              if (!v24) {
                goto LABEL_49;
              }
LABEL_48:
              *int v24 = 47;
              goto LABEL_49;
            }

            uint64_t v46 = htonl(v45->n_net);
            uint64_t v44 = v46;
            if (v24) {
              goto LABEL_48;
            }
            int v47 = ntohl(v46);
            else {
              int v48 = v35;
            }
            else {
              unsigned int v49 = v48;
            }
            if (v47 < 0) {
              uint64_t v35 = v49;
            }
            else {
              uint64_t v35 = 4278190080LL;
            }
          }

LABEL_49:
          if ((_DWORD)v44 == -1)
          {
            warning("unknown host %s in auth. address list", v37, v38, v39, v40, v41, v42, v43, v18[1]);
          }

          else
          {
            if (!v34) {
              goto LABEL_53;
            }
            if (v34 < ~(_DWORD)v35)
            {
              int v50 = ntohl(v44);
              LODWORD(v44) = htonl((v50 & v35) + v34);
              uint64_t v35 = 0xFFFFFFFFLL;
LABEL_53:
              int v51 = htonl(v35);
              v52 = (char *)v15 + 12 * v19;
              *((_DWORD *)v52 + 1) = v51 & v44;
              *((_DWORD *)v52 + 2) = v51;
              ++v19;
              int v53 = v63;
              if (v63) {
                BOOL v54 = 0;
              }
              else {
                BOOL v54 = (_DWORD)v35 == -1;
              }
              if (v54) {
                int v53 = v44;
              }
              int v63 = v53;
              goto LABEL_61;
            }

            warning("interface unit %d too large for subnet %v", v37, v38, v39, v40, v41, v42, v43, ifunit);
          }

  uint64_t v15 = 0xFFFFFFFFLL;
  sub_10001CA2C(a1, -1);
  return v15;
}

    if (select(v47, &v125, &v124, 0LL, v59) < 0)
    {
      if (*__error() != 4) {
        fatal("select", v65, v66, v67, v68, v69, v70, v71, v104);
      }
    }

    else
    {
      if (max_data_rate)
      {
        gettimeofday(&v119, 0LL);
        v73 = v72 < 0;
        if (v105 < v72 || v72 < 0) {
          v75 = 0;
        }
        else {
          v75 = v105 - v72;
        }
        v76 = __OFSUB__(v106, v72);
        v77 = v106 - v72;
        if (v77 < 0 != v76) {
          v73 = 1;
        }
        if (v73) {
          v78 = 0;
        }
        else {
          v78 = v77;
        }
        v122 = v119;
      }

      else
      {
        v75 = 0;
        v78 = 0;
      }

      v79 = v112;
      v80 = v113;
      v81 = v111;
      v82 = v109;
      if (__darwin_check_fd_set_overflow(a1, &v125, 0) && (*v114 & v115) != 0)
      {
        v83 = read(a1, &inpacket_buf, 0x5E0uLL);
        v81 = v83;
        if ((v83 & 0x80000000) != 0)
        {
          if (*__error() != 5)
          {
            if (*__error() != 4 && *__error() != 35)
            {
              v102 = "Error reading standard input: %m";
LABEL_136:
              error(v102, v86, v87, v88, v89, v90, v91, v92, v104);
LABEL_131:
              exit(0);
            }

            v81 = 0LL;
            goto LABEL_85;
          }
        }

        else if ((_DWORD)v83)
        {
          v84 = dword_1000479A8;
          if (__darwin_check_fd_set_overflow(dword_1000479A8, &v124, 0)) {
            *(__int32_t *)((char *)v124.fds_bits + (((unint64_t)v84 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v84;
          }
          if (v112)
          {
            v85 = sub_100020348(v112, 2, &inpacket_buf, v81, &v123);
LABEL_78:
            if (!v85) {
              v79 = 0LL;
            }
          }

          goto LABEL_85;
        }

        write(dword_1000479A8, &inpacket_buf, 0LL);
        if (v112)
        {
          v85 = sub_100020348(v112, 4, 0LL, 0, &v123);
          v81 = 0LL;
          LODWORD(v108) = 0;
          goto LABEL_78;
        }

        v81 = 0LL;
        LODWORD(v108) = 0;
LABEL_85:
        v82 = &inpacket_buf;
      }

      v93 = v110;
      v94 = dword_1000479A8;
      if (__darwin_check_fd_set_overflow(dword_1000479A8, &v125, 0)
        && ((*(unsigned int *)((char *)v125.fds_bits + (((unint64_t)v94 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v94) & 1) != 0)
      {
        v95 = read(dword_1000479A8, &outpacket_buf, 0x5E0uLL);
        v80 = v95;
        if ((v95 & 0x80000000) != 0)
        {
          if (*__error() == 5)
          {
LABEL_97:
            close(a2);
            if (v79)
            {
              v81 = 0LL;
              v80 = 0LL;
              v108 = 0LL;
            }

            else
            {
              v81 = 0LL;
              v80 = 0LL;
              v108 = 0LL;
            }
          }

          else
          {
            if (*__error() != 4 && *__error() != 35)
            {
              v102 = "Error reading pseudo-tty master: %m";
              goto LABEL_136;
            }

            v80 = 0LL;
          }

LABEL_61:
          uint64_t v18 = (void *)*v18;
          if (!v18) {
            goto LABEL_65;
          }
        }
      }

      int v63 = 0;
      int v19 = 0;
LABEL_65:
      *uint64_t v17 = 0LL;
      v56 = (char *)v15 + 12 * v19;
      *(void *)v56 = 0LL;
      *((_DWORD *)v56 + 2) = 0;
      uint64_t result = v61;
      qword_100046238[v62] = v15;
      if (v63)
      {
        v57 = (char *)&ipcp_wantoptions + 52 * (int)v62;
        unsigned int v60 = *((_DWORD *)v57 + 8);
        v59 = v57 + 32;
        uint64_t v58 = v60;
        if (!v60 || (uint64_t result = (void *)auth_ip_addr((int)v61, v58), !(_DWORD)result))
        {
          _DWORD *v59 = v63;
          if (v19 >= 2) {
            *((_BYTE *)&ipcp_wantoptions + 52 * (int)v62 + 8) = 1;
          }
        }
      }
    }
  }

  return result;
}

      if (v29 == 9)
      {
        if (!v6) {
          break;
        }
        --v6;
        uint64_t v31 = 9;
LABEL_64:
        *v4++ = v31;
LABEL_70:
        --v20;
        if (!v6) {
          goto LABEL_148;
        }
        goto LABEL_43;
      }

      if (!v6) {
        break;
      }
      *uint64_t v4 = 94;
      if (v6 != 1)
      {
        v6 -= 2;
        v4[1] = v29 ^ 0x40;
        v4 += 2;
        goto LABEL_70;
      }

      ++v4;
      break;
    case 's':
      v64 = (char **)v91;
      v91 += 2;
      int v51 = *v64;
      goto LABEL_135;
    case 't':
      time(&v90);
      v65 = ctime(&v90);
      int v51 = v65 + 4;
      v65[19] = 0;
      goto LABEL_135;
    case 'u':
      LODWORD(v52) = 0;
      v69 = (unsigned int *)v91;
      v91 += 2;
      BOOL v54 = *v69;
      goto LABEL_151;
    case 'x':
      goto LABEL_115;
    default:
      if (v16 != 88) {
        goto LABEL_116;
      }
LABEL_115:
      LODWORD(v52) = 0;
      int v53 = (unsigned int *)v91;
      v91 += 2;
      BOOL v54 = *v53;
LABEL_132:
      int v63 = 16LL;
      goto LABEL_152;
  }

          return;
        }

        uint64_t v20 = v18 - 8;
        int v21 = (int *)(v14 + 8);
        while (1)
        {
          char v22 = *v21;
          int v23 = *((unsigned __int16 *)v21 + 2);
          int v24 = malloc(0x18uLL);
          if (!v24) {
            goto LABEL_58;
          }
          int v25 = v24;
          uint64_t v26 = ntohs(v23);
          uint64_t v27 = malloc(v26 + 1);
          v25[2] = v27;
          if (!v27) {
            break;
          }
          uint64_t v35 = v27;
          *((_DWORD *)v25 + 2) = v22;
          memcpy(v27, (char *)v21 + 6, v26);
          v35[v26] = 0;
          *int v25 = *((void *)a1 + 6);
          *((void *)a1 + 6) = v25;
          BOOL v36 = v26 + 6;
          v20 -= v36;
          int v21 = (int *)((char *)v21 + v36);
          if (v20 <= 2) {
            goto LABEL_55;
          }
        }

        error("ACSP plugin: no memory\n", v28, v29, v30, v31, v32, v33, v34, v42);
        free(v25);
      }

      return;
    case 4:
      if (*((_DWORD *)a1 + 2) != 4)
      {
        uint64_t v16 = "ACSP plugin: received unexpected timeout\n";
LABEL_31:
        error(v16, a2, a3, a4, a5, a6, a7, a8, a9);
        return;
      }

      uint64_t v17 = *((_DWORD *)a1 + 5);
      *((_DWORD *)a1 + 5) = v17 + 1;
      if (v17 <= 9)
      {
        *(void *)(a3 + 8) = *((void *)a1 + 4);
        *(_WORD *)(a3 + 4) = *((_WORD *)a1 + 21) + 4;
        *(_WORD *)(a3 + 2) = 3;
        return;
      }

      error("ACSP plugin: no acknowlegement from peer\n", a2, a3, a4, a5, a6, a7, a8, v42);
      goto LABEL_36;
    case 5:
      uint64_t v16 = "ACSP plugin: unexpected notification received\n";
      goto LABEL_31;
    case 6:
      error("ACSP plugin: error notificationr received\n", a2, a3, a4, a5, a6, a7, a8, v42);
      if (*((_DWORD *)a1 + 2) == 4) {
        *(_WORD *)(a3 + 2) = 5;
      }
      goto LABEL_36;
    default:
      return;
  }

uint64_t sub_100001D98(void *a1)
{
  if (null_auth_hook)
  {
    uint64_t v2 = null_auth_hook(&v12, &v11);
  }

  int v12 = 0LL;
  uint64_t v3 = fopen("/etc/ppp/pap-secrets", "r");
  if (!v3) {
    return 0LL;
  }
  uint64_t v4 = v3;
  sub_10000365C(v3, (int)"/etc/ppp/pap-secrets");
  BOOL v5 = (int)sub_1000036B8(v4, (const char *)&unk_10002EB6A, &our_name, v13, &v12, &v11, (int)"/etc/ppp/pap-secrets", 0) >= 0
    && v13[0] == 0;
  uint64_t v2 = v5;
  bzero(v13, 0x400uLL);
  fclose(v4);
  if ((_DWORD)v2 == 1)
  {
LABEL_11:
    sub_1000019B4(a1, v12, (uint64_t)v11);
  }

  else
  {
    utmpx v9 = v11;
    if (v11)
    {
      do
      {
        uint64_t v10 = (void *)*v9;
        free(v9);
        utmpx v9 = v10;
      }

      while (v10);
    }

    else
    {
      uint64_t v2 = 0LL;
    }
  }

  uint64_t v6 = v12;
  if (v12)
  {
    do
    {
      uint64_t v7 = (void *)*v6;
      free(v6);
      uint64_t v6 = v7;
    }

    while (v7);
  }

  return v2;
}

uint64_t sub_100001EF0(char *a1)
{
  if (!pap_passwd_hook || (uint64_t result = pap_passwd_hook(&user, a1), (result & 0x80000000) != 0))
  {
    uint64_t result = (uint64_t)fopen("/etc/ppp/pap-secrets", "r");
    if (result)
    {
      uint64_t v3 = (FILE *)result;
      sub_10000365C((FILE *)result, (int)"/etc/ppp/pap-secrets");
      if (remote_name) {
        uint64_t v4 = &remote_name;
      }
      else {
        uint64_t v4 = 0LL;
      }
      int v5 = sub_1000036B8(v3, &user, v4, __source, 0LL, 0LL, (int)"/etc/ppp/pap-secrets", 0);
      fclose(v3);
      if (v5 < 0)
      {
        return 0LL;
      }

      else
      {
        if (a1) {
          strlcpy(a1, __source, 0x100uLL);
        }
        return 1LL;
      }
    }
  }

  return result;
}

void sub_100001FFC( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((phase - 7) >= 2)
  {
    if (remote_number) {
      notice("peer from calling number %q authorized", a2, a3, a4, a5, a6, a7, a8, (int)&remote_number);
    }
    if (lcp_gotoptions[68 * a1 + 6] || lcp_gotoptions[68 * a1 + 5] || lcp_gotoptions[68 * a1 + 7])
    {
      notify((uint64_t **)auth_up_notifier, 0);
      byte_10004620C = 1;
      if ((byte_100046210 & 1) == 0 && !dword_100046214)
      {
        byte_100046210 = 1;
        sub_100001554("/etc/ppp/auth-up");
      }
    }

    if (qword_100046248)
    {
      options_from_list(qword_100046248, 1);
      uint64_t v10 = (void *)qword_100046248;
      if (qword_100046248)
      {
        do
        {
          uint64_t v11 = (void *)*v10;
          free(v10);
          uint64_t v10 = v11;
        }

        while (v11);
      }

      qword_100046248 = 0LL;
    }

    start_networks(a1);
  }

BOOL unexpected_network_packet( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = phase;
  if (phase == 5 && (a2 & 0x8000) != 0 && lcp_hisoptions[68 * a1 + 7])
  {
    EapLostSuccess(a1, a2, a3, a4, a5, a6, a7, a8);
    int v8 = phase;
  }

  return v8 < 6;
}

void start_networks(int a1)
{
  uint64_t v2 = new_phase(7LL);
  uint64_t v10 = protocols;
  if (protocols)
  {
    uint64_t v11 = (__int16 **)&off_10003F898;
    do
    {
      int v12 = (unsigned __int16)*v10;
      if (v12 == 33021 || v12 == 32851)
      {
        if (*((_BYTE *)v10 + 80))
        {
          int v14 = (uint64_t (*)(void))*((void *)v10 + 6);
          if (v14) {
            uint64_t v2 = v14(0LL);
          }
        }
      }

      uint64_t v15 = *v11++;
      uint64_t v10 = v15;
    }

    while (v15);
  }

void continue_networks( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = protocols;
  if (protocols)
  {
    uint64_t v9 = (__int16 **)&off_10003F898;
    do
    {
      int v10 = (unsigned __int16)*v8;
      if ((unsigned __int16)((unsigned __int16)*v8 >> 14) <= 2u && v10 != 32851 && v10 != 33021)
      {
        if (*((_BYTE *)v8 + 80))
        {
          int v14 = (void (*)(void))*((void *)v8 + 6);
          if (v14)
          {
            v14(0LL);
            ++dword_100046218;
          }
        }
      }

      int v13 = *v9++;
      uint64_t v8 = v13;
    }

    while (v13);
  }

  if (!dword_100046218) {
    lcp_close(0, "No network protocols running", a3, a4, a5, a6, a7, a8);
  }
}

void check_protocols_ready()
{
  if (dword_100046218)
  {
    v0 = protocols;
    if (protocols)
    {
      uint64_t v1 = (__int16 **)&off_10003F898;
      while (1)
      {
        int v2 = (unsigned __int16)*v0;
        BOOL v3 = (unsigned __int16)((unsigned __int16)*v0 >> 14) > 2u || v2 == 32851;
        BOOL v4 = v3 || v2 == 33021;
        if (!v4 && *((_BYTE *)v0 + 80) && *((void *)v0 + 6))
        {
          int v6 = (*((uint64_t (**)(void))v0 + 19))(0LL);
          if (v6 != 9 && v6 != 3) {
            break;
          }
        }

        uint64_t v5 = *v1++;
        v0 = v5;
        if (!v5) {
          goto LABEL_21;
        }
      }
    }

    else
    {
LABEL_21:
      notify((uint64_t **)protocolsready_notifier, 0);
    }
  }

void auth_peer_fail( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(_DWORD *)status = 11;
}

void auth_peer_success(int a1, int a2, int a3, uint64_t a4, uint64_t a5)
{
  LODWORD(v5) = a5;
  if (acl_hook && !acl_hook(a4, a5))
  {
    lcp_close(a1, "Authorization failed", v10, v11, v12, v13, v14, v15);
    *(_DWORD *)status = 23;
    return;
  }

  v32[0] = a2;
  v32[1] = a3;
  uint64_t v33 = a4;
  int v34 = v5;
  notify_with_ptr((uint64_t **)auth_peer_success_notify, (uint64_t)v32);
  switch(a2)
  {
    case 49187:
      int v23 = 2;
      break;
    case 49703:
      int v23 = 32;
      break;
    case 49699:
      switch(a3)
      {
        case 129:
          int v23 = 2056;
          break;
        case 128:
          int v23 = 520;
          break;
        case 5:
          int v23 = 136;
          break;
        default:
          int v23 = 8;
          break;
      }

      break;
    default:
      warning("auth_peer_success: unknown protocol %x", v16, v17, v18, v19, v20, v21, v22, a2);
      return;
  }

  else {
    uint64_t v5 = v5;
  }
  __memcpy_chk(peer_authname, a4, v5, 256LL);
  peer_authname[v5] = 0;
  script_setenv("PEERNAME", peer_authname);
  auth_done[a1] |= v23;
  BOOL v31 = (dword_10004622C[a1] & ~v23) == 0;
  dword_10004622C[a1] &= ~v23;
  if (v31) {
    sub_100001FFC(a1, v24, v25, v26, v27, v28, v29, v30);
  }
}

void auth_withpeer_fail(int a1, int a2)
{
  if (byte_100046228 == 1)
  {
    xmmword_1000455E4 = 0u;
    unk_1000455F4 = 0u;
    xmmword_1000455C4 = 0u;
    unk_1000455D4 = 0u;
    xmmword_1000455A4 = 0u;
    unk_1000455B4 = 0u;
    xmmword_100045584 = 0u;
    unk_100045594 = 0u;
    xmmword_100045564 = 0u;
    unk_100045574 = 0u;
    xmmword_100045544 = 0u;
    unk_100045554 = 0u;
    xmmword_100045524 = 0u;
    unk_100045534 = 0u;
    passwd = 0u;
    unk_100045514 = 0u;
  }

  lcp_close(a1, "Failed to authenticate ourselves to peer", v3, v4, v5, v6, v7, v8);
  *(_DWORD *)status = 19;
}

void auth_withpeer_cancelled( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (byte_100046228 == 1)
  {
    xmmword_1000455E4 = 0u;
    unk_1000455F4 = 0u;
    xmmword_1000455C4 = 0u;
    unk_1000455D4 = 0u;
    xmmword_1000455A4 = 0u;
    unk_1000455B4 = 0u;
    xmmword_100045584 = 0u;
    unk_100045594 = 0u;
    xmmword_100045564 = 0u;
    unk_100045574 = 0u;
    xmmword_100045544 = 0u;
    unk_100045554 = 0u;
    xmmword_100045524 = 0u;
    unk_100045534 = 0u;
    passwd = 0u;
    unk_100045514 = 0u;
  }

  lcp_close(a1, "User cancelled authentication", a3, a4, a5, a6, a7, a8);
  *(_DWORD *)status = 5;
}

void auth_withpeer_success(int a1, int a2, int a3)
{
  switch(a2)
  {
    case 49187:
      if (byte_100046228 == 1)
      {
        xmmword_1000455E4 = 0u;
        unk_1000455F4 = 0u;
        xmmword_1000455C4 = 0u;
        unk_1000455D4 = 0u;
        xmmword_1000455A4 = 0u;
        unk_1000455B4 = 0u;
        xmmword_100045584 = 0u;
        unk_100045594 = 0u;
        xmmword_100045564 = 0u;
        unk_100045574 = 0u;
        xmmword_100045544 = 0u;
        unk_100045554 = 0u;
        xmmword_100045524 = 0u;
        unk_100045534 = 0u;
        passwd = 0u;
        unk_100045514 = 0u;
      }

      int v13 = 1;
      break;
    case 49703:
      int v13 = 16;
      break;
    case 49699:
      switch(a3)
      {
        case 129:
          int v13 = 1028;
          break;
        case 128:
          int v13 = 260;
          break;
        case 5:
          int v13 = 68;
          break;
        default:
          int v13 = 4;
          break;
      }

      break;
    default:
      warning("auth_withpeer_success: unknown protocol %x", v6, v7, v8, v9, v10, v11, v12, a2);
      int v13 = 0;
      break;
  }

  auth_done[a1] |= v13;
  int v14 = dword_10004622C[a1] & ~v13;
  dword_10004622C[a1] = v14;
  if (!v14) {
    sub_100001FFC(a1, v6, v7, v8, v9, v10, v11, v12);
  }
}

void option_change_idle()
{
  if (phase == 8)
  {
    if (idle_time_hook) {
      int v0 = idle_time_hook(0LL);
    }
    else {
      int v0 = idle_time_limit;
    }
    if (v0 >= 1) {
      timeout((int)check_idle);
    }
  }

void check_idle()
{
  if (get_idle_time(0LL, (uint64_t)&v15))
  {
    if (idle_time_hook)
    {
      uint64_t v6 = idle_time_hook(&v15);
    }

    else
    {
      if (noidlerecv)
      {
        unsigned int v7 = v15;
      }

      else if (noidlesend)
      {
        unsigned int v7 = v16;
      }

      else
      {
        unsigned int v7 = v15;
        if (v15 >= v16) {
          unsigned int v7 = v16;
        }
      }

      uint64_t v6 = idle_time_limit - v7;
    }

    if ((int)v6 <= 0)
    {
      notice("Terminating connection due to lack of activity.", v0, v6, v1, v2, v3, v4, v5, v14);
      lcp_close(0, "Link inactive", v8, v9, v10, v11, v12, v13);
      need_holdoff = 0;
      *(_DWORD *)status = 12;
    }

    else
    {
      timeout((int)check_idle);
    }
  }

void np_up()
{
  if (!dword_10004621C)
  {
    *(_DWORD *)status = 0;
    unsuccess = 0;
    new_phase(8LL);
    if (idle_time_hook) {
      int v0 = idle_time_hook(0LL);
    }
    else {
      int v0 = idle_time_limit;
    }
    if (v0 >= 1) {
      timeout((int)check_idle);
    }
    if (maxconnect >= 1) {
      timeout((int)sub_1000029D4);
    }
    if (updetach) {
      BOOL v1 = nodetach == 0;
    }
    else {
      BOOL v1 = 0;
    }
    if (v1) {
      detach();
    }
  }

  ++dword_10004621C;
  check_protocols_ready();
}

void sub_1000029D4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(_DWORD *)status = 13;
}

void np_down()
{
  if (!--dword_10004621C)
  {
    untimeout((uint64_t)check_idle, 0LL);
    untimeout((uint64_t)sub_1000029D4, 0LL);
    if (phase != 9) {
      new_phase(7LL);
    }
  }

void np_finished( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_100046218-- <= 1) {
    lcp_close(0, "No network protocols running", a3, a4, a5, a6, a7, a8);
  }
  check_protocols_ready();
}

void auth_hold()
{
}

void auth_cont()
{
  if (idle_time_hook) {
    int v0 = idle_time_hook(0LL);
  }
  else {
    int v0 = idle_time_limit;
  }
  if (v0 >= 1) {
    timeout((int)check_idle);
  }
  if (maxconnect >= 1) {
    timeout((int)sub_1000029D4);
  }
}

uint64_t auth_check_options( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (our_name) {
    BOOL v8 = usehostname == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (!v8) {
    __strlcpy_chk(&our_name, hostname, 256LL, 256LL);
  }
  if (!user) {
    __strlcpy_chk(&user, &our_name, 256LL, 256LL);
  }
  if (!(auth_required | allow_any_ip) && have_route_to() && !privileged)
  {
    auth_required = 1;
    byte_100046230 = 1;
  }

  if (byte_100043928) {
    byte_100043916 = 1;
  }
  if (!auth_required)
  {
    byte_100043928 = 0;
    *(_WORD *)&byte_100043915 = 0;
    byte_100043917 = 0;
    goto LABEL_19;
  }

  allow_any_ip = 0;
  if (!byte_100043916)
  {
    if (byte_100043915)
    {
LABEL_28:
      int v36 = 0;
      goto LABEL_29;
    }

    if (!byte_100043917)
    {
      byte_100043928 = 7;
      *(_WORD *)&byte_100043915 = 257;
      byte_100043917 = 1;
      goto LABEL_28;
    }

LABEL_19:
    int v36 = 0;
    goto LABEL_20;
  }

  int v36 = 0;
  if (!byte_100043915) {
    goto LABEL_21;
  }
LABEL_29:
  if (byte_100043916)
  {
LABEL_21:
    if (explicit_remote) {
      uint64_t v9 = &remote_name;
    }
    else {
      uint64_t v9 = 0LL;
    }
    goto LABEL_32;
  }

  LODWORD(v24) = 0;
LABEL_20:
  if (ferror(a1))
  {
    if (!*__error()) {
      *__error() = 5;
    }
    option_error("Error reading %s: %m", v35, v36, v37, v38, v39, v40, v41, a4);
    die(1);
  }

  if (!(_DWORD)v24) {
    return 0LL;
  }
LABEL_22:
  if ((int)v24 >= 1024)
  {
    option_error("warning: word in file %s too long (%.20s...)", v14, v15, v16, v17, v18, v19, v20, a4);
    LODWORD(v24) = 1023;
  }

  *(_BYTE *)(a2 + (int)v24) = 0;
  return 1LL;
}

LABEL_20:
  if (byte_100043917) {
    goto LABEL_21;
  }
LABEL_32:
  if (auth_required && !qword_100046220)
  {
    if (byte_100046230 == 1)
    {
      option_error( "By default the remote system is required to authenticate itself",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  (int)v33);
      uint64_t v18 = "(because this system has a default route to the internet)";
    }

    else if (explicit_remote)
    {
      uint64_t v33 = &remote_name;
      uint64_t v18 = "The remote system (%s) is required to authenticate itself";
    }

    else
    {
      uint64_t v18 = "The remote system is required to authenticate itself";
    }

    option_error(v18, a2, a3, a4, a5, a6, a7, a8, (int)v33);
    option_error( "but I couldn't find any suitable secret (password) for it to use to do so.",  v19,  v20,  v21,  v22,  v23,  v24,  v25,  v34);
    if (v36) {
      option_error( "(None of the available passwords would let it use an IP address.)",  v26,  v27,  v28,  v29,  v30,  v31,  v32,  v35);
    }
    exit(1);
  }

      if (--v10 <= 1) {
        return v9;
      }
    }
  }

  return 0LL;
}

  if (v44)
  {
    if (v8[1] == 6)
    {
      uint64_t v25 = (a3 - 6);
      if ((int)a3 >= 6 && *v8 == 129)
      {
        uint64_t v26 = v14;
        uint64_t v14 = v16;
        uint64_t v27 = htonl(bswap32(*(_DWORD *)(v8 + 2)));
        uint64_t v10 = &ipcp_gotoptions;
        if (v27 != *((_DWORD *)&ipcp_gotoptions + 13 * v9 + 9)) {
          goto LABEL_54;
        }
        uint64_t v16 = v14;
        LOBYTE(v14) = v26;
        LOBYTE(v44) = 0;
        v8 += 6;
        a3 = v25;
      }
    }
  }

  else
  {
    LOBYTE(v44) = 0;
  }

  if (v43)
  {
    if (v8[1] == 6)
    {
      uint64_t v31 = (a3 - 6);
      if ((int)a3 >= 6 && *v8 == 131)
      {
        uint64_t v32 = v16;
        uint64_t v33 = htonl(bswap32(*(_DWORD *)(v8 + 2)));
        uint64_t v10 = &ipcp_gotoptions;
        if (v33 != *((_DWORD *)&ipcp_gotoptions + 13 * v9 + 10)) {
          goto LABEL_54;
        }
        uint64_t v16 = v32;
        LOBYTE(v43) = 0;
        v8 += 6;
        a3 = v31;
      }
    }
  }

  else
  {
    LOBYTE(v43) = 0;
  }

  if (v15)
  {
    if (v8[1] == 6)
    {
      int v34 = (a3 - 6);
      if ((int)a3 >= 6 && *v8 == 130)
      {
        uint64_t v41 = v9;
        int v35 = v13;
        int v36 = v16;
        uint64_t v37 = htonl(bswap32(*(_DWORD *)(v8 + 2)));
        uint64_t v16 = v36;
        uint64_t v13 = v35;
        uint64_t v9 = v41;
        if (v37 != *((_DWORD *)&ipcp_gotoptions + 13 * v41 + 11)) {
          goto LABEL_54;
        }
        uint64_t v10 = &ipcp_gotoptions;
        LOBYTE(v15) = 0;
        v8 += 6;
        a3 = v34;
      }
    }
  }

  if (v16)
  {
    if (v8[1] == 6)
    {
      uint64_t v38 = (a3 - 6);
      if ((int)a3 >= 6)
      {
        LOBYTE(v16) = 0;
        a3 = v38;
      }
    }
  }

  if (!(_DWORD)a3)
  {
    if (a1[2] == 9) {
      return 1LL;
    }
    void *v11 = v12;
    v11[1] = v13;
    v11[5] = v14;
    v11[9] = v44;
    v11[10] = v43;
    v11[11] = v15;
    uint64_t result = 1LL;
    v11[12] = v16;
    return result;
  }

  if (lcp_gotoptions[68 * v9 + 11])
  {
    *(_DWORD *)uint64_t v20 = 633341956;
    uint64_t v26 = (char *)&lcp_gotoptions[68 * v9];
    *(_BYTE *)(v20 + 4) = v26[43];
    *(_BYTE *)(v20 + 5) = *((_WORD *)v26 + 21);
    *(_BYTE *)(v20 + 6) = BYTE1(*((_DWORD *)v26 + 10));
    *(_BYTE *)(v20 + 7) = *((_DWORD *)v26 + 10);
    v20 += 8LL;
  }

  if (lcp_gotoptions[68 * v9 + 12])
  {
    *(_WORD *)uint64_t v20 = 781;
    *(_BYTE *)(v20 + 2) = 6;
    v20 += 3LL;
  }

  if (lcp_gotoptions[68 * v9 + 8])
  {
    *(_WORD *)uint64_t v20 = 1541;
    uint64_t v27 = (char *)&lcp_gotoptions[68 * v9];
    *(_BYTE *)(v20 + 2) = v27[35];
    *(_BYTE *)(v20 + 3) = *((_WORD *)v27 + 17);
    *(_BYTE *)(v20 + 4) = BYTE1(*((_DWORD *)v27 + 8));
    *(_BYTE *)(v20 + 5) = *((_DWORD *)v27 + 8);
    v20 += 6LL;
  }

  if (lcp_gotoptions[68 * v9 + 9])
  {
    *(_WORD *)uint64_t v20 = 519;
    v20 += 2LL;
  }

  if (lcp_gotoptions[68 * v9 + 10])
  {
    *(_WORD *)uint64_t v20 = 520;
    v20 += 2LL;
  }

  if (lcp_gotoptions[68 * v9 + 13])
  {
    *(_WORD *)uint64_t v20 = 1041;
    uint64_t v28 = (char *)&lcp_gotoptions[68 * v9];
    *(_BYTE *)(v20 + 2) = BYTE1(*((_DWORD *)v28 + 5));
    *(_BYTE *)(v20 + 3) = *((_DWORD *)v28 + 5);
    v20 += 4LL;
  }

  if (lcp_gotoptions[68 * v9 + 14])
  {
    *(_WORD *)uint64_t v20 = 530;
    v20 += 2LL;
  }

  if (lcp_gotoptions[68 * v9 + 15])
  {
    *(_BYTE *)uint64_t v20 = 19;
    uint64_t v29 = (char *)&lcp_gotoptions[68 * v9];
    uint64_t v31 = v29[45];
    uint64_t v30 = v29 + 45;
    *(_BYTE *)(v20 + 1) = v31 + 3;
    uint64_t v32 = v20 + 3;
    *(_BYTE *)(v20 + 2) = *(v30 - 1);
    if (*v30)
    {
      uint64_t v33 = 0LL;
      int v34 = (char *)&lcp_gotoptions[68 * v9 + 46];
      do
      {
        *(_BYTE *)(v32 + v33) = v34[v33];
        ++v33;
      }

      while (v33 < *v30);
      uint64_t v20 = v32 + v33;
    }

    else
    {
      v20 += 3LL;
    }
  }

  if (v20 - a2 != *a3) {
    error("Bug in lcp_addci: wrong length", a2, (uint64_t)a3, a4, a5, a6, a7, a8, a9);
  }
}

LABEL_34:
  uint64_t result = auth_number();
  if (!(_DWORD)result)
  {
    warning("calling number %q is not authorized", v11, v12, v13, v14, v15, v16, v17, (int)&remote_number);
    exit(24);
  }

  return result;
}

    uint64_t v18 = a1 + 4;
LABEL_35:
    uint64_t v13 = v18;
    if (v7 < 1) {
      return ((_DWORD)v13 - (_DWORD)a1);
    }
    goto LABEL_36;
  }

  if (v6 >= 5)
  {
    if (*v13 - 32 > 0x5E)
    {
LABEL_36:
      uint64_t v23 = v7 + 1;
      do
      {
        uint64_t v24 = *v13++;
        ((void (*)(uint64_t, const char *, ...))a3)(a4, " %.2x", v24);
        --v23;
      }

      while (v23 > 1);
      return ((_DWORD)v13 - (_DWORD)a1);
    }

    a3(a4, " ");
    print_string((char *)a1 + 4, v6 - 4, a3, a4);
    LODWORD(lcp_close(0, "Connect time expired", v8, v9, v10, v11, v12, v13) = (_DWORD)v13 + v7;
  }

  return ((_DWORD)v13 - (_DWORD)a1);
}

FILE *sub_100002DE8(_DWORD *a1)
{
  if (pap_check_hook)
  {
    uint64_t result = (FILE *)pap_check_hook();
  }

  uint64_t result = fopen("/etc/ppp/pap-secrets", "r");
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  if (explicit_remote) {
    uint64_t v4 = &remote_name;
  }
  else {
    uint64_t v4 = 0LL;
  }
  int v5 = sub_1000036B8(result, v4, &our_name, 0LL, &v10, 0LL, (int)"/etc/ppp/pap-secrets", 0);
  fclose(v3);
  uint64_t v6 = v10;
  if ((v5 & 0x80000000) == 0)
  {
    if (v10)
    {
      unsigned int v7 = (void **)v10;
      while (1)
      {
        int v8 = *(unsigned __int8 *)v7[1];
        if (v8 != 33) {
          break;
        }
        unsigned int v7 = (void **)*v7;
        if (!v7) {
          goto LABEL_14;
        }
      }

      if (v8 != 45) {
        goto LABEL_17;
      }
    }

LABEL_14:
    if (a1) {
      *a1 = 1;
    }
  }

  int v5 = -1;
LABEL_17:
  if (v6)
  {
    do
    {
      uint64_t v9 = (void *)*v6;
      free(v6);
      uint64_t v6 = v9;
    }

    while (v9);
  }

  return (FILE *)(v5 >= 0);
}

    exit(2);
  }

      BOOL v1 = (uint64_t *)*v1;
    }

    while (v1);
  }

      BOOL v1 = (uint64_t *)*v1;
    }

    while (v1);
  }

FILE *sub_100002EEC(const char *a1, const char *a2, int a3, _DWORD *a4)
{
  if (!chap_check_hook || (uint64_t result = (FILE *)chap_check_hook(), (result & 0x80000000) != 0))
  {
    uint64_t result = fopen("/etc/ppp/chap-secrets", "r");
    if (result)
    {
      uint64_t v9 = result;
      if (a1 && !*a1)
      {
        a1 = 0LL;
      }

      else if (a2 && !*a2)
      {
        a2 = 0LL;
      }

      int v10 = sub_1000036B8(result, a1, a2, 0LL, &v15, 0LL, (int)"/etc/ppp/chap-secrets", 0);
      fclose(v9);
      uint64_t v11 = v15;
      if (a3 && (v10 & 0x80000000) == 0)
      {
        if (!v15) {
          goto LABEL_19;
        }
        uint64_t v12 = (void **)v15;
        while (1)
        {
          int v13 = *(unsigned __int8 *)v12[1];
          if (v13 != 33) {
            break;
          }
          uint64_t v12 = (void **)*v12;
          if (!v12) {
            goto LABEL_19;
          }
        }

        if (v13 == 45)
        {
LABEL_19:
          if (a4) {
            *a4 = 1;
          }
          int v10 = -1;
        }
      }

      if (v11)
      {
        do
        {
          uint64_t v14 = (void *)*v11;
          free(v11);
          uint64_t v11 = v14;
        }

        while (v14);
      }

      return (FILE *)(v10 >= 0);
    }
  }

  return result;
}

uint64_t auth_number()
{
  uint64_t v0 = qword_100046240;
  if (qword_100046240)
  {
    while (1)
    {
      int v1 = strlen(*(const char **)(v0 + 8));
      uint64_t v0 = *(void *)v0;
      if (!v0) {
        return 0LL;
      }
    }
  }

  return 1LL;
}

uint64_t auth_reset(uint64_t result)
{
  uint64_t v1 = (int)result;
  if (refuse_pap)
  {
    BOOL v2 = 0;
  }

  else if ((_BYTE)passwd)
  {
    BOOL v2 = 1;
  }

  else
  {
    uint64_t result = sub_100001EF0(0LL);
    BOOL v2 = (_DWORD)result != 0;
  }

  *((_BYTE *)&lcp_allowoptions + 68 * (int)v1 + 5) = v2;
  if (refuse_chap) {
    BOOL v3 = refuse_mschap == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3 || refuse_mschap_v2 == 0)
  {
    if ((_BYTE)passwd)
    {
      BOOL v5 = 1;
    }

    else
    {
      if (explicit_remote) {
        uint64_t v6 = &remote_name;
      }
      else {
        uint64_t v6 = 0LL;
      }
      uint64_t result = (uint64_t)sub_100002EEC(&user, v6, 0, 0LL);
      BOOL v5 = (_DWORD)result != 0;
    }
  }

  else
  {
    BOOL v5 = 0;
  }

  unsigned int v7 = (char *)&lcp_allowoptions + 68 * v1;
  v7[6] = v5;
  v7[7] = refuse_eap == 0;
  int v8 = (char *)&lcp_gotoptions + 68 * v1;
  int v10 = v8[5];
  uint64_t v9 = v8 + 5;
  if (v10) {
    BOOL v11 = uselogin == 0;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11)
  {
    uint64_t result = (uint64_t)sub_100002DE8(0LL);
    if (!(_DWORD)result) {
      *uint64_t v9 = 0;
    }
  }

  uint64_t v12 = (char *)&lcp_gotoptions + 68 * (int)v1;
  int v14 = v12[6];
  int v13 = v12 + 6;
  if (v14)
  {
    if (explicit_remote) {
      uint64_t v15 = &remote_name;
    }
    else {
      uint64_t v15 = 0LL;
    }
    uint64_t result = (uint64_t)sub_100002EEC(v15, &our_name, 1, 0LL);
    if (!(_DWORD)result) {
      *int v13 = 0;
    }
  }

  return result;
}

uint64_t check_passwd(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  v66 = 0LL;
  v67 = 0LL;
  slprintf((int)__s1, 256, "%.*v");
  slprintf((int)v69, 256, "%.*v");
  *a6 = &unk_10002EB6A;
  if (pap_auth_hook)
  {
    int v8 = pap_auth_hook(v69, __s1, a6, &v67, &v66);
    if ((v8 & 0x80000000) == 0)
    {
      int v9 = v8;
      if (v8) {
        sub_1000019B4(a1, v67, (uint64_t)v66);
      }
      __int128 v85 = 0u;
      __int128 v84 = 0u;
      __int128 v83 = 0u;
      __int128 v82 = 0u;
      __int128 v81 = 0u;
      __int128 v80 = 0u;
      __int128 v79 = 0u;
      __int128 v78 = 0u;
      __int128 v77 = 0u;
      __int128 v76 = 0u;
      __int128 v75 = 0u;
      __int128 v74 = 0u;
      __int128 v73 = 0u;
      __int128 v72 = 0u;
      __int128 v71 = 0u;
      *(_OWORD *)__s1 = 0u;
      int v10 = v67;
      if (v67)
      {
        do
        {
          BOOL v11 = (void *)*v10;
          free(v10);
          int v10 = v11;
        }

        while (v11);
      }

      uint64_t v12 = v66;
      if (v66)
      {
        do
        {
          int v13 = (void *)*v12;
          free(v12);
          uint64_t v12 = v13;
        }

        while (v13);
      }

      if (v9) {
        return 2LL;
      }
      else {
        return 3LL;
      }
    }
  }

  v66 = 0LL;
  v67 = 0LL;
  uint64_t v15 = fopen("/etc/ppp/pap-secrets", "r");
  if (!v15)
  {
    error("Can't open PAP password file %s: %m", v16, v17, v18, v19, v20, v21, v22, (int)"/etc/ppp/pap-secrets");
    goto LABEL_36;
  }

  uint64_t v23 = v15;
  sub_10000365C(v15, (int)"/etc/ppp/pap-secrets");
  if ((sub_1000036B8(v23, v69, &our_name, __s2, &v67, &v66, (int)"/etc/ppp/pap-secrets", 0) & 0x80000000) != 0)
  {
    warning("no PAP secret found for %s", v24, v25, v26, v27, v28, v29, v30, (int)v69);
LABEL_34:
    fclose(v23);
    goto LABEL_36;
  }

  BOOL v32 = *(_DWORD *)__s2 != 1735355456 || *(_DWORD *)&__s2[3] != 7235943;
  if (uselogin || !v32)
  {
    uint64_t v41 = getpwnam(v69);
    endpwent();
    if (!v41 || (pw_passwd = v41->pw_passwd) == 0LL || strlen(v41->pw_passwd) < 2)
    {
      int v33 = 1;
      goto LABEL_29;
    }

    v57 = crypt(__s1, pw_passwd);
    int v33 = 1;
    if (strcmp(v57, v41->pw_passwd)) {
      goto LABEL_29;
    }
    else {
      uint64_t v58 = (const char *)&unk_100044CED;
    }
    bzero(&v86, 0x280uLL);
    v86.ut_type = -32762;
    strncpy(v86.ut_line, v58, 0x20uLL);
    pututxline(&v86);
    info("user %s logged in", v59, v60, v61, v62, v63, v64, v65, (int)v69);
    byte_100046208 = 1;
  }

  int v33 = 0;
LABEL_29:
  if (__s2[0] && v32 && (cryptpap || strcmp(__s1, __s2)))
  {
    uint64_t v43 = crypt(__s1, __s2);
    if (strcmp(v43, __s2)) {
      goto LABEL_34;
    }
  }

  fclose(v23);
  if (!v33)
  {
    dword_100046234 = 0;
    if (!*(_BYTE *)*a6) {
      *a6 = "Login ok";
    }
    sub_1000019B4(a1, v67, (uint64_t)v66);
    uint64_t v14 = 2LL;
    goto LABEL_45;
  }

LABEL_36:
  if (!*(_BYTE *)*a6) {
    *a6 = "Login incorrect";
  }
  int v44 = dword_100046234;
  int v45 = ++dword_100046234;
  if (v44 >= 10)
  {
    warning("%d LOGIN FAILURES ON %s, %s", v34, v35, v36, v37, v38, v39, v40, v45);
    lcp_close((int)a1, "login failed", v46, v47, v48, v49, v50, v51);
    int v45 = dword_100046234;
  }

  if (v45 >= 4) {
    sleep(5 * v45 - 15);
  }
  v52 = v66;
  if (v66)
  {
    do
    {
      int v53 = (void *)*v52;
      free(v52);
      v52 = v53;
    }

    while (v53);
  }

  uint64_t v14 = 3LL;
LABEL_45:
  BOOL v54 = v67;
  if (v67)
  {
    do
    {
      v55 = (void *)*v54;
      free(v54);
      BOOL v54 = v55;
    }

    while (v55);
  }

  return v14;
}

        *((_DWORD *)a1 + 2) = 5;
        notify((uint64_t **)acspdhcpready_notifier, 0);
      }

      else
      {
        if (v15 != 3)
        {
          if (v15 != 2) {
            return;
          }
          if ((ntohs(*(unsigned __int16 *)(v14 + 4)) & 2) == 0)
          {
            uint64_t v16 = "ACSP plugin: received first packet with no start flag\n";
            goto LABEL_31;
          }

          *((_DWORD *)a1 + 2) = 3;
        }

        uint64_t v18 = *(unsigned __int16 *)(a2 + 6);
        uint64_t v19 = *a1;
        if (v19 != 2)
        {
          if (v19 != 1) {
            return;
          }
          if ((v18 & 3) != 0)
          {
            uint64_t v16 = "ACSP plugin: received packet with invalid len\n";
            goto LABEL_31;
          }

          uint64_t v43 = *(_BYTE *)(v14 + 1);
          if (v18 >= 0xD)
          {
            uint64_t v37 = v14 + 8;
            uint64_t v38 = v18 + 4;
            while (1)
            {
              uint64_t v39 = malloc(0x20uLL);
              if (!v39) {
                break;
              }
              uint64_t v40 = v39;
              v39[2] = 0LL;
              v39[3] = 0LL;
              uint64_t v41 = *(_DWORD *)(v37 + 4);
              *((_DWORD *)v39 + 2) = v41 & *(_DWORD *)v37;
              *((_DWORD *)v39 + 3) = v41;
              *((_WORD *)v39 + 10) = ntohs(*(unsigned __int16 *)(v37 + 8));
              *uint64_t v40 = *((void *)a1 + 6);
              *((void *)a1 + 6) = v40;
              v38 -= 12;
              v37 += 12LL;
              if (v38 <= 16) {
                goto LABEL_55;
              }
            }

void sub_10000365C(FILE *a1, int a2)
{
  int v3 = fileno(a1);
  if (fstat(v3, &v12) < 0)
  {
    BOOL v11 = "cannot stat secret file %s: %m";
  }

  else
  {
    if ((v12.st_mode & 0x3F) == 0) {
      return;
    }
    BOOL v11 = "Warning - secret file %s has world and/or group access";
  }

  warning(v11, v4, v5, v6, v7, v8, v9, v10, a2);
}

uint64_t sub_1000036B8( FILE *a1, const char *a2, const char *a3, char *a4, void **a5, void *a6, int a7, int a8)
{
  uint64_t v10 = a6;
  if (a5) {
    *a5 = 0LL;
  }
  if (a6) {
    *a6 = 0LL;
  }
  v67 = 0LL;
  __dst = a4;
  uint64_t v63 = 0LL;
  int v16 = 1;
  int v69 = 1;
  uint64_t v17 = 0xFFFFFFFFLL;
  do
  {
    uint64_t v18 = v17;
    do
    {
      while (1)
      {
        do
        {
          while (1)
          {
            if (!v16)
            {
              if (!v69)
              {
LABEL_61:
                uint64_t v17 = v18;
                goto LABEL_62;
              }
            }

            if (!a2) {
              break;
            }
            int v19 = strcmp(&__s1, a2);
            int v20 = __s1;
            int v21 = v73[0];
            if (!v19) {
              goto LABEL_18;
            }
            if (__s1 == 42 && !v73[0])
            {
              int v20 = 42;
              goto LABEL_18;
            }

            int v16 = 0;
            int v69 = 0;
          }

          int v20 = __s1;
          int v21 = v73[0];
LABEL_18:
          if (v21) {
            BOOL v22 = 0;
          }
          else {
            BOOL v22 = v20 == 42;
          }
          if (v22) {
            uint64_t v17 = 0LL;
          }
          else {
            uint64_t v17 = 2LL;
          }
          int v16 = v69;
        }

        while (v69);
        if (__s1 == 42 && !v73[0]) {
          break;
        }
        if (!a3 || !strcmp(&__s1, a3))
        {
          uint64_t v17 = v17 | 1;
          break;
        }

LABEL_46:
        int v16 = v69;
      }

      int v16 = v69;
    }

    while (v69);
    if (a8)
    {
      uint64_t v23 = strchr(&__s1, 58);
      if (!v23 || !strchr(v23 + 1, 58)) {
        goto LABEL_46;
      }
    }

    int v64 = a8;
    if (!__dst) {
      goto LABEL_49;
    }
    if (__s1 != 64 || v73[0] != 47) {
      goto LABEL_48;
    }
    uint64_t v24 = v10;
    __strlcpy_chk(__filename, v73, 1024LL, 1024LL);
    uint64_t v25 = fopen(__filename, "r");
    if (!v25)
    {
      warning("can't open indirect secret file %s", v26, v27, v28, v29, v30, v31, v32, (int)__filename);
      goto LABEL_45;
    }

    int v33 = v25;
    sub_10000365C(v25, (int)__filename);
    if (!getword(v33, (uint64_t)&__s1, &v68, (int)__filename))
    {
      warning("no secret in indirect secret file %s", v34, v35, v36, v37, v38, v39, v40, (int)__filename);
      fclose(v33);
LABEL_45:
      uint64_t v10 = v24;
      a8 = v64;
      goto LABEL_46;
    }

    fclose(v33);
    uint64_t v10 = v24;
LABEL_48:
    __strlcpy_chk(__source, &__s1, 1024LL, 1024LL);
LABEL_49:
    uint64_t v62 = v10;
    uint64_t v41 = (void **)&v66;
    if (getword(a1, (uint64_t)&__s1, &v69, a7) && !v69)
    {
      uint64_t v42 = (void **)&v66;
      do
      {
        size_t v43 = (int)(strlen(&__s1) + 1);
        int v44 = (char *)malloc(v43 + 16);
        if (!v44) {
          novm((int)"authorized addresses", v45, v46, v47, v48, v49, v50, v51);
        }
        uint64_t v41 = (void **)v44;
        v52 = v44 + 16;
        v41[1] = v52;
        strlcpy(v52, &__s1, v43);
        *uint64_t v42 = v41;
        uint64_t v42 = v41;
      }

      while (!v69);
    }

    *uint64_t v41 = 0LL;
    int v53 = v63;
    if (v63)
    {
      do
      {
        BOOL v54 = (void *)*v53;
        free(v53);
        int v53 = v54;
      }

      while (v54);
    }

    uint64_t v63 = v66;
    v67 = v66;
    uint64_t v10 = v62;
    a8 = v64;
    if (__dst) {
      strlcpy(__dst, __source, 0x400uLL);
    }
    int v16 = v69;
  }

  while (v69);
LABEL_62:
  v55 = &v67;
  do
  {
    v56 = v55;
    v55 = (void **)*v55;
    if (!v55)
    {
      if (!v10) {
        goto LABEL_73;
      }
      v57 = 0LL;
      goto LABEL_72;
    }
  }

  while (strcmp((const char *)v55[1], "--"));
  v57 = *v55;
  free(v55);
  char *v56 = 0LL;
  if (v10)
  {
LABEL_72:
    *uint64_t v10 = v57;
    goto LABEL_73;
  }

  if (v57)
  {
    do
    {
      uint64_t v58 = (void *)*v57;
      free(v57);
      v57 = v58;
    }

    while (v58);
  }

    uint64_t v9 = 0;
    goto LABEL_47;
  }

  if (v4[6]) {
    goto LABEL_46;
  }
  if (v4[5]) {
    BOOL v22 = (int)a3 < 4;
  }
  else {
    BOOL v22 = 1;
  }
  if (!v22 && a2[1] == 4 && *a2 == 3)
  {
    uint64_t v7 = bswap32(*((unsigned __int16 *)a2 + 1));
    uint64_t v8 = 49187LL;
    if (WORD1(v7) != 49187) {
      goto LABEL_110;
    }
    uint64_t v9 = 0;
    uint64_t v8 = 0LL;
    uint64_t v7 = 0LL;
LABEL_39:
    a2 += 4;
    a3 = (a3 - 4);
    goto LABEL_47;
  }

  uint64_t v9 = 0;
  uint64_t v8 = 0LL;
LABEL_47:
  if (v4[11]) {
    uint64_t v24 = (int)a3 < 8;
  }
  else {
    uint64_t v24 = 1;
  }
  if (!v24 && a2[1] == 8 && *a2 == 4)
  {
    if (bswap32(*((unsigned __int16 *)a2 + 1)) >> 16 != 49189
      || bswap32(*((_DWORD *)a2 + 1)) != *(_DWORD *)&lcp_gotoptions[68 * (int)v3 + 40])
    {
      goto LABEL_110;
    }

    int v13 = 0;
    a2 += 8;
    a3 = (a3 - 8);
  }

  if (v4[12]) {
    uint64_t v25 = (int)a3 < 3;
  }
  else {
    uint64_t v25 = 1;
  }
  if (!v25 && a2[1] == 3 && *a2 == 13)
  {
    if (a2[2] != 6) {
      goto LABEL_110;
    }
    uint64_t v14 = 0;
    a2 += 3;
    a3 = (a3 - 3);
  }

  if (v4[8]) {
    uint64_t v26 = (int)a3 < 6;
  }
  else {
    uint64_t v26 = 1;
  }
  if (!v26 && a2[1] == 6 && *a2 == 5)
  {
    uint64_t v10 = 0;
    a2 += 6;
    a3 = (a3 - 6);
  }

  if (v4[9]) {
    uint64_t v27 = (int)a3 < 2;
  }
  else {
    uint64_t v27 = 1;
  }
  if (!v27 && a2[1] == 2 && *a2 == 7)
  {
    BOOL v11 = 0;
    a3 = (a3 - 2);
    a2 += 2;
  }

  if (v4[10]) {
    uint64_t v28 = (int)a3 < 2;
  }
  else {
    uint64_t v28 = 1;
  }
  if (!v28 && a2[1] == 2 && *a2 == 8)
  {
    stat v12 = 0;
    a3 = (a3 - 2);
    a2 += 2;
  }

  if (v4[13]) {
    uint64_t v29 = (int)a3 < 4;
  }
  else {
    uint64_t v29 = 1;
  }
  if (!v29 && a2[1] == 4 && *a2 == 17)
  {
    uint64_t v15 = 0;
    a2 += 4;
    a3 = (a3 - 4);
  }

  if (v4[14] && (int)a3 >= 2 && a2[1] == 2 && *a2 == 18)
  {
    int v16 = 0;
    a2 += 2;
    a3 = (a3 - 2);
  }

  if (v4[15])
  {
    uint64_t v30 = &lcp_gotoptions[68 * (int)v3];
    uint64_t v31 = v30[45];
    uint64_t v32 = (a3 - (v31 + 3));
    if ((int)a3 >= (int)v31 + 3 && *a2 == 19 && (_DWORD)v31 + 3 == a2[1])
    {
      uint64_t v17 = a2[2];
      a3 = v30[44];
      if ((_DWORD)v17 != (_DWORD)a3) {
        goto LABEL_110;
      }
      if (v30[45])
      {
        a2 += 3;
        a3 = (uint64_t)&lcp_gotoptions[68 * (int)v3 + 46];
        do
        {
          uint64_t v17 = *a2;
          int v33 = *(unsigned __int8 *)a3++;
          int v3 = v33;
          if ((_DWORD)v17 != v33) {
            goto LABEL_110;
          }
          ++a2;
        }

        while (--v31);
      }

      uint64_t v17 = 0LL;
      a3 = v32;
    }
  }

  if (!(_DWORD)a3)
  {
    if (a1[2] == 9) {
      return 1LL;
    }
    v4[3] = v5;
    v4[4] = v6;
    v4[5] = v7;
    v4[6] = v8;
    v4[7] = v9;
    v4[8] = v10;
    v4[9] = v11;
    v4[10] = v12;
    v4[11] = v13;
    v4[12] = v14;
    v4[13] = v15;
    v4[14] = v16;
    uint64_t result = 1LL;
    v4[15] = v17;
    return result;
  }

            BOOL v22 = 0LL;
            goto LABEL_47;
          }
        }

        uint64_t v26 = CFArrayCreateMutable(0LL, 1LL, &kCFTypeArrayCallBacks);
        goto LABEL_16;
      }

LABEL_73:
  uint64_t v59 = v67;
  if (a5)
  {
    *a5 = v67;
  }

  else if (v67)
  {
    do
    {
      uint64_t v60 = (void *)*v59;
      free(v59);
      uint64_t v59 = v60;
    }

    while (v60);
  }

  return v17;
}

uint64_t get_secret(void *a1, const char *a2, const char *a3, void *a4, int *a5, int a6)
{
  if (a6 || !(_BYTE)passwd)
  {
    if (a6 || !chap_passwd_hook)
    {
      size_t v43 = 0LL;
      __s[0] = 0;
      int v19 = fopen("/etc/ppp/chap-secrets", "r");
      if (v19)
      {
        uint64_t v27 = v19;
        sub_10000365C(v19, (int)"/etc/ppp/chap-secrets");
        int v28 = sub_1000036B8(v27, a2, a3, __s, &v43, &v42, (int)"/etc/ppp/chap-secrets", 0);
        fclose(v27);
        if ((v28 & 0x80000000) == 0)
        {
          if (a6)
          {
            sub_1000019B4(a1, v43, (uint64_t)v42);
          }

          else
          {
            uint64_t v30 = v42;
            if (v42)
            {
              do
              {
                uint64_t v31 = (void *)*v30;
                free(v30);
                uint64_t v30 = v31;
              }

              while (v31);
            }
          }

          uint64_t v32 = v43;
          if (v43)
          {
            do
            {
              int v33 = (void *)*v32;
              free(v32);
              uint64_t v32 = v33;
            }

            while (v33);
          }

          goto LABEL_18;
        }
      }

      else
      {
        error("Can't open chap secret file %s: %m", v20, v21, v22, v23, v24, v25, v26, (int)"/etc/ppp/chap-secrets");
      }
    }

    else
    {
      if ((chap_passwd_hook(a2, __s) & 0x80000000) == 0) {
        goto LABEL_18;
      }
      error("Unable to obtain CHAP password for %s on %s from plugin", v12, v13, v14, v15, v16, v17, v18, (int)a2);
    }

    return 0LL;
  }

  __strlcpy_chk(__s, &passwd, 1024LL, 1024LL);
LABEL_18:
  int v41 = strlen(__s);
  if (v41 >= 257)
  {
    error("Secret for %s on %s is too long", v34, v35, v36, v37, v38, v39, v40, (int)a2);
    int v41 = 256;
  }

  memcpy(a4, __s, v41);
  *a5 = v41;
  return 1LL;
}

uint64_t get_srp_secret(void *a1, const char *a2, const char *a3, char *__dst, int a5)
{
  if (a5 || !(_BYTE)passwd)
  {
    uint64_t v26 = 0LL;
    uint64_t v10 = fopen("/etc/ppp/srp-secrets", "r");
    if (v10)
    {
      uint64_t v18 = v10;
      sub_10000365C(v10, (int)"/etc/ppp/srp-secrets");
      char *__dst = 0;
      int v19 = sub_1000036B8(v18, a2, a3, __dst, &v26, &v25, (int)"/etc/ppp/srp-secrets", a5);
      fclose(v18);
      if ((v19 & 0x80000000) == 0)
      {
        if (a5)
        {
          sub_1000019B4(a1, v26, (uint64_t)v25);
        }

        else
        {
          uint64_t v21 = v25;
          if (v25)
          {
            do
            {
              uint64_t v22 = (void *)*v21;
              free(v21);
              uint64_t v21 = v22;
            }

            while (v22);
          }
        }

        uint64_t v23 = v26;
        if (v26)
        {
          do
          {
            uint64_t v24 = (void *)*v23;
            free(v23);
            uint64_t v23 = v24;
          }

          while (v24);
        }

        return 1LL;
      }
    }

    else
    {
      error("Can't open srp secret file %s: %m", v11, v12, v13, v14, v15, v16, v17, (int)"/etc/ppp/srp-secrets");
    }

    return 0LL;
  }

  strlcpy(__dst, (const char *)&passwd, 0x400uLL);
  return 1LL;
}

uint64_t auth_ip_addr(int a1, uint64_t a2)
{
  unsigned int v4 = ntohl(a2);
  if (v4 >> 28 == 15 || v4 == 2130706433 || (v4 & 0xF0000000) == -536870912) {
    return 0LL;
  }
  if (!allowed_address_hook || (uint64_t result = allowed_address_hook(a2), (result & 0x80000000) != 0))
  {
    if ((auth_done[a1] & 0x20) == 0 || (uint64_t result = EAPAllowedAddr(), (result & 0x80000000) != 0))
    {
      uint64_t v8 = qword_100046238[a1];
      if (!v8) {
        goto LABEL_18;
      }
      uint64_t v9 = (_DWORD *)(v8 + 8);
      do
      {
        int v10 = *(v9 - 1);
        int v11 = *v9 & a2;
        v9 += 3;
      }

      while (v11 != v10);
      uint64_t result = *(v9 - 5);
      if ((result & 0x80000000) != 0)
      {
LABEL_18:
        if (!auth_required)
        {
          if (allow_any_ip) {
            BOOL v12 = 0;
          }
          else {
            BOOL v12 = privileged == 0;
          }
          return !v12 || have_route_to() == 0;
        }

        return 0LL;
      }
    }
  }

  return result;
}

uint64_t bad_ip_adrs()
{
  unsigned int v0 = ntohl();
  BOOL v1 = v0 == 2130706433;
  if (v0 >> 28 == 14) {
    BOOL v1 = 1;
  }
  return v0 >> 28 == 15 || v1;
}

uint64_t save_new_password()
{
  return 0LL;
}

void sub_100003F6C()
{
  dword_100046214 = 0;
  if (byte_100046210 == 1)
  {
    if ((byte_10004620C & 1) != 0) {
      return;
    }
    unsigned int v0 = "/etc/ppp/auth-down";
  }

  else
  {
    if (!byte_10004620C) {
      return;
    }
    unsigned int v0 = "/etc/ppp/auth-up";
  }

  byte_100046210 ^= 1u;
  sub_100001554(v0);
}

void sub_100003FB8(int a1)
{
  BOOL v2 = (char *)&ccp_fsm + 80 * a1;
  *(_DWORD *)BOOL v2 = a1;
  *((_DWORD *)v2 + 1) = 33021;
  *((void *)v2 + 7) = off_10003DE50;
  fsm_init((uint64_t)v2);
  uint64_t v3 = 7LL * a1;
  unsigned int v4 = &ccp_wantoptions[v3];
  *(void *)(v4 + 3) = 0LL;
  *(void *)unsigned int v4 = 0LL;
  uint64_t v5 = (void *)((char *)&ccp_gotoptions + v3 * 2);
  *uint64_t v5 = 0LL;
  *(void *)((char *)v5 + 6) = 0LL;
  uint64_t v6 = &ccp_allowoptions[v3];
  *(void *)(v6 + 3) = 0LL;
  *(void *)uint64_t v6 = 0LL;
  uint64_t v7 = (void *)((char *)&ccp_hisoptions + v3 * 2);
  *uint64_t v7 = 0LL;
  *(void *)((char *)v7 + 6) = 0LL;
  word_10004364C = 257;
  word_100043668 = 257;
  ccp_wantoptions[0] = 257;
  dword_100043650 = 983055;
  ccp_allowoptions[0] = 257;
  dword_10004366C = 983055;
  byte_100043666 = 1;
}

void sub_10000407C( uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v10 = a1;
  int v11 = (char *)&ccp_fsm + 80 * (int)a1;
  BOOL v12 = v11 + 8;
  int v13 = *((_DWORD *)v11 + 2);
  fsm_input((uint64_t)v11, a2, a3, a4, a5, a6, a7, a8, v34);
  if (v13 == 6)
  {
    if (*a2 == 6
      && !ccp_gotoptions[14 * v10 + 1]
      && !ccp_gotoptions[14 * v10]
      && !ccp_gotoptions[14 * v10 + 2]
      && !ccp_gotoptions[14 * v10 + 3]
      && !ccp_gotoptions[14 * v10 + 6])
    {
      sub_10000432C(a1, "No compression negotiated");
    }
  }

  else if (v13 == 9 && *a2 == 5 && *v12 != 9)
  {
    notice("Compression disabled by peer.", v14, v15, v16, v17, v18, v19, v20, v35);
    if (ccp_gotoptions[14 * v10 + 6])
    {
      error("MPPE disabled, closing LCP", v21, v22, v23, v24, v25, v26, v27, v36);
      lcp_close(a1, "MPPE disabled by peer", v28, v29, v30, v31, v32, v33);
    }
  }

void sub_1000041C8(uint64_t a1)
{
  int v1 = a1;
  ccp_flags_set(a1, 0, 0);
  fsm_protreject((uint64_t)&ccp_fsm + 80 * v1, v2, v3, v4, v5, v6, v7, v8);
  if (ccp_gotoptions[14 * v1 + 6])
  {
    error("MPPE required but peer negotiation failed", v9, v10, v11, v12, v13, v14, v15, v22);
    lcp_close(v1, "MPPE required but peer negotiation failed", v16, v17, v18, v19, v20, v21);
  }

void sub_100004240( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100004254(int a1)
{
}

void sub_100004268( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a1;
  uint64_t v9 = (int *)((char *)&ccp_fsm + 80 * (int)a1);
  if (v9[2] != 9) {
    ccp_flags_set(a1, 1, 0);
  }
  sub_100004BE4(v9, a2, a3, a4, a5, a6, a7, a8);
  if (!ccp_gotoptions[14 * v8 + 1]
    && !ccp_gotoptions[14 * v8]
    && !ccp_gotoptions[14 * v8 + 2]
    && !ccp_gotoptions[14 * v8 + 3]
    && !ccp_gotoptions[14 * v8 + 6])
  {
    *((_DWORD *)&ccp_fsm + 20 * v8 + 3) |= 4u;
  }

  fsm_open((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);
}

void sub_10000432C(uint64_t a1, char *a2)
{
  int v3 = a1;
  ccp_flags_set(a1, 0, 0);
  fsm_close((uint64_t)&ccp_fsm + 80 * v3, a2, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_10000436C(unsigned __int8 *a1, int a2, void (*a3)(uint64_t, const char *), uint64_t a4)
{
  if (a2 < 4) {
    return 0LL;
  }
  unsigned int v6 = __rev16(*((unsigned __int16 *)a1 + 1));
  int v7 = v6 - 4;
  if (v6 < 4 || v6 > a2) {
    return 0LL;
  }
  int v11 = *a1;
  int v12 = a1[1];
  uint64_t v13 = (v11 - 1);
  else {
    uint64_t v14 = " code=0x%x";
  }
  a3(a4, v14);
  ((void (*)(uint64_t, const char *, ...))a3)(a4, " id=0x%x", v12);
  uint64_t v15 = a1 + 4;
  if (v13 < 4)
  {
    if (v6 >= 6)
    {
      while (1)
      {
        uint64_t v16 = v15[1];
        int v18 = *v15;
        a3(a4, " <");
        uint64_t v19 = v15;
        switch(v18)
        {
          case 18:
            uint64_t v19 = v15;
            if (v16 >= 6)
            {
              unsigned int v23 = v15[2];
              int v24 = v23 & 1;
              signed __int8 v25 = v15[5];
              if (v15[3]) {
                goto LABEL_40;
              }
              char v26 = (4 * v24) ^ 4;
              if (v25 < 0) {
                v26 |= 8u;
              }
              char v27 = v23 >= 2 ? 64 : v26;
              if (v15[4]) {
LABEL_40:
              }
                char v27 = 64;
              int v28 = v25 & 0xE | v27 & 0x40;
              BOOL v29 = v24 == 0;
              uint64_t v30 = "+H";
              if (v29) {
                uint64_t v30 = "-H";
              }
              uint64_t v31 = "+M";
              if (v25 >= 0) {
                uint64_t v31 = "-M";
              }
              uint64_t v32 = "+S";
              if ((v15[5] & 0x40) == 0) {
                uint64_t v32 = "-S";
              }
              uint64_t v33 = "+L";
              if ((v15[5] & 0x20) == 0) {
                uint64_t v33 = "-L";
              }
              int v34 = "+D";
              if ((v15[5] & 0x10) == 0) {
                int v34 = "-D";
              }
              BOOL v29 = (v25 & 1) == 0;
              int v35 = "+C";
              if (v29) {
                int v35 = "-C";
              }
              int v36 = " +U";
              if (!v28) {
                int v36 = (const char *)&unk_10002EB6A;
              }
              ((void (*)(uint64_t, const char *, ...))a3)( a4,  "mppe %s %s %s %s %s %s%s",  v30,  v31,  v32,  v33,  v34,  v35,  v36);
              if (v28) {
                ((void (*)(uint64_t, const char *, ...))a3)(a4, " (%.2x %.2x %.2x %.2x)", v15[2], v15[3], v15[4], v15[5]);
              }
              uint64_t v19 = v15 + 6;
            }

            goto LABEL_62;
          case 19:
          case 20:
          case 22:
          case 23:
          case 25:
            goto LABEL_62;
          case 21:
            uint64_t v19 = v15;
            if (v16 >= 3)
            {
              ((void (*)(uint64_t, const char *, ...))a3)(a4, "bsd v%d %d", v15[2] >> 5, v15[2] & 0x1F);
              uint64_t v19 = v15 + 3;
            }

            goto LABEL_62;
          case 24:
          case 26:
            uint64_t v19 = v15;
            if (v16 >= 4)
            {
              uint64_t v20 = (const char *)&unk_10002EB6A;
              if (v18 == 24) {
                uint64_t v20 = "(old#)";
              }
              ((void (*)(uint64_t, const char *, ...))a3)(a4, "deflate%s %d", v20, (v15[2] >> 4) + 8);
              if ((v15[2] & 0xF) != 8) {
                ((void (*)(uint64_t, const char *, ...))a3)(a4, " method %d", v15[2] & 0xF);
              }
              if (v15[3]) {
                ((void (*)(uint64_t, const char *, ...))a3)(a4, " check %d", v15[3]);
              }
              uint64_t v19 = v15 + 4;
            }

            goto LABEL_62;
          default:
            if (v18 == 1)
            {
              uint64_t v21 = a4;
              int v22 = "predictor 1";
              goto LABEL_61;
            }

            uint64_t v19 = v15;
            if (v18 == 2)
            {
              uint64_t v21 = a4;
              int v22 = "predictor 2";
LABEL_61:
              a3(v21, v22);
              uint64_t v19 = v15 + 2;
            }

LABEL_62:
            if (v19 < &v15[v16])
            {
              uint64_t v37 = &v15[v16];
              int64_t v38 = &v15[v16] - v19;
              do
              {
                int v39 = *v19++;
                ((void (*)(uint64_t, const char *, ...))a3)(a4, " %.2x", v39);
                --v38;
              }

              while (v38);
              uint64_t v19 = v37;
            }

            v7 -= v16;
            a3(a4, ">");
            uint64_t v15 = v19;
            if (v7 <= 1) {
              goto LABEL_73;
            }
            break;
        }
      }
    }

LABEL_72:
    uint64_t v19 = a1 + 4;
LABEL_73:
    uint64_t v15 = v19;
    if (v7 < 1) {
      return ((_DWORD)v15 - (_DWORD)a1);
    }
    goto LABEL_74;
  }

  if (v6 >= 5)
  {
    if (*v15 - 32 > 0x5E)
    {
LABEL_74:
      unsigned int v40 = v7 + 1;
      do
      {
        int v41 = *v15++;
        ((void (*)(uint64_t, const char *, ...))a3)(a4, " %.2x", v41);
        --v40;
      }

      while (v40 > 1);
      return ((_DWORD)v15 - (_DWORD)a1);
    }

    print_string((char *)a1 + 4, v6 - 4, a3, a4);
    LODWORD(v15) = (_DWORD)v15 + v7;
  }

  return ((_DWORD)v15 - (_DWORD)a1);
}

void sub_1000047DC(uint64_t a1)
{
  int v1 = (unsigned int *)((char *)&ccp_fsm + 80 * (int)a1);
  if (v1[2] == 9)
  {
    int v3 = a1;
    if (ccp_fatal_error())
    {
      error("Lost compression sync: disabling compression", v4, v5, v6, v7, v8, v9, v10, v35);
      ccp_flags_set(a1, 0, 0);
      fsm_close((uint64_t)v1, "Lost compression sync", v11, v12, v13, v14, v15, v16);
      if (ccp_gotoptions[14 * v3 + 6])
      {
        error("Too many MPPE errors, closing LCP", v17, v18, v19, v20, v21, v22, v23, v36);
        lcp_close(a1, "Too many MPPE errors", v24, v25, v26, v27, v28, v29);
      }
    }

    else
    {
      uint64_t v30 = (int)*v1;
      int v31 = dword_1000462A4[v30];
      if ((v31 & 1) != 0)
      {
        int v34 = v31 | 2;
      }

      else
      {
        uint64_t v32 = (char *)&ccp_fsm + 80 * v3;
        char v33 = v32[16] + 1;
        v32[16] = v33;
        v32[17] = v33;
        fsm_sdata(v1, 14, v33, 0LL, 0LL, v8, v9, v10, v35);
        timeout((int)sub_100006980);
        uint64_t v30 = (int)*v1;
        int v34 = dword_1000462A4[v30] | 1;
      }

      dword_1000462A4[v30] = v34;
    }
  }

uint64_t sub_100004908(const char **a1)
{
  uint64_t v2 = (char *)*a1;
  int v3 = strtol(*a1, &__endptr, 0);
  uint64_t v11 = __endptr;
  if (__endptr == v2) {
    goto LABEL_8;
  }
  int v12 = v3;
  if (*__endptr == 44)
  {
    uint64_t v2 = __endptr + 1;
    int v3 = strtol(__endptr + 1, &__endptr, 0);
    uint64_t v11 = __endptr;
  }

  if (v11 == v2 || *v11 != 0)
  {
LABEL_8:
    option_error("invalid parameter '%s' for bsdcomp option", v4, v5, v6, v7, v8, v9, v10, (int)*a1);
    return 0LL;
  }

  BOOL v15 = (v12 - 9) < 7 || v12 == 0;
  if (!v15 || ((v3 - 9) >= 7 ? (BOOL v16 = v3 == 0) : (BOOL v16 = 1), !v16))
  {
    option_error("bsdcomp option values must be 0 or %d .. %d", v4, v5, v6, v7, v8, v9, v10, 9);
    return 0LL;
  }

  if (v12)
  {
    LOWORD(dword_100043650) = v12;
    char v17 = 1;
  }

  else
  {
    char v17 = 0;
  }

  LOBYTE(ccp_wantoptions[0]) = v17;
  if (v3)
  {
    LOWORD(dword_10004366C) = v3;
    char v18 = 1;
  }

  else
  {
    char v18 = 0;
  }

  LOBYTE(ccp_allowoptions[0]) = v18;
  if (v3 == v12) {
    uint64_t v19 = "%d";
  }
  else {
    uint64_t v19 = "%d,%d";
  }
  slprintf((int)&unk_100046250, 8, v19);
  return 1LL;
}

uint64_t sub_100004A50(const char **a1)
{
  uint64_t v2 = (char *)*a1;
  int v3 = strtol(*a1, &__endptr, 0);
  uint64_t v11 = __endptr;
  if (__endptr == v2) {
    goto LABEL_8;
  }
  int v12 = v3;
  int v13 = v3;
  if (*__endptr == 44)
  {
    uint64_t v2 = __endptr + 1;
    int v14 = strtol(__endptr + 1, &__endptr, 0);
    uint64_t v11 = __endptr;
    int v13 = v14;
  }

  if (v11 == v2 || *v11 != 0)
  {
LABEL_8:
    option_error("invalid parameter '%s' for deflate option", v4, v5, v6, v7, v8, v9, v10, (int)*a1);
    return 0LL;
  }

  BOOL v17 = (v12 - 8) < 8 || v12 == 0;
  if (!v17 || ((v13 - 8) >= 8 ? (BOOL v18 = v13 == 0) : (BOOL v18 = 1), !v18))
  {
    option_error("deflate option values must be 0 or %d .. %d", v4, v5, v6, v7, v8, v9, v10, 8);
    return 0LL;
  }

  if (v12 != 8 && v13 != 8) {
    goto LABEL_25;
  }
  int v19 = 9;
  if (v13 == 8) {
    int v13 = 9;
  }
  warning("deflate option value of %d changed to %d to avoid zlib bug", v4, v5, v6, v7, v8, v9, v10, 8);
  if (v12 != 8)
  {
LABEL_25:
    if (!v12)
    {
      int v19 = 0;
      HIBYTE(ccp_wantoptions[0]) = 0;
      if (v13) {
        goto LABEL_28;
      }
LABEL_30:
      char v20 = 0;
      goto LABEL_31;
    }

    int v19 = v12;
  }

  HIBYTE(ccp_wantoptions[0]) = 1;
  HIWORD(dword_100043650) = v19;
  if (!v13) {
    goto LABEL_30;
  }
LABEL_28:
  HIWORD(dword_10004366C) = v13;
  char v20 = 1;
LABEL_31:
  HIBYTE(ccp_allowoptions[0]) = v20;
  if (v19 == v13) {
    uint64_t v21 = "%d";
  }
  else {
    uint64_t v21 = "%d,%d";
  }
  slprintf((int)&unk_100046258, 8, v21);
  return 1LL;
}

void sub_100004BE4( int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *a1;
  uint64_t v10 = &ccp_gotoptions[14 * v9];
  uint64_t v11 = &ccp_wantoptions[7 * v9];
  *uint64_t v10 = *(void *)v11;
  *(void *)((char *)v10 + 6) = *(void *)(v11 + 3);
  int v12 = (char *)v10 + 6;
  uint64_t v13 = *a1;
  dword_100046260[(int)v13] = 0;
  unsigned int v14 = *((unsigned __int8 *)v10 + 6);
  if (*((_BYTE *)v10 + 6))
  {
    int v15 = v13;
    unsigned int v16 = auth_done[(int)v13];
    if ((v16 & 0x30) == 0)
    {
      unsigned int v45 = 0;
      unsigned int v46 = (v16 >> 8) & 0xF;
      do
      {
        v45 += v46 & 1;
        BOOL v47 = v46 > 1;
        v46 >>= 1;
      }

      while (v47);
      if (v45 >= 2)
      {
        uint64_t v48 = "MPPE required, but auth done in both directions.";
        goto LABEL_38;
      }

      if (!v45)
      {
        uint64_t v48 = "MPPE required, but MS-CHAP[v2] auth not performed.";
        goto LABEL_38;
      }

      if (!mppe_keys_set)
      {
        uint64_t v48 = "MPPE required, but keys are not available.  Possible plugin problem?";
        goto LABEL_38;
      }

      if ((v14 & 1) != 0 && (v16 & 0x300) != 0)
      {
        notice("Disabling 40-bit MPPE; MS-CHAP LM not supported", a2, a3, a4, a5, a6, a7, a8, v55);
        unsigned int v14 = *v12 & 0xFE;
        *v12 &= ~1u;
        uint64_t v13 = *a1;
        LOBYTE(ccp_wantoptions[7 * (int)v13 + 3]) &= ~1u;
      }
    }

    if ((v14 & 3) != 0)
    {
      LOBYTE(ccp_allowoptions[7 * v15 + 3]) = v14;
      *(_DWORD *)uint64_t v10 = 0;
      *(_DWORD *)&ccp_allowoptions[7 * v15] = 0;
      *(_WORD *)v56 = 1554;
      v56[2] = ((v14 >> 2) & 1) == 0;
      *(_WORD *)&v56[3] = 0;
      char v57 = 32 * (v14 & 3);
      if ((int)ccp_test(v13, (uint64_t)v56, 22, 0) <= 0)
      {
        error("MPPE required, but kernel has no support.", v17, v18, v19, v20, v21, v22, v23, v55);
        lcp_close(*a1, "MPPE required but not available", v24, v25, v26, v27, v28, v29);
      }

      goto LABEL_6;
    }

    uint64_t v48 = "MPPE required, but both 40-bit and 128-bit disabled.";
LABEL_38:
    error(v48, a2, a3, a4, a5, a6, a7, a8, v55);
    lcp_close(*a1, "MPPE required but not available", v49, v50, v51, v52, v53, v54);
    return;
  }

LABEL_6:
  if (*(_BYTE *)v10)
  {
    *(_WORD *)v56 = 789;
    v56[2] = 41;
  }

  uint64_t v30 = &ccp_gotoptions[14 * (int)v9];
  int v32 = v30[1];
  int v31 = v30 + 1;
  if (v32)
  {
    char v33 = &ccp_gotoptions[14 * (int)v9];
    int v35 = v33[4];
    int v34 = v33 + 4;
    if (v35)
    {
      *(_DWORD *)v56 = 1573914;
    }

    int v36 = &ccp_gotoptions[14 * (int)v9];
    int v38 = v36[5];
    uint64_t v37 = v36 + 5;
    if (v38)
    {
      *(_DWORD *)v56 = 1573912;
    }

    if (!*v34 && !*v37) {
      *int v31 = 0;
    }
  }

  int v39 = &ccp_gotoptions[14 * (int)v9];
  int v41 = v39[2];
  unsigned int v40 = v39 + 2;
  if (v41)
  {
    *(_WORD *)v56 = 513;
  }

  uint64_t v42 = &ccp_gotoptions[14 * (int)v9];
  int v44 = v42[3];
  size_t v43 = v42 + 3;
  if (v44)
  {
    *(_WORD *)v56 = 514;
  }

uint64_t sub_100004F64(int *a1)
{
  int v1 = (char *)&ccp_gotoptions + 14 * *a1;
  if (*v1) {
    int v2 = 3;
  }
  else {
    int v2 = 0;
  }
  int v3 = (v2 | (4 * (v1[1] != 0))) + 2 * (v1[2] != 0) + 2 * (v1[3] != 0);
  if (v1[6]) {
    int v4 = 6;
  }
  else {
    int v4 = 0;
  }
  return (v3 + v4);
}

void sub_100004FD0(int *a1, char *a2, _DWORD *a3)
{
  int v6 = *a1;
  uint64_t v7 = &ccp_gotoptions[14 * *a1];
  uint64_t v8 = v7 + 6;
  uint64_t v9 = a2;
  if (v7[6])
  {
    __int16 v41 = 1554;
    *(_WORD *)a2 = 1554;
    a2[2] = (*v8 & 4) == 0;
    *(_WORD *)(a2 + 3) = 0;
    a2[5] = 0;
    unsigned __int8 v10 = (32 * *v8) & 0x40;
    a2[5] = v10;
    char v11 = *v8;
    if ((*v8 & 1) != 0)
    {
      a2[5] = v10 | 0x20;
      char v11 = *v8;
    }

    BOOL v42 = (v11 & 4) == 0;
    __int16 v43 = 0;
    char v44 = 32 * (v11 & 3);
    __int128 v45 = mppe_recv_key;
    if ((int)ccp_test(*a1, (uint64_t)&v41, 22, 0) < 1)
    {
      lcp_close(*a1, "MPPE required but not available in kernel", v12, v13, v14, v15, v16, v17);
      uint64_t v9 = a2;
    }

    else
    {
      uint64_t v9 = a2 + 6;
    }
  }

  uint64_t v18 = &ccp_gotoptions[14 * v6];
  int v20 = v18[1];
  uint64_t v19 = v18 + 1;
  if (v20)
  {
    uint64_t v21 = &ccp_gotoptions[14 * v6];
    uint64_t v22 = v21 + 4;
    if (v21[4]) {
      char v23 = 26;
    }
    else {
      char v23 = 24;
    }
    *uint64_t v9 = v23;
    v9[1] = 4;
    char v25 = v21[10];
    uint64_t v24 = v21 + 10;
    v9[2] = 16 * v25 - 120;
    v9[3] = 0;
    if (v9 == a2)
    {
      while (1)
      {
        if ((unsigned __int16)*v24 < 9u)
        {
LABEL_20:
          *uint64_t v19 = 0;
          uint64_t v9 = a2;
          goto LABEL_22;
        }

        int v27 = ccp_test(*a1, (uint64_t)a2, 4, 0);
        if (v27 >= 1) {
          break;
        }
        if (v27 < 0) {
          goto LABEL_20;
        }
        __int16 v28 = *v24 - 1;
        *uint64_t v24 = v28;
        v9[2] = 16 * v28 - 120;
      }

      uint64_t v26 = a2 + 4;
    }

    else
    {
      uint64_t v26 = v9 + 4;
      uint64_t v9 = a2;
      if (v26 == a2) {
        goto LABEL_22;
      }
    }

    if (*v22 && ccp_gotoptions[14 * v6 + 5])
    {
      *(_WORD *)uint64_t v26 = 1048;
      *((_WORD *)v26 + 1) = *(v26 - 2);
      uint64_t v9 = v26 + 4;
    }

    else
    {
      uint64_t v9 = v26;
    }
  }

LABEL_22:
  if (*v7)
  {
    *(_WORD *)uint64_t v9 = 789;
    uint64_t v29 = &ccp_gotoptions[14 * v6];
    char v31 = v29[8];
    uint64_t v30 = v29 + 8;
    v9[2] = v31 | 0x20;
    if (v9 == a2)
    {
      while (1)
      {
        if ((unsigned __int16)*v30 < 9u)
        {
LABEL_29:
          *uint64_t v7 = 0;
          uint64_t v9 = a2;
          goto LABEL_30;
        }

        int v32 = ccp_test(*a1, (uint64_t)a2, 3, 0);
        if (v32 >= 1) {
          break;
        }
        if (v32 < 0) {
          goto LABEL_29;
        }
        __int16 v33 = *v30 - 1;
        *uint64_t v30 = v33;
        v9[2] = v33 | 0x20;
      }

      uint64_t v9 = a2 + 3;
    }

    else
    {
      v9 += 3;
    }
  }

    v127 = 0;
    v125 = 1;
  }

    uint64_t v50 = (char *)&ipv6cp_fsm + 80 * (int)*a1;
    uint64_t v51 = "Interface configuration failed";
LABEL_27:
    fsm_close((uint64_t)v50, v51, v19, v20, v21, v22, v23, v24);
    return;
  }

  if (!sifup())
  {
    if (debug)
    {
      uint64_t v49 = "sifup failed (IPV6)";
      goto LABEL_21;
    }

    goto LABEL_22;
  }

  sifnpmode(*a1, 87, 0);
  char v25 = eui64_ntoa(*v11);
  snprintf(byte_100047ED4, 0x40uLL, "fe80::%s", v25);
  notice("local  LL address %s", v26, v27, v28, v29, v30, v31, v32, (int)byte_100047ED4);
  __int16 v33 = eui64_ntoa(*v15);
  snprintf(byte_100047ED4, 0x40uLL, "fe80::%s", v33);
  notice("remote LL address %s", v34, v35, v36, v37, v38, v39, v40, (int)byte_100047ED4);
  np_up();
  byte_100047F1C = 1;
  if ((byte_100047F20 & 1) == 0 && !dword_100047F24)
  {
    byte_100047F20 = 1;
    sub_10002610C("/etc/ppp/ipv6-up");
  }

LABEL_30:
  int v34 = &ccp_gotoptions[14 * v6];
  int v36 = v34[2];
  int v35 = v34 + 2;
  if (v36)
  {
    *(_WORD *)uint64_t v9 = 513;
    if (v9 == a2 && (int)ccp_test(*a1, (uint64_t)a2, 2, 0) <= 0)
    {
      *int v35 = 0;
      uint64_t v9 = a2;
    }

    else
    {
      v9 += 2;
    }
  }

  uint64_t v37 = &ccp_gotoptions[14 * v6];
  int v39 = v37[3];
  int v38 = v37 + 3;
  if (v39)
  {
    *(_WORD *)uint64_t v9 = 514;
    if (v9 == a2 && (int)ccp_test(*a1, (uint64_t)a2, 2, 0) <= 0)
    {
      *int v38 = 0;
      __int16 v40 = -1;
      LODWORD(v9) = (_DWORD)a2;
      goto LABEL_41;
    }

    v9 += 2;
  }

  if (v9 <= a2) {
    __int16 v40 = -1;
  }
  else {
    __int16 v40 = *a2;
  }
LABEL_41:
  *(_WORD *)&ccp_gotoptions[14 * v6 + 12] = v40;
  *a3 = (_DWORD)v9 - (_DWORD)a2;
}

BOOL sub_100005350(int *a1, unsigned __int8 *a2, int a3)
{
  int v3 = *a1;
  int v4 = (char *)&ccp_gotoptions + 14 * *a1;
  unsigned int v5 = v4[6];
  if (v4[6])
  {
    *(_WORD *)uint64_t v13 = 1554;
    v13[2] = ((v5 >> 2) & 1) == 0;
    *(_WORD *)&v13[3] = 0;
    if (a3 < 6) {
      return 0LL;
    }
    if (*(_DWORD *)v13 == *(_DWORD *)a2)
    {
      v13[5] = 32 * (v5 & 3);
      BOOL v6 = *(unsigned __int16 *)&v13[4] == *((unsigned __int16 *)a2 + 2);
    }

    else
    {
      BOOL v6 = 0;
    }

    if (!v6) {
      return 0LL;
    }
    a3 -= 6;
    if (!a3) {
      return 1LL;
    }
    uint64_t v7 = a2 + 6;
  }

  else
  {
    uint64_t v7 = a2;
  }

  if (!*((_BYTE *)&ccp_gotoptions + 14 * v3 + 1)) {
    goto LABEL_31;
  }
  if (a3 < 4) {
    return 0LL;
  }
  int v8 = *((_BYTE *)&ccp_gotoptions + 14 * v3 + 4) ? 26 : 24;
  if (v8 != *v7) {
    return 0LL;
  }
  if (v7[1] != 4) {
    return 0LL;
  }
  int v9 = v7[2];
  if (a3 == 4) {
    return 1LL;
  }
  if (*((_BYTE *)&ccp_gotoptions + 14 * v3 + 4) && *((_BYTE *)&ccp_gotoptions + 14 * v3 + 5))
  {
    BOOL v10 = a3 >= 8;
    a3 -= 8;
    if (!v10 || v7[4] != 24 || v7[5] != 4 || v9 != v7[6] || v7[7]) {
      return 0LL;
    }
    v7 += 8;
  }

  else
  {
    a3 -= 4;
    v7 += 4;
  }

LABEL_31:
  if (*v4)
  {
    BOOL v11 = __OFSUB__(a3, 3);
    a3 -= 3;
    if (a3 < 0 != v11
      || *v7 != 21
      || v7[1] != 3
      || (*((unsigned __int16 *)&ccp_gotoptions + 7 * v3 + 4) | 0x20) != v7[2])
    {
      return 0LL;
    }

    v7 += 3;
    if (v7 == a2 && !a3) {
      return 1LL;
    }
  }

  if (*((_BYTE *)&ccp_gotoptions + 14 * v3 + 2))
  {
    BOOL v11 = __OFSUB__(a3, 2);
    a3 -= 2;
    if (a3 < 0 != v11 || *v7 != 1 || v7[1] != 2) {
      return 0LL;
    }
    v7 += 2;
    if (v7 == a2 && !a3) {
      return 1LL;
    }
  }

  if (!*((_BYTE *)&ccp_gotoptions + 14 * v3 + 3)) {
    return a3 == 0;
  }
  BOOL v11 = __OFSUB__(a3, 2);
  a3 -= 2;
  if (a3 < 0 != v11 || *v7 != 2 || v7[1] != 2) {
    return 0LL;
  }
  if (v7 + 2 == a2 && !a3) {
    return 1LL;
  }
  return a3 == 0;
}

      uint64_t v14 = __fd;
      if ((_DWORD)__fd != -1) {
        goto LABEL_34;
      }
      *((void *)&v21 + 1) = calloc(v11, 1uLL);
      DWORD1(__fd) = v11;
      if (*((void *)&v21 + 1))
      {
        *(_OWORD *)&v23[12] = *(_OWORD *)__buf;
        *(_OWORD *)&v23[28] = *(_OWORD *)&__buf[16];
        *(void *)&v23[44] = v25;
        uint64_t v14 = __fd;
LABEL_34:
        lseek(v14, 0LL, 0);
        if ((_DWORD)__fd == -1) {
          goto LABEL_37;
        }
        if (read(__fd, &v23[12], 0x28uLL) == 40)
        {
LABEL_14:
          if ((_DWORD)__fd != -1)
          {
            fstat(__fd, &v20);
            *(void *)&uint64_t v21 = strdup(a1);
            DWORD1(__fd) = v20.st_size;
          }

  uint64_t v24 = override_value("+ipv6", option_priority, option_source);
  uint64_t result = 1LL;
  if (v24) {
    byte_100042A20 = 1;
  }
  return result;
}

uint64_t sub_100005594( int *a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a3;
  int v9 = a2;
  int v11 = *a1;
  uint64_t v12 = &ccp_gotoptions[14 * *a1];
  char v13 = *v12;
  char v14 = v12[1];
  int v15 = *(_DWORD *)(v12 + 2);
  char v16 = v12[6];
  char v17 = v12[7];
  __int16 v18 = *((_WORD *)v12 + 4);
  __int16 v19 = *((_WORD *)v12 + 5);
  __int16 v20 = *((_WORD *)v12 + 6);
  int v21 = v12[1];
  if (a2[1] != 6) {
    goto LABEL_27;
  }
  unsigned int v22 = a2[2];
  int v23 = (char)a2[5];
  int v24 = ((4 * (v22 & 1)) | (v23 >> 5) & 3) ^ 4;
  if (v23 < 0) {
    v24 |= 8u;
  }
  int v25 = (2 * v23) & 0x20 | (16 * (v23 & 1)) | v24;
  if (a2[3] || (v22 >= 2 ? (int v26 = v25 | 0x40) : (int v26 = (2 * v23) & 0x20 | (16 * (v23 & 1)) | v24), a2[4])) {
    int v26 = v25 | 0x40;
  }
  if ((v23 & 0xE) != 0) {
    unsigned int v27 = v25 | 0x40;
  }
  else {
    unsigned int v27 = v26;
  }
  if (((refuse_mppe_stateful != 0) & (v27 >> 2)) != 0) {
    char v16 = v27 & 0xFB;
  }
  else {
    char v16 = v27;
  }
  if ((v16 & 1) != 0 && (ccp_allowoptions[7 * v11 + 3] & 1) == 0) {
    v16 &= ~1u;
  }
  if ((v16 & 2) != 0 && (ccp_allowoptions[7 * v11 + 3] & 2) == 0) {
    v16 &= ~2u;
  }
  if ((v16 & 3) == 0)
  {
    char v44 = v12[7];
    int v45 = *(_DWORD *)(v12 + 2);
    error("MPPE required but peer negotiation failed", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v42);
    lcp_close(*a1, "MPPE required but peer negotiation failed", v35, v36, v37, v38, v39, v40);
    __int16 v20 = v43;
    char v17 = v44;
    int v15 = v45;
    int v21 = ccp_gotoptions[14 * v11 + 1];
  }

  else
  {
LABEL_26:
    int v21 = v12[1];
  }

LABEL_27:
  if (v8 >= 4 && v21)
  {
    int v28 = ccp_gotoptions[14 * v11 + 4] ? 26 : 24;
    if (v28 == *v9 && v9[1] == 4)
    {
      unsigned int v29 = v9[2];
      if ((v29 & 0xF) == 8 && v29 >= 0x10 && !v9[3])
      {
        unsigned int v41 = (v29 >> 4) + 8;
      }

      else
      {
        char v14 = 0;
      }

      if (ccp_gotoptions[14 * v11 + 4] && v8 >= 8 && ccp_gotoptions[14 * v11 + 5] && v9[4] == 24)
      {
        int v30 = v9[5];
        if (v30 == 4) {
          v8 -= 8;
        }
        else {
          v8 -= 4;
        }
        if (v30 == 4) {
          v9 += 8;
        }
        else {
          v9 += 4;
        }
      }

      else
      {
        v8 -= 4;
        v9 += 4;
      }
    }
  }

  if (*v12) {
    BOOL v31 = v8 < 3;
  }
  else {
    BOOL v31 = 1;
  }
  if (!v31 && *v9 == 21 && v9[1] == 3)
  {
    unsigned __int8 v32 = v9[2];
    if ((v32 & 0xE0) == 0x20)
    {
      unsigned int v33 = v32 & 0x1F;
    }

    else
    {
      char v13 = 0;
    }
  }

  if (a1[2] != 9)
  {
    *uint64_t v12 = v13;
    v12[1] = v14;
    *(_DWORD *)(v12 + 2) = v15;
    v12[6] = v16;
    v12[7] = v17;
    *((_WORD *)v12 + 4) = v18;
    *((_WORD *)v12 + 5) = v19;
    *((_WORD *)v12 + 6) = v20;
  }

  return 1LL;
}

uint64_t sub_1000058A0( int *a1, _BYTE *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a2;
  uint64_t v10 = *a1;
  int v11 = &ccp_gotoptions[14 * (int)v10];
  char v12 = *v11;
  char v13 = v11[1];
  char v14 = v11[2];
  char v15 = v11[3];
  int v16 = v11[4];
  int v17 = v11[5];
  uint64_t v18 = *(void *)(v11 + 6);
  if ((_DWORD)a3)
  {
    int v19 = a3 - 6;
    if ((int)a3 >= 6 && *(void *)(v11 + 6) && *a2 == 18 && a2[1] == 6)
    {
      char v37 = v11[2];
      uint64_t v36 = *(void *)(v11 + 6);
      char v35 = v11[3];
      error("MPPE required but peer refused", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v34);
      lcp_close(*a1, "MPPE required but peer refused", v20, v21, v22, v23, v24, v25);
      char v15 = v35;
      uint64_t v18 = v36;
      char v14 = v37;
      v8 += 6;
      int v26 = ccp_gotoptions[14 * (int)v10 + 4];
      LODWORD(a3) = v19;
    }

    else
    {
      int v26 = v11[4];
    }

    if (v26) {
      BOOL v27 = (int)a3 < 4;
    }
    else {
      BOOL v27 = 1;
    }
    if (!v27 && *v8 == 26 && v8[1] == 4)
    {
      int v16 = 0;
      v8 += 4;
      LODWORD(a3) = a3 - 4;
    }

    else {
      BOOL v28 = 1;
    }
    if (!v28 && *v8 == 24 && v8[1] == 4)
    {
      int v17 = 0;
      v8 += 4;
      LODWORD(a3) = a3 - 4;
    }
  }

  else
  {
    if (dword_100046260[v10]) {
      return 0xFFFFFFFFLL;
    }
    LODWORD(a3) = 0;
  }

  if (v16 | v17) {
    char v30 = v13;
  }
  else {
    char v30 = 0;
  }
  if (*v11) {
    BOOL v31 = (int)a3 < 3;
  }
  else {
    BOOL v31 = 1;
  }
  if (!v31 && *v8 == 21 && v8[1] == 3)
  {
    char v12 = 0;
    v8 += 3;
    LODWORD(a3) = a3 - 3;
  }

  else {
    BOOL v32 = 1;
  }
  if (!v32 && *v8 == 1 && v8[1] == 2)
  {
    char v14 = 0;
    v8 += 2;
    LODWORD(a3) = a3 - 2;
  }

  else {
    BOOL v33 = 1;
  }
  if (v33)
  {
    if (!(_DWORD)a3) {
      goto LABEL_53;
    }
    return 0LL;
  }

  if (*v8 != 2) {
    return 0LL;
  }
  uint64_t result = 0LL;
  if (v8[1] != 2) {
    return result;
  }
  char v15 = 0;
  if ((_DWORD)a3 != 2) {
    return 0LL;
  }
LABEL_53:
  if (a1[2] == 9) {
    return 1LL;
  }
  _BYTE *v11 = v12;
  v11[1] = v30;
  v11[2] = v14;
  v11[3] = v15;
  v11[4] = v16;
  v11[5] = v17;
  uint64_t result = 1LL;
  *(void *)(v11 + 6) = v18;
  return result;
}

uint64_t sub_100005B88( int *a1, unsigned __int8 *__src, int *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *a1;
  uint64_t v9 = 7 * v8;
  int v10 = *a3;
  int v11 = (char *)&ccp_hisoptions[7 * v8];
  *(void *)(v11 + 6) = 0LL;
  *(void *)int v11 = 0LL;
  if (v10 <= 0)
  {
    ccp_hisoptions[7 * (int)v8 + 6] = -1;
    return 2LL;
  }

  int v12 = a4;
  char v14 = a1;
  __int128 v78 = (char *)&ccp_allowoptions[v9 + 1] + 1;
  *((_WORD *)v11 + 6) = *__src;
  __int128 v77 = &ccp_allowoptions[v9 + 1];
  __int128 v71 = v11 + 2;
  __int128 v72 = v11 + 3;
  __int128 v75 = v11 + 8;
  int v68 = &ccp_allowoptions[v9 + 4];
  __int128 v83 = (char *)&ccp_allowoptions[v9] + 1;
  __int128 v79 = &ccp_allowoptions[v9 + 2];
  __int128 v80 = &ccp_allowoptions[v9];
  v70 = (char *)&ccp_allowoptions[v9 + 2] + 1;
  v66 = v11 + 1;
  v67 = v11 + 10;
  __int128 v81 = &ccp_allowoptions[v9 + 3];
  __int128 v73 = v11 + 6;
  __int128 v74 = &ccp_hisoptions[7 * v8];
  uint64_t v65 = &ccp_allowoptions[v9 + 5];
  char v15 = __src;
  uint64_t v16 = 2LL;
  int v69 = 1;
  int v17 = (char *)__src;
  while (2)
  {
    if (v10 == 1)
    {
      LODWORD(v18) = 4;
      unsigned int v19 = 1;
      goto LABEL_10;
    }

    unsigned int v19 = v15[1];
    if (v19 < 2 || v10 < v19)
    {
      LODWORD(v18) = 4;
      unsigned int v19 = v10;
      goto LABEL_10;
    }

    int v25 = *v15;
    LODWORD(v18) = 4;
    switch(*v15)
    {
      case 0x12u:
        if (v19 != 6) {
          goto LABEL_10;
        }
        char v28 = *(_BYTE *)v81;
        if (!*(_BYTE *)v81) {
          goto LABEL_10;
        }
        *__int128 v73 = 0;
        int v29 = ~(4 * v15[2]) & 4;
        *__int128 v73 = ~(4 * v15[2]) & 4;
        unsigned __int8 v30 = v15[5];
        if ((v30 & 0x40) != 0)
        {
          v29 |= 2u;
          *__int128 v73 = v29;
          unsigned __int8 v30 = v15[5];
          if ((v30 & 0x20) == 0)
          {
LABEL_51:
            if ((v30 & 0x80) == 0) {
              goto LABEL_52;
            }
            goto LABEL_92;
          }
        }

        else if ((v15[5] & 0x20) == 0)
        {
          goto LABEL_51;
        }

        v29 |= 1u;
        *__int128 v73 = v29;
        unsigned __int8 v30 = v15[5];
        if ((v30 & 0x80) == 0)
        {
LABEL_52:
          if ((v30 & 0x10) == 0) {
            goto LABEL_53;
          }
          goto LABEL_93;
        }

LABEL_92:
        v29 |= 8u;
        *__int128 v73 = v29;
        unsigned __int8 v30 = v15[5];
        if ((v30 & 0x10) == 0)
        {
LABEL_53:
          if ((v30 & 1) == 0) {
            goto LABEL_55;
          }
LABEL_54:
          v29 |= 0x10u;
          *__int128 v73 = v29;
          goto LABEL_55;
        }

LABEL_93:
        v29 |= 0x20u;
        *__int128 v73 = v29;
        if ((v15[5] & 1) != 0) {
          goto LABEL_54;
        }
LABEL_55:
        if (v15[2] >= 2u)
        {
          v29 |= 0x40u;
          *__int128 v73 = v29;
        }

        if (v15[3] || v15[4])
        {
          v29 |= 0x40u;
          *__int128 v73 = v29;
        }

        int v31 = v29 | 0x40;
        if ((v15[5] & 0xE) == 0) {
          int v31 = v29;
        }
        unsigned int v32 = v31 & (v31 & 0x40 ^ 0xFFFFFFC7);
        if ((v31 & 0x78) != 0) {
          int v33 = 3;
        }
        else {
          int v33 = 2;
        }
        if (v15[5] & 0xE | v31 & 0x38 | v31 & 0x40) {
          *__int128 v73 = v32;
        }
        if ((v32 & 4) != 0 && refuse_mppe_stateful)
        {
          error("Refusing MPPE stateful mode offered by peer", (uint64_t)__src, (uint64_t)a3, a4, a5, a6, a7, a8, v64);
          goto LABEL_140;
        }

        if ((~v32 & 3) == 0)
        {
          if ((v28 & 2) != 0)
          {
            char v37 = 70;
          }

          else
          {
            if ((v28 & 1) == 0) {
              goto LABEL_140;
            }
            char v37 = 69;
          }

          LOBYTE(v32) = v32 & v37;
LABEL_115:
          *__int128 v73 = v32;
LABEL_116:
          int v33 = 3;
          goto LABEL_131;
        }

        if ((v32 & 2) != 0)
        {
          if ((v28 & 2) == 0) {
            goto LABEL_140;
          }
        }

        else
        {
          if ((v32 & 1) == 0)
          {
            int v38 = v28 & 3;
            LOBYTE(v32) = v38 | v32;
            if (!v38) {
              goto LABEL_116;
            }
            goto LABEL_115;
          }

          if ((v28 & 1) == 0) {
            goto LABEL_140;
          }
        }

LABEL_131:
        v15[2] = (v32 & 4) == 0;
        *(_WORD *)(v15 + 3) = 0;
        v15[5] = 0;
        unsigned __int8 v42 = (32 * *v73) & 0x40;
        v15[5] = v42;
        if ((*v73 & 1) != 0) {
          v15[5] = v42 | 0x20;
        }
        if (v33 == 2)
        {
          int v84 = *(_DWORD *)v15;
          __int16 v85 = *((_WORD *)v15 + 2);
          __int128 v86 = mppe_send_key;
          if ((int)ccp_test(*v14, (uint64_t)&v84, 22, 1) < 1)
          {
            error("MPPE required, but kernel has no support.", v43, v44, v45, v46, v47, v48, v49, v64);
            lcp_close(*v14, "MPPE required but not available", v51, v52, v53, v54, v55, v56);
          }

          else
          {
            int mtu = netif_get_mtu();
            if (mtu)
            {
              netif_set_mtu(*v14, mtu - 4);
              LODWORD(v18) = 2;
            }

            int v69 = 0;
          }
        }

        else
        {
          int v69 = 0;
          LODWORD(v18) = 3;
        }

LABEL_140:
        unsigned int v19 = 6;
LABEL_10:
        if ((_DWORD)v18 != 3 || v12 == 0) {
          uint64_t v18 = v18;
        }
        else {
          uint64_t v18 = 4LL;
        }
        if ((_DWORD)v18 != 2)
        {
          if ((_DWORD)v18 == 3 && (_DWORD)v16 == 4)
          {
            uint64_t v16 = 4LL;
          }

          else
          {
            if ((_DWORD)v16 == 3 && (_DWORD)v18 == 4) {
              uint64_t v24 = (char *)__src;
            }
            else {
              uint64_t v24 = v17;
            }
            int v17 = &v24[v19];
            uint64_t v16 = v18;
          }
        }

        v15 += v19;
        BOOL v26 = __OFSUB__(v10, v19);
        v10 -= v19;
        if (!((v10 < 0) ^ v26 | (v10 == 0))) {
          continue;
        }
        if ((_DWORD)v16 != 2)
        {
          if ((_DWORD)v16 == 4)
          {
            else {
              *a3 = (_DWORD)v17 - (_DWORD)__src;
            }
            uint64_t v16 = 4LL;
            if (*(_BYTE *)v81 && v69)
            {
              error("MPPE required but peer negotiation failed", (uint64_t)__src, (uint64_t)a3, a4, a5, a6, a7, a8, v64);
              lcp_close(*v14, "MPPE required but peer negotiation failed", v57, v58, v59, v60, v61, v62);
            }
          }

          else
          {
            *a3 = (_DWORD)v17 - (_DWORD)__src;
          }
        }

        return v16;
      case 0x13u:
      case 0x14u:
      case 0x16u:
      case 0x17u:
      case 0x19u:
        goto LABEL_10;
      case 0x15u:
        if (v19 == 3 && *(_BYTE *)v80)
        {
          __int128 v82 = v14;
          *__int128 v74 = 1;
          unsigned int v34 = v15[2] & 0x1F;
          *__int128 v75 = v34;
          if ((v15[2] & 0xE0) == 0x20 && v34 >= 9 && (unsigned __int16)*v68 >= v34)
          {
            LODWORD(v18) = 2;
          }

          else
          {
            if (v12)
            {
              unsigned int v19 = 3;
              LODWORD(v18) = 3;
              goto LABEL_124;
            }

            v15[2] = *(_BYTE *)v68 | 0x20;
            LODWORD(v18) = 3;
          }

          if (v15 != __src)
          {
            unsigned int v19 = 3;
            goto LABEL_124;
          }

          unsigned int v19 = 3;
          int v39 = ccp_test(*v82, (uint64_t)__src, 3, 1);
          if (v39 > 0) {
            goto LABEL_124;
          }
          unsigned int v40 = v34 - 1;
          char v14 = v82;
          while (!(v39 | v12) && v40 != 8)
          {
            v15[2] = v40 | 0x20;
            unsigned int v19 = 3;
            int v39 = ccp_test(*v82, (uint64_t)__src, 3, 1);
            --v40;
            if (v39 > 0)
            {
              LODWORD(v18) = 3;
              goto LABEL_10;
            }
          }

          v15[2] = *(_BYTE *)v75 | 0x20;
          LODWORD(v18) = 4;
          unsigned int v19 = 3;
        }

        goto LABEL_10;
      case 0x18u:
      case 0x1Au:
        if (v19 != 4 || !*v83) {
          goto LABEL_10;
        }
        if (v25 == 26 && !*(_BYTE *)v79 || v25 == 24 && !*v70)
        {
          unsigned int v19 = 4;
          goto LABEL_10;
        }

        __int128 v82 = v14;
        _BYTE *v66 = 1;
        unsigned int v35 = v15[2];
        unsigned int v36 = (v35 >> 4) + 8;
        _WORD *v67 = (v35 >> 4) + 8;
        if ((v15[2] & 0xF) != 8 || v15[3] || (unsigned __int16)*v65 < v36 || v35 <= 0xF)
        {
          if (v12)
          {
            LODWORD(v18) = 3;
            goto LABEL_123;
          }

          v15[2] = 16 * *(_BYTE *)v65 - 120;
          v15[3] = 0;
          LODWORD(v18) = 3;
        }

        else
        {
          LODWORD(v18) = 2;
        }

        if (v15 == __src)
        {
          unsigned int v19 = 4;
          int v41 = ccp_test(*v82, (uint64_t)__src, 4, 1);
          while (v41 <= 0)
          {
            if (v41 | v12 || v36 == 9)
            {
              v15[2] = 16 * *(_BYTE *)v67 - 120;
              unsigned int v19 = 4;
              LODWORD(v18) = 4;
              goto LABEL_124;
            }

            v15[2] = 16 * v36 + 120;
            unsigned int v19 = 4;
            int v41 = ccp_test(*v82, (uint64_t)__src, 4, 1);
            LODWORD(v18) = 3;
            --v36;
          }

          goto LABEL_124;
        }

LABEL_123:
        unsigned int v19 = 4;
LABEL_124:
        char v14 = v82;
        goto LABEL_10;
      default:
        if (v25 == 1)
        {
          if (v19 != 2 || !*(_BYTE *)v77) {
            goto LABEL_10;
          }
          BOOL v27 = v71;
        }

        else
        {
          if (v25 != 2 || v19 != 2 || !*v78) {
            goto LABEL_10;
          }
          BOOL v27 = v72;
        }

        *BOOL v27 = 1;
        unsigned int v19 = 2;
        if (v15 == __src)
        {
          else {
            LODWORD(v18) = 4;
          }
        }

        else
        {
          LODWORD(v18) = 2;
        }

        goto LABEL_10;
    }
  }

void sub_100006374(unsigned int *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (int)v2;
  uint64_t v4 = 7LL * (int)v2;
  unsigned int v5 = &ccp_gotoptions[v4 * 2];
  BOOL v6 = &ccp_hisoptions[v4];
  ccp_flags_set(v2, 1, 1);
  if (v5[1]
    || *v5
    || ccp_gotoptions[14 * (int)v3 + 2]
    || ccp_gotoptions[14 * (int)v3 + 3]
    || ccp_gotoptions[14 * (int)v3 + 6])
  {
    if (HIBYTE(ccp_hisoptions[7 * (int)v3])
      || *v6
      || LOBYTE(ccp_hisoptions[7 * (int)v3 + 1])
      || HIBYTE(ccp_hisoptions[7 * (int)v3 + 1])
      || LOBYTE(ccp_hisoptions[7 * (int)v3 + 3]))
    {
      if (*(unsigned __int16 *)&ccp_gotoptions[14 * v3 + 12] == (unsigned __int16)ccp_hisoptions[7 * v3 + 6])
      {
        int v43 = sub_10000672C((uint64_t)v5, (uint64_t)v6);
        notice("%s compression enabled", v14, v15, v16, v17, v18, v19, v20, v43);
      }

      else
      {
        uint64_t v21 = sub_10000672C((uint64_t)v5, 0LL);
        __strlcpy_chk(v46, v21, 64LL, 64LL);
        sub_10000672C((uint64_t)v6, 0LL);
        notice("%s / %s compression enabled", v22, v23, v24, v25, v26, v27, v28, (int)v46);
      }
    }

    else
    {
      int v45 = sub_10000672C((uint64_t)v5, 0LL);
      notice("%s receive compression enabled", v36, v37, v38, v39, v40, v41, v42, v45);
    }
  }

  else if (HIBYTE(ccp_hisoptions[7 * (int)v3]) {
         || *v6
  }
         || LOBYTE(ccp_hisoptions[7 * (int)v3 + 1])
         || HIBYTE(ccp_hisoptions[7 * (int)v3 + 1])
         || LOBYTE(ccp_hisoptions[7 * (int)v3 + 3]))
  {
    int v44 = sub_10000672C((uint64_t)v6, 0LL);
    notice("%s transmit compression enabled", v29, v30, v31, v32, v33, v34, v35, v44);
  }

  if (ccp_gotoptions[14 * (int)v3 + 6])
  {
    mppe_recv_key = 0uLL;
    mppe_send_key = 0uLL;
    continue_networks(*a1, v7, v8, v9, v10, v11, v12, v13);
  }

void sub_1000065B8(int *a1)
{
  uint64_t v2 = *a1;
  if ((dword_1000462A4[(int)v2] & 1) != 0)
  {
    untimeout((uint64_t)sub_100006980, (uint64_t)a1);
    uint64_t v2 = *a1;
  }

  dword_1000462A4[(int)v2] = 0;
  ccp_flags_set(v2, 1, 0);
  int v10 = *a1;
  uint64_t v11 = &ccp_gotoptions[14 * *a1];
  int v13 = v11[6];
  uint64_t v12 = v11 + 6;
  if (v13)
  {
    *uint64_t v12 = 0;
    if (*((_DWORD *)&lcp_fsm + 20 * v10 + 2) == 9)
    {
      error("MPPE disabled", v3, v4, v5, v6, v7, v8, v9, v20);
      lcp_close(*a1, "MPPE disabled", v14, v15, v16, v17, v18, v19);
    }
  }

uint64_t sub_100006678( unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8 = a3;
  if ((_DWORD)a2 == 15)
  {
    uint64_t v13 = (int)*a1;
    int v14 = dword_1000462A4[v13];
    if ((v14 & 1) != 0 && *((unsigned __int8 *)a1 + 17) == (_DWORD)a3)
    {
      dword_1000462A4[v13] = v14 & 0xFFFFFFFC;
      untimeout((uint64_t)sub_100006980, (uint64_t)a1);
    }

    notice("received CCP RESETACK", a2, a3, a4, a5, a6, a7, a8, v16);
    return 1LL;
  }

  if ((_DWORD)a2 == 14)
  {
    if (a1[2] == 9)
    {
      notice("received CCP RESETREQ", a2, a3, a4, a5, a6, a7, a8, v16);
      fsm_sdata(a1, 15, v8, 0LL, 0LL, v10, v11, v12, v17);
    }

    return 1LL;
  }

  return 0LL;
}

const char *sub_10000672C(uint64_t a1, uint64_t a2)
{
  if (!*(_BYTE *)(a1 + 1) && !*(_BYTE *)a1 && !*(_BYTE *)(a1 + 2) && !*(_BYTE *)(a1 + 3) && !*(_BYTE *)(a1 + 6)) {
    return "(none)";
  }
  int v3 = *(__int16 *)(a1 + 12);
  switch(*(_WORD *)(a1 + 12))
  {
    case 0x12:
      slprintf((int)&unk_100046264, 64, "MPPE ");
      char v6 = *(_BYTE *)(a1 + 6);
      if ((v6 & 2) != 0)
      {
        slprintf((int)&unk_100046269, 59, "128-bit ");
        char v6 = *(_BYTE *)(a1 + 6);
        uint64_t v7 = &unk_100046271;
        if ((v6 & 1) == 0) {
          goto LABEL_24;
        }
      }

      else
      {
        uint64_t v7 = &unk_100046269;
        if ((*(_BYTE *)(a1 + 6) & 1) == 0) {
          goto LABEL_24;
        }
      }

      slprintf((int)v7, &unk_100046264 - (_DWORD)v7 + 64, "40-bit ");
      LODWORD(v7) = (_DWORD)v7 + 7;
      char v6 = *(_BYTE *)(a1 + 6);
LABEL_24:
      if ((v6 & 4) != 0) {
        char v8 = "stateful";
      }
      else {
        char v8 = "stateless";
      }
      slprintf((int)v7, &unk_100046264 - (_DWORD)v7 + 64, v8);
      uint64_t v4 = &unk_100046264;
      break;
    case 0x13:
    case 0x14:
    case 0x16:
    case 0x17:
    case 0x19:
      goto LABEL_13;
    case 0x15:
      if (!a2 || *(unsigned __int16 *)(a2 + 8) == *(unsigned __int16 *)(a1 + 8))
      {
        uint64_t v4 = &unk_100046264;
        uint64_t v5 = "BSD-Compress (%d)";
      }

      else
      {
        uint64_t v4 = &unk_100046264;
        uint64_t v5 = "BSD-Compress (%d/%d)";
      }

      goto LABEL_29;
    case 0x18:
    case 0x1A:
      if (!a2 || *(unsigned __int16 *)(a2 + 10) == *(unsigned __int16 *)(a1 + 10))
      {
        uint64_t v4 = &unk_100046264;
        uint64_t v5 = "Deflate%s (%d)";
      }

      else
      {
        uint64_t v4 = &unk_100046264;
        uint64_t v5 = "Deflate%s (%d/%d)";
      }

      goto LABEL_29;
    default:
      if (v3 == 1) {
        return "Predictor 1";
      }
      if (v3 == 2) {
        return "Predictor 2";
      }
LABEL_13:
      uint64_t v4 = &unk_100046264;
      uint64_t v5 = "Method %d";
LABEL_29:
      slprintf((int)&unk_100046264, 64, v5);
      return (const char *)v4;
  }

  return (const char *)v4;
}

void sub_100006980( int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *a1;
  if (a1[2] != 9 || (dword_1000462A4[v8] & 2) == 0)
  {
    unsigned int v11 = dword_1000462A4[v8] & 0xFFFFFFFE;
  }

  else
  {
    fsm_sdata((unsigned int *)a1, 14, *((_BYTE *)a1 + 17), 0LL, 0LL, a6, a7, a8, v12);
    timeout((int)sub_100006980);
    uint64_t v8 = *a1;
    unsigned int v11 = dword_1000462A4[v8] & 0xFFFFFFFD;
  }

  dword_1000462A4[v8] = v11;
}

double mppe_set_keys(const void *a1, const void *a2)
{
  double result = md[0];
  mppe_send_key = *(_OWORD *)md;
  mppe_recv_key = *(_OWORD *)md;
  return result;
}

void ChapMS(const void *a1, char *a2, int a3, uint64_t a4)
{
  *(_BYTE *)(a4 + 48) = 0;
  *(_OWORD *)(a4 + 16) = 0u;
  *(_OWORD *)(a4 + 32) = 0u;
  *(_OWORD *)a4 = 0u;
  uint64_t v8 = (_BYTE *)(a4 + 24);
  sub_100007058(a2, a3, data);
  CC_MD4(data, 2 * a3, (unsigned __int8 *)&md);
  sub_1000070B0((uint64_t)a1, &md, v8, v9, v10);
  *(_BYTE *)(a4 + 48) = 1;
  sub_100007058(a2, a3, data);
  CC_MD4(data, 2 * a3, (unsigned __int8 *)&md);
  CC_MD4(&md, 0x10u, v11);
  mppe_set_keys(a1, v11);
  mppe_keys_set = 1;
}

uint64_t ChapMS2(const void *a1, _OWORD *a2, char *__s, char *a4, int a5, _BYTE *a6, char *a7, int a8)
{
  a6[48] = 0;
  *((_OWORD *)a6 + 1) = 0u;
  *((_OWORD *)a6 + 2) = 0u;
  *(_OWORD *)a6 = 0u;
  if (a2)
  {
    *(_OWORD *)a6 = *a2;
  }

  else
  {
    for (uint64_t i = 0LL; i != 16; ++i)
    {
      double v16 = drand48() * 254.0;
      a6[i] = (int)v16 + 1;
      byte_1000462A8[i] = (int)v16 + 1;
    }
  }

  int v17 = a6 + 24;
  sub_10000715C(a6, a1, __s, v28);
  sub_100007058(a4, a5, data);
  CC_MD4(data, 2 * a5, (unsigned __int8 *)&md);
  sub_1000070B0((uint64_t)v28, (__int128 *)&md, a6 + 24, v18, v19);
  qmemcpy(v27, "Magic server to client signing constant", 39);
  qmemcpy(v28, "Pad to make it do more than one iteration", 41);
  sub_100007058(a4, a5, data);
  CC_MD4(data, 2 * a5, v30);
  CC_MD4(v30, 0x10u, v29);
  CC_SHA1_Init(&md);
  CC_SHA1_Update(&md, v29, 0x10u);
  CC_SHA1_Update(&md, a6 + 24, 0x18u);
  CC_SHA1_Update(&md, v27, 0x27u);
  int v20 = v33;
  CC_SHA1_Final(v33, &md);
  sub_10000715C(a6, a1, __s, v37);
  CC_SHA1_Init(&md);
  CC_SHA1_Update(&md, v33, 0x14u);
  CC_SHA1_Update(&md, v37, 8u);
  size_t v21 = 41LL;
  CC_SHA1_Update(&md, v28, 0x29u);
  CC_SHA1_Final(v33, &md);
  do
  {
    int v22 = *v20++;
    snprintf(a7, v21, "%02X", v22);
    v21 -= 2LL;
    a7 += 2;
  }

  while (v21 != 1);
  uint64_t v35 = 0LL;
  *(_OWORD *)uint64_t v33 = 0u;
  __int128 v34 = 0u;
  unint64_t v32 = 0xF2F2F2F2F2F2F2F2LL;
  *(void *)&__int128 v23 = 0xF2F2F2F2F2F2F2F2LL;
  *((void *)&v23 + 1) = 0xF2F2F2F2F2F2F2F2LL;
  *(_OWORD *)uint64_t v30 = v23;
  __int128 v31 = v23;
  qmemcpy(v29, "This is the MPPE Master Key", 27);
  qmemcpy(v28, "On the client side, this is the send key; on the server side, it is the receive key.", 84);
  qmemcpy(v27, "On the client side, this is the receive key; on the server side, it is the send key.", 84);
  sub_100007058(a4, a5, data);
  CC_MD4(data, 2 * a5, v39);
  CC_MD4(v39, 0x10u, v38);
  CC_SHA1_Init(&md);
  CC_SHA1_Update(&md, v38, 0x10u);
  CC_SHA1_Update(&md, v17, 0x18u);
  CC_SHA1_Update(&md, v29, 0x1Bu);
  CC_SHA1_Final(v37, &md);
  CC_SHA1_Init(&md);
  CC_SHA1_Update(&md, v37, 0x10u);
  CC_SHA1_Update(&md, v33, 0x28u);
  if (a8) {
    uint64_t v24 = v27;
  }
  else {
    uint64_t v24 = v28;
  }
  if (a8) {
    uint64_t v25 = v28;
  }
  else {
    uint64_t v25 = v27;
  }
  CC_SHA1_Update(&md, v24, 0x54u);
  CC_SHA1_Update(&md, v30, 0x28u);
  CC_SHA1_Final(v36, &md);
  mppe_send_key = *(_OWORD *)v36;
  CC_SHA1_Init(&md);
  CC_SHA1_Update(&md, v37, 0x10u);
  CC_SHA1_Update(&md, v33, 0x28u);
  CC_SHA1_Update(&md, v25, 0x54u);
  CC_SHA1_Update(&md, v30, 0x28u);
  uint64_t result = CC_SHA1_Final(v36, &md);
  mppe_recv_key = *(_OWORD *)v36;
  mppe_keys_set = 1;
  return result;
}

void *chapms_init()
{
  return add_options((uint64_t)&unk_1000462B8);
}

void chapms_reinit()
{
  byte_100046318 = 0;
  byte_1000462A8 = 0;
}

void sub_100007058(char *a1, int a2, _BYTE *a3)
{
  int v3 = a3;
  bzero(a3, 2 * a2);
  if (a2 >= 1)
  {
    uint64_t v6 = a2;
    do
    {
      char v7 = *a1++;
      *int v3 = v7;
      v3 += 2;
      --v6;
    }

    while (v6);
  }

uint64_t sub_1000070B0(uint64_t a1, __int128 *a2, _BYTE *a3, double a4, uint8x8_t a5)
{
  char v14 = 0;
  int v13 = 0;
  __int128 v12 = *a2;
  DesSetkey((uint64_t)&v12, *(uint8x8_t *)&v12, a5);
  DesEncrypt(a1, a3);
  DesSetkey((uint64_t)&v12 + 7, v7, v8);
  DesEncrypt(a1, a3 + 8);
  DesSetkey((unint64_t)&v12 | 0xE, v9, v10);
  return DesEncrypt(a1, a3 + 16);
}

uint64_t sub_10000715C(const void *a1, const void *a2, char *__s, void *a4)
{
  uint64_t v5 = __s;
  uint8x8_t v8 = strrchr(__s, 92);
  if (v8) {
    uint64_t v5 = v8 + 1;
  }
  CC_SHA1_Init(&v11);
  CC_SHA1_Update(&v11, a1, 0x10u);
  CC_SHA1_Update(&v11, a2, 0x10u);
  CC_LONG v9 = strlen(v5);
  CC_SHA1_Update(&v11, v5, v9);
  uint64_t result = CC_SHA1_Final(md, &v11);
  *a4 = *(void *)md;
  return result;
}

_BYTE *sub_100007228(_BYTE *a1)
{
  *a1 = 8;
  return random_bytes(a1 + 1, 8);
}

uint64_t sub_100007238( int a1, uint64_t a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a8;
  int v9 = a7;
  if (*(_BYTE *)a6 == 49)
  {
    if (*(_BYTE *)(a6 + 49))
    {
      ChapMS((const void *)(a5 + 1), a3, a4, (uint64_t)v15);
      if (*(void *)(a6 + 25) == v16 && *(void *)(a6 + 33) == v17 && *(void *)(a6 + 41) == v18)
      {
        slprintf(v9, v8, "Access granted");
        return 1LL;
      }
    }

    else
    {
      notice("Peer request for LANMAN auth not supported", a2, (uint64_t)a3, a4, a5, a6, a7, a8, v14);
    }
  }

  slprintf(v9, v8, "E=691 R=1 C=%0.*B V=0");
  return 0LL;
}

void sub_100007340(_BYTE *a1, int a2, int a3, uint64_t a4, char *a5, int a6)
{
  *a1 = 49;
  ChapMS((const void *)(a4 + 1), a5, a6, (uint64_t)(a1 + 1));
}

uint64_t sub_100007360(const void *a1, int a2, char *a3, int a4)
{
  int v8 = (char *)malloc(a2 + 1);
  if (!v8)
  {
    notice("Out of memory in chapms_handle_failure", v9, v10, v11, v12, v13, v14, v15, v50);
    return 0LL;
  }

  uint64_t v16 = v8;
  memcpy(v8, a1, a2);
  uint64_t v17 = &v16[a2];
  *uint64_t v17 = 0;
  if (!strncmp(v16, "E=", 2uLL))
  {
    int v27 = strtol(v16 + 2, 0LL, 10);
    int v28 = v27;
    if (a2)
    {
      uint64_t v29 = strstr(v16, " R=");
      if (v29)
      {
        if (retry_password_hook) {
          BOOL v30 = v29[3] == 49;
        }
        else {
          BOOL v30 = 0;
        }
        if (v30) {
          unsigned int v31 = 2;
        }
        else {
          unsigned int v31 = 0;
        }
      }

      else
      {
        unsigned int v31 = 0;
      }

      if (change_password_hook) {
        BOOL v33 = v28 == 648;
      }
      else {
        BOOL v33 = 0;
      }
      if (v33) {
        uint64_t v25 = 1LL;
      }
      else {
        uint64_t v25 = v31;
      }
      __int128 v34 = strstr(v16, " M=");
      if (v34)
      {
        LODWORD(v17) = (_DWORD)v34 + 3;
        strncpy(a3, v34 + 3, a4 - 1);
        a3[a4] = 0;
        goto LABEL_4;
      }
    }

    else
    {
      uint64_t v25 = v27 == 648 && change_password_hook != 0;
    }

    int v35 = v28 - 646;
    uint64_t v17 = "E=646 Restricted logon hours";
    switch(v35)
    {
      case 0:
        goto LABEL_4;
      case 1:
        uint64_t v17 = "E=647 Account disabled";
        goto LABEL_4;
      case 2:
        uint64_t v17 = "E=648 Password expired";
        goto LABEL_4;
      case 3:
        uint64_t v17 = "E=649 No dialin permission";
        goto LABEL_4;
      default:
        if ("E=646 Restricted logon hours" == 691)
        {
          uint64_t v17 = "E=691 Authentication failure";
          goto LABEL_4;
        }

        if ("E=646 Restricted logon hours" == 709)
        {
          uint64_t v17 = "E=709 Error changing password";
          goto LABEL_4;
        }

        free(v16);
        error("error %d", v36, v37, v38, v39, v40, v41, v42, (int)"E=646 Restricted logon hours");
        error("Unknown MS-CHAP authentication failure: %.*v", v43, v44, v45, v46, v47, v48, v49, a2);
        break;
    }

    return 0LL;
  }

  uint64_t v25 = 0LL;
LABEL_4:
  error("MS-CHAP authentication failed: %v", v18, v19, v20, v21, v22, v23, v24, (int)v17);
  free(v16);
  return v25;
}

_BYTE *sub_100007584(_BYTE *a1)
{
  *a1 = 16;
  return random_bytes(a1 + 1, 16);
}

uint64_t sub_100007594(int a1, char *__s, char *a3, int a4, uint64_t a5, uint64_t a6, int a7, int a8)
{
  if (*(_BYTE *)a6 == 49
    && ((ChapMS2((const void *)(a5 + 1), (_OWORD *)(a6 + 1), __s, a3, a4, v16, v15, 1), v17 == *(void *)(a6 + 25))
      ? (BOOL v11 = v18 == *(void *)(a6 + 33))
      : (BOOL v11 = 0),
        v11 ? (BOOL v12 = v19 == *(void *)(a6 + 41)) : (BOOL v12 = 0),
        v12))
  {
    if (*(_BYTE *)(a6 + 49)) {
      uint64_t v14 = "S=%s";
    }
    else {
      uint64_t v14 = "S=%s M=%s";
    }
    slprintf(a7, a8, v14);
    return 1LL;
  }

  else
  {
    slprintf(a7, a8, "E=691 R=1 C=%0.*B V=0 M=%s");
    return 0LL;
  }

uint64_t sub_1000076CC(_BYTE *a1, int a2, char *a3, uint64_t a4, char *a5, int a6, char *a7)
{
  char v7 = a2;
  *a1 = 49;
  if (byte_1000462A8[0]) {
    BOOL v8 = byte_100046318 == a2;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8) {
    uint64_t v9 = byte_1000462A8;
  }
  else {
    uint64_t v9 = 0LL;
  }
  uint64_t result = ChapMS2((const void *)(a4 + 1), v9, a3, a5, a6, a1 + 1, a7, 0);
  byte_100046318 = v7;
  return result;
}

uint64_t sub_100007730( const char *a1, uint64_t a2, const void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a2 - 42;
  unsigned int v10 = a2;
  if (strncmp(a1, "S=", 2uLL)) {
    goto LABEL_3;
  }
  if (memcmp(a1 + 2, a3, 0x28uLL))
  {
    BOOL v12 = "MS-CHAPv2 mutual authentication failed.";
    goto LABEL_4;
  }

  uint64_t v14 = a1 + 42;
  if (v10 < 0x2D)
  {
    if (v8)
    {
      dbglog("Rcvd non-conforming MSCHAPv2 Success packet, len=%d", a2, (uint64_t)a3, a4, a5, a6, a7, a8, v8);
      if (v10 < 0x2C) {
        goto LABEL_3;
      }
      goto LABEL_12;
    }
  }

  else if (strncmp(v14, " M=", 3uLL))
  {
    dbglog("Rcvd non-conforming MSCHAPv2 Success packet, len=%d", v15, v16, v17, v18, v19, v20, v21, v8);
LABEL_12:
    if (!strncmp(v14, "M=", 2uLL)) {
      return 1LL;
    }
LABEL_3:
    BOOL v12 = "MS-CHAPv2 Success packet is badly formed.";
LABEL_4:
    error(v12, a2, (uint64_t)a3, a4, a5, a6, a7, a8, v22);
    return 0LL;
  }

  return 1LL;
}

uint64_t sub_100007824(uint64_t a1, char *a2, _BYTE *a3, char *a4, int a5, char *a6, int a7, char *a8)
{
  int v13 = a3[2];
  int v14 = a3[3];
  *(_BYTE *)a1 = 7;
  *(_BYTE *)(a1 + 1) = a3[1] + 1;
  *(_WORD *)(a1 + 2) = 18946;
  sub_100007058(a4, a5, data);
  CC_MD4(data, 2 * a5, md);
  sub_100007058(a6, a7, __src);
  random_bytes(v39, 516);
  memcpy(&v39[512 - 2 * a7], __src, 2 * a7);
  uint64_t v15 = 0LL;
  int v40 = 2 * a7;
  int8x16_t v16 = (int8x16_t)xmmword_100037100;
  v17.i64[0] = 0x1010101010101010LL;
  v17.i64[1] = 0x1010101010101010LL;
  do
  {
    *(int8x16_t *)&v41[v15] = v16;
    v15 += 16LL;
    int8x16_t v16 = vaddq_s8(v16, v17);
  }

  while (v15 != 256);
  uint64_t v18 = 0LL;
  unsigned __int8 v19 = 0;
  __int16 v43 = 0;
  int v20 = v14 | (v13 << 8);
  do
  {
    unsigned __int8 v21 = v41[v18];
    v19 += v21 + md[v18 & 0xF];
    v41[v18] = v41[v19];
    v41[v19] = v21;
    ++v18;
  }

  while (v18 != 256);
  uint64_t v22 = 0LL;
  int v23 = v43;
  int v24 = HIBYTE(v43);
  do
  {
    int v25 = v41[++v23];
    v24 += v25;
    v41[v23] = v41[v24];
    v41[v24] = v25;
    *(_BYTE *)(a1 + 4 + v22) = v41[(v41[v23] + v25)] ^ v39[v22];
    ++v22;
  }

  while (v22 != 516);
  sub_100007058(a4, a5, v39);
  CC_MD4(v39, 2 * a5, __src);
  sub_100007058(a6, a7, data);
  CC_MD4(data, 2 * a7, v41);
  DesSetkey((uint64_t)v41, v26, v27);
  DesEncrypt((uint64_t)__src, (_BYTE *)(a1 + 520));
  DesSetkey((uint64_t)v42, v28, v29);
  DesEncrypt((uint64_t)v37, (_BYTE *)(a1 + 528));
  int v30 = v20 - 4;
  if (v20 != 4)
  {
    unsigned int v31 = a3 + 7;
    while (strncmp((const char *)v31 - 3, " C=", 3uLL))
    {
      ++v31;
      if (!--v30) {
        goto LABEL_13;
      }
    }

    sub_100007C34(v31, (uint64_t)v39);
    ChapMS2(v39, 0LL, a2, a6, a7, (_BYTE *)(a1 + 536), a8, 0);
  }

LABEL_13:
  *(_BYTE *)(a1 + 585) = 0;
  return 0LL;
}

  *((void *)v16 + 4) = v20;
  *unsigned __int8 v19 = (uint64_t)v16;
}

    sub_10001CA2C((uint64_t)a1, v10);
  }

  return 0LL;
}

  unsigned __int8 v19 = 0;
  if (v18 && v14[1] == 4 && v13 >= 4)
  {
    if (*v14 != 2)
    {
      unsigned __int8 v19 = 0;
LABEL_22:
      __int128 v34 = v3;
      uint64_t v36 = v12;
      uint64_t v38 = v9;
      unint64_t v32 = v8;
      unsigned __int8 v21 = (_DWORD *)((char *)&ipv6cp_gotoptions + 52 * v5 + 28);
      uint64_t v22 = (char *)&ipv6cp_gotoptions + 52 * v5;
      int v23 = v22 + 8;
      int v24 = v22 + 44;
      while (1)
      {
        int v25 = v14[1];
        v13 -= v25;
        if (v13 < 0) {
          return 0LL;
        }
        uint8x8_t v26 = *v14;
        if (v26 == 1)
        {
          if ((_DWORD)v25 != 10 || *(_DWORD *)v6 != 0 || v4 != 0) {
            return 0LL;
          }
          if (*v23)
          {
            unsigned int v10 = *(_DWORD *)(v14 + 6);
            uint8x8_t v29 = *(_DWORD *)(v14 + 2);
            for (j = v29; ; j = v29 & 0xFD)
            {
              BOOL v11 = v29 & 0xFFFFFF00 | j;
              if (v11 | v10)
              {
                if (v11 != *v24 || v10 != v24[1]) {
                  break;
                }
              }

              uint8x8_t v29 = magic();
              unsigned int v10 = magic();
            }
          }

          uint64_t v4 = 1;
          char v7 = 1;
        }

        else if (v26 == 2)
        {
          int v20 = 0LL;
          if ((_DWORD)v25 != 4 || *v21 || v19) {
            return v20;
          }
          unsigned __int8 v19 = 1;
        }

        v14 += v25;
        if (v13 <= 1)
        {
          int v3 = v34;
          BOOL v12 = v36;
          int v8 = v32;
          uint64_t v9 = v38;
          if (v13) {
            return 0LL;
          }
          goto LABEL_48;
        }
      }
    }

    int v8 = 0;
    v14 += 4;
    unsigned __int8 v19 = 1;
    v13 -= 4;
  }

  if (v13 >= 2) {
    goto LABEL_22;
  }
  if (v13) {
    return 0LL;
  }
LABEL_48:
  if (v3[2] != 9)
  {
    *(_DWORD *)uint64_t v6 = v7;
    *(_OWORD *)(v6 + 4) = v39;
    *(void *)(v6 + 20) = v40;
    *((_DWORD *)v6 + 7) = v8;
    *((_DWORD *)v6 + 8) = v9;
    *((_DWORD *)v6 + 9) = v11;
    *((_DWORD *)v6 + 10) = v10;
    *(void *)(v6 + 44) = v12;
  }

  return 1LL;
}

uint64_t sub_100007AF4(_BYTE *a1, char *__s, uint64_t a3, char *a4, int a5, char *a6)
{
  int v12 = strlen(__s);
  unsigned int v13 = __rev16(*(unsigned __int16 *)(a3 + 2));
  *a1 = 2;
  a1[1] = *(_BYTE *)(a3 + 1) + 1;
  a1[2] = (unsigned __int16)(v12 + 54) >> 8;
  a1[3] = v12 + 54;
  unsigned int v14 = v13 - 4;
  if (v13 != 4)
  {
    for (uint64_t i = (unsigned __int8 *)(a3 + 7); strncmp((const char *)i - 3, " C=", 3uLL); ++i)
    {
      if (!--v14) {
        return 0LL;
      }
    }

    sub_100007C34(i, (uint64_t)v17);
    a1[4] = 49;
    ChapMS2(v17, 0LL, __s, a4, a5, a1 + 5, a6, 0);
    memcpy(a1 + 54, __s, v12);
  }

  return 0LL;
}

unsigned __int8 *sub_100007C34(unsigned __int8 *result, uint64_t a2)
{
  for (uint64_t i = 0LL; i != 64; ++i)
  {
    int v3 = *result;
    char v4 = v3 - 48;
    if ((v3 - 48) >= 0xA)
    {
      if ((v3 - 97) > 5)
      {
        else {
          char v4 = v3 - 55;
        }
      }

      else
      {
        char v4 = v3 - 87;
      }
    }

    char v5 = 16 * v4;
    *(_BYTE *)(a2 + i) = 16 * v4;
    int v6 = result[1];
    char v7 = v6 - 48;
    if ((v6 - 48) >= 0xA)
    {
      if ((v6 - 97) > 5)
      {
        char v7 = v6 - 55;
      }

      else
      {
        char v7 = v6 - 87;
      }
    }

    *(_BYTE *)(a2 + i) = v7 | v5;
LABEL_14:
    result += 2;
  }

  return result;
}

uint64_t demand_conf()
{
  framemax = 1506;
  frame = (uint64_t)malloc(0x5E2uLL);
  if (!frame) {
    novm((int)"demand frame", v0, v1, v2, v3, v4, v5, v6);
  }
  framelen = 0;
  pend_q = 0LL;
  escape_flag = 0;
  flush_flag = 0;
  fcs = 0xFFFF;
  if (dword_1000439A8 >= 1500) {
    int v7 = 1500;
  }
  else {
    int v7 = dword_1000439A8;
  }
  netif_set_mtu(0LL, v7);
  if ((ppp_send_config(0LL, 1500LL, 0LL, 0LL, 0LL) & 0x80000000) != 0
    || (uint64_t result = ppp_recv_config(0LL, 1500LL, 0LL, 0LL, 0LL), (result & 0x80000000) != 0))
  {
    fatal("Couldn't set up demand-dialled PPP interface: %m", v8, v9, v10, v11, v12, v13, v14, v20);
  }

  int8x16_t v16 = protocols;
  if (protocols)
  {
    int8x16_t v17 = (__int16 **)&off_10003F898;
    do
    {
      if (*((_BYTE *)v16 + 80))
      {
        uint64_t v18 = (uint64_t (*)(void))*((void *)v16 + 15);
        if (v18)
        {
          uint64_t result = v18(0LL);
          if (!(_DWORD)result) {
            die(1);
          }
        }
      }

      unsigned __int8 v19 = *v17++;
      int8x16_t v16 = v19;
    }

    while (v19);
  }

  return result;
}

uint64_t demand_block()
{
  uint64_t v0 = protocols;
  if (protocols)
  {
    uint64_t v1 = (__int16 **)&off_10003F898;
    do
    {
      if (*((_BYTE *)v0 + 80) && *((void *)v0 + 15)) {
        sifnpmode(0LL, *v0 & 0x7FFF, 3);
      }
      uint64_t v2 = *v1++;
      uint64_t v0 = v2;
    }

    while (v2);
  }

  return get_loop_output();
}

void *demand_discard()
{
  uint64_t v0 = protocols;
  if (protocols)
  {
    uint64_t v1 = (__int16 **)&off_10003F898;
    do
    {
      if (*((_BYTE *)v0 + 80) && *((void *)v0 + 15)) {
        sifnpmode(0LL, *v0 & 0x7FFF, 2);
      }
      uint64_t v2 = *v1++;
      uint64_t v0 = v2;
    }

    while (v2);
  }

  get_loop_output();
  uint64_t result = (void *)pend_q;
  if (pend_q)
  {
    do
    {
      uint64_t v4 = (void *)result[1];
      free(result);
      uint64_t result = v4;
    }

    while (v4);
  }

  pend_q = 0LL;
  framelen = 0;
  flush_flag = 0;
  escape_flag = 0;
  fcs = 0xFFFF;
  return result;
}

uint64_t demand_unblock()
{
  uint64_t v0 = protocols;
  if (protocols)
  {
    uint64_t v1 = (__int16 **)&off_10003F898;
    do
    {
      if (*((_BYTE *)v0 + 80))
      {
        if (*((void *)v0 + 15)) {
          uint64_t result = sifnpmode(0LL, *v0 & 0x7FFF, 0);
        }
      }

      uint64_t v3 = *v1++;
      uint64_t v0 = v3;
    }

    while (v3);
  }

  return result;
}

uint64_t loop_chars( unsigned __int8 *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2 >= 1)
  {
    uint64_t v9 = 0LL;
    int v10 = a2 + 1;
    while (1)
    {
      int v12 = *a1++;
      int v11 = v12;
      if (v12 == 126)
      {
        int v13 = framelen;
        if (escape_flag) {
          BOOL v14 = 0;
        }
        else {
          BOOL v14 = flush_flag == 0;
        }
        if (v14 && framelen >= 3 && fcs == 61624)
        {
          framelen -= 2;
          else {
            uint64_t v9 = v9;
          }
        }

        framelen = 0;
        flush_flag = 0;
        escape_flag = 0;
        fcs = 0xFFFF;
        goto LABEL_20;
      }

      if (!flush_flag)
      {
        if (escape_flag)
        {
          LOBYTE(v11) = v11 ^ 0x20;
          escape_flag = 0;
LABEL_26:
          uint64_t v17 = framelen;
          if (framelen >= framemax)
          {
            flush_flag = 1;
          }

          else
          {
            ++framelen;
            *(_BYTE *)(frame + v17) = v11;
            fcs = word_100037110[(fcs ^ v11)] ^ (fcs >> 8);
          }

          goto LABEL_20;
        }

        if (v11 != 125) {
          goto LABEL_26;
        }
        escape_flag = 1;
      }

uint64_t loop_frame( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v10 = protocols;
  if (!protocols) {
    return 0LL;
  }
  for (uint64_t i = (__int16 **)&off_10003F898; ; ++i)
  {
    unsigned int v12 = (unsigned __int16)*v10;
    unsigned int v13 = v12 >> 14;
    int v14 = v12 & 0x7FFF;
    int8x16_t v16 = *i;
    int v10 = v16;
    if (!v16) {
      return 0LL;
    }
  }

  if (!*((_BYTE *)v10 + 80)) {
    return 0LL;
  }
  uint64_t v18 = (uint64_t (*)(uint64_t, uint64_t))*((void *)v10 + 16);
  if (!v18 || (uint64_t result = v18(a1, a2), (_DWORD)result))
  {
    unsigned __int8 v19 = malloc(a2 + 24LL);
    if (v19)
    {
      uint64_t v20 = (uint64_t)v19;
      *(_DWORD *)unsigned __int8 v19 = a2;
      v19[1] = 0LL;
      memcpy(v19 + 2, (const void *)a1, a2);
      unsigned __int8 v21 = &pend_q;
      if (pend_q) {
        unsigned __int8 v21 = (uint64_t *)(pend_qtail + 8);
      }
      *unsigned __int8 v21 = v20;
      pend_qtail = v20;
    }

    return 1LL;
  }

  return result;
}

void demand_rexmit( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = pend_q;
  pend_q = 0LL;
  if (!v8)
  {
    unsigned int v12 = &pend_qtail;
    goto LABEL_13;
  }

  uint64_t v10 = 0LL;
  do
  {
    while (1)
    {
      int v11 = (unsigned __int16 *)v8;
      uint64_t v8 = *(void *)(v8 + 8);
      if (a1 != bswap32(v11[9]) >> 16) {
        break;
      }
      output(0LL, (uint64_t)(v11 + 8), *(unsigned int *)v11, a4, a5, a6, a7, a8, v13);
      free(v11);
      if (!v8) {
        goto LABEL_10;
      }
    }

    if (v10) {
      *(void *)(v10 + 8) = v11;
    }
    else {
      pend_q = (uint64_t)v11;
    }
    uint64_t v10 = (uint64_t)v11;
  }

  while (v8);
LABEL_10:
  pend_qtail = v10;
  if (v10)
  {
    unsigned int v12 = (uint64_t *)(v10 + 8);
LABEL_13:
    *unsigned int v12 = 0LL;
  }

double fsm_init(uint64_t a1)
{
  *(_BYTE *)(a1 + 16) = 0;
  *(void *)(a1 + 8) = 0LL;
  *(void *)&double result = 0xA00000003LL;
  *(void *)(a1 + 20) = 0xA00000003LL;
  *(_DWORD *)(a1 + 32) = 2;
  *(_DWORD *)(a1 + 40) = 5;
  *(_DWORD *)(a1 + 48) = 255;
  *(_DWORD *)(a1 + 72) = 0;
  return result;
}

void fsm_lowerup( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9 = *(_DWORD *)(a1 + 8);
  if (v9)
  {
    if (v9 != 1) {
      return;
    }
    if ((*(_BYTE *)(a1 + 12) & 4) != 0)
    {
      int v10 = 3;
    }

    else
    {
      sub_1000082DC((int *)a1, 0, a3, a4, a5, a6, a7, a8);
      int v10 = 6;
    }
  }

  else
  {
    int v10 = 2;
  }

  *(_DWORD *)(a1 + 8) = v10;
}

void sub_1000082DC(int *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((a1[2] - 6) >= 3)
  {
    int v10 = (void (*)(int *))**((void **)a1 + 7);
    if (v10) {
      v10(a1);
    }
    a1[9] = 0;
    a1[11] = 0;
  }

  if (!a2)
  {
    a1[7] = a1[6];
    char v11 = *((_BYTE *)a1 + 16) + 1;
    *((_BYTE *)a1 + 16) = v11;
    *((_BYTE *)a1 + 17) = v11;
    ++a1[11];
  }

  *((_BYTE *)a1 + 18) = 0;
  uint64_t v12 = *((void *)a1 + 7);
  int v13 = *(uint64_t (**)(int *))(v12 + 8);
  if (v13 && *(void *)(v12 + 16))
  {
    int v14 = v13(a1);
    int v15 = peer_mru[*a1] - 4;
    if (v14 >= v15) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = v14;
    }
    unsigned int v19 = v16;
    uint64_t v17 = *(void (**)(int *, char *, unsigned int *))(*((void *)a1 + 7) + 16LL);
    if (v17)
    {
      v17(a1, &byte_100044124, &v19);
      uint64_t v16 = v19;
    }
  }

  else
  {
    uint64_t v16 = 0LL;
    unsigned int v19 = 0;
  }

  fsm_sdata((unsigned int *)a1, 1, *((_BYTE *)a1 + 17), &byte_100044124, v16, a6, a7, a8, v18);
  --a1[7];
  timeout((int)sub_1000084B8);
}

void fsm_lowerdown(uint64_t a1)
{
  switch(*(_DWORD *)(a1 + 8))
  {
    case 2:
      *(_DWORD *)(a1 + 8) = 0;
      break;
    case 3:
      *(_DWORD *)(a1 + 8) = 1;
      uint64_t v2 = *(void (**)(uint64_t))(*(void *)(a1 + 56) + 72LL);
      if (v2) {
        v2(a1);
      }
      break;
    case 4:
      *(_DWORD *)(a1 + 8) = 0;
      goto LABEL_3;
    case 5:
    case 6:
    case 7:
    case 8:
      *(_DWORD *)(a1 + 8) = 1;
LABEL_3:
      untimeout((uint64_t)sub_1000084B8, a1);
      break;
    case 9:
      uint64_t v3 = *(void (**)(uint64_t))(*(void *)(a1 + 56) + 64LL);
      if (v3) {
        v3(a1);
      }
      *(_DWORD *)(a1 + 8) = 1;
      break;
    default:
      return;
  }

void sub_1000084B8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9 = *(_DWORD *)(a1 + 8);
  if ((v9 - 6) >= 3)
  {
    if (*(int *)(a1 + 28) > 0)
    {
      char v12 = *(_BYTE *)(a1 + 16) + 1;
      *(_BYTE *)(a1 + 16) = v12;
      *(_BYTE *)(a1 + 17) = v12;
      fsm_sdata((unsigned int *)a1, 5, v12, *(char **)(a1 + 64), *(unsigned int *)(a1 + 72), a6, a7, a8, v15);
      timeout((int)sub_1000084B8);
      --*(_DWORD *)(a1 + 28);
      return;
    }

    if (v9 == 4) {
      int v13 = 2;
    }
    else {
      int v13 = 3;
    }
    *(_DWORD *)(a1 + 8) = v13;
  }

  else
  {
    uint64_t v10 = *(void *)(a1 + 56);
    if (*(int *)(a1 + 28) > 0)
    {
      char v11 = *(void (**)(uint64_t))(v10 + 96);
      if (v11) {
        v11(a1);
      }
      sub_1000082DC(a1, 1LL);
      if (*(_DWORD *)(a1 + 8) == 7) {
        *(_DWORD *)(a1 + 8) = 6;
      }
      return;
    }

    warning("%s: timeout sending Config-Requests\n", a2, a3, a4, a5, a6, a7, a8, *(void *)(v10 + 112));
    *(_DWORD *)(a1 + 8) = 3;
    if ((*(_BYTE *)(a1 + 12) & 1) != 0) {
      return;
    }
  }

  int v14 = *(void (**)(uint64_t))(*(void *)(a1 + 56) + 80LL);
  if (v14) {
    v14(a1);
  }
}

void fsm_open( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  switch(*(_DWORD *)(a1 + 8))
  {
    case 0:
      *(_DWORD *)(a1 + 8) = 1;
      int v9 = *(void (**)(uint64_t))(*(void *)(a1 + 56) + 72LL);
      if (v9) {
        v9(a1);
      }
      break;
    case 2:
      if ((*(_BYTE *)(a1 + 12) & 4) != 0)
      {
        int v17 = 3;
      }

      else
      {
        sub_1000082DC((int *)a1, 0, a3, a4, a5, a6, a7, a8);
        int v17 = 6;
      }

      *(_DWORD *)(a1 + 8) = v17;
      break;
    case 3:
    case 9:
      goto LABEL_5;
    case 4:
      *(_DWORD *)(a1 + 8) = 5;
LABEL_5:
      if ((*(_BYTE *)(a1 + 12) & 2) != 0)
      {
        fsm_lowerdown(a1);
        fsm_lowerup(a1, v10, v11, v12, v13, v14, v15, v16);
      }

      break;
    default:
      return;
  }

void fsm_close( uint64_t a1, char *__s, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(a1 + 64) = __s;
  if (__s) {
    int v9 = strlen(__s);
  }
  else {
    int v9 = 0;
  }
  *(_DWORD *)(a1 + 72) = v9;
  int v10 = 0;
  switch(*(_DWORD *)(a1 + 8))
  {
    case 1:
      goto LABEL_8;
    case 3:
      int v10 = 2;
      goto LABEL_8;
    case 5:
      goto LABEL_7;
    case 6:
    case 7:
    case 8:
      untimeout((uint64_t)sub_1000084B8, a1);
      goto LABEL_6;
    case 9:
      uint64_t v12 = *(void (**)(uint64_t))(*(void *)(a1 + 56) + 64LL);
      if (v12) {
        v12(a1);
      }
LABEL_6:
      *(_DWORD *)(a1 + 28) = *(_DWORD *)(a1 + 32);
      char v11 = *(_BYTE *)(a1 + 16) + 1;
      *(_BYTE *)(a1 + 16) = v11;
      *(_BYTE *)(a1 + 17) = v11;
      fsm_sdata((unsigned int *)a1, 5, v11, *(char **)(a1 + 64), *(unsigned int *)(a1 + 72), a6, a7, a8, v13);
      timeout((int)sub_1000084B8);
      --*(_DWORD *)(a1 + 28);
LABEL_7:
      int v10 = 4;
LABEL_8:
      *(_DWORD *)(a1 + 8) = v10;
      break;
    default:
      return;
  }

void fsm_sdata( unsigned int *a1, char a2, char a3, char *__src, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  else {
    int v12 = peer_mru[*a1] - 4;
  }
  if (v12) {
    BOOL v13 = __src == &byte_100044124;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13) {
    memcpy(&byte_100044124, __src, v12);
  }
  LOWORD(outpacket_buf) = 1023;
  int v14 = a1[1];
  BYTE2(outpacket_buf) = BYTE1(v14);
  HIBYTE(outpacket_buf) = v14;
  LOBYTE(word_100044120) = a2;
  HIBYTE(word_100044120) = a3;
  LOBYTE(word_100044122) = (unsigned __int16)(v12 + 4) >> 8;
  HIBYTE(word_100044122) = v12 + 4;
  output(*a1, (uint64_t)&outpacket_buf, (v12 + 8), (uint64_t)__src, a5, a6, a7, a8, a9);
}

void fsm_input( uint64_t a1, char *__src, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  if ((int)a3 >= 4)
  {
    uint64_t v10 = __rev16(*((unsigned __int16 *)__src + 1));
    BOOL v11 = v10 < 4 || v10 > a3;
    if (!v11 && *(_DWORD *)(a1 + 8) >= 2u)
    {
      uint64_t v13 = *__src;
      int v14 = __src[1];
      switch((int)v13)
      {
        case 1:
          sub_100008B60(a1, __src[1], (uint64_t)(__src + 4), (v10 - 4), a5, a6, a7, a8, a9);
          break;
        case 2:
          sub_100008DCC( a1,  __src[1],  (uint64_t)(__src + 4),  (v10 - 4),  a5,  a6,  a7,  a8,  a9);
          break;
        case 3:
        case 4:
          if (*(unsigned __int8 *)(a1 + 17) == v14 && !*(_BYTE *)(a1 + 18))
          {
            uint64_t v15 = 40LL;
            if ((_DWORD)v13 == 3) {
              uint64_t v15 = 32LL;
            }
            uint64_t v16 = *(uint64_t (**)(uint64_t, char *, void))(*(void *)(a1 + 56) + v15);
            if (v16 && (int v17 = v16(a1, __src + 4, (v10 - 4))) != 0)
            {
              *(_BYTE *)(a1 + 18) = 1;
              switch(*(_DWORD *)(a1 + 8))
              {
                case 2:
                case 3:
                  int v18 = (unsigned int *)a1;
                  char v19 = 6;
                  char v20 = v14;
                  unsigned __int8 v21 = 0LL;
                  uint64_t v22 = 0LL;
                  goto LABEL_20;
                case 6:
                case 8:
                  int v25 = v17;
                  untimeout((uint64_t)sub_1000084B8, a1);
                  if (v25 < 0)
                  {
                    int v34 = 3;
LABEL_35:
                    *(_DWORD *)(a1 + 8) = v34;
                  }

                  else if (*(_DWORD *)(a1 + 44) >= *(_DWORD *)(a1 + 48))
                  {
                    warning( "%s: Maximum Config-Requests exceeded\n",  v26,  v27,  v28,  v29,  v30,  v31,  v32,  *(void *)(*(void *)(a1 + 56) + 112LL));
                    *(_DWORD *)(a1 + 8) = 3;
                    if ((*(_BYTE *)(a1 + 12) & 1) == 0)
                    {
                      int v35 = *(void (**)(uint64_t))(*(void *)(a1 + 56) + 80LL);
                      if (v35) {
                        v35(a1);
                      }
                    }
                  }

                  else
                  {
                    sub_1000082DC((int *)a1, 0, v27, v28, v29, v30, v31, v32);
                  }

                  break;
                case 7:
                  untimeout((uint64_t)sub_1000084B8, a1);
                  goto LABEL_33;
                case 9:
                  BOOL v33 = *(void (**)(uint64_t))(*(void *)(a1 + 56) + 64LL);
                  if (v33) {
                    v33(a1);
                  }
LABEL_33:
                  sub_1000082DC((int *)a1, 0, a3, a4, a5, a6, a7, a8);
                  int v34 = 6;
                  goto LABEL_35;
                default:
                  return;
              }
            }

            else
            {
              error("Received bad configure-nak/rej: %P", v13, a3, a4, a5, a6, a7, a8, (_DWORD)__src + 4);
            }
          }

          break;
        case 5:
          sub_100008F3C( a1,  __src[1],  (uint64_t)(__src + 4),  (v10 - 4),  a5,  a6,  a7,  a8,  a9);
          break;
        case 6:
          sub_100009008(a1, v13, a3, a4, a5, a6, a7, a8);
          break;
        case 7:
          sub_1000090C0(a1, (uint64_t)(__src + 4), (v10 - 4), a4, a5, a6, a7, a8);
          break;
        default:
          int v23 = *(unsigned int (**)(uint64_t))(*(void *)(a1 + 56) + 104LL);
          if (!v23 || !v23(a1))
          {
            char v24 = *(_BYTE *)(a1 + 16) + 1;
            *(_BYTE *)(a1 + 16) = v24;
            char v20 = v24;
            int v18 = (unsigned int *)a1;
            char v19 = 7;
            unsigned __int8 v21 = __src;
            uint64_t v22 = v10;
LABEL_20:
            fsm_sdata(v18, v19, v20, v21, v22, a6, a7, a8, a9);
          }

          break;
      }
    }
  }

void sub_100008B60( uint64_t a1, unsigned __int8 a2, uint64_t __src, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  uint64_t v10 = (char *)__src;
  int v32 = a4;
  switch(*(_DWORD *)(a1 + 8))
  {
    case 2:
      char v13 = a2;
      char v14 = 6;
      uint64_t v15 = 0LL;
      uint64_t v16 = 0LL;
      goto LABEL_3;
    case 3:
      goto LABEL_14;
    case 4:
    case 5:
      return;
    case 9:
      if ((int)a4 < 1)
      {
        unsigned __int16 v17 = 0;
      }

      else
      {
        unsigned __int16 v17 = 0;
        int v18 = a4;
        char v19 = (unsigned __int8 *)__src;
        do
        {
          int v20 = *v19++;
          unsigned __int16 v17 = word_100037360[v20 ^ ((unsigned __int16)(v17 & 0xFF00) >> 8)] ^ (v17 << 8);
          --v18;
        }

        while (v18);
      }

      if (*(unsigned __int16 *)(a1 + 54) != v17)
      {
LABEL_12:
        unsigned __int8 v21 = *(void (**)(uint64_t))(*(void *)(a1 + 56) + 64LL);
        if (v21) {
          v21(a1);
        }
LABEL_14:
        sub_1000082DC((int *)a1, 0, __src, a4, a5, a6, a7, a8);
        *(_DWORD *)(a1 + 8) = 6;
LABEL_15:
        uint64_t v22 = *(uint64_t (**)(uint64_t, char *, int *, BOOL))(*(void *)(a1 + 56) + 48LL);
        if (v22)
        {
          int v23 = v22(a1, v10, &v32, *(_DWORD *)(a1 + 36) >= *(_DWORD *)(a1 + 40));
          fsm_sdata((unsigned int *)a1, v23, a2, v10, v32, v24, v25, v26, v31);
          if (v23 == 2) {
            goto LABEL_25;
          }
        }

        else
        {
          if (!(_DWORD)a4)
          {
            fsm_sdata((unsigned int *)a1, 2, a2, v10, a4, a6, a7, a8, v31);
LABEL_25:
            if (*(_DWORD *)(a1 + 8) == 7)
            {
              untimeout((uint64_t)sub_1000084B8, a1);
              *(_DWORD *)(a1 + 8) = 9;
              uint64_t v27 = *(void (**)(uint64_t))(*(void *)(a1 + 56) + 56LL);
              if (v27) {
                v27(a1);
              }
            }

            else
            {
              *(_DWORD *)(a1 + 8) = 8;
            }

            *(_DWORD *)(a1 + 36) = 0;
            *(_BYTE *)(a1 + 52) = a2;
            int v28 = v32;
            if (v32 < 1)
            {
              __int16 v29 = 0;
            }

            else
            {
              __int16 v29 = 0;
              do
              {
                int v30 = *v10++;
                __int16 v29 = word_100037360[v30 ^ ((unsigned __int16)(v29 & 0xFF00) >> 8)] ^ (v29 << 8);
                --v28;
              }

              while (v28);
            }

            *(_WORD *)(a1 + 54) = v29;
            return;
          }

          int v23 = 4;
          fsm_sdata((unsigned int *)a1, 4, a2, v10, a4, a6, a7, a8, v31);
        }

        if (*(_DWORD *)(a1 + 8) != 7) {
          *(_DWORD *)(a1 + 8) = 6;
        }
        if (v23 == 3) {
          ++*(_DWORD *)(a1 + 36);
        }
        return;
      }

      char v13 = a2;
      char v14 = 2;
      uint64_t v15 = v10;
      uint64_t v16 = a4;
LABEL_3:
      fsm_sdata((unsigned int *)a1, v14, v13, v15, v16, a6, a7, a8, a9);
      return;
    default:
      goto LABEL_15;
  }

void sub_100008DCC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  int v10 = a3;
  char v11 = a2;
  int v12 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 56) + 24LL);
  if (v12)
  {
    if (v12(a1, a3, a4)) {
      goto LABEL_5;
    }
LABEL_8:
    error("Received bad configure-ack: %P", a2, a3, a4, a5, a6, a7, a8, v10);
    return;
  }

  if ((_DWORD)a4) {
    goto LABEL_8;
  }
LABEL_5:
  *(_BYTE *)(a1 + 18) = 1;
  switch(*(_DWORD *)(a1 + 8))
  {
    case 2:
    case 3:
      fsm_sdata((unsigned int *)a1, 6, v11, 0LL, 0LL, a6, a7, a8, a9);
      break;
    case 6:
      *(_DWORD *)(a1 + 8) = 7;
      *(_DWORD *)(a1 + 28) = *(_DWORD *)(a1 + 24);
      break;
    case 7:
      untimeout((uint64_t)sub_1000084B8, a1);
      goto LABEL_15;
    case 8:
      untimeout((uint64_t)sub_1000084B8, a1);
      *(_DWORD *)(a1 + 8) = 9;
      *(_DWORD *)(a1 + 28) = *(_DWORD *)(a1 + 24);
      char v13 = *(void (**)(uint64_t))(*(void *)(a1 + 56) + 56LL);
      if (v13) {
        v13(a1);
      }
      break;
    case 9:
      char v14 = *(void (**)(uint64_t))(*(void *)(a1 + 56) + 64LL);
      if (v14) {
        v14(a1);
      }
LABEL_15:
      sub_1000082DC((int *)a1, 0, a3, a4, a5, a6, a7, a8);
      *(_DWORD *)(a1 + 8) = 6;
      break;
    default:
      return;
  }

void sub_100008F3C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  char v9 = a2;
  int v11 = *(_DWORD *)(a1 + 8);
  if ((v11 - 7) >= 2)
  {
    if (v11 == 9)
    {
      else {
        info("%s terminated by peer (%0.*v)", a2, a3, a4, a5, a6, a7, a8, *(void *)(*(void *)(a1 + 56) + 112LL));
      }
      *(_DWORD *)(a1 + 28) = 0;
      *(_DWORD *)(a1 + 8) = 5;
      int v12 = *(void (**)(uint64_t))(*(void *)(a1 + 56) + 64LL);
      if (v12) {
        v12(a1);
      }
      timeout((int)sub_1000084B8);
    }
  }

  else
  {
    *(_DWORD *)(a1 + 8) = 6;
  }

  fsm_sdata((unsigned int *)a1, 6, v9, 0LL, 0LL, a6, a7, a8, a9);
}

void sub_100009008( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  switch(*(_DWORD *)(a1 + 8))
  {
    case 4:
      untimeout((uint64_t)sub_1000084B8, a1);
      int v9 = 2;
      goto LABEL_4;
    case 5:
      untimeout((uint64_t)sub_1000084B8, a1);
      int v9 = 3;
LABEL_4:
      *(_DWORD *)(a1 + 8) = v9;
      int v10 = *(void (**)(uint64_t))(*(void *)(a1 + 56) + 80LL);
      if (v10) {
        v10(a1);
      }
      return;
    case 7:
      goto LABEL_9;
    case 9:
      int v11 = *(void (**)(uint64_t))(*(void *)(a1 + 56) + 64LL);
      if (v11) {
        v11(a1);
      }
      sub_1000082DC((int *)a1, 0, a3, a4, a5, a6, a7, a8);
LABEL_9:
      *(_DWORD *)(a1 + 8) = 6;
      break;
    default:
      return;
  }

void sub_1000090C0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((int)a3 >= 4)
  {
    warning( "%s: Rcvd Code-Reject for code %d, id %d",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  *(void *)(*(void *)(a1 + 56) + 112LL));
    if (*(_DWORD *)(a1 + 8) == 7) {
      *(_DWORD *)(a1 + 8) = 6;
    }
  }

uint64_t crc16(unsigned __int8 *a1, int a2)
{
  if (a2 < 1)
  {
    return 0;
  }

  else
  {
    unsigned __int16 v2 = 0;
    do
    {
      int v3 = *a1++;
      unsigned __int16 v2 = word_100037360[v3 ^ ((unsigned __int16)(v2 & 0xFF00) >> 8)] ^ (v2 << 8);
      --a2;
    }

    while (a2);
  }

  return v2;
}

void fsm_protreject( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  switch(*(_DWORD *)(a1 + 8))
  {
    case 2:
      goto LABEL_5;
    case 3:
      goto LABEL_3;
    case 4:
      untimeout((uint64_t)sub_1000084B8, a1);
LABEL_5:
      int v9 = 2;
      goto LABEL_6;
    case 5:
    case 6:
    case 7:
    case 8:
      untimeout((uint64_t)sub_1000084B8, a1);
LABEL_3:
      int v9 = 3;
LABEL_6:
      *(_DWORD *)(a1 + 8) = v9;
      int v10 = *(void (**)(uint64_t))(*(void *)(a1 + 56) + 80LL);
      if (v10) {
        v10(a1);
      }
      break;
    case 9:
      int v11 = *(void (**)(uint64_t))(*(void *)(a1 + 56) + 64LL);
      if (v11) {
        v11(a1);
      }
      *(_DWORD *)(a1 + 28) = *(_DWORD *)(a1 + 32);
      char v12 = *(_BYTE *)(a1 + 16) + 1;
      *(_BYTE *)(a1 + 16) = v12;
      *(_BYTE *)(a1 + 17) = v12;
      fsm_sdata((unsigned int *)a1, 5, v12, *(char **)(a1 + 64), *(unsigned int *)(a1 + 72), a6, a7, a8, v13);
      timeout((int)sub_1000084B8);
      --*(_DWORD *)(a1 + 28);
      *(_DWORD *)(a1 + 8) = 5;
      break;
    default:
      return;
  }

double sub_100009264(int a1)
{
  uint64_t v1 = (char *)&ipcp_fsm + 80 * a1;
  unsigned __int16 v2 = (char *)&ipcp_wantoptions + 52 * a1;
  int v3 = (char *)&ipcp_allowoptions + 52 * a1;
  *(_DWORD *)uint64_t v1 = a1;
  *((_DWORD *)v1 + 1) = 32801;
  *((void *)v1 + 7) = off_10003ECC0;
  fsm_init((uint64_t)v1);
  *(_OWORD *)unsigned __int16 v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  *((_DWORD *)v2 + 12) = 0;
  *((_OWORD *)v2 + 2) = 0u;
  *(_OWORD *)int v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *((_OWORD *)v3 + 2) = 0u;
  *((_DWORD *)v3 + 12) = 0;
  *(_WORD *)unsigned __int16 v2 = 257;
  v2[5] = 1;
  *(void *)&double result = 0xF0000002DLL;
  *((void *)v2 + 2) = 0xF0000002DLL;
  v2[24] = 1;
  *(_WORD *)int v3 = 257;
  *((_DWORD *)v3 + 5) = 15;
  v3[24] = 1;
  *((_WORD *)v3 + 2) = 257;
  v3[3] = 1;
  return result;
}

void sub_100009318( int a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
}

void sub_10000932C( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100009340( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100009354(int a1)
{
}

void sub_100009368( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  byte_100046398 = 1;
}

void sub_100009398(int a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t sub_1000093AC(unsigned __int8 *a1, int a2, void (*a3)(uint64_t, const char *), uint64_t a4)
{
  if (a2 < 4) {
    return 0LL;
  }
  unsigned int v6 = __rev16(*((unsigned __int16 *)a1 + 1));
  int v7 = v6 - 4;
  if (v6 < 4 || v6 > a2) {
    return 0LL;
  }
  int v11 = *a1;
  int v12 = a1[1];
  int v13 = a1 + 4;
  else {
    char v14 = " %s";
  }
  a3(a4, v14);
  ((void (*)(uint64_t, const char *, ...))a3)(a4, " id=0x%x", v12);
  if ((v11 - 1) < 4)
  {
    if (v6 >= 6)
    {
      while (1)
      {
        uint64_t v15 = v13[1];
        int v17 = *v13;
        a3(a4, " <");
        if (v17 > 128)
        {
          int v18 = v13;
          switch(v17)
          {
            case 129:
            case 131:
              int v18 = v13 + 6;
              htonl(bswap32(*(_DWORD *)(v13 + 2)));
              uint64_t v19 = a4;
              int v20 = "ms-dns%d %I";
              goto LABEL_28;
            case 130:
            case 132:
              int v18 = v13 + 6;
              htonl(bswap32(*(_DWORD *)(v13 + 2)));
              uint64_t v19 = a4;
              int v20 = "ms-wins%d %I";
              goto LABEL_28;
            default:
              goto LABEL_29;
          }

          goto LABEL_29;
        }

        int v18 = v13;
        switch(v17)
        {
          case 1:
            if ((_DWORD)v15 != 10) {
              goto LABEL_29;
            }
            uint64_t v24 = htonl(bswap32(*(_DWORD *)(v13 + 2)));
            ((void (*)(uint64_t, const char *, ...))a3)(a4, "addrs %I", v24);
            int v18 = v13 + 10;
            htonl(bswap32(*(_DWORD *)(v13 + 6)));
            uint64_t v19 = a4;
            int v20 = " %I";
            break;
          case 2:
            int v18 = v13 + 4;
            unsigned int v25 = __rev16(*((unsigned __int16 *)v13 + 1));
            a3(a4, "compress ");
            if (v25 == 55)
            {
              uint64_t v19 = a4;
              int v20 = "old-VJ";
            }

            else
            {
              uint64_t v19 = a4;
              if (v25 == 45) {
                int v20 = "VJ";
              }
              else {
                int v20 = "0x%x";
              }
            }

            break;
          case 3:
            int v18 = v13;
            if ((_DWORD)v15 != 6) {
              goto LABEL_29;
            }
            int v18 = v13 + 6;
            htonl(bswap32(*(_DWORD *)(v13 + 2)));
            uint64_t v19 = a4;
            int v20 = "addr %I";
            break;
          default:
            goto LABEL_29;
        }

LABEL_28:
        a3(v19, v20);
LABEL_29:
        if (v18 < &v13[v15])
        {
          unsigned __int8 v21 = &v13[v15];
          int64_t v22 = &v13[v15] - v18;
          do
          {
            int v23 = *v18++;
            ((void (*)(uint64_t, const char *, ...))a3)(a4, " %.2x", v23);
            --v22;
          }

          while (v22);
          int v18 = v21;
        }

        v7 -= v15;
        a3(a4, ">");
        int v13 = v18;
        if (v7 <= 1) {
          goto LABEL_48;
        }
      }
    }

  *(_WORD *)(a3 + 2) = 3;
  *((_WORD *)a1 + 21) = v13;
  double result = htons(v13);
  *(_WORD *)(v5 + 6) = result;
  *(_WORD *)(a3 + 4) = v13 + 4;
  *(void *)(a3 + 8) = *((void *)a1 + 4);
  return result;
}

LABEL_47:
    int v18 = a1 + 4;
LABEL_48:
    int v13 = v18;
    if (v7 < 1) {
      return ((_DWORD)v13 - (_DWORD)a1);
    }
    goto LABEL_49;
  }

  if (v6 >= 5)
  {
    if (*v13 - 32 > 0x5E)
    {
LABEL_49:
      unsigned int v26 = v7 + 1;
      do
      {
        int v27 = *v13++;
        ((void (*)(uint64_t, const char *, ...))a3)(a4, " %.2x", v27);
        --v26;
      }

      while (v26 > 1);
      return ((_DWORD)v13 - (_DWORD)a1);
    }

    a3(a4, " ");
    print_string((char *)a1 + 4, v6 - 4, a3, a4);
    LODWORD(lcp_close(0, "Connect time expired", v8, v9, v10, v11, v12, v13) = (_DWORD)v13 + v7;
  }

  return ((_DWORD)v13 - (_DWORD)a1);
}

uint64_t sub_10000971C(uint64_t result)
{
  return result;
}

void sub_100009764()
{
  if (dword_10004377C) {
    BOOL v0 = 0;
  }
  else {
    BOOL v0 = disable_defaultip == 0;
  }
  if (v0)
  {
    byte_100043767 = 1;
    uint64_t v1 = gethostbyname(hostname);
    if (v1)
    {
      int v2 = **(_DWORD **)v1->h_addr_list;
      if (v2)
      {
      }
    }
  }

  if (dword_10004377C) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = disable_defaultip == 0;
  }
  char v4 = v3;
  byte_100046382 = v4;
}

uint64_t sub_1000097F8(uint64_t a1)
{
  uint64_t v2 = (int)a1;
  BOOL v3 = (char *)&ipcp_wantoptions + 52 * (int)a1;
  unsigned int v6 = *((_DWORD *)v3 + 8);
  uint64_t v5 = (int *)(v3 + 32);
  unsigned int v4 = v6;
  if (!v6)
  {
    unsigned int v4 = htonl((ifunit + 175140976));
    *uint64_t v5 = v4;
    *((_BYTE *)&ipcp_wantoptions + 52 * (int)v2 + 8) = 1;
  }

  int v7 = (char *)&ipcp_wantoptions + 52 * (int)v2;
  unsigned int v10 = *((_DWORD *)v7 + 7);
  int v9 = (int *)(v7 + 28);
  uint64_t v8 = v10;
  if (!v10)
  {
    uint64_t v8 = htonl((ifunit + 171982912));
    *int v9 = v8;
    *((_BYTE *)&ipcp_wantoptions + 52 * (int)v2 + 7) = 1;
    byte_100046382 = 0;
  }

  int Mask = GetMask(v8);
  uint64_t result = sifaddr(a1, v8, v4, Mask);
  if ((_DWORD)result)
  {
    uint64_t result = sifnpafmode(a1, 33, ip_src_address_filter);
    if ((_DWORD)result)
    {
      uint64_t result = sifup();
      if ((_DWORD)result)
      {
        uint64_t result = sifnpmode(a1, 33, 3);
        if ((_DWORD)result)
        {
          if (byte_10004636C) {
            sifdns(*v5, *v5);
          }
          if (byte_10004636D) {
            sifwins();
          }
          notice("local  IP address %I", v13, v14, v15, v16, v17, v18, v19, *v9);
          notice("remote IP address %I", v20, v21, v22, v23, v24, v25, v26, *v5);
          return 1LL;
        }
      }
    }
  }

  return result;
}

BOOL sub_1000099E8(_BYTE *a1, int a2)
{
  BOOL result = 0;
  if (a2 >= 24 && !(a1[11] | ((a1[10] & 0x1F) << 8)))
  {
    if (a1[13] != 6) {
      return 1;
    }
    uint64_t v3 = 4LL * (a1[4] & 0xF);
    if (a2 - 4 >= (v3 + 20))
    {
      unsigned int v4 = &a1[v3 + 4];
    }
  }

  return result;
}

uint64_t sub_100009A5C(int a1)
{
  return *((unsigned int *)&ipcp_fsm + 20 * a1 + 2);
}

uint64_t sub_100009A74()
{
  else {
    return 0LL;
  }
}

void *ip_ntoa()
{
  return &unk_10004631C;
}

char *setipaddr(const char *a1, uint64_t a2, int a3)
{
  BOOL result = strchr(a1, 58);
  if (result)
  {
    if (a3)
    {
      unsigned int v6 = result;
      if (result != a1 && option_priority >= dword_10004635C)
      {
        *BOOL result = 0;
        in_addr_t v7 = inet_addr(a1);
        if (v7 == -1)
        {
          uint64_t v8 = gethostbyname(a1);
          if (!v8)
          {
            option_error("unknown host: %s", v9, v10, v11, v12, v13, v14, v15, (int)a1);
            return 0LL;
          }

          in_addr_t v7 = **(_DWORD **)v8->h_addr_list;
        }

        if (bad_ip_adrs())
        {
          slprintf((int)&unk_10004631C, 64, "%I");
          option_error("bad local IP address %s", v16, v17, v18, v19, v20, v21, v22, (int)&unk_10004631C);
          return 0LL;
        }

        if (v7) {
          dword_10004377C = v7;
        }
        *unsigned int v6 = 58;
        dword_10004635C = option_priority;
      }

      int v24 = v6[1];
      uint64_t v23 = v6 + 1;
      if (v24 && option_priority >= dword_100046360)
      {
        in_addr_t v25 = inet_addr(v23);
        if (v25 == -1)
        {
          BOOL v33 = gethostbyname(v23);
          if (!v33)
          {
            option_error("unknown host: %s", v34, v35, v36, v37, v38, v39, v40, (int)v23);
            return 0LL;
          }

          in_addr_t v25 = **(_DWORD **)v33->h_addr_list;
          if (!remote_name) {
            __strlcpy_chk(&remote_name, v23, 256LL, 256LL);
          }
        }

        if (bad_ip_adrs())
        {
          slprintf((int)&unk_10004631C, 64, "%I");
          option_error("bad remote IP address %s", v26, v27, v28, v29, v30, v31, v32, (int)&unk_10004631C);
          return 0LL;
        }

        if (v25) {
          dword_100043780 = v25;
        }
        dword_100046360 = option_priority;
      }
    }

    return (char *)1;
  }

  return result;
}

uint64_t parse_dotted_ip(const char *a1, unsigned int *a2)
{
  unsigned int v4 = strtoul(a1, &__endptr, 0);
  uint64_t v5 = __endptr;
  if (__endptr == a1) {
    return 0LL;
  }
  unsigned int v6 = 0;
  int v7 = 3;
  char v8 = 24;
  while (v4 < 0x100)
  {
    v6 |= v4 << v8;
    if (!v7)
    {
      unsigned int v4 = v6;
      goto LABEL_11;
    }

    if (*v5 == 46)
    {
      uint64_t v9 = v5 + 1;
      --v7;
      unsigned int v4 = strtoul(v5 + 1, &__endptr, 0);
      uint64_t v5 = __endptr;
      v8 -= 8;
      if (__endptr != v9) {
        continue;
      }
    }

    return 0LL;
  }

  if (v7 < 3) {
    return 0LL;
  }
LABEL_11:
  *a2 = v4;
  return ((_DWORD)v5 - (_DWORD)a1);
}

uint64_t sub_100009D74(const char **a1)
{
  uint64_t result = int_option(*a1, &v10);
  if ((_DWORD)result)
  {
    if ((v10 - 17) > 0xFFFFFFF0)
    {
      dword_1000437DC = v10 - 1;
      dword_100043774 = v10 - 1;
      slprintf((int)&unk_100046364, 8, "%d");
      return 1LL;
    }

    else
    {
      option_error("vj-max-slots value must be between 2 and 16", v2, v3, v4, v5, v6, v7, v8, v9);
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_100009DF4(const char **a1)
{
  in_addr_t v2 = inet_addr(*a1);
  if (v2 == -1)
  {
    uint64_t v3 = gethostbyname(*a1);
    if (!v3)
    {
      option_error("invalid address parameter '%s' for ms-dns option", v4, v5, v6, v7, v8, v9, v10, (int)*a1);
      return 0LL;
    }

    in_addr_t v2 = **(_DWORD **)v3->h_addr_list;
  }

  int v11 = dword_1000437F0;
  if (!dword_1000437F0) {
    int v11 = v2;
  }
  dword_1000437EC = v11;
  dword_1000437F0 = v2;
  return 1LL;
}

uint64_t sub_100009E78(const char **a1)
{
  in_addr_t v2 = inet_addr(*a1);
  if (v2 == -1)
  {
    uint64_t v3 = gethostbyname(*a1);
    if (!v3)
    {
      option_error("invalid address parameter '%s' for ms-wins option", v4, v5, v6, v7, v8, v9, v10, (int)*a1);
      return 0LL;
    }

    in_addr_t v2 = **(_DWORD **)v3->h_addr_list;
  }

  int v11 = dword_1000437F8;
  if (!dword_1000437F8) {
    int v11 = v2;
  }
  dword_1000437F4 = v11;
  dword_1000437F8 = v2;
  return 1LL;
}

uint64_t sub_100009EFC(const char **a1)
{
  in_addr_t v2 = *a1;
  int v3 = parse_dotted_ip(*a1, &v13);
  int v4 = htonl(v13);
  if (!v3 || v2[v3] || (netmask & ~v4) != 0)
  {
    option_error("invalid netmask value '%s'", v5, v6, v7, v8, v9, v10, v11, (int)*a1);
    return 0LL;
  }

  else
  {
    netmask = v4;
    slprintf((int)&unk_10004636E, 20, "%I");
    return 1LL;
  }

uint64_t sub_100009FA4(uint64_t a1, void (*a2)(uint64_t, const char *, ...), uint64_t a3)
{
  if (dword_10004377C) {
    a2(a3, "%I", dword_10004377C);
  }
  uint64_t result = ((uint64_t (*)(uint64_t, const char *))a2)(a3, ":");
  if (dword_100043780) {
    return ((uint64_t (*)(uint64_t, const char *, ...))a2)(a3, "%I", dword_100043780);
  }
  return result;
}

int *sub_10000A01C(int *result)
{
  int v1 = *result;
  in_addr_t v2 = (char *)&ipcp_wantoptions + 52 * *result;
  if (*v2 || (char v3 = *((_BYTE *)&ipcp_wantoptions + 52 * v1 + 1)) != 0)
  {
    if (*((_BYTE *)&ipcp_allowoptions + 52 * v1)) {
      char v3 = 1;
    }
    else {
      char v3 = *((_BYTE *)&ipcp_allowoptions + 52 * v1 + 1) != 0;
    }
  }

  int v4 = (char *)&ipcp_gotoptions + 52 * v1;
  uint64_t v5 = (char *)&ipcp_wantoptions + 52 * v1;
  v5[2] = v3;
  if (!*((_DWORD *)v5 + 7)) {
    *((_BYTE *)&ipcp_wantoptions + 52 * v1 + 7) = 1;
  }
  uint64_t v6 = (char *)&ipcp_wantoptions + 52 * v1;
  int v8 = *((_DWORD *)v6 + 8);
  uint64_t v7 = v6 + 32;
  if (!v8) {
    *((_BYTE *)&ipcp_wantoptions + 52 * v1 + 8) = 1;
  }
  char v9 = byte_10004636C;
  uint64_t v10 = (char *)&ipcp_wantoptions + 52 * v1;
  v10[9] = byte_10004636C;
  v10[10] = v9;
  char v11 = byte_10004636D;
  v10[11] = byte_10004636D;
  v10[12] = v11;
  __int128 v12 = *((_OWORD *)v2 + 1);
  *(_OWORD *)int v4 = *(_OWORD *)v2;
  *((_OWORD *)v4 + 1) = v12;
  *((_OWORD *)v4 + 2) = *((_OWORD *)v2 + 2);
  *((_DWORD *)v4 + 12) = *((_DWORD *)v2 + 12);
  if (!byte_100046382) {
    *((_DWORD *)&ipcp_gotoptions + 13 * v1 + 7) = 0;
  }
  if (ip_choose_hook)
  {
    uint64_t result = (int *)ip_choose_hook(v7);
    if (*v7) {
      *((_BYTE *)&ipcp_wantoptions + 52 * v1 + 8) = 0;
    }
  }

  return result;
}

uint64_t sub_10000A168(int *a1, uint8x8_t a2)
{
  int v2 = *a1;
  char v3 = (char *)&ipcp_gotoptions + 52 * *a1;
  if ((*((_BYTE *)&ipcp_wantoptions + 52 * *a1) || *((_BYTE *)&ipcp_wantoptions + 52 * v2 + 1)) && !*v3)
  {
    int v4 = (char *)&ipcp_gotoptions + 52 * v2;
    int v6 = v4[1];
    uint64_t v5 = v4 + 1;
    if (!v6) {
      *uint64_t v5 = 1;
    }
  }

  if (*((_BYTE *)&ipcp_wantoptions + 52 * v2 + 5))
  {
    uint64_t v7 = (char *)&ipcp_gotoptions + 52 * v2;
    int v9 = v7[5];
    int v8 = v7 + 5;
    if (!v9)
    {
      uint64_t v10 = (char *)&ipcp_gotoptions + 52 * v2;
      int v12 = v10[6];
      char v11 = v10 + 6;
      if (!v12 && *((_BYTE *)&ipcp_hisoptions + 52 * v2 + 5) && *((_BYTE *)&ipcp_hisoptions + 52 * v2 + 6))
      {
        *int v8 = 1;
        _BYTE *v11 = 1;
        *((_DWORD *)&ipcp_gotoptions + 13 * v2 + 4) = *((_DWORD *)&ipcp_hisoptions + 13 * v2 + 4);
      }
    }
  }

  int v13 = *v3;
  if (*v3)
  {
    int v14 = 0;
  }

  else if (*((_BYTE *)&ipcp_gotoptions + 52 * v2 + 1))
  {
    int v14 = 10;
  }

  else
  {
    int v14 = 0;
  }

  int v15 = *((unsigned __int8 *)&ipcp_gotoptions + 52 * v2 + 5);
  if (*((_BYTE *)&ipcp_gotoptions + 52 * v2 + 5))
  {
    if (*((_BYTE *)&ipcp_gotoptions + 52 * v2 + 6)) {
      int v15 = 4;
    }
    else {
      int v15 = 6;
    }
  }

  if (v13) {
    int v16 = 6;
  }
  else {
    int v16 = 0;
  }
  a2.i32[0] = *(_DWORD *)((char *)&ipcp_gotoptions + 52 * v2 + 9);
  v17.i64[0] = 0x600000006LL;
  v17.i64[1] = 0x600000006LL;
  return (vaddvq_s32((int32x4_t)vbicq_s8( v17,  (int8x16_t)vceqzq_s32((int32x4_t)vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(a2)))))
                      + v16
                      + v15
                      + v14);
}

int *sub_10000A2D0(int *result, uint64_t a2, int *a3)
{
  uint64_t v4 = a2;
  int v5 = *result;
  int v6 = (char *)&ipcp_gotoptions + 52 * *result;
  int v7 = *a3;
  if (!*v6)
  {
    int v16 = (char *)&ipcp_gotoptions + 52 * v5;
    int v18 = v16[1];
    int8x16_t v17 = v16 + 1;
    if (v18)
    {
      int v19 = v7 - 10;
      if (v7 < 10)
      {
        *int8x16_t v17 = 0;
      }

      else
      {
        *(_WORD *)a2 = 2561;
        uint64_t v20 = (char *)&ipcp_gotoptions + 52 * v5;
        *(_DWORD *)(a2 + 2) = bswap32(ntohl(*((unsigned int *)v20 + 7)));
        uint64_t result = (int *)ntohl(*((unsigned int *)v20 + 8));
        *(_DWORD *)(v4 + 6) = bswap32(result);
        v4 += 10LL;
        int v7 = v19;
      }
    }
  }

  int v8 = (char *)&ipcp_gotoptions + 52 * v5;
  int v10 = v8[5];
  int v9 = v8 + 5;
  if (v10)
  {
    char v11 = (char *)&ipcp_gotoptions + 52 * v5;
    int v13 = v11[6];
    int v12 = v11 + 6;
    if (v13) {
      int v14 = 4;
    }
    else {
      int v14 = 6;
    }
    int v15 = v7 - v14;
    if (v7 >= v14)
    {
      *(_BYTE *)uint64_t v4 = 2;
      *(_BYTE *)(v4 + 1) = v14;
      uint64_t v21 = (char *)&ipcp_gotoptions + 52 * v5;
      *(_BYTE *)(v4 + 2) = BYTE1(*((_DWORD *)v21 + 4));
      *(_BYTE *)(v4 + 3) = *((_DWORD *)v21 + 4);
      if (*v12)
      {
        v4 += 4LL;
      }

      else
      {
        uint64_t v22 = (char *)&ipcp_gotoptions + 52 * v5;
        *(_BYTE *)(v4 + 4) = *((_DWORD *)v22 + 5);
        *(_BYTE *)(v4 + 5) = v22[24];
        v4 += 6LL;
      }

      int v7 = v15;
    }

    else
    {
      *int v9 = 0;
    }
  }

  if (*v6)
  {
    int v23 = v7 - 6;
    if (v7 < 6)
    {
      *int v6 = 0;
    }

    else
    {
      *(_WORD *)uint64_t v4 = 1539;
      uint64_t result = (int *)ntohl(*((unsigned int *)&ipcp_gotoptions + 13 * v5 + 7));
      *(_DWORD *)(v4 + 2) = bswap32(result);
      v4 += 6LL;
      int v7 = v23;
    }
  }

  int v24 = (char *)&ipcp_gotoptions + 52 * v5;
  int v26 = v24[9];
  in_addr_t v25 = v24 + 9;
  if (v26)
  {
    int v27 = v7 - 6;
    if (v7 < 6)
    {
      *in_addr_t v25 = 0;
    }

    else
    {
      *(_WORD *)uint64_t v4 = 1665;
      uint64_t result = (int *)ntohl(*((unsigned int *)&ipcp_gotoptions + 13 * v5 + 9));
      *(_DWORD *)(v4 + 2) = bswap32(result);
      v4 += 6LL;
      int v7 = v27;
    }
  }

  uint64_t v28 = (char *)&ipcp_gotoptions + 52 * v5;
  int v30 = v28[10];
  uint64_t v29 = v28 + 10;
  if (v30)
  {
    int v31 = v7 - 6;
    if (v7 < 6)
    {
      *uint64_t v29 = 0;
    }

    else
    {
      *(_WORD *)uint64_t v4 = 1667;
      uint64_t result = (int *)ntohl(*((unsigned int *)&ipcp_gotoptions + 13 * v5 + 10));
      *(_DWORD *)(v4 + 2) = bswap32(result);
      v4 += 6LL;
      int v7 = v31;
    }
  }

  uint64_t v32 = (char *)&ipcp_gotoptions + 52 * v5;
  int v34 = v32[11];
  BOOL v33 = v32 + 11;
  if (v34)
  {
    int v35 = v7 - 6;
    if (v7 < 6)
    {
      *BOOL v33 = 0;
    }

    else
    {
      *(_WORD *)uint64_t v4 = 1666;
      uint64_t result = (int *)ntohl(*((unsigned int *)&ipcp_gotoptions + 13 * v5 + 11));
      *(_DWORD *)(v4 + 2) = bswap32(result);
      v4 += 6LL;
      int v7 = v35;
    }
  }

  uint64_t v36 = (char *)&ipcp_gotoptions + 52 * v5;
  int v38 = v36[12];
  uint64_t v37 = v36 + 12;
  if (v38)
  {
    int v39 = v7 - 6;
    if (v7 < 6)
    {
      *uint64_t v37 = 0;
    }

    else
    {
      *(_WORD *)uint64_t v4 = 1668;
      uint64_t result = (int *)ntohl(*((unsigned int *)&ipcp_gotoptions + 13 * v5 + 12));
      *(_DWORD *)(v4 + 2) = bswap32(result);
      int v7 = v39;
    }
  }

  *a3 -= v7;
  return result;
}

uint64_t sub_10000A580( int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a3;
  int v9 = (unsigned __int8 *)a2;
  int v10 = *a1;
  uint64_t v11 = 52LL * *a1;
  int v12 = *((unsigned __int8 *)&ipcp_gotoptions + v11);
  if (!*((_BYTE *)&ipcp_gotoptions + v11) && *((_BYTE *)&ipcp_gotoptions + 52 * v10 + 1))
  {
    int v8 = a3 - 10;
    if ((int)a3 < 10
      || *(_BYTE *)(a2 + 1) != 10
      || *(_BYTE *)a2 != 1
      || *((_DWORD *)&ipcp_gotoptions + 13 * v10 + 7) != htonl(bswap32(*(_DWORD *)(a2 + 2)))
      || *((_DWORD *)&ipcp_gotoptions + 13 * v10 + 8) != htonl(bswap32(*(_DWORD *)(v9 + 6))))
    {
      goto LABEL_57;
    }

    v9 += 10;
  }

  if (*((_BYTE *)&ipcp_gotoptions + 52 * v10 + 5))
  {
    if (*((_BYTE *)&ipcp_gotoptions + 52 * v10 + 6)) {
      int v13 = 4;
    }
    else {
      int v13 = 6;
    }
    v8 -= v13;
    if (v8 < 0) {
      goto LABEL_57;
    }
    BOOL v14 = v13 == v9[1] && *v9 == 2;
    if (!*((_BYTE *)&ipcp_gotoptions + 52 * v10 + 6))
    {
      if (*((_DWORD *)&ipcp_gotoptions + 13 * v10 + 5) != v9[4]
        || v9[5] != *((unsigned __int8 *)&ipcp_gotoptions + 52 * v10 + 24))
      {
        goto LABEL_57;
      }

      v9 += 6;
      if (!v12) {
        goto LABEL_21;
      }
      goto LABEL_16;
    }

    v9 += 4;
  }

  if (v12)
  {
LABEL_16:
    BOOL v15 = __OFSUB__(v8, 6);
    v8 -= 6;
    if (v8 < 0 != v15
      || v9[1] != 6
      || *v9 != 3
      || *((_DWORD *)&ipcp_gotoptions + 13 * v10 + 7) != htonl(bswap32(*(_DWORD *)(v9 + 2))))
    {
      goto LABEL_57;
    }

    v9 += 6;
  }

LABEL_21:
  if (*((_BYTE *)&ipcp_gotoptions + 52 * v10 + 9))
  {
    BOOL v15 = __OFSUB__(v8, 6);
    v8 -= 6;
    if (v8 < 0 != v15
      || v9[1] != 6
      || *v9 != 129
      || *((_DWORD *)&ipcp_gotoptions + 13 * v10 + 9) != htonl(bswap32(*(_DWORD *)(v9 + 2))))
    {
      goto LABEL_57;
    }

    v9 += 6;
  }

  if (*((_BYTE *)&ipcp_gotoptions + 52 * v10 + 10))
  {
    BOOL v15 = __OFSUB__(v8, 6);
    v8 -= 6;
    if (v8 < 0 != v15
      || v9[1] != 6
      || *v9 != 131
      || *((_DWORD *)&ipcp_gotoptions + 13 * v10 + 10) != htonl(bswap32(*(_DWORD *)(v9 + 2))))
    {
      goto LABEL_57;
    }

    v9 += 6;
  }

  if (*((_BYTE *)&ipcp_gotoptions + 52 * v10 + 11))
  {
    BOOL v15 = __OFSUB__(v8, 6);
    v8 -= 6;
    if (v8 < 0 != v15
      || v9[1] != 6
      || *v9 != 130
      || *((_DWORD *)&ipcp_gotoptions + 13 * v10 + 11) != htonl(bswap32(*(_DWORD *)(v9 + 2))))
    {
      goto LABEL_57;
    }

    v9 += 6;
  }

  if (!*((_BYTE *)&ipcp_gotoptions + 52 * v10 + 12)
    || (BOOL v15 = __OFSUB__(v8, 6), v8 -= 6, v8 < 0 == v15)
    && v9[1] == 6
    && *v9 == 132
    && *((_DWORD *)&ipcp_gotoptions + 13 * v10 + 12) == htonl(bswap32(*(_DWORD *)(v9 + 2))))
  {
    if (!v8) {
      return 1LL;
    }
  }

LABEL_57:
  if (debug) {
    dbglog("ipcp_ackci: received bad Ack!", a2, a3, a4, a5, a6, a7, a8, v17);
  }
  return 0LL;
}

    if ((v21 & 0xFFFFFFF8) == 0x30)
    {
      uint64_t v29 = 0;
      uint64_t v28 = 0;
      do
      {
        uint64_t v28 = v21 & 7 | (8 * v28);
        uint64_t v21 = getc(a1);
      }

      while ((v21 & 0xFFFFFFF8) == 0x30 && v29++ < 2);
    }

    else
    {
      if (v21 != 120)
      {
        int v27 = 1;
        uint64_t v28 = v21;
        goto LABEL_70;
      }

      uint64_t v21 = getc(a1);
      if (v21 <= 0xFF)
      {
        int v31 = 0;
        uint64_t v28 = 0;
        while ((_DefaultRuneLocale.__runetype[v21] & 0x10000) != 0)
        {
          uint64_t v32 = __toupper(v21);
          if (v32 <= 58) {
            BOOL v33 = -48;
          }
          else {
            BOOL v33 = -55;
          }
          uint64_t v28 = v32 + 16 * v28 + v33;
          uint64_t v21 = getc(a1);
          int v27 = 0;
          int v34 = (v21 > 0xFF) | v31;
          int v31 = 1;
          if ((v34 & 1) != 0) {
            goto LABEL_70;
          }
        }
      }

      else
      {
        uint64_t v28 = 0;
      }
    }

    int v27 = 0;
    goto LABEL_70;
  }

uint64_t sub_10000A8B0( int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = (unsigned __int8 *)a2;
  int v9 = *a1;
  int v10 = (char *)&ipcp_gotoptions + 52 * *a1;
  int v11 = *v10;
  int v12 = v10[5];
  unsigned int v45 = *((_DWORD *)v10 + 4);
  int v46 = *((_DWORD *)v10 + 5);
  unsigned __int8 v47 = v10[24];
  char v48 = v10[6];
  int v13 = *((_DWORD *)v10 + 7);
  int v55 = v10[1];
  int v56 = *((_DWORD *)v10 + 8);
  int v49 = *((_DWORD *)v10 + 10);
  int v50 = *((_DWORD *)v10 + 9);
  int v51 = *((_DWORD *)v10 + 12);
  int v52 = *((_DWORD *)v10 + 11);
  if (*v10) {
    BOOL v14 = 1;
  }
  else {
    BOOL v14 = v10[1] == 0;
  }
  if (v14) {
    goto LABEL_6;
  }
  int v58 = 0;
  uint64_t v20 = (a3 - 10);
  if (*(_BYTE *)a2 != 1)
  {
LABEL_6:
    int v58 = 0;
    goto LABEL_7;
  }

  int v21 = htonl(bswap32(*(_DWORD *)(a2 + 2)));
  int v22 = htonl(bswap32(*(_DWORD *)(v8 + 6)));
  int v23 = (char *)&ipcp_gotoptions + 52 * v9;
  if (v21) {
    BOOL v24 = v23[7] == 0;
  }
  else {
    BOOL v24 = 1;
  }
  if (!v24) {
    int v13 = v21;
  }
  int v25 = v23[8];
  if (v22) {
    BOOL v26 = v25 == 0;
  }
  else {
    BOOL v26 = 1;
  }
  int v27 = v56;
  if (!v26) {
    int v27 = v22;
  }
  int v56 = v27;
  int v58 = 1;
  a3 = v20;
  v8 += 10;
LABEL_7:
  if (v12)
  {
    int v15 = v8[1];
    if ((v15 | 2) == 6 && (int v16 = a3 - v15, (int)a3 >= v15) && *v8 == 2)
    {
      unsigned int v17 = __rev16(*((unsigned __int16 *)v8 + 1));
      if (v15 == 6)
      {
        if (v17 != 45)
        {
          unsigned __int8 v43 = 0;
          int v57 = 1;
          v8 += 6;
          goto LABEL_35;
        }

        int v18 = v46;
        if (v46 >= v8[4]) {
          int v18 = v8[4];
        }
        int v46 = v18;
        unsigned __int8 v19 = v47;
        if (!v8[5]) {
          unsigned __int8 v19 = 0;
        }
        unsigned __int8 v47 = v19;
        char v48 = 0;
        int v57 = 1;
        v8 += 6;
      }

      else
      {
        v8 += 4;
        if (v17 != 55 && v17 != 45)
        {
          unsigned __int8 v43 = 0;
          int v57 = 1;
          goto LABEL_35;
        }

        int v57 = 1;
        unsigned int v45 = v17;
        char v48 = 1;
      }
    }

    else
    {
      int v57 = 0;
      int v16 = a3;
    }

    unsigned __int8 v43 = v12;
  }

  else
  {
    int v57 = 0;
    unsigned __int8 v43 = 0;
    int v16 = a3;
  }

LABEL_35:
  int v54 = v12;
  if (!v11) {
    goto LABEL_45;
  }
  int v28 = 0;
  if (v8[1] != 6 || v16 < 6) {
    goto LABEL_46;
  }
  if (*v8 != 3)
  {
LABEL_45:
    int v28 = 0;
    goto LABEL_46;
  }

  int v29 = htonl(bswap32(*(_DWORD *)(v8 + 2)));
  if (v29) {
    BOOL v30 = *((_BYTE *)&ipcp_gotoptions + 52 * v9 + 7) == 0;
  }
  else {
    BOOL v30 = 1;
  }
  if (!v30) {
    int v13 = v29;
  }
  int v28 = 1;
  v16 -= 6;
  v8 += 6;
LABEL_46:
  if (*((_BYTE *)&ipcp_gotoptions + 52 * v9 + 9) && v8[1] == 6 && v16 >= 6 && *v8 == 129)
  {
    int v50 = htonl(bswap32(*(_DWORD *)(v8 + 2)));
    v16 -= 6;
    v8 += 6;
  }

  if (*((_BYTE *)&ipcp_gotoptions + 52 * v9 + 10) && v8[1] == 6 && v16 >= 6 && *v8 == 131)
  {
    int v49 = htonl(bswap32(*(_DWORD *)(v8 + 2)));
    v16 -= 6;
    v8 += 6;
  }

  if (*((_BYTE *)&ipcp_gotoptions + 52 * v9 + 11) && v8[1] == 6 && v16 >= 6 && *v8 == 130)
  {
    int v52 = htonl(bswap32(*(_DWORD *)(v8 + 2)));
    v16 -= 6;
    v8 += 6;
  }

  if (*((_BYTE *)&ipcp_gotoptions + 52 * v9 + 12) && v8[1] == 6 && v16 >= 6)
  {
    if (*v8 != 132) {
      goto LABEL_67;
    }
    int v51 = htonl(bswap32(*(_DWORD *)(v8 + 2)));
    v16 -= 6;
    v8 += 6;
  }

  if (v16 < 2)
  {
    unsigned __int8 v34 = v55;
    char v33 = v11;
LABEL_107:
    if (a1[2] == 9) {
      return 1LL;
    }
    *int v10 = v33;
    v10[1] = v34;
    v10[5] = v43;
    v10[6] = v48;
    *((_DWORD *)v10 + 4) = v45;
    *((_DWORD *)v10 + 5) = v46;
    v10[24] = v47;
    *((_DWORD *)v10 + 7) = v13;
    *((_DWORD *)v10 + 8) = v56;
    *((_DWORD *)v10 + 9) = v50;
    *((_DWORD *)v10 + 10) = v49;
    uint64_t result = 1LL;
    *((_DWORD *)v10 + 11) = v52;
    *((_DWORD *)v10 + 12) = v51;
    return result;
  }

  if (default_device) {
    nodetach = 1;
  }
  uint64_t result = log_to_fd;
  if ((log_to_fd & 0x80000000) == 0)
  {
    uint64_t result = fstat(log_to_fd, &v18);
    if ((result & 0x80000000) == 0 && (v18.st_mode & 0xF000) == 0x2000 && v18.st_rdev == *(_DWORD *)&devstat[24]) {
      log_to_fd = -1;
    }
  }

  return result;
}

LABEL_67:
  int v31 = (char *)&ipcp_gotoptions + 52 * v9;
  uint64_t v32 = v31 + 7;
  uint64_t v44 = v31 + 8;
  char v33 = v11;
  unsigned __int8 v34 = v55;
  while (1)
  {
    uint64_t v35 = v8[1];
    v16 -= v35;
    if (v16 < 0) {
      break;
    }
    int v36 = *v8;
    switch(v36)
    {
      case 1:
        if (v11)
        {
          if (v58 || (_DWORD)v35 != 10) {
            goto LABEL_103;
          }
        }

        else if ((_DWORD)v35 != 10 || v55 || v58)
        {
          goto LABEL_103;
        }

        int v38 = htonl(bswap32(*(_DWORD *)(v8 + 2)));
        if (v38 && *v32) {
          int v13 = v38;
        }
        int v39 = htonl(bswap32(*(_DWORD *)(v8 + 6)));
        char v33 = 0;
        if (v39)
        {
          int v40 = v56;
          if (*v44) {
            int v40 = v39;
          }
          int v56 = v40;
        }

        int v58 = 1;
        break;
      case 3:
        if (v11 || v28 || (_DWORD)v35 != 6) {
          goto LABEL_103;
        }
        int v37 = htonl(bswap32(*(_DWORD *)(v8 + 2)));
        if (v37 && *v32) {
          int v13 = v37;
        }
        unsigned __int8 v34 = 0;
        if (v13) {
          char v33 = 1;
        }
        int v28 = 1;
        break;
      case 2:
        if (v54 || v57 || (v35 & 0xFFFFFFFD) != 4) {
          goto LABEL_103;
        }
        int v57 = 1;
        break;
    }

    v8 += v35;
    if (v16 <= 1) {
      goto LABEL_107;
    }
  }

LABEL_103:
  if (debug) {
    dbglog("ipcp_nakci: received bad Nak!", a2, a3, a4, a5, a6, a7, a8, v42);
  }
  return 0LL;
}

        uint64_t v35 = "DHCP packet received with incorrect message type\n";
        goto LABEL_104;
      }

uint64_t sub_10000AE50( int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = (unsigned __int8 *)a2;
  int v9 = *a1;
  int v10 = &ipcp_gotoptions;
  int v11 = (char *)&ipcp_gotoptions + 52 * *a1;
  int v12 = *v11;
  char v13 = v11[1];
  int v14 = v11[5];
  int v43 = v11[10];
  int v44 = v11[9];
  int v15 = v11[11];
  int v16 = v11[12];
  if (!*v11)
  {
    if (v11[1])
    {
      uint64_t v28 = (a3 - 10);
      if ((int)a3 >= 10 && *(_BYTE *)(a2 + 1) == 10 && *(_BYTE *)a2 == 1)
      {
        int v29 = v11[12];
        int v30 = htonl(bswap32(*(_DWORD *)(v8 + 6)));
        int v10 = &ipcp_gotoptions;
        if (v30 != *((_DWORD *)&ipcp_gotoptions + 13 * v9 + 8)) {
          goto LABEL_54;
        }
        int v16 = v29;
        char v13 = 0;
        v8 += 10;
        a3 = v28;
      }
    }
  }

  if (v14)
  {
    int v17 = v8[1];
    int v18 = *((_BYTE *)&ipcp_gotoptions + 52 * v9 + 6) ? 4 : 6;
    BOOL v19 = v18 != v17 || (int)a3 < v17;
    if (!v19 && *v8 == 2)
    {
      a3 = (a3 - v17);
      if (!*((_BYTE *)&ipcp_gotoptions + 52 * v9 + 6))
      {
        if (*((_DWORD *)&ipcp_gotoptions + 13 * v9 + 5) != v8[4]
          || v8[5] != *((unsigned __int8 *)&ipcp_gotoptions + 52 * v9 + 24))
        {
          goto LABEL_54;
        }

        LOBYTE(v14) = 0;
        v8 += 6;
        if (!v12) {
          goto LABEL_20;
        }
        goto LABEL_15;
      }

      LOBYTE(v14) = 0;
      v8 += 4;
    }
  }

  if (v12)
  {
LABEL_15:
    if (v8[1] == 6)
    {
      uint64_t v20 = (a3 - 6);
      if ((int)a3 >= 6 && *v8 == 3)
      {
        int v21 = v15;
        int v22 = v9;
        int v23 = v16;
        int v24 = htonl(bswap32(*(_DWORD *)(v8 + 2)));
        int v10 = &ipcp_gotoptions;
        int v16 = v23;
        int v9 = v22;
        if (v24 != *((_DWORD *)&ipcp_gotoptions + 13 * v22 + 7)) {
          goto LABEL_54;
        }
        int v15 = v21;
        LOBYTE(v12) = 0;
        v8 += 6;
        a3 = v20;
      }
    }
  }

LABEL_54:
  if (debug) {
    dbglog("ipcp_rejci: received bad Reject!", a2, a3, a4, a5, a6, a7, a8, v40);
  }
  return 0LL;
}

          if (v13 < &v18[v19])
          {
            int v41 = v7;
            char v26 = v4;
            int v27 = v17;
            uint64_t v28 = v16;
            int v29 = &v18[v19];
            int v30 = v29 - v13;
            do
            {
              uint64_t v31 = *v13++;
              ((void (*)(uint64_t, const char *, ...))a3)(a4, " %.2x", v31);
              --v30;
            }

            while (v30);
            char v13 = v29;
            int v16 = v28;
            int v17 = v27;
            uint64_t v4 = v26;
            int v7 = v41;
          }

          v7 -= v19;
          a3(a4, v17);
          int v18 = v13;
          if (v7 <= 1) {
            goto LABEL_73;
          }
          break;
        case 3:
          char v13 = v18;
          if (v19 >= 4)
          {
            a3(a4, "quality ");
            char v13 = v18 + 4;
            int v23 = a4;
            int v24 = "lqr";
            goto LABEL_53;
          }

          goto LABEL_54;
        case 4:
          char v13 = v18;
          if ((_DWORD)v19 == 6)
          {
            char v13 = v18 + 6;
            int v23 = a4;
            int v24 = "magic 0x%x";
            goto LABEL_53;
          }

          goto LABEL_54;
        case 6:
          char v13 = v18;
          if ((_DWORD)v19 == 2)
          {
            char v13 = v18 + 2;
            int v23 = a4;
            int v24 = "pcomp";
            goto LABEL_53;
          }

          goto LABEL_54;
        case 7:
          char v13 = v18;
          if ((_DWORD)v19 == 2)
          {
            char v13 = v18 + 2;
            int v23 = a4;
            int v24 = "accomp";
            goto LABEL_53;
          }

          goto LABEL_54;
        case 12:
          char v13 = v18;
          if (v19 >= 3)
          {
            a3(a4, "callback ");
            char v13 = v18 + 3;
            if (v18[2] == 6)
            {
              int v23 = a4;
              int v24 = "CBCP";
            }

            else
            {
LABEL_52:
              int v23 = a4;
              int v24 = "0x%x";
            }

            goto LABEL_53;
          }

          goto LABEL_54;
        case 16:
          char v13 = v18;
          if ((_DWORD)v19 == 4)
          {
            char v13 = v18 + 4;
            int v23 = a4;
            int v24 = "mrru %d";
            goto LABEL_53;
          }

          goto LABEL_54;
        case 17:
          char v13 = v18;
          if ((_DWORD)v19 == 2)
          {
            char v13 = v18 + 2;
            int v23 = a4;
            int v24 = "ssnhf";
LABEL_53:
            a3(v23, v24);
          }

          goto LABEL_54;
        case 18:
          a3(a4, "endpoint");
          char v13 = v18;
          goto LABEL_54;
        default:
          goto LABEL_54;
      }
    }
  }

  if (((1 << v11) & 0xE00) != 0)
  {
    uint64_t v20 = v6 >= 8;
    int v15 = v6 - 8;
    if (v20)
    {
      ((void (*)(uint64_t, const char *, ...))a3)(a4, " magic=0x%x", bswap32(*((_DWORD *)a1 + 1)));
      char v13 = (char *)(a1 + 12);
      int v7 = v15;
    }

    goto LABEL_73;
  }

  if (((1 << v11) & 0x60) == 0) {
    goto LABEL_73;
  }
  if (v6 >= 5)
  {
    if (*v13 - 32 > 0x5E)
    {
LABEL_74:
      char v35 = 0LL;
      int v36 = (v7 - 1);
      else {
        int v37 = v7 - 1;
      }
      uint64_t v38 = ~v37;
      if (v36 >= 0x1F) {
        LODWORD(v36) = 31;
      }
      int v39 = v36 + 1;
      do
        ((void (*)(uint64_t, const char *, ...))a3)(a4, " %.2x", v13[v35++]);
      while (v39 != (_DWORD)v35);
      if ((int)v35 >= v7)
      {
        LODWORD(lcp_close(0, "Connect time expired", v8, v9, v10, v11, v12, v13) = (_DWORD)v13 + v35;
      }

      else
      {
        a3(a4, " ...");
        LODWORD(lcp_close(0, "Connect time expired", v8, v9, v10, v11, v12, v13) = (_DWORD)v13 + v7 + v38 + v35;
      }

      return ((_DWORD)v13 - (_DWORD)a1);
    }

    a3(a4, " ");
    print_string(v13, v6 - 4, a3, a4);
    LODWORD(lcp_close(0, "Connect time expired", v8, v9, v10, v11, v12, v13) = (_DWORD)v13 + v7;
  }

  return ((_DWORD)v13 - (_DWORD)a1);
}

uint64_t sub_10000B2C4( int *a1, uint64_t __src, int *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a4;
  int v9 = (char *)__src;
  int v10 = *a1;
  int v11 = (char *)&ipcp_hisoptions + 52 * *a1;
  int v12 = (char *)&ipcp_allowoptions + 52 * *a1;
  int v13 = *a3;
  *((_DWORD *)v11 + 12) = 0;
  int v14 = (char *)&ipcp_hisoptions + 52 * v10;
  *((_OWORD *)v14 + 1) = 0u;
  int v56 = v14 + 16;
  *((_OWORD *)v14 + 2) = 0u;
  uint64_t v62 = v14 + 32;
  *(_OWORD *)int v11 = 0u;
  int v57 = v12 + 5;
  int v55 = v11 + 5;
  int v50 = v11 + 6;
  int v54 = v11 + 20;
  uint64_t v53 = (unsigned __int8 *)(v11 + 24);
  unsigned __int8 v47 = (int *)(v12 + 20);
  unsigned int v45 = v12 + 24;
  int v15 = (char *)&ipcp_wantoptions + 52 * v10;
  int v44 = (unsigned __int8 *)(v15 + 24);
  int v64 = v11 + 1;
  uint64_t v63 = (unsigned int *)(v15 + 32);
  int v49 = v15 + 8;
  int v58 = v12 + 1;
  uint64_t v59 = (char *)&ipcp_allowoptions + 52 * v10;
  uint64_t v60 = v15 + 28;
  char v48 = v15 + 7;
  uint64_t v65 = (char *)&ipcp_hisoptions + 52 * v10;
  int v51 = v11 + 28;
  int v43 = v15 + 2;
  uint64_t v16 = 2LL;
  int v17 = (char *)__src;
  int v52 = v10;
  while (v13)
  {
    int v18 = v9;
    if (v13 >= 2
      && ((uint64_t v19 = v9[1], v19 >= 2) ? (v20 = v13 >= v19) : (v20 = 0), v20))
    {
      int v21 = *v9;
      v13 -= v19;
      v9 += v19;
      if (*v18 <= 0x80u)
      {
        if (v21 == 1)
        {
          if (!*v58 || (_DWORD)v19 != 10 || *v65)
          {
LABEL_92:
            int v35 = 1;
            goto LABEL_97;
          }

          int v28 = htonl(bswap32(*(_DWORD *)(v18 + 2)));
          uint64_t v29 = *v63;
          if (v28 == (_DWORD)v29)
          {
            if (!v28)
            {
              *int v43 = 0;
              int v35 = 1;
              LOWORD(v19) = 10;
              goto LABEL_97;
            }

            int v30 = v17;
            int v26 = 2;
            goto LABEL_77;
          }

          int v30 = v17;
          if (v28)
          {
            if (*v49) {
              int v26 = 2;
            }
            else {
              int v26 = 3;
            }
            if (*v49 || v8) {
              goto LABEL_77;
            }
LABEL_75:
            *(_DWORD *)(v18 + 2) = bswap32(ntohl(v29));
          }

          else if (!v8)
          {
            goto LABEL_75;
          }

          int v26 = 3;
LABEL_77:
          int v36 = htonl(bswap32(*(_DWORD *)(v18 + 6)));
          uint64_t v37 = *v60;
          if (v36 != (_DWORD)v37)
          {
            if (v36 && *v48)
            {
              *uint64_t v60 = v36;
            }

            else
            {
              if (!v8) {
                *(_DWORD *)(v18 + 6) = bswap32(ntohl(v37));
              }
              int v26 = 3;
            }
          }

          *int v64 = 1;
          *uint64_t v62 = v28;
          *int v51 = v36;
          int v17 = v30;
          int v10 = v52;
          goto LABEL_85;
        }

        if (v21 != 2)
        {
          if (v21 != 3 || !*v59 || (_DWORD)v19 != 6 || *v64) {
            goto LABEL_92;
          }
          int v24 = htonl(bswap32(*(_DWORD *)(v18 + 2)));
          uint64_t v25 = *v63;
          if (v24 == (_DWORD)v25)
          {
            if (!v24)
            {
              *int v43 = 0;
              int v35 = 1;
              LOWORD(v19) = 6;
              goto LABEL_97;
            }

            int v26 = 2;
            goto LABEL_73;
          }

          if (v24)
          {
            if (*v49) {
              int v26 = 2;
            }
            else {
              int v26 = 3;
            }
            if (*v49 || v8) {
              goto LABEL_73;
            }
LABEL_71:
            *(_DWORD *)(v18 + 2) = bswap32(ntohl(v25));
          }

          else if (!v8)
          {
            goto LABEL_71;
          }

          int v26 = 3;
LABEL_73:
          _BYTE *v65 = 1;
          *uint64_t v62 = v24;
          goto LABEL_85;
        }

        if ((v19 & 0xFFFFFFFD) != 4 || !*v57) {
          goto LABEL_92;
        }
        unsigned int v31 = __rev16(*((unsigned __int16 *)v18 + 1));
        if (v31 == 45)
        {
          _BYTE *v55 = 1;
          _DWORD *v56 = 45;
          if ((_DWORD)v19 == 6)
          {
            int v32 = v18[4];
            int v33 = *v47;
            if (*v47 >= v32) {
              int v26 = 2;
            }
            else {
              int v26 = 3;
            }
            if (v33 < v32 && !v8)
            {
              v18[4] = v33;
              int v26 = 3;
            }

            unsigned __int8 v34 = v18[5];
            if (v34)
            {
              if (!*v45)
              {
                int v26 = 3;
                if (!v8)
                {
                  v18[5] = *v44;
                  int v26 = 3;
                }
              }
            }

            *int v54 = v32;
            *uint64_t v53 = v34;
            goto LABEL_85;
          }
        }

        else
        {
          if ((_DWORD)v19 != 4 || v31 != 55) {
            goto LABEL_92;
          }
          _BYTE *v55 = 1;
          _DWORD *v56 = 55;
        }

        *int v50 = 1;
        *int v54 = 15;
        int v26 = 2;
        *uint64_t v53 = 1;
      }

      else
      {
        switch(v21)
        {
          case 129:
          case 131:
            BOOL v22 = v21 == 131;
            if ((_DWORD)v19 != 6) {
              goto LABEL_92;
            }
            uint64_t v23 = *((unsigned int *)&ipcp_allowoptions + 13 * v10 + v22 + 9);
            if (!(_DWORD)v23) {
              goto LABEL_92;
            }
            break;
          case 130:
          case 132:
            BOOL v27 = v21 == 132;
            if ((_DWORD)v19 != 6) {
              goto LABEL_92;
            }
            uint64_t v23 = *((unsigned int *)&ipcp_allowoptions + 13 * v10 + v27 + 11);
            if (!(_DWORD)v23) {
              goto LABEL_92;
            }
            break;
          default:
            goto LABEL_92;
        }

        if (htonl(bswap32(*(_DWORD *)(v18 + 2))) != (_DWORD)v23)
        {
          *(_DWORD *)(v18 + 2) = bswap32(ntohl(v23));
          goto LABEL_88;
        }

        int v26 = 2;
      }

LABEL_85:
      if (v26 != 2 || (_DWORD)v16 == 2)
      {
        if (v26 != 3)
        {
          int v35 = 0;
          goto LABEL_97;
        }

LABEL_88:
        if (v8) {
          goto LABEL_92;
        }
        if ((_DWORD)v16 != 4)
        {
          int v35 = 0;
          if ((_DWORD)v16 == 2)
          {
            LODWORD(v16) = 3;
            int v17 = (char *)__src;
          }

          else
          {
            LODWORD(v16) = 3;
          }

          goto LABEL_97;
        }
      }
    }

    else
    {
      if (debug) {
        dbglog("ipcp_reqci: bad CI length!", __src, (uint64_t)a3, a4, a5, a6, a7, a8, v42);
      }
      int v35 = 1;
      LOWORD(v19) = v13;
      int v13 = 0;
LABEL_97:
      BOOL v38 = v16 != 4;
      if ((v35 & v38) != 0) {
        uint64_t v16 = 4LL;
      }
      else {
        uint64_t v16 = v16;
      }
      if ((v35 & v38) != 0) {
        int v39 = (char *)__src;
      }
      else {
        int v39 = v17;
      }
      if (v39 != v18) {
        memcpy(v39, v18, (unsigned __int16)v19);
      }
      int v17 = &v39[(unsigned __int16)v19];
    }
  }

  if ((_DWORD)v16 != 4 && !*v65 && !*v64 && !v8 && *v43)
  {
    if ((_DWORD)v16 == 2)
    {
      *int v43 = 0;
      int v17 = (char *)__src;
    }

    *(_WORD *)int v17 = 1539;
    *(_DWORD *)(v17 + 2) = bswap32(ntohl(*v63));
    LODWORD(v17) = (_DWORD)v17 + 6;
    uint64_t v16 = 3LL;
  }

  *a3 = (_DWORD)v17 - __src;
  if (debug)
  {
    int v40 = "REJ";
    if ((_DWORD)v16 == 3) {
      int v40 = "NAK";
    }
    if ((_DWORD)v16 == 2) {
      int v40 = "ACK";
    }
    dbglog("ipcp: returning Configure-%s", __src, (uint64_t)a3, a4, a5, a6, a7, a8, (int)v40);
  }

  return v16;
}

void sub_10000B954( int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9 = *a1;
  int v10 = (char *)&ipcp_hisoptions + 52 * *a1;
  if (debug) {
    dbglog("ipcp: up", a2, a3, a4, a5, a6, a7, a8, v100);
  }
  if (!*v10 && !*((_BYTE *)&ipcp_hisoptions + 52 * v9 + 1)) {
    *((_DWORD *)&ipcp_hisoptions + 13 * v9 + 8) = *((_DWORD *)&ipcp_wantoptions + 13 * v9 + 8);
  }
  int v11 = (char *)&ipcp_gotoptions + 52 * v9;
  int v13 = *((_DWORD *)v11 + 7);
  int v12 = (int *)(v11 + 28);
  if (!v13)
  {
    error("Could not determine local IP address", a2, a3, a4, a5, a6, a7, a8, v100);
    int v51 = (char *)&ipcp_fsm + 80 * *a1;
    int v52 = "Could not determine local IP address";
LABEL_48:
    fsm_close((uint64_t)v51, v52, v50, v40, v41, v42, v43, v44);
    return;
  }

  int v14 = (char *)&ipcp_hisoptions + 52 * v9;
  int v16 = *((_DWORD *)v14 + 8);
  int v15 = (int *)(v14 + 32);
  if (!v16)
  {
    int v17 = htonl((ifunit + 171982912));
    *int v15 = v17;
    warning("Could not determine remote IP address: defaulting to %I", v18, v19, v20, v21, v22, v23, v24, v17);
  }

  slprintf((int)byte_10004631C, 64, "%I");
  script_setenv("IPLOCAL", byte_10004631C);
  int v101 = *v15;
  slprintf((int)byte_10004631C, 64, "%I");
  script_setenv("IPREMOTE", byte_10004631C);
  uint64_t v25 = (char *)&ipcp_gotoptions + 52 * v9;
  int v28 = *((_DWORD *)v25 + 9);
  BOOL v27 = (unsigned int *)(v25 + 36);
  int v26 = v28;
  if (v28)
  {
    int v101 = v26;
    slprintf((int)byte_10004631C, 64, "%I");
    script_setenv("DNS1", byte_10004631C);
  }

  uint64_t v29 = (char *)&ipcp_gotoptions + 52 * v9;
  int v32 = *((_DWORD *)v29 + 10);
  unsigned int v31 = (unsigned int *)(v29 + 40);
  int v30 = v32;
  if (v32)
  {
    int v101 = v30;
    slprintf((int)byte_10004631C, 64, "%I");
    script_setenv("DNS2", byte_10004631C);
  }

  if (byte_10004636C && (*v27 || *v31))
  {
    script_setenv("USEPEERDNS", "1");
    sifdns(*v27, *v31);
  }

  if (!auth_ip_addr(*a1, *v15))
  {
    error("Peer is not authorized to use remote address %I", v33, v34, v35, v36, v37, v38, v39, *v15);
    int v51 = (char *)&ipcp_fsm + 80 * *a1;
    int v52 = "Unauthorized remote IP address";
    goto LABEL_48;
  }

  sifvjcomp( *a1,  *((unsigned __int8 *)&ipcp_hisoptions + 52 * v9 + 5),  *((unsigned __int8 *)&ipcp_hisoptions + 52 * v9 + 24),  *((_DWORD *)&ipcp_hisoptions + 13 * v9 + 5));
  uint64_t v45 = *v12;
  if (!demand)
  {
    int Mask = GetMask(v45);
    if (sifaddr(*a1, *v12, *v15, Mask))
    {
      if (sifup())
      {
        sifnpmode(*a1, 33, 0);
        uint64_t v61 = *a1;
        if (*((_BYTE *)&ipcp_wantoptions + 52 * (int)v61 + 3))
        {
          int v62 = sifdefaultroute();
          uint64_t v61 = *a1;
          int v63 = *a1;
          if (v62) {
            dword_100046384[(int)v61] = 1;
          }
        }

        else
        {
          int v63 = *a1;
        }

        dword_10004377C = *v12;
        notice("local  IP address %I", v54, v55, v56, v57, v58, v59, v60, dword_10004377C);
        notice("remote IP address %I", v86, v87, v88, v89, v90, v91, v92, *v15);
        if (*v27) {
          notice("primary   DNS address %I", v93, v94, v95, v96, v97, v98, v99, *v27);
        }
        if (*v31) {
          notice("secondary DNS address %I", v93, v94, v95, v96, v97, v98, v99, *v31);
        }
        goto LABEL_54;
      }

      if (!debug) {
        goto LABEL_47;
      }
      __int128 v83 = "Interface failed to come up";
      goto LABEL_46;
    }

LABEL_44:
    if (!debug)
    {
LABEL_47:
      int v51 = (char *)&ipcp_fsm + 80 * *a1;
      int v52 = "Interface configuration failed";
      goto LABEL_48;
    }

    __int128 v83 = "Interface configuration failed";
LABEL_46:
    warning(v83, v47, v50, v40, v41, v42, v43, v44, v101);
    goto LABEL_47;
  }

  int v46 = (char *)&ipcp_wantoptions + 52 * v9;
  unsigned int v49 = *((_DWORD *)v46 + 7);
  char v48 = (int *)(v46 + 28);
  uint64_t v47 = v49;
  if ((_DWORD)v45 != v49)
  {
    LODWORD(v50) = *((_DWORD *)&ipcp_wantoptions + 13 * v9 + 8);
LABEL_34:
    int v64 = (int *)((char *)&ipcp_wantoptions + 52 * v9 + 32);
    sub_10000C214(*a1, v47, v50);
    if (*v12 == *v48)
    {
      script_unsetenv("OLDIPLOCAL");
    }

    else
    {
      warning("Local IP address changed to %I", v65, v66, v67, v68, v69, v70, v71, *v12);
      int v101 = *v48;
      slprintf((int)byte_10004631C, 64, "%I");
      script_setenv("OLDIPLOCAL", byte_10004631C);
      *char v48 = *v12;
    }

    if (*v15 == *v64)
    {
      script_unsetenv("OLDIPREMOTE");
    }

    else
    {
      warning("Remote IP address changed to %I", v72, v73, v74, v75, v76, v77, v78, *v15);
      int v101 = *v64;
      slprintf((int)byte_10004631C, 64, "%I");
      script_setenv("OLDIPREMOTE", byte_10004631C);
      *int v64 = *v15;
    }

    int v79 = GetMask(*v12);
    if (sifaddr(*a1, *v12, *v15, v79))
    {
      uint64_t v80 = *a1;
      if (*((_BYTE *)&ipcp_wantoptions + 52 * (int)v80 + 3))
      {
        int v81 = sifdefaultroute();
        uint64_t v80 = *a1;
        int v82 = *a1;
        if (v81) {
          dword_100046384[(int)v80] = 1;
        }
      }

      else
      {
        int v82 = *a1;
      }

      goto LABEL_53;
    }

    goto LABEL_44;
  }

  uint64_t v50 = *((unsigned int *)&ipcp_wantoptions + 13 * v9 + 8);
  if (*v15 != (_DWORD)v50) {
    goto LABEL_34;
  }
LABEL_53:
  demand_rexmit(33, v47, v50, v40, v41, v42, v43, v44);
  sifnpmode(*a1, 33, 0);
LABEL_54:
  np_up();
  byte_10004638C = 1;
  int v84 = notify((uint64_t **)ip_up_notifier, 0);
  if (ipdata_up_hook) {
    int v84 = (uint64_t **)ipdata_up_hook(*a1, *v12, *v15);
  }
  if (ip_up_hook) {
    ip_up_hook(v84);
  }
  notify((uint64_t **)ip_up_notify, 0);
  if ((byte_100046390 & 1) == 0 && !dword_100046394)
  {
    byte_100046390 = 1;
    if (ip_up_script) {
      __int16 v85 = (char *)ip_up_script;
    }
    else {
      __int16 v85 = "/etc/ppp/ip-up";
    }
    sub_10000C29C(v85);
  }

uint64_t sub_10000C06C( int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (debug) {
    dbglog("ipcp: down", a2, a3, a4, a5, a6, a7, a8, v12);
  }
  update_link_stats(*a1);
  int v9 = notify((uint64_t **)ip_down_notifier, 0);
  if (ipdata_down_hook) {
    int v9 = (uint64_t **)ipdata_down_hook(*a1);
  }
  if (ip_down_hook) {
    ip_down_hook(v9);
  }
  if (byte_10004638C == 1)
  {
    byte_10004638C = 0;
    np_down();
  }

  sifvjcomp(*a1, 0, 0, 0);
  notify((uint64_t **)ip_down_notify, 0);
  uint64_t v10 = *a1;
  if (demand)
  {
    uint64_t result = sifnpmode(v10, 33, 3);
  }

  else
  {
    sifnpmode(v10, 33, 1);
    sifdown();
    uint64_t result = sub_10000C214( *a1,  *((_DWORD *)&ipcp_gotoptions + 13 * *a1 + 7),  *((_DWORD *)&ipcp_hisoptions + 13 * *a1 + 8));
  }

  if (byte_100046390 == 1 && !dword_100046394)
  {
    byte_100046390 = 0;
    if (ip_down_script) {
      return sub_10000C29C((char *)ip_down_script);
    }
    else {
      return sub_10000C29C("/etc/ppp/ip-down");
    }
  }

  return result;
}

void sub_10000C1C8( unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (byte_100046398 == 1)
  {
    byte_100046398 = 0;
    np_finished(*a1, 33LL, a3, a4, a5, a6, a7, a8);
  }

uint64_t **sub_10000C1EC(uint64_t **result)
{
  if (*((_DWORD *)result + 6) - *((_DWORD *)result + 7) == 2) {
    return notify((uint64_t **)protocolsready_notifier, 0);
  }
  return result;
}

uint64_t sub_10000C214(uint64_t a1, int a2, int a3)
{
  uint64_t v6 = (int)a1;
  if (dword_100046388[(int)a1])
  {
    cifproxyarp();
    dword_100046388[v6] = 0;
  }

  if (dword_100046384[v6])
  {
    cifdefaultroute();
    dword_100046384[v6] = 0;
  }

  return cifaddr(a1, a2, a3);
}

uint64_t sub_10000C29C(char *a1)
{
  v3[0] = a1;
  v3[1] = &ifname;
  v3[2] = (char *)&devnam;
  v3[3] = v6;
  v3[4] = v5;
  v3[5] = v4;
  v3[6] = (char *)ipparam;
  v3[7] = 0LL;
  uint64_t result = run_program(a1, v3, 0, (uint64_t)sub_10000C3BC, 0LL);
  dword_100046394 = result;
  return result;
}

void sub_10000C3BC()
{
  dword_100046394 = 0;
  if (byte_100046390 == 1)
  {
    if (dword_100043838 == 9) {
      return;
    }
    byte_100046390 = 0;
    uint64_t v0 = ip_down_script;
    int v1 = "/etc/ppp/ip-down";
  }

  else
  {
    if (dword_100043838 != 9) {
      return;
    }
    byte_100046390 = 1;
    uint64_t v0 = ip_up_script;
    int v1 = "/etc/ppp/ip-up";
  }

  if (v0) {
    sub_10000C29C(v0);
  }
  else {
    sub_10000C29C(v1);
  }
}

double sub_10000C42C(int a1)
{
  int v1 = (char *)&lcp_fsm + 80 * a1;
  int v2 = (char *)&lcp_wantoptions + 68 * a1;
  char v3 = (char *)&lcp_allowoptions + 68 * a1;
  *(_DWORD *)int v1 = a1;
  *((_DWORD *)v1 + 1) = 49185;
  *((void *)v1 + 7) = off_10003F808;
  fsm_init((uint64_t)v1);
  *(_OWORD *)int v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  *((_DWORD *)v2 + 16) = 0;
  *((_OWORD *)v2 + 2) = 0u;
  *((_OWORD *)v2 + 3) = 0u;
  *(_WORD *)(v2 + 3) = 257;
  *((_DWORD *)v2 + 4) = 1500;
  *((_WORD *)v2 + 4) = 257;
  v2[10] = 1;
  *(_OWORD *)char v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *((_OWORD *)v3 + 2) = 0u;
  *((_OWORD *)v3 + 3) = 0u;
  *((_DWORD *)v3 + 16) = 0;
  *((_DWORD *)v3 + 4) = 0x4000;
  v3[24] = 7;
  double result = 7.74860419e-304;
  *(_DWORD *)(v3 + 3) = 16843009;
  v3[15] = 1;
  *(_DWORD *)(v3 + 7) = 16843009;
  return result;
}

void sub_10000C4EC( int a1, char *__src, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  int v11 = (char *)&lcp_fsm + 80 * a1;
  int v12 = *((_DWORD *)v11 + 3);
  if ((v12 & 0x100) != 0)
  {
    *((_DWORD *)v11 + 3) = v12 & 0xFFFFFEFF;
    fsm_lowerup((uint64_t)&lcp_fsm + 80 * a1, (uint64_t)__src, a3, a4, a5, a6, a7, a8);
  }

  fsm_input((uint64_t)v11, __src, a3, a4, a5, a6, a7, a8, a9);
}

void sub_10000C54C( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void lcp_lowerup(uint64_t a1)
{
  if ((ppp_send_config(a1, 1500LL, 0xFFFFFFFFLL, 0LL, 0LL) & 0x80000000) == 0)
  {
    uint64_t v2 = (int)a1;
    if (lax_recv) {
      uint64_t v3 = 0LL;
    }
    else {
      uint64_t v3 = 0xFFFFFFFFLL;
    }
    if ((ppp_recv_config( a1,  1500LL,  v3,  *((unsigned __int8 *)&lcp_wantoptions + 68 * (int)a1 + 9),  *((unsigned __int8 *)&lcp_wantoptions + 68 * (int)a1 + 10)) & 0x80000000) == 0)
    {
      uint64_t v4 = (char *)&lcp_fsm + 80 * (int)a1;
      peer_mru[v2] = 1500;
      notify((uint64_t **)lcp_lowerup_notify, 0);
      if (listen_time)
      {
        *((_DWORD *)&lcp_fsm + 20 * (int)v2 + 3) |= 0x100u;
        timeout((int)sub_10000CE80);
      }

      else
      {
        fsm_lowerup((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }

void lcp_lowerdown(int a1)
{
  uint64_t v2 = (char *)&lcp_fsm + 80 * a1;
  int v5 = *((_DWORD *)v2 + 3);
  uint64_t v3 = (unsigned int *)(v2 + 12);
  int v4 = v5;
  if ((v5 & 0x100) != 0) {
    *uint64_t v3 = v4 & 0xFFFFFEFF;
  }
  else {
    fsm_lowerdown((uint64_t)&lcp_fsm + 80 * a1);
  }
}

void lcp_open(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = (char *)&lcp_fsm + 80 * a1;
  int v10 = *((_DWORD *)v8 + 3);
  uint64_t v9 = (unsigned int *)(v8 + 12);
  unsigned int v11 = v10 & 0xFFFFFFFA;
  *uint64_t v9 = v10 & 0xFFFFFFFA;
  if (*((_BYTE *)&lcp_wantoptions + 68 * a1))
  {
    v11 |= 1u;
    *uint64_t v9 = v11;
  }

  if (*((_BYTE *)&lcp_wantoptions + 68 * a1 + 1)) {
    *uint64_t v9 = v11 | 4;
  }
  fsm_open((uint64_t)&lcp_fsm + 80 * a1, a2, a3, a4, a5, a6, a7, a8);
}

void lcp_close(int a1, char *__s, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v10 = (char *)&lcp_fsm + 80 * a1;
  unsigned int v11 = v10 + 12;
  if ((v10[13] & 1) != 0)
  {
    untimeout((uint64_t)sub_10000CE80, (uint64_t)v10);
    if ((*v11 & 0x100) != 0)
    {
      *v11 &= ~0x100u;
      fsm_lowerup((uint64_t)v10, (uint64_t)__s, a3, a4, a5, a6, a7, a8);
    }
  }

  if (phase) {
    new_phase(9LL);
  }
  uint64_t v12 = (char *)&lcp_fsm + 80 * a1;
  int v14 = *((_DWORD *)v12 + 2);
  uint64_t v13 = v12 + 8;
  if (v14 == 3 && (*(_BYTE *)v11 & 5) != 0)
  {
    notice("LCP close (%s).", (uint64_t)__s, a3, a4, a5, a6, a7, a8, (int)__s);
    *uint64_t v13 = 2;
  }

  else
  {
    fsm_close((uint64_t)v10, __s, a3, a4, a5, a6, a7, a8);
    if (!*v13) {
      notice("LCP close (%s).", v15, v16, v17, v18, v19, v20, v21, (int)__s);
    }
  }

  link_terminated();
}

uint64_t sub_10000C854(unsigned __int8 *a1, int a2, void (*a3)(uint64_t, const char *), uint64_t a4)
{
  if (a2 < 4) {
    return 0LL;
  }
  unsigned int v6 = __rev16(*((unsigned __int16 *)a1 + 1));
  int v7 = v6 - 4;
  if (v6 < 4 || v6 > a2) {
    return 0LL;
  }
  unsigned int v11 = *a1;
  int v12 = a1[1];
  uint64_t v13 = (char *)(a1 + 4);
  if (v11 - 1 > 0xA) {
    int v14 = " code=0x%x";
  }
  else {
    int v14 = " %s";
  }
  a3(a4, v14);
  ((void (*)(uint64_t, const char *, ...))a3)(a4, " id=0x%x", v12);
  if (v11 > 0xB)
  {
LABEL_73:
    if (v7 >= 1) {
      goto LABEL_74;
    }
    return ((_DWORD)v13 - (_DWORD)a1);
  }

  if (((1 << v11) & 0x1E) != 0)
  {
    if (v6 < 6) {
      goto LABEL_73;
    }
    uint64_t v16 = " <";
    uint64_t v17 = ">";
    uint64_t v18 = v13;
    while (1)
    {
      uint64_t v19 = v18[1];
      BOOL v20 = v19 >= 2 && v7 >= v19;
      if (!v20)
      {
        uint64_t v13 = v18;
        goto LABEL_74;
      }

      int v21 = *v18;
      a3(a4, v16);
      int v22 = v21 - 1;
      uint64_t v13 = v18;
      switch(v22)
      {
        case 0:
          uint64_t v13 = v18;
          if ((_DWORD)v19 == 4)
          {
            uint64_t v13 = v18 + 4;
            uint64_t v23 = a4;
            uint64_t v24 = "mru %d";
            goto LABEL_53;
          }

          goto LABEL_54;
        case 1:
          uint64_t v13 = v18;
          if ((_DWORD)v19 == 6)
          {
            uint64_t v13 = v18 + 6;
            uint64_t v23 = a4;
            uint64_t v24 = "asyncmap 0x%x";
            goto LABEL_53;
          }

          goto LABEL_54;
        case 2:
          uint64_t v13 = v18;
          a3(a4, "auth ");
          uint64_t v13 = v18 + 4;
          unsigned int v25 = __rev16(*((unsigned __int16 *)v18 + 1));
          if (v25 == 49703)
          {
            uint64_t v23 = a4;
            uint64_t v24 = "eap";
            goto LABEL_53;
          }

          if (v25 != 49699)
          {
            if (v25 != 49187) {
              goto LABEL_52;
            }
            uint64_t v23 = a4;
            uint64_t v24 = "pap";
            goto LABEL_53;
          }

          a3(a4, "chap");
          int v32 = *v13;
          switch(v32)
          {
            case 129:
              uint64_t v33 = a4;
              uint64_t v34 = " MS-v2";
              goto LABEL_68;
            case 128:
              uint64_t v33 = a4;
              uint64_t v34 = " MS";
              goto LABEL_68;
            case 5:
              uint64_t v33 = a4;
              uint64_t v34 = " MD5";
LABEL_68:
              a3(v33, v34);
              uint64_t v13 = v18 + 5;
              break;
          }

void sub_10000CDD8(int a1)
{
  if (byte_1000463A0 == 1)
  {
    untimeout((uint64_t)sub_10000CF40, (uint64_t)&lcp_fsm + 80 * a1);
    byte_1000463A0 = 0;
  }

void sub_10000CE20(int a1)
{
  dword_10004639C = 0;
  dword_100046980 = 0;
  byte_1000463A0 = 0;
  ppp_auxiliary_probe_init();
}

void sub_10000CE80( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = *(_DWORD *)(a1 + 12);
  if ((v8 & 0x100) != 0)
  {
    *(_DWORD *)(a1 + 12) = v8 & 0xFFFFFEFF;
    fsm_lowerup(a1, a2, a3, a4, a5, a6, a7, a8);
  }

void sub_10000CE98()
{
}

void lcp_sprotrej( int a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  uint64_t v9 = (unsigned int *)((char *)&lcp_fsm + 80 * a1);
  char v10 = *((_BYTE *)v9 + 16) + 1;
  *((_BYTE *)v9 + 16) = v10;
  fsm_sdata(v9, 8, v10, (char *)(a2 + 2), (a3 - 2), a6, a7, a8, a9);
}

void lcp_echo_restart(int a1)
{
  int v1 = (int *)((char *)&lcp_fsm + 80 * a1);
  dword_10004639C = 0;
  if (byte_1000463A0 == 1)
  {
    untimeout((uint64_t)sub_10000CF40, (uint64_t)v1);
    byte_1000463A0 = 0;
  }

uint64_t sub_10000CF40()
{
  if (byte_1000463A0 == 1)
  {
    byte_1000463A0 = 0;
    return sub_10000CF5C();
  }

  return result;
}

void sub_10000CF5C(int *a1)
{
  if (ppp_variable_echo_is_off() && get_idle_time(0LL, (uint64_t)v12) && v13 < lcp_echo_interval)
  {
    dword_10004639C = 0;
    ppp_auxiliary_probe_stop();
  }

  else
  {
    if (lcp_echo_fails)
    {
      int v9 = dword_10004639C;
      if (dword_10004639C >= lcp_echo_fails)
      {
        sub_10000FB08(a1, v2, v3, v4, v5, v6, v7, v8);
        int v9 = 0;
        dword_10004639C = 0;
      }

      ppp_auxiliary_probe_check(v9, (void (*)(uint64_t))sub_10000FB08, (uint64_t)a1, v4, v5, v6, v7, v8);
    }

    if (a1[2] == 9)
    {
      __srCC_SHA1_CTX c = bswap32(*(_DWORD *)&lcp_gotoptions[68 * *a1 + 32]);
      char v10 = dword_100046980++;
      fsm_sdata((unsigned int *)a1, 9, v10, (char *)&__src, 4LL, v6, v7, v8, v11);
      ++dword_10004639C;
    }
  }

  if (a1[2] == 9)
  {
    if (byte_1000463A0 == 1) {
      warning("assertion lcp_echo_timer_running==0 failed", v2, v3, v4, v5, v6, v7, v8, v11);
    }
    timeout((int)sub_10000CF40);
    byte_1000463A0 = 1;
  }

uint64_t sub_10000D0A8()
{
  dword_100043950 = 0;
  xmmword_100043930 = 0u;
  unk_100043940 = 0u;
  lcp_wantoptions = 0u;
  unk_100043920 = 0u;
  lcp_allowoptions = 0u;
  *(_OWORD *)&dword_1000439A8 = 0u;
  xmmword_1000439B8 = 0u;
  unk_1000439C8 = 0u;
  dword_1000439D8 = 0;
  return 1LL;
}

uint64_t sub_10000D0DC(unsigned int *a1)
{
  uint64_t v2 = (int)*a1;
  uint64_t v3 = (char *)&lcp_wantoptions + 68 * v2;
  uint64_t v4 = (char *)&lcp_gotoptions + 68 * v2;
  *((_DWORD *)v3 + 8) = magic();
  *((_DWORD *)v3 + 9) = 0;
  *((_DWORD *)v4 + 16) = *((_DWORD *)v3 + 16);
  __int128 v5 = *((_OWORD *)v3 + 1);
  *(_OWORD *)uint64_t v4 = *(_OWORD *)v3;
  *((_OWORD *)v4 + 1) = v5;
  __int128 v6 = *((_OWORD *)v3 + 3);
  *((_OWORD *)v4 + 2) = *((_OWORD *)v3 + 2);
  *((_OWORD *)v4 + 3) = v6;
  if (!multilink)
  {
    uint64_t v7 = (char *)&lcp_gotoptions + 68 * (int)v2;
    *(_WORD *)(v7 + 13) = 0;
    v7[15] = 0;
  }

  peer_mru[*a1] = 1500;
  return auth_reset(*a1);
}

uint64_t sub_10000D1A0(int *a1)
{
  int v1 = *a1;
  int v2 = *((unsigned __int8 *)&lcp_gotoptions + 68 * *a1 + 3);
  if (*((_BYTE *)&lcp_gotoptions + 68 * *a1 + 3)) {
    int v2 = 4 * (*((_DWORD *)&lcp_gotoptions + 17 * v1 + 4) != 1500);
  }
  int v3 = *((unsigned __int8 *)&lcp_gotoptions + 68 * v1 + 4);
  if (*((_BYTE *)&lcp_gotoptions + 68 * v1 + 4))
  {
    if (*((_DWORD *)&lcp_gotoptions + 17 * v1 + 7) == -1) {
      int v3 = 0;
    }
    else {
      int v3 = 6;
    }
  }

  int v4 = *((unsigned __int8 *)&lcp_gotoptions + 68 * v1 + 7);
  if (*((_BYTE *)&lcp_gotoptions + 68 * v1 + 7))
  {
    int v5 = 0;
    int v6 = 0;
  }

  else
  {
    int v5 = *((unsigned __int8 *)&lcp_gotoptions + 68 * v1 + 6);
    if (*((_BYTE *)&lcp_gotoptions + 68 * v1 + 6))
    {
      int v6 = 0;
      int v5 = 5;
    }

    else
    {
      int v6 = 4 * (*((_BYTE *)&lcp_gotoptions + 68 * v1 + 5) != 0);
    }
  }

  uint64_t v7 = (char *)&lcp_gotoptions + 68 * v1;
  if (v7[15]) {
    int v8 = *((unsigned __int8 *)&lcp_gotoptions + 68 * v1 + 45) + 3;
  }
  else {
    int v8 = 0;
  }
  int v9 = v3 + v2 + 4 * (v4 != 0) + v5 + v6 + 8 * (v7[11] != 0);
  if (v7[12]) {
    int v10 = 3;
  }
  else {
    int v10 = 0;
  }
  if (v7[8]) {
    int v11 = 6;
  }
  else {
    int v11 = 0;
  }
  return v9
       + v10
       + v11
       + 2 * (v7[9] != 0)
       + 2 * (v7[10] != 0)
       + 4 * (v7[13] != 0)
}

void sub_10000D30C( int *a1, uint64_t a2, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  int v9 = *a1;
  uint64_t v10 = a2;
  if (lcp_gotoptions[68 * *a1 + 3])
  {
    int v11 = (char *)&lcp_gotoptions[68 * v9];
    int v13 = *((_DWORD *)v11 + 4);
    int v12 = v11 + 16;
    uint64_t v10 = a2;
    if (v13 != 1500)
    {
      *(_WORD *)a2 = 1025;
      *(_BYTE *)(a2 + 2) = BYTE1(*v12);
      uint64_t v10 = a2 + 4;
      *(_BYTE *)(a2 + 3) = *v12;
    }
  }

  if (lcp_gotoptions[68 * v9 + 4])
  {
    int v14 = (char *)&lcp_gotoptions[68 * v9];
    int v16 = *((_DWORD *)v14 + 7);
    int v15 = v14 + 28;
    if (v16 != -1)
    {
      *(_WORD *)uint64_t v10 = 1538;
      *(_BYTE *)(v10 + 2) = v15[3];
      *(_BYTE *)(v10 + 3) = *((_WORD *)v15 + 1);
      *(_BYTE *)(v10 + 4) = BYTE1(*(_DWORD *)v15);
      *(_BYTE *)(v10 + 5) = *(_DWORD *)v15;
      v10 += 6LL;
    }
  }

  uint64_t v17 = (char *)&lcp_gotoptions[68 * v9];
  int v19 = v17[7];
  uint64_t v18 = v17 + 7;
  if (!v19 || (*(_DWORD *)uint64_t v10 = 667026435, v10 += 4LL, v20 = v10, !*v18))
  {
    int v21 = (char *)&lcp_gotoptions[68 * v9];
    int v23 = v21[6];
    int v22 = v21 + 6;
    if (v23)
    {
      *(_DWORD *)uint64_t v10 = 599917827;
      int v24 = lcp_gotoptions[68 * v9 + 24];
      if ((v24 & 1) != 0)
      {
        LOBYTE(v25) = -127;
      }

      else if ((v24 & 2) != 0)
      {
        LOBYTE(v25) = 0x80;
      }

      else
      {
        int v25 = (v24 << 29 >> 31) & 5;
      }

      uint64_t v20 = v10 + 5;
      *(_BYTE *)(v10 + 4) = v25;
      if (*v18 || *v22) {
        goto LABEL_20;
      }
    }

    else
    {
      uint64_t v20 = v10;
    }

    if (lcp_gotoptions[68 * v9 + 5])
    {
      *(_DWORD *)uint64_t v20 = 599786499;
      v20 += 4LL;
    }
  }

uint64_t sub_10000D634( int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = *a1;
  if (lcp_gotoptions[68 * *a1 + 3])
  {
    int v9 = *(_DWORD *)&lcp_gotoptions[68 * v8 + 16];
    if (v9 != 1500)
    {
      BOOL v11 = __OFSUB__((_DWORD)a3, 4);
      a3 = (a3 - 4);
      if ((int)a3 < 0 != v11
        || *(_BYTE *)(a2 + 1) != 4
        || *(_BYTE *)a2 != 1
        || v9 != bswap32(*(unsigned __int16 *)(a2 + 2)) >> 16)
      {
        goto LABEL_89;
      }

      a2 += 4LL;
    }
  }

  if (lcp_gotoptions[68 * v8 + 4])
  {
    int v10 = *(_DWORD *)&lcp_gotoptions[68 * v8 + 28];
    if (v10 != -1)
    {
      BOOL v11 = __OFSUB__((_DWORD)a3, 6);
      a3 = (a3 - 6);
      a2 += 6LL;
    }
  }

  if (lcp_gotoptions[68 * v8 + 7])
  {
    BOOL v11 = __OFSUB__((_DWORD)a3, 4);
    a3 = (a3 - 4);
    unsigned int v12 = bswap32(*(unsigned __int16 *)(a2 + 2));
    int v13 = 49703;
LABEL_15:
    if (v13 != HIWORD(v12)) {
      goto LABEL_89;
    }
    a2 += 4LL;
    goto LABEL_39;
  }

  if (lcp_gotoptions[68 * v8 + 6])
  {
    BOOL v11 = __OFSUB__((_DWORD)a3, 5);
    a3 = (a3 - 5);
    if ((int)a3 < 0 != v11
      || *(_BYTE *)(a2 + 1) != 5
      || *(_BYTE *)a2 != 3
      || bswap32(*(unsigned __int16 *)(a2 + 2)) >> 16 != 49699)
    {
      goto LABEL_89;
    }

    int v14 = lcp_gotoptions[68 * v8 + 24];
    if ((v14 & 1) != 0) {
      int v15 = 129;
    }
    else {
      int v15 = (v14 & 2) != 0 ? 128 : (v14 << 29 >> 31) & 5;
    }
    a2 += 5LL;
  }

  else if (lcp_gotoptions[68 * v8 + 5])
  {
    BOOL v11 = __OFSUB__((_DWORD)a3, 4);
    a3 = (a3 - 4);
    unsigned int v12 = bswap32(*(unsigned __int16 *)(a2 + 2));
    int v13 = 49187;
    goto LABEL_15;
  }

LABEL_39:
  if (lcp_gotoptions[68 * v8 + 11])
  {
    BOOL v11 = __OFSUB__((_DWORD)a3, 8);
    a3 = (a3 - 8);
    if ((int)a3 < 0 != v11
      || *(_BYTE *)(a2 + 1) != 8
      || *(_BYTE *)a2 != 4
      || bswap32(*(unsigned __int16 *)(a2 + 2)) >> 16 != 49189
      || bswap32(*(_DWORD *)(a2 + 4)) != *(_DWORD *)&lcp_gotoptions[68 * v8 + 40])
    {
      goto LABEL_89;
    }

    a2 += 8LL;
  }

  if (lcp_gotoptions[68 * v8 + 12])
  {
    BOOL v11 = __OFSUB__((_DWORD)a3, 3);
    a3 = (a3 - 3);
    a2 += 3LL;
  }

  if (lcp_gotoptions[68 * v8 + 8])
  {
    BOOL v11 = __OFSUB__((_DWORD)a3, 6);
    a3 = (a3 - 6);
    if ((int)a3 < 0 != v11
      || *(_BYTE *)(a2 + 1) != 6
      || *(_BYTE *)a2 != 5
      || bswap32(*(_DWORD *)(a2 + 2)) != *(_DWORD *)&lcp_gotoptions[68 * v8 + 32])
    {
      goto LABEL_89;
    }

    a2 += 6LL;
  }

  if (lcp_gotoptions[68 * v8 + 9])
  {
    BOOL v11 = __OFSUB__((_DWORD)a3, 2);
    a3 = (a3 - 2);
    a2 += 2LL;
  }

  if (lcp_gotoptions[68 * v8 + 10])
  {
    BOOL v11 = __OFSUB__((_DWORD)a3, 2);
    a3 = (a3 - 2);
    a2 += 2LL;
  }

  if (lcp_gotoptions[68 * v8 + 13])
  {
    BOOL v11 = __OFSUB__((_DWORD)a3, 4);
    a3 = (a3 - 4);
    if ((int)a3 < 0 != v11
      || *(_BYTE *)(a2 + 1) != 4
      || *(_BYTE *)a2 != 17
      || *(_DWORD *)&lcp_gotoptions[68 * v8 + 20] != bswap32(*(unsigned __int16 *)(a2 + 2)) >> 16)
    {
      goto LABEL_89;
    }

    a2 += 4LL;
  }

  if (lcp_gotoptions[68 * v8 + 14])
  {
    BOOL v11 = __OFSUB__((_DWORD)a3, 2);
    a3 = (a3 - 2);
    a2 += 2LL;
  }

  if (lcp_gotoptions[68 * v8 + 15])
  {
    int v16 = &lcp_gotoptions[68 * v8];
    uint64_t v17 = v16[45];
    a3 = (a3 - (v17 + 3));
    if ((int)a3 < 0
      || (_DWORD)v17 + 3 != *(unsigned __int8 *)(a2 + 1)
      || *(_BYTE *)a2 != 19
      || *(unsigned __int8 *)(a2 + 2) != v16[44])
    {
      goto LABEL_89;
    }

    if (v16[45])
    {
      uint64_t v18 = (unsigned __int8 *)(a2 + 3);
      int v19 = &lcp_gotoptions[68 * v8 + 46];
      do
      {
        int v20 = *v19++;
        if (*v18 != v20) {
          goto LABEL_89;
        }
        ++v18;
      }

      while (--v17);
    }
  }

  if (!(_DWORD)a3) {
    return 1LL;
  }
LABEL_89:
  if (debug) {
    dbglog("lcp_acki: received bad Ack!", a2, a3, a4, a5, a6, a7, a8, vars0);
  }
  return 0LL;
}

    int v19 = a1 + 4;
LABEL_40:
    int v13 = v19;
    if (v7 < 1) {
      return ((_DWORD)v13 - (_DWORD)a1);
    }
    goto LABEL_41;
  }

  if (v6 >= 5)
  {
    if (*v13 - 32 > 0x5E)
    {
LABEL_41:
      uint64_t v26 = v7 + 1;
      do
      {
        BOOL v27 = *v13++;
        ((void (*)(uint64_t, const char *, ...))a3)(a4, " %.2x", v27);
        --v26;
      }

      while (v26 > 1);
      return ((_DWORD)v13 - (_DWORD)a1);
    }

    a3(a4, " ");
    print_string((char *)a1 + 4, v6 - 4, a3, a4);
    LODWORD(lcp_close(0, "Connect time expired", v8, v9, v10, v11, v12, v13) = (_DWORD)v13 + v7;
  }

  return ((_DWORD)v13 - (_DWORD)a1);
}

uint64_t sub_10000DAA4(int *a1, uint64_t a2, uint64_t a3)
{
  int v4 = a1;
  int v5 = *a1;
  int v6 = lcp_gotoptions;
  uint64_t v7 = &lcp_gotoptions[68 * *a1];
  __int16 v140 = *(_WORD *)v7;
  unsigned __int8 v141 = v7[2];
  uint64_t v8 = v7[4];
  LODWORD(v9) = v7[5];
  LODWORD(v1notify((uint64_t **)lcp_lowerdown_notify, 0) = v7[6];
  int v11 = v7[7];
  unsigned __int8 v117 = v7[8];
  unsigned __int8 v12 = v7[9];
  unsigned __int8 v119 = v7[10];
  unsigned __int8 v136 = v7[11];
  unsigned __int8 v13 = v7[12];
  unsigned __int8 v116 = v7[13];
  uint64_t v14 = v7[14];
  unsigned __int8 v15 = v7[15];
  uint64_t v16 = *((unsigned int *)v7 + 4);
  uint64_t v17 = *((unsigned int *)v7 + 5);
  int v18 = v7[24];
  unsigned __int8 v139 = v7[27];
  __int16 v138 = *(_WORD *)(v7 + 25);
  uint64_t v19 = *((unsigned int *)v7 + 7);
  int v20 = *((_DWORD *)v7 + 8);
  int v106 = *((_DWORD *)v7 + 9);
  unsigned int v118 = *((_DWORD *)v7 + 10);
  uint64_t v143 = *(void *)(v7 + 60);
  __int128 v142 = *(_OWORD *)(v7 + 44);
  int v137 = v7[3];
  if (v7[3])
  {
    char v128 = 0;
    char v21 = 1;
    if ((int)a3 >= 4 && (_DWORD)v16 != 1500)
    {
      if (*(_BYTE *)(a2 + 1) == 4 && *(_BYTE *)a2 == 1)
      {
        char v21 = 0;
        unsigned int v22 = *(unsigned __int16 *)(a2 + 2);
        a2 += 4LL;
        unsigned int v23 = __rev16(v22);
        else {
          uint64_t v16 = v16;
        }
        char v128 = 1;
        a3 = (a3 - 4);
        if (!v7[4]) {
          goto LABEL_22;
        }
      }

      else
      {
        char v128 = 0;
        if (!v7[4]) {
          goto LABEL_22;
        }
      }

      goto LABEL_16;
    }
  }

  else
  {
    char v128 = 0;
    char v21 = 1;
  }

  if (!v7[4]) {
    goto LABEL_22;
  }
LABEL_16:
  char v127 = 0;
  char v125 = 1;
  if ((_DWORD)v19 != -1 && (int)a3 >= 6)
  {
    if (*(_BYTE *)(a2 + 1) == 6 && *(_BYTE *)a2 == 2)
    {
      char v125 = 0;
      unsigned int v25 = *(_DWORD *)(a2 + 2);
      a2 += 6LL;
      uint64_t v19 = bswap32(v25) | v19;
      char v127 = 1;
      a3 = (a3 - 6);
      goto LABEL_23;
    }

LABEL_23:
  v124 = &lcp_gotoptions[68 * v5 + 6];
  char v130 = v21;
  if (!v7[6] && !v7[5])
  {
    int v26 = 0;
    if (!v7[7] || (int)a3 <= 3)
    {
      int v27 = *((_DWORD *)v7 + 8);
      unsigned __int8 v28 = v7[9];
      int v29 = v7[11];
      int v122 = 0;
      int v120 = 0;
      uint64_t v30 = a3;
      uint64_t v31 = a2;
      LOBYTE(v1notify((uint64_t **)lcp_lowerdown_notify, 0) = 0;
      LOBYTE(v9) = 0;
      goto LABEL_41;
    }

    uint64_t v17 = 0;
    return v17 + 5;
  }

  a3(a4, " ");
  print_string(v16, v8 - 4, a3, a4);
LABEL_15:
  uint64_t v17 = v8 - 4;
  return v17 + 5;
}

    mach_msg_destroy(&msg);
    return v8;
  }

  mig_put_reply_port(msg.msgh_local_port);
  return v8;
}

    mach_msg_destroy(&msg);
    return v9;
  }

  mig_put_reply_port(msg.msgh_local_port);
  return v9;
}

    mach_msg_destroy(&v10);
    return v7;
  }

  mig_put_reply_port(v10.msgh_local_port);
  return v7;
}

    mach_msg_destroy(&v9);
    return v6;
  }

  mig_put_reply_port(v9.msgh_local_port);
  return v6;
}

    mach_msg_destroy(&v9);
    return v6;
  }

  mig_put_reply_port(v9.msgh_local_port);
  return v6;
}

    mach_msg_destroy(&v10);
    return v7;
  }

  mig_put_reply_port(v10.msgh_local_port);
  return v7;
}

LABEL_29:
    int v27 = *((_DWORD *)v7 + 8);
    if (*(_BYTE *)a2 == 3)
    {
      int v26 = 0;
      unsigned int v32 = *(unsigned __int8 *)(a2 + 1);
      unsigned __int8 v28 = v7[9];
      if (v32 >= 4)
      {
        uint64_t v30 = a3 - v32;
        if (a3 >= v32)
        {
          uint64_t v31 = a2 + 4;
          unsigned int v33 = __rev16(*(unsigned __int16 *)(a2 + 2));
          if (v32 == 4 && v33 == 49187)
          {
            if (v7[7]) {
              goto LABEL_35;
            }
            if (v7[6])
            {
              int v120 = 0;
              LOBYTE(v11) = 0;
              int v122 = 1;
              int v29 = v7[11];
              LOBYTE(v1notify((uint64_t **)lcp_lowerdown_notify, 0) = 0;
              int v26 = v7[5];
              goto LABEL_41;
            }

            goto LABEL_199;
          }

          if (v32 != 5 || v33 != 49699)
          {
            int v80 = v7[7];
            uint64_t v81 = v32 - 4;
            if (v32 == 4)
            {
              int v80 = v7[7];
              if (v33 == 49703)
              {
                int v80 = v7[7];
                if (v7[7])
                {
                  uint64_t v135 = v32 - 4;
                  unsigned __int8 v99 = v7[9];
                  int v102 = v7[5];
                  uint64_t v9 = v7[4];
                  unsigned __int8 v110 = v7[12];
                  int v113 = v7[6];
                  unsigned __int8 v105 = v7[15];
                  uint64_t v10 = v16;
                  uint64_t v82 = *((unsigned int *)v7 + 5);
                  uint64_t v83 = v19;
                  v104 = v4;
                  uint64_t v84 = v7[14];
                  int v85 = v7[7];
                  dbglog("Unexpected Conf-Nak for EAP", (uint64_t)lcp_gotoptions, a3, v8, v16, v17, v19, v14, v93);
                  uint64_t v81 = v135;
                  int v6 = lcp_gotoptions;
                  int v11 = v85;
                  uint64_t v14 = v84;
                  int v4 = v104;
                  uint64_t v19 = v83;
                  uint64_t v17 = v82;
                  uint64_t v16 = v10;
                  LODWORD(v1notify((uint64_t **)lcp_lowerdown_notify, 0) = v113;
                  unsigned __int8 v15 = v105;
                  int v27 = v95;
                  unsigned __int8 v28 = v99;
                  unsigned __int8 v13 = v110;
                  uint64_t v8 = v9;
                  LODWORD(v9) = v102;
                  int v80 = lcp_gotoptions[68 * v5 + 7];
                }
              }
            }

            unsigned __int8 v86 = v13;
            if (v80)
            {
              char v87 = 0;
              char v88 = v10;
              char v89 = v9;
            }

            else
            {
              if (*v124) {
                char v88 = 0;
              }
              else {
                char v88 = v10;
              }
              if (*v124) {
                char v89 = v9;
              }
              else {
                char v89 = 0;
              }
              char v87 = v11;
            }

            v31 += v81;
            int v90 = v9;
            int v29 = lcp_gotoptions[68 * v5 + 11];
            int v122 = v10;
            int v120 = v11;
            LOBYTE(v11) = v87;
            LOBYTE(v1notify((uint64_t **)lcp_lowerdown_notify, 0) = v88;
            LOBYTE(v9) = v89;
            int v26 = v90;
            unsigned __int8 v13 = v86;
LABEL_41:
            char v131 = 0;
            if (v29)
            {
              a3 = (v30 - 8);
              if ((int)v30 >= 8)
              {
                if (*(_BYTE *)(v31 + 1) == 8 && *(_BYTE *)v31 == 4)
                {
                  a2 = v31 + 8;
                  else {
                    unsigned __int8 v136 = 0;
                  }
                  char v131 = 1;
                  goto LABEL_49;
                }

                char v131 = 0;
              }
            }

            a3 = v30;
            a2 = v31;
LABEL_49:
            unsigned __int8 v12 = v28;
            int v20 = v27;
            goto LABEL_50;
          }

          uint64_t v31 = a2 + 5;
          int v79 = *(unsigned __int8 *)(a2 + 4);
          if (v7[7])
          {
            switch(v79)
            {
              case 5:
                LOBYTE(v11) = 0;
                BOOL v91 = (v18 & 4) == 0;
                char v92 = 4;
                break;
              case 128:
                LOBYTE(v11) = 0;
                BOOL v91 = (v18 & 2) == 0;
                char v92 = 2;
                break;
              case 129:
                LOBYTE(v11) = 0;
                if ((v18 & 1) != 0) {
                  LOBYTE(v18) = 1;
                }
                goto LABEL_36;
              default:
LABEL_35:
                LOBYTE(v11) = 0;
LABEL_36:
                int v120 = 1;
                int v29 = v7[11];
                int v26 = v7[5];
                int v122 = v7[6];
                goto LABEL_41;
            }

            if (!v91) {
              LOBYTE(v18) = v92;
            }
            goto LABEL_36;
          }

          if (!v7[6])
          {
            int v122 = 0;
            int v120 = 0;
            LOBYTE(v11) = 0;
            int v29 = v7[11];
            int v26 = v7[5];
            LOBYTE(v9) = 0;
            goto LABEL_41;
          }

          if ((v18 & 1) == v79 && (v18 & 6) == 0)
          {
LABEL_199:
            if (debug) {
              dbglog("lcp_nakci: received bad Nak!", (uint64_t)v6, a3, v8, v16, v17, v19, v14, v93);
            }
            return 0LL;
          }

          if (v79 == 5)
          {
            if ((v18 & 4) != 0)
            {
              int v120 = 0;
              LOBYTE(v11) = 0;
              LOBYTE(v18) = 4;
              goto LABEL_219;
            }
          }

          else
          {
            if (v79 != 128)
            {
              if (v79 == 129 && (v18 & 1) != 0)
              {
                int v120 = 0;
                LOBYTE(v11) = 0;
                int v122 = 1;
                int v29 = v7[11];
                LOBYTE(v18) = 1;
LABEL_220:
                int v26 = v7[5];
                goto LABEL_41;
              }

              goto LABEL_215;
            }

            if ((v18 & 2) != 0)
            {
              int v120 = 0;
              LOBYTE(v11) = 0;
              LOBYTE(v18) = 2;
LABEL_219:
              int v122 = 1;
              int v29 = v7[11];
              goto LABEL_220;
            }
          }

LABEL_215:
          int v120 = 0;
          LOBYTE(v11) = 0;
          v18 &= v18 - 1;
          if (!v18) {
            LOBYTE(v1notify((uint64_t **)lcp_lowerdown_notify, 0) = 0;
          }
          int v122 = 1;
          int v29 = v7[11];
          int v26 = v7[5];
          goto LABEL_41;
        }
      }

      int v29 = v7[11];
      int v122 = 0;
      int v120 = 0;
    }

    else
    {
      unsigned __int8 v28 = v7[9];
      int v26 = 0;
      int v122 = 0;
      int v120 = 0;
      int v29 = v7[11];
    }

    uint64_t v30 = a3;
    uint64_t v31 = a2;
    goto LABEL_41;
  }

  int v120 = 0;
  int v122 = 0;
  int v26 = 0;
  char v131 = 0;
LABEL_50:
  v129 = &lcp_gotoptions[68 * v5];
  if (v129[12] && (int)a3 >= 3 && *(_BYTE *)(a2 + 1) == 3 && *(_BYTE *)a2 == 13)
  {
    unsigned __int8 v13 = 0;
    a2 += 3LL;
    a3 = (a3 - 3);
  }

  char v133 = 0;
  uint64_t v34 = &lcp_gotoptions[68 * v5];
  int v35 = v34[8];
  v123 = v34 + 8;
  char v36 = 1;
  unsigned __int8 v126 = v11;
  int v121 = v26;
  if (v35)
  {
    uint64_t v37 = (a3 - 6);
    if ((int)a3 >= 6)
    {
      if (*(_BYTE *)(a2 + 1) == 6 && *(_BYTE *)a2 == 5)
      {
        a2 += 6LL;
        char v133 = 1;
        unsigned __int8 v96 = v12;
        char v100 = v9;
        uint64_t v9 = v8;
        unsigned __int8 v107 = v13;
        char v111 = v10;
        uint64_t v10 = v16;
        uint64_t v38 = v17;
        uint64_t v39 = v19;
        v103 = v4;
        uint64_t v40 = v14;
        int v41 = magic();
        int v6 = lcp_gotoptions;
        uint64_t v14 = v40;
        int v4 = v103;
        uint64_t v19 = v39;
        uint64_t v17 = v38;
        uint64_t v16 = v10;
        LOBYTE(v1notify((uint64_t **)lcp_lowerdown_notify, 0) = v111;
        uint64_t v8 = v9;
        unsigned __int8 v12 = v96;
        LOBYTE(v9) = v100;
        int v20 = v41;
        unsigned __int8 v13 = v107;
        char v36 = 0;
        a3 = v37;
      }

      else
      {
        char v133 = 0;
        char v36 = 1;
      }
    }
  }

  char v108 = v36;
  char v42 = 0;
  if (lcp_gotoptions[68 * v5 + 9] && (int)a3 >= 2)
  {
    if (*(_BYTE *)(a2 + 1) == 2 && *(_BYTE *)a2 == 7)
    {
      unsigned __int8 v12 = 0;
      a2 += 2LL;
      char v42 = 1;
      a3 = (a3 - 2);
    }

    else
    {
      char v42 = 0;
    }
  }

  char v43 = 0;
  if (lcp_gotoptions[68 * v5 + 10] && (int)a3 >= 2)
  {
    if (*(_BYTE *)(a2 + 1) == 2 && *(_BYTE *)a2 == 8)
    {
      unsigned __int8 v119 = 0;
      a2 += 2LL;
      char v43 = 1;
      a3 = (a3 - 2);
    }

    else
    {
      char v43 = 0;
    }
  }

  char v44 = 0;
  if (lcp_gotoptions[68 * v5 + 13] && (int)a3 >= 4)
  {
    if (*(_BYTE *)(a2 + 1) == 4 && *(_BYTE *)a2 == 17)
    {
      unsigned int v45 = *(unsigned __int16 *)(a2 + 2);
      a2 += 4LL;
      unsigned int v46 = __rev16(v45);
      else {
        uint64_t v17 = v17;
      }
      char v44 = 1;
      a3 = (a3 - 4);
    }

    else
    {
      char v44 = 0;
    }
  }

  char v47 = 0;
  if (lcp_gotoptions[68 * v5 + 14] && (int)a3 >= 2)
  {
    if (*(_BYTE *)(a2 + 1) == 2 && *(_BYTE *)a2 == 18)
    {
      uint64_t v14 = 0LL;
      a2 += 2LL;
      char v47 = 1;
      a3 = (a3 - 2);
    }

    else
    {
      char v47 = 0;
    }
  }

  if (lcp_gotoptions[68 * v5 + 15] && (int)a3 > 2)
  {
    if (*(_BYTE *)a2 != 19) {
      goto LABEL_96;
    }
    unsigned int v48 = *(unsigned __int8 *)(a2 + 1);
    unsigned __int8 v15 = 0;
    a2 += *(unsigned __int8 *)(a2 + 1);
    a3 = a3 - v48;
    int v6 = lcp_gotoptions;
  }

  if ((int)a3 >= 2)
  {
LABEL_96:
    unsigned int v97 = v17;
    char v101 = v9;
    char v114 = v18;
    unsigned int v93 = v19;
    int v94 = v20;
    uint64_t v50 = v14;
    uint64_t v9 = v8;
    int v6 = v129 + 11;
    int v51 = &lcp_gotoptions[68 * v5];
    uint64_t v8 = (uint64_t)(v51 + 5);
    int v52 = v51 + 7;
    uint64_t v17 = (uint64_t)(v51 + 28);
    uint64_t v19 = (uint64_t)(v51 + 16);
    while (2)
    {
      uint64_t v53 = *(unsigned __int8 *)(a2 + 1);
      a3 = (a3 - v53);
      switch(*(_BYTE *)a2)
      {
        case 1:
          if (v7[3])
          {
            char v54 = v128;
            if (*(_DWORD *)v19 != 1500) {
              char v54 = 1;
            }
            if ((_DWORD)v53 != 4 || (v54 & 1) != 0) {
              goto LABEL_199;
            }
          }

          else
          {
            if ((_DWORD)v53 == 4) {
              char v58 = v130 ^ 1;
            }
            else {
              char v58 = 1;
            }
            if ((v58 & 1) != 0) {
              goto LABEL_199;
            }
          }

          unsigned int v59 = __rev16(*(unsigned __int16 *)(a2 + 2));
          BOOL v60 = v59 >= 0x5DC;
          if (v59 >= 0x5DC) {
            uint64_t v16 = v16;
          }
          else {
            uint64_t v16 = v59;
          }
          int v61 = v137;
          if (!v60) {
            int v61 = 1;
          }
          int v137 = v61;
          goto LABEL_138;
        case 2:
          if (lcp_gotoptions[68 * v5 + 4])
          {
            BOOL v55 = *(_DWORD *)v17 == -1;
            char v56 = v127;
LABEL_119:
            if (!v55) {
              char v56 = 1;
            }
            if ((_DWORD)v53 != 6) {
              goto LABEL_199;
            }
LABEL_137:
            if ((v56 & 1) != 0) {
              goto LABEL_199;
            }
          }

          else
          {
            char v62 = v125;
            if ((_DWORD)v53 != 6) {
              char v62 = 0;
            }
            if ((v62 & 1) == 0) {
              goto LABEL_199;
            }
          }

LABEL_138:
          a2 += v53;
          uint64_t v8 = v9;
          unsigned __int8 v49 = v15;
          uint64_t v19 = v93;
          uint64_t v14 = v50;
          int v20 = v94;
          uint64_t v17 = v97;
          LOBYTE(v18) = v114;
          LOBYTE(v9) = v101;
          goto LABEL_163;
        case 3:
          if (*v124 | v122 || *(_BYTE *)v8 || v121 || *v52 || v120) {
            goto LABEL_199;
          }
          goto LABEL_138;
        case 4:
          char v56 = v131;
          if (*v6) {
            char v56 = 1;
          }
          if ((_DWORD)v53 != 8) {
            goto LABEL_199;
          }
          goto LABEL_137;
        case 5:
          BOOL v55 = *v123 == 0;
          char v56 = v133;
          goto LABEL_119;
        case 7:
          if ((_DWORD)v53 == 2) {
            char v56 = v42;
          }
          else {
            char v56 = 1;
          }
          if (lcp_gotoptions[68 * v5 + 9]) {
            goto LABEL_199;
          }
          goto LABEL_137;
        case 8:
          if ((_DWORD)v53 == 2) {
            char v56 = v43;
          }
          else {
            char v56 = 1;
          }
          if (lcp_gotoptions[68 * v5 + 10]) {
            goto LABEL_199;
          }
          goto LABEL_137;
        case 0x11:
          if ((_DWORD)v53 == 4) {
            char v56 = v44;
          }
          else {
            char v56 = 1;
          }
          if (lcp_gotoptions[68 * v5 + 13]) {
            goto LABEL_199;
          }
          goto LABEL_137;
        case 0x12:
          if ((_DWORD)v53 == 2) {
            char v57 = v47;
          }
          else {
            char v57 = 1;
          }
          if (lcp_gotoptions[68 * v5 + 14] || (v57 & 1) != 0) {
            goto LABEL_199;
          }
          uint64_t v50 = 1LL;
          goto LABEL_138;
        case 0x13:
          goto LABEL_138;
        default:
          goto LABEL_138;
      }
    }
  }

  unsigned __int8 v49 = v15;
LABEL_163:
  unsigned __int8 v63 = v126;
  if (v4[2] == 9) {
    return 1LL;
  }
  unsigned __int8 v65 = v12;
  unsigned __int8 v66 = v9;
  if ((v108 & 1) != 0)
  {
    int v67 = 0;
  }

  else
  {
    int v67 = v106 + 1;
    if (v106 + 1 >= lcp_loopbackfail)
    {
      unsigned __int8 v109 = v13;
      char v112 = v10;
      char v134 = v8;
      int v132 = v16;
      char v115 = v18;
      int v98 = v17;
      int v68 = v20;
      int v69 = v19;
      LODWORD(v1notify((uint64_t **)lcp_lowerdown_notify, 0) = v68;
      char v70 = v14;
      unsigned __int8 v71 = v49;
      notice("Serial line is looped back.", (uint64_t)v6, a3, v8, v16, v17, v19, v14, v93);
      lcp_close(*v4, "Loopback detected", v72, v73, v74, v75, v76, v77);
      unsigned __int8 v49 = v71;
      unsigned __int8 v63 = v126;
      LOBYTE(v14) = v70;
      int v78 = v10;
      unsigned __int8 v13 = v109;
      LOBYTE(v1notify((uint64_t **)lcp_lowerdown_notify, 0) = v112;
      LODWORD(v19) = v69;
      int v20 = v78;
      LODWORD(v17) = v98;
      LOBYTE(v18) = v115;
      LODWORD(v16) = v132;
      LOBYTE(v8) = v134;
      *(_DWORD *)status = 17;
    }
  }

  *(_WORD *)uint64_t v7 = v140;
  v7[2] = v141;
  v7[3] = v137;
  v7[4] = v8;
  v7[5] = v66;
  v7[6] = v10;
  v7[7] = v63;
  v7[8] = v117;
  v7[9] = v65;
  v7[10] = v119;
  v7[11] = v136;
  v7[12] = v13;
  v7[13] = v116;
  v7[14] = v14;
  v7[15] = v49;
  *((_DWORD *)v7 + 4) = v16;
  *((_DWORD *)v7 + 5) = v17;
  v7[24] = v18;
  lcp_gotoptions[68 * v5 + 27] = v139;
  *(_WORD *)(v7 + 25) = v138;
  *((_DWORD *)v7 + 7) = v19;
  *((_DWORD *)v7 + 8) = v20;
  *((_DWORD *)v7 + 9) = v67;
  *((_DWORD *)v7 + 1notify((uint64_t **)lcp_lowerdown_notify, 0) = v118;
  *(void *)(v7 + 6notify((uint64_t **)lcp_lowerdown_notify, 0) = v143;
  uint64_t result = 1LL;
  *(_OWORD *)(v7 + 44) = v142;
  return result;
}

uint64_t sub_10000E7C8(int *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  int v4 = &lcp_gotoptions[68 * (int)v3];
  unsigned __int8 v5 = v4[3];
  unsigned __int8 v6 = v4[4];
  uint64_t v7 = v4[5];
  uint64_t v8 = v4[6];
  unsigned __int8 v9 = v4[7];
  unsigned __int8 v10 = v4[8];
  unsigned __int8 v11 = v4[9];
  unsigned __int8 v12 = v4[10];
  unsigned __int8 v13 = v4[11];
  unsigned __int8 v14 = v4[12];
  unsigned __int8 v15 = v4[13];
  unsigned __int8 v16 = v4[14];
  uint64_t v17 = v4[15];
  uint64_t v18 = (a3 - 4);
  if ((int)a3 >= 4 && v4[3] && a2[1] == 4 && *a2 == 1)
  {
    a3 = *(unsigned int *)&lcp_gotoptions[68 * (int)v3 + 16];
    unsigned __int8 v5 = 0;
    a2 += 4;
    a3 = v18;
  }

  if (v4[4]) {
    BOOL v19 = (int)a3 < 6;
  }
  else {
    BOOL v19 = 1;
  }
  if (!v19 && a2[1] == 6 && *a2 == 2)
  {
    unsigned __int8 v6 = 0;
    a2 += 6;
    a3 = (a3 - 6);
  }

  if (v4[7]) {
    BOOL v20 = (int)a3 < 4;
  }
  else {
    BOOL v20 = 1;
  }
  if (!v20)
  {
    if (a2[1] != 4 || *a2 != 3) {
      goto LABEL_47;
    }
    unsigned __int8 v9 = 0;
    goto LABEL_39;
  }

  if (v4[7]) {
    goto LABEL_47;
  }
  if (v4[6]) {
    BOOL v21 = (int)a3 < 5;
  }
  else {
    BOOL v21 = 1;
  }
  if (!v21)
  {
    if (a2[1] == 5 && *a2 == 3)
    {
      uint64_t v7 = bswap32(*((unsigned __int16 *)a2 + 1));
      uint64_t v8 = 49699LL;
      if (WORD1(v7) != 49699) {
        goto LABEL_110;
      }
      uint64_t v7 = a2[4];
      int v23 = lcp_gotoptions[68 * (int)v3 + 24];
      if ((v23 & 1) != 0) {
        uint64_t v8 = 129LL;
      }
      else {
        uint64_t v8 = (v23 & 2) != 0 ? 128LL : (v23 << 29 >> 31) & 5;
      }
      if ((_DWORD)v8 != (_DWORD)v7) {
        goto LABEL_110;
      }
      unsigned __int8 v9 = 0;
      uint64_t v8 = 0LL;
      uint64_t v7 = 0LL;
      a3 = (a3 - 5);
      a2 += 5;
      goto LABEL_47;
    }

LABEL_110:
  if (debug) {
    dbglog("lcp_rejci: received bad Reject!", (uint64_t)a2, a3, v7, v17, v3, (uint64_t)lcp_gotoptions, v8, v35);
  }
  return 0LL;
}

uint64_t sub_10000ECBC( int *a1, char *__dst, int *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v50 = a4;
  uint64_t v8 = __dst;
  uint64_t v9 = 17LL * *a1;
  unsigned __int8 v10 = (char *)&lcp_hisoptions + 68 * *a1;
  int v11 = *a3;
  *((_DWORD *)v10 + 16) = 0;
  *((_OWORD *)v10 + 3) = 0u;
  *(_OWORD *)unsigned __int8 v10 = 0u;
  uint64_t v76 = v10 + 15;
  uint64_t v75 = (unsigned __int8 *)(v10 + 44);
  uint64_t v74 = v10 + 45;
  uint64_t v73 = v10 + 46;
  uint64_t v72 = v10 + 14;
  unsigned __int8 v71 = v10 + 13;
  char v70 = v10 + 20;
  int v69 = v10 + 10;
  int v68 = v10 + 9;
  unsigned __int8 v66 = v10 + 8;
  int v61 = v10 + 6;
  BOOL v60 = v10 + 5;
  unsigned int v59 = v10 + 7;
  uint64_t v53 = v10 + 24;
  int v64 = v10 + 4;
  *((_OWORD *)v10 + 2) = 0u;
  unsigned __int8 v12 = (unsigned int *)(v10 + 32);
  char v62 = v10 + 3;
  unsigned __int8 v63 = (int *)(v10 + 28);
  *((_OWORD *)v10 + 1) = 0u;
  unsigned __int8 v65 = v10 + 16;
  unsigned __int8 v13 = (char *)&lcp_allowoptions + 4 * v9;
  uint64_t v84 = v13 + 14;
  int v85 = v13 + 15;
  uint64_t v82 = v13 + 10;
  uint64_t v83 = v13 + 13;
  uint64_t v81 = v13 + 9;
  unsigned __int8 v14 = &lcp_gotoptions[4 * v9];
  uint64_t v77 = v14 + 8;
  char v56 = v14 + 32;
  char v87 = v13 + 8;
  int v80 = v13 + 11;
  int v67 = v13 + 5;
  char v57 = v13 + 6;
  char v54 = v13 + 24;
  BOOL v55 = v13 + 7;
  unsigned __int8 v86 = v13 + 28;
  int v78 = v13 + 3;
  int v79 = v13 + 4;
  unsigned __int8 v49 = v13 + 40;
  char v58 = (char *)&unk_1000463A1;
  uint64_t v15 = 2LL;
  unsigned __int8 v16 = __dst;
  while (1)
  {
    int v17 = multilink;
LABEL_3:
    uint64_t v18 = v16;
    if (!v11) {
      break;
    }
    if (v11 >= 2
      && ((uint64_t v19 = v16[1], v19 >= 2) ? (v20 = v11 >= v19) : (v20 = 0), v20))
    {
      int v21 = *v16;
      v11 -= v19;
      v16 += v19;
      switch(v21)
      {
        case 1:
          if ((_DWORD)v19 != 4 || !*v78) {
            goto LABEL_86;
          }
          unsigned int v22 = __rev16(*((unsigned __int16 *)v18 + 1));
          if (v22 <= 0x7F)
          {
            *(_DWORD *)char v58 = -2147482623;
            char v36 = v58 + 4;
            goto LABEL_122;
          }

          *char v62 = 1;
          int v23 = (unsigned int *)v65;
LABEL_48:
          *int v23 = v22;
          goto LABEL_81;
        case 2:
          if ((_DWORD)v19 != 6 || !*v79) {
            goto LABEL_86;
          }
          int v24 = (v18[2] << 16) | (v18[3] << 8) | v18[4];
          unsigned __int8 v25 = v18[5];
          int v26 = v25 | (v24 << 8);
          if ((*v86 & ~v26) == 0)
          {
            *int v64 = 1;
            *unsigned __int8 v63 = v26;
            goto LABEL_81;
          }

          int v35 = v24 << 8;
          *(_WORD *)char v58 = 1538;
          v58[2] = (*v86 | v35) >> 24;
          v58[3] = (*v86 | v35) >> 16;
          v58[4] = (unsigned __int16)(*v86 | v35) >> 8;
          v58[5] = v25 | *v86;
          char v36 = v58 + 6;
          goto LABEL_122;
        case 3:
          if (v19 < 4 || !*v67 && !*v57 && !*v55)
          {
            uint64_t v34 = "No auth is possible";
LABEL_100:
            dbglog(v34, (uint64_t)__dst, (uint64_t)a3, a4, a5, a6, a7, a8, v48);
            goto LABEL_86;
          }

          unsigned int v27 = __rev16(*((unsigned __int16 *)v18 + 1));
          if (v27 == 49703)
          {
            if (*v61 || (_DWORD)v19 != 4 || *v60)
            {
              if (!debug) {
                goto LABEL_86;
              }
              uint64_t v34 = "lcp_reqci: rcvd AUTHTYPE EAP, rejecting...";
              goto LABEL_100;
            }

            if (*v55)
            {
              BOOL v28 = v59;
              goto LABEL_80;
            }

            uint64_t v38 = v58;
            *char v58 = 3;
            char v36 = v58 + 4;
            if (!*v57)
            {
              *(_WORD *)(v58 + 1) = -16380;
              char v39 = 35;
              goto LABEL_119;
            }

LABEL_109:
            *(_WORD *)(v38 + 1) = -15867;
            v38[3] = 35;
            goto LABEL_110;
          }

          if (v27 != 49699)
          {
            if (v27 == 49187)
            {
              if (*v61 || (_DWORD)v19 != 4 || *v59)
              {
                if (!debug) {
                  goto LABEL_86;
                }
                uint64_t v34 = "lcp_reqci: rcvd AUTHTYPE PAP, rejecting...";
                goto LABEL_100;
              }

              if (*v67)
              {
                BOOL v28 = v60;
                goto LABEL_80;
              }

              uint64_t v38 = v58;
              *char v58 = 3;
              char v36 = v58 + 4;
              if (*v55)
              {
LABEL_107:
                *(_WORD *)(v38 + 1) = -15868;
                char v39 = 39;
LABEL_119:
                v38[3] = v39;
                goto LABEL_122;
              }

              goto LABEL_109;
            }

            uint64_t v38 = v58;
            *char v58 = 3;
            char v36 = v58 + 4;
            if (*v55) {
              goto LABEL_107;
            }
            if (!*v57)
            {
              *(_WORD *)(v58 + 1) = -16380;
              v58[3] = 35;
              goto LABEL_122;
            }

            *(_WORD *)(v58 + 1) = -15867;
            v58[3] = 35;
LABEL_110:
            int v40 = *v54;
            if ((v40 & 1) != 0)
            {
              LOBYTE(v41) = -127;
            }

            else if ((v40 & 2) != 0)
            {
              LOBYTE(v41) = 0x80;
            }

            else
            {
              int v41 = (v40 << 29 >> 31) & 5;
            }

            v58[4] = v41;
            char v36 = v58 + 5;
            goto LABEL_122;
          }

          if (*v60 || (_DWORD)v19 != 5 || *v59)
          {
            if (!debug) {
              goto LABEL_86;
            }
            uint64_t v34 = "lcp_reqci: rcvd AUTHTYPE CHAP, rejecting...";
            goto LABEL_100;
          }

          if (*v57)
          {
            int v32 = v18[4];
            if (v32 == 5)
            {
              if ((*v54 & 4) != 0)
              {
                char v33 = 4;
                goto LABEL_79;
              }
            }

            else if (v32 == 128)
            {
              if ((*v54 & 2) != 0)
              {
                char v33 = 2;
LABEL_79:
                *uint64_t v53 = v33;
                BOOL v28 = v61;
LABEL_80:
                *BOOL v28 = 1;
                goto LABEL_81;
              }
            }

            else if (v32 == 129 && (*v54 & 1) != 0)
            {
              char v33 = 1;
              goto LABEL_79;
            }

            *(_DWORD *)char v58 = 599917827;
            goto LABEL_110;
          }

          *(_WORD *)char v58 = 1027;
          char v36 = v58 + 4;
          if (*v55) {
            __int16 v42 = 10178;
          }
          else {
            __int16 v42 = 9152;
          }
          *((_WORD *)v58 + 1) = v42;
LABEL_122:
          char v58 = v36;
          if (v50) {
            goto LABEL_86;
          }
LABEL_123:
          BOOL v43 = (_DWORD)v15 == 4;
          uint64_t v15 = 4LL;
          if (!v43) {
            uint64_t v15 = 3LL;
          }
          break;
        case 4:
          if ((_DWORD)v19 != 8 || !*v80) {
            goto LABEL_86;
          }
          *(_DWORD *)char v58 = 633341956;
          v58[4] = v49[3];
          v58[5] = *((_WORD *)v49 + 1);
          v58[6] = BYTE1(*(_DWORD *)v49);
          v58[7] = *(_DWORD *)v49;
          char v36 = v58 + 8;
          goto LABEL_122;
        case 5:
          if (*v87)
          {
            if ((_DWORD)v19 != 6) {
              goto LABEL_86;
            }
            int v29 = *v77;
          }

          else
          {
            if ((_DWORD)v19 != 6) {
              goto LABEL_86;
            }
            int v29 = *v77;
            if (!*v77) {
              goto LABEL_86;
            }
          }

          unsigned int v31 = bswap32(*(_DWORD *)(v18 + 2));
          if (v29 && v31 == *v56)
          {
            int v37 = magic();
            *(_WORD *)char v58 = 1541;
            v58[2] = HIBYTE(v37);
            v58[3] = BYTE2(v37);
            v58[4] = BYTE1(v37);
            v58[5] = v37;
            v58 += 6;
            goto LABEL_123;
          }

          _BYTE *v66 = 1;
          *unsigned __int8 v12 = v31;
LABEL_81:
          if ((_DWORD)v15 == 2) {
            continue;
          }
          goto LABEL_3;
        case 7:
          if ((_DWORD)v19 != 2 || !*v81) {
            goto LABEL_86;
          }
          BOOL v28 = v68;
          goto LABEL_80;
        case 8:
          if ((_DWORD)v19 != 2 || !*v82) {
            goto LABEL_86;
          }
          BOOL v28 = v69;
          goto LABEL_80;
        case 17:
          if ((_DWORD)v19 != 4 || !*v83 || !v17) {
            goto LABEL_86;
          }
          unsigned int v22 = __rev16(*((unsigned __int16 *)v18 + 1));
          *unsigned __int8 v71 = 1;
          int v23 = (unsigned int *)v70;
          goto LABEL_48;
        case 18:
          if ((_DWORD)v19 != 2 || !*v84 || !v17) {
            goto LABEL_86;
          }
          BOOL v28 = v72;
          goto LABEL_80;
        case 19:
          unsigned __int8 v30 = v18[2];
          *uint64_t v76 = 1;
          *uint64_t v75 = v30;
          *uint64_t v74 = v19 - 3;
          memcpy(v73, v18 + 3, (v19 - 3));
          goto LABEL_81;
        default:
          if (debug) {
            dbglog( "lcp_reqci: rcvd unknown option %d",  (uint64_t)__dst,  (uint64_t)a3,  a4,  a5,  a6,  a7,  a8,  *v18);
          }
          goto LABEL_86;
      }
    }

    else
    {
      if (debug) {
        dbglog("lcp_reqci: bad CI length!", (uint64_t)__dst, (uint64_t)a3, a4, a5, a6, a7, a8, v48);
      }
      LODWORD(v19) = v11;
      int v11 = 0;
LABEL_86:
      if (v18 != v8) {
        memcpy(v8, v18, (int)v19);
      }
      v8 += (int)v19;
      uint64_t v15 = 4LL;
    }
  }

  if ((_DWORD)v15 == 4)
  {
    int v44 = (_DWORD)v8 - (_DWORD)__dst;
    goto LABEL_130;
  }

  if ((_DWORD)v15 != 3)
  {
    int v44 = (_DWORD)v16 - (_DWORD)__dst;
LABEL_130:
    *a3 = v44;
    goto LABEL_132;
  }

  signed int v45 = (_DWORD)v58 - &unk_1000463A1;
  *a3 = v45;
  memcpy(__dst, &unk_1000463A1, v45);
LABEL_132:
  if (debug)
  {
    unsigned int v46 = "REJ";
    if ((_DWORD)v15 == 3) {
      unsigned int v46 = "NAK";
    }
    if ((_DWORD)v15 == 2) {
      unsigned int v46 = "ACK";
    }
    dbglog("lcp_reqci: returning CONF%s.", (uint64_t)__dst, (uint64_t)a3, a4, a5, a6, a7, a8, (int)v46);
  }

  return v15;
}

void sub_10000F5E4(int *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = &lcp_hisoptions[68 * (int)v2];
  int v5 = v3[3];
  int v4 = v3 + 3;
  if (v5) {
    uint64_t v6 = *(unsigned int *)&lcp_hisoptions[68 * (int)v2 + 16];
  }
  else {
    uint64_t v6 = 1500LL;
  }
  if (lcp_gotoptions[68 * (int)v2 + 3])
  {
    unsigned int v7 = *((_DWORD *)&lcp_wantoptions + 17 * v2 + 4);
    unsigned int v8 = *(_DWORD *)&lcp_gotoptions[68 * v2 + 16];
    else {
      uint64_t v9 = v7;
    }
  }

  else
  {
    uint64_t v9 = 1500LL;
  }

  else {
    int v10 = v6;
  }
  if (v10 >= *((_DWORD *)&lcp_allowoptions + 17 * v2 + 4)) {
    int v11 = *((_DWORD *)&lcp_allowoptions + 17 * v2 + 4);
  }
  else {
    int v11 = v10;
  }
  netif_set_mtu(v2, v11);
  if (lcp_hisoptions[68 * v2 + 4]) {
    uint64_t v12 = *(unsigned int *)&lcp_hisoptions[68 * (int)v2 + 28];
  }
  else {
    uint64_t v12 = 0xFFFFFFFFLL;
  }
  ppp_send_config(*a1, v6, v12, lcp_hisoptions[68 * (int)v2 + 9], lcp_hisoptions[68 * (int)v2 + 10]);
  if (lax_recv)
  {
    uint64_t v13 = 0LL;
  }

  else if (lcp_gotoptions[68 * (int)v2 + 4])
  {
    uint64_t v13 = *(unsigned int *)&lcp_gotoptions[68 * (int)v2 + 28];
  }

  else
  {
    uint64_t v13 = 0xFFFFFFFFLL;
  }

  ppp_recv_config(*a1, v9, v13, lcp_gotoptions[68 * (int)v2 + 9], lcp_gotoptions[68 * (int)v2 + 10]);
  if (*v4) {
    peer_mru[*a1] = *(_DWORD *)&lcp_hisoptions[68 * (int)v2 + 16];
  }
  notify((uint64_t **)lcp_up_notify, 0);
  sub_10000CE20(*a1);
  link_established(*a1, v14, v15, v16, v17, v18, v19, v20);
}

uint64_t sub_10000F7C0(unsigned int *a1)
{
  uint64_t v2 = *a1;
  int v3 = v2;
  if (byte_1000463A0 == 1)
  {
    untimeout((uint64_t)sub_10000CF40, (uint64_t)&lcp_fsm + 80 * (int)v2);
    byte_1000463A0 = 0;
    uint64_t v2 = *a1;
  }

  link_down(v2);
  notify((uint64_t **)lcp_down_notify, 0);
  uint64_t v4 = 0xFFFFFFFFLL;
  ppp_send_config(*a1, 1500LL, 0xFFFFFFFFLL, 0LL, 0LL);
  if (lcp_gotoptions[68 * v3 + 4]) {
    uint64_t v4 = *(unsigned int *)&lcp_gotoptions[68 * v3 + 28];
  }
  uint64_t result = ppp_recv_config(*a1, 1500LL, v4, lcp_gotoptions[68 * v3 + 9], lcp_gotoptions[68 * v3 + 10]);
  peer_mru[*a1] = 1500;
  return result;
}

uint64_t sub_10000F8A8(unsigned int *a1)
{
  return link_required(*a1);
}

uint64_t sub_10000F8B0( unsigned int *a1, uint64_t a2, uint64_t a3, unsigned __int16 *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = 0LL;
  switch((int)a2)
  {
    case 8:
      if ((int)a5 <= 1)
      {
        if (!debug) {
          return 1LL;
        }
        uint64_t v9 = "lcp_rprotrej: Rcvd short Protocol-Reject packet!";
LABEL_24:
        dbglog(v9, a2, a3, (uint64_t)a4, a5, a6, a7, a8, v15);
        return 1LL;
      }

      if (a1[2] != 9)
      {
        if (!debug) {
          return 1LL;
        }
        int v15 = a1[2];
        uint64_t v9 = "Protocol-Reject discarded: LCP in state %d";
        goto LABEL_24;
      }

      int v10 = __rev16(*a4);
      int v11 = protocols;
      if (!protocols)
      {
LABEL_18:
        warning("Protocol-Reject for unsupported protocol 0x%x", a2, a3, (uint64_t)a4, a5, a6, a7, a8, v10);
        return 1LL;
      }

      uint64_t v12 = (__int16 **)&off_10003F898;
      while ((unsigned __int16)*v11 != v10 || !*((_BYTE *)v11 + 80))
      {
        uint64_t v13 = *v12++;
        int v11 = v13;
        if (!v13) {
          goto LABEL_18;
        }
      }

      (*((void (**)(void))v11 + 3))(*a1);
      return 1LL;
    case 9:
      if (a1[2] == 9)
      {
        *(_BYTE *)a4 = lcp_gotoptions[68 * *a1 + 35];
        *((_BYTE *)a4 + 1) = *(_WORD *)&lcp_gotoptions[68 * *a1 + 34];
        *((_BYTE *)a4 + 2) = BYTE1(*(_DWORD *)&lcp_gotoptions[68 * *a1 + 32]);
        *((_BYTE *)a4 + 3) = *(_DWORD *)&lcp_gotoptions[68 * *a1 + 32];
        fsm_sdata(a1, 10, a3, (char *)a4, a5, a6, a7, a8, v15);
      }

      return 1LL;
    case 10:
      if ((int)a5 <= 3)
      {
        dbglog("lcp: received short Echo-Reply, length %d", a2, a3, (uint64_t)a4, a5, a6, a7, a8, a5);
        return 1LL;
      }

      if (lcp_gotoptions[68 * *a1 + 8] && bswap32(*(_DWORD *)a4) == *(_DWORD *)&lcp_gotoptions[68 * *a1 + 32]) {
        goto LABEL_28;
      }
      dword_10004639C = 0;
      ppp_variable_echo_stop((uint64_t)a1, a2, a3, (uint64_t)a4, a5, a6, a7, a8);
      ppp_auxiliary_probe_stop();
      return 1LL;
    case 11:
      return 1LL;
    case 13:
      if (a1[2] != 9) {
        return 1LL;
      }
      if ((int)a5 > 7)
      {
        if (lcp_gotoptions[68 * *a1 + 8] && bswap32(*(_DWORD *)a4) == *(_DWORD *)&lcp_gotoptions[68 * *a1 + 32])
        {
LABEL_28:
          warning("appear to have received our own echo-reply!", a2, a3, (uint64_t)a4, a5, a6, a7, a8, v15);
        }

        else
        {
          unsigned int v16 = bswap32(*((_DWORD *)a4 + 1));
          uint64_t v17 = a4 + 4;
          int v18 = a5 - 8;
          notify_with_ptr((uint64_t **)lcp_timeremaining_notify, (uint64_t)&v16);
        }
      }

      else
      {
        dbglog("lcp: received short Time-remaining, length %d", a2, a3, (uint64_t)a4, a5, a6, a7, a8, a5);
      }

      return 1LL;
    default:
      return v8;
  }

void sub_10000FB08( int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1[2] == 9)
  {
    info("No response to %d echo-requests", a2, a3, a4, a5, a6, a7, a8, dword_10004639C);
    notice("Serial link appears to be disconnected.", v9, v10, v11, v12, v13, v14, v15, v22);
    lcp_close(*a1, "Peer not responding", v16, v17, v18, v19, v20, v21);
    *(_DWORD *)status = 15;
  }

uint64_t magic_init()
{
  return getpid();
}

uint64_t magic()
{
  return arc4random() & 0x7FFFFFFF;
}

uint64_t mrand48(void)
{
  return arc4random() & 0x7FFFFFFF;
}

_BYTE *random_bytes(_BYTE *result, int a2)
{
  if (a2 >= 1)
  {
    uint64_t v2 = result;
    uint64_t v3 = a2;
    do
    {
      uint64_t result = (_BYTE *)arc4random();
      unsigned int v4 = (result >> 24) & 0x7F;
      if (!v4) {
        LOBYTE(v4) = 1;
      }
      *v2++ = v4;
      --v3;
    }

    while (v3);
  }

  return result;
}

double drand48(void)
{
  return (double)(arc4random() & 0x7FFFFFFF) / 2147483650.0;
}

int main(int argc, const char **argv, const char **envp)
{
  int v231 = 0;
  openlog("pppd", 9, 120);
  setlogmask(127);
  qword_100046988 = (uint64_t)pthread_self();
  link_stats_valid = 0;
  new_phase(1LL);
  script_env = 0LL;
  if (gethostname(hostname, 0x100uLL) < 0)
  {
    option_error("Couldn't get hostname: %m", v5, v6, v7, v8, v9, v10, v11, v226);
    exit(1);
  }

  byte_100043C07 = 0;
  mode_t v12 = umask(0x1FFu);
  umask(v12 | 0x12);
  uid_t v13 = getuid();
  uint64_t v14 = 0LL;
  uid = v13;
  privileged = v13 == 0;
  if (v13)
  {
    privileged = sys_check_controller();
    uint64_t v14 = uid;
  }

  uint64_t v227 = v14;
  slprintf((int)v230, 16, "%d");
  script_setenv("ORIG_UID", v230);
  ngroups = getgroups(16, groups);
  magic_init();
  uint64_t v15 = protocols;
  if (protocols)
  {
    uint64_t v16 = (__int16 **)&off_10003F898;
    do
    {
      (*((void (**)(void))v15 + 1))(0LL);
      uint64_t v17 = *v16++;
      uint64_t v15 = v17;
    }

    while (v17);
  }

  tty_init();
  progname = (uint64_t)*argv;
  sys_install_options();
  if (!options_from_file("/etc/ppp/options", privileged == 0, 0, 1)
    || !options_from_user()
    || !parse_args(argc - 1, argv + 1)
    || controlled && !options_from_controller())
  {
    goto LABEL_14;
  }

  uint64_t v18 = options_from_file("/etc/ppp/postoptions", 0, 0, 1);
  if (!(_DWORD)v18) {
    goto LABEL_14;
  }
  devnam_fixed = 1;
  uint64_t v19 = *(void (**)(uint64_t))(the_channel + 8);
  if (v19) {
    v19(v18);
  }
  if (debug) {
    setlogmask(255);
  }
  if (geteuid())
  {
    option_error("must be root to run %s, since it is not setuid-root", v20, v21, v22, v23, v24, v25, v26, (int)*argv);
    exit(3);
  }

  if (!ppp_available())
  {
    option_error("%s", v27, v28, v29, v30, v31, v32, v33, (int)no_ppp_msg[0]);
    exit(4);
  }

  uint64_t v34 = check_options();
  uint64_t v42 = sys_check_options(v34, v35, v36, v37, v38, v39, v40, v41);
  if (!(_DWORD)v42) {
LABEL_14:
  }
    exit(2);
  uint64_t v50 = auth_check_options(v42, v43, v44, v45, v46, v47, v48, v49);
  int v51 = protocols;
  if (protocols)
  {
    int v52 = (__int16 **)&off_10003F898;
    do
    {
      uint64_t v53 = (uint64_t (*)(uint64_t))*((void *)v51 + 14);
      if (v53) {
        uint64_t v50 = v53(v50);
      }
      char v54 = *v52++;
      int v51 = v54;
    }

    while (v54);
  }

  BOOL v55 = *(void (**)(uint64_t))(the_channel + 16);
  if (v55) {
    v55(v50);
  }
  if (dump_options | dryrun)
  {
    init_pr_log(0LL, 6);
    print_options((void (*)(const char *, const char *, ...))pr_log, 0LL);
    end_pr_log();
    if (dryrun) {
      die(0);
    }
  }

  v56.n128_f64[0] = sys_init();
  uint64_t v57 = system_inited_notify;
  if (system_inited_notify)
  {
    do
    {
      uint64_t v58 = *(void *)v57;
      (*(void (**)(void, void, __n128))(v57 + 8))(*(void *)(v57 + 16), 0LL, v56);
      uint64_t v57 = v58;
    }

    while (v58);
  }

  unsigned int v59 = open("/dev/null", 2, v56.n128_f64[0], v227);
  dword_100046990 = v59;
  if ((v59 & 0x80000000) != 0) {
    fatal("Couldn't open %s: %m", v60, v61, v62, v63, v64, v65, v66, (int)"/dev/null");
  }
  if (v59 <= 2)
  {
    do
    {
      unsigned int v59 = dup(v59);
      if ((v59 & 0x80000000) != 0) {
        fatal("Critical shortage of file descriptors: dup failed: %m", v67, v68, v69, v70, v71, v72, v73, v228);
      }
      dword_100046990 = v59;
    }

    while (v59 < 3);
  }

  uint64_t v74 = getpwuid(uid);
  if (!v74 || (pw_name = v74->pw_name) == 0LL) {
    pw_name = "(unknown)";
  }
  sys_log(5, "pppd %s (Apple version %s) started by %s, uid %d", "2.4.2", "884", pw_name, uid);
  script_setenv("PPPLOGNAME", pw_name);
  if ((_BYTE)devnam) {
    script_setenv("DEVICE", (const char *)&devnam);
  }
  pid_t v229 = getpid();
  slprintf((int)v230, 16, "%d");
  script_setenv("PPPD_PID", v230);
  if (controlfd != -1) {
    add_fd(controlfd);
  }
  uint64_t v76 = sub_100011198();
  byte_100046994 = 0;
  if (demand)
  {
    dword_100046998 = open_ppp_loopback();
    set_ifunit(1, v77, v78, v79, v80, v81, v82, v83);
    demand_conf();
    pid_t v84 = getpid();
    sub_100011594(v84);
  }

  int v85 = &unk_100043000;
  if (!holdfirst)
  {
    do_callback = 0;
    goto LABEL_56;
  }

  need_holdoff = 1;
  while (1)
  {
    if (v85[794]) {
      uint64_t v76 = holdoff;
    }
    else {
      uint64_t v76 = 0LL;
    }
    int v231 = v76;
    if (holdoff_hook)
    {
      uint64_t v76 = holdoff_hook();
      int v231 = v76;
    }

    if ((int)v76 >= 1)
    {
      new_phase(11LL);
      timeout((int)sub_100011BF4);
      got_sigterm = 0;
      got_sighup = 0;
      do
      {
        sub_100011688();
        if (kill_link) {
          uint64_t v76 = new_phase(3LL);
        }
      }

      while (phase == 11);
      if (!persist)
      {
LABEL_284:
        int v216 = dword_100046DB8;
        if (dword_100046DB8 >= 1)
        {
          do
          {
            if (debug)
            {
              dbglog("Waiting for %d child processes...", v89, v90, v91, v92, v93, v94, v95, v216);
              for (uint64_t i = qword_100046DC0; i; uint64_t i = *(void *)(i + 32))
                dbglog("  script %s, pid %d", v217, v218, v219, v220, v221, v222, v223, *(void *)(i + 8));
            }

            if ((sub_100011BFC(1) & 0x80000000) != 0) {
              break;
            }
            int v216 = dword_100046DB8;
          }

          while (dword_100046DB8 > 0);
        }

        die(*(int *)status);
      }
    }

LABEL_56:
    listen_time = 0;
    v85[794] = 1;
    dword_10004699C = -1;
    *(_DWORD *)status = 0;
    devstatus = 0;
    ++unsuccess;
    int v86 = do_callback;
    doing_callback = do_callback;
    do_callback = 0;
    if (demand) {
      BOOL v87 = v86 == 0;
    }
    else {
      BOOL v87 = 0;
    }
    if (v87)
    {
      new_phase(3LL);
      demand_unblock();
      add_fd(dword_100046998);
      do
      {
        sub_100011688();
        if (kill_link) {
          BOOL v88 = persist == 0;
        }
        else {
          BOOL v88 = 0;
        }
      }

      while (!v88 && !get_loop_output());
      remove_fd(dword_100046998);
      if (kill_link) {
        BOOL v96 = persist == 0;
      }
      else {
        BOOL v96 = 0;
      }
      if (v96) {
        goto LABEL_284;
      }
      demand_block();
      info("Starting link", v97, v98, v99, v100, v101, v102, v103, v229);
    }

    v104 = (uint64_t (*)(uint64_t))start_link_hook;
    if (!start_link_hook) {
      break;
    }
    if (*(void *)(the_channel + 96))
    {
      int v105 = retry_pre_start_link_check;
      if (retry_pre_start_link_check < 0)
      {
        int v105 = 0;
        retry_pre_start_link_check = 0;
      }

      int v106 = v105 + 2;
      while (1)
      {
        uint64_t v76 = (*(uint64_t (**)(uint64_t))(the_channel + 96))(v76);
        if (!(_DWORD)v76) {
          break;
        }
        if (--v106 < 2)
        {
          int v114 = 25;
          goto LABEL_136;
        }
      }

      v104 = (uint64_t (*)(uint64_t))start_link_hook;
    }

    uint64_t v76 = v104(v76);
    int v231 = v76;
    if ((_DWORD)v76) {
      break;
    }
    int v114 = 5;
LABEL_136:
    *(_DWORD *)status = v114;
LABEL_259:
    sys_statusnotify(v76, v107, v108, v109, v110, v111, v112, v113, v229);
    if (!demand)
    {
      if (byte_1000469B8 && unlink(&byte_1000469B8) < 0 && *__error() != 2) {
        warning("unable to delete pid file %s: %m", v89, v90, v91, v92, v93, v94, v95, (int)&byte_1000469B8);
      }
      byte_1000469B8 = 0;
    }

    if (!persist) {
      goto LABEL_284;
    }
    if (maxfail >= 1 && unsuccess >= maxfail) {
      goto LABEL_284;
    }
    if (demand) {
      demand_discard();
    }
  }

  sys_publish_remoteaddress((const char *)remoteaddress);
  uint64_t v76 = new_phase(2LL);
  uint64_t v115 = connect_started_notify;
  if (connect_started_notify)
  {
    do
    {
      uint64_t v116 = *(void *)v115;
      uint64_t v76 = (*(uint64_t (**)(void, void))(v115 + 8))(*(void *)(v115 + 16), 0LL);
      uint64_t v115 = v116;
    }

    while (v116);
  }

  LOBYTE(v117) = 0;
  int v118 = 0;
  link_up_done = 0;
  redialingcount = 0;
  redialingalternate = 0;
  while (1)
  {
    if (v118 || (_BYTE)v117)
    {
      unsigned __int8 v119 = *(void (**)(uint64_t))(the_channel + 72);
      if (v119)
      {
        v119(v76);
        LOBYTE(v117) = redialingalternate;
      }

      if (redialalternate)
      {
        BOOL v87 = v117 == 0;
        int v120 = (const char **)&remoteaddress;
        if (!v87) {
          int v120 = (const char **)&altremoteaddress;
        }
        sys_publish_remoteaddress(*v120);
        LOBYTE(v117) = redialingalternate;
      }
    }

    else
    {
      LOBYTE(v117) = 0;
    }

    unsigned int v121 = redialtimer;
    if (redialtimer) {
      BOOL v122 = redialingcount == 0;
    }
    else {
      BOOL v122 = 1;
    }
    if (!v122 && v117 == 0)
    {
      if (hasbusystate)
      {
        new_phase(13LL);
        unsigned int v121 = redialtimer;
      }

      sleep(v121);
      if (hasbusystate) {
        new_phase(2LL);
      }
    }

    if (kill_link) {
      break;
    }
    uint64_t v76 = (*(uint64_t (**)(int *))(the_channel + 24))(&v231);
    dword_10004699C = v76;
    int v117 = redialingalternate;
    if (redialalternate)
    {
      int v117 = redialingalternate == 0;
      redialingalternate = redialingalternate == 0;
    }

    if (!v117) {
      ++redialingcount;
    }
    if (busycode != -1 && v231 == busycode)
    {
      int v118 = redialingcount;
      if (redialingcount <= redialcount && kill_link == 0) {
        continue;
      }
    }

    goto LABEL_122;
  }

  uint64_t v76 = dword_10004699C;
LABEL_122:
  if ((v76 & 0x80000000) != 0)
  {
    int v85 = (_DWORD *)&unk_100043000;
    if ((_DWORD)v76 != -2)
    {
      uint64_t v137 = connect_fail_notify;
      if (connect_fail_notify)
      {
        uint64_t v138 = v231;
        do
        {
          uint64_t v139 = *(void *)v137;
          uint64_t v76 = (*(uint64_t (**)(void, uint64_t))(v137 + 8))(*(void *)(v137 + 16), v138);
          uint64_t v137 = v139;
        }

        while (v139);
      }

      goto LABEL_255;
    }

    if (dword_1000469A0) {
      sub_1000119F4(1);
    }
LABEL_249:
    uint64_t v76 = new_phase(10LL);
    uint64_t v207 = disconnect_started_notify;
    uint64_t v208 = *(int *)status;
    if (disconnect_started_notify)
    {
      do
      {
        uint64_t v209 = *(void *)v207;
        uint64_t v76 = (*(uint64_t (**)(void, uint64_t))(v207 + 8))(*(void *)(v207 + 16), v208);
        uint64_t v207 = v209;
      }

      while (v209);
    }

    v210 = *(uint64_t (**)(uint64_t))(the_channel + 32);
    if (v210) {
      uint64_t v76 = v210(v76);
    }
    uint64_t v211 = disconnect_done_notify;
    uint64_t v212 = *(int *)status;
    if (disconnect_done_notify)
    {
      do
      {
        uint64_t v213 = *(void *)v211;
        uint64_t v76 = (*(uint64_t (**)(void, uint64_t))(v211 + 8))(*(void *)(v211 + 16), v212);
        uint64_t v211 = v213;
      }

      while (v213);
    }

LABEL_255:
    if (phase != 10) {
      uint64_t v76 = new_phase(10LL);
    }
    v214 = *(uint64_t (**)(uint64_t))(the_channel + 72);
    if (v214) {
      uint64_t v76 = v214(v76);
    }
    goto LABEL_259;
  }

  int v85 = &unk_100043000;
  if (!link_up_done)
  {
    if (link_up_hook)
    {
      int v231 = link_up_hook();
      if (!v231)
      {
        int v136 = 5;
LABEL_248:
        *(_DWORD *)status = v136;
        goto LABEL_249;
      }
    }

    link_up_done = 1;
  }

  uint64_t v126 = connect_success_notify;
  if (connect_success_notify)
  {
    do
    {
      uint64_t v127 = *(void *)v126;
      (*(void (**)(void, void))(v126 + 8))(*(void *)(v126 + 16), 0LL);
      uint64_t v126 = v127;
    }

    while (v127);
  }

  sys_publish_remoteaddress((const char *)remoteaddress);
  dword_10003F8E0 = (*(uint64_t (**)(void))(the_channel + 40))(dword_10004699C);
  if ((dword_10003F8E0 & 0x80000000) == 0)
  {
    if (demand)
    {
      int v135 = ifunit;
    }

    else
    {
      pid_t v140 = getpid();
      sub_100011594(v140);
      int v135 = ifunit;
      if (!demand && (ifunit & 0x80000000) == 0)
      {
        set_ifunit(1, v128, v129, v130, v131, v132, v133, v134);
        int v135 = ifunit;
      }
    }

    if (v135 < 0) {
      notice("Starting negotiation on %s", v128, v129, v130, v131, v132, v133, v134, (int)&ppp_devnam);
    }
    else {
      notice("Connect: %s <--> %s", v128, v129, v130, v131, v132, v133, v134, (int)&ifname);
    }
    gettimeofday(&stru_1000469A8, 0LL);
    script_unsetenv("CONNECT_TIME");
    script_unsetenv("BYTES_SENT");
    script_unsetenv("BYTES_RCVD");
    lcp_lowerup(0LL);
    add_fd(dword_10003F8E0);
    lcp_open(0, v141, v142, v143, v144, v145, v146, v147);
    *(_DWORD *)status = 10;
    new_phase(4LL);
    while (phase)
    {
      sub_100011688();
      uint64_t packet = read_packet(&inpacket_buf);
      if ((packet & 0x80000000) != 0) {
        goto LABEL_192;
      }
      uint64_t v163 = packet;
      if ((_DWORD)packet)
      {
        if (packet <= 3)
        {
          if (debug < 2) {
            goto LABEL_192;
          }
          pid_t v229 = packet;
          v164 = "received short packet:%.*B";
          goto LABEL_154;
        }

        dump_packet((int)"rcvd", (uint64_t)&inpacket_buf, packet, v158, v159, v160, v161, v162);
        if (snoop_recv_hook) {
          snoop_recv_hook(&inpacket_buf, v163);
        }
        uint64_t v165 = __rev16((unsigned __int16)word_1000446FE);
        if ((_DWORD)v165 != 49185 && dword_1000438C8 != 9)
        {
          if (debug < 2) {
            goto LABEL_192;
          }
          v164 = "Discarded non-LCP packet when LCP not open";
LABEL_154:
          dbglog(v164, v156, v157, v158, v159, v160, v161, v162, v229);
          goto LABEL_192;
        }

        if ((_DWORD)v165 == 49703
          || (v165 & 0xFFFFFDFF) == 0xC023
          || (v165 & 0xFFFFFFFB) == 0xC021
          || phase > 5
          || !unexpected_network_packet(0, v165, v157, v158, v159, v160, v161, v162))
        {
          v166 = protocols;
          if (protocols)
          {
            v167 = (__int16 **)&off_10003F898;
            do
            {
              int v168 = (unsigned __int16)*v166;
              if ((_DWORD)v165 == v168 && *((_BYTE *)v166 + 80))
              {
                (*((void (**)(void, void *, void))v166 + 2))( 0LL,  &unk_100044700,  (v163 - 4));
                goto LABEL_192;
              }

              if ((_DWORD)v165 == (v168 & 0x7FFF) && *((_BYTE *)v166 + 80))
              {
                v169 = (void (*)(void, void *, void))*((void *)v166 + 9);
                if (v169)
                {
                  v169(0LL, &unk_100044700, (v163 - 4));
                  goto LABEL_192;
                }

                v170 = (unsigned int (*)(void))*((void *)v166 + 19);
                if (v170 && v170(0LL) == 9) {
                  goto LABEL_192;
                }
              }

              v171 = *v167++;
              v166 = v171;
            }

            while (v171);
          }

          if (debug)
          {
            int v172 = (unsigned __int16)protocol_list;
            if (!protocol_list) {
              goto LABEL_190;
            }
            v173 = &word_10003F8F8;
            while ((_DWORD)v165 != v172)
            {
              int v174 = (unsigned __int16)*v173;
              v173 += 8;
              int v172 = v174;
              if (!v174) {
                goto LABEL_190;
              }
            }

            uint64_t v175 = *((void *)v173 - 1);
            if (v175) {
              warning("Unsupported protocol '%s' (0x%x) received", v156, v157, v158, v159, v160, v161, v162, v175);
            }
            else {
LABEL_190:
            }
              warning("Unsupported protocol 0x%x received", v156, v157, v158, v159, v160, v161, v162, v165);
          }

          lcp_sprotrej(0, (uint64_t)&inpacket_buf, v163, v158, v159, v160, v161, v162, v229);
        }

        else if (debug >= 2)
        {
          dbglog("discarding proto 0x%x in phase %d", v156, v157, v158, v159, v160, v161, v162, v165);
        }
      }

      else
      {
        notice("Modem hangup", v156, v157, v158, v159, v160, v161, v162, v229);
        hungup = 1;
        if (*(_DWORD *)status != 5) {
          *(_DWORD *)status = 16;
        }
        lcp_lowerdown(0);
        link_terminated();
      }

LABEL_192:
      if (stop_link) {
        BOOL v176 = phase == 8;
      }
      else {
        BOOL v176 = 0;
      }
      if (v176)
      {
        new_phase(12LL);
        ppp_hold();
        auth_hold();
        v177 = protocols;
        if (protocols)
        {
          v178 = (__int16 **)&off_10003F898;
          do
          {
            v179 = (void (*)(void))*((void *)v177 + 17);
            if (v179) {
              v179(0LL);
            }
            v180 = *v178++;
            v177 = v180;
          }

          while (v180);
        }

        uint64_t v181 = stop_notify;
        if (stop_notify)
        {
          do
          {
            uint64_t v182 = *(void *)v181;
            (*(void (**)(void, void))(v181 + 8))(*(void *)(v181 + 16), 0LL);
            uint64_t v181 = v182;
          }

          while (v182);
        }
      }

      if (cont_link) {
        BOOL v183 = phase == 12;
      }
      else {
        BOOL v183 = 0;
      }
      if (v183)
      {
        new_phase(8LL);
        ppp_cont();
        auth_cont();
        v184 = protocols;
        if (protocols)
        {
          v185 = (__int16 **)&off_10003F898;
          do
          {
            v186 = (void (*)(void))*((void *)v184 + 18);
            if (v186) {
              v186(0LL);
            }
            v187 = *v185++;
            v184 = v187;
          }

          while (v187);
        }

        uint64_t v188 = cont_notify;
        if (cont_notify)
        {
          do
          {
            uint64_t v189 = *(void *)v188;
            (*(void (**)(void, void))(v188 + 8))(*(void *)(v188 + 16), 0LL);
            uint64_t v188 = v189;
          }

          while (v189);
        }
      }

      if (kill_link)
      {
        if (do_modem_hungup) {
          BOOL v190 = 0;
        }
        else {
          BOOL v190 = stop_link == 0;
        }
        if (!v190 || phase == 12)
        {
          if (do_modem_hungup)
          {
            notice("Modem hangup", v156, v157, v158, v159, v160, v161, v162, v229);
            do_modem_hungup = 0;
          }

          hungup = 1;
          lcp_lowerdown(0);
          link_terminated();
        }

        lcp_close(0, "User request", v157, v158, v159, v160, v161, v162);
      }

      if (open_ccp_flag && (phase - 7) <= 1)
      {
        dword_100043604 = 2;
        off_10003DDD8(0LL, v156, v157, v158, v159, v160, v161, v162);
      }

      sys_runloop();
    }

    if (link_stats_valid)
    {
      info("Connect time %d.%d minutes.", v148, v149, v150, v151, v152, v153, v154, (link_connect_time + 5) / 0x3Cu);
      info("Sent %u bytes, received %u bytes.", v192, v193, v194, v195, v196, v197, v198, dword_1000440D8);
    }

    int v85 = (_DWORD *)&unk_100043000;
    v199 = &off_10003F000;
    if (!demand)
    {
      if (byte_1000469B8 && unlink(&byte_1000469B8) < 0 && *__error() != 2) {
        warning("unable to delete pid file %s: %m", v200, v201, v202, v203, v204, v205, v206, (int)&byte_1000469B8);
      }
      byte_1000469B8 = 0;
      v199 = &off_10003F000;
    }

    remove_fd(*((_DWORD *)v199 + 568));
    clean_check();
    (*(void (**)(void))(the_channel + 48))(dword_10004699C);
    *((_DWORD *)v199 + 568) = -1;
    if (!hungup) {
      lcp_lowerdown(0);
    }
    if (!demand) {
      script_unsetenv("IFNAME");
    }
    goto LABEL_249;
  }

  int v136 = 1;
  goto LABEL_248;
}

uint64_t reopen_log()
{
  return setlogmask(127);
}

uint64_t new_phase(uint64_t result)
{
  int v1 = result;
  phase = result;
  if (new_phase_hook) {
    uint64_t result = new_phase_hook(result);
  }
  uint64_t v2 = phasechange;
  if (phasechange)
  {
    do
    {
      uint64_t v3 = *(void *)v2;
      uint64_t result = (*(uint64_t (**)(void, void))(v2 + 8))(*(void *)(v2 + 16), v1);
      uint64_t v2 = v3;
    }

    while (v3);
  }

  return result;
}

void script_setenv(const char *a1, const char *a2)
{
  size_t v4 = strlen(a1);
  size_t v5 = strlen(a2);
  int v6 = v5 + v4;
  uint64_t v7 = malloc(v5 + v4 + 3);
  if (!v7) {
    return;
  }
  uint64_t v8 = v7;
  slprintf((int)v7, v6 + 2, "%s=%s");
  uint64_t v9 = (void *)script_env;
  if (script_env)
  {
    uint64_t v10 = *(char **)script_env;
    if (*(void *)script_env)
    {
      uint64_t v11 = 0LL;
      while (strncmp(v10, a1, v4) || v10[v4] != 61)
      {
        int v12 = v11 + 1;
        uint64_t v10 = (char *)v9[++v11];
        if (!v10) {
          goto LABEL_12;
        }
      }

      free(v10);
      *(void *)(script_env + 8 * v11) = v8;
      return;
    }

    int v12 = 0;
  }

  else
  {
    uid_t v13 = malloc(0x80uLL);
    script_env = (uint64_t)v13;
    if (!v13) {
      return;
    }
    uint64_t v9 = v13;
    int v12 = 0;
    s_env_nalloCC_SHA1_CTX c = 16;
  }

LABEL_12:
  if (v12 + 1 >= s_env_nalloc)
  {
    uint64_t v14 = realloc(v9, 8LL * (v12 + 17));
    if (!v14) {
      return;
    }
    uint64_t v9 = v14;
    script_env = (uint64_t)v14;
    s_env_nalloCC_SHA1_CTX c = v12 + 17;
  }

  v9[v12] = v8;
  *(void *)(script_env + 8LL * (v12 + 1)) = 0LL;
}

  if (v2 >= 1) {
    return (v2 + 2);
  }
  else {
    return v2;
  }
}

  uid_t v13 = "Cannot determine ethernet address for proxy ARP";
LABEL_13:
  error(v13, v3, v4, v5, v6, v7, v8, v9, (int)v26);
  return 0LL;
}

    CFRelease(v10);
  }

  else
  {
    error("ACSP plugin: error adding domain name - could not create CFNumber\n", v3, v4, v5, v6, v7, v8, v9, key);
  }

void die(int a1)
{
}

uint64_t **notify(uint64_t **result, int a2)
{
  if (result)
  {
    uint64_t v2 = a2;
    do
    {
      uint64_t v3 = *result;
      ((void (*)(uint64_t *, uint64_t))result[1])(result[2], v2);
      uint64_t result = (uint64_t **)v3;
    }

    while (v3);
  }

  return result;
}

void detach()
{
  if (!detached)
  {
    if (pipe(v12) == -1) {
      *(void *)int v12 = -1LL;
    }
    pid_t v0 = fork();
    if (v0 < 0)
    {
      error("Couldn't detach (fork failed: %m)", v1, v2, v3, v4, v5, v6, v7, v10);
      die(1);
    }

    if (v0)
    {
      unsigned int v11 = v0;
      uint64_t v8 = pidchange;
      if (pidchange)
      {
        do
        {
          uint64_t v9 = *(void *)v8;
          (*(void (**)(void, void))(v8 + 8))(*(void *)(v8 + 16), v11);
          uint64_t v8 = v9;
        }

        while (v9);
      }

      if (byte_1000469B8) {
        sub_100012238(v11);
      }
      if (byte_100046DC8) {
        sub_100011594(v11);
      }
      exit(0);
    }

    setsid();
    chdir("/");
    dup2(dword_100046990, 0);
    dup2(dword_100046990, 1);
    dup2(dword_100046990, 2);
    detached = 1;
    if (log_default) {
      log_to_fd = -1;
    }
    getpid();
    slprintf((int)v13, 16, "%d");
    script_setenv("PPPD_PID", v13);
    close(v12[1]);
    complete_read(v12[0], v13, 1uLL);
    close(v12[0]);
    sys_reinit();
  }

uint64_t sub_100011198()
{
  *(void *)&v9.sa_mask = 1074675715LL;
  v9.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_1000120B0;
  if (sigaction(1, &v9, 0LL) < 0)
  {
    int v8 = 1;
    goto LABEL_48;
  }

  v9.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_100012174;
  if (sigaction(2, &v9, 0LL) < 0)
  {
    int v8 = 2;
    goto LABEL_48;
  }

  v9.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_100012174;
  if (sigaction(15, &v9, 0LL) < 0)
  {
    int v8 = 15;
    goto LABEL_48;
  }

  v9.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_100012DD8;
  if (sigaction(20, &v9, 0LL) < 0)
  {
    int v8 = 20;
    goto LABEL_48;
  }

  v9.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_100012E3C;
  if (sigaction(18, &v9, 0LL) < 0)
  {
    int v8 = 18;
    goto LABEL_48;
  }

  v9.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_100012EFC;
  if (sigaction(19, &v9, 0LL) < 0)
  {
    int v8 = 19;
    goto LABEL_48;
  }

  v9.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_100012F88;
  if (sigaction(30, &v9, 0LL) < 0)
  {
    int v8 = 30;
    goto LABEL_48;
  }

  v9.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_100012FF0;
  if (sigaction(31, &v9, 0LL) < 0)
  {
    int v8 = 31;
    goto LABEL_48;
  }

  v9.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_100013054;
  if (sigaction(6, &v9, 0LL) < 0)
  {
    int v8 = 6;
    goto LABEL_48;
  }

  v9.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_100013054;
  if (sigaction(14, &v9, 0LL) < 0)
  {
    int v8 = 14;
    goto LABEL_48;
  }

  v9.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_100013054;
  if (sigaction(8, &v9, 0LL) < 0)
  {
    int v8 = 8;
    goto LABEL_48;
  }

  v9.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_100013054;
  if (sigaction(4, &v9, 0LL) < 0)
  {
    int v8 = 4;
    goto LABEL_48;
  }

  v9.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_100013054;
  if (sigaction(13, &v9, 0LL) < 0)
  {
    int v8 = 13;
    goto LABEL_48;
  }

  v9.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_100013054;
  if (sigaction(3, &v9, 0LL) < 0)
  {
    int v8 = 3;
    goto LABEL_48;
  }

  v9.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_100013054;
  if (sigaction(11, &v9, 0LL) < 0)
  {
    int v8 = 11;
    goto LABEL_48;
  }

  v9.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_100013054;
  if (sigaction(10, &v9, 0LL) < 0)
  {
    int v8 = 10;
    goto LABEL_48;
  }

  v9.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_100013054;
  if (sigaction(7, &v9, 0LL) < 0)
  {
    int v8 = 7;
    goto LABEL_48;
  }

  v9.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_100013054;
  if (sigaction(27, &v9, 0LL) < 0)
  {
    int v8 = 27;
    goto LABEL_48;
  }

  v9.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_100013054;
  if (sigaction(12, &v9, 0LL) < 0)
  {
    int v8 = 12;
    goto LABEL_48;
  }

  v9.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_100013054;
  if (sigaction(5, &v9, 0LL) < 0)
  {
    int v8 = 5;
    goto LABEL_48;
  }

  v9.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_100013054;
  if (sigaction(26, &v9, 0LL) < 0)
  {
    int v8 = 26;
    goto LABEL_48;
  }

  v9.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_100013054;
  if (sigaction(24, &v9, 0LL) < 0)
  {
    int v8 = 24;
    goto LABEL_48;
  }

  v9.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_100013054;
  uint64_t result = sigaction(25, &v9, 0LL);
  if ((result & 0x80000000) != 0)
  {
    int v8 = 25;
LABEL_48:
    fatal("Couldn't establish signal handler (%d): %m", v0, v1, v2, v3, v4, v5, v6, v8);
  }

  return result;
}

void set_ifunit(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    pid_t v9 = getpid();
    sub_100012238(v9);
    pid_t v10 = getpid();
    sub_100011594(v10);
  }

void sub_100011594(int a1)
{
  if (linkname)
  {
    script_setenv("LINKNAME", &linkname);
    slprintf((int)&byte_100046DC8, 1024, "%sppp-%s.pid");
    uint64_t v2 = fopen(&byte_100046DC8, "w");
    if (v2)
    {
      pid_t v10 = v2;
      fprintf(v2, "%d\n", a1);
      if (ifname) {
        fprintf(v10, "%s\n", &ifname);
      }
      fclose(v10);
    }

    else
    {
      error("Failed to create pid file %s: %m", v3, v4, v5, v6, v7, v8, v9, (int)&byte_100046DC8);
      byte_100046DC8 = 0;
    }
  }

void sub_100011688()
{
  open_ccp_flag = 0;
  kill_link = 0;
  cont_link = 0;
  stop_link = 0;
  if (!sigsetjmp(dword_1000471E0, 1))
  {
    sigprocmask(1, &v19, 0LL);
    if (got_sighup || got_sigterm || got_sigusr2 || (byte_1000472A4 & 1) != 0 || got_sigtstp || got_sigcont)
    {
      sigprocmask(2, &v19, 0LL);
    }

    else
    {
      byte_100046994 = 1;
      sigprocmask(2, &v19, 0LL);
      if (qword_1000471D8)
      {
        getabsolutetime((uint64_t)&qword_1000471C8);
        uint64_t v7 = *(void *)qword_1000471D8 - qword_1000471C8;
        uint64_t v20 = v7;
        uint64_t v8 = v7;
        int v9 = *(_DWORD *)(qword_1000471D8 + 8) - dword_1000471D0;
        int v21 = v9;
        if (v9 < 0)
        {
          int v21 = v9 + 1000000;
          uint64_t v20 = v7 - 1;
          uint64_t v8 = v7 - 1;
        }

        if (v8 < 0)
        {
          int v21 = 0;
          uint64_t v20 = 0LL;
        }

        pid_t v10 = (timeval *)&v20;
      }

      else
      {
        pid_t v10 = 0LL;
      }

      v12.n128_f64[0] = wait_input(v10);
      if (wait_input_hook) {
        uint64_t v11 = wait_input_hook(v12.n128_f64[0]);
      }
      uid_t v13 = *(void (**)(uint64_t, __n128))(the_channel + 88);
      if (v13) {
        v13(v11, v12);
      }
    }
  }

  if (controlfd != -1)
  {
    uint64_t ready = is_ready_fd(controlfd);
    if ((_DWORD)ready) {
      ppp_control(ready, v0, v1, v2, v3, v4, v5, v6, v18);
    }
  }

  byte_100046994 = 0;
  for (uint64_t i = (_DWORD *)qword_1000471D8; qword_1000471D8; uint64_t i = (_DWORD *)qword_1000471D8)
  {
    v16.n128_f64[0] = getabsolutetime((uint64_t)&qword_1000471C8);
    if (v17 < 0) {
      fatal("Failed to get time of day: %m", v0, v1, v2, v3, v4, v5, v6, v18);
    }
    if (*(void *)i >= qword_1000471C8 && (*(void *)i != qword_1000471C8 || i[2] > dword_1000471D0)) {
      break;
    }
    qword_1000471D8 = *((void *)i + 4);
    (*((void (**)(void, __n128))i + 3))(*((void *)i + 2), v16);
    free(i);
  }

  if (got_sigtstp)
  {
    info("Stopping on signal %d.", v0, v1, v2, v3, v4, v5, v6, got_sigtstp);
    stop_link = 1;
    got_sigtstp = 0;
  }

  if (got_sigcont)
  {
    info("Resuming on signal %d.", v0, v1, v2, v3, v4, v5, v6, got_sigcont);
    cont_link = 1;
    got_sigcont = 0;
  }

  if (got_sighup)
  {
    info("Hangup (SIGHUP)", v0, v1, v2, v3, v4, v5, v6, v18);
    kill_link = 1;
    got_sighup = 0;
    if (*(_DWORD *)status != 16) {
      *(_DWORD *)status = 5;
    }
  }

  if (got_sigterm)
  {
    info("Terminating on signal %d.", v0, v1, v2, v3, v4, v5, v6, got_sigterm);
    kill_link = 1;
    persist = 0;
    *(_DWORD *)status = 5;
    got_sigterm = 0;
  }

  if (byte_1000472A4 == 1)
  {
    sub_100011BFC(0);
    byte_1000472A4 = 0;
  }

  if (got_sigusr2)
  {
    open_ccp_flag = 1;
    got_sigusr2 = 0;
  }

uint64_t sub_1000119F4(int a1)
{
  v4.__sigaction_u.__sa_handler = (void (__cdecl *)(int))1;
  v4.sa_flags = 0;
  sigaction(a1, &v4, &v3);
  kill(0, a1);
  return sigaction(a1, &v3, 0LL);
}

void script_unsetenv(const char *a1)
{
  int v2 = strlen(a1);
  if (script_env)
  {
    sigaction v3 = *(char **)script_env;
    if (*(void *)script_env)
    {
      uint64_t v4 = 0LL;
      size_t v5 = v2;
      uint64_t v6 = script_env + 8;
      while (strncmp(v3, a1, v5) || v3[v5] != 61)
      {
        sigaction v3 = *(char **)(v6 + v4);
        v4 += 8LL;
        if (!v3) {
          return;
        }
      }

      free(v3);
      do
      {
        uint64_t v7 = *(void *)(script_env + v4 + 8);
        *(void *)(script_env + v4) = v7;
        v4 += 8LL;
      }

      while (v7);
    }
  }

void timeout(int a1)
{
  int v4 = v3;
  int v5 = v2;
  uint64_t v6 = v1;
  uint64_t v7 = *(void *)&a1;
  uint64_t v8 = malloc(0x28uLL);
  if (!v8) {
    fatal("Out of memory in timeout()!", v9, v10, v11, v12, v13, v14, v15, v23);
  }
  __n128 v16 = v8;
  v8[2] = v6;
  v8[3] = v7;
  getabsolutetime((uint64_t)&qword_1000471C8);
  uint64_t v17 = qword_1000471C8 + v5;
  *(void *)__n128 v16 = v17;
  int v18 = dword_1000471D0 + v4;
  v16[2] = dword_1000471D0 + v4;
  if (v18 > 999999)
  {
    v17 += v18 / 0xF4240u;
    *(void *)__n128 v16 = v17;
    v18 %= 0xF4240u;
    v16[2] = v18;
  }

  sigset_t v19 = &qword_1000471D8;
  uint64_t v20 = (uint64_t *)qword_1000471D8;
  if (qword_1000471D8)
  {
    uint64_t v21 = *(void *)qword_1000471D8;
    if (v17 >= *(void *)qword_1000471D8)
    {
      uint64_t v22 = qword_1000471D8;
      while (v17 != v21 || v18 >= *(_DWORD *)(v22 + 8))
      {
        uint64_t v20 = *(uint64_t **)(v22 + 32);
        sigset_t v19 = (uint64_t *)(v22 + 32);
        if (v20)
        {
          uint64_t v21 = *v20;
          uint64_t v22 = *(void *)(v22 + 32);
          if (v17 >= *v20) {
            continue;
          }
        }

        goto LABEL_13;
      }

      uint64_t v20 = (uint64_t *)v22;
    }
  }

uint64_t sub_100011BF4()
{
  return new_phase(3LL);
}

uint64_t sub_100011BFC(int a1)
{
  if (!dword_100046DB8) {
    return 0LL;
  }
  BOOL v1 = a1 == 0;
  pid_t v2 = waitpid(-1, &v26, v1);
  if ((v2 - 1) <= 0xFFFFFFFD)
  {
    while (1)
    {
      uint64_t v10 = (void *)qword_100046DC0;
      if (!qword_100046DC0) {
        goto LABEL_9;
      }
      uint64_t v11 = &qword_100046DC0;
      if (*(_DWORD *)qword_100046DC0 != v2) {
        break;
      }
LABEL_8:
      char v13 = 0;
      --dword_100046DB8;
      uint64_t *v11 = v10[4];
LABEL_10:
      if ((v26 & 0x7F) != 0 && (v26 & 0x7F) != 0x7F)
      {
        uint64_t v15 = "??";
        if ((v13 & 1) == 0) {
          uint64_t v15 = (const char *)v10[1];
        }
        warning("Child process %s (pid %d) terminated with signal %d", v3, v4, v5, v6, v7, v8, v9, (int)v15);
        if ((v13 & 1) != 0) {
          goto LABEL_24;
        }
      }

      else
      {
        if (debug)
        {
          uint64_t v14 = "??";
          if ((v13 & 1) == 0) {
            uint64_t v14 = (const char *)v10[1];
          }
          dbglog("Script %s finished (pid %d), status = 0x%x", v3, v4, v5, v6, v7, v8, v9, (int)v14);
        }

        if ((v13 & 1) != 0) {
          goto LABEL_24;
        }
      }

      __n128 v16 = (void (*)(void))v10[2];
      if (v16) {
        v16(v10[3]);
      }
      free(v10);
LABEL_24:
      pid_t v2 = waitpid(-1, &v26, v1);
    }

    while (1)
    {
      uint64_t v12 = v10;
      uint64_t v10 = (void *)v10[4];
      if (!v10) {
        break;
      }
      if (*(_DWORD *)v10 == v2)
      {
        uint64_t v11 = v12 + 4;
        goto LABEL_8;
      }
    }

LABEL_9:
    char v13 = 1;
    goto LABEL_10;
  }

      uint64_t v22 = 0LL;
      uint64_t v24 = (CFMutableDictionaryRef)v19;
LABEL_48:
      CFRelease(v24);
      return v22;
    }
  }

  return 0LL;
}

LABEL_25:
  if (v2 != -1) {
    return 0LL;
  }
  if (*__error() != 10)
  {
    if (*__error() != 4) {
      error("Error waiting for child process: %m", v18, v19, v20, v21, v22, v23, v24, v25);
    }
    return 0LL;
  }

  return 0xFFFFFFFFLL;
}

    pid_t v2 = 1;
    if ((v4 & 1) == 0) {
      return 0LL;
    }
  }

  uint64_t v5 = &general_options;
  while (!sub_1000151B8(a1, (uint64_t)v5, v2))
  {
    uint64_t v6 = v5[12];
    v5 += 12;
    if (!v6) {
      goto LABEL_6;
    }
  }

  return v5;
}

void ppp_control( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  uint64_t v9 = fcntl(controlfd, 3);
  if ((_DWORD)v9 == -1 || (uint64_t v17 = v9, fcntl(controlfd, 4, v9 | 4) == -1))
  {
    warning("Couldn't set controlfd to nonblock: %m", v10, v11, v12, v13, v14, v15, v16, a9);
  }

  else
  {
    int v18 = getc((FILE *)controlfile);
    if (v18 == 91) {
      ungetc(91, (FILE *)controlfile);
    }
    fcntl(controlfd, 4, v17);
    if (feof((FILE *)controlfile)) {
      goto LABEL_37;
    }
    clearerr((FILE *)controlfile);
    if (v18 != 91) {
      return;
    }
    uint64_t v19 = getword((FILE *)controlfile, (uint64_t)v35, &v34, (int)"controller");
    if (!(_DWORD)v19) {
LABEL_37:
    }
      die(1);
    while (*(void *)v35 != 0x534E4F4954504F5BLL || *(unsigned __int16 *)&v35[8] != 93)
    {
      if (*(void *)v35 == 0x4E4E4F435349445BLL && *(void *)&v35[5] == 0x5D5443454E4E4FLL)
      {
        error("[DISCONNECT]", v20, v21, v22, v23, v24, v25, v26, v33);
        sub_1000120B0(1LL);
      }

      else if (*(void *)v35 == 0x414E494D5245545BLL && *(unsigned int *)&v35[8] == 6112596LL)
      {
        error("[TERMINATE]", v20, v21, v22, v23, v24, v25, v26, v33);
        sub_100012174(15LL);
      }

      else
      {
        if (*(void *)v35 == 0x4C4C4154534E495BLL && *(unsigned __int16 *)&v35[8] == 93)
        {
          sys_install(v19, v20, v21, v22, v23, v24, v25, v26);
          return;
        }

        if (*(void *)v35 == 0x4154534E494E555BLL && *(unsigned int *)&v35[8] == 6114380LL)
        {
          sys_uninstall(v19, v20, v21, v22, v23, v24, v25, v26);
          return;
        }
      }

      uint64_t v19 = getword((FILE *)controlfile, (uint64_t)v35, &v34, (int)"controller");
      if (!(_DWORD)v19) {
        goto LABEL_37;
      }
    }

    options_from_controller();
    if (dump_options)
    {
      init_pr_log(0LL, 6);
      print_options((void (*)(const char *, const char *, ...))pr_log, 0LL);
      end_pr_log();
    }
  }

uint64_t sub_1000120B0(uint64_t result)
{
  int v1 = result;
  pid_t v2 = (_opaque_pthread_t *)qword_100046988;
  if (!qword_100046988 || (uint64_t v3 = pthread_self(), result = pthread_equal(v2, v3), (_DWORD)result))
  {
    got_sighup = v1;
    kill_link = 1;
    if (dword_1000469A0) {
      uint64_t result = sub_1000119F4(v1);
    }
    uint64_t v4 = sigreceived;
    if (sigreceived)
    {
      do
      {
        uint64_t v5 = *(void *)v4;
        uint64_t result = (*(uint64_t (**)(void, void))(v4 + 8))(*(void *)(v4 + 16), v1);
        uint64_t v4 = v5;
      }

      while (v5);
    }

    if (!hungup) {
      *(_DWORD *)status = 5;
    }
    if (byte_100046994 == 1) {
      siglongjmp(dword_1000471E0, 1);
    }
  }

  return result;
}

uint64_t sub_100012174(uint64_t result)
{
  int v1 = result;
  pid_t v2 = (_opaque_pthread_t *)qword_100046988;
  if (!qword_100046988 || (uint64_t v3 = pthread_self(), result = pthread_equal(v2, v3), (_DWORD)result))
  {
    got_sigterm = v1;
    kill_link = 1;
    persist = 0;
    *(_DWORD *)status = 5;
    if (dword_1000469A0) {
      uint64_t result = sub_1000119F4(v1);
    }
    uint64_t v4 = sigreceived;
    if (sigreceived)
    {
      do
      {
        uint64_t v5 = *(void *)v4;
        uint64_t result = (*(uint64_t (**)(void, void))(v4 + 8))(*(void *)(v4 + 16), v1);
        uint64_t v4 = v5;
      }

      while (v5);
    }

    if (byte_100046994 == 1) {
      siglongjmp(dword_1000471E0, 1);
    }
  }

  return result;
}

void sub_100012238(int a1)
{
  pid_t v2 = fopen(&byte_1000469B8, "w");
  if (v2)
  {
    uint64_t v10 = v2;
    fprintf(v2, "%d\n", a1);
    fclose(v10);
  }

  else
  {
    error("Failed to create pid file %s: %m", v3, v4, v5, v6, v7, v8, v9, (int)&byte_1000469B8);
    byte_1000469B8 = 0;
  }

uint64_t ppp_send_config(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(the_channel + 56);
  if (!v5) {
    return 0LL;
  }
  int v6 = error_count;
  v5(a2, a3, a4, a5);
  if (error_count == v6) {
    return 0LL;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t ppp_recv_config(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(the_channel + 64);
  if (!v5) {
    return 0LL;
  }
  int v6 = error_count;
  v5(a2, a3, a4, a5);
  if (error_count == v6) {
    return 0LL;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

void sub_10001239C()
{
  uint64_t v0 = sys_cleanup();
  if ((dword_10003F8E0 & 0x80000000) == 0) {
    uint64_t v0 = (*(uint64_t (**)(void))(the_channel + 48))(dword_10004699C);
  }
  int v1 = *(void (**)(uint64_t))(the_channel + 72);
  if (v1) {
    v1(v0);
  }
  if (byte_1000469B8 && unlink(&byte_1000469B8) < 0 && *__error() != 2) {
    warning("unable to delete pid file %s: %m", v2, v3, v4, v5, v6, v7, v8, (int)&byte_1000469B8);
  }
  byte_1000469B8 = 0;
  if (byte_100046DC8 && unlink(&byte_100046DC8) < 0 && *__error() != 2) {
    warning("unable to delete pid file %s: %m", v9, v10, v11, v12, v13, v14, v15, (int)&byte_100046DC8);
  }
  byte_100046DC8 = 0;
}

void update_link_stats(uint64_t a1)
{
  if (get_ppp_stats(a1, &link_stats))
  {
    if ((gettimeofday(&v1, 0LL) & 0x80000000) == 0)
    {
      link_connect_time = LODWORD(v1.tv_sec) - qword_1000469A8;
      link_stats_valid = 1;
      slprintf((int)v2, 32, "%u");
      script_setenv("CONNECT_TIME", v2);
      slprintf((int)v2, 32, "%u");
      script_setenv("BYTES_SENT", v2);
      slprintf((int)v2, 32, "%u");
      script_setenv("BYTES_RCVD", v2);
    }
  }

void untimeout(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (uint64_t *)qword_1000471D8;
  if (qword_1000471D8)
  {
    uint64_t v3 = &qword_1000471D8;
    while (v2[3] != a1 || v2[2] != a2)
    {
      uint64_t v3 = v2 + 4;
      uint64_t v2 = (uint64_t *)v2[4];
      if (!v2) {
        return;
      }
    }

    *uint64_t v3 = v2[4];
    free(v2);
  }

uint64_t safe_fork()
{
  if (pipe(v7) == -1) {
    *(void *)uint64_t v7 = -1LL;
  }
  uint64_t v0 = fork();
  if ((v0 & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v1 = v0;
  if ((_DWORD)v0)
  {
    close(v7[1]);
    complete_read(v7[0], &v6, 1uLL);
    int v2 = v7[0];
  }

  else
  {
    sys_close();
    options_close();
    uint64_t v3 = fork_notifier;
    if (fork_notifier)
    {
      do
      {
        uint64_t v4 = *(void *)v3;
        (*(void (**)(void, void))(v3 + 8))(*(void *)(v3 + 16), 0LL);
        uint64_t v3 = v4;
      }

      while (v4);
    }

    close(v7[0]);
    uint64_t v1 = 0LL;
    int v2 = v7[1];
  }

  close(v2);
  return v1;
}

uint64_t device_script(uint64_t a1, int a2, int a3, int a4, uid_t a5, const void *a6, int a7)
{
  int v59 = -1;
  *(void *)__fd = -1LL;
  if (a6 && pipe(__fd) == -1)
  {
    uint64_t v31 = "Failed to setup pipe with device script: %m";
    goto LABEL_16;
  }

  ++dword_1000469A0;
  int v21 = safe_fork();
  if (v21 < 0)
  {
    --dword_1000469A0;
    uint64_t v31 = "Failed to create child process: %m";
LABEL_16:
    error(v31, v14, v15, v16, v17, v18, v19, v20, v58);
    return 0xFFFFFFFFLL;
  }

  int v22 = v21;
  if (!v21)
  {
    int v32 = a3;
    do
    {
      unsigned int v33 = dup(a2);
      if ((v33 & 0x80000000) != 0) {
        goto LABEL_23;
      }
    }

    while (v33 < 3);
    close(v33);
LABEL_23:
    int v34 = log_to_fd;
    int v35 = a2;
    int v36 = dup(a2);
    int v37 = dup(v32);
    if (log_to_fd < 0)
    {
      int v58 = 384;
      int v38 = open("/etc/ppp/connect-errors", 521);
    }

    else
    {
      int v38 = dup(log_to_fd);
    }

    int v39 = v38;
    close(v35);
    close(v32);
    close(v34);
    close(0);
    close(1);
    uint64_t v40 = close(2);
    uint64_t v41 = *(void (**)(uint64_t))(the_channel + 80);
    if (v41) {
      v41(v40);
    }
    closelog();
    close(dword_100046990);
    if (__fd[1] != -1)
    {
      close(__fd[1]);
      __fd[1] = -1;
    }

    dup2(v36, 0);
    close(v36);
    dup2(v37, 1);
    close(v37);
    if ((v39 & 0x80000000) == 0)
    {
      dup2(v39, 2);
      close(v39);
    }

    int v42 = 3;
    if (__fd[0] != -1)
    {
      dup2(__fd[0], 3);
      close(__fd[0]);
      __fd[0] = 3;
      int v42 = 4;
    }

    closeallfrom(v42);
    if (a5 == -1) {
      a5 = uid;
    }
    setuid(a5);
    if (getuid() == a5)
    {
      gid_t v50 = getgid();
      setgid(v50);
      execle("/bin/sh", "sh");
      error("could not exec /bin/sh: %m", v51, v52, v53, v54, v55, v56, v57, (int)"-c");
      exit(99);
    }

    error("setuid failed", v43, v44, v45, v46, v47, v48, v49, v58);
    exit(1);
  }

  if (__fd[0] != -1)
  {
    close(__fd[0]);
    __fd[0] = -1;
  }

  if (__fd[1] != -1)
  {
    write(__fd[1], a6, a7);
    close(__fd[1]);
    __fd[1] = -1;
  }

  if (a4)
  {
    record_child(v22, a1, 0LL, 0LL);
    return 0LL;
  }

  else
  {
    while (waitpid(v22, &v59, 0) < 0)
    {
      if (*__error() != 4) {
        fatal("error waiting for (dis)connection process: %m", v24, v25, v26, v27, v28, v29, v30, v58);
      }
    }

    --dword_1000469A0;
    return BYTE1(v59);
  }

void record_child(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = malloc(0x28uLL);
  if (v8)
  {
    *(_DWORD *)uint64_t v8 = a1;
    v8[1] = a2;
    v8[2] = a3;
    uint64_t v16 = qword_100046DC0;
    v8[3] = a4;
    v8[4] = v16;
    qword_100046DC0 = (uint64_t)v8;
  }

  else
  {
    warning("losing track of %s process", v9, v10, v11, v12, v13, v14, v15, a2);
  }

uint64_t run_program(const char *a1, char *const *a2, int a3, uint64_t a4, uint64_t a5)
{
  *__error() = 22;
  if (stat(a1, &v38) < 0 || ((v38.st_mode & 0xF000) == 0x8000 ? (BOOL v17 = (v38.st_mode & 0x49) == 0) : (BOOL v17 = 1), v17))
  {
    if (a3 || *__error() != 2) {
      warning("Can't execute %s: %m", v10, v11, v12, v13, v14, v15, v16, (int)a1);
    }
    return 0LL;
  }

  else
  {
    uint64_t v20 = safe_fork();
    if ((_DWORD)v20 == -1)
    {
      error("Failed to create child process for %s: %m", v21, v22, v23, v24, v25, v26, v27, (int)a1);
      return 0xFFFFFFFFLL;
    }

    else
    {
      uint64_t v18 = v20;
      if (!(_DWORD)v20)
      {
        setsid();
        umask(0x3Fu);
        chdir("/");
        setuid(0);
        gid_t v28 = getegid();
        setgid(v28);
        closelog();
        uint64_t v29 = *(void (**)(void))(the_channel + 80);
        if (v29) {
          v29();
        }
        dup2(dword_100046990, 0);
        dup2(dword_100046990, 1);
        dup2(dword_100046990, 2);
        close(dword_100046990);
        closeallfrom(3);
        if (setpriority(0, 0, 0) < 0) {
          warning("can't reset priority to 0: %m", v30, v31, v32, v33, v34, v35, v36, v37);
        }
        execve(a1, a2, (char *const *)script_env);
        if (a3 || *__error() != 2)
        {
          reopen_log();
          sys_log(3, "Can't execute %s: %m", a1);
          closelog();
        }

        _exit(-1);
      }

      if (debug) {
        dbglog("Script %s started (pid %d)", v21, v22, v23, v24, v25, v26, v27, (int)a1);
      }
      record_child(v18, (uint64_t)a1, a4, a5);
    }
  }

  return v18;
}

void *add_notifier(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = malloc(0x18uLL);
  if (!result) {
    novm((int)"notifier struct", v7, v8, v9, v10, v11, v12, v13);
  }
  *uint64_t result = *a1;
  result[1] = a2;
  result[2] = a3;
  *a1 = result;
  return result;
}

void novm( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void *add_notifier_last(void **a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = malloc(0x18uLL);
  if (!result) {
    novm((int)"notifier struct", v7, v8, v9, v10, v11, v12, v13);
  }
  *uint64_t result = 0LL;
  result[1] = a2;
  result[2] = a3;
  for (uint64_t i = *a1; i; uint64_t i = (void *)*i)
    a1 = (void **)i;
  *a1 = result;
  return result;
}

void remove_notifier(void **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  if (*a1)
  {
    while (1)
    {
      uint64_t v4 = v3;
      if (v3[1] == a2 && v3[2] == a3) {
        break;
      }
      uint64_t v3 = (void *)*v3;
      a1 = (void **)v4;
      if (!*v4) {
        return;
      }
    }

    *a1 = (void *)*v3;
    free(v3);
  }

uint64_t **notify_with_ptr(uint64_t **result, uint64_t a2)
{
  if (result)
  {
    do
    {
      uint64_t v3 = *result;
      ((void (*)(uint64_t *, uint64_t))result[1])(result[2], a2);
      uint64_t result = (uint64_t **)v3;
    }

    while (v3);
  }

  return result;
}

void sub_100012DD8()
{
  uint64_t v0 = (_opaque_pthread_t *)qword_100046988;
  if (!qword_100046988 || (uint64_t v1 = pthread_self(), pthread_equal(v0, v1)))
  {
    byte_1000472A4 = 1;
    if (byte_100046994 == 1) {
      siglongjmp(dword_1000471E0, 1);
    }
  }

uint64_t sub_100012E3C(uint64_t result)
{
  int v1 = result;
  int v2 = (_opaque_pthread_t *)qword_100046988;
  if (!qword_100046988 || (uint64_t v3 = pthread_self(), result = pthread_equal(v2, v3), (_DWORD)result))
  {
    got_sigtstp = v1;
    if ((phase | 4) != 0xC)
    {
      got_sighup = 1;
      if (dword_1000469A0) {
        uint64_t result = sub_1000119F4(v1);
      }
    }

    uint64_t v4 = sigreceived;
    if (sigreceived)
    {
      do
      {
        uint64_t v5 = *(void *)v4;
        uint64_t result = (*(uint64_t (**)(void, void))(v4 + 8))(*(void *)(v4 + 16), v1);
        uint64_t v4 = v5;
      }

      while (v5);
    }

    if (byte_100046994 == 1) {
      siglongjmp(dword_1000471E0, 1);
    }
  }

  return result;
}

uint64_t sub_100012EFC(uint64_t result)
{
  int v1 = result;
  int v2 = (_opaque_pthread_t *)qword_100046988;
  if (!qword_100046988 || (uint64_t v3 = pthread_self(), result = pthread_equal(v2, v3), (_DWORD)result))
  {
    got_sigcont = v1;
    uint64_t v4 = sigreceived;
    if (sigreceived)
    {
      do
      {
        uint64_t v5 = *(void *)v4;
        uint64_t result = (*(uint64_t (**)(void, void))(v4 + 8))(*(void *)(v4 + 16), v1);
        uint64_t v4 = v5;
      }

      while (v5);
    }

    if (byte_100046994 == 1) {
      siglongjmp(dword_1000471E0, 1);
    }
  }

  return result;
}

uint64_t sub_100012F88()
{
  uint64_t v0 = (_opaque_pthread_t *)qword_100046988;
  if (!qword_100046988 || (v1 = pthread_self(), uint64_t result = pthread_equal(v0, v1), (_DWORD)result))
  {
    BOOL v3 = debug == 0;
    debug = debug == 0;
    if (v3) {
      return setlogmask(255);
    }
    else {
      return setlogmask(31);
    }
  }

  return result;
}

void sub_100012FF0()
{
  uint64_t v0 = (_opaque_pthread_t *)qword_100046988;
  if (!qword_100046988 || (int v1 = pthread_self(), pthread_equal(v0, v1)))
  {
    got_sigusr2 = 1;
    if (byte_100046994 == 1) {
      siglongjmp(dword_1000471E0, 1);
    }
  }

uint64_t sub_100013054( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = (_opaque_pthread_t *)qword_100046988;
  if (!qword_100046988 || (uint64_t v10 = pthread_self(), result = pthread_equal(v9, v10), (_DWORD)result))
  {
    if (byte_1000472A8 == 1) {
      _exit(127);
    }
    byte_1000472A8 = 1;
    error("Fatal signal %d", a2, a3, a4, a5, a6, a7, a8, a1);
    if (dword_1000469A0) {
      sub_1000119F4(15);
    }
    notify((uint64_t **)sigreceived, a1);
    die(127);
  }

  return result;
}

uint64_t sub_1000130F4(const char **a1)
{
  if (**a1)
  {
    if (**a1 != 46)
    {
      size_t v2 = strlen(hostname);
      strncat(hostname, ".", 255 - v2);
    }

    size_t v3 = strlen(hostname);
    domain = (uint64_t)&hostname[v3];
    strncat(hostname, *a1, 255 - v3);
  }

  byte_100043C07 = 0;
  return 1LL;
}

uint64_t sub_100013198(char **a1)
{
  return options_from_file(*a1, 1, 1, privileged_option);
}

uint64_t sub_1000131B0( const char **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = *(unsigned __int8 *)*a1;
  if (!**a1 || v8 == 47)
  {
LABEL_3:
    option_error("call option value may not contain .. or start with /", a2, a3, a4, a5, a6, a7, a8, v23);
    return 0LL;
  }

  uint64_t v10 = *a1;
  while (v8 == 46)
  {
    if (v10[1] == 46 && (!v10[2] || v10[2] == 47)) {
      goto LABEL_3;
    }
    do
    {
LABEL_11:
      if (v8 == 47) {
        break;
      }
      int v11 = *(unsigned __int8 *)++v10;
      int v8 = v11;
    }

    while (v11);
    if (v8 == 47) {
      ++v10;
    }
    int v8 = *(unsigned __int8 *)v10;
  }

  if (v8) {
    goto LABEL_11;
  }
  int v12 = strlen(*a1) + 16;
  uint64_t v13 = (char *)malloc(v12);
  if (!v13) {
    novm((int)"call file name", v14, v15, v16, v17, v18, v19, v20);
  }
  uint64_t v21 = v13;
  slprintf((int)v13, v12, "%s%s");
  uint64_t v22 = options_from_file(v21, 0, 1, 1);
  free(v21);
  return v22;
}

uint64_t sub_1000132BC()
{
  if (phase == 1)
  {
    fprintf(__stderrp, "pppd version %s (Apple version %s)\n", "2.4.2", "884");
    exit(0);
  }

  return 0LL;
}

uint64_t sub_100013320()
{
  if (phase == 1)
  {
    sub_100013A94();
    exit(0);
  }

  return 0LL;
}

uint64_t sub_100013354(const char **a1)
{
  if (!privileged_option)
  {
    uid_t v2 = getuid();
    seteuid(v2);
  }

  int v3 = open(*a1, 2569, 420LL);
  if (v3 < 0)
  {
    if (*__error() == 17)
    {
      int v4 = open(*a1, 9, v21);
      goto LABEL_22;
    }

    if (privileged_option)
    {
      uint64_t v5 = dirname((char *)*a1);
      sys_log(4, "Warning: Creating directory for log file = %s\n", *a1);
      mode_t v6 = umask(0);
      size_t v7 = (int)(strlen(v5) + 1);
      int v8 = (char *)malloc(v7);
      if (!v8) {
        goto LABEL_21;
      }
      uint64_t v9 = v8;
      strlcpy(v8, v5, v7);
      uint64_t v10 = *v9 == 47;
      while (1)
      {
        if (v9[v10])
        {
          if (v9[v10] != 47)
          {
            int v11 = 0;
            goto LABEL_19;
          }

          int v11 = 0;
          v9[v10] = 0;
        }

        else
        {
          int v11 = 1;
        }

        if (mkdir(v9, 0x1EDu) && (*__error() != 17 && *__error() != 21 || stat(v9, &v22) < 0))
        {
LABEL_20:
          free(v9);
          umask(v6);
LABEL_21:
          int v4 = open(*a1, 2569, 420LL);
LABEL_22:
          int v3 = v4;
          break;
        }

        v9[v10] = 47;
LABEL_19:
        ++v10;
        if (v11) {
          goto LABEL_20;
        }
      }
    }
  }

  int v12 = *__error();
  if (!privileged_option)
  {
    seteuid(0);
    if ((v3 & 0x80000000) == 0) {
      goto LABEL_25;
    }
LABEL_29:
    *__error() = v12;
    option_error("Can't open log file %s: %m", v13, v14, v15, v16, v17, v18, v19, (int)*a1);
    return 1LL;
  }

  if (v3 < 0) {
    goto LABEL_29;
  }
LABEL_25:
  __strlcpy_chk(&unk_1000472B0, *a1, 1024LL, 1024LL);
  if ((dword_100040F20 & 0x80000000) == 0) {
    close(dword_100040F20);
  }
  dword_100040F20 = v3;
  log_to_fd = v3;
  log_default = 0;
  return 1LL;
}

uint64_t sub_10001356C(_BYTE **a1)
{
  uint64_t v1 = (uint64_t)*a1;
  return 1LL;
}

uint64_t sub_1000135B0(_BYTE **a1)
{
  uint64_t v1 = (uint64_t)*a1;
  option_error("Couldn't load plugin %s", v2, v3, v4, v5, v6, v7, v8, v1);
  return 0LL;
}

uint64_t sub_1000135FC()
{
  if (sys_check_controller())
  {
    int v7 = dup(0);
    controlfd = v7;
    if (v7 == -1)
    {
      uint64_t v9 = "Can't duplicate control file descripor: %m";
    }

    else
    {
      controlfile = (uint64_t)fdopen(v7, "r");
      if (controlfile)
      {
        statusfd = dup(1);
        if (statusfd != -1)
        {
          if (log_default)
          {
            log_to_fd = -1;
            log_default = 0;
          }

          uint64_t result = 1LL;
          controlled = 1;
          return result;
        }

        uint64_t v9 = "Can't duplicate status file descripor: %m";
      }

      else
      {
        close(controlfd);
        uint64_t v9 = "Can't open control file descripor: %m";
      }
    }
  }

  else
  {
    uint64_t v9 = "Can't verify the controller started the connection";
  }

  option_error(v9, v0, v1, v2, v3, v4, v5, v6, v10);
  if (controlfile)
  {
    fclose((FILE *)controlfile);
    controlfile = 0LL;
    controlfd = -1;
  }

  if (statusfd == -1) {
    return 0LL;
  }
  close(statusfd);
  uint64_t result = 0LL;
  statusfd = -1;
  return result;
}

uint64_t parse_args(int a1, const char **a2)
{
  privileged_option = privileged;
  option_source = (uint64_t)"command line";
  option_priority = 2;
  uint64_t v2 = 1LL;
  if (a1 >= 1)
  {
    int v4 = a1;
    while (1)
    {
      int v7 = *a2;
      uint64_t v5 = a2 + 1;
      uint64_t v6 = (uint64_t)v7;
      uint64_t v8 = sub_100013850(v7);
      if (!v8) {
        break;
      }
      unsigned int v16 = (*((_DWORD *)v8 + 2) | 2) != 2 && ((*((_DWORD *)v8 + 8) >> 9) & 1) == 0;
      if (v4 <= v16)
      {
        option_error("too few parameters for option %s", v9, v10, v11, v12, v13, v14, v15, v6);
        return 0LL;
      }

      a2 = &v5[v16];
      BOOL v17 = __OFADD__(v4, ~v16);
      v4 += ~v16;
      if ((v4 < 0) ^ v17 | (v4 == 0)) {
        return 1LL;
      }
    }

    option_error("unrecognized option '%s'", v9, v10, v11, v12, v13, v14, v15, v6);
    if (phase == 1) {
      fprintf( __stderrp,  "pppd version %s\n Usage: %s [ options ], where options are:\n \t<device>\tCommunicate over the named device\n \t<speed>\t\tSet the baud rate to <speed>\n \t<loc>:<rem>\tSet the local and/or remote interface IP\n \t\t\taddresses.  Either one may be omitted.\n \tasyncmap <n>\tSet the desired async map to hex <n>\n \tauth\t\tRequire authentication from peer\n connect <p>     Invoke shell command <p> to set up the serial line\n \tcrtscts\t\tUse hardware RTS/CTS flow control\n \tdefaultroute\tAdd default route through interface\n \tfile <f>\tTake options from file <f>\n \tmodem\t\tUse modem control lines\n \tmru <n>\t\tSet MRU value to <n> for negotiation\n See pppd(8) for more options.\n",  "2.4.2",  (const char *)progname);
    }
    return 0LL;
  }

  return v2;
}

char **sub_100013850(const char *a1)
{
  int v2 = 0;
  for (char i = 1; ; char i = 0)
  {
    char v4 = i;
    if (general_options) {
      break;
    }
LABEL_6:
    if (auth_options)
    {
      uint64_t v5 = &auth_options;
      while (!sub_1000151B8(a1, (uint64_t)v5, v2))
      {
        int v7 = v5[12];
        v5 += 12;
        if (!v7) {
          goto LABEL_10;
        }
      }

      return v5;
    }

LABEL_10:
    uint64_t v8 = qword_1000476B0;
    if (qword_1000476B0)
    {
      while (1)
      {
        uint64_t v5 = *(char ***)v8;
        if (**(void **)v8) {
          break;
        }
LABEL_14:
        uint64_t v8 = *(void *)(v8 + 8);
        if (!v8) {
          goto LABEL_15;
        }
      }

      while (!sub_1000151B8(a1, (uint64_t)v5, v2))
      {
        uint64_t v9 = v5[12];
        v5 += 12;
        if (!v9) {
          goto LABEL_14;
        }
      }

      return v5;
    }

LABEL_15:
    uint64_t v5 = *(char ***)the_channel;
    if (**(void **)the_channel)
    {
      while (!sub_1000151B8(a1, (uint64_t)v5, v2))
      {
        uint64_t v10 = v5[12];
        v5 += 12;
        if (!v10) {
          goto LABEL_18;
        }
      }

      return v5;
    }

LABEL_18:
    uint64_t v11 = protocols;
    if (protocols)
    {
      uint64_t v12 = 0LL;
      while (1)
      {
        uint64_t v5 = (char **)*((void *)v11 + 13);
        if (v5)
        {
          if (*v5) {
            break;
          }
        }

LABEL_24:
        uint64_t v11 = (&protocols)[++v12];
        if (!v11) {
          goto LABEL_25;
        }
      }

      while (!sub_1000151B8(a1, (uint64_t)v5, v2))
      {
        uint64_t v13 = v5[12];
        v5 += 12;
        if (!v13) {
          goto LABEL_24;
        }
      }

      return v5;
    }

  uint64_t v13 = v16;
  int v7 = v17;
  if (v17 >= 1)
  {
LABEL_25:
    int v23 = v7 + 1;
    do
    {
      uint64_t v24 = *v13++;
      ((void (*)(uint64_t, const char *, ...))a3)(a4, " %.2x", v24);
      --v23;
    }

    while (v23 > 1);
  }

  return ((_DWORD)v13 - (_DWORD)a1);
}

    if (v20) {
      goto LABEL_28;
    }
LABEL_27:
    uint64_t v24 = ntohs(*(unsigned __int16 *)(v5 + 8));
    *(_WORD *)(v5 + 8) = htons(v24 | 1u);
    goto LABEL_28;
  }

  if (v9 != 2)
  {
    uint64_t v20 = (uint64_t **)*((void *)a1 + 3);
    uint64_t v13 = 8;
    goto LABEL_24;
  }

  uint64_t v11 = *((void *)a1 + 3);
  if (!v11)
  {
    uint64_t v13 = 8;
    goto LABEL_27;
  }

  uint64_t v12 = v5 + 12;
  uint64_t v13 = 8;
  while (1)
  {
    uint64_t v14 = strlen(*(const char **)(v11 + 16));
    uint64_t v15 = v14;
    unsigned int v16 = v14 + 6;
    if (v14 + 6 + v13 > v8) {
      break;
    }
    BOOL v17 = *(_DWORD *)(v11 + 8);
    uint64_t v18 = htons((unsigned __int16)v14);
    *(_DWORD *)uint64_t v12 = v17;
    *(_WORD *)(v12 + 4) = v18;
    memcpy((void *)(v12 + 6), *(const void **)(*((void *)a1 + 3) + 16LL), v15);
    v13 += v16;
    uint64_t v19 = (uint64_t *)*((void *)a1 + 3);
    uint64_t v11 = *v19;
    *((void *)a1 + 3) = *v19;
    v12 += v16;
    if (!v11) {
      goto LABEL_27;
    }
  }

void option_error( char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  if (phase == 1) {
    fprintf(__stderrp, "%s: %s\n", (const char *)progname, v9);
  }
  sys_log(3, "%s", v9);
}

uint64_t sub_100013A94()
{
  if (phase == 1) {
    return fprintf( __stderrp,  "pppd version %s\n Usage: %s [ options ], where options are:\n \t<device>\tCommunicate over the named device\n \t<speed>\t\tSet the baud rate to <speed>\n \t<loc>:<rem>\tSet the local and/or remote interface IP\n \t\t\taddresses.  Either one may be omitted.\n \tasyncmap <n>\tSet the desired async map to hex <n>\n \tauth\t\tRequire authentication from peer\n connect <p>     Invoke shell command <p> to set up the serial line\n \tcrtscts\t\tUse hardware RTS/CTS flow control\n \tdefaultroute\tAdd default route through interface\n \tfile <f>\tTake options from file <f>\n \tmodem\t\tUse modem control lines\n \tmru <n>\t\tSet MRU value to <n> for negotiation\n See pppd(8) for more options.\n",  "2.4.2",  (const char *)progname);
  }
  return result;
}

uint64_t sub_100013AF0( uint64_t a1, uint64_t a2, const char **a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = 0LL;
  current_option = *(void *)a1;
  unsigned int v12 = *(_DWORD *)(a1 + 32);
  do
  {
    int v13 = *(_DWORD *)(a1 + v11 + 32);
    v11 -= 96LL;
  }

  while ((v13 & 0x100000) != 0);
  if (((privileged_option != 0) & (v12 >> 25)) != 0) {
    int v14 = option_priority + 100;
  }
  else {
    int v14 = option_priority;
  }
  if ((v13 & 0x80000) != 0)
  {
    int v15 = *(__int16 *)(a1 + v11 + 160);
    if (v14 < v15)
    {
      uint64_t result = 1LL;
      if (v14 == 2 && v15 >= 101)
      {
        option_error("%s%s set in %s cannot be overridden\n", a2, (uint64_t)a3, a4, a5, a6, a7, a8, *(void *)a1);
        return 0LL;
      }

      return result;
    }

    if (v14 >= 101 && v15 == 2)
    {
      warning("%s%s from %s overrides command line", a2, (uint64_t)a3, a4, a5, a6, a7, a8, *(void *)a1);
      unsigned int v12 = *(_DWORD *)(a1 + 32);
    }
  }

  if ((v12 & 0x4000000) != 0 && phase != 1)
  {
    option_error("%s%s cannot be changed after initialization", a2, (uint64_t)a3, a4, a5, a6, a7, a8, *(void *)a1);
    return 0LL;
  }

  if ((v12 & 0x1000) != 0 && !privileged_option)
  {
    option_error("using the %s%s requires root privilege", a2, (uint64_t)a3, a4, a5, a6, a7, a8, *(void *)a1);
    return 0LL;
  }

  if ((v12 & 0x800000) != 0 && !**(_BYTE **)(a1 + 40))
  {
    option_error("%s%s is disabled", a2, (uint64_t)a3, a4, a5, a6, a7, a8, *(void *)a1);
    return 0LL;
  }

  if ((v12 & 0x8000000) != 0 && devnam_fixed)
  {
    option_error("the %s%s may not be changed in %s", a2, (uint64_t)a3, a4, a5, a6, a7, a8, *(void *)a1);
    return 0LL;
  }

  switch(*(_DWORD *)(a1 + 8))
  {
    case 0:
    case 1:
    case 7:
      uint64_t result = (*(uint64_t (**)(const char **))(a1 + 16))(a3);
      if ((_DWORD)result)
      {
        if ((*(_BYTE *)(a1 + 34) & 1) != 0)
        {
          BOOL v17 = *a3;
          size_t v18 = strlen(*a3);
          uint64_t v19 = malloc(v18 + 25);
          if (v19)
          {
            uint64_t v20 = v19;
            strlcpy((char *)v19 + 16, v17, v18 + 1);
            uint64_t v21 = option_source;
            *uint64_t v20 = 0LL;
            v20[1] = v21;
            stat v22 = (void *)(a1 + 40);
            do
            {
              int v23 = v22;
              stat v22 = (void *)*v22;
            }

            while (v22);
            *int v23 = v20;
          }
        }

        goto LABEL_86;
      }

      return result;
    case 2:
      **(_BYTE **)(a1 + 16) = v12;
      uint64_t v24 = *(_BYTE **)(a1 + 40);
      if (!v24) {
        goto LABEL_86;
      }
      int v25 = *(_DWORD *)(a1 + 32);
      if ((v25 & 0x400000) == 0)
      {
        if ((v25 & 0x1000000) != 0)
        {
          *uint64_t v24 = 0;
          goto LABEL_86;
        }

        if ((v25 & 0x10000) != 0)
        {
          LOBYTE(v12) = *v24 & ~(_BYTE)v12;
        }

        else
        {
          if ((v25 & 0x800) == 0) {
            goto LABEL_86;
          }
          LOBYTE(v12) = *v24 | v12;
        }
      }

      *uint64_t v24 = v12;
      goto LABEL_86;
    case 3:
      if ((v12 & 0x200) != 0)
      {
        int v26 = 0;
      }

      else
      {
        uint64_t result = sub_100014EF0(*a3, &v62, 0);
        if (!(_DWORD)result) {
          return result;
        }
        int v26 = v62;
        unsigned int v12 = *(_DWORD *)(a1 + 32);
        if (((v12 & 0x4000) != 0 && v62 < *(_DWORD *)(a1 + 52) || (v12 & 0x8000) != 0 && v62 > *(_DWORD *)(a1 + 48))
          && ((v12 & 0x10000) == 0 || v62))
        {
          int v27 = *(_DWORD *)(a1 + 32) & 0xC000;
          switch(v27)
          {
            case 49152:
              option_error("%s value must be%s between %d and %d", a2, (uint64_t)a3, a4, a5, a6, a7, a8, *(void *)a1);
              break;
            case 32768:
              option_error("%s value must be%s <= %d", a2, (uint64_t)a3, a4, a5, a6, a7, a8, *(void *)a1);
              break;
            case 16384:
              option_error("%s value must be%s >= %d", a2, (uint64_t)a3, a4, a5, a6, a7, a8, *(void *)a1);
              break;
          }

          return 0LL;
        }
      }

      if ((v12 & 0x80) != 0) {
        int v37 = -256;
      }
      else {
        int v37 = 0;
      }
      signed int v28 = (v37 & 0xFFFFFF00 | v12) + v26;
      if ((v12 & 0x800) != 0) {
        v28 += **(_DWORD **)(a1 + 16);
      }
      stat v38 = *(signed int **)(a1 + 16);
      if ((v12 & 0x20000) != 0 && !privileged_option)
      {
        signed int v39 = *v38;
        if ((v12 & 0x40000) != 0)
        {
          if (!v39) {
            goto LABEL_77;
          }
          if (!v28) {
            goto LABEL_73;
          }
        }

        if (v28 > v39)
        {
LABEL_73:
          option_error("%s value cannot be increased", a2, (uint64_t)a3, a4, a5, a6, a7, a8, *(void *)a1);
          return 0LL;
        }
      }

      goto LABEL_77;
    case 4:
      if ((v12 & 0x200) != 0)
      {
        signed int v28 = ((char)v12 >> 7) & 0xFFFFFF00 | v12;
      }

      else
      {
        uint64_t result = sub_100014EF0(*a3, &v61, 16);
        if (!(_DWORD)result) {
          return result;
        }
        unsigned int v12 = *(_DWORD *)(a1 + 32);
        signed int v28 = v61;
      }

      stat v38 = *(signed int **)(a1 + 16);
      if ((v12 & 0x400) != 0) {
        v28 |= *v38;
      }
LABEL_77:
      *stat v38 = v28;
      uint64_t v40 = *(signed int **)(a1 + 40);
      if (v40 && (*(_BYTE *)(a1 + 34) & 0x40) != 0) {
        *uint64_t v40 = v28;
      }
LABEL_86:
      int v42 = *(BOOL **)(a1 + 40);
      if (v42)
      {
        int v43 = *(_DWORD *)(a1 + 32);
        if ((v43 & 0x30C10800) == 0) {
          *int v42 = (v43 & 0x1000000) == 0;
        }
      }

      uint64_t v44 = a1 + v11;
      if (*(void *)(a1 + v11 + 152))
      {
        uint64_t v45 = *(void **)(v44 + 176);
        if (v45)
        {
          uint64_t v46 = a1 + v11;
          uint64_t v47 = realloc(v45, 8LL * *(int *)(a1 + v11 + 184) + 8);
          if (v47)
          {
            *(void *)(v44 + 176) = v47;
            uint64_t v48 = *(int *)(v46 + 184);
            v47[v48] = option_source;
            *(_DWORD *)(v46 + 184) = v48 + 1;
          }
        }

        else
        {
          uint64_t v49 = malloc(8uLL);
          *(void *)(v44 + 176) = v49;
          if (!v49) {
            novm((int)"option other source", v50, v51, v52, v53, v54, v55, v56);
          }
          *uint64_t v49 = option_source;
          *(_DWORD *)(a1 + v11 + 184) = 1;
        }
      }

      else
      {
        *(void *)(v44 + 152) = option_source;
      }

      uint64_t v57 = a1 + v11;
      *(_WORD *)(v57 + 16notify((uint64_t **)lcp_lowerdown_notify, 0) = v14;
      *(_WORD *)(v57 + 162) = -21845 * ((-96 - v11) >> 5);
      if (*(_DWORD *)(a1 + 8) == 5 && (*(_BYTE *)(a1 + 34) & 1) != 0)
      {
        int v58 = strlen(*a3);
        if (v58 >= 1)
        {
          for (uint64_t i = 0LL; i != v58; (*a3)[i++] = 42)
            ;
        }
      }

      if (phase != 1)
      {
        uint64_t v60 = *(void (**)(void))(a1 + 72);
        if (v60) {
          v60();
        }
      }

      uint64_t result = 1LL;
      break;
    case 5:
      if ((v12 & 0x2000) != 0)
      {
        strlcpy(*(char **)(a1 + 16), *a3, *(int *)(a1 + 48));
        uint64_t v41 = *(char **)(a1 + 40);
        if (v41 && (*(_BYTE *)(a1 + 34) & 0x40) != 0) {
          strlcpy(v41, *a3, *(int *)(a1 + 48));
        }
      }

      else
      {
        uint64_t v29 = strdup(*a3);
        if (!v29) {
          novm((int)"option argument", v30, v31, v32, v33, v34, v35, v36);
        }
        **(void **)(a1 + 16) = v29;
      }

      goto LABEL_86;
    case 6:
      uint64_t result = (*(uint64_t (**)(uint64_t, const char **, uint64_t))(a1 + 16))(a2, a3, 1LL);
      if (!(_DWORD)result) {
        return result;
      }
      goto LABEL_86;
    default:
      goto LABEL_86;
  }

  return result;
}

uint64_t options_from_file(char *__filename, int a2, int a3, int a4)
{
  if (a3)
  {
    uid_t v8 = getuid();
    seteuid(v8);
  }

  uint64_t v9 = fopen(__filename, "r");
  int v10 = *__error();
  if (a3) {
    seteuid(0);
  }
  if (v9)
  {
    int v11 = privileged_option;
    privileged_option = a4;
    uint64_t v12 = option_source;
    int v13 = strdup(__filename);
    int v14 = "file";
    if (v13) {
      int v14 = v13;
    }
    option_source = (uint64_t)v14;
    int v15 = "In file %s: unrecognized option '%s'";
    while (1)
    {
      unsigned int v16 = v13;
      if (!getword(v9, (uint64_t)v37, &v36, (int)__filename))
      {
        uint64_t v34 = 1LL;
        goto LABEL_26;
      }

      BOOL v17 = sub_100013850(v37);
      if (!v17) {
        break;
      }
      uint64_t v25 = (uint64_t)v17;
      if ((*((_DWORD *)v17 + 2) | 2) != 2 && (*((_BYTE *)v17 + 33) & 2) == 0)
      {
        if (!getword(v9, (uint64_t)v38, &v36, (int)__filename))
        {
          int v15 = "In file %s: too few parameters for option '%s'";
          break;
        }

        signed int v39 = v38;
      }

      int v26 = sub_100013AF0(v25, (uint64_t)v37, &v39, v20, v21, v22, v23, v24);
      int v13 = 0LL;
      if (!v26) {
        goto LABEL_25;
      }
    }

    option_error(v15, v18, v19, v20, v21, v22, v23, v24, (int)__filename);
LABEL_25:
    uint64_t v34 = 0LL;
LABEL_26:
    fclose(v9);
    privileged_option = v11;
    option_source = v12;
    if (v16) {
      free(v16);
    }
  }

  else
  {
    *__error() = v10;
    if (a2)
    {
      option_error("Can't open options file %s: %m", v27, v28, v29, v30, v31, v32, v33, (int)__filename);
      return 0LL;
    }

    else
    {
      uint64_t v34 = 1LL;
      if (v10 != 2 && v10 != 20) {
        warning("Warning: can't open options file %s: %m", v27, v28, v29, v30, v31, v32, v33, (int)__filename);
      }
    }
  }

  return v34;
}

uint64_t getword(FILE *a1, uint64_t a2, _DWORD *a3, int a4)
{
  LODWORD(v8) = 0;
  uint64_t v9 = 0LL;
  *a3 = 0;
  char v10 = 1;
  while (1)
  {
LABEL_2:
    int v11 = v8;
    char v12 = v10;
    uint64_t v8 = v9;
    do
    {
      uint64_t v9 = v8;
      unsigned int v13 = getc(a1);
      if (v13 == -1) {
        goto LABEL_19;
      }
      unsigned int v21 = v13;
      if (v13 == 10)
      {
        LODWORD(v8) = 0;
        char v10 = 1;
        if ((v12 & 1) != 0)
        {
          LODWORD(v8) = 0;
          uint64_t v9 = 0LL;
          *a3 = 1;
        }

        goto LABEL_2;
      }

      uint64_t v8 = 1LL;
    }

    while ((_DWORD)v9);
    if ((v12 & 1) == 0) {
      goto LABEL_26;
    }
    char v10 = 0;
    uint64_t v9 = 0LL;
    if (v13 != 92)
    {
      if (v13 == 35)
      {
        LODWORD(v8) = 0;
        char v10 = 1;
        uint64_t v9 = 1LL;
        continue;
      }

      __uint32_t v22 = v13 > 0x7F ? __maskrune(v13, 0x4000uLL) : _DefaultRuneLocale.__runetype[v13] & 0x4000;
      LODWORD(v8) = 0;
      uint64_t v9 = 0LL;
      char v10 = 1;
      if (!v22) {
        break;
      }
    }
  }

  if (v21 != 39 && v21 != 34)
  {
LABEL_26:
    unsigned int v23 = 0;
    goto LABEL_27;
  }

  unsigned int v23 = v21;
  unsigned int v21 = getc(a1);
  if (v21 != -1)
  {
LABEL_27:
    unint64_t v24 = 0LL;
    while (1)
    {
      while (!v11)
      {
        if (v23)
        {
          if (v21 == v23) {
            goto LABEL_22;
          }
        }

        else
        {
          if (v21 > 0x7F) {
            __uint32_t v26 = __maskrune(v21, 0x4000uLL);
          }
          else {
            __uint32_t v26 = _DefaultRuneLocale.__runetype[v21] & 0x4000;
          }
          if (v21 == 35 || v26)
          {
            ungetc(v21, a1);
            goto LABEL_22;
          }
        }

        if (v21 == 92)
        {
          int v11 = 1;
          goto LABEL_41;
        }

        if (v24 <= 0x3FE) {
          *(_BYTE *)(a2 + v24) = v21;
        }
LABEL_73:
        unsigned int v21 = getc(a1);
LABEL_74:
        int v11 = 0;
        ++v24;
        if (v21 == -1) {
          goto LABEL_20;
        }
      }

      if (v21 != 10) {
        break;
      }
      int v11 = 0;
LABEL_41:
      unsigned int v21 = getc(a1);
      if (v21 == -1) {
        goto LABEL_20;
      }
    }

    if ((int)v21 > 109)
    {
      switch(v21)
      {
        case 'n':
          int v27 = 1;
          char v28 = 10;
          break;
        case 'r':
          int v27 = 1;
          char v28 = 13;
          break;
        case 's':
          int v27 = 1;
          char v28 = 32;
          break;
        case 't':
          int v27 = 1;
          char v28 = 9;
          break;
        default:
          goto LABEL_57;
      }

LABEL_70:
      if (v24 <= 0x3FE) {
        *(_BYTE *)(a2 + v24) = v28;
      }
      if (!v27) {
        goto LABEL_74;
      }
      goto LABEL_73;
    }

    switch(v21)
    {
      case 'a':
        int v27 = 1;
        char v28 = 7;
        goto LABEL_70;
      case 'b':
        int v27 = 1;
        char v28 = 8;
        goto LABEL_70;
      case 'f':
        int v27 = 1;
        char v28 = 12;
        goto LABEL_70;
    }

uint64_t options_from_user()
{
  uid_t v0 = getuid();
  uint64_t v1 = getpwuid(v0);
  if (!v1) {
    return 1LL;
  }
  pw_dir = v1->pw_dir;
  if (!pw_dir || !*pw_dir) {
    return 1LL;
  }
  size_t v3 = strlen(v1->pw_dir);
  int v4 = v3 + 8;
  uint64_t v5 = (char *)malloc(v3 + 8);
  if (!v5) {
    novm((int)"init file name", v6, v7, v8, v9, v10, v11, v12);
  }
  unsigned int v13 = v5;
  slprintf((int)v5, v4, "%s/%s");
  option_priority = 1;
  uint64_t v14 = options_from_file(v13, 0, 1, privileged);
  free(v13);
  return v14;
}

uint64_t options_for_tty()
{
  uid_t v0 = strstr((const char *)&devnam, "/dev/");
  if (v0) {
    uint64_t v1 = v0 + 5;
  }
  else {
    uint64_t v1 = (const char *)&devnam;
  }
  if (*v1 && strcmp(v1, "tty"))
  {
    size_t v2 = strlen(v1);
    int v3 = v2 + 18;
    int v4 = (char *)malloc(v2 + 18);
    if (!v4) {
      novm((int)"tty init file name", v5, v6, v7, v8, v9, v10, v11);
    }
    uint64_t v12 = v4;
    slprintf((int)v4, v3, "%s%s");
    for (uint64_t i = 17LL; ; ++i)
    {
      if (v12[i] == 47)
      {
        v12[i] = 46;
      }

      else if (!v12[i])
      {
        option_priority = 1;
        uint64_t v14 = options_from_file(v12, 0, 0, 1);
        free(v12);
        return v14;
      }
    }
  }

  return 1LL;
}

uint64_t options_from_list(uint64_t a1, int a2)
{
  privileged_option = a2;
  option_source = (uint64_t)"secrets file";
  option_priority = 3;
  if (!a1) {
    return 1LL;
  }
  uint64_t v2 = a1;
  int v3 = "In secrets file: unrecognized option '%s'";
  while (1)
  {
    int v4 = sub_100013850(*(const char **)(v2 + 8));
    if (!v4) {
      break;
    }
    uint64_t v12 = (uint64_t *)v2;
    if ((*((_DWORD *)v4 + 2) | 2) != 2)
    {
      uint64_t v12 = (uint64_t *)v2;
      if ((*((_BYTE *)v4 + 33) & 2) == 0)
      {
        uint64_t v12 = *(uint64_t **)v2;
        if (!*(void *)v2)
        {
          int v3 = "In secrets file: too few parameters for option '%s'";
          break;
        }

        uint64_t v14 = (const char *)v12[1];
      }
    }

    uint64_t result = sub_100013AF0((uint64_t)v4, *(void *)(v2 + 8), &v14, v7, v8, v9, v10, v11);
    if (!(_DWORD)result) {
      return result;
    }
    uint64_t v2 = *v12;
    if (!*v12) {
      return 1LL;
    }
  }

  option_error(v3, v5, v6, v7, v8, v9, v10, v11, *(void *)(v2 + 8));
  return 0LL;
}

char **override_value(const char *a1, int a2, uint64_t a3)
{
  uint64_t result = sub_100013850(a1);
  if (result)
  {
    uint64_t v6 = (_WORD *)result + 81;
    do
    {
      int v7 = *(_DWORD *)(v6 - 65);
      v6 -= 48;
    }

    while ((v7 & 0x100000) != 0);
    if ((v7 & 0x80000) != 0 && (__int16)*(v6 - 1) > a2)
    {
      return 0LL;
    }

    else
    {
      *(v6 - 1) = a2;
      *(void *)(v6 - 5) = a3;
      *uint64_t v6 = -1;
      return (char **)1;
    }
  }

  return result;
}

void *add_options(uint64_t a1)
{
  uint64_t result = malloc(0x10uLL);
  if (!result) {
    novm((int)"option list entry", v3, v4, v5, v6, v7, v8, v9);
  }
  uint64_t v10 = qword_1000476B0;
  *uint64_t result = a1;
  result[1] = v10;
  qword_1000476B0 = (uint64_t)result;
  return result;
}

uint64_t check_options()
{
  uint64_t result = dword_100040F20;
  if ((dword_100040F20 & 0x80000000) == 0 && dword_100040F20 != log_to_fd) {
    return close(dword_100040F20);
  }
  return result;
}

int *print_options(void (*a1)(const char *, const char *, ...), const char *a2)
{
  for (uint64_t i = qword_1000476B0; i; uint64_t i = *(void *)(i + 8))
    sub_100014B34(*(int **)i, a1, a2);
  uint64_t result = sub_100014B34(*(int **)the_channel, a1, a2);
  uint64_t v6 = protocols;
  if (protocols)
  {
    uint64_t v7 = (__int16 **)&off_10003F898;
    do
    {
      uint64_t result = sub_100014B34(*((int **)v6 + 13), a1, a2);
      uint64_t v8 = *v7++;
      uint64_t v6 = v8;
    }

    while (v8);
  }

  return result;
}

int *sub_100014B34(int *result, void (*a2)(const char *, const char *, ...), const char *a3)
{
  if (*(void *)result)
  {
    uint64_t v5 = result;
    do
    {
      if (*((_WORD *)v5 + 32))
      {
        uint64_t v6 = *((__int16 *)v5 + 33);
        if (v6 != -1)
        {
          uint64_t v7 = (const char **)&v5[24 * *((__int16 *)v5 + 33)];
          int v8 = *((_DWORD *)v7 + 8);
          if ((v8 & 0x40000000) == 0)
          {
            uint64_t v9 = &v5[24 * *((__int16 *)v5 + 33)];
            unsigned int v12 = v9[2];
            uint64_t v11 = v9 + 2;
            uint64_t v10 = (const char *)v12;
            switch(v12)
            {
              case 0u:
              case 1u:
              case 7u:
                a2(a3, "%s", *v7);
                if ((*v11 | 2) != 2 && (*((_BYTE *)v7 + 33) & 2) == 0)
                {
                  a2(a3, " ");
                  int v8 = *((_DWORD *)v7 + 8);
                  goto LABEL_10;
                }

                goto LABEL_41;
              case 2u:
                if (**(unsigned __int8 **)&v5[24 * *((__int16 *)v5 + 33) + 4] == v8
                  || (v8 & 0x800) != 0
                  && (uint64_t v15 = *(_BYTE **)&v5[24 * *((__int16 *)v5 + 33) + 10]) != 0LL
                  && (v8 & *v15) != 0)
                {
                  unsigned int v13 = a3;
                  uint64_t v14 = "%s";
                  goto LABEL_40;
                }

                goto LABEL_41;
              case 3u:
                if ((v8 & 0x80) != 0) {
                  int v17 = -256;
                }
                else {
                  int v17 = 0;
                }
                int v18 = **(_DWORD **)&v5[24 * *((__int16 *)v5 + 33) + 4];
                if ((v8 & 0x200) == 0)
                {
                  unsigned int v23 = (const char *)**(unsigned int **)&v5[24 * *((__int16 *)v5 + 33) + 4];
                  unsigned int v13 = a3;
                  uint64_t v14 = "%s %d";
                  goto LABEL_40;
                }

                uint64_t v19 = (const char *)(v17 & 0xFFFFFF00 | *((_DWORD *)v7 + 8));
                a2(a3, "%s", *v7);
                if (v18 != (_DWORD)v19)
                {
                  if ((*((_BYTE *)v7 + 33) & 8) == 0)
                  {
                    unsigned int v23 = v19;
                    unsigned int v13 = a3;
                    uint64_t v14 = " # oops: %d not %d\n";
                    goto LABEL_40;
                  }

                  while (v18 > (int)v19)
                  {
                    a2(a3, " %s", *v7);
                    v18 -= (int)v19;
                  }
                }

                goto LABEL_41;
              case 4u:
                a2(a3, "%s", *v7);
                if ((*((_BYTE *)v7 + 33) & 2) == 0)
                {
                  unsigned int v13 = a3;
                  uint64_t v14 = " %x";
                  goto LABEL_40;
                }

                goto LABEL_41;
              case 5u:
                uint64_t v16 = "??????";
                if ((v8 & 0x10000) == 0)
                {
                  uint64_t v16 = *(const char **)&v5[24 * *((__int16 *)v5 + 33) + 4];
                  if ((v8 & 0x2000) == 0) {
                    uint64_t v16 = *(const char **)v16;
                  }
                }

                unsigned int v23 = v16;
                unsigned int v13 = a3;
                uint64_t v14 = "%s %q";
                goto LABEL_40;
              case 6u:
LABEL_10:
                if ((v8 & 0x10000000) != 0)
                {
                  (*(void (**)(int *, void (*)(const char *, const char *, ...), const char *))&v5[24 * (int)v6 + 10])( &v5[24 * (int)v6],  a2,  a3);
                  goto LABEL_41;
                }

                if ((v8 & 0x20000000) != 0)
                {
                  uint64_t v14 = *(const char **)&v5[24 * (int)v6 + 10];
                  if ((v8 & 0x2000) == 0) {
                    uint64_t v14 = *(const char **)v14;
                  }
                  unsigned int v13 = "%q";
                  goto LABEL_40;
                }

                if ((v8 & 0x10000) == 0)
                {
                  unsigned int v13 = a3;
                  uint64_t v14 = "xxx # [don't know how to print value]";
LABEL_40:
                  a2(v13, v14);
                  goto LABEL_41;
                }

                for (uint64_t i = *(uint64_t ***)&v5[24 * (int)v6 + 10]; ; a2( a3,  "\t\t# (from %s)\n%s ",  (const char *)i[1],  *v7))
                {
                  a2(a3, "%q", i + 2, v23);
                  uint64_t i = (uint64_t **)*i;
                  if (!i) {
                    break;
                  }
                }

LABEL_41:
                a2(a3, "\t\t# (from %s", *((const char **)v5 + 7));
                if (v5[22] >= 1)
                {
                  uint64_t v20 = 0LL;
                  do
                    a2(a3, ", %s", *(const char **)(*((void *)v5 + 10) + 8 * v20++));
                  while (v20 < v5[22]);
                }

                uint64_t result = (int *)((uint64_t (*)(const char *, const char *))a2)(a3, ")\n");
                break;
              default:
                unsigned int v23 = v10;
                unsigned int v13 = a3;
                uint64_t v14 = "# %s value (type %d??)";
                goto LABEL_40;
            }
          }
        }
      }

      do
      {
        char v21 = *((_BYTE *)v5 + 130);
        v5 += 24;
      }

      while ((v21 & 0x10) != 0);
    }

    while (*(void *)v5);
  }

  return result;
}

    uint64_t v35 = "DHCP packet received with incorrect length\n";
    goto LABEL_104;
  }

  if (a3 <= 0x10E) {
    goto LABEL_41;
  }
  if (bswap32(*(_DWORD *)(a2 + 264)) != 1669485411) {
    goto LABEL_102;
  }
  if (*(_BYTE *)(a2 + 268) != 53 || *(_BYTE *)(a2 + 269) != 1 || *(_BYTE *)(a2 + 270) != 8) {
    goto LABEL_103;
  }
  int v17 = 0;
  int v18 = *(unsigned int *)(a2 + 40);
  uint64_t v19 = a3 - 271;
  if ((int)(a3 - 271) < 1)
  {
    char v21 = 0;
  }

  else
  {
    uint64_t v20 = *(unsigned __int8 *)(a2 + 271);
    char v21 = 0;
    if (v20 != 255)
    {
      char v21 = 0;
      int v17 = 0;
      __uint32_t v22 = (unsigned __int8 *)(a2 + 271);
      do
      {
        if (v20)
        {
          unsigned int v23 = v22[1];
          unint64_t v24 = v19 - 2;
          uint64_t v25 = __OFSUB__(v24, (_DWORD)v23);
          uint64_t v19 = v24 - v23;
          if ((v19 < 0) ^ v25 | (v19 == 0)) {
            goto LABEL_106;
          }
          __uint32_t v26 = v22 + 2;
          if (v20 == 55 && (_DWORD)v23)
          {
            int v27 = v26;
            char v28 = v23;
            do
            {
              uint64_t v30 = *v27++;
              unsigned int v29 = v30;
              char v31 = v30 == 15;
              if (qword_100047F58) {
                __darwin_ct_rune_t v32 = v29 == 249;
              }
              else {
                __darwin_ct_rune_t v32 = 0;
              }
              if (v32) {
                char v33 = 1;
              }
              else {
                char v33 = v21;
              }
              if (v31 && qword_100047F60 != 0) {
                int v17 = 1;
              }
              else {
                char v21 = v33;
              }
              --v28;
            }

            while (v28);
          }

          __uint32_t v22 = &v26[v23];
        }

        else
        {
          ++v22;
          --v19;
        }

        uint64_t v20 = *v22;
      }

      while (v20 != 255 && v19 > 0);
    }
  }

  if (!(v17 | v21)) {
    return;
  }
  outpacket_buf = 553649151;
  qword_100044134 = 0LL;
  pid_t v84 = *(_DWORD *)(a2 + 30);
  int v85 = *(_WORD *)(a2 + 34);
  int v86 = *(_OWORD *)(a2 + 214);
  BOOL v87 = *(_OWORD *)(a2 + 246);
  uint64_t v139 = *(_OWORD *)(a2 + 230);
  pid_t v140 = v87;
  BOOL v88 = *(_OWORD *)(a2 + 150);
  uint64_t v89 = *(_OWORD *)(a2 + 182);
  int v135 = *(_OWORD *)(a2 + 166);
  int v136 = v89;
  uint64_t v137 = *(_OWORD *)(a2 + 198);
  uint64_t v138 = v86;
  uint64_t v90 = *(_OWORD *)(a2 + 86);
  uint64_t v91 = *(_OWORD *)(a2 + 118);
  uint64_t v131 = *(_OWORD *)(a2 + 102);
  uint64_t v132 = v91;
  uint64_t v133 = *(_OWORD *)(a2 + 134);
  uint64_t v134 = v88;
  uint64_t v92 = *(_OWORD *)(a2 + 54);
  uint64_t v93 = *(_OWORD *)(a2 + 70);
  uint64_t v94 = *(_WORD *)(a2 + 262);
  *(_OWORD *)__s = *(_OWORD *)(a2 + 38);
  uint64_t v128 = v92;
  uint64_t v129 = v93;
  uint64_t v130 = v90;
  unk_1000441F6 = v138;
  unk_100044206 = v139;
  unk_100044216 = v140;
  unk_1000441B6 = v88;
  unk_1000441C6 = v135;
  unk_1000441D6 = v136;
  unk_1000441E6 = v137;
  unk_100044176 = v90;
  unk_100044186 = v131;
  unk_100044196 = v132;
  unk_1000441A6 = v133;
  *(_OWORD *)((char *)&dword_100044144 + 2) = *(_OWORD *)__s;
  unk_100044156 = v92;
  *(void *)&byte_100044128 = 0LL;
  *(void *)&word_100044120 = 0LL;
  dword_100044130 = 0;
  LODWORD(__stringp) = v84;
  WORD2(__stringp) = v85;
  uint64_t v141 = v94;
  word_10004413C = 258;
  *(_DWORD *)&byte_10004413E = v84;
  word_100044142 = v85;
  LOWORD(dword_100044144) = 0;
  word_100044226 = v94;
  unk_100044166 = v93;
  qword_100044228 = 0x3605013563538263LL;
  LOBYTE(word_10004423notify((uint64_t **)lcp_lowerdown_notify, 0) = 4;
  uint64_t v95 = ntohl(a4);
  *(_DWORD *)((char *)&word_100044230 + 1) = bswap32(v95);
  if (v17)
  {
    BOOL v96 = (void *)qword_100047F60;
    do
    {
      uint64_t v97 = v96;
      BOOL v96 = (void *)*v96;
    }

    while (v96);
    LOBYTE(word_100044235) = 15;
    uint64_t v98 = strlen((const char *)v97[2]);
    if ((v98 << 32) + 0x11B00000000LL > 0x5DF00000000LL)
    {
      uint64_t v35 = "Domain name too large for DHCP\n";
      goto LABEL_104;
    }

    uint64_t v99 = v98;
    uint64_t v100 = v98 << 32;
    HIBYTE(word_100044235) = v98;
    memcpy(&qword_100044237, (const void *)v97[2], (int)v98);
    uint64_t v101 = (__int16 *)((char *)&qword_100044237 + (v100 >> 32));
    uint64_t v102 = v99 + 283;
  }

  else
  {
    uint64_t v101 = &word_100044235;
    uint64_t v102 = 281;
  }

  if (!v21 || (uint64_t v103 = qword_100047F58) == 0)
  {
LABEL_142:
    *(_BYTE *)uint64_t v101 = -1;
    int v117 = (v102 + 1);
    else {
      int v118 = ((_BYTE)v102 + 1) & 3;
    }
    if (v117 <= 0x5DF)
    {
      uint64_t v25 = __OFSUB__(v118, 1);
      unsigned __int8 v119 = v118 - 1;
      if (v119 < 0 == v25)
      {
        else {
          int v120 = v119;
        }
        bzero((char *)v101 + 1, v120 + 1);
        int v117 = (v102 + v120 + 2);
      }
    }

    unsigned int v121 = ntohl(v18);
    sub_100029EA0(a1, v117, v95, 0x43u, v121, 68, v122, v123, v124);
    return;
  }

  v104 = 0;
  int v105 = 1;
  while (1)
  {
    while ((*(_WORD *)(v103 + 20) & 1) == 0)
    {
      uint64_t v103 = *(void *)v103;
      if (!v103)
      {
        if ((v105 & 1) != 0) {
          goto LABEL_142;
        }
LABEL_141:
        uint64_t v116 = (char *)v101 - (v104 + 1);
        *uint64_t v116 = v104;
        uint64_t v101 = (__int16 *)&v116[v104 + 1];
        v102 += v104 + 2;
        goto LABEL_142;
      }
    }

    if ((v105 & 1) != 0) {
      break;
    }
LABEL_125:
    int v106 = ntohl(*(unsigned int *)(v103 + 12));
    uint64_t v107 = ntohl(*(unsigned int *)(v103 + 8));
    uint64_t v108 = 32;
    if ((v106 & 1) == 0)
    {
      uint64_t v109 = v106;
      do
      {
        if (!--v108) {
          break;
        }
        uint64_t v110 = v109;
        v109 >>= 1;
      }

      while ((v110 & 2) == 0);
    }

    if ((v108 & 7) != 0) {
      uint64_t v111 = (v108 >> 3) + 1;
    }
    else {
      uint64_t v111 = v108 >> 3;
    }
    if ((v102 - 1499 + v111) < 0xFFFFFA20)
    {
      uint64_t v35 = "Static routes list too large DHCP\n";
      goto LABEL_104;
    }

    uint64_t v112 = v107 & v106;
    *(_BYTE *)uint64_t v101 = v108;
    *((_BYTE *)v101 + 1) = (v107 & v106) >> 24;
    *((_BYTE *)v101 + 2) = (v107 & v106) >> 16;
    *((_BYTE *)v101 + 3) = (unsigned __int16)(v107 & v106) >> 8;
    uint64_t v113 = (char *)v101 - (4 - v111);
    *((_BYTE *)v101 + 4) = v112;
    int v114 = ntohl(a5);
    int v105 = 0;
    uint64_t v101 = (__int16 *)(v113 + 9);
    *(_DWORD *)(v113 + 5) = bswap32(v114);
    v104 += v111 + 5;
    uint64_t v103 = *(void *)v103;
    if (!v103) {
      goto LABEL_141;
    }
  }

  if ((v102 - 1502) > 0xFFFFFA1F)
  {
    *v101++ = 249;
    goto LABEL_125;
  }

  uint64_t v35 = "No space for DHCP routes\n";
LABEL_104:
  warning(v35, v10, v11, v12, v13, v14, v15, v16, v124);
}

uint64_t int_option(const char *a1, _DWORD *a2)
{
  uint64_t result = sub_100014EF0(a1, &v4, 0);
  if ((_DWORD)result)
  {
    *a2 = v4;
    return 1LL;
  }

  return result;
}

uint64_t sub_100014EF0(const char *a1, _DWORD *a2, int a3)
{
  *a2 = strtoul(a1, &__endptr, a3);
  if (__endptr != a1) {
    return 1LL;
  }
  option_error("invalid numeric parameter '%s' for %s option", v4, v5, v6, v7, v8, v9, v10, (int)a1);
  return 0LL;
}

uint64_t options_from_controller()
{
  uid_t v0 = 0LL;
  int v1 = privileged_option;
  privileged_option = controlled;
  option_source = (uint64_t)"controller";
  option_priority = 2;
  while (1)
  {
    do
    {
      if (!getword((FILE *)controlfile, (uint64_t)&__size[1], &v25, (int)"controller"))
      {
LABEL_22:
        uint64_t v23 = 1LL;
        if (!v0) {
          goto LABEL_24;
        }
        goto LABEL_23;
      }
    }

    while (*(void *)&__size[1] == 0x534E4F4954504F5BLL && v27 == 93);
    if (__size[1] == 1347372379 && LOWORD(__size[2]) == 93) {
      goto LABEL_22;
    }
    uint64_t v4 = sub_100013850((const char *)&__size[1]);
    if (!v4)
    {
      option_error( "In controller file descriptor: unrecognized option '%s'",  v5,  v6,  v7,  v8,  v9,  v10,  v11,  (int)&__size[1]);
      goto LABEL_26;
    }

    uint64_t v12 = (uint64_t)v4;
    unsigned int v29 = 0LL;
    uint64_t v30 = 0LL;
    bzero(v28, 0x400uLL);
    int v18 = *(_DWORD *)(v12 + 8);
    if ((v18 | 2) != 2) {
      break;
    }
LABEL_13:
  }

  if ((*(_BYTE *)(v12 + 33) & 2) != 0)
  {
    char v21 = 0LL;
LABEL_19:
    if (v18 == 7)
    {
      size_t v22 = __size[0];
      uid_t v0 = malloc(__size[0]);
      fread(v0, v22, 1uLL, (FILE *)controlfile);
      uint64_t v30 = v0;
    }

    goto LABEL_13;
  }

  if (getword((FILE *)controlfile, (uint64_t)v28, &v25, (int)"controller"))
  {
    char v21 = v28;
    unsigned int v29 = v28;
    int v18 = *(_DWORD *)(v12 + 8);
    goto LABEL_19;
  }

  option_error( "In controller file descriptor: too few parameters for option '%s'",  v19,  v20,  v13,  v14,  v15,  v16,  v17,  (int)&__size[1]);
LABEL_26:
  uint64_t v23 = 0LL;
  if (v0) {
LABEL_23:
  }
    free(v0);
LABEL_24:
  privileged_option = v1;
  return v23;
}

uint64_t options_close()
{
  if (controlfile)
  {
    fclose((FILE *)controlfile);
    controlfile = 0LL;
    controlfd = -1;
  }

  uint64_t result = statusfd;
  if (statusfd != -1)
  {
    uint64_t result = close(statusfd);
    statusfd = -1;
  }

  controlled = 0;
  return result;
}

uint64_t sub_1000151B8(const char *a1, uint64_t a2, int a3)
{
  if ((*(_DWORD *)(a2 + 8) == 6) != a3) {
    return 0LL;
  }
  if (a3) {
    return (*(uint64_t (**)(const char *, void, void))(a2 + 16))(a1, 0LL, 0LL);
  }
  return strcmp(a1, *(const char **)a2) == 0;
}

uint64_t closeall()
{
  int v0 = getdtablesize();
  if (v0 >= 1)
  {
    unsigned int v1 = v0 + 1;
    do
    {
      close(v1 - 2);
      --v1;
    }

    while (v1 > 1);
  }

  open("/dev/null", 2, 0LL);
  dup(0);
  return dup(0);
}

uint64_t closeallfrom(int a1)
{
  uint64_t v2 = opendir("/dev/fd");
  if (v2)
  {
    uint64_t v3 = v2;
    int v4 = readdir_r(v2, &v10, &v9);
    uint64_t v5 = v9;
    if (v4) {
      BOOL v6 = 1;
    }
    else {
      BOOL v6 = v9 == 0LL;
    }
    if (!v6)
    {
      do
      {
        int v7 = atoi(v5->d_name);
        if (v7 >= a1 && v7 != v3->__dd_fd) {
          close(v7);
        }
        if (readdir_r(v3, &v10, &v9)) {
          break;
        }
        uint64_t v5 = v9;
      }

      while (v9);
    }

    return closedir(v3);
  }

  else
  {
  }

  return result;
}

uint64_t load_kext(uint64_t a1, int a2)
{
  pid_t v4 = fork();
  if (v4 < 0) {
    return 1LL;
  }
  pid_t v5 = v4;
  if (!v4)
  {
    closeall();
    if (a2) {
      execle("/sbin/kextload", "kextload", "-b", a1, 0LL, 0LL);
    }
    else {
      execle("/sbin/kextload", "kextload", a1, 0LL, 0LL);
    }
    exit(1);
  }

  uint64_t v6 = 1LL;
  while (waitpid(v5, 0LL, 0) < 0)
  {
    if (*__error() != 4) {
      return v6;
    }
  }

  return 0LL;
}

void sys_install( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (qword_100047978 != -1) {
    dispatch_once(&qword_100047978, &stru_100038B48);
  }
  if (byte_100047975)
  {
    notice("Committed PPP store on install command\n", a2, a3, a4, a5, a6, a7, a8, vars0);
    SCDynamicStoreSetMultiple((SCDynamicStoreRef)cfgCache, (CFDictionaryRef)publish_dict, 0LL, 0LL);
  }

void sys_uninstall( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (qword_100047978 != -1) {
    dispatch_once(&qword_100047978, &stru_100038B48);
  }
  if (byte_100047975)
  {
    notice("Received uninstall command\n", a2, a3, a4, a5, a6, a7, a8, v13);
    if (publish_dict)
    {
      CFIndex Count = CFDictionaryGetCount((CFDictionaryRef)publish_dict);
      if (Count >= 1)
      {
        CFIndex v9 = Count;
        dirent v10 = (const void **)CFAllocatorAllocate(kCFAllocatorDefault, 8 * Count, 0LL);
        if (v10)
        {
          uint64_t v11 = v10;
          CFDictionaryGetKeysAndValues((CFDictionaryRef)publish_dict, v10, 0LL);
          uint64_t v12 = CFArrayCreate(kCFAllocatorDefault, v11, v9, &kCFTypeArrayCallBacks);
          SCDynamicStoreSetMultiple((SCDynamicStoreRef)cfgCache, 0LL, v12, 0LL);
          if (v12) {
            CFRelease(v12);
          }
          CFAllocatorDeallocate(kCFAllocatorDefault, v11);
        }
      }
    }
  }

void *sys_install_options()
{
  return add_options((uint64_t)&sys_options);
}

BOOL sys_check_controller()
{
  if (qword_100047978 != -1) {
    dispatch_once(&qword_100047978, &stru_100038B48);
  }
  if (byte_100047975)
  {
    sys_log(5, "NetworkExtension is the controller");
    return 1LL;
  }

  else if (bootstrap_look_up(bootstrap_port, "com.apple.SystemConfiguration.PPPController-priv", &sp) {
         || sub_10002D314(sp, &v4, &v3))
  }
  {
    return 0LL;
  }

  else
  {
    audit_token_t atoken = v3;
    audit_token_to_au32(&atoken, 0LL, &euidp, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    return (v4 | euidp) == 0;
  }

void sys_log(int a1, char *a2, ...)
{
  if (qword_100047978 != -1) {
    dispatch_once(&qword_100047978, &stru_100038B48);
  }
  if (byte_100047975)
  {
    if (a1 == 6) {
      char v4 = 1;
    }
    else {
      char v4 = 2;
    }
    if (a1 == 3) {
      char v5 = 16;
    }
    else {
      char v5 = v4;
    }
    if (a1 >= 3) {
      os_log_type_t v6 = v5;
    }
    else {
      os_log_type_t v6 = OS_LOG_TYPE_FAULT;
    }
    int v7 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v7, v6))
    {
      uint64_t v8 = CFStringCreateWithCString(kCFAllocatorDefault, a2, 0x8000100u);
      if (v8)
      {
        CFIndex v9 = v8;
        CFStringRef v10 = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, 0LL, v8, va);
        if (v10)
        {
          CFStringRef v11 = v10;
          uint64_t v12 = (os_log_s *)ne_log_obj();
          if (os_log_type_enabled(v12, v6))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v11;
            _os_log_impl((void *)&_mh_execute_header, v12, v6, "%@", buf, 0xCu);
          }

          CFRelease(v11);
        }

        CFRelease(v9);
      }
    }
  }

  else
  {
    vsyslog(a1, a2, va);
  }

CFDataRef Unserialize(UInt8 *bytes, CFIndex length)
{
  uint64_t result = CFDataCreate(0LL, bytes, length);
  if (result)
  {
    audit_token_t v3 = result;
    CFPropertyListRef v4 = CFPropertyListCreateFromXMLData(0LL, result, 0LL, 0LL);
    CFRelease(v3);
    return (const __CFData *)v4;
  }

  return result;
}

void CopyControllerData()
{
  uint64_t v16 = 0LL;
  int v14 = 1001;
  if (!bootstrap_look_up(bootstrap_port, "com.apple.SystemConfiguration.PPPController-priv", &sp))
  {
    int v0 = sub_10002D104(sp, 0, &v16, &v15, &v14, &v13);
    if (v0 | v14)
    {
      uint64_t v8 = "cannot get private system options from controller\n";
    }

    else
    {
      audit_token_t atoken = v13;
      audit_token_to_au32(&atoken, 0LL, &euidp, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
      if (euidp)
      {
        uint64_t v8 = "cannot authenticate private system options from controller\n";
      }

      else
      {
        systemOptions = (uint64_t)Unserialize(v16, v15);
        int v9 = sub_10002D104(sp, 1, &v16, &v15, &v14, &v13);
        if (v9 | v14)
        {
          uint64_t v8 = "cannot get private user options from controller\n";
        }

        else
        {
          audit_token_t atoken = v13;
          audit_token_to_au32(&atoken, 0LL, &euidp, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
          if (!euidp)
          {
            userOptions = (uint64_t)Unserialize(v16, v15);
            return;
          }

          uint64_t v8 = "cannot authenticate private user options from controller\n";
        }
      }
    }

    error(v8, v1, v2, v3, v4, v5, v6, v7, tidp);
  }

void CopyServerData()
{
  int v0 = SCPreferencesCreate(0LL, @"pppd", @"com.apple.RemoteAccessServers.plist");
  if (!v0) {
    fatal("Cannot open servers plist\n", v1, v2, v3, v4, v5, v6, v7, v26);
  }
  uint64_t v8 = v0;
  Value = (const __CFDictionary *)SCPreferencesGetValue(v0, @"Servers");
  if (!Value) {
    fatal("No servers found in servers plist\n", v10, v11, v12, v13, v14, v15, v16, v26);
  }
  uint64_t v17 = CFDictionaryGetValue(Value, (const void *)serveridRef);
  systemOptions = (uint64_t)v17;
  if (!v17 || (CFTypeID v25 = CFGetTypeID(v17), v25 != CFDictionaryGetTypeID())) {
    fatal("Server ID '%s' not found in servers plist\n", v18, v19, v20, v21, v22, v23, v24, serverid);
  }
  CFRetain((CFTypeRef)systemOptions);
  CFRelease(v8);
}

BOOL sys_protocolsreadynotify( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  byte_1000476B8 = 1;
  dbglog("Received protocol dictionaries\n", a2, a3, a4, a5, a6, a7, a8, vars0);
  return sub_100015ABC(v8, v9, v10, v11, v12, v13, v14, v15);
}

BOOL sub_100015ABC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (demand) {
    return 0LL;
  }
  if (phase != 8 || byte_1000476B8 == 0) {
    return 0LL;
  }
  if (!publish_dict) {
    return 1LL;
  }
  if (qword_100047978 != -1) {
    dispatch_once(&qword_100047978, &stru_100038B48);
  }
  if (byte_100047975)
  {
    if (cfgCache)
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (Mutable)
      {
        uint64_t v11 = Mutable;
        CFTypeID v25 = &ifname;
        CFStringRef v12 = CFStringCreateWithFormat(0LL, 0LL, @"%s");
        if (v12)
        {
          CFStringRef v13 = v12;
          CFDictionarySetValue(v11, kSCPropInterfaceName, v12);
          CFRelease(v13);
        }

        NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity( 0LL,  kSCDynamicStoreDomainState,  (CFStringRef)serviceidRef,  kSCEntNetIPv4);
        if (NetworkServiceEntity)
        {
          uint64_t v15 = NetworkServiceEntity;
          if (!SCDynamicStoreSetValue((SCDynamicStoreRef)cfgCache, NetworkServiceEntity, v11))
          {
            int v16 = SCError();
            SCErrorString(v16);
            warning("SCDynamicStoreSetValue Ifname %s failed: %s\n", v17, v18, v19, v20, v21, v22, v23, (int)&ifname);
          }

          CFRelease(v15);
        }

        CFRelease(v11);
      }
    }

    sys_notify(266, 22, byte_100047858, a4, a5, a6, a7, a8, (int)v25);
    return 1LL;
  }

  notice("Committed PPP store\n", a2, a3, a4, a5, a6, a7, a8, (int)v25);
  return SCDynamicStoreSetMultiple((SCDynamicStoreRef)cfgCache, (CFDictionaryRef)publish_dict, 0LL, 0LL) != 0;
}

BOOL sys_acspdhcpreadynotify( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  byte_1000476B9 = 1;
  dbglog("Received acsp/dhcp dictionaries\n", a2, a3, a4, a5, a6, a7, a8, vars0);
  return sub_100015ABC(v8, v9, v10, v11, v12, v13, v14, v15);
}

double sys_init()
{
  if (debug) {
    setlogmask(255);
  }
  setsid();
  int v0 = sub_100016488();
  ppp_sockfd = v0;
  if (v0 < 0) {
    fatal("Couldn't open PF_PPP: %m", v1, v2, v3, v4, v5, v6, v7, v80);
  }
  int v8 = fcntl(v0, 3);
  if (v8 == -1 || (int v80 = v8 | 4, fcntl(ppp_sockfd, 4) == -1)) {
    warning("Couldn't set PF_PPP to nonblock: %m", v9, v10, v11, v12, v13, v14, v15, v80);
  }
  dword_1000476BC = socket(2, 2, 0);
  if (dword_1000476BC < 0)
  {
    uint64_t v39 = __error();
    fatal("Couldn't create IP socket: %m(%d)", v40, v41, v42, v43, v44, v45, v46, *v39);
  }

  uint64_t v16 = serviceid;
  if (!serviceid)
  {
    uint64_t v17 = CFUUIDCreate(0LL);
    uint64_t v18 = CFUUIDCreateString(0LL, v17);
    CFStringGetCString(v18, buffer, 100LL, 0x8000100u);
    serviceid = (uint64_t)strdup(buffer);
    if (!serviceid)
    {
      uint64_t v72 = __error();
      fatal("Couldn't allocate memory to create temporary service id: %m(%d)", v73, v74, v75, v76, v77, v78, v79, *v72);
    }

    CFRelease(v18);
    CFRelease(v17);
    uint64_t v16 = serviceid;
  }

  serviceidRef = (uint64_t)CFStringCreateWithFormat(0LL, 0LL, @"%s", v16);
  if (!serviceidRef)
  {
    uint64_t v47 = __error();
    fatal("Couldn't allocate memory to create service id reference: %m(%d)", v48, v49, v50, v51, v52, v53, v54, *v47);
  }

  if (controlled)
  {
    if (qword_100047978 != -1) {
      dispatch_once(&qword_100047978, &stru_100038B48);
    }
    if (byte_100047975)
    {
      if (qword_100047988 != -1) {
        dispatch_once(&qword_100047988, &stru_100038BB0);
      }
      uint64_t v19 = qword_100047980;
      if (qword_100047980)
      {
        uint64_t v81 = 0LL;
        uint64_t v82 = &v81;
        uint64_t v83 = 0x2000000000LL;
        uint64_t v84 = 0LL;
        uint64_t v20 = dispatch_semaphore_create(0LL);
        dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
        *(void *)buffer = _NSConcreteStackBlock;
        uint64_t v86 = 0x40000000LL;
        BOOL v87 = sub_10001C5B0;
        BOOL v88 = &unk_100038B70;
        uint64_t v89 = &v81;
        uint64_t v90 = v20;
        ne_session_get_info(v19, 3LL, global_queue, buffer);
        dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
        dispatch_release(v20);
        uint64_t v22 = (void *)v82[3];
        if (v22 && xpc_get_type(v22) == (xpc_type_t)&_xpc_type_dictionary)
        {
          if (xpc_dictionary_get_value((xpc_object_t)v82[3], "SessionLegacyServiceConfiguration")) {
            systemOptions = _CFXPCCreateCFObjectFromXPCObject();
          }
          if (xpc_dictionary_get_value((xpc_object_t)v82[3], "SessionLegacyUserConfiguration")) {
            userOptions = _CFXPCCreateCFObjectFromXPCObject();
          }
        }

        uint64_t v23 = (void *)v82[3];
        if (v23) {
          xpc_release(v23);
        }
        _Block_object_dispose(&v81, 8);
      }
    }

    else
    {
      CopyControllerData();
    }
  }

  cfgCache = (uint64_t)SCDynamicStoreCreate(0LL, @"pppd", 0LL, 0LL);
  if (!cfgCache)
  {
    int v55 = SCError();
    int v56 = SCErrorString(v55);
    fatal("SCDynamicStoreCreate failed: %s", v57, v58, v59, v60, v61, v62, v63, v56);
  }

  if (nodetach)
  {
    pid_t v24 = getpid();
    publish_dictnumentry(kSCEntNetPPP, @"pid", v24);
  }

  publish_dictnumentry(kSCEntNetPPP, kSCPropNetPPPStatus, phase);
  if (serverid)
  {
    serveridRef = (uint64_t)CFStringCreateWithFormat(0LL, 0LL, @"%s", serverid);
    if (!serveridRef)
    {
      uint64_t v64 = __error();
      fatal("Couldn't allocate memory to create server id reference: %m(%d)", v65, v66, v67, v68, v69, v70, v71, *v64);
    }

    CopyServerData();
    publish_dictstrentry(kSCEntNetInterface, @"ServerID", (const char *)serverid, 0);
  }

  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  publish_dict = (uint64_t)Mutable;
  if (!controlled && Mutable)
  {
    rls = (uint64_t)SCDynamicStoreCreateRunLoopSource(kCFAllocatorDefault, (SCDynamicStoreRef)cfgCache, 0LL);
    if (rls)
    {
      Current = CFRunLoopGetCurrent();
      CFRunLoopAddSource(Current, (CFRunLoopSourceRef)rls, kCFRunLoopDefaultMode);
    }

    else
    {
      int v27 = SCError();
      int v28 = SCErrorString(v27);
      notice("SCDynamicStoreCreateRunLoopSource FAILED %s", v29, v30, v31, v32, v33, v34, v35, v28);
    }

    SCDynamicStoreSetDisconnectCallBack(cfgCache, sub_100016654);
  }

  add_notifier(&phasechange, (uint64_t)sub_10001674C, 0LL);
  add_notifier(&exitnotify, (uint64_t)sub_100016914, 0LL);
  if (statusfd != -1)
  {
    add_notifier(&ip_up_notify, (uint64_t)sub_1000169A8, 10LL);
    add_notifier(&ip_down_notify, (uint64_t)sub_1000169A8, 11LL);
    add_notifier(&lcp_up_notify, (uint64_t)sub_1000169A8, 8LL);
    add_notifier(&lcp_down_notify, (uint64_t)sub_1000169A8, 9LL);
    add_notifier(&lcp_lowerup_notify, (uint64_t)sub_1000169A8, 6LL);
    add_notifier(&lcp_lowerdown_notify, (uint64_t)sub_1000169A8, 7LL);
    add_notifier(&auth_start_notify, (uint64_t)sub_1000169A8, 12LL);
    add_notifier(&auth_withpeer_fail_notify, (uint64_t)sub_1000169A8, 13LL);
    add_notifier(&auth_withpeer_success_notify, (uint64_t)sub_1000169A8, 14LL);
    add_notifier(&connectscript_started_notify, (uint64_t)sub_1000169A8, 2LL);
    add_notifier(&connectscript_finished_notify, (uint64_t)sub_1000169A8, 3LL);
    add_notifier(&terminalscript_started_notify, (uint64_t)sub_1000169A8, 4LL);
    add_notifier(&terminalscript_finished_notify, (uint64_t)sub_1000169A8, 5LL);
    add_notifier(&connect_started_notify, (uint64_t)sub_1000169A8, 15LL);
    add_notifier(&connect_success_notify, (uint64_t)sub_1000169A8, 17LL);
    add_notifier(&connect_fail_notify, (uint64_t)sub_1000169A8, 16LL);
    add_notifier(&disconnect_started_notify, (uint64_t)sub_1000169A8, 18LL);
    add_notifier(&disconnect_done_notify, (uint64_t)sub_1000169A8, 19LL);
    add_notifier(&stop_notify, (uint64_t)sub_1000169A8, 20LL);
    add_notifier(&cont_notify, (uint64_t)sub_1000169A8, 21LL);
  }

  add_notifier(&lcp_timeremaining_notify, (uint64_t)sub_1000169C4, 0LL);
  add_notifier(&auth_peer_success_notify, (uint64_t)sub_100016A84, 0LL);
  add_notifier(&protocolsready_notifier, (uint64_t)sys_protocolsreadynotify, 0LL);
  add_notifier(&acspdhcpready_notifier, (uint64_t)sys_acspdhcpreadynotify, 0LL);
  if (!mach_timebase_info((mach_timebase_info_t)buffer))
  {
    LODWORD(v36) = *(_DWORD *)buffer;
    LODWORD(v37) = *(_DWORD *)&buffer[4];
    *(double *)&timeScaleMicroSeconds = (double)v36 / (double)v37 / 1000.0;
    *(double *)&timeScaleSeconds = *(double *)&timeScaleMicroSeconds / 1000000.0;
  }

  double result = 0.0;
  xmmword_100047720 = 0u;
  unk_100047730 = 0u;
  xmmword_100047700 = 0u;
  unk_100047710 = 0u;
  xmmword_1000476E0 = 0u;
  unk_1000476F0 = 0u;
  xmmword_1000476C0 = 0u;
  *(_OWORD *)algn_1000476D0 = 0u;
  xmmword_100047740 = 0u;
  *(_OWORD *)algn_100047750 = 0u;
  xmmword_100047760 = 0u;
  unk_100047770 = 0u;
  xmmword_100047780 = 0u;
  unk_100047790 = 0u;
  xmmword_1000477A0 = 0u;
  unk_1000477B0 = 0u;
  dword_1000477C0 = 0;
  return result;
}

uint64_t sub_100016488()
{
  uint64_t v0 = socket(34, 3, 1);
  if ((v0 & 0x80000000) != 0)
  {
    error("Couldn't open PF_PPP: %m", v1, v2, v3, v4, v5, v6, v7, v17);
    return 0xFFFFFFFFLL;
  }

  uint64_t v8 = v0;
  *(void *)&v18.sa_len = 74248LL;
  if (connect(v0, &v18, 8u) < 0)
  {
    error("Couldn't connect to PF_PPP: %m", v9, v10, v11, v12, v13, v14, v15, v17);
    close(v8);
    return 0xFFFFFFFFLL;
  }

  return v8;
}

uint64_t publish_dictnumentry(CFStringRef entity, const void *a2, int a3)
{
  int valuePtr = a3;
  CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity( 0LL,  kSCDynamicStoreDomainState,  (CFStringRef)serviceidRef,  entity);
  if (!NetworkServiceEntity) {
    return 12LL;
  }
  uint64_t v5 = NetworkServiceEntity;
  CFNumberRef v6 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
  if (v6)
  {
    CFNumberRef v7 = v6;
    publish_keyentry(v5, a2, v6);
    CFRelease(v7);
    uint64_t v8 = 0LL;
  }

  else
  {
    uint64_t v8 = 12LL;
  }

  CFRelease(v5);
  return v8;
}

uint64_t publish_dictstrentry(CFStringRef entity, const void *a2, const char *a3, CFStringEncoding a4)
{
  CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity( 0LL,  kSCDynamicStoreDomainState,  (CFStringRef)serviceidRef,  entity);
  if (!NetworkServiceEntity) {
    return 12LL;
  }
  uint64_t v8 = NetworkServiceEntity;
  CFStringRef v9 = CFStringCreateWithCString(0LL, a3, a4);
  if (v9)
  {
    CFStringRef v10 = v9;
    publish_keyentry(v8, a2, v9);
    CFRelease(v10);
    uint64_t v11 = 0LL;
  }

  else
  {
    uint64_t v11 = 12LL;
  }

  CFRelease(v8);
  return v11;
}

void sub_100016654( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (publish_dict)
  {
    CFIndex Count = CFDictionaryGetCount((CFDictionaryRef)publish_dict);
    if (Count)
    {
      int v9 = Count;
      CFRelease((CFTypeRef)cfgCache);
      cfgCache = (uint64_t)SCDynamicStoreCreate(0LL, @"pppd", 0LL, 0LL);
      if (!cfgCache)
      {
        int v34 = SCError();
        int v35 = SCErrorString(v34);
        fatal("republish_dict SCDynamicStoreCreate failed: %s", v36, v37, v38, v39, v40, v41, v42, v35);
      }

      dbglog("republish_dict: processing %d keys", v10, v11, v12, v13, v14, v15, v16, v9);
      if (demand)
      {
        if (publish_dict) {
          SCDynamicStoreSetMultiple((SCDynamicStoreRef)cfgCache, (CFDictionaryRef)publish_dict, 0LL, 0LL);
        }
      }

      else if (!sub_100015ABC(v17, v18, v19, v20, v21, v22, v23, v24))
      {
        int v25 = SCError();
        int v26 = SCErrorString(v25);
        warning("republish_dict SCDynamicStoreSetMultiple failed key: %s\n", v27, v28, v29, v30, v31, v32, v33, v26);
      }
    }
  }

void sub_10001674C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  switch(a2)
  {
    case 0LL:
    case 3LL:
    case 11LL:
      int v15 = *(_DWORD *)status;
      int v16 = 1;
      goto LABEL_7;
    case 2LL:
      unpublish_dictentry(kSCEntNetPPP, kSCPropNetPPPRetryConnectTime);
      goto LABEL_10;
    case 4LL:
      dword_100047990 = (*(double *)&timeScaleSeconds * (double)mach_absolute_time());
      publish_dictnumentry(kSCEntNetPPP, kSCPropNetPPPConnectTime, dword_100047990);
      if (!maxconnect) {
        goto LABEL_10;
      }
      CFStringRef v17 = kSCPropNetPPPDisconnectTime;
      int v18 = dword_100047990 + maxconnect;
      uint64_t v19 = kSCEntNetPPP;
LABEL_9:
      publish_dictnumentry(v19, v17, v18);
LABEL_10:
      if (phase) {
        sys_notify(268, phase, ifunit, v10, v11, v12, v13, v14, a9);
      }
      return;
    case 10LL:
      unpublish_dictentry(kSCEntNetPPP, @"AuthPeerName");
      unpublish_dictentry(kSCEntNetPPP, kSCPropNetPPPCommRemoteAddress);
      unpublish_dictentry(kSCEntNetPPP, kSCPropNetPPPConnectTime);
      unpublish_dictentry(kSCEntNetPPP, kSCPropNetPPPDisconnectTime);
      int v16 = 23;
      int v15 = 0;
LABEL_7:
      sys_notify(266, v16, v15, v10, v11, v12, v13, v14, v21);
      goto LABEL_10;
    case 13LL:
      double v20 = (double)redialtimer;
      int v18 = (int)(v20 + (double)mach_absolute_time() * *(double *)&timeScaleSeconds);
      uint64_t v19 = kSCEntNetPPP;
      CFStringRef v17 = kSCPropNetPPPRetryConnectTime;
      goto LABEL_9;
    default:
      goto LABEL_10;
  }

void sub_100016914(uint64_t a1, int a2)
{
  if (cfgCache)
  {
    CFRelease((CFTypeRef)cfgCache);
    cfgCache = 0LL;
  }

  if (publish_dict)
  {
    CFRelease((CFTypeRef)publish_dict);
    publish_dict = 0LL;
  }

void sub_1000169A8( uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  if (a1 == 16) {
    int v9 = 8;
  }
  else {
    int v9 = a2;
  }
  sys_notify(266, a1, v9, a4, a5, a6, a7, a8, a9);
}

uint64_t sub_1000169C4(uint64_t a1, _DWORD *a2)
{
  uint64_t v3 = mach_absolute_time();
  if (*a2 != -1)
  {
    unsigned int v4 = *a2 + (*(double *)&timeScaleSeconds * (double)v3);
    if (maxconnect)
    {
      if (v4 >= dword_100047990 + maxconnect) {
        unsigned int v4 = dword_100047990 + maxconnect;
      }
    }

    if (!v4) {
      return unpublish_dictentry(kSCEntNetPPP, kSCPropNetPPPDisconnectTime);
    }
    return publish_dictnumentry(kSCEntNetPPP, kSCPropNetPPPDisconnectTime, v4);
  }

  if (maxconnect)
  {
    unsigned int v4 = dword_100047990 + maxconnect;
    if (dword_100047990 + maxconnect) {
      return publish_dictnumentry(kSCEntNetPPP, kSCPropNetPPPDisconnectTime, v4);
    }
  }

  return unpublish_dictentry(kSCEntNetPPP, kSCPropNetPPPDisconnectTime);
}

uint64_t sub_100016A84(uint64_t a1, uint64_t a2)
{
  return publish_dictstrentry(kSCEntNetPPP, @"AuthPeerName", *(const char **)(a2 + 8), 0x8000100u);
}

uint64_t sys_cleanup()
{
  if (controlled) {
    BOOL v0 = 1;
  }
  else {
    BOOL v0 = rls == 0;
  }
  if (!v0)
  {
    Current = CFRunLoopGetCurrent();
    CFRunLoopRemoveSource(Current, (CFRunLoopSourceRef)rls, kCFRunLoopDefaultMode);
    CFRunLoopSourceInvalidate((CFRunLoopSourceRef)rls);
    CFRelease((CFTypeRef)rls);
    rls = 0LL;
  }

  uint64_t result = cifroute();
  if (byte_1000477C4 == 1)
  {
    __strlcpy_chk(v3, &ifname, 16LL, 16LL);
    uint64_t result = ioctl(dword_1000476BC, 0xC0206911uLL, v3);
    if ((result & 0x80000000) == 0 && (v4 & 1) != 0)
    {
      v4 &= ~1u;
      uint64_t result = ioctl(dword_1000476BC, 0x80206910uLL, v3);
    }
  }

  if (dword_1000477C8) {
    uint64_t result = cifaddr(result, dword_1000477C8, dword_1000477CC);
  }
  if (dword_1000477D0) {
    return cifproxyarp();
  }
  return result;
}

uint64_t cifroute()
{
  if (addifroute) {
    BOOL v0 = dword_100047848 == 0;
  }
  else {
    BOOL v0 = 1;
  }
  if (!v0)
  {
    route_interface(2, dword_100047840, dword_100047844, 23, &ifname, 0);
    dword_100047848 = 0;
  }

  return 1LL;
}

uint64_t cifaddr(uint64_t a1, int a2, int a3)
{
  dword_1000477C8 = 0;
  __strlcpy_chk(v13, &ifname, 16LL, 16LL);
  uint64_t v16 = 0LL;
  int v14 = 528;
  int v15 = a2;
  uint64_t v19 = 0LL;
  int v17 = 528;
  int v18 = a3;
  uint64_t v20 = 0LL;
  uint64_t v21 = 0LL;
  if (ioctl(dword_1000476BC, 0x80206919uLL) < 0)
  {
    if (*__error() != 49) {
      warning("Couldn't delete interface address: %m", v6, v7, v8, v9, v10, v11, v12, (int)v13);
    }
    return 0LL;
  }

  else
  {
    unpublish_dict(kSCEntNetIPv4);
    return 1LL;
  }

uint64_t cifdefaultroute()
{
  byte_100047858 = 0;
  ppp_create_ipv6_dummy_primary(1);
  return unpublish_dictentry(kSCEntNetIPv4, kSCPropNetOverridePrimary);
}

uint64_t cifproxyarp()
{
  if (byte_100047960 == 1)
  {
    byte_100047960 = 0;
    BYTE3(xmmword_10004785C) = 2;
    dword_100047870 = ++dword_10004795C;
    int v0 = socket(17, 3, 17);
    if (v0 < 0)
    {
      error("Couldn't delete proxy arp entry: socket: %m", v1, v2, v3, v4, v5, v6, v7, v17);
    }

    else
    {
      int v8 = v0;
      if ((write(v0, &xmmword_10004785C, (unsigned __int16)xmmword_10004785C) & 0x8000000000000000LL) == 0)
      {
        close(v8);
        dword_1000477D0 = 0;
        return 1LL;
      }

      error("Couldn't delete proxy arp entry: %m", v9, v10, v11, v12, v13, v14, v15, v17);
      close(v8);
    }
  }

  return 0LL;
}

void sys_runloop()
{
  if (controlled) {
    BOOL v0 = 1;
  }
  else {
    BOOL v0 = rls == 0;
  }
  if (!v0)
  {
    if (kill_link)
    {
      Current = CFRunLoopGetCurrent();
      CFRunLoopStop(Current);
    }

    else
    {
      CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.0, 1u);
    }
  }

void set_network_signature( char *__s, const char *a2, const char *a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  if (qword_1000477D8)
  {
    free((void *)qword_1000477D8);
    qword_1000477D8 = 0LL;
  }

  if (__s)
  {
    int v13 = strlen(__s);
    int v14 = strlen(a2) + v13 + 1;
    if (!a3) {
      goto LABEL_9;
    }
  }

  else
  {
    int v14 = 0;
    if (!a3) {
      goto LABEL_9;
    }
  }

  int v15 = strlen(a3);
  int v16 = strlen(a4) + v15;
  if (__s) {
    int v17 = 2;
  }
  else {
    int v17 = 1;
  }
  v14 += v17 + v16;
LABEL_9:
  if (!v14) {
    return;
  }
  size_t v18 = v14 + 1;
  uint64_t v19 = (char *)malloc(v18);
  qword_1000477D8 = (uint64_t)v19;
  if (!v19)
  {
    warning("no memory to create network signature", v20, v21, v22, v23, v24, v25, v26, a9);
    return;
  }

  *uint64_t v19 = 0;
  if (__s)
  {
    strlcat(v19, __s, v18);
    strlcat((char *)qword_1000477D8, "=", v18);
    strlcat((char *)qword_1000477D8, a2, v18);
    if (!a3) {
      return;
    }
    strlcat((char *)qword_1000477D8, ";", v18);
    uint64_t v19 = (char *)qword_1000477D8;
  }

  else if (!a3)
  {
    return;
  }

  strlcat(v19, a3, v18);
  strlcat((char *)qword_1000477D8, "=", v18);
  strlcat((char *)qword_1000477D8, a4, v18);
}

CFStringRef set_server_peer(in_addr_t a1)
{
  if (qword_1000477E0)
  {
    CFRelease((CFTypeRef)qword_1000477E0);
    qword_1000477E0 = 0LL;
  }

  v2.s_addr = a1;
  uint64_t v3 = inet_ntoa(v2);
  CFStringRef result = CFStringCreateWithCString(0LL, v3, 0x600u);
  qword_1000477E0 = (uint64_t)result;
  return result;
}

uint64_t sys_close()
{
  if (dword_1000476BC != -1)
  {
    close(dword_1000476BC);
    dword_1000476BC = -1;
  }

  uint64_t result = ppp_sockfd;
  if (ppp_sockfd != -1)
  {
    uint64_t result = close(ppp_sockfd);
    ppp_sockfd = -1;
  }

  return result;
}

void sys_notify( __int16 a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  if (statusfd != -1)
  {
    uint64_t v12 = (const void *)serviceid;
    size_t v13 = strlen((const char *)serviceid);
    int v14 = v13;
    size_t v15 = (uint64_t)((v13 << 32) + 0x1C00000000LL) >> 32;
    int v16 = malloc(v15);
    if (v16)
    {
      uint64_t v24 = v16;
      bzero(v16, v15);
      v24[1] = a1;
      *v24 |= 0x8000u;
      *((_DWORD *)v24 + 3) = v14;
      *((_DWORD *)v24 + 4) = 8;
      memmove(v24 + 10, v12, v14);
      uint64_t v25 = (_DWORD *)((char *)v24 + v14 + 20);
      *uint64_t v25 = a2;
      v25[1] = a3;
      if (write(statusfd, v24, v15) != v15) {
        warning("can't talk to PPPController : %m", v26, v27, v28, v29, v30, v31, v32, v33);
      }
      free(v24);
    }

    else
    {
      warning("no memory to send event to PPPController", v17, v18, v19, v20, v21, v22, v23, a9);
    }
  }

void sys_statusnotify( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
}

uint64_t sys_check_options( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (crtscts != 2) {
    return 1LL;
  }
  warning("DTR/CTS flow control is not supported on this system", a2, a3, a4, a5, a6, a7, a8, vars0);
  return 0LL;
}

uint64_t ppp_available()
{
  no_ppp_msg[0] = "Mac OS X lacks kernel support for PPP.  \n"
                  "To include PPP support in the kernel, please follow \n"
                  "the steps detailed in the README.MacOSX file.\n";
  int v0 = socket(34, 3, 1);
  if (v0 < 0)
  {
    if (noload) {
      return 0LL;
    }
    int v0 = socket(34, 3, 1);
    if (v0 < 0) {
      return 0LL;
    }
  }

  close(v0);
  return 1LL;
}

uint64_t tty_establish_ppp(int a1)
{
  if (sync_serial) {
    int v2 = 14;
  }
  else {
    int v2 = 5;
  }
  dword_100041290 = v2;
  if (ioctl(a1, 0x8004741BuLL, &dword_100041290) < 0 && *__error() != 5)
  {
    size_t v13 = "Couldn't set tty to PPP discipline: %m";
    goto LABEL_12;
  }

  uint64_t v10 = generic_establish_ppp(a1, 0LL);
  if ((_DWORD)v10 == -1)
  {
    size_t v15 = &unk_1000477E8;
    if ((ioctl(a1, 0x8004741BuLL) & 0x80000000) == 0 || *__error() == 5) {
      return 0xFFFFFFFFLL;
    }
    size_t v13 = "ioctl(TIOCSETD, TTYDISC): %m";
LABEL_12:
    error(v13, v3, v4, v5, v6, v7, v8, v9, (int)v15);
    return 0xFFFFFFFFLL;
  }

  uint64_t v11 = v10;
  int v12 = sub_100017630(dword_100041294);
  sub_1000175C8(v11, v12 & 0xF0FFFFFF);
  return v11;
}

uint64_t generic_establish_ppp(int a1, uint64_t a2)
{
  int v42 = 0;
  uint64_t v39 = &v42;
  if (ioctl(a1, 0x40047437uLL) == -1)
  {
    uint64_t v37 = "Couldn't get link number: %m";
LABEL_19:
    error(v37, v3, v4, v5, v6, v7, v8, v9, (int)v39);
    return 0xFFFFFFFFLL;
  }

  dbglog("using link %d", v3, v4, v5, v6, v7, v8, v9, v42);
  int v10 = sub_100016488();
  if (v10 < 0)
  {
    uint64_t v37 = "Couldn't reopen PF_PPP: %m";
    goto LABEL_19;
  }

  int v11 = v10;
  uint64_t v40 = &v42;
  if (ioctl(v10, 0x80047438uLL) < 0)
  {
    error("Couldn't attach to the ppp link %d: %m", v12, v13, v14, v15, v16, v17, v18, v42);
  }

  else
  {
    int v19 = fcntl(v11, 3);
    if (v19 == -1 || (LODWORD(v4notify((uint64_t **)lcp_lowerdown_notify, 0) = v19 | 4, fcntl(v11, 4) == -1)) {
      warning("Couldn't set ppp socket link to nonblock: %m", v20, v21, v22, v23, v24, v25, v26, (int)v40);
    }
    dword_100041294 = v11;
    if (looped || (ifunit = -1, multilink) || (sub_100017820() & 0x80000000) == 0)
    {
      if (a2 && (int v41 = a2, ioctl(ppp_sockfd, 0x80107434uLL) < 0))
      {
        uint64_t v38 = "Couldn't set the delegate interface: %m";
      }

      else
      {
        if (looped)
        {
          int v34 = ppp_sockfd;
          int v35 = sub_100017630(ppp_sockfd);
          sub_1000175C8(v34, v35 & 0xFFFFFDFF);
          looped = 0;
        }

        if (multilink || (add_fd(ppp_sockfd), (ioctl(v11, 0x8004743AuLL, &ifunit) & 0x80000000) == 0))
        {
          sub_1000179B8(kdebugflag);
          return dword_100041294;
        }

        int v41 = ifunit;
        uint64_t v38 = "Couldn't attach to PPP unit %d: %m";
      }

      error(v38, v27, v28, v29, v30, v31, v32, v33, v41);
    }
  }

  close(v11);
  return 0xFFFFFFFFLL;
}

int *sub_1000175C8(int a1, int a2)
{
  int v11 = a2;
  uint64_t result = (int *)ioctl(a1, 0x80047459uLL, &v11);
  if ((result & 0x80000000) != 0)
  {
    uint64_t result = __error();
    if (*result != 5)
    {
      int v3 = v11;
      __error();
      fatal("ioctl(PPPIOCSFLAGS, %x): %m", v4, v5, v6, v7, v8, v9, v10, v3);
    }
  }

  return result;
}

uint64_t sub_100017630(int a1)
{
  if ((ioctl(a1, 0x4004745AuLL) & 0x80000000) == 0) {
    return v9;
  }
  if (*__error() != 5) {
    fatal("ioctl(PPPIOCGFLAGS): %m", v2, v3, v4, v5, v6, v7, v8, (int)&v9);
  }
  return 0LL;
}

void tty_disestablish_ppp(int a1)
{
  if (!hungup)
  {
    if (ioctl(a1, 0x8004741BuLL) < 0 && *__error() != 5) {
      error("ioctl(TIOCSETD, TTYDISC): %m", v2, v3, v4, v5, v6, v7, v8, (int)&unk_1000477E8);
    }
    if (ioctl(a1, 0x2000740EuLL, 0LL) < 0 && *__error() != 5)
    {
      unsigned int v9 = __error();
      warning("ioctl(TIOCNXCL): %m(%d)", v10, v11, v12, v13, v14, v15, v16, *v9);
    }
  }

  generic_disestablish_ppp();
}

void generic_disestablish_ppp()
{
  dword_100041294 = -1;
  if (demand)
  {
    looped = 1;
    int v0 = ppp_sockfd;
    int v1 = sub_100017630(ppp_sockfd);
    sub_1000175C8(v0, v1 | 0x200);
  }

  else
  {
    unpublish_dictentry(kSCEntNetPPP, kSCPropInterfaceName);
    if ((ifunit & 0x80000000) == 0 && ioctl(ppp_sockfd, 0x8004743CuLL, v9) < 0) {
      error("Couldn't release PPP unit ppp_sockfd %d: %m", v2, v3, v4, v5, v6, v7, v8, ppp_sockfd);
    }
  }

  if (!multilink) {
    remove_fd(ppp_sockfd);
  }
}

uint64_t sub_100017820()
{
  ifunit = req_unit;
  uint64_t v7 = ioctl(ppp_sockfd, 0xC004743EuLL);
  if ((v7 & 0x80000000) != 0 && (req_unit & 0x80000000) == 0)
  {
    if (*__error() != 17)
    {
LABEL_7:
      error("Couldn't create new ppp unit: %m", v0, v1, v2, v3, v4, v5, v6, (int)&ifunit);
      return v7;
    }

    warning("Couldn't allocate PPP unit %d as it is already in use", v0, v1, v2, v3, v4, v5, v6, (int)&ifunit);
    ifunit = -1;
    uint64_t v7 = ioctl(ppp_sockfd, 0xC004743EuLL);
  }

  if ((v7 & 0x80000000) != 0) {
    goto LABEL_7;
  }
  slprintf((int)v9, 32, "%s%d");
  publish_dictstrentry(kSCEntNetPPP, kSCPropInterfaceName, v9, 0);
  return v7;
}

uint64_t add_fd(int a1)
{
  uint64_t result = __darwin_check_fd_set_overflow(a1, &xmmword_1000476C0, 0);
  if ((_DWORD)result) {
    *(_DWORD *)((char *)&xmmword_1000476C0 + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << a1;
  }
  if (dword_1000477C0 < a1) {
    dword_1000477C0 = a1;
  }
  return result;
}

void sub_1000179B8(int a1)
{
  int v8 = a1;
  if ((ifunit & 0x80000000) == 0 && ioctl(ppp_sockfd, 0x80047440uLL) < 0 && *__error() != 5) {
    error("ioctl(PPPIOCSDEBUG): %m", v1, v2, v3, v4, v5, v6, v7, (int)&v8);
  }
}

uint64_t unpublish_dictentry(CFStringRef entity, const void *a2)
{
  CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity( 0LL,  kSCDynamicStoreDomainState,  (CFStringRef)serviceidRef,  entity);
  if (!NetworkServiceEntity) {
    return 12LL;
  }
  uint64_t v4 = NetworkServiceEntity;
  unpublish_keyentry(NetworkServiceEntity, a2);
  CFRelease(v4);
  return 0LL;
}

uint64_t remove_fd(int a1)
{
  uint64_t result = __darwin_check_fd_set_overflow(a1, &xmmword_1000476C0, 0);
  if ((_DWORD)result) {
    *(_DWORD *)((char *)&xmmword_1000476C0 + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) &= ~(1 << a1);
  }
  return result;
}

void clean_check()
{
  if (!hungup && (dword_100041294 & 0x80000000) == 0 && !ioctl(dword_100041294, 0x4004745AuLL))
  {
    unsigned int v7 = ((~v16 & 0xF000000u) - 0x1000000) >> 24;
    if (v7 <= 7 && ((0x8Bu >> v7) & 1) != 0)
    {
      int v8 = off_100038BD0[(char)v7];
      warning("Serial link is not 8-bit clean:", v0, v1, v2, v3, v4, v5, v6, (int)&v16);
      warning("All received characters had %s", v9, v10, v11, v12, v13, v14, v15, (int)v8);
    }
  }

void set_up_tty(int a1, int a2)
{
  LODWORD(v34) = 0;
  if (ioctl(a1, 0x20007461uLL) == -1) {
    error("set_up_tty, can't set controlling terminal: %m", v4, v5, v6, v7, v8, v9, v10, 0);
  }
  if (tcgetattr(a1, &v35) < 0)
  {
    error("tcgetattr: %m", v11, v12, v13, v14, v15, v16, v17, (int)v34);
  }

  else
  {
    if ((byte_1000477EC & 1) == 0)
    {
      *(termios *)byte_1000477F0 = v35;
      int v34 = &unk_100047838;
      ioctl(a1, 0x40087468uLL);
    }

    tcflag_t v18 = v35.c_cflag & 0xFFFFFFFFFFFF68FFLL;
    if (a2 || crtscts < 1)
    {
      if (crtscts < 0) {
        tcflag_t v18 = v35.c_cflag & 0xFFFFFFFFFFFC68FFLL;
      }
    }

    else if (crtscts != 2)
    {
      tcflag_t v18 = v35.c_cflag & 0xFFFFFFFFFFFC68FFLL | 0x30000;
    }

    v35.c_cflag = v18 | 0x4B00;
    if (a2 || !modem) {
      v35.c_cflag = v18 | 0xCB00;
    }
    *(_OWORD *)&v35.c_iflag = xmmword_100037650;
    v35.c_lflag = 0LL;
    *(_WORD *)&v35.c_cc[16] = 1;
    if (crtscts == -2)
    {
      v35.c_iflag = 1541LL;
      *(_WORD *)&v35.c_cc[12] = 4881;
    }

    if (inspeed)
    {
      cfsetospeed(&v35, inspeed);
      cfsetispeed(&v35, inspeed);
      int v19 = inspeed;
    }

    else
    {
      int v19 = cfgetospeed(&v35);
      inspeed = v19;
      if (!v19) {
        fatal("Baud rate for %s is 0; need explicit baud rate", v20, v21, v22, v23, v24, v25, v26, (int)&devnam);
      }
    }

    baud_rate = v19;
    if (tcsetattr(a1, 2, &v35) < 0) {
      fatal("tcsetattr: %m", v27, v28, v29, v30, v31, v32, v33, (int)v34);
    }
    byte_1000477EC = 1;
  }

void set_up_tty_local(int a1, int a2)
{
  if (tcgetattr(a1, &v19) < 0)
  {
    error("tcgetattr: %m", v4, v5, v6, v7, v8, v9, v10, v19.c_iflag);
  }

  else
  {
    *(_WORD *)&v19.c_cc[16] = 1;
    tcflag_t c_cflag = v19.c_cflag;
    v19.c_cflag &= ~0x8000uLL;
    if (a2 || !modem) {
      v19.tcflag_t c_cflag = c_cflag | 0x8000;
    }
    if (tcsetattr(a1, 0, &v19) < 0) {
      fatal("tcsetattr: %m", v12, v13, v14, v15, v16, v17, v18, v19.c_iflag);
    }
  }

uint64_t restore_tty(uint64_t result)
{
  if (byte_1000477EC == 1)
  {
    int v1 = result;
    if (!default_device) {
      *(void *)&byte_1000477F0[24] &= 0xFFFFFFFFFFFFFFE7LL;
    }
    if (!hungup)
    {
      if (tcsetattr(result, 2, (const termios *)byte_1000477F0) < 0 && *__error() != 6) {
        warning("tcsetattr: %m", v2, v3, v4, v5, v6, v7, v8, v9);
      }
      uint64_t result = ioctl(v1, 0x80087467uLL, &unk_100047838);
    }

    byte_1000477EC = 0;
  }

  return result;
}

uint64_t setdtr(int a1, int a2)
{
  int v3 = 2;
  if (a2) {
    return ioctl(a1, 0x8004746CuLL, &v3);
  }
  else {
    return ioctl(a1, 0x8004746BuLL, &v3);
  }
}

uint64_t get_pty(int *a1, int *a2, char *a3, uid_t a4)
{
  if (openpty(a1, a2, a3, 0LL, 0LL) < 0) {
    return 0LL;
  }
  fchown(*a2, a4, 0xFFFFFFFF);
  fchmod(*a2, 0x180u);
  if (tcgetattr(*a2, &v15))
  {
    uint64_t v13 = "couldn't get attributes on pty: %m";
  }

  else
  {
    *(_OWORD *)&v15.c_iflag = xmmword_100037660;
    v15.tcflag_t c_cflag = v15.c_cflag & 0xFFFFFFFFFFFFE0FFLL | 0xB00;
    v15.c_lflag = 0LL;
    if ((tcsetattr(*a2, 2, &v15) & 0x80000000) == 0) {
      return 1LL;
    }
    uint64_t v13 = "couldn't set attributes on pty: %m";
  }

  warning(v13, v6, v7, v8, v9, v10, v11, v12, v15.c_iflag);
  return 1LL;
}

uint64_t open_ppp_loopback()
{
  looped = 1;
  if ((sub_100017820() & 0x80000000) != 0) {
    die(1);
  }
  sub_1000175C8(ppp_sockfd, 512);
  sub_1000179B8(kdebugflag);
  dword_100041294 = -1;
  return ppp_sockfd;
}

void output( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  int v9 = a3;
  dump_packet((int)"sent", a2, a3, a4, a5, a6, a7, a8);
  unsigned int v12 = *(unsigned __int8 *)(a2 + 2);
  uint64_t v11 = (const void *)(a2 + 2);
  if (v12 <= 0xBF) {
    uint64_t v13 = &ppp_sockfd;
  }
  else {
    uint64_t v13 = &dword_100041294;
  }
  if (write(*v13, v11, v9 - 2) < 0 && *__error() != 5) {
    error("write: %m", v14, v15, v16, v17, v18, v19, v20, a9);
  }
}

double wait_input(timeval *a1)
{
  xmmword_100047780 = xmmword_100047700;
  unk_100047790 = unk_100047710;
  xmmword_1000477A0 = xmmword_100047720;
  unk_1000477B0 = unk_100047730;
  xmmword_100047740 = xmmword_1000476C0;
  *(_OWORD *)algn_100047750 = *(_OWORD *)algn_1000476D0;
  xmmword_100047760 = xmmword_1000476E0;
  unk_100047770 = unk_1000476F0;
  if (select(dword_1000477C0 + 1, (fd_set *)&xmmword_100047740, 0LL, 0LL, a1) < 0)
  {
    if (*__error() != 4) {
      fatal("select: %m", v2, v3, v4, v5, v6, v7, v8, v9);
    }
    double result = 0.0;
    xmmword_1000477A0 = 0u;
    unk_1000477B0 = 0u;
    xmmword_100047780 = 0u;
    unk_100047790 = 0u;
    xmmword_100047760 = 0u;
    unk_100047770 = 0u;
    xmmword_100047740 = 0u;
    *(_OWORD *)algn_100047750 = 0u;
  }

  return result;
}

uint64_t wait_input_fd(int a1, int a2)
{
  v6.tv_seCC_SHA1_CTX c = a2 / 1000;
  v6.tv_useCC_SHA1_CTX c = a2 % 1000;
  memset(&v8, 0, sizeof(v8));
  if (__darwin_check_fd_set_overflow(a1, &v8, 0)) {
    *(__int32_t *)((char *)v8.fds_bits + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << a1;
  }
  while (1)
  {
    uint64_t v3 = select(a1 + 1, &v8, 0LL, &v8, &v6);
    uint64_t v4 = v3;
    unsigned int v7 = v3;
    if ((v3 & 0x80000000) == 0) {
      break;
    }
    if (*__error() != 4) {
      return v4;
    }
  }

  if ((_DWORD)v3)
  {
    if (ioctl(a1, 0x4004667FuLL, &v7, v6.tv_sec, *(void *)&v6.tv_usec) == -1) {
      return 0xFFFFFFFFLL;
    }
    else {
      return v7;
    }
  }

  return v4;
}

uint64_t is_ready_fd(int a1)
{
  uint64_t result = __darwin_check_fd_set_overflow(a1, &xmmword_100047740, 0);
  if ((_DWORD)result) {
    return (*(_DWORD *)((char *)&xmmword_100047740 + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> a1) & 1;
  }
  return result;
}

uint64_t read_packet(_WORD *a1)
{
  *a1 = 1023;
  int v1 = a1 + 1;
  if (dword_100041294 < 0)
  {
    int v2 = -1;
  }

  else
  {
    int v2 = read(dword_100041294, v1, 0x5DEuLL);
    if ((v2 & 0x80000000) == 0) {
      goto LABEL_12;
    }
    if (*__error() != 35 && *__error() != 4) {
      error("read from socket link: %m", v3, v4, v5, v6, v7, v8, v9, v18);
    }
  }

  if ((ifunit & 0x80000000) == 0)
  {
    int v2 = read(ppp_sockfd, v1, 0x5DEuLL);
    if (v2 < 0 && *__error() != 35 && *__error() != 4) {
      error("read from socket bundle: %m", v10, v11, v12, v13, v14, v15, v16, v18);
    }
  }

uint64_t get_loop_output()
{
  uint64_t packet = read_packet(&inpacket_buf);
  uint64_t v7 = packet;
  LODWORD(v8) = 0;
  do
  {
    else {
      uint64_t v8 = v8;
    }
    uint64_t v7 = read_packet(&inpacket_buf);
  }

  while ((int)v7 > 0);
  return v8;
}

void tty_send_config(uint64_t a1, int a2, int a3, int a4)
{
  int v28 = a2;
  if (!hungup && (dword_100041294 & 0x80000000) == 0)
  {
    if (ioctl(dword_100041294, 0x80047457uLL) < 0) {
      fatal("ioctl(PPPIOCSASYNCMAP): %m", v6, v7, v8, v9, v10, v11, v12, (int)&v28);
    }
    if (ioctl(dword_100041294, 0x4004745AuLL) < 0) {
      fatal("ioctl (PPPIOCGFLAGS): %m", v13, v14, v15, v16, v17, v18, v19, (int)&v27);
    }
    unsigned int v27 = (a3 != 0) | (2 * (a4 != 0)) | v27 & 0xFFDFFFFC | ((sync_serial != 0) << 21);
    if (ioctl(dword_100041294, 0x80047459uLL) < 0) {
      fatal("ioctl(PPPIOCSFLAGS): %m", v20, v21, v22, v23, v24, v25, v26, (int)&v27);
    }
    publish_dictnumentry(kSCEntNetPPP, kSCPropNetPPPLCPCompressionPField, a3);
    publish_dictnumentry(kSCEntNetPPP, kSCPropNetPPPLCPCompressionACField, a4);
    publish_dictnumentry(kSCEntNetPPP, kSCPropNetPPPLCPTransmitACCM, v28);
  }

void generic_send_config(uint64_t a1, uint64_t a2, int a3, int a4)
{
  if (!hungup && (dword_100041294 & 0x80000000) == 0)
  {
    if (ioctl(dword_100041294, 0x4004745AuLL) < 0) {
      fatal("ioctl (PPPIOCGFLAGS): %m", v6, v7, v8, v9, v10, v11, v12, (int)&v20);
    }
    unsigned int v20 = (a3 != 0) | (2 * (a4 != 0)) | v20 & 0xFFFFFFFC;
    if (ioctl(dword_100041294, 0x80047459uLL) < 0) {
      fatal("ioctl(PPPIOCSFLAGS): %m", v13, v14, v15, v16, v17, v18, v19, (int)&v20);
    }
    publish_dictnumentry(kSCEntNetPPP, kSCPropNetPPPLCPCompressionPField, a3);
    publish_dictnumentry(kSCEntNetPPP, kSCPropNetPPPLCPCompressionACField, a4);
  }

uint64_t netif_set_mtu(uint64_t a1, int a2)
{
  int v12 = a2;
  if (ioctl(dword_1000476BC, 0x80206934uLL) < 0) {
    error("ioctl (SIOCSIFMTU): %m", v3, v4, v5, v6, v7, v8, v9, (int)v11);
  }
  return publish_dictnumentry(kSCEntNetPPP, kSCPropNetPPPLCPMTU, a2);
}

uint64_t netif_get_mtu()
{
  if ((ioctl(dword_1000476BC, 0xC0206933uLL) & 0x80000000) == 0) {
    return v9;
  }
  error("ioctl (SIOCGIFMTU): %m", v0, v1, v2, v3, v4, v5, v6, (int)v8);
  return 0LL;
}

void ppp_hold()
{
  if (ioctl(dword_100041294, 0x4004745AuLL) < 0)
  {
    uint64_t v7 = "ioctl (PPPIOCGFLAGS): %m";
  }

  else
  {
    v8 |= 0x20u;
    if ((ioctl(dword_100041294, 0x80047459uLL) & 0x80000000) == 0) {
      return;
    }
    uint64_t v7 = "ioctl(PPPIOCSFLAGS): %m";
  }

  warning(v7, v0, v1, v2, v3, v4, v5, v6, (int)&v8);
}

void ppp_cont()
{
  if (ioctl(dword_100041294, 0x4004745AuLL) < 0)
  {
    uint64_t v7 = "ioctl (PPPIOCGFLAGS): %m";
  }

  else
  {
    v8 &= ~0x20u;
    if ((ioctl(dword_100041294, 0x80047459uLL) & 0x80000000) == 0) {
      return;
    }
    uint64_t v7 = "ioctl(PPPIOCSFLAGS): %m";
  }

  warning(v7, v0, v1, v2, v3, v4, v5, v6, (int)&v8);
}

void tty_set_xaccm( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  if (!hungup
    && (dword_100041294 & 0x80000000) == 0
    && ioctl(dword_100041294, 0x8020744FuLL, a1) < 0
    && *__error() != 25)
  {
    warning("ioctl(set extended ACCM): %m", v9, v10, v11, v12, v13, v14, v15, a9);
  }

uint64_t tty_recv_config(uint64_t result, int a2, uint64_t a3, int a4)
{
  int v34 = a2;
  int v35 = result;
  if (!hungup)
  {
    uint64_t result = dword_100041294;
    if ((dword_100041294 & 0x80000000) == 0)
    {
      if (ioctl(dword_100041294, 0x80047452uLL) < 0) {
        fatal("ioctl(PPPIOCSMRU): %m", v5, v6, v7, v8, v9, v10, v11, (int)&v35);
      }
      if (ioctl(dword_100041294, 0x80047454uLL) < 0) {
        fatal("ioctl(PPPIOCSRASYNCMAP): %m", v12, v13, v14, v15, v16, v17, v18, (int)&v34);
      }
      if (ioctl(dword_100041294, 0x4004745AuLL) < 0) {
        fatal("ioctl (PPPIOCGFLAGS): %m", v19, v20, v21, v22, v23, v24, v25, (int)&v33);
      }
      unsigned int v33 = v33 & 0xFFFFFFEF | (16 * (a4 == 0));
      if (ioctl(dword_100041294, 0x80047459uLL) < 0) {
        fatal("ioctl(PPPIOCSFLAGS): %m", v26, v27, v28, v29, v30, v31, v32, (int)&v33);
      }
      publish_dictnumentry(kSCEntNetPPP, kSCPropNetPPPLCPMRU, v35);
      return publish_dictnumentry(kSCEntNetPPP, kSCPropNetPPPLCPReceiveACCM, v34);
    }
  }

  return result;
}

uint64_t generic_recv_config(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  int v27 = result;
  if (!hungup)
  {
    uint64_t result = dword_100041294;
    if ((dword_100041294 & 0x80000000) == 0)
    {
      if (ioctl(dword_100041294, 0x80047452uLL) < 0) {
        fatal("ioctl(PPPIOCSMRU): %m", v5, v6, v7, v8, v9, v10, v11, (int)&v27);
      }
      if (ioctl(dword_100041294, 0x4004745AuLL) < 0) {
        fatal("ioctl (PPPIOCGFLAGS): %m", v12, v13, v14, v15, v16, v17, v18, (int)&v26);
      }
      unsigned int v26 = v26 & 0xFFFFFFEF | (16 * (a4 == 0));
      if (ioctl(dword_100041294, 0x80047459uLL) < 0) {
        fatal("ioctl(PPPIOCSFLAGS): %m", v19, v20, v21, v22, v23, v24, v25, (int)&v26);
      }
      return publish_dictnumentry(kSCEntNetPPP, kSCPropNetPPPLCPMRU, v27);
    }
  }

  return result;
}

uint64_t ccp_test(uint64_t a1, uint64_t a2, int a3, int a4)
{
  uint64_t v5 = a2;
  int v6 = a3;
  int v7 = a4;
  if ((ioctl(ppp_sockfd, 0x8010744DuLL, &v5) & 0x80000000) == 0) {
    return 1LL;
  }
  if (*__error() == 55) {
    return 0LL;
  }
  return 0xFFFFFFFFLL;
}

void ccp_flags_set(uint64_t a1, int a2, int a3)
{
  if (!hungup && (dword_100041294 & 0x80000000) == 0)
  {
    if (ioctl(ppp_sockfd, 0x4004745AuLL) < 0)
    {
      uint64_t v12 = "ioctl (PPPIOCGFLAGS): %m";
    }

    else
    {
      unsigned int v13 = ((a2 != 0) << 6) | ((a3 != 0) << 7) | v13 & 0xFFFFFF3F;
      if ((ioctl(ppp_sockfd, 0x80047459uLL) & 0x80000000) == 0) {
        return;
      }
      uint64_t v12 = "ioctl(PPPIOCSFLAGS): %m";
    }

    error(v12, v5, v6, v7, v8, v9, v10, v11, (int)&v13);
  }

uint64_t ccp_fatal_error()
{
  if ((ioctl(dword_100041294, 0x4004745AuLL) & 0x80000000) == 0) {
    return v8 & 0x800000;
  }
  error("ioctl(PPPIOCGFLAGS): %m", v0, v1, v2, v3, v4, v5, v6, (int)&v8);
  return 0LL;
}

BOOL get_idle_time(uint64_t a1, uint64_t a2)
{
  return ioctl(ppp_sockfd, 0x4008743FuLL, a2) >= 0;
}

uint64_t get_ppp_stats(uint64_t a1, _DWORD *a2)
{
  __int128 v17 = 0u;
  memset(v18, 0, sizeof(v18));
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v14 = 0u;
  __strlcpy_chk(&v14, &ifname, 16LL, 16LL);
  if (ioctl(dword_1000476BC, 0xC05C697BuLL) < 0)
  {
    error("Couldn't get PPP statistics: %m", v3, v4, v5, v6, v7, v8, v9, (int)&v14);
    return 0LL;
  }

  else
  {
    int v10 = HIDWORD(v15);
    int v11 = DWORD2(v16);
    int v12 = v17;
    *a2 = DWORD1(v15);
    a2[1] = v11;
    a2[2] = v10;
    a2[3] = v12;
    return 1LL;
  }

uint64_t sifvjcomp(uint64_t a1, int a2, int a3, int a4)
{
  int v17 = a4;
  __int128 v15 = &v16;
  if (ioctl(ppp_sockfd, 0x4004745AuLL) < 0)
  {
    __int128 v14 = "ioctl (PPPIOCGFLAGS): %m";
  }

  else
  {
    unsigned int v16 = (4 * (a2 != 0)) | (8 * (a3 == 0)) | v16 & 0xFFFFFFF3;
    __int128 v15 = &v16;
    if (ioctl(ppp_sockfd, 0x80047459uLL) < 0)
    {
      __int128 v14 = "ioctl(PPPIOCSFLAGS): %m";
    }

    else
    {
      if (!a2 || (__int128 v15 = (unsigned int *)&v17, (ioctl(ppp_sockfd, 0x80047451uLL) & 0x80000000) == 0))
      {
        publish_dictnumentry(kSCEntNetPPP, kSCPropNetPPPIPCPCompressionVJ, a2);
        return 1LL;
      }

      __int128 v14 = "ioctl(PPPIOCSMAXCID): %m";
    }
  }

  error(v14, v6, v7, v8, v9, v10, v11, v12, (int)v15);
  return 0LL;
}

uint64_t sifup()
{
  if (ioctl(dword_1000476BC, 0xC0206911uLL) < 0)
  {
    uint64_t v8 = "ioctl (SIOCGIFFLAGS): %m";
  }

  else
  {
    v10 |= 1u;
    if ((ioctl(dword_1000476BC, 0x80206910uLL) & 0x80000000) == 0)
    {
      uint64_t result = 1LL;
      byte_1000477C4 = 1;
      return result;
    }

    uint64_t v8 = "ioctl(SIOCSIFFLAGS): %m";
  }

  error(v8, v0, v1, v2, v3, v4, v5, v6, (int)v9);
  return 0LL;
}

uint64_t sifnpmode(uint64_t a1, int a2, int a3)
{
  v12[0] = a2;
  v12[1] = a3;
  if ((ioctl(ppp_sockfd, 0x8008744BuLL, v12) & 0x80000000) == 0) {
    return 1LL;
  }
  error("ioctl(set NP %d mode to %d): %m", v4, v5, v6, v7, v8, v9, v10, a2);
  return 0LL;
}

uint64_t sifnpafmode(uint64_t a1, int a2, int a3)
{
  v12[0] = a2;
  v12[1] = a3;
  if ((ioctl(ppp_sockfd, 0x80087435uLL, v12) & 0x80000000) == 0) {
    return 1LL;
  }
  error("ioctl(set NPAF %d mode to %d): %m", v4, v5, v6, v7, v8, v9, v10, a2);
  return 0LL;
}

uint64_t sifdown()
{
  int v11 = 33;
  if (ioctl(ppp_sockfd, 0xC008744CuLL, &v11)) {
    BOOL v0 = 1;
  }
  else {
    BOOL v0 = v12 == 1;
  }
  if (v0)
  {
    int v11 = 87;
    if (ioctl(ppp_sockfd, 0xC008744CuLL, &v11) || v12 == 1)
    {
      __strlcpy_chk(v13, &ifname, 16LL, 16LL);
      if (ioctl(dword_1000476BC, 0xC0206911uLL) < 0)
      {
        uint64_t v10 = "ioctl (SIOCGIFFLAGS): %m";
      }

      else
      {
        v14 &= ~1u;
        if ((ioctl(dword_1000476BC, 0x80206910uLL) & 0x80000000) == 0)
        {
          byte_1000477C4 = 0;
          return 1LL;
        }

        uint64_t v10 = "ioctl(SIOCSIFFLAGS): %m";
      }

      error(v10, v2, v3, v4, v5, v6, v7, v8, (int)v13);
    }
  }

  return 0LL;
}

uint64_t sifroute(uint64_t a1, unsigned int a2, uint64_t a3, int a4)
{
  if (a4 != -1 && addifroute)
  {
    dword_100047840 = a4 & a2;
    dword_100047844 = a4;
    dword_100047848 = route_interface(1, a4 & a2, a4, 23, &ifname, 0);
  }

  return 1LL;
}

uint64_t route_interface(int a1, int a2, int a3, char a4, const char *a5, int a6)
{
  int v30 = a3;
  int v31 = a2;
  int v11 = socket(17, 3, 17);
  if (v11 < 0)
  {
    int v17 = addr2ascii(2, &v31, 4, v33);
    addr2ascii(2, &v30, 4, v32);
    error( "route_interface: open routing socket failed, %m. (address %s, mask %s, interface %s, host %d).",  v18,  v19,  v20,  v21,  v22,  v23,  v24,  v17);
  }

  else
  {
    int v12 = v11;
    __int128 __buf = 0u;
    __int128 v35 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v40 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    BYTE3(__buf) = a1;
    if (a6) {
      unsigned int v13 = 2053;
    }
    else {
      unsigned int v13 = 2049;
    }
    BYTE2(__buf) = 5;
    DWORD1(v35) = 1;
    *((void *)&__buf + 1) = v13 | 0x300000000LL;
    WORD6(v39) = 528;
    LODWORD(v4notify((uint64_t **)lcp_lowerdown_notify, 0) = a2;
    size_t v14 = strlen(a5);
    WORD6(v4notify((uint64_t **)lcp_lowerdown_notify, 0) = 4628;
    if (v14 >= 0xC) {
      char v15 = 12;
    }
    else {
      char v15 = v14;
    }
    LOBYTE(v41) = a4;
    BYTE1(v41) = v15;
    __strncpy_chk((char *)&v41 + 4, a5);
    if (v30)
    {
      HIDWORD(__buf) |= 4u;
      LOWORD(v42) = 528;
      DWORD1(v42) = v30;
    }

    LOWORD(__buf) = 144;
    if ((write(v12, &__buf, 0x90uLL) & 0x8000000000000000LL) == 0)
    {
      close(v12);
      return 1LL;
    }

    if (a1 == 2) {
      int v25 = 7;
    }
    else {
      int v25 = 3;
    }
    unsigned int v26 = __error();
    int v27 = strerror(*v26);
    uint64_t v28 = addr2ascii(2, &v31, 4, v33);
    uint64_t v29 = addr2ascii(2, &v30, 4, v32);
    sys_log( v25,  "route_interface: write routing socket failed, %s. (address %s, mask %s, interface %s, host %d).",  v27,  v28,  v29,  a5,  a6);
    close(v12);
  }

  return 0LL;
}

uint64_t sifaddr(uint64_t a1, int a2, unsigned int a3, int a4)
{
  if ((byte_10004784C & 1) == 0)
  {
    __strlcpy_chk(v35, &ifname, 16LL, 16LL);
    if (ioctl(dword_1000476BC, 0xC0206950uLL, v35) < 0)
    {
      uint64_t v7 = __error();
      error("Couldn't plumb IP to the interface: %d %m", v8, v9, v10, v11, v12, v13, v14, *v7);
    }

    byte_10004784C = 1;
  }

  __strlcpy_chk(v36, &ifname, 16LL, 16LL);
  uint64_t v39 = 0LL;
  int v37 = 528;
  int v38 = a2;
  uint64_t v42 = 0LL;
  int v40 = 528;
  unsigned int v41 = a3;
  uint64_t v43 = 0LL;
  uint64_t v44 = 0LL;
  if (a4)
  {
    LOWORD(v43) = 528;
    HIDWORD(v43) = a4;
  }

  memset(v35, 0, sizeof(v35));
  __strlcpy_chk(v35, &ifname, 16LL, 16LL);
  if (ioctl(dword_1000476BC, 0x80206919uLL) < 0 && *__error() != 49) {
    warning("Couldn't remove interface address: %m", v15, v16, v17, v18, v19, v20, v21, (int)v35);
  }
  uint64_t v22 = ioctl(dword_1000476BC, 0x8040691AuLL, v36);
  if ((v22 & 0x80000000) != 0)
  {
    if (*__error() != 17)
    {
      error("Couldn't set interface address: %m", v24, v25, v26, v27, v28, v29, v30, v34);
      return 0LL;
    }

    warning("Couldn't set interface address: Address %I already exists", v24, v25, v26, v27, v28, v29, v30, a2);
  }

  dword_1000477C8 = a2;
  dword_1000477CC = a3;
  if (looplocal)
  {
    int v31 = ppp_sockfd;
    int v32 = sub_100017630(ppp_sockfd);
    sub_1000175C8(v31, v32 | 0x1000000);
    uint64_t v22 = route_interface(1, a2, 0, 23, &ifname, 1);
  }

  sifroute(v22, a2, v23, a4);
  publish_stateaddr(a2, a3);
  return 1LL;
}

CFMutableDictionaryRef publish_stateaddr(unsigned int a1, unsigned int a2)
{
  if (!cfgCache) {
    return 0LL;
  }
  CFMutableDictionaryRef result = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (result)
  {
    uint64_t v5 = result;
    CFMutableArrayRef Mutable = CFArrayCreateMutable(0LL, 1LL, &kCFTypeArrayCallBacks);
    if (Mutable)
    {
      uint64_t v7 = Mutable;
      CFStringRef v8 = CFStringCreateWithFormat( 0LL,  0LL,  @"%d.%d.%d.%d",  a1,  BYTE1(a1),  BYTE2(a1),  HIBYTE(a1));
      if (v8)
      {
        CFStringRef v9 = v8;
        CFArrayAppendValue(v7, v8);
        CFRelease(v9);
        CFDictionarySetValue(v5, kSCPropNetIPv4Addresses, v7);
      }

      CFRelease(v7);
    }

    CFMutableArrayRef v10 = CFArrayCreateMutable(0LL, 1LL, &kCFTypeArrayCallBacks);
    if (v10)
    {
      uint64_t v11 = v10;
      CFStringRef v12 = CFStringCreateWithFormat( 0LL,  0LL,  @"%d.%d.%d.%d",  a2,  BYTE1(a2),  BYTE2(a2),  HIBYTE(a2));
      if (v12)
      {
        CFStringRef v13 = v12;
        CFArrayAppendValue(v11, v12);
        CFRelease(v13);
        CFDictionarySetValue(v5, kSCPropNetIPv4DestAddresses, v11);
      }

      CFRelease(v11);
    }

    CFStringRef v14 = CFStringCreateWithFormat( 0LL,  0LL,  @"%d.%d.%d.%d",  a1,  BYTE1(a1),  BYTE2(a1),  HIBYTE(a1));
    if (v14)
    {
      CFStringRef v15 = v14;
      CFDictionarySetValue(v5, kSCPropNetIPv4Router, v14);
      CFRelease(v15);
    }

    CFStringRef v16 = CFStringCreateWithFormat(0LL, 0LL, @"%s", &ifname);
    if (v16)
    {
      CFStringRef v17 = v16;
      CFDictionarySetValue(v5, kSCPropInterfaceName, v16);
      CFRelease(v17);
    }

    if (qword_1000477D8)
    {
      CFStringRef v18 = CFStringCreateWithFormat(0LL, 0LL, @"%s", qword_1000477D8);
      if (v18)
      {
        CFStringRef v19 = v18;
        CFDictionarySetValue(v5, @"NetworkSignature", v18);
        CFRelease(v19);
      }
    }

    if (qword_1000477E0) {
      CFDictionarySetValue(v5, @"ServerAddress", (const void *)qword_1000477E0);
    }
    CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity( 0LL,  kSCDynamicStoreDomainState,  (CFStringRef)serviceidRef,  kSCEntNetIPv4);
    if (NetworkServiceEntity)
    {
      uint64_t v21 = NetworkServiceEntity;
      if (!sub_10001A5F8(NetworkServiceEntity, v5))
      {
        int v22 = SCError();
        SCErrorString(v22);
        warning("SCDynamicStoreSetValue IP %s failed: %s\n", v23, v24, v25, v26, v27, v28, v29, (int)&ifname);
      }

      CFRelease(v21);
    }

    CFRelease(v5);
    return (CFMutableDictionaryRef)1;
  }

  return result;
}

uint64_t uifaddr(uint64_t a1, unsigned int a2, unsigned int a3, int a4)
{
  if ((byte_10004784C & 1) == 0)
  {
    error("Interface should have been plumbed already", v7, v8, v9, v10, v11, v12, v13, v86);
    return 0xFFFFFFFFLL;
  }

  __strlcpy_chk(v89, &ifname, 16LL, 16LL);
  uint64_t v92 = 0LL;
  int v90 = 528;
  unsigned int v91 = a2;
  uint64_t v95 = 0LL;
  int v93 = 528;
  unsigned int v94 = a3;
  uint64_t v96 = 0LL;
  uint64_t v97 = 0LL;
  if (a4)
  {
    LOWORD(v96) = 528;
    HIDWORD(v96) = a4;
  }

  memset(v88, 0, sizeof(v88));
  __strlcpy_chk(v88, &ifname, 16LL, 16LL);
  if (ioctl(dword_1000476BC, 0x80206919uLL) < 0 && *__error() != 49) {
    warning("Couldn't remove interface address: %m", v14, v15, v16, v17, v18, v19, v20, (int)v88);
  }
  uint64_t v21 = ioctl(dword_1000476BC, 0x8040691AuLL, v89);
  if ((v21 & 0x80000000) != 0)
  {
    if (*__error() != 17)
    {
      error("Couldn't set interface address: %m", v23, v24, v25, v26, v27, v28, v29, v87);
      return 0LL;
    }

    warning("Couldn't set interface address: Address %I already exists", v23, v24, v25, v26, v27, v28, v29, a2);
  }

  dword_1000477C8 = a2;
  dword_1000477CC = a3;
  sifroute(v21, a2, v22, a4);
  if (cfgCache)
  {
    CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity( 0LL,  kSCDynamicStoreDomainState,  (CFStringRef)serviceidRef,  kSCEntNetIPv4);
    if (NetworkServiceEntity)
    {
      int v31 = NetworkServiceEntity;
      if (publish_dict)
      {
        Value = (void *)CFDictionaryGetValue((CFDictionaryRef)publish_dict, NetworkServiceEntity);
        unsigned int v33 = Value;
        if (Value)
        {
          CFRetain(Value);
LABEL_18:
          CFTypeID v35 = CFGetTypeID(v33);
          if (v35 == CFDictionaryGetTypeID())
          {
            CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0LL, 0LL, (CFDictionaryRef)v33);
            CFRelease(v33);
            if (MutableCopy)
            {
              CFTypeID v37 = CFGetTypeID(MutableCopy);
              if (v37 == CFDictionaryGetTypeID())
              {
                CFMutableArrayRef Mutable = CFArrayCreateMutable(0LL, 1LL, &kCFTypeArrayCallBacks);
                if (Mutable)
                {
                  uint64_t v39 = Mutable;
                  CFStringRef v40 = CFStringCreateWithFormat( 0LL,  0LL,  @"%d.%d.%d.%d",  a2,  BYTE1(a2),  BYTE2(a2),  HIBYTE(a2));
                  if (v40)
                  {
                    CFStringRef v41 = v40;
                    CFArrayAppendValue(v39, v40);
                    CFRelease(v41);
                    CFDictionarySetValue(MutableCopy, kSCPropNetIPv4Addresses, v39);
                  }

                  CFRelease(v39);
                }

                CFMutableArrayRef v42 = CFArrayCreateMutable(0LL, 1LL, &kCFTypeArrayCallBacks);
                if (v42)
                {
                  uint64_t v43 = v42;
                  CFStringRef v44 = CFStringCreateWithFormat( 0LL,  0LL,  @"%d.%d.%d.%d",  a3,  BYTE1(a3),  BYTE2(a3),  HIBYTE(a3));
                  if (v44)
                  {
                    CFStringRef v45 = v44;
                    CFArrayAppendValue(v43, v44);
                    CFRelease(v45);
                    CFDictionarySetValue(MutableCopy, kSCPropNetIPv4DestAddresses, v43);
                  }

                  CFRelease(v43);
                }

                CFStringRef v46 = CFStringCreateWithFormat( 0LL,  0LL,  @"%d.%d.%d.%d",  a2,  BYTE1(a2),  BYTE2(a2),  HIBYTE(a2));
                if (v46)
                {
                  CFStringRef v47 = v46;
                  CFDictionarySetValue(MutableCopy, kSCPropNetIPv4Router, v46);
                  CFRelease(v47);
                }

                CFStringRef v48 = CFStringCreateWithFormat(0LL, 0LL, @"%s", &ifname);
                if (v48)
                {
                  CFStringRef v49 = v48;
                  CFDictionarySetValue(MutableCopy, kSCPropInterfaceName, v48);
                  CFRelease(v49);
                }

                if (qword_1000477D8)
                {
                  CFStringRef v50 = CFStringCreateWithFormat(0LL, 0LL, @"%s", qword_1000477D8);
                  if (v50)
                  {
                    CFStringRef v51 = v50;
                    CFDictionarySetValue(MutableCopy, @"NetworkSignature", v50);
                    CFRelease(v51);
                  }
                }

                if (qword_1000477E0) {
                  CFDictionarySetValue(MutableCopy, @"ServerAddress", (const void *)qword_1000477E0);
                }
                if (!sub_10001A5F8(v31, MutableCopy))
                {
                  int v52 = SCError();
                  SCErrorString(v52);
                  warning("SCDynamicStoreSetValue IP %s failed: %s\n", v53, v54, v55, v56, v57, v58, v59, (int)&ifname);
                }
              }

              else
              {
                int v78 = SCError();
                SCErrorString(v78);
                warning( "CFDictionaryCreateMutableCopy IP %s failed: %s\n",  v79,  v80,  v81,  v82,  v83,  v84,  v85,  (int)&ifname);
              }

              CFMutableDictionaryRef v69 = MutableCopy;
              goto LABEL_47;
            }

            int v70 = SCError();
            SCErrorString(v70);
            warning("CFDictionaryCreateMutableCopy IP %s failed: %s\n", v71, v72, v73, v74, v75, v76, v77, (int)&ifname);
            goto LABEL_48;
          }

          char v60 = 0;
LABEL_42:
          int v61 = SCError();
          SCErrorString(v61);
          warning("SCDynamicStoreCopyValue IP %s failed: %s\n", v62, v63, v64, v65, v66, v67, v68, (int)&ifname);
          if ((v60 & 1) == 0)
          {
            CFMutableDictionaryRef v69 = (CFMutableDictionaryRef)v33;
LABEL_47:
            CFRelease(v69);
          }

LABEL_48:
          CFRelease(v31);
          return 1LL;
        }
      }

      else
      {
        unsigned int v33 = (void *)SCDynamicStoreCopyValue((SCDynamicStoreRef)cfgCache, NetworkServiceEntity);
        if (v33) {
          goto LABEL_18;
        }
      }

      char v60 = 1;
      goto LABEL_42;
    }
  }

  return 1LL;
}

uint64_t unpublish_dict(CFStringRef entity)
{
  if (!cfgCache) {
    return 0LL;
  }
  CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity( 0LL,  kSCDynamicStoreDomainState,  (CFStringRef)serviceidRef,  entity);
  if (!NetworkServiceEntity) {
    return 12LL;
  }
  uint64_t v2 = NetworkServiceEntity;
  if (publish_dict) {
    CFDictionaryRemoveValue((CFMutableDictionaryRef)publish_dict, NetworkServiceEntity);
  }
  BOOL v3 = SCDynamicStoreRemoveValue((SCDynamicStoreRef)cfgCache, v2) == 0;
  CFRelease(v2);
  return v3;
}

uint64_t sif6addr(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v5 = socket(30, 2, 0);
  if (v5 < 0)
  {
    error("Can't create IPv6 socket: %m", v6, v7, v8, v9, v10, v11, v12, v32);
  }

  else
  {
    int v13 = v5;
    unsigned int v14 = if_nametoindex(&ifname);
    if (v14)
    {
      unsigned __int16 v22 = v14;
      __strlcpy_chk(v41, &ifname, 16LL, 16LL);
      unsigned int v33 = (__int128 *)v41;
      if (ioctl(v13, 0xC080696EuLL) < 0)
      {
        int v31 = "sif6addr: can't attach IPv6 protocol: %m";
      }

      else
      {
        __int128 v39 = 0u;
        __int128 v40 = 0u;
        __int128 v38 = 0u;
        __int128 v36 = 0u;
        memset(v37, 0, sizeof(v37));
        __int128 v34 = 0u;
        __int128 v35 = 0u;
        __strlcpy_chk(&v34, &ifname, 16LL, 16LL);
        LOWORD(v35) = 7708;
        WORD4(v35) = -32514;
        *(void *)&__int128 v36 = a2;
        WORD5(v35) = htons(v22);
        WORD6(v36) = 7708;
        WORD2(v37[0]) = -32514;
        *(void *)((char *)v37 + 12) = a3;
        WORD3(v37[0]) = WORD5(v35);
        WORD4(v37[1]) = 7708;
        *(void *)&__int128 v38 = -1LL;
        *((void *)&v38 + 1) = -1LL;
        *((void *)&v40 + 1) = -1LL;
        unsigned int v33 = &v34;
        if ((ioctl(v13, 0xC0806982uLL) & 0x80000000) == 0)
        {
          close(v13);
          return 1LL;
        }

        int v31 = "sif6addr: can't set LL address: %m";
      }

      error(v31, v23, v24, v25, v26, v27, v28, v29, (int)v33);
    }

    else
    {
      error("sifaddr6: no interface %s", v15, v16, v17, v18, v19, v20, v21, (int)&ifname);
    }

    close(v13);
  }

  return 0LL;
}

uint64_t cif6addr()
{
  int v0 = socket(30, 2, 0);
  if (v0 < 0)
  {
    error("Can't create IPv6 socket: %m", v1, v2, v3, v4, v5, v6, v7, v24);
  }

  else
  {
    int v8 = v0;
    __strlcpy_chk(v26, &ifname, 16LL, 16LL);
    if ((ioctl(v8, 0xC0206951uLL, v26) & 0x80000000) == 0)
    {
      close(v8);
      return 1LL;
    }

    __strlcpy_chk(v25, &ifname, 16LL, 16LL);
    if (ioctl(v8, 0xC1206983uLL) < 0) {
      warning("Can't stop LL address: %m", v10, v11, v12, v13, v14, v15, v16, (int)v25);
    }
    __strlcpy_chk(v25, &ifname, 16LL, 16LL);
    if (ioctl(v8, 0xC120696FuLL) < 0) {
      warning("Can't detach IPv6 protocol: %m", v17, v18, v19, v20, v21, v22, v23, (int)v25);
    }
    close(v8);
  }

  return 0LL;
}

uint64_t ether_to_eui64(uint64_t a1)
{
  kern_return_t MatchingServices;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  kern_return_t ParentEntry;
  io_object_t v15;
  io_registry_entry_t v16;
  CFDataRef CFProperty;
  CFDataRef v18;
  UInt8 buffer[4];
  __int16 v22;
  io_iterator_t existing;
  io_registry_entry_t parent;
  CFRange v25;
  uint64_t v2 = IOServiceMatching("IOEthernetInterface");
  if (v2)
  {
    CFMutableArrayRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    if (Mutable)
    {
      uint64_t v4 = Mutable;
      CFDictionarySetValue(Mutable, @"IOPrimaryInterface", kCFBooleanTrue);
      CFDictionarySetValue(v2, @"IOPropertyMatch", v4);
      CFRelease(v4);
    }
  }

  MatchingServices = IOServiceGetMatchingServices(kIOMasterPortDefault, v2, &existing);
  if (MatchingServices)
  {
    ParentEntry = MatchingServices;
LABEL_6:
    warning("Can't get hardware interface address for en0 (error = %d)\n", v6, v7, v8, v9, v10, v11, v12, ParentEntry);
    return 0LL;
  }

  uint64_t v22 = 0;
  *(_DWORD *)buffer = 0;
  uint64_t v15 = IOIteratorNext(existing);
  if (v15)
  {
    uint64_t v16 = v15;
    do
    {
      ParentEntry = IORegistryEntryGetParentEntry(v16, "IOService", &parent);
      if (!ParentEntry)
      {
        CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty( parent,  @"IOMACAddress",  kCFAllocatorDefault,  0);
        if (CFProperty)
        {
          uint64_t v18 = CFProperty;
          v25.location = 0LL;
          v25.length = 6LL;
          CFDataGetBytes(CFProperty, v25, buffer);
          CFRelease(v18);
        }

        IOObjectRelease(parent);
      }

      IOObjectRelease(v16);
      uint64_t v16 = IOIteratorNext(existing);
    }

    while (v16);
    IOObjectRelease(existing);
    if (ParentEntry) {
      goto LABEL_6;
    }
  }

  else
  {
    IOObjectRelease(existing);
  }

  if (*(_DWORD *)buffer == dword_10004784D && v22 == word_100047851) {
    return 0LL;
  }
  if (*(_DWORD *)buffer == dword_100041298 && v22 == word_10004129C) {
    return 0LL;
  }
  *(_BYTE *)a1 = buffer[0] | 2;
  *(_WORD *)(a1 + 1) = *(_WORD *)&buffer[1];
  *(_WORD *)(a1 + 3) = -257;
  *(_BYTE *)(a1 + 5) = buffer[3];
  *(_WORD *)(a1 + 6) = v22;
  return 1LL;
}

void ppp_create_ipv6_dummy_primary(int a1)
{
  int valuePtr = 1;
  if (noipv6override) {
    BOOL v1 = 1;
  }
  else {
    BOOL v1 = cfgCache == 0;
  }
  if (!v1 && serviceidRef != 0)
  {
    CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity( 0LL,  kSCDynamicStoreDomainState,  (CFStringRef)serviceidRef,  kSCEntNetIPv6);
    if (NetworkServiceEntity)
    {
      uint64_t v5 = NetworkServiceEntity;
      if (a1)
      {
        unpublish_dict(NetworkServiceEntity);
      }

      else
      {
        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        if (Mutable)
        {
          uint64_t v7 = Mutable;
          int v8 = CFArrayCreateMutable(0LL, 1LL, &kCFTypeArrayCallBacks);
          if (v8)
          {
            uint64_t v9 = v8;
            CFArrayAppendValue(v8, @"::1");
            CFDictionarySetValue(v7, kSCPropNetIPv6Addresses, v9);
            CFRelease(v9);
          }

          CFDictionarySetValue(v7, kSCPropNetIPv6Router, @"::1");
          CFNumberRef v10 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
          if (v10)
          {
            CFNumberRef v11 = v10;
            CFDictionarySetValue(v7, kSCPropNetOverridePrimary, v10);
            CFRelease(v11);
          }

          CFDictionarySetValue(v7, @"IsNULL", kCFBooleanTrue);
          CFStringRef v12 = CFStringCreateWithFormat(0LL, 0LL, @"%s", &ifname);
          if (v12)
          {
            CFStringRef v13 = v12;
            CFDictionarySetValue(v7, kSCPropInterfaceName, v12);
            CFRelease(v13);
          }

          sub_10001A5F8(v5, v7);
          CFRelease(v7);
        }
      }

      CFRelease(v5);
    }
  }

BOOL sub_10001A5F8(CFStringRef key, CFPropertyListRef value)
{
  if (demand) {
    BOOL v4 = SCDynamicStoreSetValue((SCDynamicStoreRef)cfgCache, key, value) != 0;
  }
  else {
    BOOL v4 = 1LL;
  }
  if (!publish_dict) {
    return 0LL;
  }
  CFDictionarySetValue((CFMutableDictionaryRef)publish_dict, key, value);
  return v4;
}

uint64_t sifdefaultroute()
{
  byte_100047858 = 1;
  ppp_create_ipv6_dummy_primary(0);
  return publish_dictnumentry(kSCEntNetIPv4, kSCPropNetOverridePrimary, 1);
}

uint64_t publish_dns_wins_entry( CFStringRef entity, const void *a2, const void *a3, const void *a4, const void *a5, const void *a6, const void *a7, const void *a8, void *key, void *value, int a11)
{
  if (publish_dict | cfgCache)
  {
    CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity( 0LL,  kSCDynamicStoreDomainState,  (CFStringRef)serviceidRef,  entity);
    if (NetworkServiceEntity)
    {
      uint64_t v19 = NetworkServiceEntity;
      if (publish_dict)
      {
        uint64_t v20 = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)publish_dict, NetworkServiceEntity);
        if (v20)
        {
          CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0LL, 0LL, v20);
          goto LABEL_11;
        }
      }

      else
      {
        uint64_t v20 = (const __CFDictionary *)SCDynamicStoreCopyValue((SCDynamicStoreRef)cfgCache, NetworkServiceEntity);
        if (v20)
        {
          uint64_t v23 = v20;
          CFMutableDictionaryRef v24 = CFDictionaryCreateMutableCopy(0LL, 0LL, v20);
          CFRelease(v23);
          if (v24) {
            goto LABEL_12;
          }
          goto LABEL_9;
        }
      }

      CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutable( v20,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
LABEL_11:
      CFMutableDictionaryRef v24 = MutableCopy;
      if (MutableCopy)
      {
LABEL_12:
        CFTypeID v25 = CFGetTypeID(v24);
        if (v25 != CFDictionaryGetTypeID()) {
          goto LABEL_46;
        }
        if (a11 || (unsigned int v33 = (const __CFArray *)CFDictionaryGetValue(v24, a2)) == 0LL)
        {
          cf = 0LL;
        }

        else
        {
          __int128 v34 = v33;
          CFTypeID v50 = CFGetTypeID(v33);
          cf = v34;
          if (v50 == CFArrayGetTypeID())
          {
            CFIndex Count = CFArrayGetCount(v34);
            uint64_t v26 = CFArrayCreateMutableCopy(0LL, Count + 1, v34);
LABEL_16:
            uint64_t v27 = v26;
            if (v26)
            {
              CFArrayAppendValue(v26, a3);
              if (a4) {
                CFArrayAppendValue(v27, a4);
              }
              CFDictionarySetValue(v24, a2, v27);
              CFRelease(v27);
              if (a5)
              {
                uint64_t v28 = cf;
                int v29 = a11;
                if (!a11) {
                  uint64_t v28 = (const __CFArray *)CFDictionaryGetValue(v24, a5);
                }
                if (v28 && (CFTypeID v30 = CFGetTypeID(v28), v30 == CFArrayGetTypeID()))
                {
                  CFIndex v31 = CFArrayGetCount(v28);
                  CFMutableDictionaryRef Mutable = CFArrayCreateMutableCopy(0LL, v31 + 1, v28);
                }

                else
                {
                  CFMutableDictionaryRef Mutable = CFArrayCreateMutable(0LL, 1LL, &kCFTypeArrayCallBacks);
                }

                __int128 v36 = Mutable;
                if (!Mutable) {
                  goto LABEL_46;
                }
                CFArrayAppendValue(Mutable, a6);
                CFDictionarySetValue(v24, a5, v36);
                CFRelease(v36);
              }

              else
              {
                uint64_t v28 = cf;
                int v29 = a11;
              }

              if (a7)
              {
                if (!v29) {
                  uint64_t v28 = (const __CFArray *)CFDictionaryGetValue(v24, a7);
                }
                if (v28 && (CFTypeID v37 = CFGetTypeID(v28), v37 == CFArrayGetTypeID()))
                {
                  CFIndex v38 = CFArrayGetCount(v28);
                  __int128 v39 = CFArrayCreateMutableCopy(0LL, v38 + 1, v28);
                }

                else
                {
                  __int128 v39 = CFArrayCreateMutable(0LL, 1LL, &kCFTypeArrayCallBacks);
                }

                __int128 v40 = v39;
                if (!v39) {
                  goto LABEL_46;
                }
                CFArrayAppendValue(v39, a8);
                CFDictionarySetValue(v24, a7, v40);
                CFRelease(v40);
              }

              if (key) {
                CFDictionarySetValue(v24, key, value);
              }
              if (sub_10001A5F8(v19, v24))
              {
                uint64_t v22 = 1LL;
LABEL_47:
                CFRelease(v19);
                goto LABEL_48;
              }

              int v41 = SCError();
              SCErrorString(v41);
              warning( "SCDynamicStoreSetValue DNS/WINS %s failed: %s\n",  v42,  v43,  v44,  v45,  v46,  v47,  v48,  (int)&ifname);
            }

uint64_t sifdns(unsigned int a1, unsigned int a2)
{
  uint64_t valuePtr = 100000LL;
  CFNumberRef v4 = CFNumberCreate(0LL, kCFNumberLongType, &valuePtr);
  if (v4)
  {
    uint64_t v5 = (const __CFString *)v4;
    CFStringRef v6 = CFStringCreateWithCString(0LL, (const char *)&unk_10002EB6A, 0x8000100u);
    if (v6)
    {
      CFStringRef v7 = v6;
      notify_post("com.apple.system.dns.delay");
      unsigned int v8 = a1 & 0xFF000000 | (BYTE2(a1) << 16) | (BYTE1(a1) << 8) | a1;
      if (v8
        && (CFStringRef v9 = CFStringCreateWithFormat( 0LL,  0LL,  @"%d.%d.%d.%d",  a1,  BYTE1(a1),  BYTE2(a1),  HIBYTE(a1))) != 0LL)
      {
        CFStringRef v10 = v9;
        CFStringRef v11 = 0LL;
        unsigned int v12 = a2 & 0xFF000000 | (BYTE2(a2) << 16) | (BYTE1(a2) << 8) | a2;
        if (v12 && v12 != v8) {
          CFStringRef v11 = CFStringCreateWithFormat( 0LL,  0LL,  @"%d.%d.%d.%d",  a2,  BYTE1(a2),  BYTE2(a2),  HIBYTE(a2));
        }
        uint64_t v13 = 1LL;
        if (publish_dns_wins_entry( kSCEntNetDNS,  kSCPropNetDNSServerAddresses,  v10,  v11,  kSCPropNetDNSSupplementalMatchDomains,  v7,  kSCPropNetDNSSupplementalMatchOrders,  v5,  kSCPropNetDNSConfirmedServiceID,  (void *)serviceidRef,  1)) {
          publish_dns_wins_entry( kSCEntNetProxies,  kSCPropNetProxiesSupplementalMatchDomains,  v7,  0LL,  kSCPropNetProxiesSupplementalMatchOrders,  v5,  0LL,  0LL,  0LL,  0LL,  1);
        }
        else {
          uint64_t v13 = 0LL;
        }
        CFRelease(v5);
        CFRelease(v10);
        if (!v11) {
          goto LABEL_16;
        }
      }

      else
      {
        uint64_t v13 = 0LL;
        CFStringRef v11 = v5;
      }

      CFRelease(v11);
    }

    else
    {
      uint64_t v13 = 0LL;
      CFStringRef v7 = v5;
    }

LABEL_16:
    CFRelease(v7);
    return v13;
  }

  return 0LL;
}

uint64_t sifwins()
{
  return 0LL;
}

uint64_t sifproxyarp(uint64_t a1, int a2)
{
  xmmword_10004785C = 0u;
  *(_OWORD *)algn_10004786C = 0u;
  xmmword_10004787C = 0u;
  unk_10004788C = 0u;
  xmmword_10004789C = 0u;
  unk_1000478AC = 0u;
  xmmword_1000478BC = 0u;
  unk_1000478CC = 0u;
  xmmword_1000478DC = 0u;
  unk_1000478EC = 0u;
  xmmword_1000478FC = 0u;
  unk_10004790C = 0u;
  xmmword_10004791C = 0u;
  unk_10004792C = 0u;
  xmmword_10004793C = 0u;
  unk_10004794C = 0u;
  int v27 = 1024;
  uint64_t v28 = &v29;
  uint64_t v26 = &v27;
  if (ioctl(dword_1000476BC, 0xC00C6924uLL) < 0)
  {
    error("ioctl(SIOCGIFCONF): %m", v3, v4, v5, v6, v7, v8, v9, (int)&v27);
  }

  else if (v27 >= 1)
  {
    CFStringRef v10 = v28;
    CFStringRef v11 = &v28[v27];
    while (1)
    {
      if (v10[17] == 2)
      {
        int v12 = *((_DWORD *)v10 + 5);
        __strlcpy_chk(v30, v10, 16LL, 16LL);
        uint64_t v26 = (int *)v30;
        if ((ioctl(dword_1000476BC, 0xC0206911uLL) & 0x80000000) == 0 && (v30[16] & 0x9B) == 3)
        {
          uint64_t v26 = (int *)v30;
          if ((ioctl(dword_1000476BC, 0xC0206925uLL) & 0x80000000) == 0 && (v31 & (v12 ^ a2)) == 0) {
            break;
          }
        }
      }

      v10 += *((unsigned __int8 *)v10 + 16) + 16;
      if (v10 >= v11) {
        goto LABEL_12;
      }
    }

    info("found interface %s for proxy arp", v3, v4, v5, v6, v7, v8, v9, (int)v10);
    for (uint64_t i = v28; i < v11; i += *((unsigned __int8 *)i + 16) + 16)
    {
      if (!strcmp(v10, i) && i[17] == 18)
      {
        __memcpy_chk((char *)&xmmword_1000478BC + 12, i + 16, *((unsigned __int8 *)i + 16), 148LL);
        int v17 = socket(17, 3, 17);
        if (v17 < 0)
        {
          uint64_t v13 = "Couldn't add proxy arp entry: socket: %m";
          goto LABEL_13;
        }

        int v18 = v17;
        WORD1(xmmword_10004785C) = 261;
        dword_100047870 = ++dword_10004795C;
        *((void *)&xmmword_10004785C + 1) = 0x300004804LL;
        LODWORD(xmmword_10004787C) = 4;
        word_1000478B8 = 528;
        LODWORD(xmmword_1000478BC) = a2;
        uint64_t v14 = 1LL;
        WORD5(xmmword_1000478BC) = 1;
        LOWORD(xmmword_10004785C) = BYTE12(xmmword_1000478BC) + 108;
        if ((write(v17, &xmmword_10004785C, BYTE12(xmmword_1000478BC) + 108LL) & 0x8000000000000000LL) == 0)
        {
          close(v18);
          byte_100047960 = 1;
          dword_1000477D0 = a2;
          return v14;
        }

        error("Couldn't add proxy arp entry: %m", v19, v20, v21, v22, v23, v24, v25, (int)v26);
        close(v18);
        return 0LL;
      }
    }
  }

uint64_t GetMask(uint64_t a1)
{
  int v1 = ntohl(a1);
  int v2 = v1;
  else {
    unsigned int v3 = -256;
  }
  if (v1 < 0) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 4278190080LL;
  }
  int v5 = netmask;
  uint64_t v6 = htonl(v4) | v5;
  int v16 = 1024;
  int v17 = &v18;
  if (ioctl(dword_1000476BC, 0xC00C6924uLL) < 0)
  {
    warning("ioctl(SIOCGIFCONF): %m", v7, v8, v9, v10, v11, v12, v13, (int)&v16);
  }

  else
  {
    unint64_t v14 = (unint64_t)v17;
    do
    {
      if (*(_BYTE *)(v14 + 17) == 2
        && ((ntohl(*(unsigned int *)(v14 + 20)) ^ v2) & v4) == 0)
      {
        __strlcpy_chk(v19, v14, 16LL, 16LL);
        if ((ioctl(dword_1000476BC, 0xC0206911uLL, v19) & 0x80000000) == 0
          && (v19[16] & 0x19) == 1
          && (ioctl(dword_1000476BC, 0xC0206925uLL, v19) & 0x80000000) == 0)
        {
          uint64_t v6 = v20 | v6;
        }
      }

      v14 += 16LL + *(unsigned __int8 *)(v14 + 16);
    }

    while (v14 < (unint64_t)&v17[v16]);
  }

  return v6;
}

uint64_t have_route_to()
{
  return 0xFFFFFFFFLL;
}

uint64_t get_host_seed()
{
  return gethostid();
}

uint64_t sys_loadplugin(_BYTE *a1)
{
  if (*a1 == 47)
  {
    __strlcpy_chk(__s, a1, 1024LL, 1024LL);
  }

  else
  {
    __strlcpy_chk(__s, "/System/Library/SystemConfiguration/PPPController.bundle/PlugIns/", 1024LL, 1024LL);
    __strlcat_chk(__s, a1, 1024LL, 1024LL);
  }

  size_t v2 = strlen(__s);
  unsigned int v3 = CFURLCreateFromFileSystemRepresentation(0LL, (const UInt8 *)__s, v2, 1u);
  if (!v3) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v4 = v3;
  int v5 = CFBundleCreate(0LL, v3);
  if (v5)
  {
    uint64_t v6 = v5;
    if (CFBundleLoadExecutable(v5)
      && (FunctionPointerForName = (uint64_t (*)(__CFBundle *))CFBundleGetFunctionPointerForName( v6,  @"start")) != 0LL)
    {
      uint64_t v8 = FunctionPointerForName(v6);
    }

    else
    {
      uint64_t v8 = 0xFFFFFFFFLL;
    }

    CFRelease(v6);
  }

  else
  {
    uint64_t v8 = 0xFFFFFFFFLL;
  }

  CFRelease(v4);
  return v8;
}

uint64_t sys_eaploadplugin(_BYTE *a1, uint64_t a2)
{
  if (*a1 == 47)
  {
    __strlcpy_chk(__s, a1, 1024LL, 1024LL);
  }

  else
  {
    __strlcpy_chk(__s, "/System/Library/SystemConfiguration/PPPController.bundle/PlugIns/", 1024LL, 1024LL);
    __strlcat_chk(__s, a1, 1024LL, 1024LL);
  }

  size_t v4 = strlen(__s);
  int v5 = CFURLCreateFromFileSystemRepresentation(0LL, (const UInt8 *)__s, v4, 1u);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = CFBundleCopyInfoDictionaryForURL(v5);
    if (v7)
    {
      uint64_t v8 = v7;
      *(void *)(a2 + 96) = 0LL;
      *(_OWORD *)(a2 + 64) = 0u;
      *(_OWORD *)(a2 + 8notify((uint64_t **)lcp_lowerdown_notify, 0) = 0u;
      *(_OWORD *)(a2 + 32) = 0u;
      *(_OWORD *)(a2 + 48) = 0u;
      *(_OWORD *)a2 = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
      Value = (const __CFNumber *)CFDictionaryGetValue(v7, @"EAPType");
      if (Value)
      {
        uint64_t v10 = Value;
        CFTypeID v11 = CFGetTypeID(Value);
        if (v11 == CFNumberGetTypeID())
        {
          CFNumberGetValue(v10, kCFNumberSInt32Type, &valuePtr);
          *(_BYTE *)(a2 + 8) = valuePtr;
        }
      }

      uint64_t v12 = (const __CFString *)CFDictionaryGetValue(v8, @"EAPName");
      if (v12)
      {
        uint64_t v13 = v12;
        CFTypeID v14 = CFGetTypeID(v12);
        if (v14 == CFStringGetTypeID())
        {
          CFIndex Length = CFStringGetLength(v13);
          int v16 = (char *)malloc(Length + 1);
          *(void *)(a2 + 16) = v16;
          if (v16)
          {
            int v17 = v16;
            CFIndex v18 = CFStringGetLength(v13);
            CFStringGetCString(v13, v17, v18 + 1, 0x8000100u);
          }
        }
      }

      CFRelease(v8);
      uint64_t v19 = CFBundleCreate(0LL, v6);
      if (v19)
      {
        int v20 = v19;
        if (CFBundleLoadExecutable(v19))
        {
          *(void *)(a2 + 4notify((uint64_t **)lcp_lowerdown_notify, 0) = CFBundleGetFunctionPointerForName(v20, @"Init");
          *(void *)(a2 + 48) = CFBundleGetFunctionPointerForName(v20, @"Dispose");
          *(void *)(a2 + 56) = CFBundleGetFunctionPointerForName(v20, @"Process");
          *(void *)(a2 + 64) = CFBundleGetFunctionPointerForName(v20, @"Free");
          *(void *)(a2 + 72) = CFBundleGetFunctionPointerForName(v20, @"GetAttribute");
          *(void *)(a2 + 8notify((uint64_t **)lcp_lowerdown_notify, 0) = CFBundleGetFunctionPointerForName(v20, @"InteractiveUI");
          *(void *)(a2 + 88) = CFBundleGetFunctionPointerForName(v20, @"PrintPacket");
          uint64_t v21 = 0LL;
          *(void *)(a2 + 96) = CFBundleGetFunctionPointerForName(v20, @"Identity");
          *(void *)(a2 + 32) = v20;
LABEL_19:
          CFRelease(v6);
          return v21;
        }

        CFRelease(v20);
      }
    }

    uint64_t v21 = 0xFFFFFFFFLL;
    goto LABEL_19;
  }

  return 0xFFFFFFFFLL;
}

uint64_t publish_keyentry(const __CFString *key, const void *a2, const void *a3)
{
  if (!cfgCache) {
    return 0LL;
  }
  if (key
    && publish_dict
    && CFDictionaryContainsKey((CFDictionaryRef)publish_dict, key)
    && (Value = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)publish_dict, key)) != 0LL)
  {
    CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0LL, 0LL, Value);
  }

  else
  {
    CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }

  uint64_t v8 = MutableCopy;
  if (!MutableCopy) {
    return 0LL;
  }
  CFDictionarySetValue(MutableCopy, a2, a3);
  if (!sub_10001A5F8(key, v8))
  {
    int v9 = SCError();
    int v10 = SCErrorString(v9);
    warning("publish_entry SCDSet() failed: %s\n", v11, v12, v13, v14, v15, v16, v17, v10);
  }

  CFRelease(v8);
  return 1LL;
}

uint64_t unpublish_keyentry(const __CFString *key, const void *a2)
{
  if (cfgCache)
  {
    if (key)
    {
      if (publish_dict)
      {
        if (CFDictionaryContainsKey((CFDictionaryRef)publish_dict, key))
        {
          Value = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)publish_dict, key);
          if (Value)
          {
            CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0LL, 0LL, Value);
            if (MutableCopy)
            {
              uint64_t v6 = MutableCopy;
              CFDictionaryRemoveValue(MutableCopy, a2);
              if (!sub_10001A5F8(key, v6))
              {
                int v7 = SCError();
                int v8 = SCErrorString(v7);
                warning("unpublish_keyentry SCDSet() failed: %s\n", v9, v10, v11, v12, v13, v14, v15, v8);
              }

              CFRelease(v6);
            }
          }
        }
      }
    }
  }

  return 0LL;
}

double getabsolutetime(uint64_t a1)
{
  double result = *(double *)&timeScaleSeconds;
  if (*(double *)&timeScaleSeconds != 0.0)
  {
    uint64_t v3 = mach_absolute_time();
    double v4 = *(double *)&timeScaleSeconds * (double)v3;
    *(void *)a1 = (uint64_t)v4;
    double result = (double)(uint64_t)v4 * -1000000.0 + (double)v3 * *(double *)&timeScaleMicroSeconds;
    *(_DWORD *)(a1 + 8) = (int)result;
  }

  return result;
}

const char *sys_publish_remoteaddress(const char *result)
{
  if (result) {
    return (const char *)publish_dictstrentry(kSCEntNetPPP, kSCPropNetPPPCommRemoteAddress, result, 0x8000100u);
  }
  return result;
}

uint64_t sys_reinit()
{
  cfgCache = (uint64_t)SCDynamicStoreCreate(0LL, @"pppd", 0LL, 0LL);
  if (!cfgCache)
  {
    int v2 = SCError();
    int v3 = SCErrorString(v2);
    fatal("SCDynamicStoreCreate failed: %s", v4, v5, v6, v7, v8, v9, v10, v3);
  }

  pid_t v0 = getpid();
  return publish_dictnumentry(kSCEntNetPPP, @"pid", v0);
}

uint64_t route_gateway(int a1, int a2, int a3, int a4, int a5)
{
  int v26 = a3;
  int v27 = a2;
  int v25 = a4;
  int v10 = socket(17, 3, 17);
  if (v10 < 0)
  {
    uint64_t v14 = __error();
    uint64_t v15 = strerror(*v14);
    uint64_t v16 = addr2ascii(2, &v27, 4, v42);
    uint64_t v17 = addr2ascii(2, &v26, 4, v41);
    CFIndex v18 = addr2ascii(2, &v25, 4, v40);
    sys_log( 6,  "host_gateway: open routing socket failed, %s. (address %s, mask %s, gateway %s, use-gateway %d).",  v15,  v16,  v17,  v18,  a5);
  }

  else
  {
    int v11 = v10;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    uint64_t v39 = 0LL;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v33 = 0u;
    char v30 = a1;
    if (a5) {
      unsigned int v12 = 2051;
    }
    else {
      unsigned int v12 = 2049;
    }
    char v29 = 5;
    LODWORD(v32) = 1;
    *(void *)((char *)&v31 + 4) = v12 | 0x700000000LL;
    WORD4(v36) = 528;
    HIDWORD(v36) = a2;
    WORD4(v37) = 528;
    HIDWORD(v37) = a4;
    WORD4(v38) = 528;
    HIDWORD(v38) = a3;
    __int16 __buf = 140;
    if ((write(v10, &__buf, 0x8CuLL) & 0x8000000000000000LL) == 0)
    {
      close(v11);
      return 1LL;
    }

    if (a1 == 2) {
      int v19 = 7;
    }
    else {
      int v19 = 3;
    }
    int v20 = __error();
    uint64_t v21 = strerror(*v20);
    uint64_t v22 = addr2ascii(2, &v27, 4, v42);
    uint64_t v23 = addr2ascii(2, &v26, 4, v41);
    uint64_t v24 = addr2ascii(2, &v25, 4, v40);
    sys_log( v19,  "host_gateway: write routing socket failed, %s. (address %s, mask %s, gateway %s, use-gateway %d).",  v21,  v22,  v23,  v24,  a5);
    close(v11);
  }

  return 0LL;
}

uint64_t ppp_ip_probe_send( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!session || !*(_DWORD *)session) {
    return 0xFFFFFFFFLL;
  }
  if_nametoindex(*(const char **)(session + 16));
  uint64_t v15 = session;
  *(_DWORD *)(session + 312) = 0;
  if (*(_BYTE *)(v15 + 253) != 2 || !*(_DWORD *)(v15 + 256))
  {
    info("%s: no goog-dns address", v8, v9, v10, v11, v12, v13, v14, (int)"ppp_ip_probe_send");
    goto LABEL_8;
  }

  dbglog("%s: found goog-dns address", v8, v9, v10, v11, v12, v13, v14, (int)"ppp_ip_probe_send");
  int v16 = sub_10001BBD4();
  *(_DWORD *)(session + 30notify((uint64_t **)lcp_lowerdown_notify, 0) = v16;
  if (v16 == -1)
  {
LABEL_8:
    int v31 = 0;
    goto LABEL_9;
  }

  add_fd(v16);
  dbglog("%s: sent to goog-dns over scope %d", v24, v25, v26, v27, v28, v29, v30, (int)"ppp_ip_probe_send");
  int v31 = 1;
LABEL_9:
  if (*(_BYTE *)(session + 269) != 2 || !*(_DWORD *)(session + 272))
  {
    uint64_t v56 = "%s: no peer address";
LABEL_19:
    dbglog(v56, v17, v18, v19, v20, v21, v22, v23, (int)"ppp_ip_probe_send");
LABEL_20:
    if (v31) {
      goto LABEL_21;
    }
    return 0xFFFFFFFFLL;
  }

  dbglog("%s: found peer address", v17, v18, v19, v20, v21, v22, v23, (int)"ppp_ip_probe_send");
  int v32 = sub_10001BBD4();
  uint64_t v33 = session;
  *(_DWORD *)(session + 304) = v32;
  if (v32 != -1)
  {
    add_fd(v32);
    dbglog("%s: sent to peer over scope %d", v34, v35, v36, v37, v38, v39, v40, (int)"ppp_ip_probe_send");
    ++v31;
    uint64_t v33 = session;
  }

  if (*(_BYTE *)(v33 + 285) != 2 || !*(_DWORD *)(v33 + 288))
  {
    uint64_t v56 = "%s: no alternate peer address";
    goto LABEL_19;
  }

  dbglog("%s: found alternate peer address", v17, v18, v19, v20, v21, v22, v23, (int)"ppp_ip_probe_send");
  int v41 = sub_10001BBD4();
  *(_DWORD *)(session + 308) = v41;
  if (v41 == -1) {
    goto LABEL_20;
  }
  add_fd(v41);
  info("%s: sent to alternate peer over scope %d", v49, v50, v51, v52, v53, v54, v55, (int)"ppp_ip_probe_send");
LABEL_21:
  dbglog("%s: %d probes sent", v42, v43, v44, v45, v46, v47, v48, (int)"ppp_ip_probe_send");
  uint64_t v57 = session;
  ++*(_DWORD *)(session + 316);
  if (!*(_DWORD *)(v57 + 248))
  {
    *(_DWORD *)(v57 + 248) = 1;
    timeout((int)sub_10001BD3C);
  }

  return 0LL;
}

uint64_t sub_10001BBD4()
{
  uint64_t v0 = __chkstk_darwin();
  unsigned __int16 v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = v0;
  int v12 = v1;
  if ((v0 & 0x80000000) != 0)
  {
    int v8 = v1;
    uint64_t v9 = socket(2, 2, 1);
    if ((v9 & 0x80000000) != 0) {
      return 0xFFFFFFFFLL;
    }
    uint64_t v6 = v9;
    if (v8 && setsockopt(v9, 0, 25, &v12, 4u))
    {
LABEL_3:
      close(v6);
      return 0xFFFFFFFFLL;
    }

    int v11 = 65663;
    setsockopt(v6, 0xFFFF, 4098, &v11, 4u);
  }

  v13.i32[0] = 8;
  v13.i16[3] = htons(v3);
  v13.i16[2] = getpid();
  unsigned int v7 = vaddvq_s32((int32x4_t)vmovl_u16(v13));
  v13.i16[1] = ~(HIWORD(v7) + v7 + ((HIWORD(v7) + (unsigned __int16)v7) >> 16));
  return v6;
}

void sub_10001BD3C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  if (session
    && *(_DWORD *)session
    && (*(int *)(session + 316) > 14 || ppp_ip_probe_send(a1, a2, a3, a4, a5, a6, a7, a8)))
  {
    error("ppp_auxiliary_probe timed out", a2, a3, a4, a5, a6, a7, a8, a9);
  }

uint64_t ppp_ip_probe_stop()
{
  uint64_t v0 = session;
  if (!session || !*(_DWORD *)session) {
    return 0xFFFFFFFFLL;
  }
  if (*(_DWORD *)(session + 248))
  {
    *(_DWORD *)(session + 248) = 0;
    untimeout((uint64_t)sub_10001BD3C, 0LL);
    dbglog("ppp_auxiliary_probe stopped", v1, v2, v3, v4, v5, v6, v7, v11);
    uint64_t v0 = session;
  }

  for (uint64_t i = 300LL; i != 312; i += 4LL)
  {
    int v9 = *(_DWORD *)(v0 + i);
    if (v9 >= 1)
    {
      remove_fd(v9);
      close(*(_DWORD *)(session + i));
      uint64_t v0 = session;
      *(_DWORD *)(session + i) = -1;
    }
  }

  uint64_t result = 0LL;
  *(void *)(v0 + 312) = 0LL;
  return result;
}

double ppp_session_clear(uint64_t a1)
{
  if (a1)
  {
    *(void *)(a1 + 32notify((uint64_t **)lcp_lowerdown_notify, 0) = 0LL;
    double result = 0.0;
    *(_OWORD *)(a1 + 288) = 0u;
    *(_OWORD *)(a1 + 304) = 0u;
    *(_OWORD *)(a1 + 256) = 0u;
    *(_OWORD *)(a1 + 272) = 0u;
    *(_OWORD *)(a1 + 224) = 0u;
    *(_OWORD *)(a1 + 24notify((uint64_t **)lcp_lowerdown_notify, 0) = 0u;
    *(_OWORD *)(a1 + 192) = 0u;
    *(_OWORD *)(a1 + 208) = 0u;
    *(_OWORD *)(a1 + 16notify((uint64_t **)lcp_lowerdown_notify, 0) = 0u;
    *(_OWORD *)(a1 + 176) = 0u;
    *(_OWORD *)(a1 + 128) = 0u;
    *(_OWORD *)(a1 + 144) = 0u;
    *(_OWORD *)(a1 + 96) = 0u;
    *(_OWORD *)(a1 + 112) = 0u;
    *(_OWORD *)(a1 + 64) = 0u;
    *(_OWORD *)(a1 + 8notify((uint64_t **)lcp_lowerdown_notify, 0) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_DWORD *)(a1 + 308) = -1;
    *(void *)(a1 + 30notify((uint64_t **)lcp_lowerdown_notify, 0) = -1LL;
  }

  return result;
}

BOOL ppp_variable_echo_is_off()
{
  return !session || !*(_DWORD *)session || wait_underlying_interface_up == 0;
}

void ppp_variable_echo_start( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (session && *(_DWORD *)session && (wait_underlying_interface_up != 0) | byte_100047964 & 1 && !lcp_echos_hastened)
  {
    dbglog("ppp_variable_echo_start", a2, a3, a4, a5, a6, a7, a8, v8);
    lcp_echo_interval_slow = lcp_echo_interval;
    lcp_echo_interval = 1;
    lcp_echo_fails_slow = lcp_echo_fails;
    if (lcp_echo_fails >= 11) {
      lcp_echo_fails = 10;
    }
    lcp_echos_hastened = 1;
    lcp_echo_restart(0);
  }

void ppp_variable_echo_stop( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (session && *(_DWORD *)session)
  {
    else {
      BOOL v8 = byte_100047964 == 0;
    }
    if (!v8)
    {
      dbglog("received echo-reply, ppp_variable_echo_stop!", a2, a3, a4, a5, a6, a7, a8, v9);
      wait_underlying_interface_up = 0;
      byte_100047964 = 0;
      if (lcp_echos_hastened)
      {
        lcp_echo_interval = lcp_echo_interval_slow;
        lcp_echo_fails = lcp_echo_fails_slow;
        lcp_echos_hastened = 0;
      }
    }
  }

void ppp_auxiliary_probe_ip_up()
{
  byte_100047968 = 1;
}

void ppp_auxiliary_probe_ip_down()
{
  byte_100047968 = 0;
}

void *ppp_auxiliary_probe_init()
{
  dword_10004796C = 0;
  dword_100047970 = 0;
  if ((byte_100047974 & 1) == 0)
  {
    add_notifier(&ip_up_notify, (uint64_t)ppp_auxiliary_probe_ip_up, 0LL);
    double result = add_notifier(&ip_down_notify, (uint64_t)ppp_auxiliary_probe_ip_down, 0LL);
    byte_100047974 = 1;
  }

  return result;
}

uint64_t ppp_auxiliary_probe_stop()
{
  uint64_t result = ppp_ip_probe_stop();
  dword_10004796C = 0;
  dword_100047970 = 0;
  return result;
}

void ppp_auxiliary_probe_check( int a1, void (*a2)(uint64_t), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1 >= 2)
  {
    BOOL v8 = byte_100047968 && wait_underlying_interface_up == 0;
    if (v8 && (byte_100047964 & 1) == 0)
    {
      int v9 = dword_10004796C;
      if (dword_10004796C)
      {
        ++dword_10004796C;
        if (v9 >= 1 && dword_100047970 != 0)
        {
          error("no echo-reply, despite successful ppp_auxiliary_probe!", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v20);
          if (a2) {
            a2(a3);
          }
        }
      }

      else
      {
        error("no echo-reply, start ppp_auxiliary_probe!", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v20);
        ppp_ip_probe_send(v12, v13, v14, v15, v16, v17, v18, v19);
        dword_10004796C = 1;
        dword_100047970 = 0;
      }
    }
  }

void ppp_process_auxiliary_probe_input()
{
  uint64_t v0 = session;
  if (session && *(_DWORD *)session)
  {
    int v1 = 0;
    for (uint64_t i = 75LL; i != 78; ++i)
    {
      int v3 = *(_DWORD *)(v0 + 4 * i);
      if (v3 >= 1)
      {
        int ready = is_ready_fd(v3);
        uint64_t v0 = session;
        if (ready)
        {
          int v12 = 0;
          read(*(_DWORD *)(session + 4 * i), &v12, 1uLL);
          remove_fd(*(_DWORD *)(session + 4 * i));
          if (v12 >= 1)
          {
            ++*(_DWORD *)(session + 312);
            ++v1;
            dbglog("ppp_auxiliary_probe[%d] response!", v5, v6, v7, v8, v9, v10, v11, i - 75);
          }

          close(*(_DWORD *)(session + 4 * i));
          uint64_t v0 = session;
          *(_DWORD *)(session + 4 * i) = -1;
        }
      }
    }

    if (v1)
    {
      if (*(_DWORD *)(v0 + 248))
      {
        *(_DWORD *)(v0 + 248) = 0;
        untimeout((uint64_t)sub_10001BD3C, 0LL);
      }

      if (dword_10004796C) {
        ++dword_100047970;
      }
    }
  }

void ppp_start_public_nat_port_mapping_timer( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (session && *(_DWORD *)session && !*(_DWORD *)(session + 32) && !*(_DWORD *)(session + 36))
  {
    notice("starting wait-port-mapping timer for %s: %d secs", a2, a3, a4, a5, a6, a7, a8, *(void *)(session + 8));
    timeout((int)sub_10001C328);
    *(_DWORD *)(session + 36) = 1;
  }

void sub_10001C328()
{
  if (session && *(_DWORD *)session && *(_DWORD *)(session + 36))
  {
    *(_DWORD *)(session + 36) = 0;
    sys_log(3, "NAT's public interface down for more than %d secs... starting faster probe.\n", 20);
    uint64_t v0 = *(void (**)(void))(session + 240);
    if (v0)
    {
      byte_100047964 = 1;
      v0();
    }
  }

void ppp_stop_public_nat_port_mapping_timer()
{
  if (session && *(_DWORD *)session)
  {
    if (*(_DWORD *)(session + 36))
    {
      untimeout((uint64_t)sub_10001C328, 0LL);
      *(_DWORD *)(session + 36) = 0;
    }
  }

void ppp_block_public_nat_port_mapping_timer()
{
  if (session)
  {
    if (*(_DWORD *)session)
    {
      ppp_stop_public_nat_port_mapping_timer();
      *(_DWORD *)(session + 32) = 1;
    }
  }

void ppp_unblock_public_nat_port_mapping_timer()
{
  if (session)
  {
    if (*(_DWORD *)session) {
      *(_DWORD *)(session + 32) = 0;
    }
  }

uint64_t sys_setup_security_session()
{
  if (qword_100047978 != -1) {
    dispatch_once(&qword_100047978, &stru_100038B48);
  }
  if (!byte_100047975) {
    return setup_security_context();
  }
  *(void *)special_port = 0LL;
  if (qword_100047988 != -1) {
    dispatch_once(&qword_100047988, &stru_100038BB0);
  }
  if (qword_100047980)
  {
    BOOL v0 = 1LL;
    if (ne_session_copy_security_session_info(qword_100047980, &special_port[1], special_port)
      && special_port[1]
      && special_port[0]
      && !task_set_special_port(mach_task_self_, 4, special_port[1]))
    {
      BOOL v0 = audit_session_join(special_port[0]) == 0;
    }
  }

  else
  {
    BOOL v0 = 1LL;
  }

  if (special_port[1]) {
    mach_port_deallocate(mach_task_self_, special_port[1]);
  }
  if (special_port[0]) {
    mach_port_deallocate(mach_task_self_, special_port[0]);
  }
  return v0;
}

void sub_10001C584(id a1)
{
  byte_100047975 = getenv("NetworkExtension") != 0LL;
}

uint64_t sub_10001C5B0(uint64_t a1, xpc_object_t object)
{
  if (object) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_retain(object);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_10001C5E8(id a1)
{
  int v1 = getenv("NetworkExtension");
  if (v1)
  {
    if (!uuid_parse(v1, uu)) {
      qword_100047980 = ne_session_create(uu, 1LL);
    }
  }

const char *tdb_error(uint64_t a1)
{
  if (!a1) {
    return "Invalid tdb context";
  }
  uint64_t v1 = 0LL;
  int v2 = *(_DWORD *)(a1 + 40);
  uint64_t result = "Invalid error code";
  while (v2 != dword_100038C10[v1])
  {
    v1 += 4LL;
    if (v1 == 24) {
      return result;
    }
  }

  return *(const char **)&dword_100038C10[v1 + 2];
}

uint64_t tdb_update(_DWORD *a1, char *a2, size_t a3, const void *a4, uint64_t a5)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  int v10 = 596579247 * a3;
  if (a3)
  {
    unsigned int v11 = 0;
    uint64_t v12 = 0LL;
    do
    {
      v10 += a2[v12++] << (v11 % 0x18);
      v11 += 5;
    }

    while (a3 > v12);
  }

  unsigned int v13 = 1103515243 * v10 + 12345;
  sub_10001C810((uint64_t)a1, v13 % a1[20]);
  unsigned int v14 = sub_10001C898(a1, a2, a3, v13, v18);
  if (!v14
    || a5 + a3 > v18[0]
    || (unsigned int v15 = v14, sub_10001C990((uint64_t)a1, v14 + v18[2] + 24, a4, a5) == -1))
  {
    uint64_t v16 = 0xFFFFFFFFLL;
  }

  else if (a5 == v19)
  {
    uint64_t v16 = 0LL;
  }

  else
  {
    int v19 = a5;
    uint64_t v16 = sub_10001C990((uint64_t)a1, v15, v18, 0x18u);
  }

  sub_10001CA2C((uint64_t)a1, v13 % a1[20]);
  return v16;
}

uint64_t sub_10001C810(uint64_t a1, int a2)
{
  if (a2 < -1) {
    return 0xFFFFFFFFLL;
  }
  if (*(_DWORD *)(a1 + 80) > a2)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = (a2 + 1);
    int v6 = *(_DWORD *)(v4 + 4LL * v5);
    if (v6)
    {
LABEL_5:
      uint64_t result = 0LL;
      *(_DWORD *)(v4 + 4 * v5) = v6 + 1;
      return result;
    }

    if (!sub_10001DE08((_DWORD *)a1, 4 * a2 + 1024, 1, 3, 9))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v6 = *(_DWORD *)(v4 + 4 * v5);
      goto LABEL_5;
    }
  }

  return 0xFFFFFFFFLL;
}

void *sub_10001C898(_DWORD *a1, const void *a2, size_t a3, unsigned int a4, unsigned int *a5)
{
  if (sub_10001D96C((uint64_t)a1, 4 * (a4 % a1[20]) + 44, &v15, 4u) != -1)
  {
    unsigned int v10 = v15;
    if (v15)
    {
      while (sub_10001CE88(a1, v10, a5) != -1)
      {
        if (a5[4] == a4)
        {
          size_t v11 = a5[2];
          if (a3 == v11)
          {
            uint64_t result = sub_10001CBD8((uint64_t)a1, v15 + 24, v11);
            if (!result) {
              return result;
            }
            unsigned int v13 = result;
            int v14 = memcmp(a2, result, a3);
            free(v13);
            if (!v14) {
              return (void *)v15;
            }
          }
        }

        unsigned int v10 = a5[1];
        unsigned int v15 = v10;
        if (!v10) {
          return 0LL;
        }
      }
    }
  }

  return 0LL;
}

uint64_t sub_10001C990(uint64_t a1, unsigned int a2, const void *a3, unsigned int a4)
{
  uint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    memcpy((void *)(v9 + a2), a3, a4);
  }

  else if (lseek(*(_DWORD *)(a1 + 16), a2, 0) != a2 || write(*(_DWORD *)(a1 + 16), a3, a4) != a4)
  {
    *(_DWORD *)(a1 + 4notify((uint64_t **)lcp_lowerdown_notify, 0) = 2;
    return 0xFFFFFFFFLL;
  }

  return 0LL;
}

uint64_t sub_10001CA2C(uint64_t a1, int a2)
{
  if (a2 < -1) {
    return 0xFFFFFFFFLL;
  }
  if (*(_DWORD *)(a1 + 80) <= a2) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = (a2 + 1);
  int v6 = *(_DWORD *)(v4 + 4LL * v5);
  if (v6 == 1)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = *(_DWORD *)(v4 + 4 * v5);
  }

  else if (!v6)
  {
    *(_DWORD *)(a1 + 4notify((uint64_t **)lcp_lowerdown_notify, 0) = 3;
    return 0xFFFFFFFFLL;
  }

  uint64_t result = 0LL;
  *(_DWORD *)(v4 + 4 * v5) = v6 - 1;
  return result;
}

void *tdb_fetch(_DWORD *a1, char *a2, size_t a3)
{
  if (!a1) {
    return 0LL;
  }
  int v6 = 596579247 * a3;
  if (a3)
  {
    unsigned int v7 = 0;
    uint64_t v8 = 0LL;
    do
    {
      v6 += a2[v8++] << (v7 % 0x18);
      v7 += 5;
    }

    while (a3 > v8);
  }

  unsigned int v9 = 1103515243 * v6 + 12345;
  sub_10001C810((uint64_t)a1, v9 % a1[20]);
  unsigned int v10 = sub_10001C898(a1, a2, a3, v9, v13);
  if (v10) {
    size_t v11 = sub_10001CBD8((uint64_t)a1, v10 + v13[2] + 24, v13[3]);
  }
  else {
    size_t v11 = 0LL;
  }
  sub_10001CA2C((uint64_t)a1, v9 % a1[20]);
  return v11;
}

void *sub_10001CBD8(uint64_t a1, unsigned int a2, size_t __size)
{
  unsigned int v3 = __size;
  int v6 = malloc(__size);
  if (v6)
  {
    if (sub_10001D96C(a1, a2, v6, v3) == -1)
    {
      free(v6);
      return 0LL;
    }
  }

  else
  {
    *(_DWORD *)(a1 + 4notify((uint64_t **)lcp_lowerdown_notify, 0) = 4;
  }

  return v6;
}

_DWORD *tdb_exists(_DWORD *result, char *a2, size_t a3)
{
  if (result)
  {
    uint64_t v5 = result;
    int v6 = 596579247 * a3;
    if (a3)
    {
      unsigned int v7 = 0;
      uint64_t v8 = 0LL;
      do
      {
        v6 += a2[v8++] << (v7 % 0x18);
        v7 += 5;
      }

      while (a3 > v8);
    }

    unsigned int v9 = 1103515243 * v6 + 12345;
    sub_10001C810((uint64_t)result, v9 % result[20]);
    unsigned int v10 = sub_10001C898(v5, a2, a3, v9, v11);
    sub_10001CA2C((uint64_t)v5, v9 % v5[20]);
    return (_DWORD *)(v10 != 0);
  }

  return result;
}

uint64_t tdb_traverse( _DWORD *a1, unsigned int (*a2)(_DWORD *, char *, void, char *, void, uint64_t), uint64_t a3)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (!a1[20]) {
    return 0LL;
  }
  uint64_t v6 = 0LL;
  unsigned int v7 = 0;
  while (1)
  {
    sub_10001C810((uint64_t)a1, v7);
    unsigned int v8 = v16;
    if (v16)
    {
      while (sub_10001CE88(a1, v8, &v12) != -1)
      {
        unsigned int v9 = (char *)sub_10001CBD8((uint64_t)a1, v16 + 24, v15 + v14);
        if (!v9) {
          break;
        }
        unsigned int v10 = v9;
        uint64_t v6 = (v6 + 1);
        if (a2 && a2(a1, v9, v14, &v9[v14], v15, a3))
        {
          free(v10);
          goto LABEL_17;
        }

        free(v10);
        unsigned int v8 = v13;
        unsigned int v16 = v13;
        if (!v13) {
          goto LABEL_11;
        }
      }

      break;
    }

LABEL_11:
    sub_10001CA2C((uint64_t)a1, v7 % a1[20]);
    if (++v7 >= a1[20]) {
      return v6;
    }
  }

  uint64_t v6 = 0xFFFFFFFFLL;
LABEL_17:
  sub_10001CA2C((uint64_t)a1, v7 % a1[20]);
  return v6;
}

  unsigned int v7 = (char *)&eap + 416 * a1;
  *((_DWORD *)v7 + 1) = 0;
  *((_DWORD *)v7 + 2) = 0;
  unsigned int v8 = *((void *)v7 + 40);
  if (v8)
  {
    unsigned int v9 = v7 + 320;
    unsigned int v10 = (char *)&eap + 416 * a1;
    (*(void (**)(void))(v8 + 48))(*((void *)v10 + 41));
    free(*((void **)v10 + 42));
    free(*((void **)v10 + 43));
    uint64_t result = 0.0;
    *unsigned int v9 = 0u;
    v9[1] = 0u;
  }

  size_t v11 = (char *)&eap + 416 * a1;
  unsigned int v12 = *((void *)v11 + 48);
  if (v12)
  {
    unsigned int v13 = v11 + 384;
    unsigned int v14 = (char *)&eap + 416 * a1;
    (*(void (**)(void))(v12 + 48))(*((void *)v14 + 49));
    free(*((void **)v14 + 50));
    free(*((void **)v14 + 51));
    uint64_t result = 0.0;
    *unsigned int v13 = 0u;
    v13[1] = 0u;
  }

  return result;
}

uint64_t sub_10001CE88(_DWORD *a1, unsigned int a2, unsigned int *a3)
{
  uint64_t result = sub_10001D96C((uint64_t)a1, a2, a3, 0x18u);
  if ((_DWORD)result != -1)
  {
    if (a3[5] == 637606297)
    {
      else {
        return 0LL;
      }
    }

    else
    {
      a1[10] = 1;
      return 0xFFFFFFFFLL;
    }
  }

  return result;
}

void *tdb_firstkey(_DWORD *a1)
{
  if (a1)
  {
    unsigned int v9 = 0;
    if (a1[20])
    {
      unsigned int v2 = 0;
      unsigned int v3 = 44;
      while (1)
      {
        sub_10001C810((uint64_t)a1, v2);
        unsigned int v4 = v9;
        if (v9) {
          goto LABEL_8;
        }
        sub_10001CA2C((uint64_t)a1, v2 % a1[20]);
        ++v2;
        v3 += 4;
        if (v2 >= a1[20])
        {
          unsigned int v4 = v9;
          if (!v9) {
            return 0LL;
          }
LABEL_8:
          if (sub_10001CE88(a1, v4, &v7) != -1)
          {
            uint64_t v5 = sub_10001CBD8((uint64_t)a1, v9 + 24, __size);
            sub_10001CA2C((uint64_t)a1, v2 % a1[20]);
            return v5;
          }

          break;
        }
      }

      sub_10001CA2C((uint64_t)a1, v2 % a1[20]);
    }
  }

  return 0LL;
}

void *tdb_nextkey(_DWORD *a1, char *a2, size_t a3)
{
  if (a1)
  {
    int v6 = 596579247 * a3;
    if (a3)
    {
      unsigned int v7 = 0;
      uint64_t v8 = 0LL;
      do
      {
        v6 += a2[v8++] << (v7 % 0x18);
        v7 += 5;
      }

      while (a3 > v8);
    }

    unsigned int v9 = 1103515243 * v6 + 12345;
    unsigned int v10 = v9 % a1[20];
    sub_10001C810((uint64_t)a1, v10);
    unsigned int v17 = sub_10001C898(a1, a2, a3, v9, v15);
    if (v17) {
      unsigned int v17 = v15[1];
    }
    while (!v17)
    {
      sub_10001CA2C((uint64_t)a1, v10++);
      unsigned int v11 = a1[20];
      if (v10 >= v11 - 1) {
        return 0LL;
      }
      unsigned int v12 = 4 * (v10 % v11) + 44;
      sub_10001C810((uint64_t)a1, v10);
    }

    if (sub_10001CE88(a1, v17, v15) != -1)
    {
      unsigned int v13 = sub_10001CBD8((uint64_t)a1, v17 + 24, __size);
      sub_10001CA2C((uint64_t)a1, v10);
      return v13;
    }

uint64_t tdb_delete(_DWORD *a1, char *a2, size_t a3)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  int v6 = 596579247 * a3;
  if (a3)
  {
    unsigned int v7 = 0;
    uint64_t v8 = 0LL;
    do
    {
      v6 += a2[v8++] << (v7 % 0x18);
      v7 += 5;
    }

    while (a3 > v8);
  }

  unsigned int v9 = 1103515243 * v6 + 12345;
  sub_10001C810((uint64_t)a1, v9 % a1[20]);
  if (sub_10001D96C((uint64_t)a1, 4 * (v9 % a1[20]) + 44, &v25, 4u) != -1)
  {
    unsigned int v10 = v25;
    if (v25)
    {
      unsigned int v11 = 0;
      while (sub_10001CE88(a1, v10, (unsigned int *)__size) != -1)
      {
        if (v9 == (_DWORD)v24 && a3 == LODWORD(__size[1]))
        {
          unsigned int v12 = sub_10001CBD8((uint64_t)a1, v25 + 24, LODWORD(__size[1]));
          if (!v12) {
            break;
          }
          unsigned int v13 = v12;
          if (!memcmp(a2, v12, a3))
          {
            if (v11)
            {
              DWORD1(v21) = HIDWORD(__size[0]);
              unsigned int v17 = (char *)&v21;
              uint64_t v18 = (uint64_t)a1;
              unsigned int v19 = v11;
              unsigned int v20 = 24;
            }

            else
            {
              unsigned int v19 = 4 * (v9 % a1[20]) + 44;
              uint64_t v18 = (uint64_t)a1;
              unsigned int v17 = (char *)__size + 4;
              unsigned int v20 = 4;
            }

            if (sub_10001C990(v18, v19, v17, v20) == -1)
            {
              free(v13);
              break;
            }

            sub_10001CA2C((uint64_t)a1, v9 % a1[20]);
            sub_10001C810((uint64_t)a1, -1);
            if (sub_10001D96C((uint64_t)a1, 0x28u, (char *)__size + 4, 4u) != -1)
            {
              HIDWORD(v24) = -637606298;
              if (sub_10001C990((uint64_t)a1, v25, __size, 0x18u) != -1
                && sub_10001C990((uint64_t)a1, 0x28u, &v25, 4u) != -1)
              {
                free(v13);
                uint64_t v15 = 0LL;
                int v14 = -1;
                goto LABEL_17;
              }
            }

            free(v13);
            int v14 = -1;
            goto LABEL_16;
          }

          free(v13);
        }

        unsigned int v11 = v25;
        __int128 v21 = *(_OWORD *)__size;
        uint64_t v22 = v24;
        unsigned int v10 = HIDWORD(__size[0]);
        unsigned int v25 = HIDWORD(__size[0]);
        if (!HIDWORD(__size[0])) {
          break;
        }
      }
    }
  }

  int v14 = v9 % a1[20];
LABEL_16:
  uint64_t v15 = 0xFFFFFFFFLL;
LABEL_17:
  sub_10001CA2C((uint64_t)a1, v14);
  return v15;
}

uint64_t tdb_store(uint64_t a1, char *a2, unint64_t a3, const void *a4, size_t a5, int a6)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  int v12 = 596579247 * a3;
  if (a3)
  {
    unsigned int v13 = 0;
    uint64_t v14 = 0LL;
    do
    {
      v12 += a2[v14++] << (v13 % 0x18);
      v13 += 5;
    }

    while (a3 > v14);
  }

  if (a6 == 2)
  {
    if (tdb_exists((_DWORD *)a1, a2, a3))
    {
      *(_DWORD *)(a1 + 4notify((uint64_t **)lcp_lowerdown_notify, 0) = 5;
      return 0xFFFFFFFFLL;
    }
  }

  else if (!tdb_update((_DWORD *)a1, a2, a3, a4, a5))
  {
    return 0LL;
  }

  sub_10001C810(a1, -1);
  if (sub_10001D96C(a1, 0x28u, &v46, 4u) != -1)
  {
    unsigned int v40 = 1103515243 * v12 + 12345;
    size_t v16 = a5 + a3;
    while (1)
    {
      unsigned int v17 = v46;
      if (v46) {
        break;
      }
LABEL_21:
      char __buf = 0;
      sub_10001C810(a1, -1);
      sub_10001E038((_DWORD *)a1, *(_DWORD *)(a1 + 20) + 1);
      int v20 = *(_DWORD *)(a1 + 16);
      int v21 = *(_DWORD *)(a1 + 20);
      int v22 = 10 * (a5 + a3) + 240 + v21;
      if (v20 != -1)
      {
        lseek(v20, v22 | 0x1FFFu, 0);
        if (write(*(_DWORD *)(a1 + 16), &__buf, 1uLL) != 1) {
          goto LABEL_35;
        }
      }

      int v23 = (v22 & 0xFFFFE000) - v21;
      LODWORD(v49) = v23 + 8168;
      HIDWORD(v5notify((uint64_t **)lcp_lowerdown_notify, 0) = -637606298;
      int v24 = v23 + 0x2000;
      int v25 = *(_DWORD *)(a1 + 16);
      size_t v26 = (*(_DWORD *)(a1 + 20) + v23 + 0x2000);
      *(_DWORD *)(a1 + 2notify((uint64_t **)lcp_lowerdown_notify, 0) = v26;
      if (v25 == -1)
      {
        *(void *)(a1 + 8) = realloc(*(void **)(a1 + 8), v26);
        LODWORD(v26) = *(_DWORD *)(a1 + 20);
      }

      if (sub_10001C990(a1, (int)v26 - v24, &v49, 0x18u) == -1
        || (int v48 = *(_DWORD *)(a1 + 20) - v24, sub_10001C990(a1, 0x28u, &v48, 4u) == -1))
      {
LABEL_35:
        sub_10001CA2C(a1, -1);
        goto LABEL_49;
      }

      sub_10001CA2C(a1, -1);
    }

    unsigned int v18 = 0;
    while (sub_10001D96C(a1, v17, &v44, 0x18u) != -1 && HIDWORD(v45) == -637606298)
    {
      if (v44 >= v16)
      {
        if ((unint64_t)(a5 + a3) + 52 < v44)
        {
          v41[0] = v44 - (v16 & 0xFFFFFFFC) - 28;
          v41[1] = DWORD1(v44);
          v41[5] = -637606298;
          LODWORD(v44) = (v16 & 0xFFFFFFFC) + 4;
          DWORD1(v44) = (v16 & 0xFFFFFFFC) + v46 + 28;
          if (sub_10001C990(a1, DWORD1(v44), v41, 0x18u) == -1
            || sub_10001C990(a1, v46, &v44, 0x18u) == -1)
          {
            break;
          }
        }

        if (v18)
        {
          DWORD1(v42) = DWORD1(v44);
          uint64_t v27 = (char *)&v42;
          uint64_t v28 = a1;
          unsigned int v29 = v18;
          unsigned int v30 = 24;
        }

        else
        {
          uint64_t v28 = a1;
          unsigned int v29 = 40;
          uint64_t v27 = (char *)&v44 + 4;
          unsigned int v30 = 4;
        }

        uint64_t v15 = 0xFFFFFFFFLL;
        sub_10001CA2C(a1, -1);
        unsigned int v31 = v46;
        LODWORD(v44) = v46;
        if (!v46) {
          return v15;
        }
        sub_10001C810(a1, v40 % *(_DWORD *)(a1 + 80));
        if (a6 != 2) {
          tdb_delete((_DWORD *)a1, a2, a3);
        }
        if (sub_10001D96C(a1, v31, &v49, 0x18u) != -1 && HIDWORD(v50) == -637606298)
        {
          unsigned int v32 = 4 * (v40 % *(_DWORD *)(a1 + 80)) + 44;
          if (sub_10001D96C(a1, v32, (char *)&v49 + 4, 4u) != -1)
          {
            *((void *)&v49 + 1) = __PAIR64__(a5, a3);
            LODWORD(v5notify((uint64_t **)lcp_lowerdown_notify, 0) = 1103515243 * v12 + 12345;
            HIDWORD(v5notify((uint64_t **)lcp_lowerdown_notify, 0) = 637606297;
            unsigned int v33 = v16 + 24;
            uint64_t v34 = (char *)malloc(v16 + 24);
            if (v34)
            {
              uint64_t v35 = v34;
              *(_OWORD *)uint64_t v34 = v49;
              *((void *)v34 + 2) = v50;
              unsigned int v36 = v32;
              uint64_t v37 = v34 + 24;
              memcpy(v34 + 24, a2, a3);
              memcpy(&v37[a3], a4, a5);
              int v38 = sub_10001C990(a1, v31, v35, v33);
              free(v35);
              if (v38 != -1 && sub_10001C990(a1, v36, &v44, 4u) != -1)
              {
                sub_10001CA2C(a1, v40 % *(_DWORD *)(a1 + 80));
                return 0LL;
              }
            }

            else
            {
              *(_DWORD *)(a1 + 4notify((uint64_t **)lcp_lowerdown_notify, 0) = 4;
            }
          }
        }

        sub_10001CA2C(a1, v40 % *(_DWORD *)(a1 + 80));
        return 0xFFFFFFFFLL;
      }

      __int128 v42 = v44;
      uint64_t v43 = v45;
      unsigned int v18 = v46;
      unsigned int v17 = DWORD1(v44);
      unsigned int v46 = DWORD1(v44);
      if (!DWORD1(v44)) {
        goto LABEL_21;
      }
    }
  }

uint64_t sub_10001D96C(uint64_t a1, unsigned int a2, void *a3, unsigned int a4)
{
  uint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    memcpy(a3, (const void *)(v9 + a2), a4);
  }

  else if (lseek(*(_DWORD *)(a1 + 16), a2, 0) != a2 || read(*(_DWORD *)(a1 + 16), a3, a4) != a4)
  {
    *(_DWORD *)(a1 + 4notify((uint64_t **)lcp_lowerdown_notify, 0) = 2;
    return 0xFFFFFFFFLL;
  }

  return 0LL;
}

_OWORD *tdb_open(char *a1, int a2, char a3, __int16 a4, unsigned int a5)
{
  __int128 __fd = 0u;
  memset(v23, 0, sizeof(v23));
  LODWORD(__fd) = -1;
  __int128 v21 = 0uLL;
  if ((a4 & 3) != 1)
  {
    if (a2) {
      int v8 = a2;
    }
    else {
      int v8 = 128;
    }
    DWORD2(__fd) = (a4 & 3) == 0;
    if (a1)
    {
      int v9 = open(a1, a4, a5);
      LODWORD(__fd) = v9;
      if (v9 == -1) {
        goto LABEL_41;
      }
      fcntl(v9, 2, 1LL);
    }

    sub_10001DE08(&v21, 0, 1, 3, 9);
    if ((a3 & 1) != 0 && !sub_10001DE08(&v21, 4u, 1, 3, 8))
    {
      ftruncate(__fd, 0LL);
      sub_10001DE08(&v21, 4u, 0, 3, 8);
    }

    sub_10001DE08(&v21, 4u, 1, 1, 9);
    if (read(__fd, &v23[12], 0x28uLL) == 40
      && !(*(void *)&v23[12] ^ 0x656C696620424454LL | *(unsigned __int16 *)&v23[20] ^ 0xALL)
      && *(_DWORD *)&v23[44] == 637606248)
    {
      goto LABEL_14;
    }

    if ((a4 & 0x200) == 0)
    {
LABEL_41:
      if ((void)v21) {
        free((void *)v21);
      }
      goto LABEL_43;
    }

    memset(&__buf[10], 0, 22);
    strcpy(__buf, "TDB file\n");
    LODWORD(v25) = 637606248;
    HIDWORD(v25) = v8;
    lseek(__fd, 0LL, 0);
    ftruncate(__fd, 0LL);
    if ((_DWORD)__fd == -1 || write(__fd, __buf, 0x28uLL) == 40)
    {
      memset(&v20, 0, 64);
      if (v8 >= 15)
      {
        int v10 = 0;
        int v11 = 40;
        while ((_DWORD)__fd == -1 || write(__fd, &v20, 0x40uLL) == 64)
        {
          v11 += 64;
          v10 -= 16;
          if (v8 + 16 + v10 <= 30)
          {
            int v12 = -v10;
            goto LABEL_26;
          }
        }

        goto LABEL_40;
      }

      int v12 = 0;
      int v11 = 40;
LABEL_26:
      if (v12 <= v8)
      {
        int v13 = v8 - v12 + 1;
        while ((_DWORD)__fd == -1 || write(__fd, &v20, 4uLL) == 4)
        {
          v11 += 4;
          if (!--v13) {
            goto LABEL_31;
          }
        }

        goto LABEL_40;
      }

LABEL_37:
          *(void *)int v23 = calloc((*(_DWORD *)&v23[48] + 1), 4uLL);
          if (*(void *)v23)
          {
            uint64_t v15 = malloc(0x58uLL);
            if (v15)
            {
              size_t v16 = v15;
              __int128 v17 = *(_OWORD *)&v23[16];
              unsigned int v15[2] = *(_OWORD *)v23;
              v15[3] = v17;
              v15[4] = *(_OWORD *)&v23[32];
              *((void *)v15 + 1notify((uint64_t **)lcp_lowerdown_notify, 0) = *(void *)&v23[48];
              __int128 v18 = __fd;
              *uint64_t v15 = v21;
              v15[1] = v18;
              sub_10001DE08(&v21, 0, 0, 3, 9);
              return v16;
            }
          }

          goto LABEL_41;
        }

        goto LABEL_41;
      }
    }

LABEL_40:
    *(_DWORD *)&v23[8] = 2;
    goto LABEL_41;
  }

LABEL_43:
  if ((_DWORD)__fd != -1) {
    close(__fd);
  }
  if (*((void *)&v21 + 1)) {
    munmap(*((void **)&v21 + 1), DWORD1(__fd));
  }
  return 0LL;
}

    if (v54)
    {
      uint64_t v63 = a1;
      uint64_t v64 = dword_1000479A8;
      if (!__darwin_check_fd_set_overflow(dword_1000479A8, &v125, 0))
      {
        a1 = v63;
        goto LABEL_49;
      }

      uint64_t v62 = 1 << v64;
      int v61 = &v125.fds_bits[(unint64_t)v64 >> 5];
      a1 = v63;
LABEL_46:
      *v61 |= v62;
    }

uint64_t sub_10001DE08(_DWORD *a1, unsigned int a2, int a3, __int16 a4, int a5)
{
  int v6 = a1[4];
  if (v6 == -1) {
    return 0LL;
  }
  if (a1[6]) {
    return 0xFFFFFFFFLL;
  }
  if (a3 != 1) {
    a4 = 2;
  }
  __int16 v11 = a4;
  __int16 v12 = 0;
  v9[0] = a2;
  v9[1] = 1LL;
  int v10 = 0;
  uint64_t result = fcntl(v6, a5, v9);
  if ((_DWORD)result)
  {
    a1[10] = 3;
    return 0xFFFFFFFFLL;
  }

  return result;
}

uint64_t tdb_close(unsigned int *a1)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v2 = *(void **)a1;
  if (v2) {
    free(v2);
  }
  int v3 = a1[4];
  if (v3 != -1) {
    close(v3);
  }
  unsigned int v4 = (void *)*((void *)a1 + 4);
  if (v4) {
    free(v4);
  }
  uint64_t v5 = (void *)*((void *)a1 + 1);
  if (v5)
  {
    if (a1[4] == -1) {
      free(v5);
    }
    else {
      munmap(v5, a1[5]);
    }
  }

  *((void *)a1 + 1notify((uint64_t **)lcp_lowerdown_notify, 0) = 0LL;
  *((_OWORD *)a1 + 3) = 0u;
  *((_OWORD *)a1 + 4) = 0u;
  *((_OWORD *)a1 + 1) = 0u;
  *((_OWORD *)a1 + 2) = 0u;
  *(_OWORD *)a1 = 0u;
  free(a1);
  return 0LL;
}

uint64_t tdb_writelock(uint64_t a1)
{
  if (a1) {
    return sub_10001C810(a1, -1);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t tdb_writeunlock(uint64_t a1)
{
  if (a1) {
    return sub_10001CA2C(a1, -1);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t tdb_lockchain(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  int v3 = 596579247 * a3;
  if (a3)
  {
    unsigned int v4 = 0;
    uint64_t v5 = 0LL;
    do
    {
      v3 += *(char *)(a2 + v5++) << (v4 % 0x18);
      v4 += 5;
    }

    while (a3 > v5);
  }

  return sub_10001C810(a1, (1103515243 * v3 + 12345) % *(_DWORD *)(a1 + 80));
}

uint64_t tdb_unlockchain(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  int v3 = 596579247 * a3;
  if (a3)
  {
    unsigned int v4 = 0;
    uint64_t v5 = 0LL;
    do
    {
      v3 += *(char *)(a2 + v5++) << (v4 % 0x18);
      v4 += 5;
    }

    while (a3 > v5);
  }

  return sub_10001CA2C(a1, (1103515243 * v3 + 12345) % *(_DWORD *)(a1 + 80));
}

uint64_t sub_10001E038(_DWORD *a1, unsigned int a2)
{
  if (a1[5] >= a2) {
    return 0LL;
  }
  int v3 = a1[4];
  if (v3 == -1) {
    return 0LL;
  }
  fstat(v3, &v6);
  if (v6.st_size <= a2)
  {
    a1[10] = 2;
    return 0xFFFFFFFFLL;
  }

  else
  {
    uint64_t result = 0LL;
    a1[5] = v6.st_size;
  }

  return result;
}

BOOL sub_10001E0AC(char *__s2, uint64_t a2, int a3)
{
  if (!*__s2) {
    return 0LL;
  }
  unsigned int v4 = __s2;
  if (strncmp("/dev/", __s2, 5uLL))
  {
    __strlcpy_chk(v14, "/dev/", 1024LL, 1024LL);
    __strlcat_chk(v14, v4, 1024LL, 1024LL);
    unsigned int v4 = v14;
  }

  if (stat(v4, &v13) < 0)
  {
    if (!a3) {
      return *__error() != 2;
    }
    option_error("Couldn't stat %s: %m", v5, v6, v7, v8, v9, v10, v11, (int)v4);
    return 0LL;
  }

  if ((v13.st_mode & 0xF000) != 0x2000)
  {
    if (a3) {
      option_error("%s is not a character device", v5, v6, v7, v8, v9, v10, v11, (int)v4);
    }
    return 0LL;
  }

  if (a3)
  {
    __strlcpy_chk(&devnam, v4, 1024LL, 1024LL);
    *(stat *)devstat = v13;
    default_device = 0;
  }

  return 1LL;
}

uint64_t sub_10001E228(const char *a1, uint64_t a2, int a3)
{
  int v5 = strtol(a1, &__endptr, 0);
  if (__endptr == a1) {
    return 0LL;
  }
  if (*__endptr || v5 == 0) {
    return 0LL;
  }
  if (a3)
  {
    inspeed = v5;
    slprintf((int)&unk_100047994, 16, "%d");
  }

  return 1LL;
}

uint64_t sub_10001E2B0()
{
  connect_script = 0LL;
  initializer = 0LL;
  disconnect_script = 0LL;
  default_device = 1;
  LOBYTE(devnam) = 0;
  inspeed = 0;
  return 1LL;
}

uint64_t sub_10001E2F4()
{
  dword_10004392C |= 0xA0000u;
  byte_100043914 = 1;
  crtscts = -2;
  return 1LL;
}

uint64_t sub_10001E328(const char **a1)
{
  uint64_t i = *a1;
  if (**a1)
  {
    uint64_t v2 = 1LL;
    while (1)
    {
      unsigned int v3 = strtol(i, &__endptr, 16);
      uint64_t v11 = __endptr;
      if (i == __endptr) {
        break;
      }
      if (v3 > 0xFF || v3 == 94)
      {
        option_error("can't escape character 0x%x", v4, v5, v6, v7, v8, v9, v10, v3);
        uint64_t v2 = 0LL;
      }

      else
      {
        xmit_accm[v3 >> 5] |= 1 << v3;
      }

      for (uint64_t i = v11; ; ++i)
      {
        int v12 = *(unsigned __int8 *)i;
        if (v12 != 32 && v12 != 44) {
          break;
        }
      }

      if (!*i) {
        goto LABEL_15;
      }
    }

    option_error("escape parameter contains invalid hex number '%s'", v4, v5, v6, v7, v8, v9, v10, (int)i);
    return 0LL;
  }

  else
  {
    uint64_t v2 = 1LL;
LABEL_15:
    dword_1000439B4 = xmit_accm[0];
  }

  return v2;
}

uint64_t sub_10001E42C(uint64_t a1, uint64_t (*a2)(uint64_t, const char *, ...), uint64_t a3)
{
  char v4 = 0;
  int v5 = 0;
  do
  {
    while (1)
    {
      int v6 = v5 == 125 ? 127 : v5;
      if ((v4 & 1) != 0) {
        a2(a3, ",");
      }
      uint64_t result = a2(a3, "%x", v6);
      int v5 = v6 + 1;
      char v4 = 1;
      if (v6 >= 255) {
        return result;
      }
    }

    int v5 = v6 + 1;
  }

  while (v6 < 255);
  if ((v4 & 1) == 0) {
    return a2(a3, "oops # nothing escaped");
  }
  return result;
}

void tty_process_extra_options()
{
  if (notty) {
    BOOL v0 = 0;
  }
  else {
    BOOL v0 = ptycommand == 0;
  }
  if (!v0)
  {
    using_pty = 1;
    return;
  }

  using_pty = pty_socket != 0;
  if (!pty_socket)
  {
    if (default_device)
    {
      if (!isatty(0) || (uint64_t v8 = ttyname(0)) == 0LL)
      {
        option_error("no device specified and stdin is not a tty", v1, v2, v3, v4, v5, v6, v7, v16);
        goto LABEL_14;
      }

      __strlcpy_chk(&devnam, v8, 1024LL, 1024LL);
    }

uint64_t tty_check_options( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (demand) {
    BOOL v8 = connect_script == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8 && ptycommand == 0)
  {
    uint64_t v15 = "connect script is required for demand-dialling\n";
    goto LABEL_50;
  }

  if (connect_script) {
    BOOL v10 = 0;
  }
  else {
    BOOL v10 = holdoff_specified == 0;
  }
  if (v10) {
    holdoff = 0;
  }
  if (using_pty)
  {
    if (!default_device)
    {
      if (notty) {
        int v16 = "notty";
      }
      else {
        int v16 = "pty";
      }
      option_error("%s option precludes specifying device name", a2, a3, a4, a5, a6, a7, a8, (int)v16);
LABEL_51:
      exit(2);
    }

    if (ptycommand && notty)
    {
      uint64_t v15 = "pty option is incompatible with notty option";
    }

    else
    {
      if (ptycommand) {
        BOOL v11 = 0;
      }
      else {
        BOOL v11 = notty == 0;
      }
      int v12 = !v11;
      if (!pty_socket || !v12)
      {
        default_device = notty;
        lockflag = 0;
        modem = 0;
        if (notty && log_to_fd <= 1) {
          log_to_fd = -1;
        }
        goto LABEL_35;
      }

      uint64_t v15 = "socket option is incompatible with pty and notty";
    }

LABEL_50:
    option_error(v15, a2, a3, a4, a5, a6, a7, a8, v17);
    goto LABEL_51;
  }

  if ((fstat(0, &v18) & 0x80000000) == 0 && (v18.st_mode & 0xF000) == 0x2000 && v18.st_rdev == *(_DWORD *)&devstat[24])
  {
    default_device = 1;
    int v13 = fcntl(0, 3);
    if (v13 != -1 && (v13 & 3) == 2) {
      privopen = 1;
    }
  }

uint64_t connect_tty(_DWORD *a1)
{
  *a1 = -1;
  __strlcpy_chk(ppp_devnam, &devnam, 1024LL, 1024LL);
  dword_1000479A8 = -1;
  uint64_t v2 = &unk_100047000;
  dword_1000479AC = -1;
  dword_1000479A4 = -1;
  if (using_pty) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = record_file == 0;
  }
  if (!v3)
  {
    if (!get_pty(&dword_1000479A8, &dword_1000479AC, ppp_devnam, uid))
    {
      error("Couldn't allocate pseudo-tty", v4, v5, v6, v7, v8, v9, v10, v161);
      int v14 = 1;
      goto LABEL_56;
    }

    clocal = 1;
    set_up_tty(dword_1000479AC, 1);
  }

  if (lockflag && !privopen)
  {
    if ((lock((const char *)&devnam) & 0x80000000) != 0)
    {
      int v14 = 6;
      goto LABEL_56;
    }

    locked = 1;
  }

  hungup = 0;
  do_modem_hungup = 0;
  if (redialingalternate && (uint64_t v11 = altconnect_script) != 0)
  {
    uint64_t v12 = altconnect_data;
    int v13 = altconnect_data_len;
  }

  else if (doing_callback)
  {
    int v13 = 0;
    uint64_t v12 = 0LL;
    uint64_t v11 = callback_script;
  }

  else
  {
    uint64_t v11 = connect_script;
    uint64_t v12 = connect_data;
    int v13 = connect_data_len;
  }

  if (!(_BYTE)devnam)
  {
LABEL_60:
    if (kill_link) {
      return 0xFFFFFFFFLL;
    }
    *(_DWORD *)status = 9;
    if (ptycommand)
    {
      if (record_file)
      {
        fcntl(*(int *)&v165.sa_len, 2, 1LL);
        unsigned int v161 = 1;
        fcntl(SHIDWORD(__endptr), 2);
        uint64_t v54 = &unk_100045000;
        if (device_script(ptycommand, (int)__endptr, *(int *)&v165.sa_data[2], 1, 0xFFFFFFFF, 0LL, 0))
        {
          close(*(int *)&v165.sa_len);
          close(*(int *)&v165.sa_data[2]);
          close((int)__endptr);
          int v55 = HIDWORD(__endptr);
LABEL_69:
          close(v55);
          return 0xFFFFFFFFLL;
        }

        uint64_t v163 = (const void *)v12;
        int v88 = sub_10001F7A8(*(unsigned int *)&v165.sa_len, SHIDWORD(__endptr));
        close(*(int *)&v165.sa_len);
        close(*(int *)&v165.sa_data[2]);
        close((int)__endptr);
        close(SHIDWORD(__endptr));
        if (!v88) {
          return 0xFFFFFFFFLL;
        }
      }

      else
      {
        uint64_t v163 = (const void *)v12;
        notify((uint64_t **)connectscript_started_notify, 0);
        uint64_t v45 = 0xFFFFFFFFLL;
        if ((device_script(ptycommand, dword_1000479A8, dword_1000479A8, 1, 0xFFFFFFFF, 0LL, 0) & 0x80000000) != 0) {
          return v45;
        }
        dword_1000479B0 = v2[619];
        close(dword_1000479A8);
        dword_1000479A8 = -1;
        if (pty_delay)
        {
        }

        notify((uint64_t **)connectscript_finished_notify, 0);
        uint64_t v54 = (void *)&unk_100045000;
      }

      goto LABEL_95;
    }

    uint64_t v163 = (const void *)v12;
    uint64_t v56 = (const char *)pty_socket;
    if (!pty_socket)
    {
      if (notty)
      {
        uint64_t v54 = (void *)&unk_100045000;
      }

      else
      {
        uint64_t v54 = (void *)&unk_100045000;
      }

      goto LABEL_95;
    }

    __endptr = 0LL;
    uint64_t v57 = strchr((const char *)pty_socket, 58);
    if (!v57
      || (uint64_t v65 = v57, v66 = v57 + 1, v67 = strtol(v57 + 1, &__endptr, 10), v65 == v56)
      || v67 < 0
      || __endptr == v66)
    {
      int v87 = "Can't parse host:port for socket destination";
    }

    else
    {
      unsigned __int16 v68 = v67;
      char *v65 = 0;
      in_addr_t v69 = inet_addr(v56);
      if (v69 == -1)
      {
        int v70 = gethostbyname(v56);
        if (!v70)
        {
          error("%s: unknown host in socket option", v71, v72, v73, v74, v75, v76, v77, (int)v56);
          char *v65 = 58;
          return 0xFFFFFFFFLL;
        }

        in_addr_t v69 = **(_DWORD **)v70->h_addr_list;
      }

      char *v65 = 58;
      uint64_t v78 = socket(2, 1, 0);
      if ((v78 & 0x80000000) == 0)
      {
        uint64_t v79 = v78;
        *(void *)&v165.sa_len = 512LL;
        *(void *)&v165.sa_data[6] = 0LL;
        *(_WORD *)v165.sa_data = htons(v68);
        *(_DWORD *)&v165.sa_data[2] = v69;
        if (connect(v79, &v165, 0x10u) < 0)
        {
          error("Can't connect to %s: %m", v80, v81, v82, v83, v84, v85, v86, (int)v56);
          int v55 = v79;
          goto LABEL_69;
        }

        uint64_t v54 = (void *)&unk_100045000;
LABEL_95:
        if (v11)
        {
          uint64_t v89 = (_BYTE *)initializer;
          if (!*(_BYTE *)v11 && !initializer) {
            goto LABEL_134;
          }
        }

        else
        {
          uint64_t v89 = (_BYTE *)initializer;
          if (!initializer)
          {
            uint64_t v11 = 0LL;
            goto LABEL_134;
          }
        }

        if (dword_1000479A4 != -1 && !default_device && modem)
        {
          setdtr(dword_1000479A4, 0);
          sleep(1u);
          setdtr(dword_1000479A4, 1);
          uint64_t v89 = (_BYTE *)initializer;
        }

        if (v89 && *v89)
        {
          if (kill_link) {
            return 0xFFFFFFFFLL;
          }
          notify((uint64_t **)initscript_started_notify, 0);
          uint64_t v90 = device_script(initializer, dword_1000479B0, dword_1000479B0, 0, 0xFFFFFFFF, 0LL, 0);
          if ((_DWORD)v90)
          {
            error("Initializer script failed", v91, v92, v93, v94, v95, v96, v97, v161);
            int v98 = 18;
LABEL_123:
            *(_DWORD *)status = v98;
            return 0xFFFFFFFFLL;
          }

          if (kill_link)
          {
            disconnect_tty(v90, v91, v92, v93, v94, v95, v96, v97, v161);
            return 0xFFFFFFFFLL;
          }

          notify((uint64_t **)initscript_finished_notify, 0);
          info("Serial port initialized.", v99, v100, v101, v102, v103, v104, v105, v161);
        }

        if (v11 && *(_BYTE *)v11)
        {
          if (kill_link) {
            return 0xFFFFFFFFLL;
          }
          notify((uint64_t **)connectscript_started_notify, 0);
          int v106 = device_script(v11, dword_1000479B0, dword_1000479B0, 0, connector_uid, v163, v13);
          *a1 = v106;
          if (v106)
          {
            if (cancelcode == -1 || v106 != cancelcode)
            {
              error("Connect script failed", v107, v108, v109, v110, v111, v112, v113, v161);
              int v98 = 8;
              goto LABEL_123;
            }

            goto LABEL_161;
          }

          if (kill_link) {
            return 4294967294LL;
          }
          notify((uint64_t **)connectscript_finished_notify, 0);
          info("Serial connection established.", v114, v115, v116, v117, v118, v119, v120, v161);
          link_up_done = 1;
        }

        if (dword_1000479A4 != -1)
        {
          *(_DWORD *)&v165.sa_len = 0;
          if (ioctl(dword_1000479A4, 0x4004746AuLL, &v165) != -1 && (v165.sa_len & 0x40) != 0)
          {
            clocal = 0;
            set_up_tty_local(dword_1000479A4, 0);
          }
        }

        if (doing_callback == 1) {
          uint64_t v11 = 0LL;
        }
LABEL_134:
        if (!v11 && modem && (_BYTE)devnam)
        {
          ioctl(dword_1000479B0, 0x2000740EuLL, 0LL);
          while (1)
          {
            int v121 = open((const char *)&devnam, 2);
            if ((v121 & 0x80000000) == 0) {
              break;
            }
            if (*__error() != 4)
            {
              error("Failed to reopen %s: %m", v122, v123, v124, v125, v126, v127, v128, (int)&devnam);
              *(_DWORD *)status = 7;
            }

            if (!persist) {
              return 0xFFFFFFFFLL;
            }
            uint64_t v45 = 0xFFFFFFFFLL;
            if (*__error() == 4 && !hungup && kill_link == 0) {
              continue;
            }
            return v45;
          }

          int v130 = v121;
          if (ioctl(v121, 0x2000740DuLL, 0LL) < 0)
          {
            error( "Failed to reacquire the port %s exclusively: %m",  v131,  v132,  v133,  v134,  v135,  v136,  v137,  (int)&devnam);
            *(_DWORD *)status = 7;
            int v55 = v130;
            goto LABEL_69;
          }

          close(v130);
          uint64_t v54 = &unk_100045000;
        }

        int v162 = baud_rate;
        slprintf((int)&v165, 16, "%d");
        script_setenv("SPEED", (const char *)&v165);
        if (!terminal_window_hook && (!terminal_script || !*(_BYTE *)terminal_script))
        {
LABEL_164:
          if (welcomer
            && *(_BYTE *)welcomer
            && device_script(welcomer, dword_1000479B0, dword_1000479B0, 0, 0xFFFFFFFF, 0LL, 0))
          {
            warning("Welcome script failed", v154, v155, v156, v157, v158, v159, v160, v162);
          }

          if (v11 | v54[400]) {
            listen_time = connect_delay;
          }
          return dword_1000479B0;
        }

        if (!kill_link)
        {
          notify((uint64_t **)terminalscript_started_notify, 0);
          if (terminal_window_hook) {
            int v138 = terminal_window_hook(terminal_script, dword_1000479B0, dword_1000479B0);
          }
          else {
            int v138 = device_script( terminal_script,  dword_1000479B0,  dword_1000479B0,  0,  0xFFFFFFFF,  (const void *)terminal_data,  terminal_data_len);
          }
          *a1 = v138;
          if (v138)
          {
            if (cancelcode == -1 || v138 != cancelcode)
            {
              error("Terminal script failed", v139, v140, v141, v142, v143, v144, v145, v162);
              int v146 = 20;
              goto LABEL_173;
            }

LABEL_161:
            int v146 = 5;
LABEL_173:
            *(_DWORD *)status = v146;
            return 4294967294LL;
          }

          if (!kill_link)
          {
            notify((uint64_t **)terminalscript_finished_notify, 0);
            info("Terminal connection established.", v147, v148, v149, v150, v151, v152, v153, v162);
            goto LABEL_164;
          }
        }

        return 4294967294LL;
      }

      int v87 = "Can't create socket: %m";
    }

    error(v87, v58, v59, v60, v61, v62, v63, v64, v161);
    return 0xFFFFFFFFLL;
  }

  while (1)
  {
    if (privopen) {
      BOOL v15 = 0;
    }
    else {
      BOOL v15 = word_1000412F0 < 100;
    }
    int v16 = v15;
    if (v16 == 1) {
      seteuid(uid);
    }
    dword_1000479B0 = open((const char *)&devnam, 6, 0LL);
    int v17 = *__error();
    if (v16) {
      seteuid(0);
    }
    if ((dword_1000479B0 & 0x80000000) == 0)
    {
      unsigned int v161 = 0;
      if (ioctl(dword_1000479B0, 0x2000740DuLL) < 0)
      {
        int v17 = *__error();
        goto LABEL_33;
      }

      dword_1000479A4 = dword_1000479B0;
      int v25 = fcntl(dword_1000479B0, 3);
      if (v25 == -1 || (unsigned int v161 = v25 & 0xFFFFFFFB, fcntl(dword_1000479B0, 4) < 0)) {
        warning("Couldn't reset non-blocking mode on device: %m", v26, v27, v28, v29, v30, v31, v32, v161);
      }
      if (fstat(dword_1000479B0, &v164) < 0 || fchmod(dword_1000479B0, v164.st_mode & 0xFFED) < 0) {
        warning("Couldn't restrict write permissions to %s: %m", v33, v34, v35, v36, v37, v38, v39, (int)&devnam);
      }
      else {
        tty_mode = v164.st_mode;
      }
      if (v11)
      {
        uint64_t v40 = initializer;
        if (*(_BYTE *)v11) {
          BOOL v41 = 0;
        }
        else {
          BOOL v41 = initializer == 0;
        }
        int v42 = !v41;
        clocal = v42;
        int v43 = dword_1000479B0;
        if (*(_BYTE *)v11)
        {
          BOOL v44 = 1;
          uint64_t v2 = (_DWORD *)&unk_100047000;
LABEL_59:
          set_up_tty(v43, v44);
          goto LABEL_60;
        }
      }

      else
      {
        uint64_t v40 = initializer;
        clocal = initializer != 0;
        int v43 = dword_1000479B0;
      }

      uint64_t v2 = &unk_100047000;
      BOOL v44 = v40 != 0;
      goto LABEL_59;
    }

LABEL_33:
    *__error() = v17;
    if (v17 != 4) {
      break;
    }
    if (!persist) {
      return 0xFFFFFFFFLL;
    }
  }

  if (dword_1000479B0 < 0)
  {
    error("Failed to open %s: %m", v18, v19, v20, v21, v22, v23, v24, (int)&devnam);
  }

  else
  {
    error("Failed to acquire %s in exclusive mode : %m", v18, v19, v20, v21, v22, v23, v24, (int)&devnam);
    close(dword_1000479B0);
    dword_1000479B0 = -1;
  }

  int v14 = 7;
LABEL_56:
  *(_DWORD *)status = v14;
  return 0xFFFFFFFFLL;
}

        uint64_t v21 = v7 != 4;
        if ((v17 & v21) != 0) {
          uint64_t v7 = 4LL;
        }
        else {
          uint64_t v7 = v7;
        }
        if ((v17 & v21) != 0) {
          uint64_t v22 = (char *)__src;
        }
        else {
          uint64_t v22 = v9;
        }
        uint64_t v23 = (unsigned __int16)v15;
        if (v22 != (char *)v13)
        {
          memcpy(v22, v13, (unsigned __int16)v15);
          uint64_t v6 = acscp_allowoptions;
        }

        uint64_t v9 = &v22[v23];
        goto LABEL_2;
      }
    }

    *(_BYTE *)uint64_t v18 = 1;
    int v13 = v8;
    if ((_DWORD)v7 == 2)
    {
      int v17 = 0;
      int v13 = v10;
      LOWORD(v15) = 6;
      goto LABEL_33;
    }
  }

  *a3 = (_DWORD)v9 - (_DWORD)__src;
  return v7;
}

void disconnect_tty( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  if (disconnect_script) {
    BOOL v9 = hungup == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    if ((dword_1000479A4 & 0x80000000) == 0) {
      clocal = 1;
    }
    set_up_tty_local(dword_1000479A4, 1);
    if (device_script( disconnect_script,  dword_1000479B0,  dword_1000479B0,  0,  disconnector_uid,  (const void *)disconnect_data,  disconnect_data_len)) {
      warning("disconnect script failed", v10, v11, v12, v13, v14, v15, v16, a9);
    }
    else {
      info("Serial link disconnected.", v10, v11, v12, v13, v14, v15, v16, a9);
    }
  }

void tty_do_send_config( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a4;
  int v9 = a3;
  int v10 = a2;
  tty_set_xaccm((uint64_t)xmit_accm, a2, a3, a4, a5, a6, a7, a8, v12);
  tty_send_config(a1, v10, v9, v8);
}

uint64_t cleanup_tty()
{
  uint64_t v0 = dword_1000479A4;
  if ((dword_1000479A4 & 0x80000000) == 0)
  {
    if (default_device) {
      BOOL v1 = 1;
    }
    else {
      BOOL v1 = modem == 0;
    }
    if (!v1)
    {
      setdtr(dword_1000479A4, 0);
      sleep(1u);
      uint64_t v0 = dword_1000479A4;
    }

    restore_tty(v0);
    close(dword_1000479A4);
    dword_1000479A4 = -1;
  }

  uint64_t result = tty_close_fds();
  if (locked)
  {
    uint64_t result = unlock();
    locked = 0;
  }

  return result;
}

uint64_t tty_close_fds()
{
  if ((dword_1000479A8 & 0x80000000) == 0) {
    close(dword_1000479A8);
  }
  if ((dword_1000479AC & 0x80000000) == 0) {
    close(dword_1000479AC);
  }
  uint64_t result = dword_1000479A4;
  if ((dword_1000479A4 & 0x80000000) == 0)
  {
    uint64_t result = close(dword_1000479A4);
    dword_1000479A4 = -1;
  }

  return result;
}

void *tty_init()
{
  uint64_t result = add_notifier(&sigreceived, (uint64_t)sub_10001F6F8, 0LL);
  dword_1000479A4 = -1;
  the_channel = (uint64_t)&tty_channel;
  dword_100045CF0 = 1610612736;
  return result;
}

uint64_t sub_10001F6E0()
{
  if (locked) {
    return relock();
  }
  return result;
}

void sub_10001F6F8(uint64_t a1, uint64_t a2)
{
  int v3 = 0;
  if (a2 == 1 && dword_1000479A4 != -1 && phase != 12)
  {
    ioctl(dword_1000479A4, 0x4004746AuLL, &v3);
    if (!clocal && (v3 & 0x40) == 0)
    {
      hungup = 1;
      do_modem_hungup = 1;
    }
  }

uint64_t sub_10001F7A8(uint64_t a1, int a2)
{
  int v4 = safe_fork();
  if (v4 == -1)
  {
    error("Can't fork process for character shunt: %m", v5, v6, v7, v8, v9, v10, v11, v22);
    return 0LL;
  }

  else
  {
    int v12 = v4;
    if (!v4)
    {
      close(dword_1000479AC);
      setuid(uid);
      if (getuid() == uid)
      {
        gid_t v21 = getgid();
        setgid(v21);
        sys_close();
        if (!nodetach) {
          log_to_fd = -1;
        }
        sub_10001F8D4(a1, a2, (const char *)record_file);
      }

      fatal("setuid failed", v14, v15, v16, v17, v18, v19, v20, v22);
    }

    charshunt_pid = v4;
    add_notifier(&sigreceived, (uint64_t)sub_100020318, 0LL);
    close(dword_1000479A8);
    dword_1000479A8 = -1;
    dword_1000479B0 = dword_1000479AC;
    record_child(v12, (uint64_t)"pppd (charshunt)", (uint64_t)sub_10002033C, 0LL);
    return 1LL;
  }

void sub_10001F8D4(uint64_t a1, int a2, const char *a3)
{
  if (a3)
  {
    int v12 = fopen(a3, "a");
    if (!v12) {
      error("Couldn't create record file %s: %m", v13, v14, v15, v16, v17, v18, v19, (int)a3);
    }
  }

  else
  {
    int v12 = 0LL;
  }

  int v20 = fcntl(dword_1000479A8, 3);
  if (v20 == -1 || (int v103 = v20 | 4, fcntl(dword_1000479A8, 4) == -1)) {
    warning("couldn't set pty master to nonblock: %m", v21, v22, v23, v24, v25, v26, v27, v103);
  }
  int v28 = fcntl(a1, 3);
  if (v28 == -1 || (int v104 = v28 | 4, fcntl(a1, 4) == -1))
  {
    uint64_t v36 = "tty";
    if (!(_DWORD)a1) {
      uint64_t v36 = "stdin";
    }
    warning("couldn't set %s to nonblock: %m", v29, v30, v31, v32, v33, v34, v35, (int)v36);
  }

  if (a2 != (_DWORD)a1)
  {
    int v37 = fcntl(a2, 3);
    if (v37 == -1 || (int v104 = v37 | 4, fcntl(a2, 4) == -1)) {
      warning("couldn't set stdout to nonblock: %m", v38, v39, v40, v41, v42, v43, v44, v104);
    }
  }

  gettimeofday(&v122, 0LL);
  if (max_data_rate)
  {
    int v45 = max_data_rate / 10;
    if (max_data_rate / 10 <= 100) {
      int v45 = 100;
    }
  }

  else
  {
    int v45 = 1505;
  }

  int v107 = v45;
  int v46 = dword_1000479A8;
  if (dword_1000479A8 <= a2) {
    int v46 = a2;
  }
  int v47 = v46 + 1;
  if (v12)
  {
    gettimeofday(&v123, 0LL);
    putc(7, v12);
    tv_seCC_SHA1_CTX c = v123.tv_sec;
    putc((unint64_t)v123.tv_sec >> 24, v12);
    putc(tv_sec >> 16, v12);
    putc(tv_sec >> 8, v12);
    putc(tv_sec, v12);
    v123.tv_useCC_SHA1_CTX c = 0;
  }

  uint64_t v112 = v12;
  ssize_t v113 = 0LL;
  BOOL v49 = 0;
  BOOL v50 = 0;
  uint64_t v109 = 0LL;
  uint64_t v110 = 0LL;
  int v105 = 0;
  int v106 = 0;
  ssize_t v111 = 0LL;
  int v115 = 1 << a1;
  uint64_t v114 = &v125.fds_bits[(unint64_t)(int)a1 >> 5];
  int v117 = 1 << a2;
  uint64_t v116 = &v124.fds_bits[(unint64_t)a2 >> 5];
  BOOL v51 = 1;
  BOOL v52 = 1;
  BOOL v53 = 1;
  BOOL v54 = 1;
  uint64_t v108 = 0x100000001LL;
  while (1)
  {
    uint64_t v120 = 0LL;
    int v121 = 10000;
    memset(&v125, 0, sizeof(v125));
    memset(&v124, 0, sizeof(v124));
    if (!v50) {
      break;
    }
    if (v52)
    {
      int v55 = dword_1000479A8;
      if (__darwin_check_fd_set_overflow(dword_1000479A8, &v124, 0))
      {
        int v56 = 1 << v55;
        uint64_t v57 = &v124.fds_bits[(unint64_t)v55 >> 5];
LABEL_36:
        uint64_t v59 = 0LL;
        *v57 |= v56;
        if (v49) {
          goto LABEL_39;
        }
        goto LABEL_43;
      }

      goto LABEL_38;
    }

    uint64_t v59 = (timeval *)&v120;
    if (v49)
    {
LABEL_39:
      if (!v51)
      {
        uint64_t v59 = (timeval *)&v120;
        goto LABEL_49;
      }

      int v60 = __darwin_check_fd_set_overflow(a2, &v124, 0);
      uint64_t v61 = &v124.fds_bits[(unint64_t)a2 >> 5];
      int v62 = 1 << a2;
      if (!v60) {
        goto LABEL_49;
      }
      goto LABEL_46;
    }

LABEL_105:
          uint64_t v93 = &outpacket_buf;
          goto LABEL_106;
        }

        if (!(_DWORD)v95) {
          goto LABEL_97;
        }
        if (__darwin_check_fd_set_overflow(a2, &v124, 0)) {
          *v116 |= v117;
        }
        if (!v79) {
          goto LABEL_105;
        }
        uint64_t v93 = &outpacket_buf;
      }

LABEL_106:
      if (__darwin_check_fd_set_overflow(a2, &v124, 0) && (*v116 & v117) != 0)
      {
        else {
          int v96 = v107 - v78;
        }
        unsigned int v97 = write(a2, v93, v96);
        if ((v97 & 0x80000000) != 0)
        {
          if (*__error() == 5)
          {
            ssize_t v80 = 0LL;
            HIDWORD(v108) = 0;
          }

          else if (*__error() != 35 && *__error() != 4)
          {
            uint64_t v102 = "Error writing standard output: %m";
            goto LABEL_136;
          }
        }

        else
        {
          uint64_t v93 = (int *)((char *)v93 + v97);
          ssize_t v80 = v80 - v97;
          v78 += v97;
        }
      }

      int v98 = dword_1000479A8;
      uint64_t v110 = v93;
      if (__darwin_check_fd_set_overflow(dword_1000479A8, &v124, 0)
        && ((*(unsigned int *)((char *)v124.fds_bits + (((unint64_t)v98 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v98) & 1) != 0)
      {
        else {
          int v99 = v107 - v75;
        }
        unsigned int v100 = write(dword_1000479A8, v82, v99);
        if ((v100 & 0x80000000) != 0)
        {
          if (*__error() == 5)
          {
            ssize_t v81 = 0LL;
            LODWORD(v108) = 0;
          }

          else if (*__error() != 35 && *__error() != 4)
          {
            uint64_t v102 = "Error writing pseudo-tty master: %m";
            goto LABEL_136;
          }
        }

        else
        {
          uint64_t v82 = (_WORD *)((char *)v82 + v100);
          ssize_t v81 = v81 - v100;
          v75 += v100;
        }
      }

      uint64_t v109 = v82;
      uint64_t v112 = v79;
      ssize_t v113 = v80;
      BOOL v50 = (_DWORD)v81 != 0;
      BOOL v49 = (_DWORD)v80 != 0;
      BOOL v54 = HIDWORD(v108) != 0;
      ssize_t v101 = v81;
      BOOL v53 = (_DWORD)v108 != 0;
      int v105 = v75;
      int v106 = v78;
      BOOL v52 = v75 < v107;
      BOOL v51 = v78 < v107;
      ssize_t v111 = v101;
      if (!(_DWORD)v101 && !(_DWORD)v113 && !v108) {
        goto LABEL_131;
      }
    }
  }

  if (v53)
  {
    int v58 = __darwin_check_fd_set_overflow(a1, &v125, 0);
    uint64_t v57 = v114;
    int v56 = v115;
    if (v58) {
      goto LABEL_36;
    }
  }

LABEL_38:
  uint64_t v59 = 0LL;
  if (v49) {
    goto LABEL_39;
  }
  goto LABEL_43;
}

uint64_t sub_100020318(uint64_t a1, uint64_t a2)
{
  uint64_t result = charshunt_pid;
  if (charshunt_pid)
  {
    if (a2 == 2) {
      int v3 = 2;
    }
    else {
      int v3 = 15;
    }
    return kill(charshunt_pid, v3);
  }

  return result;
}

void sub_10002033C()
{
  charshunt_pid = 0;
}

uint64_t sub_100020348(FILE *a1, int a2, const void *a3, unsigned int a4, timeval *a5)
{
  v20.tv_usec /= 100000;
  unsigned int v10 = v20.tv_usec - a5->tv_usec + 10 * (LODWORD(v20.tv_sec) - LODWORD(a5->tv_sec));
  if ((int)v10 >= 1)
  {
    if (v10 < 0x100)
    {
      int v11 = 6;
    }

    else
    {
      putc(5, a1);
      putc(HIBYTE(v10), a1);
      putc(HIWORD(v10), a1);
      int v11 = v10 >> 8;
    }

    putc(v11, a1);
    putc(v10, a1);
    *a5 = v20;
  }

  putc(a2, a1);
  if (a3)
  {
    putc(a4 >> 8, a1);
    putc(a4, a1);
    fwrite(a3, a4, 1uLL, a1);
  }

  fflush(a1);
  if (!ferror(a1)) {
    return 1LL;
  }
  error("Error writing record file: %m", v12, v13, v14, v15, v16, v17, v18, v20.tv_sec);
  return 0LL;
}

double sub_100020498(int a1)
{
  BOOL v1 = (char *)&upap + 64 * (uint64_t)a1;
  *(_DWORD *)BOOL v1 = a1;
  *((void *)v1 + 1) = 0LL;
  *((_DWORD *)v1 + 4) = 0;
  *((void *)v1 + 3) = 0LL;
  *((void *)v1 + 4) = 0LL;
  *(void *)(v1 + 37) = 0LL;
  *((_DWORD *)v1 + 12) = 3;
  *(void *)&double result = 0x1E0000000ALL;
  *((void *)v1 + 7) = 0x1E0000000ALL;
  return result;
}

void sub_1000204D4( int a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  if ((int)a3 > 3)
  {
    unsigned int v10 = __rev16(*((unsigned __int16 *)a2 + 1));
    if (v10 > 3)
    {
      if (v10 <= a3)
      {
        uint64_t v11 = a1;
        uint64_t v12 = (int *)((char *)&upap + 64 * (uint64_t)a1);
        int v13 = *a2;
        if (v13 == 3)
        {
          uint64_t v24 = (char *)&upap + 64 * (uint64_t)a1;
          int v26 = *((_DWORD *)v24 + 9);
          uint64_t v25 = v24 + 36;
          if (v26 != 3) {
            return;
          }
          if (v10 == 4)
          {
            if (debug) {
              dbglog("pap_rauthnak: ignoring missing msg-length.", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v59);
            }
          }

          else if (a2[4])
          {
            if (v10 - 5 < a2[4])
            {
              if (debug)
              {
                uint64_t v9 = "pap_rauthnak: rcvd short packet.";
                goto LABEL_10;
              }

              return;
            }

            info("Remote message: %0.*v", (uint64_t)a2, a3, a4, a5, a6, a7, a8, a2[4]);
          }

          *uint64_t v25 = 5;
          error("PAP authentication failed", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v59);
          auth_withpeer_fail(*v12, 49187);
          return;
        }

        if (v13 != 2)
        {
          if (v13 != 1) {
            return;
          }
          uint64_t v14 = (char *)&upap + 64 * (uint64_t)a1;
          int v17 = *((_DWORD *)v14 + 10);
          uint64_t v16 = v14 + 40;
          int v15 = v17;
          if (v17 < 3) {
            return;
          }
          char v18 = a2[1];
          if (v15 == 5)
          {
            uint64_t v19 = (unsigned int *)((char *)&upap + 64 * (uint64_t)a1);
            char v20 = 3;
          }

          else
          {
            if (v15 != 4)
            {
              if (v10 == 4
                || (uint64_t v27 = a2[4], v28 = v10 - v27 - 6, v28 < 0)
                || (uint64_t v29 = (uint64_t)(a2 + 5), v30 = &a2[a2[4] + 5], v31 = *v30, v28 < v31))
              {
                if (debug) {
                  dbglog("pap_rauth: rcvd short packet.", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v59);
                }
              }

              else
              {
                uint64_t v32 = v30 + 1;
                int v33 = check_passwd((void *)*v12, (uint64_t)(a2 + 5), v27, (uint64_t)(v30 + 1), *v30, &__s);
                bzero(v32, v31);
                if (v33 == 2)
                {
                  if (auth_number())
                  {
                    int v33 = 2;
                  }

                  else
                  {
                    warning( "calling number %q is not authorized",  v34,  v35,  v36,  v37,  v38,  v39,  v40,  (int)&remote_number);
                    int v33 = 3;
                  }
                }

                int v41 = strlen(__s);
                if (v41 >= 255) {
                  int v45 = 255;
                }
                else {
                  int v45 = v41;
                }
                sub_100020FE8((unsigned int *)v12, v33, v18, __s, v45, v42, v43, v44, v59);
                slprintf((int)v61, 256, "%.*v");
                if (v33 == 2)
                {
                  *uint64_t v16 = 4;
                  notice("PAP peer authentication succeeded for %q", v46, v47, v48, v49, v50, v51, v52, (int)v61);
                  auth_peer_success(*v12, 49187, 0, v29, v27);
                }

                else
                {
                  *uint64_t v16 = 5;
                  warning("PAP peer authentication failed for %q", v46, v47, v48, v49, v50, v51, v52, (int)v61);
                  auth_peer_fail(*v12, 49187LL, v53, v54, v55, v56, v57, v58);
                }
              }

              return;
            }

            uint64_t v19 = (unsigned int *)((char *)&upap + 64 * (uint64_t)a1);
            char v20 = 2;
          }

          sub_100020FE8(v19, v20, v18, &unk_10002EB6A, 0, a6, a7, a8, v59);
          return;
        }

        uint64_t v21 = (char *)&upap + 64 * (uint64_t)a1;
        int v23 = *((_DWORD *)v21 + 9);
        uint64_t v22 = v21 + 36;
        if (v23 != 3) {
          return;
        }
        if (v10 == 4)
        {
          if (debug) {
            dbglog("pap_rauthack: ignoring missing msg-length.", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v59);
          }
        }

        else if (a2[4])
        {
          if (v10 - 5 < a2[4])
          {
            if (debug)
            {
              uint64_t v9 = "pap_rauthack: rcvd short packet.";
              goto LABEL_10;
            }

            return;
          }

          info("Remote message: %0.*v", (uint64_t)a2, a3, a4, a5, a6, a7, a8, a2[4]);
        }

        *uint64_t v22 = 4;
        notice("PAP authentication succeeded", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v59);
        auth_withpeer_success(*v12, 49187, 0);
        return;
      }

      if (debug)
      {
        uint64_t v9 = "pap_input: rcvd short packet.";
        goto LABEL_10;
      }
    }

    else if (debug)
    {
      uint64_t v9 = "pap_input: rcvd illegal length.";
      goto LABEL_10;
    }
  }

  else if (debug)
  {
    uint64_t v9 = "pap_input: rcvd short header.";
LABEL_10:
    dbglog(v9, (uint64_t)a2, a3, a4, a5, a6, a7, a8, a9);
  }

void sub_1000209E0( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = (char *)&upap + 64 * (uint64_t)a1;
  if (*((_DWORD *)v9 + 9) == 3)
  {
    error("PAP authentication failed due to protocol-reject", a2, a3, a4, a5, a6, a7, a8, v16);
    auth_withpeer_fail(a1, 49187);
  }

  if (*((_DWORD *)v9 + 10) == 3)
  {
    error("PAP authentication of peer failed (protocol-reject)", a2, a3, a4, a5, a6, a7, a8, v16);
    auth_peer_fail(a1, 49187LL, v10, v11, v12, v13, v14, v15);
  }

  sub_100020B08(a1);
}

void sub_100020A58(int a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = (char *)&upap + 64 * (uint64_t)a1;
  int v5 = *((_DWORD *)v2 + 9);
  int v3 = v2 + 36;
  int v4 = v5;
  if (v5 == 2)
  {
    sub_100020E14((unsigned int *)&upap + 16 * (uint64_t)a1);
  }

  else if (!v4)
  {
    *int v3 = 1;
  }

  uint64_t v6 = (char *)&upap + 64 * v1;
  int v9 = *((_DWORD *)v6 + 10);
  uint64_t v7 = v6 + 40;
  int v8 = v9;
  if (v9 == 2)
  {
    *uint64_t v7 = 3;
  }

  else if (!v8)
  {
    *uint64_t v7 = 1;
  }

void sub_100020B08(int a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = (char *)&upap + 64 * (uint64_t)a1;
  if (*((_DWORD *)v2 + 9) == 3) {
    untimeout((uint64_t)sub_100020F7C, (uint64_t)v2);
  }
  *(void *)(v2 + 36) = 0LL;
}

uint64_t sub_100020B88(unsigned __int8 *a1, int a2, void (*a3)(uint64_t, const char *), uint64_t a4)
{
  if (a2 < 4) {
    return 0LL;
  }
  unsigned int v6 = __rev16(*((unsigned __int16 *)a1 + 1));
  unsigned int v7 = v6 - 4;
  if (v6 < 4 || v6 > a2) {
    return 0LL;
  }
  int v11 = *a1;
  int v12 = a1[1];
  uint64_t v13 = a1 + 4;
  else {
    uint64_t v14 = " %s";
  }
  a3(a4, v14);
  ((void (*)(uint64_t, const char *, ...))a3)(a4, " id=0x%x", v12);
  if ((v11 - 2) < 2)
  {
    if (v6 < 5) {
      return ((_DWORD)v13 - (_DWORD)a1);
    }
    uint64_t v15 = *v13;
    int v16 = &v13[v15 + 1];
    int v17 = v7 - (v15 + 1);
    a3(a4, " ");
    char v18 = (char *)(a1 + 5);
    int v19 = v15;
    goto LABEL_16;
  }

  if (v11 == 1)
  {
    if (v6 < 5) {
      return ((_DWORD)v13 - (_DWORD)a1);
    }
    uint64_t v20 = *v13;
    int v21 = v13[v20 + 1];
    unsigned int v22 = v20 + 2 + v21;
    int v17 = v7 - v22;
    if (v7 < v22) {
      goto LABEL_25;
    }
    int v16 = &v13[v22];
    a3(a4, " user=");
    print_string((char *)a1 + 5, v20, a3, a4);
    a3(a4, " password=");
    if (!byte_100042080)
    {
      char v18 = (char *)&v13[v20 + 2];
      int v19 = v21;
LABEL_16:
      print_string(v18, v19, a3, a4);
      goto LABEL_24;
    }

    a3(a4, "<hidden>");
  }

  else
  {
    int v17 = v6 - 4;
    int v16 = a1 + 4;
  }

void upap_authwithpeer(int a1, char *__s, const char *a3)
{
  int v4 = (char *)&upap + 64 * (uint64_t)a1;
  *((void *)v4 + 1) = __s;
  *((_DWORD *)v4 + 4) = strlen(__s);
  *((void *)v4 + 3) = a3;
  int v5 = strlen(a3);
  int v6 = *((_DWORD *)v4 + 9);
  *((_DWORD *)v4 + 8) = v5;
  *((_DWORD *)v4 + 13) = 0;
  if ((v6 | 2) == 2) {
    *((_DWORD *)v4 + 9) = 2;
  }
  else {
    sub_100020E14((unsigned int *)v4);
  }
}

void sub_100020E14(unsigned int *a1)
{
  size_t v2 = (int)a1[4];
  int v3 = v2 + a1[8];
  outpacket_buf = 599786495;
  LOBYTE(word_10004412notify((uint64_t **)lcp_lowerdown_notify, 0) = 1;
  char v4 = *((_BYTE *)a1 + 44) + 1;
  *((_BYTE *)a1 + 44) = v4;
  HIBYTE(word_10004412notify((uint64_t **)lcp_lowerdown_notify, 0) = v4;
  LOBYTE(word_100044122) = (unsigned __int16)(v3 + 6) >> 8;
  HIBYTE(word_100044122) = v3 + 6;
  byte_100044124 = v2;
  memcpy(byte_100044125, *((const void **)a1 + 1), v2);
  int v5 = &byte_100044125[a1[4]];
  *int v5 = a1[8];
  memcpy(v5 + 1, *((const void **)a1 + 3), (int)a1[8]);
  output(*a1, (uint64_t)&outpacket_buf, (v3 + 10), v6, v7, v8, v9, v10, v11);
  timeout((int)sub_100020F7C);
  ++a1[13];
  a1[9] = 3;
}

void upap_authpeer(int a1)
{
  uint64_t v1 = (char *)&upap + 64 * (uint64_t)a1;
  int v3 = *((_DWORD *)v1 + 10);
  size_t v2 = v1 + 40;
  if ((v3 | 2) == 2)
  {
    _DWORD *v2 = 2;
  }

  else
  {
    _DWORD *v2 = 3;
  }

void sub_100020F40( int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1[10] == 3)
  {
    auth_peer_fail(*a1, 49187LL, a3, a4, a5, a6, a7, a8);
    a1[10] = 5;
  }

void sub_100020F7C( int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1[9] == 3)
  {
    if (a1[13] >= a1[14])
    {
      error("No response to PAP authenticate-requests", a2, a3, a4, a5, a6, a7, a8, v9);
      a1[9] = 5;
      auth_withpeer_fail(*a1, 49187);
    }

    else
    {
      sub_100020E14(a1);
    }
  }

void sub_100020FE8( unsigned int *a1, char a2, char a3, void *__src, int a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  outpacket_buf = 599786495;
  LOBYTE(word_10004412notify((uint64_t **)lcp_lowerdown_notify, 0) = a2;
  HIBYTE(word_10004412notify((uint64_t **)lcp_lowerdown_notify, 0) = a3;
  LOBYTE(word_100044122) = (unsigned __int16)(a5 + 5) >> 8;
  HIBYTE(word_100044122) = a5 + 5;
  byte_100044124 = a5;
  memcpy(byte_100044125, __src, a5);
  output(*a1, (uint64_t)&outpacket_buf, (a5 + 9), v11, v12, v13, v14, v15, a9);
}

uint64_t slprintf(int a1, int a2, void *a3)
{
  return vslprintf(a1, a2, a3);
}

uint64_t vslprintf(char *a1, int a2, char *__src, int *a4)
{
  char v4 = a1;
  uint64_t v91 = a4;
  int __dst = (int)a1;
  if (a2 < 2) {
    goto LABEL_200;
  }
  int v6 = a2 - 1;
  char v4 = a1;
  while (1)
  {
    for (uint64_t i = 0LL; __src[i] && __src[i] != 37; ++i)
      ;
    uint64_t v8 = &__src[i];
    if (&__src[i] > __src)
    {
      else {
        int v9 = v6;
      }
      memcpy(v4, __src, v9);
      v4 += v9;
      v6 -= v9;
      __srCC_SHA1_CTX c = v8;
    }

    if (!*__src) {
      goto LABEL_200;
    }
    uint64_t v11 = __src + 1;
    int v10 = __src[1];
    if (v10 == 48)
    {
      int v13 = __src[2];
      int v12 = 48;
      uint64_t v11 = __src + 2;
    }

    else
    {
      int v12 = 32;
      int v13 = __src[1];
    }

    if (v13 == 42)
    {
      uint64_t v14 = v91;
      v91 += 2;
      int v15 = *v14;
      int v17 = *++v11;
      int v16 = v17;
    }

    else
    {
      int v16 = (char)v13;
      if (((char)v13 - 48) > 9)
      {
        int v15 = 0;
      }

      else
      {
        int v15 = 0;
        do
        {
          int v15 = v16 + 10 * v15 - 48;
          int v18 = *++v11;
          int v16 = v18;
        }

        while ((v18 - 48) < 0xA);
      }
    }

    if (v16 == 46)
    {
      int v16 = v11[1];
      if (v16 == 42)
      {
        int v19 = v91;
        v91 += 2;
        int v20 = *v19;
        int v21 = v11[2];
        v11 += 2;
        int v16 = v21;
      }

      else if ((v16 - 48) > 9)
      {
        int v20 = 0;
        ++v11;
      }

      else
      {
        int v20 = 0;
        ++v11;
        do
        {
          int v20 = v16 + 10 * v20 - 48;
          int v22 = *++v11;
          int v16 = v22;
        }

        while ((v22 - 48) < 0xA);
      }
    }

    else
    {
      int v20 = -1;
    }

    __srCC_SHA1_CTX c = v11 + 1;
    if (v16 > 87) {
      break;
    }
    switch(v16)
    {
      case 'B':
        int v45 = v91;
        v91 += 2;
        if (v20 >= 1)
        {
          uint64_t v46 = *(unsigned __int8 **)v45;
          int v47 = v20 + 1;
          do
          {
            unsigned int v49 = *v46++;
            unint64_t v48 = v49;
            if (v10 != 48 && v6 >= 1)
            {
              *v4++ = 32;
              --v6;
            }

            if (v6 >= 1)
            {
              *char v4 = a0123456789abcd[v48 >> 4];
              if (v6 == 1)
              {
                int v6 = 0;
                ++v4;
              }

              else
              {
                v6 -= 2;
                v4[1] = a0123456789abcd[v48 & 0xF];
                v4 += 2;
              }
            }

            --v47;
          }

          while (v47 > 1);
        }

        goto LABEL_148;
      case 'I':
        uint64_t v50 = (unsigned int *)v91;
        v91 += 2;
        ntohl(*v50);
        uint64_t v51 = v92;
        slprintf((int)v92, 32, "%d.%d.%d.%d");
LABEL_135:
        int v66 = strlen(v51);
        if (v20 >= v66 || v20 <= -1) {
          int v68 = v66;
        }
        else {
          int v68 = v20;
        }
LABEL_162:
        if (v15 >= 1)
        {
          int v74 = v15 >= v6 ? v6 : v15;
          int v75 = v74 - v68;
          if (v74 - v68 >= 1)
          {
            size_t v76 = (v74 + ~v68) + 1LL;
            memset(v4, v12, v76);
            v6 -= v75;
            v4 += v76;
          }
        }

        if (v68 >= v6) {
          int v77 = v6;
        }
        else {
          int v77 = v68;
        }
        memcpy(v4, v51, v77);
        v4 += v77;
        BOOL v73 = __OFSUB__(v6, v77);
        v6 -= v77;
        if ((v6 < 0) ^ v73 | (v6 == 0)) {
          goto LABEL_200;
        }
        break;
      case 'P':
        uint64_t v88 = v4;
        int v89 = v6 + 1;
        int v33 = (unsigned __int8 **)v91;
        v91 += 2;
        uint64_t v34 = *v33;
        uint64_t v91 = (int *)(v33 + 2);
        int v35 = *((_DWORD *)v33 + 2);
        uint64_t v36 = (v35 - 4);
        if (v35 < 4) {
          goto LABEL_146;
        }
        if (*v34 == 255 && v34[1] == 3)
        {
          uint64_t v37 = v34 + 4;
          unsigned int v38 = __rev16(*((unsigned __int16 *)v34 + 1));
          uint64_t v39 = protocols;
          if (protocols)
          {
            uint64_t v40 = (__int16 **)&off_10003F898;
            int v41 = protocols;
            do
            {
              if (v38 == (unsigned __int16)*v41)
              {
                sub_100021B08((uint64_t)&v88, "[%s");
                int v78 = (*((uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t (*)(uint64_t, void *), char **))v41
                       + 8))( v37,  v36,  sub_100021B08,  &v88);
                sub_100021B08((uint64_t)&v88, "]");
                LODWORD(v36) = v36 - v78;
                goto LABEL_144;
              }

              uint64_t v42 = *v40++;
              int v41 = v42;
            }

            while (v42);
            if (protocols)
            {
              uint64_t v43 = (__int16 **)&off_10003F898;
              while (v38 != (*v39 & 0x7FFF))
              {
                uint64_t v44 = *v43++;
                uint64_t v39 = v44;
                if (!v44) {
                  goto LABEL_197;
                }
              }

              if (*((void *)v39 + 12))
              {
                sub_100021B08((uint64_t)&v88, "[%s data");
                uint64_t v79 = (uint64_t (*)(unsigned __int8 *, uint64_t, uint64_t (*)(uint64_t, void *), char **))*((void *)v39 + 20);
                if (v79)
                {
                  int v80 = v79(v37, v36, sub_100021B08, &v88);
                  v37 += v80;
                  LODWORD(v36) = v36 - v80;
                }

                sub_100021B08((uint64_t)&v88, "]\n");
                if ((int)v36 >= 1)
                {
                  do
                  {
                    else {
                      unint64_t v81 = v36;
                    }
                    sub_100021B08((uint64_t)&v88, "  ");
                    uint64_t v82 = 0LL;
                    do
                    {
                      uint64_t v83 = v82;
                      if (v82 == 8) {
                        sub_100021B08((uint64_t)&v88, "  ");
                      }
                      sub_100021B08((uint64_t)&v88, "%.1B");
                      uint64_t v82 = v83 + 1;
                    }

                    while (v83 + 1 < v81);
                    if (v82 <= 0xF)
                    {
                      int v84 = 15 - v83;
                      do
                      {
                        if (v84 == 8) {
                          sub_100021B08((uint64_t)&v88, "  ");
                        }
                        sub_100021B08((uint64_t)&v88, "   ");
                        --v84;
                      }

                      while (v84);
                    }

                    sub_100021B08((uint64_t)&v88, "   '");
                    uint64_t v85 = 0LL;
                    do
                    {
                      sub_100021B08((uint64_t)&v88, "%c");
                      ++v85;
                    }

                    while (v85 < (int)v81);
                    sub_100021B08((uint64_t)&v88, "'\n");
                    v37 += 16;
                    BOOL v73 = __OFSUB__((_DWORD)v36, 16);
                    LODWORD(v36) = v36 - 16;
                  }

                  while (!(((int)v36 < 0) ^ v73 | ((_DWORD)v36 == 0)));
                }

LABEL_146:
                uint64_t v70 = "%.*B";
                goto LABEL_147;
              }
            }
          }

LABEL_197:
          sub_100021B08((uint64_t)&v88, "[proto=0x%x]");
        }

        else
        {
          LODWORD(v36) = v35;
        }

LABEL_144:
        uint64_t v70 = "%.32B ...";
LABEL_147:
        sub_100021B08((uint64_t)&v88, v70);
        char v4 = v88;
        int v6 = v89 - 1;
LABEL_148:
        if (v6 <= 0) {
          goto LABEL_200;
        }
        break;
      default:
LABEL_116:
        *v4++ = 37;
        if (v16 != 37) {
          __srCC_SHA1_CTX c = v11;
        }
        --v6;
        goto LABEL_148;
    }
  }

  switch(v16)
  {
    case 'c':
      uint64_t v55 = v91;
      v91 += 2;
      v92[0] = *v55;
      v92[1] = 0;
      uint64_t v51 = v92;
      goto LABEL_135;
    case 'd':
      uint64_t v56 = (unsigned int *)v91;
      v91 += 2;
      unint64_t v57 = *v56;
      unint64_t v54 = -(int)v57;
      if ((v57 & 0x80000000) == 0LL) {
        unint64_t v54 = v57;
      }
      uint64_t v52 = (v57 >> 31) & 1;
      goto LABEL_151;
    case 'e':
    case 'f':
    case 'g':
    case 'h':
    case 'i':
    case 'j':
    case 'k':
    case 'n':
    case 'r':
    case 'w':
      goto LABEL_116;
    case 'l':
      int v58 = *__src;
      if (v58 == 117)
      {
        LODWORD(v52) = 0;
        __srCC_SHA1_CTX c = v11 + 2;
        uint64_t v71 = (unint64_t *)v91;
        v91 += 2;
        unint64_t v54 = *v71;
      }

      else
      {
        if (v58 != 100)
        {
          *(_WORD *)char v4 = 27685;
          v4 += 2;
          v6 -= 2;
          goto LABEL_148;
        }

        __srCC_SHA1_CTX c = v11 + 2;
        int v59 = (uint64_t *)v91;
        v91 += 2;
        uint64_t v60 = *v59;
        if (v60 >= 0) {
          unint64_t v54 = v60;
        }
        else {
          unint64_t v54 = -v60;
        }
        uint64_t v52 = (unint64_t)v60 >> 63;
      }

LABEL_151:
      unint64_t v63 = 10LL;
LABEL_152:
      char v93 = 0;
      uint64_t v51 = &v93;
      while (v51 > &v92[v52])
      {
        unint64_t v72 = v54;
        v54 /= v63;
        *--uint64_t v51 = a0123456789abcd[v72 - v54 * v63];
        BOOL v73 = __OFSUB__(v20--, 1);
        if ((v20 < 0) ^ v73 | (v20 == 0))
        {
          if (v63 > v72) {
            break;
          }
        }
      }

      if ((_DWORD)v52 == 2)
      {
        *((_WORD *)v51 - 1) = 30768;
        v51 -= 2;
      }

      else if ((_DWORD)v52 == 1)
      {
        *--uint64_t v51 = 45;
      }

      int v68 = &v93 - (_DWORD)v51;
      goto LABEL_162;
    case 'm':
      uint64_t v61 = __error();
      uint64_t v51 = strerror(*v61);
      goto LABEL_135;
    case 'o':
      LODWORD(v52) = 0;
      int v62 = (unsigned int *)v91;
      v91 += 2;
      unint64_t v54 = *v62;
      unint64_t v63 = 8LL;
      goto LABEL_152;
    case 'p':
      uint64_t v52 = (uint64_t)v91;
      v91 += 2;
      unint64_t v54 = *(void *)v52;
      LODWORD(v52) = 2;
      goto LABEL_132;
    case 'q':
    case 'v':
      unsigned int v23 = (const char **)v91;
      v91 += 2;
      int v24 = *v23;
      if (v10 != 48 || v20 < 0)
      {
        int v25 = strlen(*v23);
        if (v20 >= v25 || v20 < 0) {
          int v20 = v25;
        }
      }

      if (v20 < 1 || v6 < 1) {
        goto LABEL_148;
      }
LABEL_43:
      int v28 = *v24++;
      int v27 = v28;
      int v29 = v28;
      if (v16 == 113 || (v27 & 0x80000000) == 0)
      {
        if (v16 != 113)
        {
          if (v29 >= 0x20 && (v29 - 127) >= 0x21)
          {
LABEL_59:
            --v6;
            *v4++ = v29;
            goto LABEL_70;
          }

          goto LABEL_61;
        }

        if (v29 == 92 || v29 == 34)
        {
          --v6;
          *v4++ = 92;
        }
      }

      else
      {
        *char v4 = 77;
        BOOL v30 = v6 >= 2;
        v6 -= 2;
        if (v30)
        {
          v4[1] = 45;
          v4 += 2;
        }

        else
        {
          int v6 = 0;
          ++v4;
        }

        v29 -= 128;
      }

      if (v29 >= 32 && (v29 - 127) >= 0x21)
      {
        if (!v6) {
          break;
        }
        goto LABEL_59;
      }

      if (v16 == 113)
      {
        if (v6)
        {
          int v32 = v6 - 1;
          *v4++ = 92;
        }

        else
        {
          int v32 = 0;
        }

        switch(v29)
        {
          case 8:
            if (v32)
            {
              int v6 = v32 - 1;
              char v31 = 98;
              goto LABEL_64;
            }

            break;
          case 9:
            if (v32)
            {
              int v6 = v32 - 1;
              char v31 = 116;
              goto LABEL_64;
            }

            break;
          case 10:
            if (v32)
            {
              int v6 = v32 - 1;
              char v31 = 110;
              goto LABEL_64;
            }

            break;
          case 12:
            if (v32)
            {
              int v6 = v32 - 1;
              char v31 = 102;
              goto LABEL_64;
            }

            break;
          default:
            if (v32)
            {
              *char v4 = 120;
              if (v32 == 1)
              {
                ++v4;
              }

              else
              {
                v4[1] = a0123456789abcd[(unint64_t)v29 >> 4];
                if (v32 != 2)
                {
                  int v6 = v32 - 3;
                  v4[2] = a0123456789abcd[v29 & 0xF];
                  v4 += 3;
                  goto LABEL_70;
                }

                v4 += 2;
              }
            }

            break;
        }

        break;
      }

LABEL_200:
  *char v4 = 0;
  return ((_DWORD)v4 - __dst);
}

uint64_t sub_100021B08(uint64_t a1, void *__src)
{
  uint64_t result = vslprintf(*(void *)a1, *(_DWORD *)(a1 + 8), __src);
  *(void *)a1 += (int)result;
  *(_DWORD *)(a1 + 8) -= result;
  return result;
}

size_t init_pr_log(size_t result, int a2)
{
  qword_100047AB8 = (uint64_t)byte_1000479B8;
  if (result)
  {
    __strlcpy_chk(byte_1000479B8, result, 256LL, 256LL);
    uint64_t result = strlen(byte_1000479B8);
    qword_100047AB8 = (uint64_t)&byte_1000479B8[result];
  }

  dword_100047AC0 = a2;
  return result;
}

void end_pr_log()
{
  if ((char *)qword_100047AB8 != byte_1000479B8)
  {
    *(_BYTE *)qword_100047AB8 = 0;
    sub_100021BF8(dword_100047AC0, byte_1000479B8);
  }

void sub_100021BF8(int a1, const char *a2)
{
  if ((log_to_fd & 0x80000000) == 0 && (a1 != 7 || debug))
  {
    int v4 = strlen(a2);
    time(&v7);
    int v5 = localtime(&v7);
    int v6 = strftime(__buf, 0x40uLL, "%c : ", v5);
    if (write(log_to_fd, __buf, v6) != v6) {
      log_to_fd = -1;
    }
    if (v4 >= 1) {
      v4 -= a2[v4 - 1] == 10;
    }
    if (write(log_to_fd, a2, v4) != v4 || write(log_to_fd, "\n", 1uLL) != 1) {
      log_to_fd = -1;
    }
  }

void pr_log(uint64_t a1, char *__src, ...)
{
  size_t v2 = __s;
  int v3 = vslprintf(__s, 256, __src, (int *)va);
  int v4 = strchr(__s, 10);
  int v5 = v4;
  int v6 = (uint64_t *)qword_100047AB8;
  size_t v2 = __s;
  int v7 = (_DWORD)v4 - __s;
  if (!v4) {
    int v7 = v3;
  }
  uint64_t v8 = (uint64_t *)(qword_100047AB8 + v7);
  if (v8 >= &qword_100047AB8)
  {
LABEL_9:
    *(_BYTE *)int v6 = 0;
    sub_100021BF8(dword_100047AC0, byte_1000479B8);
    qword_100047AB8 = (uint64_t)byte_1000479B8;
LABEL_10:
    while (v5)
    {
      *int v5 = 0;
      sub_100021BF8(dword_100047AC0, v2);
      size_t v2 = v5 + 1;
      int v5 = strchr(v5 + 1, 10);
    }

    int v9 = &__s[v3] - (_DWORD)v2;
    if (v9 >= 1)
    {
      __memcpy_chk(byte_1000479B8, v2, v3, 256LL);
      qword_100047AB8 = (uint64_t)&byte_1000479B8[v9];
    }

    return;
  }

  if (v7 >= 1)
  {
    memcpy((void *)qword_100047AB8, __s, v7);
    qword_100047AB8 = (uint64_t)v8;
    int v6 = v8;
  }

  if (v5)
  {
    size_t v2 = v5 + 1;
    int v5 = strchr(v5 + 1, 10);
    goto LABEL_9;
  }

uint64_t print_string(char *a1, int a2, void (*a3)(uint64_t, const char *), uint64_t a4)
{
  if (a2 >= 1)
  {
    int v7 = a2 + 1;
    do
    {
      int v9 = *a1++;
      int v8 = v9;
      if ((v9 - 32) > 0x5E)
      {
        if (v8 == 9)
        {
          uint64_t v10 = a4;
          uint64_t v11 = "\\t";
        }

        else if (v8 == 13)
        {
          uint64_t v10 = a4;
          uint64_t v11 = "\\r";
        }

        else
        {
          uint64_t v10 = a4;
          if (v8 == 10) {
            uint64_t v11 = "\\n";
          }
          else {
            uint64_t v11 = "\\%.3o";
          }
        }
      }

      else
      {
        uint64_t v10 = a4;
        uint64_t v11 = "%c";
      }

      a3(v10, v11);
      --v7;
    }

    while (v7 > 1);
  }

  return ((uint64_t (*)(uint64_t, const char *))a3)(a4, "");
}

void fatal( char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
}

void sub_10002203C(int a1, char *a2, int *a3)
{
}

void error( char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
}

void warning( char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
}

void notice( char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
}

void info( char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
}

void dbglog( char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
}

void dump_packet(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (debug)
  {
    unsigned int v8 = __rev16(*(unsigned __int16 *)(a2 + 2));
    BOOL v9 = debug <= 1 && unsuccess == 0;
    if (!v9 || v8 != 49185) {
      goto LABEL_17;
    }
    unsigned int v11 = __rev16(*(unsigned __int16 *)(a2 + 6));
    int v12 = *(unsigned __int8 *)(a2 + 4);
    if ((v12 - 9) >= 2)
    {
      if (v12 != 13 || v11 <= 3) {
        goto LABEL_17;
      }
    }

    else if (v11 < 4)
    {
LABEL_17:
      dbglog("%s %P", a2, a3, a4, a5, a6, a7, a8, a1);
      return;
    }

    goto LABEL_17;
  }

uint64_t complete_read(int a1, char *a2, size_t a3)
{
  if (!a3) {
    return 0LL;
  }
  unint64_t v6 = 0LL;
  size_t v7 = a3;
  do
  {
    while (1)
    {
      ssize_t v8 = read(a1, a2, v7);
      if (v8 < 0) {
        break;
      }
      if (v8)
      {
        v6 += v8;
        a2 += v8;
        size_t v7 = a3 - v6;
        if (a3 > v6) {
          continue;
        }
      }

      return v6;
    }
  }

  while (*__error() == 4);
  return -1LL;
}

uint64_t lock(const char *a1)
{
  size_t v2 = strstr(a1, "dev/");
  if (v2)
  {
    int v3 = __dst;
    strncpy(__dst, v2 + 4, 0x3FFuLL);
    __dst[1023] = 0;
    for (uint64_t i = strrchr(__dst, 47); i; uint64_t i = strrchr(__dst, 47))
    {
      *uint64_t i = 95;
      int v3 = __dst;
    }
  }

  else
  {
    int v5 = strrchr(a1, 47);
    if (v5) {
      int v3 = v5 + 1;
    }
    else {
      int v3 = (char *)a1;
    }
  }

  slprintf((int)&byte_100047AC4, 1024, "%s/LCK..%s");
  int v6 = open(&byte_100047AC4, 2562, 420LL, v3);
  if ((v6 & 0x80000000) == 0)
  {
LABEL_9:
    getpid();
    slprintf((int)__buf, 12, "%10d\n");
    write(v6, __buf, 0xBuLL);
    close(v6);
    return 0LL;
  }

  while (1)
  {
    if (*__error() != 17)
    {
      error("Can't create lock file %s: %m", v8, v9, v10, v11, v12, v13, v14, (int)&byte_100047AC4);
      goto LABEL_28;
    }

    int v15 = open(&byte_100047AC4, 0, 0LL);
    if (v15 < 0) {
      break;
    }
    int v16 = v15;
    int v17 = read(v15, __buf, 0xBuLL);
    close(v16);
    if (v17 <= 0)
    {
      error("Can't read pid from lock file %s", v18, v19, v20, v21, v22, v23, v24, (int)&byte_100047AC4);
      goto LABEL_28;
    }

    __buf[v17] = 0;
    uint64_t v25 = atoi(__buf);
    if ((_DWORD)v25 == getpid()) {
      return 1LL;
    }
    if ((_DWORD)v25 && (kill(v25, 0) != -1 || *__error() != 3))
    {
      notice("Device %s is locked by pid %d", v26, v27, v28, v29, v30, v31, v32, (int)v3);
      goto LABEL_28;
    }

    if (unlink(&byte_100047AC4))
    {
      warning("Couldn't remove stale lock on %s", v33, v34, v35, v36, v37, v38, v39, (int)v3);
      goto LABEL_28;
    }

    uint64_t v48 = v25;
    notice("Removed stale lock on %s (pid %d)", v33, v34, v35, v36, v37, v38, v39, (int)v3);
LABEL_20:
    int v47 = open(&byte_100047AC4, 2562, 420LL, v48);
    if ((v47 & 0x80000000) == 0)
    {
      int v6 = v47;
      goto LABEL_9;
    }
  }

  if (*__error() == 2) {
    goto LABEL_20;
  }
  error("Can't open existing lock file %s: %m", v40, v41, v42, v43, v44, v45, v46, (int)&byte_100047AC4);
LABEL_28:
  byte_100047AC4 = 0;
  return 0xFFFFFFFFLL;
}

uint64_t relock()
{
  if (byte_100047AC4)
  {
    int v0 = open(&byte_100047AC4, 1, 0LL);
    if ((v0 & 0x80000000) == 0)
    {
      int v8 = v0;
      slprintf((int)__buf, 12, "%10d\n");
      write(v8, __buf, 0xBuLL);
      close(v8);
      return 0LL;
    }

    error("Couldn't reopen lock file %s: %m", v1, v2, v3, v4, v5, v6, v7, (int)&byte_100047AC4);
    byte_100047AC4 = 0;
  }

  return 0xFFFFFFFFLL;
}

uint64_t unlock()
{
  if (byte_100047AC4)
  {
    uint64_t result = unlink(&byte_100047AC4);
    byte_100047AC4 = 0;
  }

  return result;
}

void log_vpn_interface_address_event(int a1, _DWORD *a2, int a3, int a4, void *a5)
{
  if (a2)
  {
    int v23 = ntohl(a2[16]);
    switch(a2[5])
    {
      case 1:
        addr2ascii(2, a5, 4, v27);
        sub_100022BF0(a2[6]);
        addr2ascii(2, a2 + 12, 4, v26);
        addr2ascii(2, &v23, 4, v25);
        addr2ascii(2, a2 + 18, 4, v24);
        int v15 = "%s: Address added. previous interface setting (name: %s, address: %s), current interface setting (name: %s"
              "%d, family: %s, address: %s, subnet: %s, destination: %s).";
        break;
      case 2:
        addr2ascii(2, a5, 4, v27);
        sub_100022BF0(a2[6]);
        addr2ascii(2, a2 + 12, 4, v26);
        addr2ascii(2, &v23, 4, v25);
        addr2ascii(2, a2 + 18, 4, v24);
        int v15 = "%s: Address changed. previous interface setting (name: %s, address: %s), current interface setting (name: "
              "%s%d, family: %s, address: %s, subnet: %s, destination: %s).";
        break;
      case 3:
        addr2ascii(2, a5, 4, v27);
        sub_100022BF0(a2[6]);
        addr2ascii(2, a2 + 12, 4, v26);
        addr2ascii(2, &v23, 4, v25);
        addr2ascii(2, a2 + 18, 4, v24);
        int v15 = "%s: Address deleted. previous interface setting (name: %s, address: %s), deleted interface setting (name: "
              "%s%d, family: %s, address: %s, subnet: %s, destination: %s).";
        break;
      case 7:
        addr2ascii(2, a5, 4, v27);
        sub_100022BF0(a2[6]);
        addr2ascii(2, a2 + 12, 4, v26);
        int v15 = "%s: ARP collided. previous interface setting (name: %s, address: %s), conflicting interface setting (name:"
              " %s%d, family: %s, address: %s, mac: %x:%x:%x:%x:%x:%x).";
        break;
      default:
        addr2ascii(2, a5, 4, v27);
        sub_100022BF0(a2[6]);
        addr2ascii(2, a2 + 12, 4, v26);
        addr2ascii(2, &v23, 4, v25);
        addr2ascii(2, a2 + 18, 4, v24);
        int v15 = "%s: Other Address event (%d). previous interface setting (name: %s, address: %s), other interface setting "
              "(name: %s%d, family: %s, address: %s, subnet: %s, destination: %s).";
        break;
    }

    notice(v15, v8, v9, v10, v11, v12, v13, v14, a1);
  }

  else
  {
    addr2ascii(2, a5, 4, v27);
    notice( "%s: %d secs TIMEOUT waiting for interface to be reconfigured. previous setting (name: %s, address: %s).",  v16,  v17,  v18,  v19,  v20,  v21,  v22,  a1);
  }

char *sub_100022BF0(int a1)
{
  uint64_t v1 = byte_100047EC4;
  snprintf(byte_100047EC4, 0x10uLL, "%d", a1);
  return v1;
}

BOOL check_vpn_interface_or_service_unrecoverable( const __SCDynamicStore *a1, uint64_t a2, uint64_t a3, char *cStr, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a2;
  if (!a1)
  {
    dbglog("%s: invalid SCDynamicStore reference", a2, a3, (uint64_t)cStr, a5, a6, a7, a8, a2);
    return 0LL;
  }

  if ((*(_DWORD *)(a3 + 20) & 0xFFFFFFFE) != 2) {
    return 0LL;
  }
  CFStringRef v10 = CFStringCreateWithCStringNoCopy(0LL, cStr, 0x600u, kCFAllocatorNull);
  if (v10)
  {
    uint64_t v18 = v10;
    CFMutableDictionaryRef Mutable = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
    uint64_t v20 = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
    CFStringRef NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity( 0LL,  kSCDynamicStoreDomainSetup,  v18,  kSCEntNetAirPort);
    CFArrayAppendValue(Mutable, NetworkInterfaceEntity);
    CFRelease(NetworkInterfaceEntity);
    CFStringRef v22 = SCDynamicStoreKeyCreateNetworkInterfaceEntity(0LL, kSCDynamicStoreDomainState, v18, kSCEntNetAirPort);
    CFArrayAppendValue(Mutable, v22);
    CFRelease(v22);
    CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity( 0LL,  kSCDynamicStoreDomainSetup,  kSCCompAnyRegex,  kSCEntNetInterface);
    CFArrayAppendValue(v20, NetworkServiceEntity);
    CFRelease(NetworkServiceEntity);
    CFStringRef v24 = SCDynamicStoreKeyCreateNetworkServiceEntity(0LL, kSCDynamicStoreDomainSetup, kSCCompAnyRegex, kSCEntNetIPv4);
    CFArrayAppendValue(v20, v24);
    CFRelease(v24);
    uint64_t v25 = SCDynamicStoreCopyMultiple(a1, Mutable, v20);
    CFRelease(Mutable);
    CFRelease(v20);
    if (v25)
    {
      CFIndex Count = CFDictionaryGetCount(v25);
      if (Count <= 0)
      {
        notice("%s: empty SCDynamicStore dictionary", v34, v35, v36, v37, v38, v39, v40, v8);
        CFRelease(v18);
        int v45 = 0;
        int v46 = 0;
      }

      else
      {
        CFIndex v41 = Count;
        if ((unint64_t)Count < 0x81)
        {
          uint64_t v42 = (const void **)v95;
          uint64_t v43 = (const void **)&v94;
        }

        else
        {
          uint64_t v42 = (const void **)CFAllocatorAllocate(0LL, 8 * Count, 0LL);
          uint64_t v43 = (const void **)CFAllocatorAllocate(0LL, 8 * v41, 0LL);
        }

        theDict = v25;
        CFDictionaryGetKeysAndValues(v25, v42, v43);
        uint64_t v47 = 0LL;
        int v45 = 0;
        do
        {
          uint64_t v48 = (const __CFString *)v42[v47];
          unsigned int v49 = (const __CFDictionary *)v43[v47];
          CFTypeID TypeID = CFStringGetTypeID();
          if (v48)
          {
            if (CFGetTypeID(v48) == TypeID)
            {
              CFTypeID v51 = CFDictionaryGetTypeID();
              if (v49)
              {
                if (CFGetTypeID(v49) == v51)
                {
                  if (CFStringHasSuffix(v48, kSCEntNetInterface))
                  {
                    Value = CFDictionaryGetValue(v49, kSCPropNetInterfaceDeviceName);
                    CFTypeID v53 = CFStringGetTypeID();
                    if (Value && CFGetTypeID(Value) == v53 && CFEqual(v18, Value))
                    {
                      ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0LL, v48, @"/");
                      if (CFArrayGetCount(ArrayBySeparatingStrings) < 4)
                      {
                        int v72 = 0;
                      }

                      else
                      {
                        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(ArrayBySeparatingStrings, 3LL);
                        CFStringRef v56 = SCDynamicStoreKeyCreateNetworkServiceEntity( 0LL,  kSCDynamicStoreDomainSetup,  ValueAtIndex,  kSCEntNetIPv4);
                        if (v56)
                        {
                          CFStringRef v64 = v56;
                          if (CFDictionaryGetValue(theDict, v56))
                          {
                            int v72 = 0;
                          }

                          else
                          {
                            notice("%s: detected disabled IPv4 Config", v65, v66, v67, v68, v69, v70, v71, v8);
                            int v72 = 1;
                          }

                          CFRelease(v64);
                        }

                        else
                        {
                          notice("%s: detected disabled IPv4 Config", v57, v58, v59, v60, v61, v62, v63, v8);
                          int v72 = 1;
                        }
                      }

                      if (ArrayBySeparatingStrings) {
                        CFRelease(ArrayBySeparatingStrings);
                      }
                      int v45 = 1;
                      int v46 = 1;
                      if (v72) {
                        goto LABEL_49;
                      }
                    }
                  }

                  else if (CFStringHasSuffix(v48, kSCEntNetAirPort))
                  {
                    if (CFStringHasPrefix(v48, kSCDynamicStoreDomainSetup))
                    {
                      BOOL v73 = CFDictionaryGetValue(v49, @"PowerEnabled");
                      CFTypeID v74 = CFBooleanGetTypeID();
                      if (v73 && CFGetTypeID(v73) == v74 && CFEqual(v73, kCFBooleanFalse))
                      {
                        notice("%s: detected AirPort, PowerEnable == FALSE", v75, v76, v77, v78, v79, v80, v81, v8);
                        int v46 = 1;
                        goto LABEL_49;
                      }
                    }

                    else if (CFStringHasPrefix(v48, kSCDynamicStoreDomainState))
                    {
                      uint64_t v82 = CFDictionaryGetValue(v49, @"Power Status");
                      CFTypeID v83 = CFNumberGetTypeID();
                      if (v82)
                      {
                        if (CFGetTypeID(v82) == v83
                          && CFNumberGetValue((CFNumberRef)v82, kCFNumberShortType, &valuePtr)
                          && !valuePtr)
                        {
                          notice("%s: detected AirPort, PowerStatus == 0", v84, v85, v86, v87, v88, v89, v90, v8);
                        }
                      }
                    }
                  }
                }
              }
            }
          }

          ++v47;
        }

        while (v41 != v47);
        int v46 = 0;
LABEL_49:
        CFRelease(v18);
        if (v42 != (const void **)v95)
        {
          CFAllocatorDeallocate(0LL, v42);
          CFAllocatorDeallocate(0LL, v43);
        }

        uint64_t v25 = theDict;
      }

      CFRelease(v25);
      goto LABEL_53;
    }

    notice("%s: failed to initialize SCDynamicStore dictionary", v26, v27, v28, v29, v30, v31, v32, v8);
    CFRelease(v18);
  }

  else
  {
    notice("%s: failed to initialize interface CFString", v11, v12, v13, v14, v15, v16, v17, v8);
  }

  int v45 = 0;
  int v46 = 0;
LABEL_53:
  if (v45) {
    BOOL v91 = v46 == 0;
  }
  else {
    BOOL v91 = 0;
  }
  return !v91;
}

BOOL check_vpn_interface_address_change(int a1, uint64_t a2, uint64_t a3, uint64_t a4, _DWORD *a5)
{
  BOOL result = 0;
  if (a1)
  {
    if ((*(_DWORD *)(a2 + 20) - 1) <= 1)
    {
      uint64_t v5 = *(unsigned int *)(a2 + 48);
    }
  }

  return result;
}

BOOL check_vpn_interface_alternate(int a1, uint64_t a2)
{
  return a1
      && (*(_DWORD *)(a2 + 20) - 1) <= 1
      && ntohl(*(unsigned int *)(a2 + 48)) >> 16 != 43518;
}

double sub_100023278(int a1)
{
  uint64_t v1 = (char *)&eap + 416 * a1;
  *((_OWORD *)v1 + 24) = 0u;
  *((_OWORD *)v1 + 25) = 0u;
  *((_OWORD *)v1 + 22) = 0u;
  *((_OWORD *)v1 + 23) = 0u;
  *((_OWORD *)v1 + 2notify((uint64_t **)lcp_lowerdown_notify, 0) = 0u;
  *((_OWORD *)v1 + 21) = 0u;
  *((_OWORD *)v1 + 18) = 0u;
  *((_OWORD *)v1 + 19) = 0u;
  *((_OWORD *)v1 + 16) = 0u;
  *((_OWORD *)v1 + 17) = 0u;
  *((_OWORD *)v1 + 14) = 0u;
  *((_OWORD *)v1 + 15) = 0u;
  *((_OWORD *)v1 + 12) = 0u;
  *((_OWORD *)v1 + 13) = 0u;
  *((_OWORD *)v1 + 1notify((uint64_t **)lcp_lowerdown_notify, 0) = 0u;
  *((_OWORD *)v1 + 11) = 0u;
  *((_OWORD *)v1 + 8) = 0u;
  *((_OWORD *)v1 + 9) = 0u;
  *((_OWORD *)v1 + 6) = 0u;
  *((_OWORD *)v1 + 7) = 0u;
  *((_OWORD *)v1 + 4) = 0u;
  *((_OWORD *)v1 + 5) = 0u;
  *((_OWORD *)v1 + 2) = 0u;
  *((_OWORD *)v1 + 3) = 0u;
  *(_OWORD *)uint64_t v1 = 0u;
  *((_OWORD *)v1 + 1) = 0u;
  *((_DWORD *)v1 + 1) = 0;
  *((_DWORD *)v1 + 2) = 0;
  *(_DWORD *)uint64_t v1 = a1;
  *((void *)v1 + 38) = 0xA00000003LL;
  double result = NAN;
  *((void *)v1 + 44) = -1LL;
  return result;
}

void sub_1000232E0( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  __int16 v9 = a3;
  unsigned int v11 = __rev16(*(unsigned __int16 *)(a2 + 2));
  int v12 = v11 - 4;
  uint64_t v15 = (int *)((char *)&eap + 416 * a1);
  int v16 = *(unsigned __int8 *)(a2 + 1);
  switch(*(_BYTE *)a2)
  {
    case 1:
      if (v11 == 4) {
        return;
      }
      int v17 = *(unsigned __int8 *)(a2 + 4);
      switch(v17)
      {
        case 3:
          return;
        case 2:
          info("Remote message: %0.*v", a2, a3, a4, a5, a6, a7, a8, v11 - 5);
          outpacket_buf = 667026431;
          LOBYTE(word_10004412notify((uint64_t **)lcp_lowerdown_notify, 0) = 2;
          HIBYTE(word_10004412notify((uint64_t **)lcp_lowerdown_notify, 0) = v16;
          word_100044122 = 1024;
          uint64_t v25 = *v15;
          uint64_t v26 = 8LL;
          break;
        case 1:
          uint64_t v18 = (const char *)*((void *)&eap + 52 * a1 + 2);
          int v19 = strlen(v18);
          outpacket_buf = 667026431;
          LOBYTE(word_10004412notify((uint64_t **)lcp_lowerdown_notify, 0) = 2;
          HIBYTE(word_10004412notify((uint64_t **)lcp_lowerdown_notify, 0) = v16;
          LOBYTE(word_100044122) = (unsigned __int16)(v19 + 5) >> 8;
          HIBYTE(word_100044122) = v19 + 5;
          byte_100044124 = 1;
          memcpy(byte_100044125, v18, v19 + 1 - 1LL);
          uint64_t v25 = *v15;
          uint64_t v26 = (v19 + 9);
          break;
        default:
          uint64_t v42 = (char *)&eap + 416 * a1;
          uint64_t v43 = *((void *)v42 + 40);
          if (v43)
          {
            if (*(unsigned __int8 *)(v43 + 8) != v17)
            {
              error( "EAP received an unexpected request for type %d",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  *(unsigned __int8 *)(a2 + 4));
              return;
            }

            goto LABEL_26;
          }

          uint64_t v55 = v42 + 320;
          CFStringRef v56 = &eap_extensions;
          while (1)
          {
            CFStringRef v56 = (uint64_t *)*v56;
            if (!v56) {
              break;
            }
            if (*((unsigned __int8 *)v56 + 8) == v17)
            {
              *(void *)uint64_t v55 = v56;
              uint64_t v57 = malloc(0x40uLL);
              uint64_t v58 = (char *)&eap + 416 * a1;
              *((void *)v58 + 42) = v57;
              uint64_t v59 = malloc(0x18uLL);
              *((void *)v58 + 43) = v59;
              if (v57 && v59)
              {
                _DWORD *v57 = 64;
                _WORD *v59 = 24;
                __int16 mtu = netif_get_mtu();
                uint64_t v68 = *((void *)v58 + 42);
                *(_WORD *)(v68 + 4) = mtu;
                uint64_t v69 = (char *)&eap + 416 * a1;
                *(_OWORD *)(v68 + 24) = *((_OWORD *)v69 + 1);
                *(void *)(v68 + 4notify((uint64_t **)lcp_lowerdown_notify, 0) = *((void *)v69 + 4);
                *(void *)(v68 + 48) = dbglog;
                *(void *)(v68 + 56) = error;
                *(_DWORD *)(v68 + 6) = 0;
                uint64_t v70 = *(unsigned int (**)(uint64_t, char *))(*(void *)v55 + 40LL);
                *(void *)(v68 + 16) = *(void *)(*(void *)v55 + 32LL);
                if (v70(v68, v69 + 328))
                {
                  CFTypeID v74 = (const char *)v56[2];
                  if (!v74) {
                    CFTypeID v74 = "???";
                  }
                  error( "EAP cannot initialize plugin for %s (request type %d)",  v71,  v72,  v73,  a5,  a6,  a7,  a8,  (int)v74);
                  auth_withpeer_fail(*v15, 49703);
                  return;
                }

LABEL_26:
                sub_1000246EC((unsigned int *)v15, 4, a2, v9, a5, a6, a7, a8, a9);
                return;
              }

LABEL_65:
              novm((int)"Couldn't allocate memory for EAP Plugin data", v60, v61, v62, v63, v64, v65, v66);
            }
          }

          error("EAP refuse to authenticate using type %d", a2, a3, a4, a5, a6, a7, a8, *(unsigned __int8 *)(a2 + 4));
          if (!eap_extensions) {
            return;
          }
          error( "EAP send NAK requesting type %d",  v91,  v92,  v93,  v94,  v95,  v96,  v97,  *(unsigned __int8 *)(eap_extensions + 8));
          outpacket_buf = 667026431;
          LOBYTE(word_10004412notify((uint64_t **)lcp_lowerdown_notify, 0) = 2;
          HIBYTE(word_10004412notify((uint64_t **)lcp_lowerdown_notify, 0) = v16;
          word_100044122 = 1536;
          byte_100044124 = 3;
          byte_100044125[0] = *(_BYTE *)(eap_extensions + 8);
          uint64_t v25 = *v15;
          uint64_t v26 = 10LL;
          break;
      }

      output(v25, (uint64_t)&outpacket_buf, v26, v20, v21, v22, v23, v24, a9);
      return;
    case 2:
      uint64_t v27 = (char *)&eap + 416 * a1;
      int v29 = *((_DWORD *)v27 + 2);
      uint64_t v28 = v27 + 8;
      if (v11 == 4) {
        return;
      }
      uint64_t v30 = (char *)&eap + 416 * a1;
      uint64_t v31 = (unsigned __int8 *)(a2 + 5);
      int v32 = *(unsigned __int8 *)(a2 + 4);
      uint64_t v33 = (char *)&eap + 416 * a1;
      if (v32 == 3)
      {
        if (!*((void *)v33 + 48)) {
          return;
        }
        uint64_t v34 = v33 + 384;
        untimeout((uint64_t)sub_1000242E0, (uint64_t)v15);
        int v39 = *v31;
        uint64_t v40 = *(void *)v34;
        CFIndex v41 = &eap_extensions;
        while (1)
        {
          CFIndex v41 = (uint64_t *)*v41;
          if (!v41) {
            break;
          }
        }

        if (*(_BYTE *)(v40 + 8))
        {
LABEL_50:
          uint64_t v75 = (char *)&eap + 416 * a1;
          (*(void (**)(void))(v40 + 48))(*((void *)v75 + 49));
          free(*((void **)v75 + 50));
          free(*((void **)v75 + 51));
          *(_OWORD *)uint64_t v34 = 0u;
          *((_OWORD *)v34 + 1) = 0u;
          if (v41) {
            goto LABEL_52;
          }
          CFIndex v41 = *(uint64_t **)v40;
          if (*(void *)v40) {
            goto LABEL_52;
          }
          unint64_t v54 = "Server and client disagree on EAP type";
LABEL_64:
          error(v54, v47, v48, v49, v50, v51, v52, v53, v104);
          *uint64_t v28 = 6;
          auth_peer_fail(*v15, 49703LL, v98, v99, v100, v101, v102, v103);
          return;
        }

LABEL_58:
        uint64_t v87 = (unsigned int *)v15;
        __int16 v88 = 4;
        uint64_t v89 = a2;
        __int16 v90 = v9;
LABEL_60:
        sub_1000243C8(v87, v88, v89, v90, v35, v36, v37, v38, a9);
        return;
      }

      int v44 = v33[298];
      if (v44 && v32 != v44) {
        return;
      }
      untimeout((uint64_t)sub_1000242E0, (uint64_t)v15);
      if (v32 != 1) {
        goto LABEL_58;
      }
      if (v12 >= 256) {
        int v45 = 256;
      }
      else {
        int v45 = v12;
      }
      unsigned int v46 = v45 - 1;
      memcpy((char *)&eap + 416 * a1 + 40, v31, (v45 - 1));
      *((_BYTE *)&eap + 416 * a1 + v46 + 4notify((uint64_t **)lcp_lowerdown_notify, 0) = 0;
      CFIndex v41 = (uint64_t *)eap_extensions;
      if (!eap_extensions)
      {
        unint64_t v54 = "No EAP server protocol available";
        goto LABEL_64;
      }

            int v16 = "ACSP plugin: no memory\n";
            goto LABEL_31;
          }

          goto LABEL_55;
        }

        uint64_t v43 = *(_BYTE *)(v14 + 1);
        if (v18 < 0xB)
        {
LABEL_55:
          a1[12] = v43 + 1;
          if ((ntohs(*(unsigned __int16 *)(v14 + 4)) & 1) != 0)
          {
            *((_DWORD *)a1 + 2) = 5;
            if (*((_DWORD *)a1 + 4)) {
              sub_1000298E4(a1);
            }
            else {
              notify((uint64_t **)acspdhcpready_notifier, 0);
            }
          }

LABEL_52:
      uint64_t v76 = (char *)&eap + 416 * a1;
      *((void *)v76 + 48) = v41;
      v76[298] = *((_BYTE *)v41 + 8);
      uint64_t v77 = malloc(0x40uLL);
      *((void *)v76 + 5notify((uint64_t **)lcp_lowerdown_notify, 0) = v77;
      uint64_t v78 = malloc(0x18uLL);
      *((void *)v76 + 51) = v78;
      if (!v77 || !v78) {
        goto LABEL_65;
      }
      *(_WORD *)uint64_t v77 = 64;
      *uint64_t v78 = 24;
      v77[2] = 1;
      v77[3] = v30[296] + 1;
      __int16 v79 = netif_get_mtu();
      uint64_t v80 = *((void *)v76 + 50);
      *(_WORD *)(v80 + 4) = v79;
      uint64_t v81 = (char *)&eap + 416 * a1;
      *(void *)(v80 + 32) = 0LL;
      *(void *)(v80 + 4notify((uint64_t **)lcp_lowerdown_notify, 0) = 0LL;
      *(void *)(v80 + 48) = dbglog;
      *(void *)(v80 + 56) = error;
      *(_DWORD *)(v80 + 6) = 0;
      uint64_t v82 = *(unsigned int (**)(uint64_t, char *))(*((void *)v76 + 48) + 40LL);
      *(void *)(v80 + 16) = *(void *)(*((void *)v76 + 48) + 32LL);
      *(void *)(v80 + 24) = v81 + 40;
      if (!v82(v80, v81 + 392))
      {
        uint64_t v87 = (unsigned int *)v15;
        __int16 v88 = 1;
        uint64_t v89 = 0LL;
        __int16 v90 = 0;
        goto LABEL_60;
      }

      uint64_t v86 = (const char *)v41[2];
      if (!v86) {
        uint64_t v86 = "???";
      }
      error("EAP cannot initialize plugin for %s (request type %d)", v83, v84, v85, v35, v36, v37, v38, (int)v86);
      return;
    case 3:
      if (*((_DWORD *)&eap + 104 * a1 + 1) != 4) {
        goto LABEL_26;
      }
      return;
    case 4:
      goto LABEL_26;
    default:
      warning("Unknown EAP code (%d) received.", a2, a3, a4, a5, a6, a7, a8, 416);
      return;
  }

double sub_100023954( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*((_DWORD *)&eap + 104 * a1 + 2) >= 2u) {
    auth_peer_fail(a1, 49703LL, a3, a4, a5, a6, a7, a8);
  }
  if (*((_DWORD *)&eap + 104 * a1 + 1) >= 2u) {
    auth_withpeer_fail(a1, 49703);
  }
  return sub_100023A44(a1);
}

void sub_1000239C8( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int16 v9 = (unsigned int *)((char *)&eap + 416 * a1);
  unsigned int v10 = v9[1];
  if (v10)
  {
    if (v10 != 2) {
      goto LABEL_6;
    }
    int v11 = 3;
  }

  else
  {
    int v11 = 1;
  }

  v9[1] = v11;
LABEL_6:
  int v12 = (char *)&eap + 416 * a1;
  int v15 = *((_DWORD *)v12 + 2);
  uint64_t v14 = (int *)(v12 + 8);
  int v13 = v15;
  if (v15)
  {
    if (v13 != 2) {
      return;
    }
    sub_100023F10(v9, a2, a3, a4, a5, a6, a7, a8);
    int v16 = 3;
  }

  else
  {
    int v16 = 1;
  }

  *uint64_t v14 = v16;
}

double sub_100023A44(int a1)
{
  uint64_t v2 = (char *)&eap + 416 * a1;
  int v3 = *((_DWORD *)v2 + 2);
  if (v3 == 3 || v3 == 5)
  {
    uint64_t v5 = sub_1000242E0;
LABEL_10:
    untimeout((uint64_t)v5, (uint64_t)v2);
    goto LABEL_11;
  }

  if (v3 == 4 && *((_DWORD *)&eap + 104 * a1 + 75))
  {
    uint64_t v5 = sub_100024378;
    goto LABEL_10;
  }

uint64_t sub_100023B3C(unsigned __int8 *a1, int a2, void (*a3)(uint64_t, const char *), uint64_t a4)
{
  if (a2 < 4) {
    return 0LL;
  }
  int v6 = a1[2];
  int v7 = a1[3];
  unsigned int v8 = v7 | (v6 << 8);
  int v9 = v8 - 4;
  if (v8 < 4 || v8 > a2) {
    return 0LL;
  }
  uint64_t v13 = *a1;
  int v14 = a1[1];
  else {
    int v15 = " %s";
  }
  a3(a4, v15);
  ((void (*)(uint64_t, const char *, ...))a3)(a4, " id=0x%x", v14);
  if ((v13 - 1) < 2)
  {
    if (v8 >= 5)
    {
      int v18 = a1[4];
      if ((v18 - 1) >= 3)
      {
        uint64_t v21 = &eap_extensions;
        while (1)
        {
          uint64_t v21 = (uint64_t *)*v21;
          if (!v21) {
            break;
          }
        }

        uint64_t v22 = " type=0x%x ";
      }

      else
      {
LABEL_27:
        uint64_t v22 = " %s ";
      }

      a3(a4, v22);
      unsigned int v17 = v8 - 5;
      if (v8 != 5)
      {
        uint64_t v23 = (char *)(a1 + 5);
        if ((v18 - 1) >= 2u)
        {
          uint64_t v24 = &eap_extensions;
          while (1)
          {
            uint64_t v24 = (uint64_t *)*v24;
            if (!v24) {
              break;
            }
            if (*((unsigned __int8 *)v24 + 8) == v18)
            {
              uint64_t v25 = (void (*)(void (*)(uint64_t, const char *), uint64_t, uint64_t, char *, void))v24[11];
              if (v25)
              {
                v25(a3, a4, v13, v23, v8 - 5);
                return v17 + 5;
              }

              break;
            }
          }

          a3(a4, "<");
          do
          {
            int v26 = *v23++;
            ((void (*)(uint64_t, const char *, ...))a3)(a4, "%.2x", v26);
            --v9;
          }

          while (v9 > 1);
        }

        else
        {
          a3(a4, "<");
          print_string(v23, v8 - 5, a3, a4);
        }

        a3(a4, ">");
      }

      return v17 + 5;
    }

    goto LABEL_23;
  }

  int v16 = (char *)(a1 + 4);
  if ((v13 - 3) >= 2)
  {
    if (v8 >= 5)
    {
      unsigned int v19 = (v6 << 8) + v7 - 3;
      do
      {
        int v20 = *v16++;
        ((void (*)(uint64_t, const char *, ...))a3)(a4, " %.2x", v20);
        --v19;
      }

      while (v19 > 1);
      goto LABEL_15;
    }

uint64_t EapAuthWithPeer(uint64_t result)
{
  int v1 = result;
  uint64_t v2 = (void *)eap_extensions;
  if (username) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = eap_extensions == 0;
  }
  if (!v3)
  {
    do
    {
      uint64_t v4 = (uint64_t (*)(char *, uint64_t))v2[12];
      if (v4)
      {
        double result = v4(&username, 256LL);
        if (!(_DWORD)result) {
          break;
        }
      }

      uint64_t v2 = (void *)*v2;
    }

    while (v2);
  }

  uint64_t v5 = (int64x2_t *)((char *)&eap + 416 * v1);
  v5[1] = vdupq_n_s64((unint64_t)&username);
  v5[2].i64[0] = (uint64_t)&passwd;
  if ((v5->i32[1] & 0xFFFFFFFD) != 0) {
    int v6 = 3;
  }
  else {
    int v6 = 2;
  }
  v5->i32[1] = v6;
  return result;
}

void EapAuthPeer(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v8 = (char *)&eap + 416 * a1;
  int v10 = *((_DWORD *)v8 + 2);
  int v9 = v8 + 8;
  *((void *)v9 + 2) = 0LL;
  *((void *)v9 + 3) = 0LL;
  *((void *)v9 + 1) = &user;
  v9[290] = 1;
  *((_DWORD *)v9 + 76) = 0;
  v9[288] = 1;
  if ((v10 | 2) == 2)
  {
    int v11 = 2;
  }

  else
  {
    sub_100023F10((unsigned int *)&eap + 104 * a1, a2, a3, a4, a5, a6, a7, a8);
    int v11 = 3;
  }

  *(_DWORD *)int v9 = v11;
}

void sub_100023F10( unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  outpacket_buf = 667026431;
  LOBYTE(word_10004412notify((uint64_t **)lcp_lowerdown_notify, 0) = 1;
  HIBYTE(word_10004412notify((uint64_t **)lcp_lowerdown_notify, 0) = *((_BYTE *)a1 + 296);
  word_100044122 = 1280;
  byte_100044124 = *((_BYTE *)a1 + 298);
  output(*a1, (uint64_t)&outpacket_buf, 9LL, a4, a5, a6, a7, a8, v9);
  timeout((int)sub_1000242E0);
  ++a1[78];
}

void EapLostSuccess( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v10[0] = 3;
  unsigned int v8 = (char *)&eap + 416 * a1;
  v10[1] = v8[297];
  __int16 v11 = 1024;
  if (*((_DWORD *)v8 + 1) != 4) {
    sub_1000246EC((unsigned int *)&eap + 104 * a1, 4, (uint64_t)v10, 4, a5, a6, a7, a8, v9);
  }
}

void EapLostFailure( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v8 = (unsigned int *)((char *)&eap + 416 * a1);
  v10[0] = 4;
  v10[1] = *((_BYTE *)v8 + 297);
  __int16 v11 = 1024;
  sub_1000246EC(v8, 4, (uint64_t)v10, 4, a5, a6, a7, a8, v9);
}

uint64_t EAPAllowedAddr()
{
  return 1LL;
}

uint64_t EapExtAdd(uint64_t a1)
{
  int v1 = &eap_extensions;
  uint64_t v2 = eap_extensions;
  if (eap_extensions)
  {
    while (1)
    {
      int v1 = (uint64_t *)v2;
      uint64_t v2 = *(void *)v2;
      if (!*v1) {
        goto LABEL_4;
      }
    }
  }

  else
  {
LABEL_4:
    uint64_t v3 = 0LL;
    uint64_t *v1 = a1;
    *(void *)a1 = 0LL;
  }

  return v3;
}

uint64_t EAPClientUIThread(int a1)
{
  char __buf = -1;
  uint64_t v2 = pthread_self();
  if (!pthread_detach(v2))
  {
    uint64_t v4 = *(unsigned int (**)(void, void, char *, char *))(*((void *)&eap + 52 * a1 + 40) + 80LL);
    if (v4)
    {
      if (!v4( *((void *)&eap + 52 * a1 + 45),  *((unsigned int *)&eap + 104 * a1 + 92),  (char *)&eap + 416 * a1 + 360,  (char *)&eap + 416 * a1 + 368)) {
        char __buf = 0;
      }
    }
  }

  write(SHIDWORD(qword_100045F58), &__buf, 1uLL);
  return 0LL;
}

uint64_t EapGetClientSecret(unsigned int *a1, const char *a2, const char *a3, void *a4, int *a5)
{
  int v6 = (int)a3;
  int secret = get_secret((void *)*a1, a2, a3, a4, a5, 0);
  uint64_t result = 0LL;
  if (!secret)
  {
    *a5 = 0;
    warning("No EAP secret found for authenticating us to %s", v7, v8, v9, v10, v11, v12, v13, v6);
    return 1LL;
  }

  return result;
}

uint64_t EapGetServerSecret(unsigned int *a1, const char *a2, const char *a3, void *a4, int *a5)
{
  int v6 = (int)a3;
  *a5 = 0;
  warning("No EAP secret found for authenticating %s", v7, v8, v9, v10, v11, v12, v13, v6);
  return 1LL;
}

uint64_t sub_1000241E0(_BYTE **a1)
{
  int v1 = *a1;
  uint64_t v2 = malloc(0x68uLL);
  if (!v2) {
    novm((int)"Couldn't allocate memory for EAP plugin", v3, v4, v5, v6, v7, v8, v9);
  }
  uint64_t v10 = v2;
  v2[12] = 0LL;
  *((_OWORD *)v2 + 4) = 0u;
  *((_OWORD *)v2 + 5) = 0u;
  *((_OWORD *)v2 + 2) = 0u;
  *((_OWORD *)v2 + 3) = 0u;
  *(_OWORD *)uint64_t v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  if (sys_eaploadplugin(v1, (uint64_t)v2))
  {
    option_error("Couldn't load EAP plugin %s", v11, v12, v13, v14, v15, v16, v17, (int)v1);
    return 1LL;
  }

  if (v10[5] && v10[6] && v10[7])
  {
    int v19 = *((unsigned __int8 *)v10 + 8);
    int v20 = &eap_extensions;
    uint64_t v21 = &eap_extensions;
    while (1)
    {
      uint64_t v21 = (uint64_t *)*v21;
      if (!v21) {
        break;
      }
      if (*((unsigned __int8 *)v21 + 8) == v19)
      {
        option_error( "EAP plugin %s is trying to use an already loaded EAP type %d",  v11,  v12,  v13,  v14,  v15,  v16,  v17,  (int)v1);
        return 0LL;
      }
    }

    while (1)
    {
      uint64_t v22 = *v20;
      if (!*v20) {
        break;
      }
      int v20 = (uint64_t *)*v20;
    }

    *int v20 = (uint64_t)v10;
    *uint64_t v10 = 0LL;
    return 1LL;
  }

  option_error( "EAP plugin %s has no Init() Dispose() or Process() function",  v11,  v12,  v13,  v14,  v15,  v16,  v17,  (int)v1);
  return 0LL;
}

void sub_1000242E0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  int v9 = *(_DWORD *)(a1 + 8);
  if (v9 == 5 || v9 == 3)
  {
    if (*(_DWORD *)(a1 + 312) >= *(_DWORD *)(a1 + 308))
    {
      error("Peer failed to respond to EAP challenge", a2, a3, a4, a5, a6, a7, a8, v18);
      *(_DWORD *)(a1 + 8) = 6;
      auth_peer_fail(*(_DWORD *)a1, 49703LL, v12, v13, v14, v15, v16, v17);
    }

    else if (*(_BYTE *)(a1 + 298) == 1)
    {
      sub_100023F10();
    }

    else
    {
      sub_1000243C8((unsigned int *)a1, 6, 0LL, 0, a5, a6, a7, a8, a9);
    }
  }

uint64_t sub_100024378(uint64_t result)
{
  if (*(_DWORD *)(result + 8) == 4)
  {
    uint64_t v1 = result;
    ++*(_BYTE *)(result + 296);
    *(_DWORD *)(result + 312) = 0;
    uint64_t result = sub_1000243C8();
    *(_DWORD *)(v1 + 8) = 5;
  }

  return result;
}

void sub_1000243C8( unsigned int *a1, __int16 a2, uint64_t a3, __int16 a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  uint64_t v9 = *((void *)a1 + 48);
  if (v9)
  {
    uint64_t v11 = *((void *)a1 + 50);
    *(_WORD *)(v11 + 6) = a2;
    *(void *)(v11 + 16) = a3;
    *(_WORD *)(v11 + 8) = a4;
    uint64_t v12 = *((void *)a1 + 51);
    *(_DWORD *)(v12 + 2) = 0;
    *(void *)(v12 + 8) = 0LL;
    *(void *)(v12 + 16) = 0LL;
    if ((*(unsigned int (**)(void, uint64_t))(v9 + 56))(*((void *)a1 + 49), v11))
    {
      int v20 = *(const char **)(*((void *)a1 + 48) + 16LL);
      if (!v20) {
        int v20 = "???";
      }
      error( "EAP error while processing packet for %s (request type %d, error %d)",  v13,  v14,  v15,  v16,  v17,  v18,  v19,  (int)v20);
    }

    else
    {
      uint64_t v21 = *((void *)a1 + 51);
      unsigned int v22 = *(unsigned __int16 *)(v21 + 2);
      BOOL v23 = v22 > 6;
      int v24 = (1 << v22) & 0x62;
      if (!v23 && v24 != 0)
      {
        int v26 = *(const void **)(v21 + 8);
        if (v26 && (size_t v14 = *(unsigned __int16 *)(v21 + 4), (v14 - 1501) > 0xFFFFFA26))
        {
          outpacket_buf = 667026431;
          memcpy(&word_100044120, v26, v14);
          int v32 = word_100044120;
          a1[78] = 0;
          *((_BYTE *)a1 + 296) = HIBYTE(word_100044120);
          uint64_t v33 = *(void (**)(void, uint64_t))(*((void *)a1 + 48) + 64LL);
          if (v33) {
            v33(*((void *)a1 + 49), v21);
          }
          output( *a1,  (uint64_t)&outpacket_buf,  *(unsigned __int16 *)(v21 + 4) + 4,  v27,  v28,  v29,  v30,  v31,  v63);
          int v34 = *(unsigned __int16 *)(v21 + 2);
          if (v34 == 5)
          {
            timeout((int)sub_1000242E0);
            int v34 = *(unsigned __int16 *)(v21 + 2);
          }

          ++a1[78];
          if (v34 == 6 && (a1[2] | 2) != 6)
          {
            if (*(void *)(v21 + 16)) {
              uint64_t v35 = *(const char **)(v21 + 16);
            }
            else {
              uint64_t v35 = (const char *)(a1 + 10);
            }
            untimeout((uint64_t)sub_1000242E0, (uint64_t)a1);
            if (v32 == 3)
            {
              unsigned int v43 = a1[2];
              a1[2] = 4;
              if (v43 == 3)
              {
                int v44 = *(unsigned int (**)(void, __int16 *))(*((void *)a1 + 48) + 72LL);
                if (v44)
                {
                  __int16 v64 = 1;
                  if (v44(*((void *)a1 + 49), &v64)
                    || (v65 >= 0x10u ? (uint64_t v58 = 16LL) : (uint64_t v58 = v65),
                        __memmove_chk(&mppe_send_key, v66, v58, 16LL),
                        __int16 v64 = 2,
                        (*(unsigned int (**)(void, __int16 *))(*((void *)a1 + 48) + 72LL))( *((void *)a1 + 49),  &v64)))
                  {
                    uint64_t v59 = *(const char **)(*((void *)a1 + 48) + 16LL);
                    if (!v59) {
                      uint64_t v59 = "???";
                    }
                    dbglog( "EAP plugin %s (type %d) does not have %s attribute",  v45,  v46,  v47,  v48,  v49,  v50,  v51,  (int)v59);
                  }

                  else
                  {
                    if (v65 >= 0x10u) {
                      uint64_t v62 = 16LL;
                    }
                    else {
                      uint64_t v62 = v65;
                    }
                    __memmove_chk(&mppe_recv_key, v66, v62, 16LL);
                  }
                }

                size_t v60 = strlen(v35);
                auth_peer_success(*a1, 49703, 0, (uint64_t)v35, v60);
              }

              uint64_t v61 = a1[75];
              if ((_DWORD)v61) {
                timeout((int)sub_100024378);
              }
              notice("EAP peer authentication succeeded for %s", v36, v61, v38, v39, v40, v41, v42, (int)v35);
            }

            else
            {
              error("EAP peer authentication failed for remote host %s", v36, v37, v38, v39, v40, v41, v42, (int)v35);
              a1[2] = 6;
              auth_peer_fail(*a1, 49703LL, v52, v53, v54, v55, v56, v57);
            }
          }
        }

        else
        {
          error( "EAP plugin tries to send a packet with with incorrect data",  (uint64_t)v26,  v14,  v15,  v16,  v17,  v18,  v19,  a9);
        }
      }
    }
  }

void sub_1000246EC( unsigned int *a1, __int16 a2, uint64_t a3, __int16 a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  uint64_t v9 = *((void *)a1 + 40);
  if (v9)
  {
    uint64_t v11 = *((void *)a1 + 42);
    *(_WORD *)(v11 + 6) = a2;
    *(void *)(v11 + 16) = a3;
    *(_WORD *)(v11 + 8) = a4;
    uint64_t v12 = *((void *)a1 + 43);
    *(_DWORD *)(v12 + 2) = 0;
    *(void *)(v12 + 8) = 0LL;
    *(void *)(v12 + 16) = 0LL;
    if ((*(unsigned int (**)(void, uint64_t))(v9 + 56))(*((void *)a1 + 41), v11))
    {
      int v20 = *(const char **)(*((void *)a1 + 40) + 16LL);
      if (!v20) {
        int v20 = "???";
      }
      error( "EAP error while processing packet for %s (request type %d, error %d)",  v13,  v14,  v15,  v16,  v17,  v18,  v19,  (int)v20);
    }

    else
    {
      uint64_t v21 = *((void *)a1 + 43);
      switch(*(_WORD *)(v21 + 2))
      {
        case 1:
          unsigned int v22 = *(const void **)(v21 + 8);
          if (!v22 || (size_t v14 = *(unsigned __int16 *)(v21 + 4), (v14 - 1501) <= 0xFFFFFA26))
          {
            BOOL v23 = "EAP plugin tries to send a packet with with incorrect data";
            goto LABEL_20;
          }

          outpacket_buf = 667026431;
          memcpy(&word_100044120, v22, v14);
          *((_BYTE *)a1 + 297) = HIBYTE(word_100044120);
          int v44 = *(void (**)(void, uint64_t))(*((void *)a1 + 40) + 64LL);
          if (v44) {
            v44(*((void *)a1 + 41), v21);
          }
          output( *a1,  (uint64_t)&outpacket_buf,  *(unsigned __int16 *)(v21 + 4) + 4,  v39,  v40,  v41,  v42,  v43,  a9);
          break;
        case 2:
          *((void *)a1 + 45) = *(void *)(v21 + 8);
          a1[92] = *(unsigned __int16 *)(v21 + 4);
          if (pipe((int *)a1 + 88) < 0)
          {
            BOOL v23 = "EAP failed to create pipe for User Interface...\n";
LABEL_20:
            error(v23, (uint64_t)v22, v14, v15, v16, v17, v18, v19, a9);
          }

          else if (pthread_create( (pthread_t *)a1 + 47,  0LL,  (void *(__cdecl *)(void *))EAPClientUIThread,  (void *)(int)*a1))
          {
            error("EAP failed to create thread for client User Interface...\n", v24, v25, v26, v27, v28, v29, v30, v48);
            close(a1[88]);
            close(a1[89]);
          }

          else
          {
            wait_input_hook = sub_100024A10;
            add_fd(a1[88]);
          }

          break;
        case 3:
          uint64_t v31 = *(unsigned int (**)(void, __int16 *))(*((void *)a1 + 40) + 72LL);
          if (v31)
          {
            __int16 v49 = 1;
            if (v31(*((void *)a1 + 41), &v49)
              || (v50 >= 0x10u ? (uint64_t v45 = 16LL) : (uint64_t v45 = v50),
                  __memmove_chk(&mppe_send_key, v51, v45, 16LL),
                  __int16 v49 = 2,
                  (*(unsigned int (**)(void, __int16 *))(*((void *)a1 + 40) + 72LL))( *((void *)a1 + 41),  &v49)))
            {
              uint64_t v46 = *(const char **)(*((void *)a1 + 40) + 16LL);
              if (!v46) {
                uint64_t v46 = "???";
              }
              dbglog("EAP plugin %s (type %d) does not have %s attribute", v32, v33, v34, v35, v36, v37, v38, (int)v46);
            }

            else
            {
              if (v50 >= 0x10u) {
                uint64_t v47 = 16LL;
              }
              else {
                uint64_t v47 = v50;
              }
              __memmove_chk(&mppe_recv_key, v51, v47, 16LL);
            }
          }

          a1[1] = 4;
          auth_withpeer_success(*a1, 49703, 0);
          break;
        case 4:
          error("EAP authentication failed", v13, v14, v15, v16, v17, v18, v19, v48);
          auth_withpeer_fail(*a1, 49703);
          break;
        case 7:
          auth_withpeer_cancelled(*a1, 49703LL, v14, v15, v16, v17, v18, v19);
          break;
        default:
          return;
      }
    }
  }

void sub_100024A10()
{
  if ((_DWORD)qword_100045F58 != -1 && is_ready_fd(qword_100045F58))
  {
    unsigned __int8 v8 = 0;
    read(qword_100045F58, &v8, 1uLL);
    wait_input_hook = 0LL;
    remove_fd(qword_100045F58);
    close(qword_100045F58);
    close(SHIDWORD(qword_100045F58));
    qword_100045F58 = -1LL;
    if (v8 == 255)
    {
      uint64_t v7 = *(const char **)(qword_100045F38 + 16);
      if (!v7) {
        uint64_t v7 = "???";
      }
      error("EAP error while requesting user input for %s (request type %d)", v0, v1, v2, v3, v4, v5, v6, (int)v7);
    }

    else
    {
      sub_1000246EC(&eap, 5LL, qword_100045F60, dword_100045F68);
    }
  }

void sub_100024AE8(int a1)
{
  uint64_t v2 = (char *)&ecp_fsm + 80 * a1;
  *(_DWORD *)uint64_t v2 = a1;
  *((_DWORD *)v2 + 1) = 32851;
  *((void *)v2 + 7) = &unk_1000424D8;
  fsm_init((uint64_t)v2);
  ecp_wantoptions[a1] = 0LL;
  *(void *)&ecp_gotoptions[8 * a1] = 0LL;
  ecp_allowoptions[a1] = 0LL;
  ecp_hisoptions[a1] = 0LL;
}

uint64_t sub_100024B5C()
{
  return 0LL;
}

double sub_100024B64(int a1)
{
  uint64_t v1 = (char *)&ipv6cp_fsm + 80 * a1;
  uint64_t v2 = (char *)&ipv6cp_wantoptions + 52 * a1;
  uint64_t v3 = (char *)&ipv6cp_allowoptions + 52 * a1;
  *(_DWORD *)uint64_t v1 = a1;
  *((_DWORD *)v1 + 1) = 32855;
  *((void *)v1 + 7) = off_100042A78;
  fsm_init((uint64_t)v1);
  double result = 0.0;
  *((_DWORD *)v2 + 12) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  *((_OWORD *)v2 + 2) = 0u;
  *(_OWORD *)uint64_t v2 = 0u;
  *(_OWORD *)uint64_t v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *((_OWORD *)v3 + 2) = 0u;
  *((_DWORD *)v3 + 12) = 0;
  *((_DWORD *)v2 + 2) = 1;
  *(_DWORD *)uint64_t v2 = 1;
  *(_DWORD *)uint64_t v3 = 1;
  return result;
}

void sub_100024BF0( int a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
}

void sub_100024C04( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100024C18( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100024C2C(int a1)
{
}

void sub_100024C40( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  byte_100047F28 = 1;
}

void sub_100024C70(int a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t sub_100024C84(unsigned __int8 *a1, int a2, void (*a3)(uint64_t, const char *), uint64_t a4)
{
  if (a2 < 4) {
    return 0LL;
  }
  unsigned int v6 = __rev16(*((unsigned __int16 *)a1 + 1));
  int v7 = v6 - 4;
  if (v6 < 4 || v6 > a2) {
    return 0LL;
  }
  int v11 = *a1;
  int v12 = a1[1];
  uint64_t v13 = a1 + 4;
  else {
    size_t v14 = " %s";
  }
  a3(a4, v14);
  ((void (*)(uint64_t, const char *, ...))a3)(a4, " id=0x%x", v12);
  if ((v11 - 1) < 4)
  {
    if (v6 >= 6)
    {
      while (1)
      {
        uint64_t v15 = v13[1];
        int v17 = *v13;
        a3(a4, " <");
        if (v17 == 1)
        {
          uint64_t v19 = v13;
          if ((_DWORD)v15 == 10)
          {
            uint64_t v19 = v13 + 10;
            unsigned int v22 = eui64_ntoa(*(void *)(v13 + 2));
            snprintf(byte_100047ED4, 0x40uLL, "fe80::%s", v22);
            uint64_t v20 = a4;
            uint64_t v21 = "addr %s";
            goto LABEL_28;
          }
        }

        else
        {
          BOOL v18 = v17 == 2 && v15 >= 4;
          uint64_t v19 = v13;
          if (v18)
          {
            uint64_t v19 = v13 + 4;
            a3(a4, "compress ");
            uint64_t v20 = a4;
            uint64_t v21 = "0x%x";
LABEL_28:
            a3(v20, v21);
          }
        }

        if (v19 < &v13[v15])
        {
          BOOL v23 = &v13[v15];
          int64_t v24 = v23 - v19;
          do
          {
            int v25 = *v19++;
            ((void (*)(uint64_t, const char *, ...))a3)(a4, " %.2x", v25);
            --v24;
          }

          while (v24);
          uint64_t v19 = v23;
        }

        v7 -= v15;
        a3(a4, ">");
        uint64_t v13 = v19;
        if (v7 <= 1) {
          goto LABEL_40;
        }
      }
    }

void sub_100024F14()
{
  if (!byte_100042A20) {
    return;
  }
  int v0 = dword_100046018;
  if (dword_100046024) {
    BOOL v1 = dword_100046018 == 0;
  }
  else {
    BOOL v1 = 0;
  }
  if (!v1 || dword_10004601C != 0) {
    goto LABEL_13;
  }
  if (!ether_to_eui64((uint64_t)&qword_100046030))
  {
    int v0 = dword_100046018;
LABEL_13:
    if (!v0)
    {
      int v4 = qword_100046030;
      int v3 = HIDWORD(qword_100046030);
      if (dword_100046020) {
        BOOL v5 = qword_100046030 == 0;
      }
      else {
        BOOL v5 = 0;
      }
      if (v5)
      {
        LODWORD(qword_10004603notify((uint64_t **)lcp_lowerdown_notify, 0) = 0;
        uint64_t v6 = ntohl(dword_10004377C);
        int v3 = htonl(v6);
        HIDWORD(qword_10004603notify((uint64_t **)lcp_lowerdown_notify, 0) = v3;
        int v4 = 0;
        if (v3) {
          dword_100046018 = 1;
        }
      }

      if (!(v3 | v4))
      {
        do
        {
          LODWORD(qword_10004603notify((uint64_t **)lcp_lowerdown_notify, 0) = magic();
          HIDWORD(qword_10004603notify((uint64_t **)lcp_lowerdown_notify, 0) = magic();
          LOBYTE(qword_10004603notify((uint64_t **)lcp_lowerdown_notify, 0) = qword_100046030 & 0xFD;
        }

        while (!qword_100046030);
      }
    }

    goto LABEL_23;
  }

  dword_100046018 = 1;
LABEL_23:
  if (dword_10004601C) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = dword_100046020 == 0;
  }
  if (!v7 && !qword_100046038)
  {
    LODWORD(qword_100046038) = 0;
    uint64_t v8 = ntohl(dword_100043780);
    HIDWORD(qword_100046038) = htonl(v8);
    if (HIDWORD(qword_100046038)) {
      dword_10004601C = 1;
    }
  }

BOOL sub_100025068(unsigned __int8 *a1, int a2)
{
  if (a2 < 44) {
    return 0LL;
  }
  int v3 = a1[10];
  if (v3 != 6) {
    return v3 != 44;
  }
  return a2 >= 0x40 && ((a1[57] & 1) == 0 || a2 - 4 != ((a1[56] >> 2) & 0x3C) + 40);
}

uint64_t sub_1000250C8(int a1)
{
  return *((unsigned int *)&ipv6cp_fsm + 20 * a1 + 2);
}

char *llv6_ntoa(unint64_t a1)
{
  BOOL v1 = eui64_ntoa(a1);
  snprintf(byte_100047ED4, 0x40uLL, "fe80::%s", v1);
  return byte_100047ED4;
}

uint64_t sub_100025128(const char **a1)
{
  BOOL v1 = *a1;
  uint64_t v2 = strchr(*a1, 44);
  if (!v2) {
    uint64_t v2 = (char *)&v1[strlen(v1)];
  }
  if (v2 == v1)
  {
    if (!*v1) {
      goto LABEL_31;
    }
  }

  else
  {
    int v3 = *v2;
    char *v2 = 0;
    if (inet_pton(30, v1, &v26)) {
      BOOL v11 = v26 == 0;
    }
    else {
      BOOL v11 = 0;
    }
    BOOL v12 = v11 && v27 == 0;
    if (!v12 || !v28)
    {
      option_error("Illegal interface identifier (local): %s", v4, v5, v6, v7, v8, v9, v10, (int)v1);
      return 0LL;
    }

    if (option_priority >= dword_100047F14)
    {
      qword_100046030 = v28;
      dword_100046018 = 1;
      dword_100047F14 = option_priority;
    }

    char *v2 = v3;
    if (!v3) {
      goto LABEL_31;
    }
  }

  int v14 = v2[1];
  uint64_t v13 = v2 + 1;
  if (v14)
  {
    if (inet_pton(30, v13, &v26)) {
      BOOL v22 = v26 == 0;
    }
    else {
      BOOL v22 = 0;
    }
    BOOL v23 = v22 && v27 == 0;
    if (v23 && v28)
    {
      if (option_priority >= dword_100047F18)
      {
        qword_100046038 = v28;
        dword_10004601C = 1;
        dword_100047F18 = option_priority;
      }

      goto LABEL_31;
    }

    option_error("Illegal interface identifier (remote): %s", v15, v16, v17, v18, v19, v20, v21, (int)v13);
    return 0LL;
  }

uint64_t sub_1000252D0(uint64_t a1, void (*a2)(uint64_t, const char *, ...), uint64_t a3)
{
  if (dword_100046018)
  {
    uint64_t v5 = eui64_ntoa(qword_100046030);
    snprintf(byte_100047ED4, 0x40uLL, "fe80::%s", v5);
    a2(a3, "%s", byte_100047ED4);
  }

  uint64_t result = ((uint64_t (*)(uint64_t, const char *))a2)(a3, ",");
  if (dword_10004601C)
  {
    uint64_t v7 = eui64_ntoa(qword_100046038);
    snprintf(byte_100047ED4, 0x40uLL, "fe80::%s", v7);
    return ((uint64_t (*)(uint64_t, const char *, ...))a2)(a3, "%s", byte_100047ED4);
  }

  return result;
}

__n128 sub_1000253A8(int *a1)
{
  int v1 = *a1;
  uint64_t v2 = (char *)&ipv6cp_wantoptions + 52 * *a1;
  int v3 = *(_DWORD *)v2;
  if (*(_DWORD *)v2) {
    int v3 = *((_DWORD *)&ipv6cp_allowoptions + 13 * v1) != 0;
  }
  uint64_t v4 = (char *)&ipv6cp_wantoptions + 52 * v1;
  *((_DWORD *)v4 + 1) = v3;
  if (!*((_DWORD *)v4 + 3))
  {
    uint64_t v5 = (_DWORD *)((char *)&ipv6cp_wantoptions + 52 * v1 + 36);
    do
    {
      *uint64_t v5 = magic();
      int v6 = magic();
      *((_DWORD *)&ipv6cp_wantoptions + 13 * v1 + 1notify((uint64_t **)lcp_lowerdown_notify, 0) = v6;
      *(_BYTE *)v5 &= ~2u;
    }

    while (!(*v5 | v6));
  }

  uint64_t v7 = (char *)&ipv6cp_gotoptions + 52 * v1;
  __int128 v8 = *((_OWORD *)v2 + 2);
  *((_OWORD *)v7 + 1) = *((_OWORD *)v2 + 1);
  *((_OWORD *)v7 + 2) = v8;
  __n128 result = *(__n128 *)v2;
  *(_OWORD *)uint64_t v7 = *(_OWORD *)v2;
  *((_DWORD *)v7 + 11) = 0;
  *((_DWORD *)v7 + 12) = 0;
  return result;
}

uint64_t sub_10002546C(int *a1)
{
  int v1 = (_DWORD *)((char *)&ipv6cp_gotoptions + 52 * *a1);
  if (*v1) {
    int v2 = 10;
  }
  else {
    int v2 = 0;
  }
  return v2 | (4 * (v1[7] != 0));
}

int *sub_1000254A4(int *result, uint64_t a2, int *a3)
{
  int v3 = *result;
  uint64_t v4 = (_DWORD *)((char *)&ipv6cp_gotoptions + 52 * *result);
  int v5 = *a3;
  if (*v4)
  {
    if (v5 < 10)
    {
      *uint64_t v4 = 0;
    }

    else
    {
      *(_WORD *)a2 = 2561;
      *(void *)(a2 + 2) = *(void *)((char *)&ipv6cp_gotoptions + 52 * v3 + 36);
      a2 += 10LL;
      v5 -= 10;
    }
  }

  int v6 = (char *)&ipv6cp_gotoptions + 52 * v3;
  int v8 = *((_DWORD *)v6 + 7);
  uint64_t v7 = v6 + 28;
  if (v8)
  {
    if (v5 < 4)
    {
      *uint64_t v7 = 0;
    }

    else
    {
      *(_WORD *)a2 = 1026;
      uint64_t v9 = (char *)&ipv6cp_gotoptions + 52 * v3;
      *(_BYTE *)(a2 + 2) = v9[33];
      *(_BYTE *)(a2 + 3) = v9[32];
      v5 -= 4;
    }
  }

  *a3 -= v5;
  return result;
}

BOOL sub_100025548(int *a1, uint64_t a2, int a3)
{
  int v3 = *a1;
  if (*((_DWORD *)&ipv6cp_gotoptions + 13 * *a1))
  {
    BOOL v4 = __OFSUB__(a3, 10);
    a3 -= 10;
    if (a3 < 0 != v4) {
      return 0LL;
    }
    if (*(_BYTE *)(a2 + 1) != 10 || *(_BYTE *)a2 != 1) {
      return 0LL;
    }
    int v6 = (char *)&ipv6cp_gotoptions + 52 * v3;
    int v8 = *((_DWORD *)v6 + 9);
    uint64_t v7 = v6 + 36;
    if (v8 != *(_DWORD *)(a2 + 2) || *((_DWORD *)v7 + 1) != *(_DWORD *)(a2 + 6)) {
      return 0LL;
    }
    a2 += 10LL;
  }

  if (*((_DWORD *)&ipv6cp_gotoptions + 13 * v3 + 7))
  {
    BOOL v4 = __OFSUB__(a3, 4);
    a3 -= 4;
    if (a3 < 0 != v4
      || *(_BYTE *)(a2 + 1) != 4
      || *(_BYTE *)a2 != 2
      || *((unsigned __int16 *)&ipv6cp_gotoptions + 26 * v3 + 16) != bswap32(*(unsigned __int16 *)(a2 + 2)) >> 16)
    {
      return 0LL;
    }
  }

  return !a3;
}

uint64_t sub_10002560C(int *a1, unsigned __int8 *a2, int a3)
{
  int v3 = a1;
  int v4 = 0;
  int v5 = *a1;
  int v6 = (char *)&ipv6cp_gotoptions + 52 * *a1;
  int v7 = *(_DWORD *)v6;
  __int128 v39 = *(_OWORD *)(v6 + 4);
  uint64_t v40 = *(void *)(v6 + 20);
  int v8 = *((_DWORD *)v6 + 7);
  int v9 = *((_DWORD *)v6 + 8);
  unsigned int v11 = *((_DWORD *)v6 + 9);
  int v10 = *((_DWORD *)v6 + 10);
  uint64_t v12 = *(void *)(v6 + 44);
  int v13 = a3 - 10;
  if (a3 < 10 || !v7) {
    goto LABEL_12;
  }
  if (a2[1] != 10 || *a2 != 1)
  {
    int v4 = 0;
LABEL_12:
    int v18 = *((_DWORD *)v6 + 7);
    int v13 = a3;
    int v14 = a2;
    goto LABEL_13;
  }

  int v14 = a2 + 10;
  if (*((_DWORD *)&ipv6cp_gotoptions + 13 * v5 + 2))
  {
    int v33 = *(_DWORD *)v6;
    uint64_t v35 = *(void *)(v6 + 44);
    int v37 = *((_DWORD *)v6 + 8);
    int v15 = *((_DWORD *)v6 + 7);
    int v10 = *(_DWORD *)(a2 + 6);
    int v16 = *(_DWORD *)(a2 + 2);
    for (int i = v16; ; int i = v16 & 0xFD)
    {
      unsigned int v11 = i | v16 & 0xFFFFFF00;
      if (v11 | v10)
      {
        if (v11 != *((_DWORD *)&ipv6cp_gotoptions + 13 * v5 + 11)
          || v10 != *((_DWORD *)&ipv6cp_gotoptions + 13 * v5 + 12))
        {
          break;
        }
      }

      int v16 = magic();
      int v10 = magic();
    }

    int v18 = *((_DWORD *)&ipv6cp_gotoptions + 13 * v5 + 7);
    int v4 = 1;
    int v8 = v15;
    int v9 = v37;
    uint64_t v12 = v35;
    int v7 = v33;
  }

  else
  {
    int v4 = 1;
    int v18 = *((_DWORD *)v6 + 7);
  }

uint64_t sub_1000258F0(uint64_t result, uint64_t a2, int a3)
{
  uint64_t v3 = result;
  int v4 = *(_DWORD *)result;
  int v5 = (_DWORD *)((char *)&ipv6cp_gotoptions + 52 * *(int *)result);
  LODWORD(result) = *v5;
  int v6 = v5[7];
  if (a3 >= 10 && (_DWORD)result && *(_BYTE *)(a2 + 1) == 10 && *(_BYTE *)a2 == 1)
  {
    int v7 = (char *)&ipv6cp_gotoptions + 52 * v4;
    int v9 = *((_DWORD *)v7 + 9);
    int v8 = v7 + 36;
    if (*(_DWORD *)(a2 + 2) != v9) {
      return 0LL;
    }
    __n128 result = 0LL;
    if (*(_DWORD *)(a2 + 6) != *((_DWORD *)v8 + 1)) {
      return result;
    }
    a2 += 10LL;
    a3 -= 10;
  }

  if (v6)
  {
    if (*(_BYTE *)(a2 + 1) == 4 && a3 >= 4)
    {
      if (*(_BYTE *)a2 != 2
        || *((unsigned __int16 *)&ipv6cp_gotoptions + 26 * v4 + 16) != bswap32(*(unsigned __int16 *)(a2 + 2)) >> 16)
      {
        return 0LL;
      }

      int v6 = 0;
      a3 -= 4;
    }
  }

  if (a3) {
    return 0LL;
  }
  if (*(_DWORD *)(v3 + 8) != 9)
  {
    *int v5 = result;
    v5[7] = v6;
  }

  return 1LL;
}

uint64_t sub_1000259D4(int *a1, char *__src, int *a3, int a4)
{
  int v4 = *a1;
  int v37 = (char *)&ipv6cp_hisoptions + 52 * *a1;
  int v38 = (_DWORD *)((char *)&ipv6cp_allowoptions + 52 * *a1);
  int v31 = *a1;
  int v5 = *a3;
  *((_DWORD *)v37 + 12) = 0;
  *((_OWORD *)v37 + 1) = 0u;
  *((_OWORD *)v37 + 2) = 0u;
  *(_OWORD *)int v37 = 0u;
  int v6 = (char *)&ipv6cp_gotoptions + 52 * v4;
  int v7 = v6 + 36;
  int v8 = (unint64_t *)((char *)&ipv6cp_wantoptions + 52 * v4 + 44);
  int v9 = (uint64_t *)(v6 + 44);
  uint64_t v36 = v37 + 44;
  BOOL v33 = a4 != 0;
  uint64_t v10 = 2LL;
  unsigned int v11 = __src;
  uint64_t v12 = __src;
  while (v5)
  {
    int v13 = v11;
    if (v5 < 2
      || ((uint64_t v14 = v11[1], v14 >= 2) ? (v15 = v5 >= v14) : (v15 = 0), !v15))
    {
      LOWORD(v14) = v5;
      int v16 = 1;
      int v5 = 0;
      goto LABEL_43;
    }

    int v16 = *v11;
    v5 -= v14;
    v11 += v14;
    if (v16 != 1)
    {
      int v16 = 1;
      goto LABEL_43;
    }

    if ((_DWORD)v14 != 10 || !*v38) {
      goto LABEL_43;
    }
    unint64_t v17 = *(void *)(v13 + 2);
    LODWORD(v18) = v17;
    unint64_t v19 = HIDWORD(v17);
    if (!v17 && !*(void *)v7)
    {
      int v16 = 1;
      goto LABEL_42;
    }

    if (!*v8 || *v8 == v17 || *v9)
    {
      if (!v17 || *(void *)v7 == v17)
      {
        if (!*v9)
        {
          unint64_t v17 = *v8;
          unint64_t v19 = HIDWORD(*v8);
          unint64_t v18 = *v8;
        }

        unsigned int v20 = v17;
        while (!(v19 | v18)
             || (_DWORD)v18 == *(_DWORD *)v7 && (_DWORD)v19 == *((_DWORD *)v7 + 1))
        {
          LODWORD(v17) = magic();
          unint64_t v19 = magic();
          unsigned int v20 = v17 & 0xFD;
          LODWORD(v18) = v17 & 0xFFFFFFFD;
        }

        uint64_t v21 = v17 & 0xFFFFFF00 | v20 | (v19 << 32);
        goto LABEL_30;
      }

      *(_DWORD *)int v37 = 1;
      *uint64_t v36 = v17;
      if ((_DWORD)v10 == 2)
      {
        int v16 = 0;
LABEL_42:
        LOWORD(v14) = 10;
        goto LABEL_43;
      }
    }

    else
    {
      uint64_t v21 = *v8;
      unsigned int v20 = *v8;
      unint64_t v19 = HIDWORD(*v8);
      unint64_t v17 = *v8;
LABEL_30:
      *int v9 = v21;
      uint64_t v22 = v17 & 0xFFFFFF00 | v20 | (v19 << 32);
      *(void *)(v13 + 2) = v22;
      *(_DWORD *)int v37 = 1;
      *uint64_t v36 = v22;
      if (a4)
      {
        LOWORD(v14) = 10;
        int v16 = v33;
        goto LABEL_43;
      }

      if ((_DWORD)v10 != 4)
      {
        BOOL v23 = (_DWORD)v10 == 2;
        LOWORD(v14) = 10;
        LODWORD(v1notify((uint64_t **)lcp_lowerdown_notify, 0) = 3;
        int v16 = v33;
        if (v23) {
          int v16 = 0;
        }
        if (v23) {
          uint64_t v12 = __src;
        }
LABEL_43:
        BOOL v24 = v10 != 4;
        if ((v16 & v24) != 0) {
          uint64_t v10 = 4LL;
        }
        else {
          uint64_t v10 = v10;
        }
        if ((v16 & v24) != 0) {
          uint64_t v25 = __src;
        }
        else {
          uint64_t v25 = v12;
        }
        uint64_t v26 = (unsigned __int16)v14;
        if (v25 != v13) {
          memcpy(v25, v13, (unsigned __int16)v14);
        }
        uint64_t v12 = &v25[v26];
      }
    }
  }

  if ((_DWORD)v10 != 4 && !*(_DWORD *)v37 && !a4)
  {
    int v27 = (char *)&ipv6cp_wantoptions + 52 * v31;
    int v29 = *((_DWORD *)v27 + 1);
    uint64_t v28 = v27 + 4;
    if (v29)
    {
      if ((_DWORD)v10 == 2)
      {
        *uint64_t v28 = 0;
        uint64_t v12 = __src;
      }

      *(_WORD *)uint64_t v12 = 2561;
      *(void *)(v12 + 2) = *v8;
      LODWORD(v12) = (_DWORD)v12 + 10;
      uint64_t v10 = 3LL;
    }
  }

  *a3 = (_DWORD)v12 - (_DWORD)__src;
  return v10;
}

void sub_100025D2C( unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v9 = *a1;
  if (!*((_DWORD *)&ipv6cp_hisoptions + 13 * (int)*a1)) {
    *(void *)((char *)&ipv6cp_hisoptions + 52 * (int)v9 + 44) = *(void *)((char *)&ipv6cp_wantoptions
  }
                                                                            + 52 * (int)v9
                                                                            + 44);
  if (!no_ifaceid_neg)
  {
    uint64_t v41 = (char *)&ipv6cp_hisoptions + 52 * (int)v9;
    int v42 = *((_DWORD *)v41 + 11);
    int v43 = *((_DWORD *)v41 + 12);
    if (v43 | v42)
    {
      int v44 = (char *)&ipv6cp_gotoptions + 52 * (int)v9;
      int v45 = *((_DWORD *)v44 + 9);
      int v46 = *((_DWORD *)v44 + 10);
      if (v46 | v45)
      {
        if (v45 != v42 || v46 != v43) {
          goto LABEL_4;
        }
        int v48 = "local and remote LL addresses are equal";
      }

      else
      {
        int v48 = "Could not determine local LL address";
      }
    }

    else
    {
      int v48 = "Could not determine remote LL address";
    }

    error(v48, a2, a3, a4, a5, a6, a7, a8, v52);
    unsigned __int16 v50 = (char *)&ipv6cp_fsm + 80 * (int)*a1;
    uint64_t v51 = v48;
    goto LABEL_27;
  }

LABEL_4:
  uint64_t v10 = (char *)&ipv6cp_gotoptions + 52 * (int)v9;
  unint64_t v12 = *(void *)(v10 + 36);
  unsigned int v11 = (uint64_t *)(v10 + 36);
  int v13 = eui64_ntoa(v12);
  snprintf(byte_100047ED4, 0x40uLL, "fe80::%s", v13);
  script_setenv("LLLOCAL", byte_100047ED4);
  uint64_t v14 = (char *)&ipv6cp_hisoptions + 52 * (int)v9;
  unint64_t v16 = *(void *)(v14 + 44);
  BOOL v15 = (uint64_t *)(v14 + 44);
  unint64_t v17 = eui64_ntoa(v16);
  snprintf(byte_100047ED4, 0x40uLL, "fe80::%s", v17);
  script_setenv("LLREMOTE", byte_100047ED4);
  if (!sif6addr(*a1, *v11, *v15))
  {
    if (debug)
    {
      __int16 v49 = "sif6addr failed";
LABEL_21:
      warning(v49, v18, v19, v20, v21, v22, v23, v24, v53);
    }

uint64_t sub_100026004(unsigned int *a1)
{
  if (byte_100047F1C == 1)
  {
    byte_100047F1C = 0;
    np_down();
  }

  sifnpmode(*a1, 87, 1);
  sifdown();
  uint64_t result = cif6addr();
  if (byte_100047F20 == 1 && dword_100047F24 == 0)
  {
    byte_100047F20 = 0;
    return sub_10002610C("/etc/ppp/ipv6-down");
  }

  return result;
}

void sub_1000260C0( unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (byte_100047F28 == 1)
  {
    byte_100047F28 = 0;
    np_finished(*a1, 87LL, a3, a4, a5, a6, a7, a8);
  }

uint64_t **sub_1000260E4(uint64_t **result)
{
  if (*((_DWORD *)result + 6) - *((_DWORD *)result + 7) == 2) {
    return notify((uint64_t **)protocolsready_notifier, 0);
  }
  return result;
}

uint64_t sub_10002610C(char *a1)
{
  int v2 = eui64_ntoa(qword_100046064);
  snprintf(byte_100047ED4, 0x40uLL, "fe80::%s", v2);
  __strlcpy_chk(v7, byte_100047ED4, 32LL, 32LL);
  uint64_t v3 = eui64_ntoa(qword_1000460D4);
  snprintf(byte_100047ED4, 0x40uLL, "fe80::%s", v3);
  __strlcpy_chk(v6, byte_100047ED4, 32LL, 32LL);
  v5[0] = a1;
  v5[1] = &ifname;
  v5[2] = (char *)&devnam;
  v5[3] = __str;
  v5[4] = v7;
  v5[5] = v6;
  v5[6] = (char *)ipparam;
  v5[7] = 0LL;
  uint64_t result = run_program(a1, v5, 0, (uint64_t)sub_10002626C, 0LL);
  dword_100047F24 = result;
  return result;
}

void sub_10002626C()
{
  dword_100047F24 = 0;
  if (byte_100047F20 == 1)
  {
    if (dword_1000460E8 == 9) {
      return;
    }
    int v0 = "/etc/ppp/ipv6-down";
  }

  else
  {
    if (dword_1000460E8 != 9) {
      return;
    }
    int v0 = "/etc/ppp/ipv6-up";
  }

  byte_100047F20 ^= 1u;
  sub_10002610C(v0);
}

char *eui64_ntoa(unint64_t a1)
{
  return byte_100047F29;
}

void sub_100026330(int a1)
{
  int v1 = (char *)&acscp_fsm + 80 * a1;
  acsp_no_routes = 0;
  acsp_no_domains = 0;
  *(_DWORD *)int v1 = a1;
  *((_DWORD *)v1 + 1) = 33333;
  *((void *)v1 + 7) = off_100042F58;
  fsm_init((uint64_t)v1);
  *(void *)&acscp_wantoptions = 0x100000000LL;
  *((void *)&acscp_wantoptions + 1) = &_mh_execute_header;
  acscp_allowoptions = 0x100000000LL;
  *(void *)&byte_100046178 = &_mh_execute_header;
}

void sub_1000263A4( int a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
}

void sub_1000263B8( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000263CC( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000263E0(int a1)
{
}

void sub_1000263F4( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  byte_100047F4C = 1;
}

void sub_100026424(int a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t sub_100026438(unsigned __int8 *a1, int a2, void (*a3)(uint64_t, const char *), uint64_t a4)
{
  if (a2 < 4) {
    return 0LL;
  }
  unsigned int v6 = __rev16(*((unsigned __int16 *)a1 + 1));
  int v7 = v6 - 4;
  if (v6 < 4 || v6 > a2) {
    return 0LL;
  }
  int v11 = *a1;
  int v12 = a1[1];
  int v13 = a1 + 4;
  else {
    uint64_t v14 = " %s";
  }
  a3(a4, v14);
  ((void (*)(uint64_t, const char *, ...))a3)(a4, " id=0x%x", v12);
  if ((v11 - 1) < 4)
  {
    if (v6 >= 6)
    {
      while (1)
      {
        uint64_t v15 = v13[1];
        int v17 = *v13;
        a3(a4, " <");
        if (v17 == 1) {
          break;
        }
        uint64_t v18 = v13;
        if (v17 == 2)
        {
          uint64_t v19 = "domain vers %d";
LABEL_23:
          uint64_t v18 = v13 + 6;
          htonl(bswap32(*(_DWORD *)(v13 + 2)));
          a3(a4, v19);
        }

        if (v18 < &v13[v15])
        {
          uint64_t v20 = &v13[v15];
          int64_t v21 = v20 - v18;
          do
          {
            int v22 = *v18++;
            ((void (*)(uint64_t, const char *, ...))a3)(a4, " %.2x", v22);
            --v21;
          }

          while (v21);
          uint64_t v18 = v20;
        }

        v7 -= v15;
        a3(a4, ">");
        int v13 = v18;
        if (v7 <= 1) {
          goto LABEL_35;
        }
      }

      uint64_t v19 = "route vers %d";
      goto LABEL_23;
    }

void *sub_10002667C()
{
  if (byte_100042F00) {
    BOOL v0 = 0;
  }
  else {
    BOOL v0 = acsp_use_dhcp == 0;
  }
  if (!v0 || acsp_intercept_dhcp != 0)
  {
    uint64_t result = add_notifier(&phasechange, (uint64_t)acsp_init_plugins, 0LL);
  }

  if (acsp_use_dhcp) {
    ip_src_address_filter |= 8u;
  }
  return result;
}

uint64_t sub_10002670C(int a1)
{
  return *((unsigned int *)&acscp_fsm + 20 * a1 + 2);
}

double sub_100026724()
{
  double result = *(double *)&acscp_wantoptions;
  acscp_gotoptions = acscp_wantoptions;
  return result;
}

uint64_t sub_100026740()
{
  if ((_BYTE)acscp_gotoptions) {
    int v0 = 6;
  }
  else {
    int v0 = 0;
  }
  if (BYTE8(acscp_gotoptions)) {
    int v1 = 6;
  }
  else {
    int v1 = 0;
  }
  return (v1 + v0);
}

void sub_10002676C(uint64_t a1, uint64_t a2, int *a3)
{
  int v3 = *a3;
  if ((_BYTE)acscp_gotoptions)
  {
    if (v3 < 6)
    {
      LOBYTE(acscp_gotoptions) = 0;
    }

    else
    {
      *(_WORD *)a2 = 1537;
      *(_BYTE *)(a2 + 2) = BYTE7(acscp_gotoptions);
      *(_BYTE *)(a2 + 3) = BYTE6(acscp_gotoptions);
      *(_BYTE *)(a2 + 4) = BYTE5(acscp_gotoptions);
      *(_BYTE *)(a2 + 5) = BYTE4(acscp_gotoptions);
      a2 += 6LL;
      v3 -= 6;
    }
  }

  if (BYTE8(acscp_gotoptions))
  {
    if (v3 < 6)
    {
      BYTE8(acscp_gotoptions) = 0;
    }

    else
    {
      *(_WORD *)a2 = 1538;
      *(_BYTE *)(a2 + 2) = HIBYTE(acscp_gotoptions);
      *(_BYTE *)(a2 + 3) = BYTE14(acscp_gotoptions);
      *(_BYTE *)(a2 + 4) = BYTE13(acscp_gotoptions);
      *(_BYTE *)(a2 + 5) = BYTE12(acscp_gotoptions);
      v3 -= 6;
    }
  }

  *a3 -= v3;
}

uint64_t sub_10002682C(uint64_t a1, uint64_t a2, int a3)
{
  if ((_BYTE)acscp_gotoptions)
  {
    BOOL v3 = __OFSUB__(a3, 6);
    a3 -= 6;
    if (a3 < 0 != v3) {
      return 0LL;
    }
    BOOL v4 = *(_BYTE *)(a2 + 1) == 6 && *(_BYTE *)a2 == 1;
    if (!v4 || DWORD1(acscp_gotoptions) != bswap32(*(_DWORD *)(a2 + 2))) {
      return 0LL;
    }
    a2 += 6LL;
  }

  if (BYTE8(acscp_gotoptions))
  {
    if (a3 >= 6)
    {
      BOOL v5 = *(_BYTE *)(a2 + 1) == 6 && *(_BYTE *)a2 == 2;
      if (v5 && a3 == 6 && HIDWORD(acscp_gotoptions) == bswap32(*(_DWORD *)(a2 + 2))) {
        return 1LL;
      }
    }
  }

  else if (!a3)
  {
    return 1LL;
  }

  return 0LL;
}

uint64_t sub_1000268CC(uint64_t a1, uint64_t a2, int a3)
{
  unsigned int v3 = DWORD1(acscp_gotoptions);
  unsigned int v4 = HIDWORD(acscp_gotoptions);
  if ((_BYTE)acscp_gotoptions && a3 >= 6 && *(_BYTE *)(a2 + 1) == 6 && *(_BYTE *)a2 == 1)
  {
    unsigned int v5 = *(_DWORD *)(a2 + 2);
    a2 += 6LL;
    unsigned int v6 = bswap32(v5);
    if (v6 < 2) {
      unsigned int v3 = v6;
    }
    a3 -= 6;
  }

  if (BYTE8(acscp_gotoptions))
  {
    if (*(_BYTE *)(a2 + 1) == 6 && a3 >= 6)
    {
      if (*(_BYTE *)a2 != 2) {
        goto LABEL_17;
      }
      a3 -= 6;
      unsigned int v8 = *(_DWORD *)(a2 + 2);
      a2 += 6LL;
      unsigned int v9 = bswap32(v8);
      if (v9 < 2) {
        unsigned int v4 = v9;
      }
    }
  }

  if (a3 < 3)
  {
LABEL_19:
    if (*(_DWORD *)(a1 + 8) != 9)
    {
      DWORD1(acscp_gotoptions) = v3;
      HIDWORD(acscp_gotoptions) = v4;
    }

    return 1LL;
  }

  else
  {
LABEL_17:
    while (1)
    {
      uint64_t v10 = *(unsigned __int8 *)(a2 + 1);
      a3 -= v10;
      if (a3 < 0) {
        return 0LL;
      }
      a2 += v10;
    }
  }

uint64_t sub_1000269A4(uint64_t a1, uint64_t a2, int a3)
{
  char v3 = acscp_gotoptions;
  char v4 = BYTE8(acscp_gotoptions);
  if ((_BYTE)acscp_gotoptions && a3 >= 6 && *(_BYTE *)(a2 + 1) == 6 && *(_BYTE *)a2 == 1)
  {
    uint64_t v5 = 0LL;
    if (bswap32(*(_DWORD *)(a2 + 2)) != DWORD1(acscp_gotoptions)) {
      return v5;
    }
    char v3 = 0;
    a2 += 6LL;
    a3 -= 6;
  }

  if (!BYTE8(acscp_gotoptions)) {
    goto LABEL_15;
  }
  if (*(_BYTE *)(a2 + 1) != 6 || a3 < 6) {
    goto LABEL_15;
  }
  if (*(_BYTE *)a2 != 2) {
    return 0LL;
  }
  uint64_t v5 = 0LL;
  if (bswap32(*(_DWORD *)(a2 + 2)) == HIDWORD(acscp_gotoptions))
  {
    char v4 = 0;
    a3 -= 6;
LABEL_15:
    if (a3) {
      return 0LL;
    }
    if (*(_DWORD *)(a1 + 8) != 9)
    {
      LOBYTE(acscp_gotoptions) = v3;
      BYTE8(acscp_gotoptions) = v4;
    }

    return 1LL;
  }

  return v5;
}

uint64_t sub_100026A70(int a1, unsigned __int8 *__src, int *a3, int a4)
{
  int v5 = *a3;
  acscp_hisoptions = 0LL;
  *(void *)&byte_100046188 = 0LL;
  BOOL v25 = a4 != 0;
  int v6 = acscp_allowoptions;
  uint64_t v7 = 2LL;
  unsigned int v8 = __src;
  unsigned int v9 = (char *)__src;
LABEL_2:
  uint64_t v10 = v8;
LABEL_3:
  int v11 = byte_100046178;
  unsigned int v12 = dword_10004617C;
  int v13 = v10;
  unsigned int v14 = HIDWORD(acscp_allowoptions);
  while (v5)
  {
    if (v5 < 2 || ((uint64_t v15 = v13[1], v15 >= 2) ? (v16 = v5 >= v15) : (v16 = 0), !v16))
    {
      LOWORD(v15) = v5;
      int v17 = 1;
      unsigned int v8 = v13;
      int v5 = 0;
      goto LABEL_33;
    }

    int v17 = *v13;
    v5 -= v15;
    unsigned int v8 = &v13[v15];
    if (v17 == 2)
    {
      int v17 = 1;
      if ((_DWORD)v15 != 6 || !v11) {
        goto LABEL_33;
      }
      uint64_t v18 = (uint64_t *)&byte_100046188;
      if (bswap32(*(_DWORD *)(v13 + 2)) > v12)
      {
        HIBYTE(v14) = HIBYTE(v12);
        uint64_t v19 = &dword_10004617C;
        goto LABEL_23;
      }
    }

    else
    {
      if (v17 != 1)
      {
        int v17 = 1;
        goto LABEL_33;
      }

      if ((_DWORD)v15 != 6 || !v6) {
        goto LABEL_33;
      }
      uint64_t v18 = &acscp_hisoptions;
      if (bswap32(*(_DWORD *)(v13 + 2)) > v14)
      {
        uint64_t v19 = (int *)&acscp_allowoptions + 1;
LABEL_23:
        v13[2] = HIBYTE(v14);
        v13[3] = *((_WORD *)v19 + 1);
        v13[4] = BYTE1(*v19);
        v13[5] = *v19;
        if (a4)
        {
          LOWORD(v15) = 6;
          int v17 = v25;
        }

        else
        {
          uint64_t v10 = v8;
          if ((_DWORD)v7 == 4) {
            goto LABEL_3;
          }
          BOOL v20 = (_DWORD)v7 == 2;
          LOWORD(v15) = 6;
          LODWORD(v7) = 3;
          int v17 = v25;
          if (v20) {
            int v17 = 0;
          }
          if (v20) {
            unsigned int v9 = (char *)__src;
          }
        }

void sub_100026C98()
{
  __int16 mtu = netif_get_mtu();
  int v1 = notify((uint64_t **)acsp_up_notifier, 0);
  if (acsp_up_hook) {
    acsp_up_hook(v1);
  }
  check_protocols_ready();
  acsp_start(mtu);
}

uint64_t (*sub_100026CE4())(void)
{
  double result = acsp_down_hook;
  if (acsp_down_hook) {
    return (uint64_t (*)(void))acsp_down_hook();
  }
  return result;
}

void sub_100026D1C( unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (byte_100047F4C == 1)
  {
    byte_100047F4C = 0;
    np_finished(*a1, 565LL, a3, a4, a5, a6, a7, a8);
  }

uint64_t **sub_100026D40(uint64_t **result)
{
  if (*((_DWORD *)result + 6) - *((_DWORD *)result + 7) == 2) {
    return notify((uint64_t **)protocolsready_notifier, 0);
  }
  return result;
}

void acsp_init_plugins()
{
  qword_100047F50 = 0LL;
  remove_notifier((void **)&phasechange, (uint64_t)acsp_init_plugins, 0LL);
  sub_100026F28();
  for (char i = 1; ; char i = 0)
  {
    char v1 = i;
    int v2 = malloc(0x78uLL);
    if (!v2) {
      break;
    }
    uint64_t v10 = v2;
    if ((v1 & 1) != 0)
    {
      *((_BYTE *)v2 + 64) = 1;
      if (!sub_1000290B8(v2, 1))
      {
        uint64_t v18 = &qword_100047F58;
LABEL_9:
        uint64_t v19 = v10[9];
        *(void *)(v19 + 48) = *v18;
        if (*((_BYTE *)v10 + 64) == 2) {
          add_notifier_last((void **)&ip_up_notify, (uint64_t)sub_10002917C, v19);
        }
        else {
          add_notifier(&ip_up_notify, (uint64_t)sub_10002917C, v19);
        }
        add_notifier(&ip_down_notify, (uint64_t)sub_1000291BC, v10[9]);
        *(void *)((char *)v10 + 12) = 0x2000000000LL;
        v10[4] = 0LL;
        v10[5] = 0LL;
        *((_WORD *)v10 + 24) = 16;
        *uint64_t v10 = qword_100047F50;
        qword_100047F50 = (uint64_t)v10;
        goto LABEL_13;
      }
    }

    else
    {
      *((_BYTE *)v2 + 64) = 2;
      if (!sub_1000290B8(v2, 2))
      {
        uint64_t v18 = &qword_100047F60;
        goto LABEL_9;
      }
    }

    error("error initializing acsp plugin type\n", v11, v12, v13, v14, v15, v16, v17, v20);
    free(v10);
LABEL_13:
    if ((v1 & 1) == 0)
    {
      ipdata_input_hook = (uint64_t (*)(void))sub_10002772C;
      ipdata_up_hook = (uint64_t (*)(void, void, void))sub_1000280C8;
      ipdata_down_hook = (uint64_t (*)(void))sub_100028180;
      ipdata_print_hook = (uint64_t (*)(void))sub_1000281DC;
      return;
    }
  }

  error("acscp unable allocate plugin structures\n", v3, v4, v5, v6, v7, v8, v9, v20);
  byte_100042F00 = 0;
}

void sub_100026F28()
{
  qword_100047F58 = 0LL;
  qword_100047F60 = 0LL;
  if (serverid)
  {
    int v0 = SCPreferencesCreate(0LL, @"pppd", @"com.apple.RemoteAccessServers.plist");
    if (v0)
    {
      char v1 = v0;
      Value = (const __CFDictionary *)SCPreferencesGetValue(v0, @"Servers");
      if (Value)
      {
        uint64_t v3 = Value;
        CFStringRef v4 = CFStringCreateWithCString(0LL, (const char *)serverid, 0);
        if (!v4)
        {
LABEL_9:
          CFRelease(v1);
          return;
        }

        CFStringRef v5 = v4;
        uint64_t v6 = (const __CFDictionary *)CFDictionaryGetValue(v3, v4);
        if (v6)
        {
          uint64_t v7 = v6;
          if (!acsp_no_routes)
          {
            uint64_t v15 = (const __CFDictionary *)CFDictionaryGetValue(v6, kSCEntNetIPv4);
            if (v15)
            {
              uint64_t v16 = v15;
              CFTypeID v17 = CFGetTypeID(v15);
              if (v17 == CFDictionaryGetTypeID())
              {
                uint64_t v18 = (const __CFArray *)CFDictionaryGetValue(v16, @"OfferedRouteAddresses");
                if (v18)
                {
                  uint64_t v19 = v18;
                  CFTypeID v20 = CFGetTypeID(v18);
                  if (v20 == CFArrayGetTypeID())
                  {
                    CFIndex Count = CFArrayGetCount(v19);
                    int v22 = (const __CFArray *)CFDictionaryGetValue(v16, @"OfferedRouteMasks");
                    if (v22)
                    {
                      uint64_t v23 = v22;
                      CFTypeID v24 = CFGetTypeID(v22);
                      if (v24 == CFArrayGetTypeID())
                      {
                        CFIndex v138 = CFArrayGetCount(v19);
                        BOOL v25 = (const __CFArray *)CFDictionaryGetValue(v16, @"OfferedRouteTypes");
                        if (v25)
                        {
                          uint64_t v26 = v25;
                          uint64_t v140 = Count;
                          CFTypeID v27 = CFGetTypeID(v25);
                          if (v27 == CFArrayGetTypeID())
                          {
                            CFIndex v28 = CFArrayGetCount(v26);
                            if (v140 == v138 && v140 == v28)
                            {
                              uint64_t v139 = v26;
                              LOBYTE(acscp_allowoptions) = 1;
                              if (v140 >= 1)
                              {
                                CFIndex v36 = 0LL;
                                uint64_t v137 = "ACSP plugin: invalid route type specified\n";
                                uint64_t v37 = v139;
                                while (1)
                                {
                                  ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v19, v36);
                                  buffer[0] = 0;
                                  CFStringGetCString(ValueAtIndex, buffer, 1024LL, 0x8000100u);
                                  uint64_t v39 = (const __CFString *)CFArrayGetValueAtIndex(v23, v36);
                                  LOBYTE(v143.s_addr) = 0;
                                  CFStringGetCString(v39, (char *)&v143, 1024LL, 0x8000100u);
                                  uint64_t v40 = (const __CFString *)CFArrayGetValueAtIndex(v37, v36);
                                  if (CFStringCompare(v40, @"Private", 0LL))
                                  {
                                    if (CFStringCompare(v40, @"Public", 0LL)) {
                                      goto LABEL_84;
                                    }
                                    __int16 v48 = 2;
                                  }

                                  else
                                  {
                                    __int16 v48 = 1;
                                  }

                                  __int16 v49 = (in_addr *)malloc(0x20uLL);
                                  if (!v49) {
                                    break;
                                  }
                                  unsigned __int16 v50 = v49;
                                  *(_OWORD *)&v49->in_addr_t s_addr = 0u;
                                  *(_OWORD *)&v49[4].in_addr_t s_addr = 0u;
                                  if (!inet_aton(buffer, &v142) || !inet_aton((const char *)&v143, &v141))
                                  {
                                    error( "ACSP plugin: invalid ip address or mask specified\n",  v51,  v52,  v53,  v54,  v55,  v56,  v57,  (int)"ACSP plugin: invalid route type specified\n");
                                    free(v50);
                                    goto LABEL_86;
                                  }

                                  in_addr_t s_addr = v141.s_addr;
                                  v50[2].in_addr_t s_addr = v142.s_addr;
                                  v50[3].in_addr_t s_addr = s_addr;
                                  LOWORD(v50[5].s_addr) = v48;
                                  v50[6].in_addr_t s_addr = 0;
                                  *(void *)&v50->in_addr_t s_addr = qword_100047F58;
                                  qword_100047F58 = (uint64_t)v50;
                                  ++v36;
                                  uint64_t v37 = v139;
                                  if (v140 == v36) {
                                    goto LABEL_7;
                                  }
                                }

                                uint64_t v137 = "ACSP plugin: no memory\n";
LABEL_84:
                                error(v137, v41, v42, v43, v44, v45, v46, v47, (int)v137);
                                LOBYTE(acscp_allowoptions) = 0;
                              }

                              if (!qword_100047F58) {
LABEL_86:
                              }
                                LOBYTE(acscp_allowoptions) = 0;
                            }

                            else
                            {
                              error( "ACSP plugin: while reading prefs - route address, mask, and type counts not equal\n",  v29,  v30,  v31,  v32,  v33,  v34,  v35,  (int)v137);
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }

LABEL_7:
          if (!acsp_no_domains)
          {
            uint64_t v59 = (const __CFDictionary *)CFDictionaryGetValue(v7, kSCEntNetDNS);
            if (v59)
            {
              size_t v60 = v59;
              CFTypeID v61 = CFGetTypeID(v59);
              if (v61 == CFDictionaryGetTypeID())
              {
                uint64_t v62 = (const __CFArray *)CFDictionaryGetValue(v60, @"OfferedSearchDomains");
                if (v62)
                {
                  int v63 = v62;
                  CFTypeID v64 = CFGetTypeID(v62);
                  if (v64 == CFArrayGetTypeID())
                  {
                    CFIndex v65 = CFArrayGetCount(v63);
                    uint64_t v66 = (const __CFArray *)CFDictionaryGetValue(v60, @"OfferedSearchDomainServers");
                    uint64_t v67 = v66;
                    if (v66 && (CFTypeID v68 = CFGetTypeID(v66), v68 == CFArrayGetTypeID()))
                    {
                      CFIndex v76 = v65;
                      if (CFArrayGetCount(v67) != v65)
                      {
                        error( "ACSP plugin: search domain count not equal to search domain server count\n",  v69,  v70,  v71,  v72,  v73,  v74,  v75,  (int)v137);
                        goto LABEL_8;
                      }
                    }

                    else
                    {
                      CFIndex v76 = 0LL;
                    }

                    byte_100046178 = 1;
                    if (v65)
                    {
                      if (v65 >= 1)
                      {
                        for (CFIndex i = 0LL; v65 != i; ++i)
                        {
                          uint64_t v78 = (const __CFString *)CFArrayGetValueAtIndex(v63, i);
                          buffer[0] = 0;
                          CFStringGetCString(v78, buffer, 1024LL, 0x8000100u);
                          size_t v79 = strlen(buffer);
                          if (v79)
                          {
                            size_t v80 = v79;
                            uint64_t v81 = (in_addr *)malloc(0x18uLL);
                            if (!v81)
                            {
                              error("ACSP plugin: no memory\n", v82, v83, v84, v85, v86, v87, v88, (int)v137);
                              byte_100046178 = 0;
                              break;
                            }

                            uint64_t v89 = v81;
                            size_t v90 = v80 + 1;
                            uint64_t v91 = malloc(v90);
                            *(void *)&v89[4].in_addr_t s_addr = v91;
                            if (!v91)
                            {
                              error("ACSP plugin: no memory\n", v92, v93, v94, v95, v96, v97, v98, (int)v137);
                              byte_100046178 = 0;
                              free(v89);
                              break;
                            }

                            memcpy(v91, buffer, v90);
                            if (v76)
                            {
                              uint64_t v99 = (const __CFString *)CFArrayGetValueAtIndex(v67, i);
                              buffer[0] = 0;
                              CFStringGetCString(v99, buffer, 1024LL, 0x8000100u);
                              if (!inet_aton(buffer, &v143))
                              {
                                error( "ACSP plugin: invalid ip address specified for DNS server\n",  v100,  v101,  v102,  v103,  v104,  v105,  v106,  (int)v137);
                                free(v89);
                                goto LABEL_93;
                              }

                              v89[2].in_addr_t s_addr = v143.s_addr;
                            }

                            else
                            {
                              v89[2].in_addr_t s_addr = 0;
                            }

                            *(void *)&v89->in_addr_t s_addr = qword_100047F60;
                            qword_100047F60 = (uint64_t)v89;
                          }
                        }
                      }
                    }

                    else
                    {
                      SCDynamicStoreRef v107 = SCDynamicStoreCreate(0LL, @"pppd", 0LL, 0LL);
                      if (v107)
                      {
                        uint64_t v108 = v107;
                        NetworkGlobalEntity = SCDynamicStoreKeyCreateNetworkGlobalEntity( 0LL,  kSCDynamicStoreDomainState,  kSCEntNetDNS);
                        if (NetworkGlobalEntity)
                        {
                          uint64_t v110 = NetworkGlobalEntity;
                          ssize_t v111 = (const __CFDictionary *)SCDynamicStoreCopyValue(v108, NetworkGlobalEntity);
                          if (v111)
                          {
                            uint64_t v112 = v111;
                            CFTypeID v113 = CFGetTypeID(v111);
                            if (v113 == CFDictionaryGetTypeID())
                            {
                              uint64_t v114 = (const __CFString *)CFDictionaryGetValue(v112, kSCPropNetDNSDomainName);
                              if (v114)
                              {
                                int v115 = v114;
                                CFTypeID v116 = CFGetTypeID(v114);
                                if (v116 == CFStringGetTypeID())
                                {
                                  buffer[0] = 0;
                                  CFStringGetCString(v115, buffer, 1024LL, 0x8000100u);
                                  int v117 = strlen(buffer);
                                  if (v117)
                                  {
                                    uint64_t v118 = malloc(0x18uLL);
                                    if (v118)
                                    {
                                      uint64_t v126 = v118;
                                      int v127 = v117 + 1;
                                      size_t v128 = v117 + 1;
                                      uint64_t v129 = malloc(v127);
                                      v126[2] = v129;
                                      if (v129)
                                      {
                                        memcpy(v129, buffer, v128);
                                        *((_DWORD *)v126 + 2) = 0;
                                        *uint64_t v126 = qword_100047F60;
                                        qword_100047F60 = (uint64_t)v126;
                                      }

                                      else
                                      {
                                        error( "ACSP plugin: no memory\n",  v130,  v131,  v132,  v133,  v134,  v135,  v136,  (int)v137);
                                        free(v126);
                                      }
                                    }

                                    else
                                    {
                                      error( "ACSP plugin: no memory\n",  v119,  v120,  v121,  v122,  v123,  v124,  v125,  (int)v137);
                                    }
                                  }
                                }
                              }
                            }

                            CFRelease(v110);
                          }

                          else
                          {
                            uint64_t v112 = (const __CFDictionary *)v110;
                          }

                          CFRelease(v112);
                        }

                        CFRelease(v108);
                      }
                    }

                    if (!qword_100047F60) {
LABEL_93:
                    }
                      byte_100046178 = 0;
                  }
                }
              }
            }
          }
        }

LABEL_8:
        CFRelease(v5);
        goto LABEL_9;
      }
    }
  }

  else
  {
    if (!acsp_no_routes) {
      LOBYTE(acscp_wantoptions) = 1;
    }
    if (!acsp_no_domains) {
      BYTE8(acscp_wantoptions) = 1;
    }
    buffer[0] = 0;
    uint64_t v8 = SCDynamicStoreKeyCreateNetworkGlobalEntity(0LL, kSCDynamicStoreDomainState, kSCEntNetIPv4);
    if (!v8) {
      goto LABEL_22;
    }
    uint64_t v9 = v8;
    uint64_t v10 = (const __CFDictionary *)SCDynamicStoreCopyValue((SCDynamicStoreRef)cfgCache, v8);
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = (const __CFString *)CFDictionaryGetValue(v10, kSCPropNetIPv4Router);
      if (v12)
      {
        uint64_t v13 = v12;
        CFTypeID v14 = CFGetTypeID(v12);
        if (v14 == CFStringGetTypeID()) {
          CFStringGetCString(v13, buffer, 32LL, 0x8000100u);
        }
      }

      CFRelease(v11);
    }

    CFRelease(v9);
    if (buffer[0]) {
      inet_aton(buffer, (in_addr *)&dword_100047F68);
    }
    else {
LABEL_22:
    }
      dword_100047F68 = 0;
  }

void sub_10002772C(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5)
{
  if (!acsp_intercept_dhcp
    || ntohl(*(unsigned int *)(a2 + 16)) != -1
    || ntohs(*(unsigned __int16 *)(a2 + 20)) != 68
    || ntohs(*(unsigned __int16 *)(a2 + 22)) != 67)
  {
    if (!acsp_use_dhcp
      || *(_DWORD *)(a2 + 16) != (_DWORD)a4
      || ntohs(*(unsigned __int16 *)(a2 + 20)) != 67
      || ntohs(*(unsigned __int16 *)(a2 + 22)) != 68)
    {
      return;
    }

    if (a3 > 0x10E)
    {
      if (!qword_100047F70) {
        return;
      }
      ntohl(*(unsigned int *)(a2 + 40));
      if (bswap32(*(_DWORD *)(a2 + 264)) == 1669485411)
      {
        if (*(_BYTE *)(a2 + 268) == 53 && *(_BYTE *)(a2 + 269) == 1 && *(_BYTE *)(a2 + 270) == 5)
        {
          signed int v36 = a3 - 271;
          if ((int)(a3 - 271) >= 1)
          {
            int v37 = *(unsigned __int8 *)(a2 + 271);
            if (v37 != 255)
            {
              uint64_t v38 = 0LL;
              uint64_t v39 = (unsigned __int8 *)(a2 + 271);
              do
              {
                if (v37)
                {
                  uint64_t v40 = v39[1];
                  int v41 = v36 - 2;
                  BOOL v25 = __OFSUB__(v41, (_DWORD)v40);
                  int v42 = v41 - v40;
                  if ((v42 < 0) ^ v25 | (v42 == 0))
                  {
LABEL_106:
                    uint64_t v35 = "DHCP packet received with incorrect message option\n";
                    goto LABEL_104;
                  }

                  uint64_t v43 = (int *)(v39 + 2);
                  int v125 = v42;
                  switch(v37)
                  {
                    case 1:
                      int v58 = *v43;
                      uint64_t v59 = qword_100047F70;
                      uint64_t v60 = *(unsigned int *)(qword_100047F70 + 36);
                      if (*v43) {
                        BOOL v61 = (_DWORD)v60 == (_DWORD)a4;
                      }
                      else {
                        BOOL v61 = 0;
                      }
                      if (v61 && (uint64_t v60 = a4, *(_DWORD *)(qword_100047F70 + 24) != v58))
                      {
                        *(_DWORD *)(qword_100047F70 + 24) = v58;
                        if (!uifaddr(a1, a4, *(_DWORD *)(v59 + 40), v58))
                        {
                          int v75 = v39[2];
                          uint64_t v76 = qword_100047F70;
                          ntohl(*(unsigned int *)(qword_100047F70 + 36));
                          ntohl(*(unsigned int *)(v76 + 40));
                          notice( "failed to configure dhcp option 'subnet mask' = %d.%d.%d.%d, our %x, his %x\n",  v77,  v78,  v79,  v80,  v81,  v82,  v83,  v75);
                        }
                      }

                      else
                      {
                        int v62 = *v43;
                        ntohl(v60);
                        ntohl(*(unsigned int *)(v59 + 24));
                        info( "ignoring dhcp option 'subnet mask' = %d.%d.%d.%d, current addr %x, current mask %x\n",  v63,  v64,  v65,  v66,  v67,  v68,  v69,  v62);
                      }

                      break;
                    case 15:
                      if (v38)
                      {
                        notice( "ignoring dhcp option 'domain name', option already processed.\n",  v10,  v11,  v12,  v13,  v14,  v15,  v16,  v124);
                        break;
                      }

                      __memcpy_chk(__s, v39 + 2, v40, 2048LL);
                      __s[v40] = 0;
                      __stringp = __s;
                      uint64_t v71 = ",";
                      if (!strchr(__s, 44))
                      {
                        uint64_t v71 = ";";
                        if (!strchr(__s, 59))
                        {
                          uint64_t v71 = "\n";
                          if (!strchr(__s, 10))
                          {
                            uint64_t v71 = "\r";
                            if (!strchr(__s, 13))
                            {
                              if (strchr(__s, 32)) {
                                uint64_t v71 = " ";
                              }
                              else {
                                uint64_t v71 = &algn_10003771F;
                              }
                            }
                          }
                        }
                      }

                      uint64_t v72 = strsep(&__stringp, v71);
                      uint64_t v73 = 0LL;
                      while (1)
                      {
                        if (v72 && !*v72)
                        {
                          uint64_t v38 = v73;
                        }

                        else
                        {
                          uint64_t v74 = (uint64_t **)malloc(0x18uLL);
                          if (!v74)
                          {
                            error( "failed to allocate domain from DHCP packet\n",  v10,  v11,  v12,  v13,  v14,  v15,  v16,  v124);
                            uint64_t v38 = v73;
                            goto LABEL_75;
                          }

                          uint64_t v38 = v74;
                          v74[1] = 0LL;
                          v74[2] = 0LL;
                          *uint64_t v74 = (uint64_t *)v73;
                          if (!v72)
                          {
                            v74[2] = (uint64_t *)__s;
                            goto LABEL_75;
                          }

                          v74[2] = (uint64_t *)v72;
                          uint64_t v73 = v74;
                        }

                        uint64_t v72 = strsep(&__stringp, v71);
                        if (!v72) {
                          goto LABEL_75;
                        }
                      }

                    case 249:
                      uint64_t v44 = qword_100047F70;
                      if ((_DWORD)v40)
                      {
                        unsigned int v45 = 0;
                        do
                        {
                          uint64_t v46 = malloc(0x20uLL);
                          if (!v46)
                          {
                            error("DHCP: no memory\n", v47, v48, v49, v50, v51, v52, v53, v124);
                            return;
                          }

                          uint64_t v54 = v46;
                          *uint64_t v46 = 0u;
                          v46[1] = 0u;
                          unsigned int v55 = *((unsigned __int8 *)v43 + v45);
                          int v56 = htonl((-1 << -(char)v55));
                          *((_DWORD *)v54 + 3) = v56;
                          LODWORD(v57) = v55 >> 3;
                          if ((v55 & 7) != 0) {
                            uint64_t v57 = (v57 + 1);
                          }
                          else {
                            uint64_t v57 = v57;
                          }
                          *((_DWORD *)v54 + 2) = *(int *)((char *)v43 + v45 + 1) & v56;
                          *((_DWORD *)v54 + 4) = *(int *)((char *)v43 + v57 + v45 + 1);
                          *((_WORD *)v54 + 1notify((uint64_t **)acsp_down_notifier, 0) = 1;
                          *((_DWORD *)v54 + 6) = 0;
                          *(void *)uint64_t v54 = *(void *)(v44 + 8);
                          *(void *)(v44 + 8) = v54;
                          v45 += v57 + 5;
                        }

                        while (v45 < v40);
                      }

                      else
                      {
                        uint64_t v54 = *(_OWORD **)(qword_100047F70 + 8);
                      }

                      sub_100029B44((uint64_t *)v54);
                      break;
                  }

LABEL_75:
                  uint64_t v39 = (unsigned __int8 *)v43 + v40;
                  signed int v36 = v125;
                }

                else
                {
                  ++v39;
                  --v36;
                }

                int v37 = *v39;
              }

              while (v37 != 255 && v36 > 0);
              if (v38)
              {
                sub_100029D18(v38);
                do
                {
                  int v115 = *v38;
                  free(v38);
                  uint64_t v38 = (uint64_t **)v115;
                }

                while (v115);
              }
            }
          }

          untimeout((uint64_t)sub_10002A07C, qword_100047F70);
          *(_DWORD *)qword_100047F70 = 5;
          notify((uint64_t **)acspdhcpready_notifier, 0);
          return;
        }

LABEL_102:
      uint64_t v35 = "DHCP packet received with incorrect cookie\n";
      goto LABEL_104;
    }

void sub_1000280C8( unsigned int a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  if (acsp_use_dhcp && off_100042F48(a1) != 9)
  {
    uint64_t v12 = malloc(0x30uLL);
    qword_100047F70 = (uint64_t)v12;
    if (v12)
    {
      _DWORD v12[2] = 0u;
      *(_OWORD *)((char *)v12 + 2notify((uint64_t **)acsp_down_notifier, 0) = 0u;
      *(_OWORD *)((char *)v12 + 4) = 0u;
      *((_DWORD *)v12 + 8) = a1;
      *((_DWORD *)v12 + 9) = a2;
      *((_DWORD *)v12 + 1notify((uint64_t **)acsp_down_notifier, 0) = a3;
      *(_DWORD *)uint64_t v12 = 1;
      sub_10002A100(a1, a2);
    }

    else
    {
      error("ACSP plugin: no memory to allocate DHCP routes context\n", v13, v14, v15, v16, v17, v18, v19, a9);
    }
  }

void sub_100028180()
{
  if (acsp_use_dhcp) {
    BOOL v0 = qword_100047F70 == 0;
  }
  else {
    BOOL v0 = 1;
  }
  if (!v0)
  {
    sub_100029994(*(uint64_t **)(qword_100047F70 + 8));
    untimeout((uint64_t)sub_10002A07C, qword_100047F70);
    free((void *)qword_100047F70);
    qword_100047F70 = 0LL;
  }

uint64_t sub_1000281DC(uint64_t a1, unsigned int a2, void (*a3)(uint64_t, const char *, ...), uint64_t a4)
{
  if (ntohs(*(unsigned __int16 *)(a1 + 20)) - 67 > 1
    || ntohs(*(unsigned __int16 *)(a1 + 22)) - 67 > 1)
  {
    return 0LL;
  }

  v8.in_addr_t s_addr = *(_DWORD *)(a1 + 12);
  uint64_t v9 = inet_ntoa(v8);
  a3(a4, " <src addr %s>", v9);
  v10.in_addr_t s_addr = *(_DWORD *)(a1 + 16);
  uint64_t v11 = inet_ntoa(v10);
  a3(a4, " <dst addr %s>", v11);
  int v12 = *(unsigned __int8 *)(a1 + 28);
  if ((v12 - 1) >= 2)
  {
    uint64_t v53 = " <bootp code invalid!>";
    goto LABEL_72;
  }

  if (v12 == 1) {
    uint64_t v13 = "Request";
  }
  else {
    uint64_t v13 = "Reply";
  }
  a3(a4, " <BOOTP %s>", v13);
  if (debug >= 2)
  {
    a3(a4, " <htype %d>", *(unsigned __int8 *)(a1 + 29));
    a3(a4, " <hlen %d>", *(unsigned __int8 *)(a1 + 30));
    a3(a4, " <hops %d>", *(unsigned __int8 *)(a1 + 31));
    a3(a4, " <xid %d>", *(_DWORD *)(a1 + 32));
    a3(a4, " <flags %d>", *(unsigned __int16 *)(a1 + 38));
    v14.in_addr_t s_addr = *(_DWORD *)(a1 + 40);
    uint64_t v15 = inet_ntoa(v14);
    a3(a4, " <client address %s>", v15);
    v16.in_addr_t s_addr = *(_DWORD *)(a1 + 44);
    uint64_t v17 = inet_ntoa(v16);
    a3(a4, " <your address %s>", v17);
    v18.in_addr_t s_addr = *(_DWORD *)(a1 + 48);
    uint64_t v19 = inet_ntoa(v18);
    a3(a4, " <server address %s>", v19);
    v20.in_addr_t s_addr = *(_DWORD *)(a1 + 52);
    int v21 = inet_ntoa(v20);
    a3(a4, " <gateway address %s>", v21);
    snprintf(__str, 0x800uLL, "%02x", *(unsigned __int8 *)(a1 + 56));
    for (uint64_t i = 0LL; i != 15; ++i)
    {
      snprintf(v55, 0x10uLL, ":%02x", *(unsigned __int8 *)(a1 + 57 + i));
      __strlcat_chk(__str, v55, 2048LL, 2048LL);
    }

    a3(a4, " <hardware address %s>", __str);
    a3(a4, " <server host name %s>", (const char *)(a1 + 72));
    a3(a4, " <boot file name %s>", (const char *)(a1 + 136));
  }

  if (bswap32(*(_DWORD *)(a1 + 264)) != 1669485411)
  {
    uint64_t v53 = " <cookie invalid!>";
    goto LABEL_72;
  }

  if (debug >= 2) {
    a3(a4, " <cookie 0x%x>", 1669485411);
  }
  if (*(_BYTE *)(a1 + 268) != 53
    || *(_BYTE *)(a1 + 269) != 1
    || (int v23 = *(unsigned __int8 *)(a1 + 270), v23 != 5) && v23 != 8)
  {
    uint64_t v53 = " <type invalid!>";
    goto LABEL_72;
  }

  if (v23 == 8) {
    int v24 = "INFORM";
  }
  else {
    int v24 = "ACK";
  }
  a3(a4, " <type %s>", v24);
  int v25 = *(unsigned __int8 *)(a1 + 271);
  if (v25 == 255 || (int v26 = a2 - 271, (int)(a2 - 271) < 1))
  {
LABEL_66:
    if (debug <= 1) {
      return a2;
    }
    else {
      return 0LL;
    }
  }

  CFTypeID v27 = (unsigned __int8 *)(a1 + 271);
  while (!v25)
  {
    ++v27;
    --v26;
LABEL_61:
    int v25 = *v27;
    if (v25 == 255 || v26 <= 0) {
      goto LABEL_66;
    }
  }

  int v28 = v26 - 2;
  if (v26 != 2)
  {
    int v29 = v27 + 2;
    uint64_t v30 = v27[1];
    __str[0] = 0;
    if (v25 <= 50)
    {
      switch(v25)
      {
        case 1:
          uint64_t v31 = a4;
          BOOL v32 = " <subnet mask %d.%d.%d.%d>";
          break;
        case 12:
          __memcpy_chk(__str, v27 + 2, v30, 2048LL);
          __str[v30] = 0;
          uint64_t v31 = a4;
          BOOL v32 = " <host name %s>";
          break;
        case 15:
          __memcpy_chk(__str, v27 + 2, v30, 2048LL);
          __str[v30] = 0;
          uint64_t v31 = a4;
          BOOL v32 = " <domain name %s>";
          break;
        default:
LABEL_42:
          uint64_t v31 = a4;
          BOOL v32 = " <option %d>";
          break;
      }

LABEL_59:
      a3(v31, v32);
    }

    else
    {
      switch(v25)
      {
        case '3':
          uint64_t v31 = a4;
          BOOL v32 = " <lease time %d sec>";
          goto LABEL_59;
        case '4':
        case '5':
        case '8':
        case '9':
        case ':':
        case ';':
          goto LABEL_42;
        case '6':
          int v54 = v26 - 2;
          strcpy(__str, "0x");
          if ((_DWORD)v30)
          {
            uint64_t v39 = v30;
            uint64_t v40 = v27 + 2;
            do
            {
              int v41 = *v40++;
              snprintf(v55, 0x10uLL, "%02x", v41);
              __strlcat_chk(__str, v55, 2048LL, 2048LL);
              --v39;
            }

            while (v39);
          }

          uint64_t v42 = a4;
          uint64_t v43 = " <server id %s>";
          goto LABEL_55;
        case '7':
          int v44 = v26 - 2;
          uint64_t v45 = v30;
          uint64_t v46 = v27 + 2;
          if ((_DWORD)v30)
          {
            do
            {
              int v47 = *v46++;
              snprintf(v55, 0x10uLL, " 0x%x", v47);
              __strlcat_chk(__str, v55, 2048LL, 2048LL);
              --v45;
            }

            while (v45);
          }

          a3(a4, " <parameters =%s>", __str);
          int v28 = v44;
          goto LABEL_60;
        case '<':
          __memcpy_chk(__str, v27 + 2, v30, 2048LL);
          __str[v30] = 0;
          uint64_t v31 = a4;
          BOOL v32 = " <vendor class id %s>";
          goto LABEL_59;
        case '=':
          int v54 = v26 - 2;
          strcpy(__str, "0x");
          if ((_DWORD)v30)
          {
            uint64_t v48 = v30;
            uint64_t v49 = v27 + 2;
            do
            {
              int v50 = *v49++;
              snprintf(v55, 0x10uLL, "%02x", v50);
              __strlcat_chk(__str, v55, 2048LL, 2048LL);
              --v48;
            }

            while (v48);
          }

          uint64_t v42 = a4;
          uint64_t v43 = " <client id %s>";
LABEL_55:
          a3(v42, v43);
          break;
        default:
          if (v25 != 249) {
            goto LABEL_42;
          }
          int v54 = v26 - 2;
          a3(a4, " <static routes");
          if ((_DWORD)v30)
          {
            int v33 = 0;
            do
            {
              unsigned int v34 = v29[v33];
              unsigned int v35 = -1 << -(char)v34;
              if ((v34 & 7) != 0) {
                int v36 = (v34 >> 3) + 1;
              }
              else {
                int v36 = v34 >> 3;
              }
              unsigned int v37 = v35 & ntohl(*(unsigned int *)&v29[v33 + 1]);
              unsigned int v38 = ntohl(*(unsigned int *)&v29[v36 + v33 + 1]);
              v33 += v36 + 5;
              a3( a4,  " %d.%d.%d.%d/%d.%d.%d.%d/%d.%d.%d.%d",  HIBYTE(v37),  BYTE2(v37),  BYTE1(v37),  v37,  HIBYTE(v35),  BYTE2(v35),  BYTE1(v35),  v35,  HIBYTE(v38),  BYTE2(v38),  BYTE1(v38),  v38);
            }

            while (v33 < (int)v30);
          }

          a3(a4, ">");
          break;
      }

      int v28 = v54;
    }

LABEL_60:
    CFTypeID v27 = &v29[v30];
    int v26 = v28 - v30;
    goto LABEL_61;
  }

  uint64_t v53 = " <option %d zero len!>";
LABEL_72:
  a3(a4, v53);
  return 0LL;
}

void acsp_start(__int16 a1)
{
  for (uint64_t i = qword_100047F50; i; uint64_t i = *(void *)i)
  {
    *(_WORD *)(i + 18) = a1;
    *(_DWORD *)(i + 2notify((uint64_t **)acsp_down_notifier, 0) = 1;
    *(void *)(i + 24) = 0LL;
    *(_DWORD *)(i + 5notify((uint64_t **)acsp_down_notifier, 0) = 0;
    *(void *)(i + 56) = 0LL;
    (*(void (**)(void, uint64_t, uint64_t))(i + 96))(*(void *)(i + 72), i + 16, i + 48);
    sub_100028B64(i, v3, v4, v5, v6, v7, v8, v9);
  }

uint64_t acsp_stop()
{
  for (uint64_t i = qword_100047F50; i; uint64_t i = *(void *)i)
  {
    if (*(_DWORD *)(i + 12))
    {
      untimeout((uint64_t)sub_100028B18, i);
      *(_DWORD *)(i + 12) = 0;
    }

    *(_DWORD *)(i + 2notify((uint64_t **)acsp_down_notifier, 0) = 2;
    *(void *)(i + 24) = 0LL;
    *(_DWORD *)(i + 5notify((uint64_t **)acsp_down_notifier, 0) = 0;
    *(void *)(i + 56) = 0LL;
    uint64_t result = (*(uint64_t (**)(void, uint64_t, uint64_t))(i + 96))(*(void *)(i + 72), i + 16, i + 48);
  }

  return result;
}

void acsp_data_input( uint64_t a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  if ((int)a3 >= 8)
  {
    __int16 v10 = a3;
    int v12 = &qword_100047F50;
    do
    {
      int v12 = (uint64_t *)*v12;
      if (!v12)
      {
        uint64_t v9 = "ACSP packet received with invalid type\n";
        goto LABEL_12;
      }
    }

    while (*((unsigned __int8 *)v12 + 64) != *a2);
    if ((ntohs(*((unsigned __int16 *)a2 + 2)) & 4) != 0
      && *((_DWORD *)v12 + 3) == 1
      && a2[1] == *((unsigned __int8 *)v12 + 8))
    {
      untimeout((uint64_t)sub_100028B18, (uint64_t)v12);
      *((_DWORD *)v12 + 3) = 0;
    }

    *((_WORD *)v12 + 1notify((uint64_t **)acsp_down_notifier, 0) = 3;
    v12[3] = (uint64_t)a2;
    *((_WORD *)v12 + 11) = v10;
    v12[7] = 0LL;
    *(_DWORD *)((char *)v12 + 5notify((uint64_t **)acsp_down_notifier, 0) = 0;
    ((void (*)(uint64_t, uint64_t *, uint64_t *))v12[12])(v12[9], v12 + 2, v12 + 6);
    sub_100028B64((uint64_t)v12, v13, v14, v15, v16, v17, v18, v19);
  }

  else
  {
    uint64_t v9 = "ACSP packet received was too short\n";
LABEL_12:
    error(v9, (uint64_t)a2, a3, a4, a5, a6, a7, a8, a9);
  }

uint64_t sub_100028B18(uint64_t a1)
{
  *(_DWORD *)(a1 + 12) = 0;
  *(_DWORD *)(a1 + 2notify((uint64_t **)acsp_down_notifier, 0) = 4;
  *(void *)(a1 + 24) = 0LL;
  *(_DWORD *)(a1 + 5notify((uint64_t **)acsp_down_notifier, 0) = 0;
  *(void *)(a1 + 56) = 0LL;
  (*(void (**)(void, uint64_t, uint64_t))(a1 + 96))(*(void *)(a1 + 72), a1 + 16, a1 + 48);
  return sub_100028B64(a1);
}

void sub_100028B64( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = a1 + 48;
  uint64_t v10 = a1 + 16;
  while (1)
  {
    uint64_t v11 = "ACSP plugin for option # %d attempted to invoke UI - not supported\n";
    switch(*(_WORD *)(a1 + 50))
    {
      case 0:
        return;
      case 1:
      case 3:
        unsigned int v12 = *(unsigned __int16 *)(a1 + 52);
        BOOL v13 = v12 < 8 || v12 > *(unsigned __int16 *)(a1 + 18);
        uint64_t v11 = "ACSP plugin for option # %d trying to send packet of invalid length\n";
        if (v13) {
          goto LABEL_10;
        }
        uint64_t v14 = *(void *)(a1 + 56);
        *(_WORD *)uint64_t v14 = 1023;
        __int16 v15 = htons(565LL);
        *(_WORD *)(v14 + 2) = v15;
        if (*(_WORD *)(a1 + 50) == 3)
        {
          if (*(_DWORD *)(a1 + 12)) {
            untimeout((uint64_t)sub_100028B18, a1);
          }
          *(_DWORD *)(a1 + 12) = 1;
          *(_BYTE *)(a1 + 8) = *(_BYTE *)(v14 + 5);
          timeout((int)sub_100028B18);
        }

        output(0LL, *(void *)(a1 + 56), *(unsigned __int16 *)(a1 + 52), v16, v17, v18, v19, v20, v22);
        int v21 = *(void (**)(void, uint64_t))(a1 + 88);
        if (v21) {
          v21(*(void *)(a1 + 72), v9);
        }
        return;
      case 2:
        goto LABEL_10;
      case 4:
        uint64_t v11 = "ACSP plugin for option # %d attempted timeout action with invalid time value\n";
        if (*(_WORD *)(a1 + 52) != 4) {
          goto LABEL_10;
        }
        *(_DWORD *)(a1 + 12) = 2;
        timeout((int)sub_100028B18);
        return;
      case 5:
        if (*(_DWORD *)(a1 + 12))
        {
          untimeout((uint64_t)sub_100028B18, a1);
          *(_DWORD *)(a1 + 12) = 0;
        }

        return;
      default:
        uint64_t v11 = "ACSP plugin for option # %d trying to perform invalid action\n";
LABEL_10:
        error(v11, a2, a3, a4, a5, a6, a7, a8, *(unsigned __int8 *)(a1 + 64));
        *(_DWORD *)(a1 + 2notify((uint64_t **)acsp_down_notifier, 0) = 6;
        *(void *)(a1 + 24) = 0LL;
        *(void *)(a1 + 56) = 0LL;
        *(_DWORD *)(a1 + 5notify((uint64_t **)acsp_down_notifier, 0) = 0;
        (*(void (**)(void, uint64_t, uint64_t))(a1 + 96))(*(void *)(a1 + 72), v10, v9);
        break;
    }
  }

uint64_t acsp_printpkt(unsigned __int8 *a1, int a2, void (*a3)(uint64_t, const char *, ...), uint64_t a4)
{
  uint64_t result = 0LL;
  if (a1 && a2 >= 8)
  {
    unsigned int v8 = ntohs(*((unsigned __int16 *)a1 + 1));
    if (v8 >= 8) {
      unsigned int v9 = v8 - 8;
    }
    else {
      unsigned int v9 = 0;
    }
    char v10 = ntohs(*((unsigned __int16 *)a1 + 2));
    int v11 = *a1;
    int v37 = (int)a1;
    if (v11 == 2)
    {
      unsigned int v12 = a1 + 8;
      int v22 = " START";
      int v23 = (const char *)&unk_10002EB6A;
      if ((v10 & 2) == 0) {
        int v22 = (const char *)&unk_10002EB6A;
      }
      int v24 = " END";
      if ((v10 & 1) == 0) {
        int v24 = (const char *)&unk_10002EB6A;
      }
      int v25 = " REQUIRE-ACK";
      if ((v10 & 8) == 0) {
        int v25 = (const char *)&unk_10002EB6A;
      }
      if ((v10 & 4) != 0) {
        int v23 = " ACK";
      }
      a3(a4, " <payload len %d, packet seq %d, %s, flags:%s%s%s%s>", v9, a1[1], "CI_DOMAINS", v22, v24, v25, v23);
      if (v9 >= 8)
      {
        do
        {
          uint64_t v26 = *(void *)v12;
          uint64_t v38 = v26;
          unsigned int v27 = ntohs(WORD2(v26));
          unsigned int v28 = v27;
          if (v27 >= 0x100) {
            uint64_t v29 = 256LL;
          }
          else {
            uint64_t v29 = v27;
          }
          if (v27) {
            __memcpy_chk(v39, v12 + 6, v29, 256LL);
          }
          v39[v29] = 0;
          if ((_DWORD)v26)
          {
            addr2ascii(2, &v38, 4, v40);
            uint64_t v30 = a4;
            uint64_t v31 = "\n    <domain: name %s, server %s>";
          }

          else
          {
            uint64_t v30 = a4;
            uint64_t v31 = "\n    <domain: name %s>";
          }

          a3(v30, v31);
          uint64_t v32 = v28 + 6;
          v9 -= v32;
          v12 += v32;
        }

        while (v9 > 7);
      }
    }

    else if (v11 == 1)
    {
      unsigned int v12 = a1 + 8;
      BOOL v13 = " START";
      if ((v10 & 2) == 0) {
        BOOL v13 = (const char *)&unk_10002EB6A;
      }
      uint64_t v14 = " END";
      if ((v10 & 1) == 0) {
        uint64_t v14 = (const char *)&unk_10002EB6A;
      }
      __int16 v15 = " REQUIRE-ACK";
      if ((v10 & 8) == 0) {
        __int16 v15 = (const char *)&unk_10002EB6A;
      }
      uint64_t v16 = " ACK";
      if ((v10 & 4) == 0) {
        uint64_t v16 = (const char *)&unk_10002EB6A;
      }
      a3(a4, " <payload len %d, packet seq %d, %s, flags:%s%s%s%s>", v9, a1[1], "CI_ROUTES", v13, v14, v15, v16);
      if (v9 >= 0xC)
      {
        do
        {
          char v17 = ntohs(*((unsigned __int16 *)v12 + 4));
          uint64_t v18 = addr2ascii(2, v12, 4, v40);
          uint64_t v19 = addr2ascii(2, v12 + 4, 4, v39);
          if ((v17 & 1) != 0) {
            uint64_t v20 = " PRIVATE";
          }
          else {
            uint64_t v20 = (const char *)&unk_10002EB6A;
          }
          if ((v17 & 2) != 0) {
            int v21 = " PUBLIC";
          }
          else {
            int v21 = (const char *)&unk_10002EB6A;
          }
          a3(a4, "\n    <route: address %s, mask %s, flags:%s%s>", v18, v19, v20, v21);
          v9 -= 12;
          v12 += 12;
        }

        while (v9 > 0xB);
      }
    }

    else
    {
      int v33 = " START";
      unsigned int v34 = (const char *)&unk_10002EB6A;
      if ((v10 & 2) == 0) {
        int v33 = (const char *)&unk_10002EB6A;
      }
      unsigned int v35 = " END";
      if ((v10 & 1) == 0) {
        unsigned int v35 = (const char *)&unk_10002EB6A;
      }
      int v36 = " REQUIRE-ACK";
      if ((v10 & 8) == 0) {
        int v36 = (const char *)&unk_10002EB6A;
      }
      if ((v10 & 4) != 0) {
        unsigned int v34 = " ACK";
      }
      a3(a4, " <payload len %d, packet seq %d, CI_TYPE %d, flags:%s%s%s%s>", v9, a1[1], v11, v33, v35, v36, v34);
      LODWORD(v12) = (_DWORD)a1 + 8;
    }

    return ((_DWORD)v12 - v37);
  }

  return result;
}

uint64_t sub_1000290B8(void *a1, char a2)
{
  uint64_t v4 = malloc(0x40uLL);
  if (v4)
  {
    unsigned int v12 = v4;
    BOOL v13 = malloc(0x5DCuLL);
    _BYTE v12[4] = v13;
    if (v13)
    {
      uint64_t result = 0LL;
      *((_DWORD *)v12 + 1notify((uint64_t **)acsp_down_notifier, 0) = 1500;
      *(_BYTE *)unsigned int v12 = a2;
      *(void *)((char *)v12 + 4) = &_mh_execute_header;
      _DWORD v12[2] = 0LL;
      *((_BYTE *)v12 + 12) = 0;
      v12[6] = 0LL;
      *((_DWORD *)v12 + 14) = 0;
      a1[9] = v12;
      a1[10] = sub_100029208;
      a1[11] = 0LL;
      a1[12] = sub_10002920C;
      a1[13] = 0LL;
      a1[14] = nullsub_1;
      return result;
    }

    error("ACSP plugin: no memory\n", v14, v15, v16, v17, v18, v19, v20, v22);
    free(v12);
  }

  else
  {
    error("ACSP plugin: no memory\n", v5, v6, v7, v8, v9, v10, v11, v22);
  }

  return 0xFFFFFFFFLL;
}

uint64_t **sub_10002917C(uint64_t a1)
{
  *(_DWORD *)(a1 + 16) = 1;
  if (*(_DWORD *)(a1 + 4) == 1 && *(_DWORD *)(a1 + 8) == 5 && !*(_DWORD *)(a1 + 56)) {
    return sub_1000298E4((unsigned __int8 *)a1);
  }
  else {
    return notify((uint64_t **)acspdhcpready_notifier, 0);
  }
}

void sub_1000291BC(uint64_t a1)
{
  *(_DWORD *)(a1 + 16) = 0;
  if (*(_DWORD *)(a1 + 4) == 1 && *(_DWORD *)(a1 + 56))
  {
    if (*(_BYTE *)a1 == 1) {
      sub_100029994(*(uint64_t **)(a1 + 48));
    }
    *(_DWORD *)(a1 + 56) = 0;
  }

void sub_10002920C( unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  switch(*(_WORD *)(a2 + 4))
  {
    case 1:
      if (*a1 == 1)
      {
        if (!(_BYTE)acscp_gotoptions)
        {
          if ((_BYTE)acscp_hisoptions)
          {
LABEL_5:
            *((_DWORD *)a1 + 1) = 2;
            a1[12] = 0;
            *((_DWORD *)a1 + 5) = 0;
            sub_100029700(a1, a2, a3);
            ++a1[12];
            int v12 = 4;
            goto LABEL_15;
          }

          goto LABEL_38;
        }
      }

      else if (!BYTE8(acscp_gotoptions))
      {
        if (byte_100046188) {
          goto LABEL_5;
        }
LABEL_38:
        *((_DWORD *)a1 + 1) = 0;
        a1[12] = 0;
        *((_DWORD *)a1 + 5) = 0;
        return;
      }

      a1[12] = 0;
      *((_DWORD *)a1 + 5) = 0;
      *(void *)(a1 + 4) = 0x200000001LL;
      return;
    case 2:
      int v13 = *((_DWORD *)a1 + 2);
      if (v13 == 5) {
        goto LABEL_9;
      }
      if (v13 == 4)
      {
        *(_WORD *)(a3 + 2) = 5;
LABEL_9:
        if (*((_DWORD *)a1 + 14))
        {
          *((_DWORD *)a1 + 14) = 0;
          if (*a1 == 1)
          {
            sub_100029994(*((uint64_t **)a1 + 6));
            *((_DWORD *)a1 + 14) = 0;
          }
        }
      }

      if (*((_DWORD *)a1 + 1) == 1) {
        sub_1000296B0((uint64_t)a1);
      }
      int v12 = 1;
LABEL_15:
      *((_DWORD *)a1 + 2) = v12;
      return;
    case 3:
      uint64_t v14 = *(void *)(a2 + 8);
      int v15 = *((_DWORD *)a1 + 2);
      if (v15 == 4)
      {
        if (*((void *)a1 + 3))
        {
          sub_100029700(a1, a2, a3);
          ++a1[12];
          return;
        }

void sub_1000296B0(uint64_t a1)
{
  for (uint64_t i = *(void ***)(a1 + 48); i; uint64_t i = *(void ***)(a1 + 48))
  {
    if (*(_BYTE *)a1 != 1) {
      free(i[2]);
    }
    *(void *)(a1 + 48) = *i;
    free(i);
  }

uint64_t sub_100029700(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *((void *)a1 + 4);
  else {
    __int16 v6 = *((_WORD *)a1 + 20);
  }
  if (*((_DWORD *)a1 + 2) == 1)
  {
    uint64_t v7 = htons(2LL);
    *((void *)a1 + 3) = *((void *)a1 + 6);
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  unsigned __int16 v8 = v6 - 4;
  *(_WORD *)(v5 + 8) = v7;
  int v9 = *a1;
  *(_BYTE *)(v5 + 4) = v9;
  *(_BYTE *)(v5 + 5) = a1[12];
  int v10 = ntohs(v7);
  *(_WORD *)(v5 + 8) = htons(v10 | 8u);
  *(_WORD *)(v5 + 1notify((uint64_t **)acsp_down_notifier, 0) = 0;
  if (v9 == 1)
  {
    int v20 = (uint64_t **)*((void *)a1 + 3);
    unsigned __int16 v13 = 8;
    if (v20 && v8 >= 0x14u)
    {
      uint64_t v21 = v5 + 12;
      LOWORD(v22) = 20;
      do
      {
        unsigned __int16 v13 = v22;
        *(void *)uint64_t v21 = v20[1];
        *(_WORD *)(v21 + 8) = htons(*((unsigned __int16 *)v20 + 10));
        *(_WORD *)(v21 + 1notify((uint64_t **)acsp_down_notifier, 0) = htons(0LL);
        int v20 = (uint64_t **)*v20;
        *((void *)a1 + 3) = v20;
        unint64_t v22 = v13 + 12LL;
        v21 += 12LL;
        if (v20) {
          BOOL v23 = v22 > v8;
        }
        else {
          BOOL v23 = 1;
        }
      }

      while (!v23);
    }

uint64_t **sub_1000298E4(unsigned __int8 *a1)
{
  int v2 = *a1;
  uint64_t v3 = (uint64_t *)*((void *)a1 + 6);
  if (v2 == 1) {
    sub_100029B44(v3);
  }
  else {
    sub_100029D18((uint64_t **)v3);
  }
  *((_DWORD *)a1 + 14) = 1;
  return notify((uint64_t **)acspdhcpready_notifier, 0);
}

uint64_t sub_100029934(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a1 + 32);
  *(_BYTE *)(v5 + 4) = *(_BYTE *)a1;
  *(_BYTE *)(v5 + 5) = *(_BYTE *)(v4 + 1);
  *(_WORD *)(v5 + 8) = htons(4LL);
  uint64_t result = htons(8LL);
  *(_WORD *)(v5 + 6) = result;
  *(_WORD *)(v5 + 1notify((uint64_t **)acsp_down_notifier, 0) = 0;
  *(_DWORD *)(a3 + 2) = 786433;
  *(void *)(a3 + 8) = v5;
  return result;
}

void sub_100029994(uint64_t *a1)
{
  if (a1)
  {
    char v1 = a1;
    do
    {
      if (*((_DWORD *)v1 + 6))
      {
        *((_DWORD *)v1 + 6) = 0;
        __int16 v2 = *((_WORD *)v1 + 10);
        if ((v2 & 1) == 0)
        {
          if ((v2 & 2) == 0) {
            goto LABEL_14;
          }
          int v3 = *((_DWORD *)v1 + 2);
          int v4 = addr2ascii(2, v1 + 1, 4, v23);
          addr2ascii(2, (char *)v1 + 12, 4, v22);
          addr2ascii(2, &dword_100047F68, 4, v21);
          error("ACSP plugin: error removing public net route. (%s/%s -> %s).", v5, v6, v7, v8, v9, v10, v11, v4);
          goto LABEL_12;
        }

        int v12 = *((_DWORD *)v1 + 2);
        if (!v12)
        {
          cifdefaultroute();
          goto LABEL_14;
        }

        if (!route_interface(2, v12, *((_DWORD *)v1 + 3), 23, &ifname, 0))
        {
          int v13 = addr2ascii(2, v1 + 1, 4, v23);
          addr2ascii(2, (char *)v1 + 12, 4, v22);
          error("ACSP plugin: error removing private net route. (%s/%s).", v14, v15, v16, v17, v18, v19, v20, v13);
LABEL_12:
          *((_DWORD *)v1 + 6) = 1;
        }
      }

void sub_100029B44(uint64_t *a1)
{
  if (a1)
  {
    char v1 = a1;
    sleep(1u);
    cifdefaultroute();
    cifroute();
    do
    {
      *((_DWORD *)v1 + 6) = 1;
      __int16 v2 = *((_WORD *)v1 + 10);
      if ((v2 & 1) != 0)
      {
        int v12 = *((_DWORD *)v1 + 2);
        if (!v12)
        {
          sifdefaultroute();
          goto LABEL_14;
        }

        if (!route_interface(1, v12, *((_DWORD *)v1 + 3), 23, &ifname, 0))
        {
          int v13 = addr2ascii(2, v1 + 1, 4, v23);
          addr2ascii(2, (char *)v1 + 12, 4, v22);
          error("ACSP plugin: error installing private net route. (%s/%s).", v14, v15, v16, v17, v18, v19, v20, v13);
          goto LABEL_11;
        }
      }

      else if ((v2 & 2) != 0)
      {
        int v3 = *((_DWORD *)v1 + 2);
        if (!v3)
        {
          cifdefaultroute();
          goto LABEL_14;
        }

        if (!route_gateway(1, v3, *((_DWORD *)v1 + 3), dword_100047F68, 1))
        {
          int v4 = addr2ascii(2, v1 + 1, 4, v23);
          addr2ascii(2, (char *)v1 + 12, 4, v22);
          addr2ascii(2, &dword_100047F68, 4, v21);
          error("ACSP plugin: error installing public net route. (%s/%s -> %s).", v5, v6, v7, v8, v9, v10, v11, v4);
LABEL_11:
          *((_DWORD *)v1 + 6) = 0;
        }
      }

void sub_100029D18(uint64_t **a1)
{
  uint64_t valuePtr = 100000LL;
  CFNumberRef v2 = CFNumberCreate(0LL, kCFNumberLongType, &valuePtr);
  if (v2)
  {
    CFNumberRef v10 = v2;
    if (a1)
    {
      int v11 = 1;
      while (1)
      {
        CFStringRef v12 = CFStringCreateWithCString(0LL, (const char *)a1[2], 0x8000100u);
        if (!v12)
        {
          uint64_t v21 = "ACSP plugin: error adding domain name - could not create CFString\n";
          goto LABEL_11;
        }

        CFStringRef v20 = v12;
        if (!publish_dns_wins_entry( kSCEntNetDNS,  kSCPropNetDNSSearchDomains,  v20,  0LL,  kSCPropNetDNSSupplementalMatchDomains,  v20,  kSCPropNetDNSSupplementalMatchOrders,  v10,  @"ConfirmedServiceID",  (void *)serviceidRef,  v11)) {
          break;
        }
        publish_dns_wins_entry( kSCEntNetProxies,  kSCPropNetDNSSupplementalMatchDomains,  v20,  0LL,  kSCPropNetDNSSupplementalMatchOrders,  v10,  0LL,  0LL,  0LL,  0LL,  v11);
        CFRelease(v20);
        int v11 = 0;
        a1 = (uint64_t **)*a1;
        if (!a1) {
          goto LABEL_12;
        }
      }

      CFRelease(v20);
      uint64_t v21 = "ACSP plugin: error adding domain name\n";
LABEL_11:
      error(v21, v13, v14, v15, v16, v17, v18, v19, key);
    }

void sub_100029EA0( unsigned int a1, uint64_t a2, unsigned int a3, unsigned __int8 a4, unsigned int a5, char a6, uint64_t a7, uint64_t a8, int a9)
{
  char v9 = a5;
  char v10 = a3;
  unsigned int v25 = HIBYTE(a3);
  byte_100044128 = HIBYTE(a3);
  unsigned int v12 = HIWORD(a3);
  byte_100044129 = BYTE2(a3);
  unsigned int v13 = a3 >> 8;
  LOBYTE(word_10004412A) = BYTE1(a3);
  HIBYTE(word_10004412A) = a3;
  unsigned int v14 = HIBYTE(a5);
  byte_10004412C = HIBYTE(a5);
  unsigned int v15 = HIWORD(a5);
  byte_10004412D = BYTE2(a5);
  unsigned int v16 = a5 >> 8;
  byte_10004412E = BYTE1(a5);
  byte_10004412F = a5;
  LOWORD(dword_10004413notify((uint64_t **)acsp_down_notifier, 0) = 4352;
  __int16 v17 = a2 - 4;
  BYTE2(dword_10004413notify((uint64_t **)acsp_down_notifier, 0) = (unsigned __int16)(a2 - 24) >> 8;
  BYTE5(qword_100044134) = a2 - 24;
  BYTE4(qword_100044134) = (unsigned __int16)(a2 - 24) >> 8;
  HIBYTE(dword_10004413notify((uint64_t **)acsp_down_notifier, 0) = a2 - 24;
  LOBYTE(qword_100044134) = 0;
  *(_WORD *)((char *)&qword_100044134 + 1) = a4;
  BYTE3(qword_100044134) = a6;
  HIWORD(qword_100044134) = 0;
  sub_10002A008((unsigned __int8 *)&byte_100044128, a2 - 12);
  word_100044120 = 69;
  LOBYTE(word_100044122) = HIBYTE(v17);
  HIBYTE(word_100044122) = v17;
  char v18 = word_100042FD0;
  byte_100044124 = HIBYTE(word_100042FD0);
  word_100042FD0 += 2;
  byte_100044125[0] = v18 + 1;
  *(_DWORD *)algn_100044126 = 289406976;
  word_10004412A = 0;
  byte_10004412C = v25;
  byte_10004412D = v12;
  byte_10004412E = v13;
  byte_10004412F = v10;
  LOBYTE(dword_10004413notify((uint64_t **)acsp_down_notifier, 0) = v14;
  BYTE1(dword_10004413notify((uint64_t **)acsp_down_notifier, 0) = v15;
  BYTE2(dword_10004413notify((uint64_t **)acsp_down_notifier, 0) = v16;
  HIBYTE(dword_10004413notify((uint64_t **)acsp_down_notifier, 0) = v9;
  uint64_t v19 = sub_10002A008((unsigned __int8 *)&word_100044120, 20);
  word_10004412A = __rev16(ntohs(v19));
  output(a1, (uint64_t)&outpacket_buf, a2, v20, v21, v22, v23, v24, a9);
}

uint64_t sub_10002A008(unsigned __int8 *a1, int a2)
{
  if (a2 < 2)
  {
    uint64_t v2 = 0LL;
    if (a2) {
LABEL_7:
    }
      v2 += *a1;
  }

  else
  {
    uint64_t v2 = 0LL;
    unsigned int v3 = a2;
    do
    {
      unsigned int v4 = *(unsigned __int16 *)a1;
      a1 += 2;
      v2 += v4;
      unsigned int v5 = v3 - 2;
      BOOL v6 = v3 > 3;
      v3 -= 2;
    }

    while (v6);
    if (v5) {
      goto LABEL_7;
    }
  }

  if ((unint64_t)v2 >= 0x10000)
  {
    do
      uint64_t v2 = (v2 >> 16) + (unsigned __int16)v2;
    while ((unint64_t)v2 >> 16);
  }

  return (unsigned __int16)~(_WORD)v2;
}

void sub_10002A07C( _DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*a1 == 4)
  {
    int v9 = a1[1];
    a1[1] = v9 + 1;
    if (v9 > 3)
    {
      dbglog("No DHCP server replied\n", a2, a3, a4, a5, a6, a7, a8, v10);
      *a1 = 5;
    }

    else
    {
      sub_10002A100(a1[8], a1[9]);
    }

    if (a1[1] == 2) {
      notify((uint64_t **)acspdhcpready_notifier, 0);
    }
  }

void sub_10002A100(unsigned int a1, uint64_t a2)
{
  outpacket_buf = 553649151;
  word_10004413C = 2049;
  byte_10004413E = 6;
  char v4 = word_100042FD2;
  word_100044140 = 0;
  LOBYTE(word_100044142) = (unsigned __int16)(word_100042FD2 + 2) >> 8;
  word_100042FD2 += 4;
  HIBYTE(word_100044142) = v4 + 3;
  unsigned int v5 = ntohl(a2);
  dword_100044144 = 0;
  byte_100044148 = HIBYTE(v5);
  byte_100044149 = BYTE2(v5);
  byte_10004414A = BYTE1(v5);
  byte_10004414B = v5;
  qword_10004414C = 0LL;
  *(uint64_t *)((char *)&qword_10004414C + 7) = 0LL;
  byte_10004415B = 1;
  qword_10004415C = 0LL;
  *(_DWORD *)((char *)&qword_10004415C + 7) = 0;
  byte_100044167 = 1;
  qword_100044228 = 0x3D08013563538263LL;
  word_100044230 = 2055;
  byte_100044233 = 0;
  LOBYTE(word_100044235) = 1;
  qword_100044237 = 0xF9012B2C06063700LL;
  word_10004423F = -241;
  sub_100029EA0(a1, 294LL, v5, 0x44u, 0xFFFFFFFF, 67, v6, v7, v8);
  *(_DWORD *)qword_100047F70 = 4;
  timeout((int)sub_10002A07C);
}

uint64_t chap_register_digest(uint64_t result)
{
  *(void *)(result + 64) = qword_100047F78;
  qword_100047F78 = result;
  return result;
}

void chap_auth_peer( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  if ((dword_100047F80 & 2) != 0)
  {
    error("CHAP: peer authentication already started!", a2, a3, a4, a5, a6, a7, a8, a9);
  }

  else
  {
    uint64_t v9 = qword_100047F78;
    if (!qword_100047F78) {
LABEL_5:
    }
      fatal("CHAP digest 0x%x requested but not available", a2, a3, a4, a5, a6, a7, a8, a3);
    while (*(_DWORD *)v9 != (_DWORD)a3)
    {
      uint64_t v9 = *(void *)(v9 + 64);
      if (!v9) {
        goto LABEL_5;
      }
    }

    qword_100047F88 = a2;
    qword_100047F90 = v9;
    double v17 = drand48();
    char v18 = dword_100047F80;
    dword_100047F80 |= 2u;
    *(_DWORD *)algn_100047F84 = vcvtd_n_s64_f64(v17, 8uLL);
    if ((v18 & 1) != 0) {
      sub_10002A300(&dword_100047F80, v10, v11, v12, v13, v14, v15, v16);
    }
  }

void sub_10002A300( int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9 = *a1;
  *a1 &= ~0x10u;
  if ((v9 & 0x20) == 0)
  {
    a1[6] = 0;
    a1[8] = 599917567;
    uint64_t v10 = a1 + 8;
    (*(void (**)(int *))(*((void *)a1 + 2) + 8LL))(a1 + 10);
    uint64_t v11 = *((unsigned __int8 *)a1 + 40);
    int v12 = strlen(*((const char **)a1 + 1));
    memcpy((char *)v10 + v11 + 9, *((const void **)a1 + 1), v12);
    __int16 v13 = v11 + v12 + 5;
    uint64_t v14 = (v11 + v12 + 9);
    a1[7] = v14;
    *((_BYTE *)a1 + 36) = 1;
    *((_BYTE *)a1 + 38) = HIBYTE(v13);
    *((_BYTE *)a1 + 39) = v13;
    int v15 = *a1;
    int v16 = a1[1] + 1;
    *((_BYTE *)a1 + 37) = *((_BYTE *)a1 + 4) + 1;
    *a1 = v15 | 0x20;
    a1[1] = v16;
LABEL_5:
    output(0LL, (uint64_t)(a1 + 8), v14, a4, a5, a6, a7, a8, v17);
    ++a1[6];
    *a1 |= 0x10u;
    timeout((int)sub_10002A300);
    return;
  }

  if (a1[6] < chap_max_transmits)
  {
    uint64_t v14 = a1[7];
    goto LABEL_5;
  }

  *a1 = v9 & 0xFFFFFFC3 | 0xC;
  auth_peer_fail(0, 49699LL, a3, a4, a5, a6, a7, a8);
}

void chap_auth_with_peer( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  if ((xmmword_1000481F0 & 2) != 0)
  {
    error("CHAP: authentication with peer already started!", a2, a3, a4, a5, a6, a7, a8, a9);
  }

  else
  {
    uint64_t v9 = qword_100047F78;
    if (!qword_100047F78) {
LABEL_5:
    }
      fatal("CHAP digest 0x%x requested but not available", a2, a3, a4, a5, a6, a7, a8, a3);
    while (*(_DWORD *)v9 != (_DWORD)a3)
    {
      uint64_t v9 = *(void *)(v9 + 64);
      if (!v9) {
        goto LABEL_5;
      }
    }

    *((void *)&xmmword_1000481F0 + 1) = a2;
    *(void *)&xmmword_100048200 = v9;
    LODWORD(xmmword_1000481Fnotify((uint64_t **)acsp_down_notifier, 0) = xmmword_1000481F0 | 2;
  }

void *sub_10002A4C0()
{
  xmmword_100048380 = 0u;
  unk_100048390 = 0u;
  xmmword_100048360 = 0u;
  unk_100048370 = 0u;
  xmmword_100048340 = 0u;
  unk_100048350 = 0u;
  xmmword_100048320 = 0u;
  unk_100048330 = 0u;
  xmmword_100048300 = 0u;
  unk_100048310 = 0u;
  xmmword_1000482E0 = 0u;
  unk_1000482F0 = 0u;
  xmmword_1000482C0 = 0u;
  unk_1000482D0 = 0u;
  xmmword_1000482A0 = 0u;
  unk_1000482B0 = 0u;
  xmmword_100048280 = 0u;
  unk_100048290 = 0u;
  xmmword_100048260 = 0u;
  unk_100048270 = 0u;
  xmmword_100048240 = 0u;
  unk_100048250 = 0u;
  xmmword_100048220 = 0u;
  unk_100048230 = 0u;
  xmmword_100048200 = 0u;
  unk_100048210 = 0u;
  xmmword_1000481F0 = 0u;
  bzero(&dword_100047F80, 0x270uLL);
  chap_md5_init();
  return chapms_init();
}

void sub_10002A528( uint64_t a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v9 = __rev16(*((unsigned __int16 *)a2 + 1));
  uint64_t v10 = v9 - 4;
  uint64_t v12 = a2[1];
  __int16 v13 = a2 + 4;
  uint64_t v14 = *a2;
  if ((v14 - 3) < 2)
  {
    int v34 = xmmword_1000481F0;
    if ((xmmword_1000481F0 & 7) != 3) {
      return;
    }
    int v35 = xmmword_1000481F0 | 4;
    LODWORD(xmmword_1000481Fnotify((uint64_t **)acsp_down_notifier, 0) = xmmword_1000481F0 | 4;
    if ((v34 & 0x10) != 0)
    {
      LODWORD(xmmword_1000481Fnotify((uint64_t **)acsp_down_notifier, 0) = v35 & 0xFFFFFFEF;
      untimeout((uint64_t)sub_10002B1AC, (uint64_t)&xmmword_1000481F0);
    }

    if ((_DWORD)v14 == 3)
    {
      uint64_t v36 = *(unsigned int (**)(unsigned __int8 *, uint64_t, char *))(xmmword_100048200 + 32);
      if (v36)
      {
LABEL_61:
        auth_withpeer_success(0, 49699, *(_DWORD *)xmmword_100048200);
        return;
      }

      uint64_t v49 = "CHAP authentication succeeded";
LABEL_57:
      if ((_DWORD)v10) {
        info("%s: %.*v", (uint64_t)a2, a3, a4, a5, a6, a7, a8, (int)v49);
      }
      else {
        info("%s", (uint64_t)a2, a3, a4, a5, a6, a7, a8, (int)v49);
      }
      if ((_DWORD)v14 != 3) {
        goto LABEL_73;
      }
      goto LABEL_61;
    }

    int v44 = *(uint64_t (**)(unsigned __int8 *, uint64_t))(xmmword_100048200 + 40);
    if (!v44)
    {
      uint64_t v49 = "CHAP authentication failed";
      goto LABEL_57;
    }

    byte_1000484A2 = 0;
    int v45 = v44(v13, v10);
    if (v45 == 2)
    {
      if (byte_1000483A0 != 1 || (byte_1000483A0 = 0, byte_1000485A2 != (_DWORD)v12))
      {
        LODWORD(xmmword_1000481Fnotify((uint64_t **)acsp_down_notifier, 0) = v34;
        uint64_t v46 = (uint64_t)v13;
        int v47 = v10;
        int v48 = 0;
        goto LABEL_71;
      }
    }

    else
    {
      if (v45 != 1) {
        goto LABEL_73;
      }
      if (byte_1000483A0 != 1 || (byte_1000483A0 = 0, byte_1000485A2 != (_DWORD)v12))
      {
        LODWORD(xmmword_1000481Fnotify((uint64_t **)acsp_down_notifier, 0) = v34;
        uint64_t v46 = (uint64_t)v13;
        int v47 = v10;
        int v48 = 1;
LABEL_71:
        LODWORD(xmmword_1000481Fnotify((uint64_t **)acsp_down_notifier, 0) = xmmword_1000481F0 | 4;
LABEL_73:
        LODWORD(xmmword_1000481Fnotify((uint64_t **)acsp_down_notifier, 0) = xmmword_1000481F0 | 8;
        auth_withpeer_fail(0, 49699);
        return;
      }
    }

    LODWORD(xmmword_1000481Fnotify((uint64_t **)acsp_down_notifier, 0) = xmmword_1000481F0 & 0xFFFFFFFB;
    return;
  }

  if ((_DWORD)v14 == 2)
  {
    unsigned int v37 = dword_100047F80;
    if ((dword_100047F80 & 1) != 0 && v10 >= 2 && byte_100047FA5 == (_DWORD)v12)
    {
      if ((dword_100047F80 & 0x20) != 0)
      {
        int v50 = v10 + ~a2[4];
        if (v50 < 0) {
          return;
        }
        if ((dword_100047F80 & 0x10) != 0)
        {
          dword_100047F80 &= ~0x10u;
          untimeout((uint64_t)sub_10002A300, (uint64_t)&dword_100047F80);
        }

        if (explicit_remote)
        {
          uint64_t v40 = &remote_name;
        }

        else
        {
          LODWORD(v99) = v50;
          uint64_t v40 = (const char *)&v104;
          slprintf((int)&v104, 257, "%.*v");
        }

        uint64_t v74 = (uint64_t (*)(const char *, const char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))chap_verify_hook;
        if (!chap_verify_hook) {
          uint64_t v74 = sub_10002B260;
        }
        int v39 = v74( v40,  (const char *)qword_100047F88,  v12,  qword_100047F90,  (uint64_t)&unk_100047FA8,  (uint64_t)(a2 + 4),  (uint64_t)&byte_1000480EC,  256LL);
        if (v39 && auth_number())
        {
          unsigned int v37 = dword_100047F80;
        }

        else
        {
          unsigned int v37 = dword_100047F80 | 8;
          dword_100047F80 |= 8u;
        }
      }

      else
      {
        if ((dword_100047F80 & 4) == 0) {
          return;
        }
        int v39 = 0;
        uint64_t v40 = 0LL;
      }

      outpacket_buf = 599917567;
      int v75 = strlen(&byte_1000480EC);
      int v81 = v75;
      int v82 = (v37 >> 3) & 1;
      if (v39 == -1) {
        int v82 = 1;
      }
      if (v82) {
        char v83 = 4;
      }
      else {
        char v83 = 3;
      }
      LOBYTE(word_10004412notify((uint64_t **)acsp_down_notifier, 0) = v83;
      HIBYTE(word_10004412notify((uint64_t **)acsp_down_notifier, 0) = v12;
      LOBYTE(word_100044122) = (unsigned __int16)(v75 + 4) >> 8;
      HIBYTE(word_100044122) = v75 + 4;
      if (v75 >= 1) {
        memcpy(&byte_100044124, &byte_1000480EC, v75);
      }
      output(0LL, (uint64_t)&outpacket_buf, (v81 + 8), v76, v77, v78, v79, v80, (int)v99);
      byte_1000483A1 = 0;
      char v91 = dword_100047F80;
      if (v39 == -1)
      {
        dword_100047F80 |= 0x20u;
        ++byte_100047FA5;
        __strlcpy_chk(&byte_1000483A1, v40, 257LL, 257LL);
      }

      else if ((dword_100047F80 & 4) == 0)
      {
        dword_100047F80 = dword_100047F80 & 0xFFFFFFDB | 4;
        if ((v91 & 8) != 0)
        {
          notice("CHAP peer authentication failed for %q", v84, v85, v86, v87, v88, v89, v90, (int)v40);
          auth_peer_fail(0, 49699LL, v93, v94, v95, v96, v97, v98);
        }

        else
        {
          notice("CHAP peer authentication succeeded for %q", v84, v85, v86, v87, v88, v89, v90, (int)v40);
          size_t v92 = strlen(v40);
          auth_peer_success(0, 49699, *(_DWORD *)qword_100047F90, (uint64_t)v40, v92);
          if (chap_rechallenge_time)
          {
            dword_100047F80 |= 0x10u;
            uint64_t v33 = sub_10002A300;
LABEL_26:
            timeout((int)v33);
          }
        }
      }
    }
  }

  else if ((_DWORD)v14 == 1)
  {
    if (v10 >= 2 && (xmmword_1000481F0 & 3) == 3)
    {
      unsigned int v16 = *v13;
      if (v10 > v16)
      {
        if ((xmmword_1000481F0 & 0x10) != 0)
        {
          LODWORD(xmmword_1000481Fnotify((uint64_t **)acsp_down_notifier, 0) = xmmword_1000481F0 & 0xFFFFFFEF;
          untimeout((uint64_t)sub_10002B1AC, (uint64_t)&xmmword_1000481F0);
          unsigned int v16 = *v13;
        }

        int v100 = v10 + ~v16;
        slprintf((int)v103, 257, "%.*v");
        if (explicit_remote || remote_name && !v103[0]) {
          __strlcpy_chk(v103, &remote_name, 257LL, 257LL);
        }
        if (!get_secret(0LL, *((const char **)&xmmword_1000481F0 + 1), v103, v102, (int *)&v101, 0))
        {
          unsigned int v101 = 0;
          warning("No CHAP secret found for authenticating us to %q", v17, v18, v19, v20, v21, v22, v23, (int)v103);
        }

        byte_1000483A0 = 0;
        int v104 = 599917567;
        (*(void (**)(_BYTE *, uint64_t, void, unsigned __int8 *, _BYTE *, void, char *))(xmmword_100048200 + 24))( v109,  v12,  *((void *)&xmmword_1000481F0 + 1),  a2 + 4,  v102,  v101,  (char *)&xmmword_100048200 + 8);
        __memset_chk(v102, 0LL, (int)v101, 257LL);
        uint64_t v24 = v109[0];
        int v25 = strlen(*((const char **)&xmmword_1000481F0 + 1));
        memcpy(&v109[v109[0] + 1], *((const void **)&xmmword_1000481F0 + 1), v25);
        uint64_t v26 = v24 + v25;
        char v105 = 2;
        char v106 = v12;
        char v107 = (unsigned __int16)(v26 + 5) >> 8;
        char v108 = v26 + 5;
        uint64_t v27 = v26 + 9;
        output(0LL, (uint64_t)&v104, v26 + 9, v28, v29, v30, v31, v32, v100);
        HIDWORD(xmmword_10004824notify((uint64_t **)acsp_down_notifier, 0) = v27;
        __memcpy_chk(&unk_100048250, &v104, v27, 336LL);
        LODWORD(xmmword_1000481Fnotify((uint64_t **)acsp_down_notifier, 0) = xmmword_1000481F0 & 0xFFFFFFEB | 0x10;
        uint64_t v33 = sub_10002B1AC;
        goto LABEL_26;
      }
    }
  }

  else if (chap_unknown_hook)
  {
    char v41 = dword_100047F80;
    if ((dword_100047F80 & 1) != 0)
    {
      BOOL v42 = 0;
      byte_1000480EC = 0;
      if ((dword_100047F80 & 4) == 0)
      {
        int v99 = &byte_1000480EC;
        int v43 = chap_unknown_hook(&byte_1000483A1, qword_100047F88, v14, v12, qword_100047F90, &unk_100047FA8, v13, v10);
        if (v43 == -2) {
          return;
        }
        if (v43)
        {
          char v41 = dword_100047F80;
          BOOL v42 = v43 == -1;
        }

        else
        {
          BOOL v42 = 0;
          char v41 = dword_100047F80 | 8;
          dword_100047F80 |= 8u;
        }
      }

      outpacket_buf = 599917567;
      int v51 = strlen(&byte_1000480EC);
      int v57 = v51;
      else {
        char v58 = 3;
      }
      LOBYTE(word_10004412notify((uint64_t **)acsp_down_notifier, 0) = v58;
      HIBYTE(word_10004412notify((uint64_t **)acsp_down_notifier, 0) = v12;
      LOBYTE(word_100044122) = (unsigned __int16)(v51 + 4) >> 8;
      HIBYTE(word_100044122) = v51 + 4;
      if (v51 >= 1) {
        memcpy(&byte_100044124, &byte_1000480EC, v51);
      }
      output(0LL, (uint64_t)&outpacket_buf, (v57 + 8), v52, v53, v54, v55, v56, (int)v99);
      if (!v42)
      {
        char v66 = dword_100047F80;
        if ((dword_100047F80 & 4) == 0)
        {
          dword_100047F80 |= 4u;
          if ((v66 & 8) != 0)
          {
            notice("CHAP peer authentication failed for %q", v59, v60, v61, v62, v63, v64, v65, (int)&byte_1000483A1);
            auth_peer_fail(0, 49699LL, v68, v69, v70, v71, v72, v73);
          }

          else
          {
            notice("CHAP peer authentication succeeded for %q", v59, v60, v61, v62, v63, v64, v65, (int)&byte_1000483A1);
            size_t v67 = strlen(&byte_1000483A1);
            auth_peer_success(0, 49699, *(_DWORD *)qword_100047F90, (uint64_t)&byte_1000483A1, v67);
            if (chap_rechallenge_time)
            {
              dword_100047F80 |= 0x10u;
              timeout((int)sub_10002A300);
            }
          }
        }
      }
    }
  }

void sub_10002AE54( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8 = dword_100047F80;
  if ((dword_100047F80 & 0x10) != 0)
  {
    dword_100047F80 &= ~0x10u;
    untimeout((uint64_t)sub_10002A300, (uint64_t)&dword_100047F80);
    char v8 = dword_100047F80;
  }

  if ((v8 & 2) != 0)
  {
    dword_100047F80 = 0;
    auth_peer_fail(0, 49699LL, a3, a4, a5, a6, a7, a8);
  }

  int v9 = xmmword_1000481F0;
  if ((xmmword_1000481F0 & 0x10) != 0)
  {
    LODWORD(xmmword_1000481Fnotify((uint64_t **)acsp_down_notifier, 0) = xmmword_1000481F0 & 0xFFFFFFEF;
    untimeout((uint64_t)sub_10002B1AC, (uint64_t)&xmmword_1000481F0);
    int v9 = xmmword_1000481F0;
  }

  if ((v9 & 6) == 2)
  {
    LODWORD(xmmword_1000481Fnotify((uint64_t **)acsp_down_notifier, 0) = v9 & 0xFFFFFFFD;
    auth_withpeer_fail(0, 49699);
  }

void sub_10002AF08()
{
  LODWORD(xmmword_1000481Fnotify((uint64_t **)acsp_down_notifier, 0) = xmmword_1000481F0 | 1;
  char v7 = dword_100047F80;
  dword_100047F80 |= 1u;
  if ((v7 & 2) != 0) {
    sub_10002A300(&dword_100047F80, v0, v1, v2, v3, v4, v5, v6);
  }
}

void sub_10002AF50()
{
  if ((xmmword_1000481F0 & 0x10) != 0) {
    untimeout((uint64_t)sub_10002B1AC, (uint64_t)&xmmword_1000481F0);
  }
  LODWORD(xmmword_1000481Fnotify((uint64_t **)acsp_down_notifier, 0) = 0;
  if ((dword_100047F80 & 0x10) != 0) {
    untimeout((uint64_t)sub_10002A300, (uint64_t)&dword_100047F80);
  }
  dword_100047F80 = 0;
  if (byte_1000485A4 == 1)
  {
    pthread_cancel((pthread_t)qword_1000485C0);
    byte_1000485A4 = 0;
  }

uint64_t sub_10002AFD0(unsigned __int8 *a1, int a2, void (*a3)(uint64_t, const char *), uint64_t a4)
{
  if (a2 < 4) {
    return 0LL;
  }
  int v5 = a1[2];
  int v6 = a1[3];
  uint64_t v7 = v6 | (v5 << 8);
  int v12 = *a1;
  int v13 = a1[1];
  unsigned int v25 = v7 - 4;
  else {
    uint64_t v14 = " %s";
  }
  a3(a4, v14);
  int v15 = a1 + 4;
  ((void (*)(uint64_t, const char *, ...))a3)(a4, " id=0x%x", v13);
  if ((v12 - 1) < 2)
  {
    if (v7 >= 5)
    {
      unsigned int v18 = *v15;
      if (v25 <= v18) {
        return v7;
      }
      uint64_t v19 = (char *)(a1 + 5);
      int v20 = v25 + ~v18;
      a3(a4, " <");
      if (v18)
      {
        unsigned int v21 = v18 + 1;
        do
        {
          int v22 = *v19++;
          ((void (*)(uint64_t, const char *, ...))a3)(a4, "%.2x", v22);
          --v21;
        }

        while (v21 > 1);
      }

      a3(a4, ">, name = ");
      unsigned int v16 = v19;
      int v17 = v20;
      goto LABEL_15;
    }

    return 4LL;
  }

  if ((v12 - 3) < 2)
  {
    a3(a4, " ");
    unsigned int v16 = (char *)(a1 + 4);
    int v17 = v7 - 4;
LABEL_15:
    print_string(v16, v17, a3, a4);
    return v7;
  }

  unsigned int v23 = (v5 << 8) + v6 - 3;
  do
  {
    int v24 = *v15++;
    ((void (*)(uint64_t, const char *, ...))a3)(a4, " %.2x", v24);
    --v23;
  }

  while (v23 > 1);
  return v7;
}

void sub_10002B1AC( unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v9 = *a1;
  unsigned int v10 = *a1 & 0xFFFFFFEF;
  *a1 = v10;
  if ((v9 & 0x40) == 0)
  {
    a1[22] = 0;
    *a1 = v10 | 0x40;
LABEL_4:
    output(0LL, (uint64_t)(a1 + 24), a1[23], a4, a5, a6, a7, a8, v11);
    ++a1[22];
    *a1 |= 0x10u;
    timeout((int)sub_10002B1AC);
    return;
  }

  *a1 = v9 & 0xFFFFFFA3 | 0xC;
  auth_peer_fail(0, 49699LL, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_10002B260( const char *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (get_secret(0LL, a1, a2, v24, (int *)&v23, 1)) {
    return (*(uint64_t (**)(uint64_t, const char *, _BYTE *, void, uint64_t, uint64_t, uint64_t, uint64_t))(a4 + 16))( a3,  a1,  v24,  v23,  a5,  a6,  a7,  a8);
  }
  error("No CHAP secret found for authenticating %q", v15, v16, v17, v18, v19, v20, v21, (int)a1);
  return 0LL;
}

uint64_t sub_10002B340(uint64_t a1, int a2, int a3)
{
  if ((byte_1000485A4 & 1) != 0) {
    return 0LL;
  }
  if (qword_1000485A8) {
    free((void *)qword_1000485A8);
  }
  size_t v7 = (a2 + 4);
  char v8 = malloc(v7);
  qword_1000485A8 = (uint64_t)v8;
  if (!v8)
  {
    error("CHAP: cannot allocate memory to save packet", v9, v10, v11, v12, v13, v14, v15, v30);
    return 0xFFFFFFFFLL;
  }

  memcpy(v8, (const void *)(a1 - 4), v7);
  dword_1000485B0 = a3;
  if (pipe((int *)&qword_1000485B8) < 0)
  {
    error("chap failed to create pipe for User Interface...\n", v16, v17, v18, v19, v20, v21, v22, v30);
    goto LABEL_11;
  }

  if (pthread_create((pthread_t *)&qword_1000485C0, 0LL, (void *(__cdecl *)(void *))sub_10002B470, 0LL))
  {
    error("chap failed to create thread for client User Interface...\n", v23, v24, v25, v26, v27, v28, v29, v30);
    close(qword_1000485B8);
    close(SHIDWORD(qword_1000485B8));
LABEL_11:
    free((void *)qword_1000485A8);
    qword_1000485A8 = 0LL;
    return 0xFFFFFFFFLL;
  }

  wait_input_hook = (uint64_t (*)(double))sub_10002B4F8;
  add_fd(qword_1000485B8);
  uint64_t result = 0LL;
  byte_1000485A4 = 1;
  return result;
}

uint64_t sub_10002B470()
{
  char __buf = -1;
  uint64_t v0 = pthread_self();
  if (!pthread_detach(v0))
  {
    if (byte_1000484A2) {
      uint64_t v1 = &byte_1000484A2;
    }
    else {
      uint64_t v1 = 0LL;
    }
    if (dword_1000485B0 == 1) {
      uint64_t v2 = &change_password_hook;
    }
    else {
      uint64_t v2 = &retry_password_hook;
    }
  }

  write(SHIDWORD(qword_1000485B8), &__buf, 1uLL);
  return 0LL;
}

void sub_10002B4F8()
{
  if ((_DWORD)qword_1000485B8 != -1 && is_ready_fd(qword_1000485B8))
  {
    byte_1000485A4 = 0;
    char v23 = 0;
    read(qword_1000485B8, &v23, 1uLL);
    wait_input_hook = 0LL;
    remove_fd(qword_1000485B8);
    close(qword_1000485B8);
    close(SHIDWORD(qword_1000485B8));
    qword_1000485B8 = -1LL;
    if (v23)
    {
      v25[0] = 0;
      if (!get_secret(0LL, *((const char **)&xmmword_1000481F0 + 1), v25, v24, (int *)&v22, 0))
      {
        unsigned int v22 = 0;
        warning("No CHAP secret found for authenticating us to %q", v0, v1, v2, v3, v4, v5, v6, (int)v25);
      }

      int v26 = 599917567;
      if (dword_1000485B0 == 1)
      {
        size_t v7 = strlen(new_passwd);
        int v8 = (*(uint64_t (**)(_WORD *, void, uint64_t, _BYTE *, void, char *, size_t, char *))(xmmword_100048200 + 48))( v27,  *((void *)&xmmword_1000481F0 + 1),  qword_1000485A8,  v24,  v22,  new_passwd,  v7,  (char *)&xmmword_100048200 + 8);
        if (!v8) {
          save_new_password();
        }
      }

      else
      {
        int v8 = (*(uint64_t (**)(_WORD *, void, uint64_t, _BYTE *, void, char *))(xmmword_100048200 + 56))( v27,  *((void *)&xmmword_1000481F0 + 1),  qword_1000485A8,  v24,  v22,  (char *)&xmmword_100048200 + 8);
      }

      __memset_chk(v24, 0LL, (int)v22, 257LL);
      byte_1000483A0 = 1;
      byte_1000485A2 = *(_BYTE *)(qword_1000485A8 + 1);
      free((void *)qword_1000485A8);
      qword_1000485A8 = 0LL;
      if (!v8) {
        output(0LL, (uint64_t)&v26, __rev16(v27[1]) + 4, v16, v17, v18, v19, v20, v21);
      }
    }

    else
    {
      free((void *)qword_1000485A8);
      qword_1000485A8 = 0LL;
      int v15 = xmmword_1000481F0;
      if ((xmmword_1000481F0 & 0x10) != 0)
      {
        LODWORD(xmmword_1000481Fnotify((uint64_t **)acsp_down_notifier, 0) = xmmword_1000481F0 & 0xFFFFFFEF;
        untimeout((uint64_t)sub_10002B1AC, (uint64_t)&xmmword_1000481F0);
        int v15 = xmmword_1000481F0;
      }

      LODWORD(xmmword_1000481Fnotify((uint64_t **)acsp_down_notifier, 0) = v15 | 4;
      auth_withpeer_cancelled(0, 49699LL, v9, v10, v11, v12, v13, v14);
    }
  }

uint64_t setup_security_context()
{
  kern_return_t v0;
  uint64_t v1;
  __int128 v3;
  int v4;
  mach_port_name_t v5;
  mach_port_t sp[2];
  *(void *)mach_port_t sp = 0LL;
  uint64_t v5 = 0;
  uint64_t v0 = bootstrap_look_up(bootstrap_port, "com.apple.SystemConfiguration.PPPController-priv", &sp[1]);
  if (v0)
  {
    if (v0 == 1102) {
      return 0xFFFFFFFFLL;
    }
    else {
      return 4294967294LL;
    }
  }

  else
  {
    uint64_t v1 = sub_10002CF2C(sp[1], sp, &v5, &v4, &v3);
    mach_port_deallocate(mach_task_self_, sp[1]);
    if (!(_DWORD)v1)
    {
      if (!sp[0]
        || (uint64_t v1 = task_set_special_port(mach_task_self_, 4, sp[0]),
            mach_port_deallocate(mach_task_self_, sp[0]),
            !(_DWORD)v1))
      {
        if (v5)
        {
          if (!audit_session_join(v5)) {
            return 4294967293LL;
          }
          mach_port_deallocate(mach_task_self_, v5);
        }

        return 0LL;
      }
    }
  }

  return v1;
}

BOOL DesSetkey(uint64_t a1, uint8x8_t a2, uint8x8_t a3)
{
  uint64_t v3 = 0LL;
  int v4 = *(unsigned __int8 *)(a1 + 4);
  a2.i32[0] = *(_DWORD *)a1;
  int16x8_t v5 = (int16x8_t)vmovl_u8(a2);
  char v11 = v5.i8[0] & 0xFE;
  a3.i32[0] = *(_DWORD *)(a1 + 1);
  int v6 = *(unsigned __int8 *)(a1 + 5);
  char v13 = ((v6 | (v4 << 8)) >> 5) & 0xFE;
  *(int8x8_t *)v5.i8 = vand_s8( (int8x8_t)vshl_u16( (uint16x4_t)vorr_s8( (int8x8_t)vshl_n_s16(*(int16x4_t *)v5.i8, 8uLL),  (int8x8_t)*(_OWORD *)&vmovl_u8(a3)),  (uint16x4_t)0xFFFCFFFDFFFEFFFFLL),  (int8x8_t)0xFE00FE00FE00FELL);
  unsigned __int32 v12 = vmovn_s16(v5).u32[0];
  int v7 = *(unsigned __int8 *)(a1 + 6);
  char v14 = ((v7 | (v6 << 8)) >> 6) & 0xFE;
  char v15 = 2 * v7;
  do
  {
    uint32x4_t v8 = (uint32x4_t)vdupq_n_s32(*(&v11 + v3));
    v10[v3++] = vand_s8( vmovn_s16( vuzp1q_s16( (int16x8_t)vshlq_u32(v8, (uint32x4_t)xmmword_100037750),  (int16x8_t)vshlq_u32(v8, (uint32x4_t)xmmword_100037740))),  (int8x8_t)0x101010101010101LL);
  }

  while (v3 != 8);
  *__error() = 0;
  setkey((const char *)v10);
  return *__error() == 0;
}

uint64_t DesEncrypt(uint64_t a1, _BYTE *a2)
{
  uint64_t v3 = 0LL;
  unsigned int v4 = -8;
  do
  {
    uint32x4_t v5 = (uint32x4_t)vdupq_n_s32(*(unsigned __int8 *)(a1 + v3));
    v15[v3] = vand_s8( vmovn_s16( vuzp1q_s16( (int16x8_t)vshlq_u32(v5, (uint32x4_t)xmmword_100037750),  (int16x8_t)vshlq_u32(v5, (uint32x4_t)xmmword_100037740))),  (int8x8_t)0x101010101010101LL);
    v4 += 8;
    ++v3;
  }

  while (v4 < 0x38);
  *__error() = 0;
  encrypt((char *)v15, 0);
  int v6 = __error();
  uint64_t result = 0LL;
  if (!*v6)
  {
    unsigned int v8 = 0;
    uint64_t v9 = (unsigned __int8 *)v15;
    do
    {
      int v10 = 0;
      int v11 = 7;
      unsigned __int32 v12 = v9;
      do
      {
        int v13 = *v12++;
        v10 |= v13 << v11--;
      }

      while (v11 != -1);
      v9 += 8;
      *a2++ = v10;
      BOOL v14 = v8 >= 0x38;
      v8 += 8;
    }

    while (!v14);
    return 1LL;
  }

  return result;
}

uint64_t DesDecrypt(uint64_t a1, _BYTE *a2)
{
  uint64_t v3 = 0LL;
  unsigned int v4 = -8;
  do
  {
    uint32x4_t v5 = (uint32x4_t)vdupq_n_s32(*(unsigned __int8 *)(a1 + v3));
    v15[v3] = vand_s8( vmovn_s16( vuzp1q_s16( (int16x8_t)vshlq_u32(v5, (uint32x4_t)xmmword_100037750),  (int16x8_t)vshlq_u32(v5, (uint32x4_t)xmmword_100037740))),  (int8x8_t)0x101010101010101LL);
    v4 += 8;
    ++v3;
  }

  while (v4 < 0x38);
  *__error() = 0;
  encrypt((char *)v15, 1);
  int v6 = __error();
  uint64_t result = 0LL;
  if (!*v6)
  {
    unsigned int v8 = 0;
    uint64_t v9 = (unsigned __int8 *)v15;
    do
    {
      int v10 = 0;
      int v11 = 7;
      unsigned __int32 v12 = v9;
      do
      {
        int v13 = *v12++;
        v10 |= v13 << v11--;
      }

      while (v11 != -1);
      v9 += 8;
      *a2++ = v10;
      BOOL v14 = v8 >= 0x38;
      v8 += 8;
    }

    while (!v14);
    return 1LL;
  }

  return result;
}

uint64_t chap_md5_init()
{
  return chap_register_digest((uint64_t)&unk_100043208);
}

_BYTE *sub_10002BBD8(_BYTE *a1)
{
  unsigned int v2 = vcvtd_n_s64_f64(drand48(), 3uLL);
  *a1 = v2 + 16;
  return random_bytes(a1 + 1, v2 + 16);
}

uint64_t sub_10002BC08( char a1, uint64_t a2, const void *a3, CC_LONG a4, unsigned __int8 *a5, uint64_t a6, int a7, int a8)
{
  char data = a1;
  if (*(_BYTE *)a6 != 16) {
    goto LABEL_6;
  }
  int v13 = a5 + 1;
  CC_LONG v14 = *a5;
  CC_MD5_Init(&c);
  uint64_t v15 = 1LL;
  CC_MD5_Update(&c, &data, 1u);
  CC_MD5_Update(&c, a3, a4);
  CC_MD5_Update(&c, v13, v14);
  CC_MD5_Final(md, &c);
  if (*(void *)md == *(void *)(a6 + 1) && v22 == *(void *)(a6 + 9))
  {
    uint64_t v17 = "Access granted";
  }

  else
  {
LABEL_6:
    uint64_t v15 = 0LL;
    uint64_t v17 = "Access denied";
  }

  slprintf(a7, a8, v17);
  return v15;
}

uint64_t sub_10002BD20(_BYTE *a1, char a2, uint64_t a3, unsigned __int8 *a4, const void *a5, CC_LONG a6)
{
  char data = a2;
  uint64_t v9 = a4 + 1;
  CC_LONG v10 = *a4;
  CC_MD5_Init(&c);
  CC_MD5_Update(&c, &data, 1u);
  CC_MD5_Update(&c, a5, a6);
  CC_MD5_Update(&c, v9, v10);
  uint64_t result = CC_MD5_Final(a1 + 1, &c);
  *a1 = 16;
  return result;
}

uint64_t sub_10002BDB4(mach_port_t a1, uint64_t a2, int a3, int a4, int a5, int a6, _DWORD *a7, _DWORD *a8)
{
  int v17 = 4;
  uint64_t v18 = a2;
  int v19 = 16777472;
  int v20 = a3;
  int v21 = a4;
  int v23 = 1245184;
  int v24 = a5;
  int v25 = 1114112;
  int v26 = a6;
  int v27 = 1245184;
  NDR_record_t v28 = NDR_record;
  int v29 = a3;
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x465000000000LL;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }

  uint64_t v12 = mach_msg(&msg, 3, 0x5Cu, 0x3Cu, reply_port, 0, 0);
  uint64_t v13 = v12;
  if ((v12 - 268435458) <= 0xE && ((1 << (v12 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }

  else
  {
    if (!(_DWORD)v12)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v13 = 4294966988LL;
      }

      else if (msg.msgh_id == 18100)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v13 = 4294966996LL;
          if (v17 == 1 && msg.msgh_size == 52 && !msg.msgh_remote_port && HIWORD(v19) << 16 == 1114112)
          {
            uint64_t v13 = 0LL;
            int v14 = v22;
            *a7 = v18;
            *a8 = v14;
            return v13;
          }
        }

        else if (msg.msgh_size == 36)
        {
          uint64_t v13 = 4294966996LL;
          if (HIDWORD(v18))
          {
            if (msg.msgh_remote_port) {
              uint64_t v13 = 4294966996LL;
            }
            else {
              uint64_t v13 = HIDWORD(v18);
            }
          }
        }

        else
        {
          uint64_t v13 = 4294966996LL;
        }
      }

      else
      {
        uint64_t v13 = 4294966995LL;
      }

      mach_msg_destroy(&msg);
      return v13;
    }

    mig_dealloc_reply_port(msg.msgh_local_port);
  }

  return v13;
}

uint64_t sub_10002BFA0(mach_port_t a1, _DWORD *a2, _DWORD *a3)
{
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0x465100000000LL;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }

  uint64_t v7 = mach_msg(&msg, 3, 0x18u, 0x34u, reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v7)
    {
      mig_dealloc_reply_port(msg.msgh_local_port);
      return v8;
    }

    if (msg.msgh_id == 71)
    {
      uint64_t v8 = 4294966988LL;
    }

    else if (msg.msgh_id == 18101)
    {
      if ((msg.msgh_bits & 0x80000000) == 0)
      {
        if (msg.msgh_size == 44)
        {
          if (!msg.msgh_remote_port)
          {
            uint64_t v8 = v13;
            if (!v13)
            {
              int v11 = v15;
              *a2 = v14;
              *a3 = v11;
              return v8;
            }

            goto LABEL_23;
          }
        }

        else if (msg.msgh_size == 36)
        {
          if (msg.msgh_remote_port) {
            BOOL v9 = 1;
          }
          else {
            BOOL v9 = v13 == 0;
          }
          if (v9) {
            uint64_t v8 = 4294966996LL;
          }
          else {
            uint64_t v8 = v13;
          }
          goto LABEL_23;
        }
      }

      uint64_t v8 = 4294966996LL;
    }

    else
    {
      uint64_t v8 = 4294966995LL;
    }

uint64_t sub_10002C100(mach_port_t a1, void *a2, _DWORD *a3, _DWORD *a4)
{
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0x465200000000LL;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }

  uint64_t v9 = mach_msg(&msg, 3, 0x18u, 0x44u, reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }

  else
  {
    if (!(_DWORD)v9)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v10 = 4294966988LL;
      }

      else if (msg.msgh_id == 18102)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v10 = 4294966996LL;
          if (v14 == 1 && msg.msgh_size == 60 && !msg.msgh_remote_port && v16 == 1)
          {
            int v11 = v17;
            if (v17 == v18)
            {
              uint64_t v10 = 0LL;
              *a2 = v15;
              *a3 = v11;
              *a4 = v19;
              return v10;
            }
          }
        }

        else if (msg.msgh_size == 36)
        {
          uint64_t v10 = 4294966996LL;
          if (HIDWORD(v15))
          {
            if (msg.msgh_remote_port) {
              uint64_t v10 = 4294966996LL;
            }
            else {
              uint64_t v10 = HIDWORD(v15);
            }
          }
        }

        else
        {
          uint64_t v10 = 4294966996LL;
        }
      }

      else
      {
        uint64_t v10 = 4294966995LL;
      }

      mach_msg_destroy(&msg);
      return v10;
    }

    mig_dealloc_reply_port(msg.msgh_local_port);
  }

  return v10;
}

uint64_t sub_10002C2BC(mach_port_t a1, void *a2, _DWORD *a3, _DWORD *a4)
{
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0x465300000000LL;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }

  uint64_t v9 = mach_msg(&msg, 3, 0x18u, 0x44u, reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }

  else
  {
    if (!(_DWORD)v9)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v10 = 4294966988LL;
      }

      else if (msg.msgh_id == 18103)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v10 = 4294966996LL;
          if (v14 == 1 && msg.msgh_size == 60 && !msg.msgh_remote_port && v16 == 1)
          {
            int v11 = v17;
            if (v17 == v18)
            {
              uint64_t v10 = 0LL;
              *a2 = v15;
              *a3 = v11;
              *a4 = v19;
              return v10;
            }
          }
        }

        else if (msg.msgh_size == 36)
        {
          uint64_t v10 = 4294966996LL;
          if (HIDWORD(v15))
          {
            if (msg.msgh_remote_port) {
              uint64_t v10 = 4294966996LL;
            }
            else {
              uint64_t v10 = HIDWORD(v15);
            }
          }
        }

        else
        {
          uint64_t v10 = 4294966996LL;
        }
      }

      else
      {
        uint64_t v10 = 4294966995LL;
      }

      mach_msg_destroy(&msg);
      return v10;
    }

    mig_dealloc_reply_port(msg.msgh_local_port);
  }

  return v10;
}

uint64_t sub_10002C478(mach_port_t a1, void *a2, _DWORD *a3, _DWORD *a4)
{
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0x465400000000LL;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }

  uint64_t v9 = mach_msg(&msg, 3, 0x18u, 0x44u, reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }

  else
  {
    if (!(_DWORD)v9)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v10 = 4294966988LL;
      }

      else if (msg.msgh_id == 18104)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v10 = 4294966996LL;
          if (v14 == 1 && msg.msgh_size == 60 && !msg.msgh_remote_port && v16 == 1)
          {
            int v11 = v17;
            if (v17 == v18)
            {
              uint64_t v10 = 0LL;
              *a2 = v15;
              *a3 = v11;
              *a4 = v19;
              return v10;
            }
          }
        }

        else if (msg.msgh_size == 36)
        {
          uint64_t v10 = 4294966996LL;
          if (HIDWORD(v15))
          {
            if (msg.msgh_remote_port) {
              uint64_t v10 = 4294966996LL;
            }
            else {
              uint64_t v10 = HIDWORD(v15);
            }
          }
        }

        else
        {
          uint64_t v10 = 4294966996LL;
        }
      }

      else
      {
        uint64_t v10 = 4294966995LL;
      }

      mach_msg_destroy(&msg);
      return v10;
    }

    mig_dealloc_reply_port(msg.msgh_local_port);
  }

  return v10;
}

uint64_t sub_10002C634(mach_port_t a1, uint64_t a2, int a3, int a4, int *a5)
{
  int v13 = 1;
  uint64_t v14 = a2;
  int v15 = 16777472;
  int v16 = a3;
  NDR_record_t v17 = NDR_record;
  int v18 = a3;
  int v19 = a4;
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x465500000000LL;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }

  uint64_t v8 = mach_msg(&msg, 3, 0x3Cu, 0x30u, reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v8)
    {
      mig_dealloc_reply_port(msg.msgh_local_port);
      return v9;
    }

    if (msg.msgh_id == 71)
    {
      uint64_t v9 = 4294966988LL;
    }

    else if (msg.msgh_id == 18105)
    {
      if ((msg.msgh_bits & 0x80000000) == 0)
      {
        if (msg.msgh_size == 40)
        {
          if (!msg.msgh_remote_port)
          {
            uint64_t v9 = HIDWORD(v14);
            if (!HIDWORD(v14))
            {
              *a5 = v15;
              return v9;
            }

            goto LABEL_23;
          }
        }

        else if (msg.msgh_size == 36)
        {
          if (msg.msgh_remote_port) {
            BOOL v10 = 1;
          }
          else {
            BOOL v10 = HIDWORD(v14) == 0;
          }
          if (v10) {
            uint64_t v9 = 4294966996LL;
          }
          else {
            uint64_t v9 = HIDWORD(v14);
          }
          goto LABEL_23;
        }
      }

      uint64_t v9 = 4294966996LL;
    }

    else
    {
      uint64_t v9 = 4294966995LL;
    }

uint64_t sub_10002C7DC(mach_port_t a1, unsigned int a2, _DWORD *a3)
{
  NDR_record_t v11 = NDR_record;
  unsigned int v12 = a2;
  mach_port_t reply_port = mig_get_reply_port();
  v10.msgh_remote_port = a1;
  v10.msgh_local_port = reply_port;
  v10.msgh_bits = 5395;
  *(void *)&v10.msgh_voucher_port = 0x465600000000LL;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&v10);
    mach_port_t reply_port = v10.msgh_local_port;
  }

  uint64_t v6 = mach_msg(&v10, 3, 0x24u, 0x30u, reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v6)
    {
      mig_dealloc_reply_port(v10.msgh_local_port);
      return v7;
    }

    if (v10.msgh_id == 71)
    {
      uint64_t v7 = 4294966988LL;
    }

    else if (v10.msgh_id == 18106)
    {
      if ((v10.msgh_bits & 0x80000000) == 0)
      {
        if (v10.msgh_size == 40)
        {
          if (!v10.msgh_remote_port)
          {
            uint64_t v7 = v12;
            if (!v12)
            {
              *a3 = v13;
              return v7;
            }

            goto LABEL_23;
          }
        }

        else if (v10.msgh_size == 36)
        {
          if (v10.msgh_remote_port) {
            BOOL v8 = 1;
          }
          else {
            BOOL v8 = v12 == 0;
          }
          if (v8) {
            uint64_t v7 = 4294966996LL;
          }
          else {
            uint64_t v7 = v12;
          }
          goto LABEL_23;
        }
      }

      uint64_t v7 = 4294966996LL;
    }

    else
    {
      uint64_t v7 = 4294966995LL;
    }

uint64_t sub_10002C940(mach_port_t a1, _DWORD *a2)
{
  mach_port_t reply_port = mig_get_reply_port();
  v9.msgh_remote_port = a1;
  v9.msgh_local_port = reply_port;
  v9.msgh_bits = 5395;
  *(void *)&v9.msgh_voucher_port = 0x465700000000LL;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&v9);
    mach_port_t reply_port = v9.msgh_local_port;
  }

  uint64_t v5 = mach_msg(&v9, 3, 0x18u, 0x30u, reply_port, 0, 0);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v5)
    {
      mig_dealloc_reply_port(v9.msgh_local_port);
      return v6;
    }

    if (v9.msgh_id == 71)
    {
      uint64_t v6 = 4294966988LL;
    }

    else if (v9.msgh_id == 18107)
    {
      if ((v9.msgh_bits & 0x80000000) == 0)
      {
        if (v9.msgh_size == 40)
        {
          if (!v9.msgh_remote_port)
          {
            uint64_t v6 = v10;
            if (!v10)
            {
              *a2 = v11;
              return v6;
            }

            goto LABEL_23;
          }
        }

        else if (v9.msgh_size == 36)
        {
          if (v9.msgh_remote_port) {
            BOOL v7 = 1;
          }
          else {
            BOOL v7 = v10 == 0;
          }
          if (v7) {
            uint64_t v6 = 4294966996LL;
          }
          else {
            uint64_t v6 = v10;
          }
          goto LABEL_23;
        }
      }

      uint64_t v6 = 4294966996LL;
    }

    else
    {
      uint64_t v6 = 4294966995LL;
    }

uint64_t sub_10002CA90(mach_port_t a1, _DWORD *a2)
{
  mach_port_t reply_port = mig_get_reply_port();
  v9.msgh_remote_port = a1;
  v9.msgh_local_port = reply_port;
  v9.msgh_bits = 5395;
  *(void *)&v9.msgh_voucher_port = 0x465800000000LL;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&v9);
    mach_port_t reply_port = v9.msgh_local_port;
  }

  uint64_t v5 = mach_msg(&v9, 3, 0x18u, 0x30u, reply_port, 0, 0);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v5)
    {
      mig_dealloc_reply_port(v9.msgh_local_port);
      return v6;
    }

    if (v9.msgh_id == 71)
    {
      uint64_t v6 = 4294966988LL;
    }

    else if (v9.msgh_id == 18108)
    {
      if ((v9.msgh_bits & 0x80000000) == 0)
      {
        if (v9.msgh_size == 40)
        {
          if (!v9.msgh_remote_port)
          {
            uint64_t v6 = v10;
            if (!v10)
            {
              *a2 = v11;
              return v6;
            }

            goto LABEL_23;
          }
        }

        else if (v9.msgh_size == 36)
        {
          if (v9.msgh_remote_port) {
            BOOL v7 = 1;
          }
          else {
            BOOL v7 = v10 == 0;
          }
          if (v7) {
            uint64_t v6 = 4294966996LL;
          }
          else {
            uint64_t v6 = v10;
          }
          goto LABEL_23;
        }
      }

      uint64_t v6 = 4294966996LL;
    }

    else
    {
      uint64_t v6 = 4294966995LL;
    }

uint64_t sub_10002CBE0(mach_port_t a1, unsigned int a2, _DWORD *a3)
{
  NDR_record_t v11 = NDR_record;
  unsigned int v12 = a2;
  mach_port_t reply_port = mig_get_reply_port();
  v10.msgh_remote_port = a1;
  v10.msgh_local_port = reply_port;
  v10.msgh_bits = 5395;
  *(void *)&v10.msgh_voucher_port = 0x465900000000LL;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&v10);
    mach_port_t reply_port = v10.msgh_local_port;
  }

  uint64_t v6 = mach_msg(&v10, 3, 0x24u, 0x30u, reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v6)
    {
      mig_dealloc_reply_port(v10.msgh_local_port);
      return v7;
    }

    if (v10.msgh_id == 71)
    {
      uint64_t v7 = 4294966988LL;
    }

    else if (v10.msgh_id == 18109)
    {
      if ((v10.msgh_bits & 0x80000000) == 0)
      {
        if (v10.msgh_size == 40)
        {
          if (!v10.msgh_remote_port)
          {
            uint64_t v7 = v12;
            if (!v12)
            {
              *a3 = v13;
              return v7;
            }

            goto LABEL_23;
          }
        }

        else if (v10.msgh_size == 36)
        {
          if (v10.msgh_remote_port) {
            BOOL v8 = 1;
          }
          else {
            BOOL v8 = v12 == 0;
          }
          if (v8) {
            uint64_t v7 = 4294966996LL;
          }
          else {
            uint64_t v7 = v12;
          }
          goto LABEL_23;
        }
      }

      uint64_t v7 = 4294966996LL;
    }

    else
    {
      uint64_t v7 = 4294966995LL;
    }

uint64_t sub_10002CD44( mach_port_t a1, uint64_t a2, int a3, int a4, int a5, int a6, int a7, int a8, int a9, _DWORD *a10, _DWORD *a11)
{
  int v18 = 4;
  uint64_t v19 = a2;
  int v20 = 16777472;
  int v21 = a3;
  int v22 = a4;
  int v24 = 1245184;
  int v25 = a5;
  int v26 = 1114112;
  int v27 = a6;
  int v28 = 1245184;
  NDR_record_t v29 = NDR_record;
  int v30 = a3;
  int v31 = a7;
  int v32 = a8;
  int v33 = a9;
  mach_port_t reply_port = mig_get_reply_port();
  v17.msgh_remote_port = a1;
  v17.msgh_local_port = reply_port;
  v17.msgh_bits = -2147478253;
  *(void *)&v17.msgh_voucher_port = 0x465D00000000LL;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&v17);
    mach_port_t reply_port = v17.msgh_local_port;
  }

  uint64_t v13 = mach_msg(&v17, 3, 0x68u, 0x3Cu, reply_port, 0, 0);
  uint64_t v14 = v13;
  if ((v13 - 268435458) <= 0xE && ((1 << (v13 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v17.msgh_local_port);
  }

  else
  {
    if (!(_DWORD)v13)
    {
      if (v17.msgh_id == 71)
      {
        uint64_t v14 = 4294966988LL;
      }

      else if (v17.msgh_id == 18113)
      {
        if ((v17.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v14 = 4294966996LL;
          if (v18 == 1 && v17.msgh_size == 52 && !v17.msgh_remote_port && HIWORD(v20) << 16 == 1114112)
          {
            uint64_t v14 = 0LL;
            int v15 = v23;
            *a10 = v19;
            *a11 = v15;
            return v14;
          }
        }

        else if (v17.msgh_size == 36)
        {
          uint64_t v14 = 4294966996LL;
          if (HIDWORD(v19))
          {
            if (v17.msgh_remote_port) {
              uint64_t v14 = 4294966996LL;
            }
            else {
              uint64_t v14 = HIDWORD(v19);
            }
          }
        }

        else
        {
          uint64_t v14 = 4294966996LL;
        }
      }

      else
      {
        uint64_t v14 = 4294966995LL;
      }

      mach_msg_destroy(&v17);
      return v14;
    }

    mig_dealloc_reply_port(v17.msgh_local_port);
  }

  return v14;
}

uint64_t sub_10002CF2C(mach_port_t a1, _DWORD *a2, _DWORD *a3, _DWORD *a4, _OWORD *a5)
{
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0x465F00000000LL;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }

  uint64_t v11 = mach_msg(&msg, 50331651, 0x18u, 0x84u, reply_port, 0, 0);
  uint64_t v12 = v11;
  if ((v11 - 268435458) <= 0xE && ((1 << (v11 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
    return v12;
  }

  if ((_DWORD)v11)
  {
    mig_dealloc_reply_port(msg.msgh_local_port);
    return v12;
  }

  if (msg.msgh_id == 71)
  {
    uint64_t v12 = 4294966988LL;
    goto LABEL_27;
  }

  if (msg.msgh_id != 18115)
  {
    uint64_t v12 = 4294966995LL;
    goto LABEL_27;
  }

  if ((msg.msgh_bits & 0x80000000) == 0)
  {
    if (msg.msgh_size == 36)
    {
      uint64_t v12 = 4294966996LL;
      if (v19)
      {
        if (msg.msgh_remote_port) {
          uint64_t v12 = 4294966996LL;
        }
        else {
          uint64_t v12 = v19;
        }
      }
    }

    else
    {
      uint64_t v12 = 4294966996LL;
    }

    goto LABEL_27;
  }

  uint64_t v12 = 4294966996LL;
  if (v17 != 2 || msg.msgh_size != 64 || msg.msgh_remote_port || v20 << 16 != 1114112 || v22 << 16 != 1114112)
  {
LABEL_27:
    mach_msg_destroy(&msg);
    return v12;
  }

  if (v24 || v25 < 0x20) {
    return 4294966987LL;
  }
  uint64_t v12 = 0LL;
  int v14 = v21;
  *a2 = v18;
  *a3 = v14;
  *a4 = v23;
  __int128 v15 = v27;
  *a5 = v26;
  a5[1] = v15;
  return v12;
}

uint64_t sub_10002D104(mach_port_t a1, int a2, void *a3, _DWORD *a4, _DWORD *a5, _OWORD *a6)
{
  *(NDR_record_t *)int v18 = NDR_record;
  *(_DWORD *)&v18[8] = a2;
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0x466000000000LL;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }

  uint64_t v12 = mach_msg(&msg, 50331651, 0x24u, 0x80u, reply_port, 0, 0);
  uint64_t v13 = v12;
  if ((v12 - 268435458) <= 0xE && ((1 << (v12 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
    return v13;
  }

  if ((_DWORD)v12)
  {
    mig_dealloc_reply_port(msg.msgh_local_port);
    return v13;
  }

  if (msg.msgh_id == 71)
  {
    uint64_t v13 = 4294966988LL;
    goto LABEL_27;
  }

  if (msg.msgh_id != 18116)
  {
    uint64_t v13 = 4294966995LL;
    goto LABEL_27;
  }

  if ((msg.msgh_bits & 0x80000000) == 0)
  {
    if (msg.msgh_size == 36)
    {
      uint64_t v13 = 4294966996LL;
      if (*(_DWORD *)&v18[8])
      {
        if (msg.msgh_remote_port) {
          uint64_t v13 = 4294966996LL;
        }
        else {
          uint64_t v13 = *(unsigned int *)&v18[8];
        }
      }
    }

    else
    {
      uint64_t v13 = 4294966996LL;
    }

    goto LABEL_27;
  }

  uint64_t v13 = 4294966996LL;
  if (*(_DWORD *)v18 != 1 || msg.msgh_size != 60 || msg.msgh_remote_port || v19 != 1 || (int v14 = v20, v20 != v21))
  {
LABEL_27:
    mach_msg_destroy(&msg);
    return v13;
  }

  if (v23 || v24 < 0x20) {
    return 4294966987LL;
  }
  uint64_t v13 = 0LL;
  *a3 = *(void *)&v18[4];
  *a4 = v14;
  *a5 = v22;
  __int128 v16 = v26;
  *a6 = v25;
  a6[1] = v16;
  return v13;
}

uint64_t sub_10002D314(mach_port_t a1, _DWORD *a2, _OWORD *a3)
{
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0x466100000000LL;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }

  uint64_t v7 = mach_msg(&msg, 50331651, 0x18u, 0x6Cu, reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) <= 0xE && ((1 << (v7 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
    return v8;
  }

  if ((_DWORD)v7)
  {
    mig_dealloc_reply_port(msg.msgh_local_port);
    return v8;
  }

  if (msg.msgh_id == 71)
  {
    uint64_t v8 = 4294966988LL;
LABEL_23:
    mach_msg_destroy(&msg);
    return v8;
  }

  if (msg.msgh_id != 18117)
  {
    uint64_t v8 = 4294966995LL;
    goto LABEL_23;
  }

  if ((msg.msgh_bits & 0x80000000) != 0) {
    goto LABEL_22;
  }
  if (msg.msgh_size != 40)
  {
    if (msg.msgh_size == 36)
    {
      if (msg.msgh_remote_port) {
        BOOL v9 = 1;
      }
      else {
        BOOL v9 = v14 == 0;
      }
      if (v9) {
        uint64_t v8 = 4294966996LL;
      }
      else {
        uint64_t v8 = v14;
      }
      goto LABEL_23;
    }

    goto LABEL_22;
  }

  if (msg.msgh_remote_port)
  {
LABEL_22:
    uint64_t v8 = 4294966996LL;
    goto LABEL_23;
  }

  uint64_t v8 = v14;
  if (v14) {
    goto LABEL_23;
  }
  uint64_t v11 = (char *)&msg + ((msg.msgh_size + 3LL) & 0x1FFFFFFFCLL);
  if (*(_DWORD *)v11 || *((_DWORD *)v11 + 1) < 0x20u) {
    return 4294966987LL;
  }
  uint64_t v8 = 0LL;
  *a2 = v15;
  __int128 v12 = *(_OWORD *)(v11 + 36);
  *a3 = *(_OWORD *)(v11 + 20);
  a3[1] = v12;
  return v8;
}