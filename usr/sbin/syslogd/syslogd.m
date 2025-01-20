void sub_1000013CC(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  void v5[6];
  do
    v4 = __ldxr((unsigned int *)&xmmword_10001E388 + 2);
  while (__stxr(v4 + 1, (unsigned int *)&xmmword_10001E388 + 2));
  asl_msg_retain(a1);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 0x40000000LL;
  v5[2] = sub_100001458;
  v5[3] = &unk_1000187C0;
  v5[4] = a1;
  v5[5] = a2;
  dispatch_async((dispatch_queue_t)qword_10001C040, v5);
}

uint64_t sub_100001458(uint64_t a1)
{
  time_t v2 = time(0LL);
  uint64_t v3 = qword_10001E418;
  byte_10001C048 = 0;
  uint64_t val_for_key = asl_msg_get_val_for_key(*(void *)(a1 + 32), "ASLModule");
  if (val_for_key)
  {
    if (v3)
    {
      uint64_t v5 = *(void *)(v3 + 24);
      if (v5)
      {
        v6 = (const char *)val_for_key;
        do
        {
          uint64_t v5 = *(void *)(v5 + 24);
        }

        while (v5);
      }
    }
  }

  else
  {
    else {
      BOOL v7 = v3 == 0;
    }
    if (!v7)
    {
      while (1)
      {
        uint64_t v3 = *(void *)(v3 + 24);
        if (!v3) {
          break;
        }
        sub_100001614(v3, *(void *)(a1 + 32));
      }
    }
  }

  uint64_t v8 = asl_msg_get_val_for_key(*(void *)(a1 + 32), "ASLFinalNotification");
  if (v8) {
    asl_msg_set_key_val(*(void *)(a1 + 32), "ASLFreeNotify", v8);
  }
  if (dword_10001E404)
  {
    sub_100004904(*(void *)(a1 + 32), *(void *)(a1 + 40));
  }

  else
  {
    uint64_t v9 = -*(void *)(a1 + 40);
    do
      unint64_t v10 = __ldxr((unint64_t *)&xmmword_10001E388);
    while (__stxr(v10 + v9, (unint64_t *)&xmmword_10001E388));
  }

  uint64_t result = asl_msg_release(*(void *)(a1 + 32));
  do
    unsigned int v12 = __ldxr((unsigned int *)&xmmword_10001E388 + 2);
  while (__stxr(v12 - 1, (unsigned int *)&xmmword_10001E388 + 2));
  if (v2 - qword_10001C050 >= 300)
  {
    uint64_t result = sub_100001A00(300LL);
    qword_10001C050 = v2;
  }

  return result;
}

void sub_1000015E0(uint64_t a1)
{
  if ((!qword_10001E418 || (*(_BYTE *)(qword_10001E418 + 8) & 1) != 0) && (byte_10001C048 & 1) == 0)
  {
    byte_10001C048 = 1;
    sub_1000081B4(a1);
  }
}

uint64_t sub_100001614(uint64_t a1, uint64_t a2)
{
  uint64_t result = 1LL;
  if (a1 && a2)
  {
    uint64_t v5 = *(void *)(a1 + 16);
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 16);
      do
      {
        if ((*(_DWORD *)(v6 + 8) - 12) <= 2)
        {
          uint64_t v7 = *(void *)(v6 + 24);
          if (v7) {
            *(_DWORD *)(v7 + 72) &= ~0x80000000;
          }
        }

        uint64_t v6 = *(void *)(v6 + 40);
      }

      while (v6);
      do
      {
        uint64_t v8 = *(void *)v5;
        if (*(void *)v5)
        {
          int v9 = *(_DWORD *)(v5 + 8);
          if ((v9 - 17) >= 3)
          {
            if (v9 == 5)
            {
              uint64_t v8 = *(void *)v5;
            }

            if (asl_msg_cmp(v8, a2) == 1)
            {
              int v10 = *(_DWORD *)(v5 + 8);
              uint64_t result = 1LL;
              switch(v10)
              {
                case 1:
                  sub_1000029C4(a1, *(unsigned __int8 **)(v5 + 16), 1);
                  break;
                case 3:
                  return result;
                case 4:
                  return 0LL;
                case 6:
                  if ((*(_BYTE *)(a1 + 8) & 1) != 0)
                  {
                    v15 = *(const char **)(v5 + 16);
                    if (v15) {
                      notify_post(v15);
                    }
                  }

                  break;
                case 8:
                  if (*(void *)a1 && !strcmp(*(const char **)a1, "com.apple.asl"))
                  {
                    v16 = *(const char **)(v5 + 16);
                    int v17 = atoi(v16);
                    v18 = strchr(v16, 32);
                    if (v18 || (v18 = strchr(v16, 9)) != 0LL)
                    {
                      *v18++ = 0;
                      int v19 = atoi(v18);
                    }

                    else
                    {
                      int v19 = -1;
                    }

                    if (v17 != -1) {
                      asl_msg_set_key_val(a2, "ReadUID", *(void *)(v5 + 16));
                    }
                    if (v18)
                    {
                      if (v19 != -1) {
                        asl_msg_set_key_val(a2, "ReadGID", v18);
                      }
                      *(v18 - 1) = 32;
                    }
                  }

                  break;
                case 11:
                  sub_1000015E0(a2);
                  break;
                case 12:
                case 13:
                  uint64_t v11 = *(void *)(v5 + 24);
                  if (!v11) {
                    break;
                  }
                  if ((*(_BYTE *)(a1 + 8) & 1) == 0) {
                    break;
                  }
                  int v12 = *(_DWORD *)(v11 + 72);
                  if (v12 < 0) {
                    break;
                  }
                  *(_DWORD *)(v11 + 72) = v12 | 0x80000000;
                  if (v10 == 12)
                  {
                    uint64_t v25 = *(void *)(v11 + 192);
                    if (!v25) {
                      goto LABEL_57;
                    }
                    v14 = (_DWORD *)(v25 + 28);
                    goto LABEL_56;
                  }

                  if (v10 == 13)
                  {
                    uint64_t v13 = *(void *)(v11 + 192);
                    if (v13)
                    {
                      v14 = (_DWORD *)(v13 + 36);
LABEL_56:
                      ++*v14;
                    }
                  }

LABEL_57:
                  if ((v12 & 0x400) != 0)
                  {
                    sub_100002B10();
                    asl_msg_retain(a2);
                    v26 = (dispatch_queue_s *)qword_10001C060;
                    block = _NSConcreteStackBlock;
                    uint64_t v29 = 0x40000000LL;
                    v30 = sub_100002B68;
                    v27 = &unk_100018970;
LABEL_61:
                    v31 = v27;
                    uint64_t v32 = a1;
                    uint64_t v33 = v5;
                    uint64_t v34 = a2;
                    dispatch_async(v26, &block);
                  }

                  else
                  {
                    sub_100002BFC((const char **)a1, v5, a2);
                  }

                  break;
                case 14:
                  if ((*(_BYTE *)(a1 + 8) & 1) == 0) {
                    break;
                  }
                  uint64_t v20 = *(void *)(v5 + 24);
                  if (!v20) {
                    break;
                  }
                  uint64_t v21 = *(void *)(v20 + 192);
                  if (!v21) {
                    break;
                  }
                  int v22 = *(_DWORD *)(v20 + 72);
                  if (v22 < 0) {
                    break;
                  }
                  *(_DWORD *)(v20 + 72) = v22 | 0x80000000;
                  ++*(_DWORD *)(v21 + 24);
                  if ((v22 & 0x400) == 0)
                  {
                    sub_1000041FC((const char **)a1, v5, a2);
                    break;
                  }

                  sub_100002B10();
                  asl_msg_retain(a2);
                  v26 = (dispatch_queue_s *)qword_10001C060;
                  block = _NSConcreteStackBlock;
                  uint64_t v29 = 0x40000000LL;
                  v30 = sub_100004168;
                  v27 = &unk_100018AD8;
                  goto LABEL_61;
                case 16:
                  asl_msg_get_val_for_key(a2, "ASLModule");
                  v23 = *(const char **)(v5 + 16);
                  if (!v23) {
                    break;
                  }
                  if (!strcmp(*(const char **)(v5 + 16), "enable"))
                  {
                    unsigned int v24 = *(_DWORD *)(a1 + 8) | 1;
LABEL_53:
                    *(_DWORD *)(a1 + 8) = v24;
                    break;
                  }

                  if (!strcmp(v23, "disable"))
                  {
                    unsigned int v24 = *(_DWORD *)(a1 + 8) & 0xFFFFFFFE;
                    goto LABEL_53;
                  }

                  break;
                default:
                  break;
              }
            }
          }
        }

        uint64_t v5 = *(void *)(v5 + 40);
      }

      while (v5);
    }

    return 0LL;
  }

  return result;
}

      ++v33;
      v56 = v32[118];
    }

    while (v33 < v56);
    free(v69);
    v1 = v68;
    if (v34)
    {
      if ((_DWORD)v56)
      {
        v57 = 0LL;
        v58 = 0;
        v59 = (_DWORD *)qword_10001C208;
        v60 = (_WORD *)qword_10001C210;
        do
        {
          v61 = v59[v57];
          if ((v61 & 0x80000000) == 0)
          {
            if (v57 != v58)
            {
              v59[v58] = v61;
              v60[v58] = v60[v57];
            }

            ++v58;
          }

          ++v57;
        }

        while (v56 != v57);
        v32[118] = v58;
        if (v58)
        {
          v62 = reallocf(v59, 4LL * v58);
          qword_10001C208 = (uint64_t)v62;
          v63 = reallocf(v60, 2LL * v58);
          v64 = v63;
          qword_10001C210 = (uint64_t)v63;
          if (!v62 || !v63)
          {
            free(v62);
            qword_10001C208 = 0LL;
            free(v64);
            qword_10001C210 = 0LL;
            v32[118] = 0;
          }

          return asl_msg_release(*(void *)(v1 + 32));
        }
      }

      else
      {
        v32[118] = 0;
        v59 = (_DWORD *)qword_10001C208;
        v60 = (_WORD *)qword_10001C210;
      }

      free(v59);
      qword_10001C208 = 0LL;
      free(v60);
      qword_10001C210 = 0LL;
    }
  }

  return asl_msg_release(*(void *)(v1 + 32));
}

void sub_100001A00(time_t a1)
{
  time_t v2 = time(0LL);
  uint64_t v9 = qword_10001E418;
  if (qword_10001E418)
  {
    time_t v10 = v2;
    while (1)
    {
      uint64_t v11 = *(void *)(v9 + 16);
      if (v11) {
        break;
      }
LABEL_30:
      uint64_t v9 = *(void *)(v9 + 24);
      if (!v9) {
        return;
      }
    }

    while (1)
    {
      if (!a1)
      {
        uint64_t v16 = *(void *)(v11 + 24);
        if (v16)
        {
          if ((*(_BYTE *)(v16 + 73) & 4) != 0)
          {
            sub_1000039A4(v11, 3LL, v3, v4, v5, v6, v7, v8);
            if (*(_DWORD *)(v11 + 8) != 13) {
              sub_100003DD0(v11, 1);
            }
          }
        }

        goto LABEL_29;
      }

      int v12 = *(_DWORD *)(v11 + 8);
      switch(v12)
      {
        case 12:
          uint64_t v19 = *(void *)(v11 + 24);
          if (!v19) {
            goto LABEL_29;
          }
          uint64_t v20 = *(void *)(v19 + 192);
          if (!v20 || !*(void *)(v20 + 8) || *(_DWORD *)(v20 + 28)) {
            goto LABEL_29;
          }
          uint64_t v15 = *(void *)(v20 + 16);
          break;
        case 14:
          uint64_t v17 = *(void *)(v11 + 24);
          if (!v17) {
            goto LABEL_29;
          }
          uint64_t v18 = *(void *)(v17 + 192);
          if (!v18 || (*(_DWORD *)v18 & 0x80000000) != 0 || *(_DWORD *)(v18 + 24)) {
            goto LABEL_29;
          }
          uint64_t v15 = *(void *)(v18 + 8);
          break;
        case 13:
          uint64_t v13 = *(void *)(v11 + 24);
          if (!v13) {
            goto LABEL_29;
          }
          uint64_t v14 = *(void *)(v13 + 192);
          if (!v14 || !*(void *)(v14 + 8) || *(_DWORD *)(v14 + 36)) {
            goto LABEL_29;
          }
          uint64_t v15 = *(void *)(v14 + 24);
          break;
        default:
          goto LABEL_29;
      }

      if (v10 - v15 >= a1) {
        sub_1000039A4(v11, 3LL, v3, v4, v5, v6, v7, v8);
      }
LABEL_29:
      uint64_t v11 = *(void *)(v11 + 40);
      if (!v11) {
        goto LABEL_30;
      }
    }
  }

uint64_t sub_100001B3C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (qword_10001C058 != -1) {
    dispatch_once(&qword_10001C058, &stru_100018800);
  }
  if (qword_10001E418 || (qword_10001E418 = (uint64_t)asl_out_module_init()) != 0)
  {
    sub_1000064BC("%s: init\n", a2, a3, a4, a5, a6, a7, a8, (char)"asl_action");
    dword_10001C04C = 0;
    uint64_t v8 = qword_10001E418;
    if (qword_10001E418)
    {
      int v9 = 0;
      do
      {
        for (uint64_t i = *(void *)(v8 + 16); i; uint64_t i = *(void *)(i + 40))
        {
          sub_1000022D8((const char **)v8, i);
          uint64_t v11 = *(void *)(i + 24);
          if (v11) {
            v9 |= *(_DWORD *)(v11 + 72) & 0x404;
          }
        }

        uint64_t v8 = *(void *)(v8 + 24);
      }

      while (v8);
    }

    else
    {
      LOBYTE(v9) = 0;
    }

    if (DWORD2(xmmword_10001E428))
    {
      int v12 = qword_10001E438 ? (const char *)qword_10001E438 : "/var/log/syslogd.log";
      uint64_t v13 = fopen(v12, "a");
      if (v13)
      {
        uint64_t v14 = v13;
        for (uint64_t j = qword_10001E418; j; uint64_t j = *(void *)(j + 24))
        {
          uint64_t v16 = *(const char **)j;
          if (!*(void *)j) {
            uint64_t v16 = "<unknown>";
          }
          if ((*(_DWORD *)(j + 8) & 2) != 0) {
            uint64_t v17 = " (local)";
          }
          else {
            uint64_t v17 = (const char *)&unk_100015297;
          }
          fprintf(v14, "module: %s%s\n", v16, v17);
          asl_out_module_print(v14, j);
          fputc(10, v14);
        }

        fclose(v14);
      }
    }

    qword_10001C050 = time(0LL);
    if ((v9 & 4) != 0)
    {
      sub_100002668(0LL);
      if (!qword_10001C070) {
        sub_100004838();
      }
    }
  }

  return 0LL;
}

void sub_100001D00(id a1)
{
  qword_10001C040 = (uint64_t)dispatch_queue_create("ASL Action Queue", 0LL);
  qword_10001C060 = (uint64_t)dispatch_queue_create("iOS CrashLog Queue", 0LL);
  notify_register_dispatch( "com.apple.crash_mover",  &dword_10001C000,  (dispatch_queue_t)qword_10001C040,  &stru_100018840);
}

void sub_100001D64(id a1, int a2)
{
  uint64_t state64 = 0LL;
  uint64_t v2 = qword_10001C068;
  if (!notify_get_state(dword_10001C000, &state64) && state64 != (v2 != 0))
  {
    qword_10001C068 = 0LL;
    if (state64 == 1 && (qword_10001C068 = time(0LL)) != 0)
    {
      sub_1000064BC("CrashMover active: suspending crashlog queue and closing files\n", v3, v4, v5, v6, v7, v8, v9, v10);
      dispatch_suspend((dispatch_object_t)qword_10001C060);
      sub_100001A00(0LL);
    }

    else
    {
      sub_1000064BC("CrashMover finished\n", v3, v4, v5, v6, v7, v8, v9, v10);
      dispatch_resume((dispatch_object_t)qword_10001C060);
    }
  }

uint64_t sub_100001E10()
{
  return 0LL;
}

time_t sub_100001E3C()
{
  if (qword_10001C068)
  {
    dispatch_resume((dispatch_object_t)qword_10001C060);
    qword_10001C068 = 0LL;
  }

  dispatch_sync((dispatch_queue_t)qword_10001C060, &stru_100018B38);
  uint64_t v6 = qword_10001E418;
  if (qword_10001E418)
  {
    uint64_t v7 = qword_10001E418;
    do
    {
      for (uint64_t i = *(void *)(v7 + 16); i; uint64_t i = *(void *)(i + 40))
      {
        switch(*(_DWORD *)(i + 8))
        {
          case 0xC:
          case 0xD:
            sub_1000039A4(i, 4LL, v0, v1, v2, v3, v4, v5);
            uint64_t v9 = *(void *)(i + 24);
            if (v9)
            {
              char v10 = *(void **)(v9 + 192);
              if (!v10) {
                goto LABEL_17;
              }
              free(v10);
              goto LABEL_16;
            }

            break;
          case 0xE:
            sub_1000039A4(i, 4LL, v0, v1, v2, v3, v4, v5);
            uint64_t v11 = *(void *)(i + 24);
            if (v11)
            {
              uint64_t v12 = *(void *)(v11 + 192);
              if (v12)
              {
                if (*(_DWORD *)(v12 + 16)) {
                  sub_1000044BC(i);
                }
                sub_10000411C(v12);
LABEL_16:
                uint64_t v9 = *(void *)(i + 24);
LABEL_17:
                *(void *)(v9 + 192) = 0LL;
              }
            }

            break;
          case 0x11:
          case 0x12:
          case 0x13:
            sub_100004640(*(int **)(i + 32));
            break;
          default:
            continue;
        }
      }

      uint64_t v7 = *(void *)(v7 + 24);
    }

    while (v7);
  }

  asl_out_module_free(v6);
  qword_10001E418 = 0LL;
  time_t result = time(0LL);
  qword_10001C050 = result;
  return result;
}

uint64_t sub_100001F6C()
{
  return 0LL;
}

void sub_100001F94(id a1)
{
  time_t v1 = sub_100001E3C();
  sub_100001B3C(v1, v2, v3, v4, v5, v6, v7, v8);
}

uint64_t sub_100001FA8(char *__s2)
{
  uint64_t v1 = qword_10001E418;
  if (qword_10001E418 && __s2)
  {
    do
    {
      uint64_t v1 = *(void *)(v1 + 24);
    }

    while (v1);
  }

  return v1;
}

uint64_t sub_100001FF8(unsigned __int8 *a1)
{
  uint64_t v22 = 0LL;
  v23 = &v22;
  uint64_t v24 = 0x2000000000LL;
  if (a1)
  {
    uint64_t v1 = *a1;
    if (*a1)
    {
      if ((_DWORD)v1 == 64) {
        uint64_t v2 = a1 + 1;
      }
      else {
        uint64_t v2 = a1;
      }
      while (1)
      {
        int v3 = *v2;
        if (v3 != 32 && v3 != 9) {
          break;
        }
        ++v2;
      }

      uint64_t v5 = explode(v2, " \t");
      uint64_t v13 = (void **)v5;
      v23[3] = (uint64_t)v5;
      if (!v5) {
        goto LABEL_16;
      }
      unsigned int v14 = -1;
      do
        ++v14;
      while (*(void *)&v5[8 * v14]);
      if (v14 < 2)
      {
LABEL_16:
        uint64_t v1 = 0xFFFFFFFFLL;
LABEL_25:
        free_string_list(v13);
        goto LABEL_26;
      }

      if (qword_10001E418)
      {
        if (strcasecmp(*((const char **)v5 + 1), "define") || !strcmp((const char *)*v13, "*"))
        {
          v19[0] = _NSConcreteStackBlock;
          v19[1] = 0x40000000LL;
          v19[2] = sub_1000026AC;
          v19[3] = &unk_100018910;
          v19[4] = &v22;
          unsigned int v20 = v14;
          dispatch_sync((dispatch_queue_t)qword_10001C040, v19);
LABEL_21:
          uint64_t v1 = 0LL;
LABEL_24:
          uint64_t v13 = (void **)v23[3];
          goto LABEL_25;
        }

        uint64_t v17 = strdup((const char *)v2);
        if (v17)
        {
          uint64_t v18 = v17;
          block[0] = _NSConcreteStackBlock;
          block[1] = 0x40000000LL;
          block[2] = sub_1000021CC;
          block[3] = &unk_1000188E8;
          block[4] = &v22;
          block[5] = v17;
          dispatch_sync((dispatch_queue_t)qword_10001C040, block);
          free(v18);
          goto LABEL_21;
        }

        uint64_t v15 = "asl_action_control_set_param: memory allocation failed\n";
      }

      else
      {
        uint64_t v15 = "asl_action_control_set_param: no modules loaded\n";
      }

      sub_1000064BC(v15, v6, v7, v8, v9, v10, v11, v12, v19[0]);
      uint64_t v1 = 0xFFFFFFFFLL;
      goto LABEL_24;
    }
  }

  else
  {
    uint64_t v1 = 0xFFFFFFFFLL;
  }

LABEL_26:
  _Block_object_dispose(&v22, 8);
  return v1;
}

      uint64_t v12 = 1;
LABEL_30:
      uint64_t v18 = (const char **)&v9[v17];
      uint64_t v15 = *v18;
      ++v17;
      if (!*v18) {
        goto LABEL_33;
      }
    }

    uint64_t v21 = strchr(v15, 41);
    if (v21)
    {
      *uint64_t v21 = 0;
      uint64_t v15 = *v18;
    }

    uint64_t v22 = getenv(v15 + 5);
    if (v22)
    {
      v23 = v22;
      if (*v22 != 47) {
        asl_string_append_char_no_encoding(v11, 47LL);
      }
      asl_string_append_no_encoding(v11, v23);
      uint64_t v16 = 1;
    }

void sub_1000021CC(uint64_t a1)
{
  for (uint64_t i = *(char **)(a1 + 40); ; ++i)
  {
    int v2 = *i;
    if (v2 == 32 || v2 == 9) {
      break;
    }
  }

  while (v2 == 9 || v2 == 32)
  {
    char v4 = *++i;
    LOBYTE(v2) = v4;
  }

  while (v2 != 9 && v2 != 32)
  {
    char v5 = *++i;
    LOBYTE(v2) = v5;
  }

  uint64_t v6 = **(char ***)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  uint64_t v7 = (const char **)sub_100001FA8(v6);
  if (!v7)
  {
    uint64_t v8 = (const char **)asl_out_module_new(v6);
    uint64_t v7 = v8;
    uint64_t v9 = qword_10001E418;
    do
    {
      uint64_t v10 = v9;
      uint64_t v9 = *(void *)(v9 + 24);
    }

    while (v9);
    *(void *)(v10 + 24) = v8;
  }

  uint64_t v11 = asl_out_module_parse_line((uint64_t)v7, i);
  if (v11)
  {
    uint64_t v12 = v11;
    sub_1000022D8(v7, (uint64_t)v11);
    uint64_t v13 = v12[3];
    if (v13)
    {
      if ((*(_BYTE *)(v13 + 72) & 4) != 0)
      {
        sub_100002668(0LL);
        if (!qword_10001C070) {
          sub_100004838();
        }
      }
    }
  }

void sub_1000022D8(const char **a1, uint64_t a2)
{
  if (a1)
  {
    char v4 = (const char **)qword_10001E418;
    if ((const char **)qword_10001E418 != a1)
    {
      uint64_t v5 = *(void *)(a2 + 24);
      if (v5)
      {
        if (*(void *)(v5 + 8) && qword_10001E418 != 0)
        {
          while (1)
          {
            uint64_t v7 = v4[2];
            if (v7) {
              break;
            }
LABEL_14:
            char v4 = (const char **)v4[3];
            if (v4) {
              BOOL v11 = v4 == a1;
            }
            else {
              BOOL v11 = 1;
            }
            if (v11) {
              goto LABEL_23;
            }
          }

          while (1)
          {
            if (*((_DWORD *)v7 + 2) == 2)
            {
              uint64_t v8 = *((void *)v7 + 3);
              if (v8)
              {
                uint64_t v9 = *(const char **)(v8 + 8);
                if (v9)
                {
                  uint64_t v10 = *(void *)(a2 + 24);
                }
              }
            }

            uint64_t v7 = (const char *)*((void *)v7 + 5);
            if (!v7) {
              goto LABEL_14;
            }
          }

          asl_out_dst_data_release(v10);
          *(void *)(a2 + 24) = 0LL;
          if (*(_DWORD *)(a2 + 8) == 2)
          {
            name = 0LL;
            asprintf( &name,  "[Sender syslogd] [Level 5] [PID %u] [Message Configuration Notice:\n ASL Module %s sharing output destination %s with ASL Module %s.\n Output parameters from ASL Module %s override any specified in ASL Module %s.] [UID 0] [GID 0] [Facility syslog]",  dword_10001E37C,  *a1,  *(const char **)(*((void *)v7 + 3) + 8LL),  *v4,  *v4,  *a1);
            sub_100007114(name);
            free(name);
          }

          else
          {
            *(void *)(a2 + 24) = asl_out_dst_data_retain(*((void *)v7 + 3));
          }
        }
      }
    }

LABEL_23:
    switch(*(_DWORD *)(a2 + 8))
    {
      case 1:
        if (!*(void *)a2) {
          sub_1000029C4((uint64_t)a1, *(unsigned __int8 **)(a2 + 16), 1);
        }
        break;
      case 5:
        if ((const char **)qword_10001E418 != a1)
        {
          uint64_t v12 = calloc(1uLL, 0x30uLL);
          if (v12)
          {
            uint64_t v13 = v12;
            name = 0LL;
            asprintf( &name,  "[Sender syslogd] [Level 5] [PID %u] [Message Configuration Notice:\n ASL Module %s claims selected messages.\n Those messages may not appear in standard system log files or in the ASL database.] [UID 0] [GID 0] [Facility syslog]",  dword_10001E37C,  *a1);
            sub_100007114(name);
            free(name);
            *(void *)uint64_t v13 = asl_msg_copy(*(void *)a2);
            v13[2] = 4;
            uint64_t v14 = qword_10001E418;
            *((void *)v13 + 5) = *(void *)(qword_10001E418 + 16);
            *(void *)(v14 + 16) = v13;
          }

          uint64_t v15 = *(const char **)(a2 + 16);
          if (!v15 || strcmp(v15, "only")) {
            *(_DWORD *)(a2 + 8) = 0;
          }
        }

        break;
      case 0xB:
        ++dword_10001C04C;
        break;
      case 0xC:
        if (!*(void *)(*(void *)(a2 + 24) + 192LL))
        {
          size_t v16 = 40LL;
          goto LABEL_37;
        }

        break;
      case 0xD:
        if (!*(void *)(*(void *)(a2 + 24) + 192LL))
        {
          size_t v16 = 72LL;
LABEL_37:
          *(void *)(*(void *)(a2 + 24) + 192LL) = calloc(1uLL, v16);
        }

        break;
      case 0xE:
        uint64_t v17 = *(_DWORD **)(*(void *)(a2 + 24) + 192LL);
        if (v17 || (uint64_t v17 = calloc(1uLL, 0x38uLL), (*(void *)(*(void *)(a2 + 24) + 192LL) = v17) != 0LL)) {
          *uint64_t v17 = -1;
        }
        break;
      case 0x11:
        uint64_t v18 = sub_1000047A8((uint64_t)a1, a2);
        if (v18)
        {
          asprintf(&name, "%s%s", "com.apple.system.notify.service.path:0x87:", v18);
          if (name)
          {
            notify_register_dispatch(name, &out_token, (dispatch_queue_t)qword_10001C040, &stru_100018BF8);
            free(name);
            uint64_t v19 = calloc(1uLL, 4uLL);
            int v20 = out_token;
            if (v19) {
              goto LABEL_50;
            }
            goto LABEL_44;
          }
        }

        break;
      case 0x12:
        uint64_t v21 = sub_10000466C((uint64_t)a1, (void *)a2);
        notification_key = (char *)configuration_profile_create_notification_key();
        free(v21);
        if (notification_key)
        {
          v23 = (dispatch_queue_s *)qword_10001C040;
          uint64_t v24 = &stru_100018B78;
          goto LABEL_49;
        }

        break;
      case 0x13:
        uint64_t v25 = sub_10000466C((uint64_t)a1, (void *)a2);
        notification_key = (char *)configuration_profile_create_notification_key();
        free(v25);
        if (notification_key)
        {
          v23 = (dispatch_queue_s *)qword_10001C040;
          uint64_t v24 = &stru_100018BB8;
LABEL_49:
          notify_register_dispatch(notification_key, (int *)&name, v23, v24);
          free(notification_key);
          uint64_t v19 = calloc(1uLL, 4uLL);
          int v20 = (int)name;
          if (v19)
          {
LABEL_50:
            *uint64_t v19 = v20;
            *(void *)(a2 + 32) = v19;
          }

          else
          {
LABEL_44:
            notify_cancel(v20);
          }
        }

        break;
      default:
        return;
    }
  }

        uint64_t v25 = "_act_store_dir";
        v26 = a1;
        v27 = a2;
        v28 = v18;
LABEL_36:
        sub_100002FA4((char)v25, v26, v27, v28);
      }
    }
  }

uint64_t sub_100002668(uint64_t a1)
{
  uint64_t v1 = qword_10001E418;
  if (qword_10001E418)
  {
    int v2 = a1;
    do
    {
      a1 = sub_1000027F8(v1, 0LL, v2);
      uint64_t v1 = *(void *)(v1 + 24);
    }

    while (v1);
  }

  return asl_trigger_aslmanager(a1);
}

uint64_t sub_1000026AC(uint64_t a1)
{
  int v2 = **(char ***)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  uint64_t result = strcmp(v2, "*");
  int v4 = result;
  if ((_DWORD)result)
  {
    uint64_t result = sub_100001FA8(v2);
    uint64_t i = result;
    if (result) {
      goto LABEL_5;
    }
  }

  else
  {
    for (uint64_t i = qword_10001E418; i; uint64_t i = *(void *)(i + 24))
    {
LABEL_5:
      uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
      uint64_t v7 = *(const char **)(v6 + 8);
      uint64_t result = strcasecmp(v7, "enable");
      if ((_DWORD)result)
      {
        uint64_t result = strcasecmp(v7, "checkpoint");
        if (!(_DWORD)result)
        {
          if (*(_DWORD *)(a1 + 40) < 3u)
          {
            uint64_t v9 = i;
            uint64_t v8 = 0LL;
          }

          else
          {
            uint64_t v8 = *(char **)(v6 + 16);
            uint64_t v9 = i;
          }

          uint64_t result = sub_1000027F8(v9, v8, 1);
        }

        if (v4) {
          return result;
        }
      }

      else if (v4 || (uint64_t result = strcmp(*(const char **)i, "com.apple.asl"), (_DWORD)result))
      {
        else {
          unsigned int v10 = *(_DWORD *)(i + 8) & 0xFFFFFFFE;
        }
        *(_DWORD *)(i + 8) = v10;
        if (v4) {
          return result;
        }
      }
    }
  }

  return result;
}

uint64_t sub_1000027F8(uint64_t a1, char *__s2, int a3)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3) {
    return 0LL;
  }
  uint64_t v6 = 0LL;
  do
  {
    if ((*(_DWORD *)(v3 + 8) | 2) == 0xE)
    {
      uint64_t v7 = *(void *)(v3 + 24);
      if ((*(_BYTE *)(v7 + 72) & 4) != 0
        && (!__s2
         || (uint64_t v8 = *(const char **)(v7 + 8)) != 0LL
         && (!strcmp(*(const char **)(v7 + 8), __s2) || (uint64_t v9 = strrchr(v8, 47)) != 0LL && !strcmp(v9 + 1, __s2)))
        && (int)sub_100003DD0(v3, a3) >= 1)
      {
        sub_1000039A4(v3, 0LL);
        uint64_t v6 = 1LL;
      }
    }

    uint64_t v3 = *(void *)(v3 + 40);
  }

  while (v3);
  return v6;
}

void sub_1000028C4(uint64_t a1, uint64_t a2, char a3)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_100002924;
  block[3] = &unk_100018930;
  char v4 = a3;
  block[4] = a1;
  block[5] = a2;
  dispatch_sync((dispatch_queue_t)qword_10001C040, block);
}

uint64_t sub_100002924(uint64_t result)
{
  uint64_t v1 = qword_10001E418;
  if (qword_10001E418)
  {
    uint64_t v2 = result;
    do
    {
      if (*(_BYTE *)(v2 + 48)
        || (uint64_t result = asl_msg_lookup(*(void *)(v2 + 32), *(void *)v1, 0LL, 0LL), !(_DWORD)result))
      {
        if ((*(_DWORD *)(v1 + 8) & 1) != 0) {
          uint64_t v3 = "enabled";
        }
        else {
          uint64_t v3 = "disabled";
        }
        if (*(void *)v1) {
          char v4 = *(const char **)v1;
        }
        else {
          char v4 = "asl.conf";
        }
        uint64_t result = asl_msg_set_key_val(*(void *)(v2 + 40), v4, v3);
      }

      uint64_t v1 = *(void *)(v1 + 24);
    }

    while (v1);
  }

  return result;
}

void sub_1000029C4(uint64_t a1, unsigned __int8 *a2, int a3)
{
  uint64_t v6 = (const char **)explode(a2, " \t");
  if (v6)
  {
    uint64_t v7 = v6;
    unsigned int v8 = -1;
    do
      ++v8;
    while (v6[v8]);
    if (v8)
    {
      uint64_t v9 = *v6;
      if (!strcasecmp(*v6, "enable"))
      {
        if (v8 >= 2) {
          int v10 = atoi(v7[1]);
        }
        else {
          int v10 = 1;
        }
        BOOL v12 = v10 == 0;
        if (a3) {
          BOOL v12 = v10 != 0;
        }
      }

      else
      {
        if (strcasecmp(v9, "disable"))
        {
          free_string_list((void **)v7);
          return;
        }

        if (v8 >= 2) {
          int v11 = atoi(v7[1]);
        }
        else {
          int v11 = 1;
        }
        BOOL v13 = v11 == 0;
        if (a3) {
          BOOL v13 = v11;
        }
        BOOL v12 = !v13;
      }

      *(_DWORD *)(a1 + 8) = *(_DWORD *)(a1 + 8) & 0xFFFFFFFE | v12;
    }

    free_string_list((void **)v7);
  }

void sub_100002B10()
{
  if (qword_10001C068)
  {
    if (time(0LL) - qword_10001C068 >= 61)
    {
      sub_1000064BC("CrashMover timeout: resuming crashlog queue\n", v0, v1, v2, v3, v4, v5, v6, v7);
      dispatch_resume((dispatch_object_t)qword_10001C060);
      qword_10001C068 = 0LL;
    }
  }

void sub_100002B68(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_100002BD0;
  block[3] = &unk_100018950;
  __int128 v2 = *(_OWORD *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  dispatch_async((dispatch_queue_t)qword_10001C040, block);
}

uint64_t sub_100002BD0(uint64_t a1)
{
  return asl_msg_release(*(void *)(a1 + 48));
}

void sub_100002BFC(const char **a1, uint64_t a2, uint64_t a3)
{
  if (*(_DWORD *)(a2 + 8) != 13)
  {
    uint64_t v19 = *(void *)(a2 + 24);
    if (!v19) {
      return;
    }
    uint64_t v20 = *(void *)(v19 + 192);
    if (!v20) {
      return;
    }
    int v21 = *(_DWORD *)(v20 + 28);
    if (v21) {
      *(_DWORD *)(v20 + 28) = v21 - 1;
    }
    if (*(void *)(v20 + 8))
    {
      ++*(void *)v20;
      goto LABEL_19;
    }

    if (sub_1000030C4(a2, 0LL))
    {
      uint64_t v23 = 8LL;
      goto LABEL_35;
    }

    uint64_t set_position = asl_file_read_set_position(*(void *)(v20 + 8), 3LL);
    if ((_DWORD)set_position)
    {
      uint64_t v23 = set_position;
      asl_core_error(set_position);
      sub_1000064BC( "_act_store_file_setup: asl_file_read_set_position failed %d %s\n",  v30,  v31,  v32,  v33,  v34,  v35,  v36,  v23);
    }

    else
    {
      uint64_t v47 = *(void *)(v20 + 8);
      *(void *)uint64_t v20 = *(void *)(v47 + 80) + 1LL;
      if (!fseek(*(FILE **)(v47 + 104), 0LL, 2))
      {
LABEL_19:
        *(void *)(v20 + 16) = time(0LL);
        *(_DWORD *)(*(void *)(a2 + 24) + 76LL) = 0;
        uint64_t v22 = *(void *)(v20 + 8);
        uint64_t __ptr = *(void *)v20;
        uint64_t v23 = asl_file_save(v22, a3, &__ptr);
        if (!(_DWORD)v23)
        {
          *(void *)(*(void *)(a2 + 24) + 184LL) = *(void *)(*(void *)(v20 + 8) + 96LL);
          uint64_t v24 = sub_100003DD0(a2, 0);
          if ((_DWORD)v24 == 1) {
            asl_trigger_aslmanager(v24);
          }
          return;
        }

LABEL_35:
        uint64_t v25 = "_act_store_file";
        v26 = a1;
        uint64_t v27 = a2;
        uint64_t v28 = v23;
        goto LABEL_36;
      }

      int v48 = *__error();
      v49 = __error();
      strerror(*v49);
      sub_1000064BC("_act_store_file_setup: fseek failed %d %s\n", v50, v51, v52, v53, v54, v55, v56, v48);
      uint64_t v23 = 8LL;
    }

    sub_1000039A4(a2, 2LL);
    goto LABEL_35;
  }

  uint64_t v6 = *(void *)(a2 + 24);
  if (v6)
  {
    uint64_t v7 = *(void *)(v6 + 192);
    if (v7)
    {
      int v8 = *(_DWORD *)(v7 + 36);
      if (v8) {
        *(_DWORD *)(v7 + 36) = v8 - 1;
      }
      if (asl_msg_get_val_for_key(a3, "Time"))
      {
        uint64_t v9 = *(void *)(a2 + 24);
        if (v9 && (uint64_t v10 = *(void *)(v9 + 192)) != 0 && *(void *)(v9 + 8))
        {
          if (sub_1000030C4(a2, *(void *)(v10 + 16)))
          {
            sub_1000064BC( "_act_store_dir_setup: _act_dst_open %s failed\n",  v11,  v12,  v13,  v14,  v15,  v16,  v17,  *(void *)(*(void *)(a2 + 24) + 8LL));
          }

          else
          {
            uint64_t __ptr = 0LL;
            rewind(*(FILE **)v10);
            if (fread(&__ptr, 8uLL, 1uLL, *(FILE **)v10) != 1)
            {
              int v57 = *__error();
              v58 = __error();
              strerror(*v58);
              sub_1000064BC( "_act_store_dir_setup: storedata read failed %d %s\n",  v59,  v60,  v61,  v62,  v63,  v64,  v65,  v57);
              sub_1000039A4(a2, 2LL);
              uint64_t v18 = 7LL;
              goto LABEL_23;
            }

            uint64_t v37 = asl_core_ntohq(__ptr) + 1;
            *(void *)(v10 + 16) = v37;
            uint64_t __ptr = asl_core_htonq(v37);
            rewind(*(FILE **)v10);
            if (fwrite(&__ptr, 8uLL, 1uLL, *(FILE **)v10) == 1)
            {
              fflush(*(FILE **)v10);
              if (fseek(*(FILE **)(*(void *)(v10 + 8) + 104LL), 0LL, 2))
              {
                int v38 = *__error();
                v39 = __error();
                strerror(*v39);
                sub_1000064BC( "_act_store_dir_setup: aslfile fseek failed %d %s\n",  v40,  v41,  v42,  v43,  v44,  v45,  v46,  v38);
                sub_1000039A4(a2, 2LL);
                uint64_t v18 = 9999LL;
              }

              else
              {
                *(void *)(v7 + 24) = time(0LL);
                *(_DWORD *)(*(void *)(a2 + 24) + 76LL) = 0;
                uint64_t v75 = *(void *)(v7 + 8);
                uint64_t __ptr = *(void *)(v7 + 16);
                uint64_t v76 = asl_file_save(v75, a3, &__ptr);
                if (!(_DWORD)v76)
                {
                  *(void *)(*(void *)(a2 + 24) + 184LL) = *(void *)(*(void *)(v7 + 8) + 96LL);
                  return;
                }

                uint64_t v18 = v76;
                char v77 = asl_core_error(v76);
                sub_1000064BC("_act_store_dir asl_file_save FAILED %s\n", v78, v79, v80, v81, v82, v83, v84, v77);
              }

              goto LABEL_23;
            }

            int v66 = *__error();
            v67 = __error();
            strerror(*v67);
            sub_1000064BC( "_act_store_dir_setup: storedata write failed %d %s\n",  v68,  v69,  v70,  v71,  v72,  v73,  v74,  v66);
            sub_1000039A4(a2, 2LL);
          }

          uint64_t v18 = 8LL;
        }

        else
        {
          uint64_t v18 = 2LL;
        }

      asl_string_release(v10);
      free_string_list(v9);
      return 0LL;
    }
  }

  else if ((v22.st_mode & 0xF000) == 0x4000)
  {
    return 0LL;
  }

  else
  {
    return 0xFFFFFFFFLL;
  }

  return result;
}

void sub_100002FA4(char a1, const char **a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(a3 + 24);
  if ((*(_BYTE *)(v4 + 73) & 8) == 0)
  {
    ++*(_DWORD *)(v4 + 76);
    asl_core_error(a4);
    sub_1000064BC("%s: %s save to %s failed: %s\n", v9, v10, v11, v12, v13, v14, v15, a1);
    uint64_t v16 = *(void *)(a3 + 24);
    unsigned int v17 = *(_DWORD *)(v16 + 76);
    if (v17 >= 6)
    {
      uint64_t v24 = 0LL;
      uint64_t v18 = *a2;
      uint64_t v19 = *(const char **)(v16 + 8);
      int v20 = dword_10001E37C;
      int v21 = (const char *)asl_core_error(a4);
      asprintf( &v24,  "[Sender syslogd] [Level 3] [PID %u] [Facility syslog] [Message Disabling module %s writes to %s following %u failures (%s)]",  v20,  v18,  v19,  v17,  v21);
      sub_100007114(v24);
      free(v24);
      int v22 = *(_DWORD *)(a3 + 8);
      switch(v22)
      {
        case 12:
          goto LABEL_6;
        case 14:
          sub_10000411C(*(void *)(*(void *)(a3 + 24) + 192LL));
          break;
        case 13:
LABEL_6:
          uint64_t v23 = *(void **)(*(void *)(a3 + 24) + 192LL);
          if (v23) {
            free(v23);
          }
          break;
      }

      *(void *)(*(void *)(a3 + 24) + 192LL) = 0LL;
      *(_DWORD *)(a3 + 8) = 0;
    }
  }

uint64_t sub_1000030C4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  if (!v3) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v4 = *(unsigned int **)(v3 + 192);
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  int v5 = *(_DWORD *)(a1 + 8);
  if (v5 == 12)
  {
    if (*((void *)v4 + 1)) {
      return 0LL;
    }
    int v31 = asl_out_mkpath(qword_10001E418, a1);
    uint64_t v32 = *(void *)(a1 + 24);
    if (v31)
    {
      sub_1000064BC( "_asl_file_open: asl_out_mkpath %s failed\n",  v24,  v25,  v26,  v27,  v28,  v29,  v30,  *(void *)(v32 + 8));
      return 0xFFFFFFFFLL;
    }

    int open = asl_out_dst_file_create_open(v32, 0LL);
    if (open < 0)
    {
      uint64_t v79 = *(void *)(*(void *)(a1 + 24) + 16LL);
      __error();
      uint64_t v80 = __error();
      strerror(*v80);
      sub_1000064BC("_asl_file_open: _act_file_create_open %s failed %d %s\n", v81, v82, v83, v84, v85, v86, v87, v79);
      return 0xFFFFFFFFLL;
    }

    close(open);
    uint64_t v40 = *(void *)(*(void *)(a1 + 24) + 16LL);
    if (v40)
    {
      if (asl_file_open_write(v40, 0LL, 0xFFFFFFFFLL, 0xFFFFFFFFLL, v4 + 2))
      {
        uint64_t v41 = *(void *)(*(void *)(a1 + 24) + 16LL);
        __error();
        uint64_t v42 = __error();
        strerror(*v42);
        sub_1000064BC("_asl_file_open: asl_file_open_write %s failed %d %s\n", v43, v44, v45, v46, v47, v48, v49, v41);
        return 0xFFFFFFFFLL;
      }

      int v97 = fileno(*(FILE **)(*((void *)v4 + 1) + 104LL));
      uint64_t v98 = *((void *)v4 + 1);
      v99 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_vnode,  v97,  1uLL,  (dispatch_queue_t)qword_10001C040);
      *((void *)v4 + 4) = v99;
      if (v99)
      {
        *(void *)&v198.st_dev = _NSConcreteStackBlock;
        v198.st_ino = 0x40000000LL;
        *(void *)&v198.st_uid = sub_100004058;
        *(void *)&v198.st_rdev = &unk_100018A10;
        v198.st_atimespec.tv_sec = a1;
        dispatch_source_set_event_handler(v99, &v198);
        v107 = (dispatch_source_s *)*((void *)v4 + 4);
        *(void *)&handler[0].tm_sec = _NSConcreteStackBlock;
        *(void *)&handler[0].tm_hour = 0x40000000LL;
        *(void *)&handler[0].tm_mon = sub_100004064;
        *(void *)&handler[0].tm_wday = &unk_100018A30;
        LODWORD(handler[0].tm_gmtoff) = v97;
        *(void *)&handler[0].tm_isdst = v98;
        dispatch_source_set_cancel_handler(v107, handler);
        dispatch_resume(*((dispatch_object_t *)v4 + 4));
      }

      sub_1000064BC( "_asl_file_open ASL file %s fd %d\n",  v100,  v101,  v102,  v103,  v104,  v105,  v106,  *(void *)(*(void *)(a1 + 24) + 16LL));
      return 0LL;
    }

    return 0xFFFFFFFFLL;
  }

  if (v5 != 14)
  {
    if (v5 == 13)
    {
      int v7 = sub_100003CF0(a1);
      uint64_t v15 = *(void *)(a1 + 24);
      if (v7)
      {
        sub_1000064BC( "_asl_dir_today_open: No directory at path %s\n",  v8,  v9,  v10,  v11,  v12,  v13,  v14,  *(void *)(v15 + 8));
LABEL_8:
        sub_1000064BC( "_act_dst_open:_asl_dir_today_open %s FAILED!\n",  v16,  v17,  v18,  v19,  v20,  v21,  v22,  *(void *)(*(void *)(a1 + 24) + 8LL));
        return 0xFFFFFFFFLL;
      }

      uint64_t v36 = *(void *)(v15 + 192);
      memset(handler, 0, 56);
      time_t __ptr = time(0LL);
      if (!localtime_r(&__ptr, handler))
      {
        uint64_t v50 = __error();
        char v188 = strerror(*v50);
        sub_1000064BC("_asl_dir_today_open: localtime_r error %s\n", v51, v52, v53, v54, v55, v56, v57, v188);
        goto LABEL_8;
      }

      uint64_t v37 = sub_100003DD0(a1, 0);
      if ((_DWORD)v37 == 1) {
        asl_trigger_aslmanager(v37);
      }
      if (*(void *)(v36 + 8))
      {
        if (__PAIR64__(*(_DWORD *)(v36 + 40), *(_DWORD *)(v36 + 44)) == *(void *)&handler[0].tm_mon
          && *(_DWORD *)(v36 + 48) == handler[0].tm_mday)
        {
          goto LABEL_51;
        }

        sub_100003C18(a1);
      }

      uint64_t v38 = *(void *)(a1 + 24);
      if ((*(_BYTE *)(v38 + 73) & 1) != 0)
      {
        asl_make_timestamp(__ptr, *(_DWORD *)(v38 + 64), __str, 0x20uLL);
        asprintf((char **)(*(void *)(a1 + 24) + 16LL), "%s/%s.asl");
      }

      else
      {
        asprintf((char **)(v38 + 16), "%s/%d.%02d.%02d.asl");
      }

      uint64_t v58 = *(void *)(a1 + 24);
      if (!*(void *)(v58 + 16))
      {
        uint64_t v71 = __error();
        char v189 = strerror(*v71);
        sub_1000064BC("_asl_dir_today_open: asprintf error %s\n", v72, v73, v74, v75, v76, v77, v78, v189);
        goto LABEL_8;
      }

      uint64_t v59 = **(unsigned int **)(v58 + 120);
      uint64_t v60 = **(unsigned int **)(v58 + 136);
      mode_t v61 = umask(0);
      uint64_t v62 = asl_file_open_write( *(void *)(*(void *)(a1 + 24) + 16LL),  *(_WORD *)(*(void *)(a1 + 24) + 116LL) & 0x1B6,  v59,  v60,  v36 + 8);
      umask(v61);
      if ((_DWORD)v62)
      {
        uint64_t v63 = *(void *)(*(void *)(a1 + 24) + 16LL);
        asl_core_error(v62);
        sub_1000064BC("_asl_dir_today_open: asl_file_open_write %s error %s\n", v64, v65, v66, v67, v68, v69, v70, v63);
LABEL_44:
        free(*(void **)(*(void *)(a1 + 24) + 16LL));
        *(void *)(*(void *)(a1 + 24) + 16LL) = 0LL;
        goto LABEL_8;
      }

      if (fseek(*(FILE **)(*(void *)(v36 + 8) + 104LL), 0LL, 2))
      {
        uint64_t v88 = *(void *)(*(void *)(a1 + 24) + 16LL);
        v89 = __error();
        strerror(*v89);
        sub_1000064BC("_asl_dir_today_open: fseek %s error %s\n", v90, v91, v92, v93, v94, v95, v96, v88);
        goto LABEL_44;
      }

      *(int32x2_t *)(v36 + 40) = vrev64_s32(*(int32x2_t *)&handler[0].tm_mon);
      *(_DWORD *)(v36 + 48) = handler[0].tm_mday;
      int v108 = fileno(*(FILE **)(*(void *)(v36 + 8) + 104LL));
      __darwin_time_t v109 = *(void *)(v36 + 8);
      v110 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_vnode,  v108,  1uLL,  (dispatch_queue_t)qword_10001C040);
      *(void *)(v36 + 64) = v110;
      if (v110)
      {
        v191 = _NSConcreteStackBlock;
        uint64_t v192 = 0x40000000LL;
        v193 = sub_100003FC8;
        v194 = &unk_100018990;
        uint64_t v195 = a1;
        dispatch_source_set_event_handler(v110, &v191);
        v118 = *(dispatch_source_s **)(v36 + 64);
        *(void *)&v198.st_dev = _NSConcreteStackBlock;
        v198.st_ino = 0x40000000LL;
        *(void *)&v198.st_uid = sub_100003FD4;
        *(void *)&v198.st_rdev = &unk_1000189B0;
        LODWORD(v198.st_atimespec.tv_nsec) = v108;
        v198.st_atimespec.tv_sec = v109;
        dispatch_source_set_cancel_handler(v118, &v198);
        dispatch_resume(*(dispatch_object_t *)(v36 + 64));
      }

      sub_1000064BC( "_asl_dir_today_open ASL file %s fd %d\n",  v111,  v112,  v113,  v114,  v115,  v116,  v117,  *(void *)(*(void *)(a1 + 24) + 16LL));
LABEL_51:
      uint64_t v119 = *(void *)(*(void *)(a1 + 24) + 192LL);
      if (!*(void *)v119)
      {
        if (sub_100003CF0(a1))
        {
          sub_1000064BC( "_asl_dir_storedata_open: No directory at path %s\n",  v120,  v121,  v122,  v123,  v124,  v125,  v126,  *(void *)(*(void *)(a1 + 24) + 8LL));
LABEL_54:
          sub_1000064BC( "_act_dst_open:_asl_dir_storedata_open %s FAILED!  Closing today file\n",  v127,  v128,  v129,  v130,  v131,  v132,  v133,  *(void *)(*(void *)(a1 + 24) + 8LL));
          sub_100003C18(a1);
          return 0xFFFFFFFFLL;
        }

        snprintf((char *)handler, 0x400uLL, "%s/%s", *(const char **)(*(void *)(a1 + 24) + 8LL), "StoreData");
        memset(&v198, 0, sizeof(v198));
        if (stat((const char *)handler, &v198))
        {
          if (*__error() != 2)
          {
            v155 = __error();
            char v190 = strerror(*v155);
            sub_1000064BC("_asl_dir_storedata_open: stat error %s\n", v156, v157, v158, v159, v160, v161, v162, v190);
            goto LABEL_54;
          }

          v134 = fopen((const char *)handler, "w+");
          *(void *)uint64_t v119 = v134;
          if (!v134)
          {
            v171 = __error();
            strerror(*v171);
            sub_1000064BC( "_asl_dir_storedata_open: fopen new %s: %s\n",  v172,  v173,  v174,  v175,  v176,  v177,  v178,  (char)handler);
            goto LABEL_54;
          }

          time_t __ptr = asl_core_htonq(a2);
          if (fwrite(&__ptr, 8uLL, 1uLL, *(FILE **)v119) != 1)
          {
            int v179 = *__error();
            v180 = __error();
            strerror(*v180);
            sub_1000064BC( "_asl_dir_storedata_open: storedata write failed %d %s\n",  v181,  v182,  v183,  v184,  v185,  v186,  v187,  v179);
            goto LABEL_54;
          }

          if (chown( (const char *)handler,  **(_DWORD **)(*(void *)(a1 + 24) + 120LL),  **(_DWORD **)(*(void *)(a1 + 24) + 136LL)))
          {
            v135 = __error();
            strerror(*v135);
            sub_1000064BC( "_asl_dir_storedata_open: chown %d %d new %s: %s\n",  v136,  v137,  v138,  v139,  v140,  v141,  v142,  (char)handler);
            goto LABEL_54;
          }

          v143 = *(FILE **)v119;
        }

        else
        {
          v143 = fopen((const char *)handler, "r+");
          *(void *)uint64_t v119 = v143;
          if (!v143)
          {
            v163 = __error();
            strerror(*v163);
            sub_1000064BC( "_asl_dir_storedata_open: fopen existing %s: %s\n",  v164,  v165,  v166,  v167,  v168,  v169,  v170,  (char)handler);
            goto LABEL_54;
          }
        }

        int v144 = fileno(v143);
        v145 = *(FILE **)v119;
        v146 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_vnode,  v144,  1uLL,  (dispatch_queue_t)qword_10001C040);
        *(void *)(v119 + 56) = v146;
        if (v146)
        {
          *(void *)__str = _NSConcreteStackBlock;
          uint64_t v200 = 0x40000000LL;
          v201 = sub_100004010;
          v202 = &unk_1000189D0;
          uint64_t v203 = a1;
          dispatch_source_set_event_handler(v146, __str);
          v154 = *(dispatch_source_s **)(v119 + 56);
          v191 = _NSConcreteStackBlock;
          uint64_t v192 = 0x40000000LL;
          v193 = sub_10000401C;
          v194 = &unk_1000189F0;
          int v196 = v144;
          uint64_t v195 = (uint64_t)v145;
          dispatch_source_set_cancel_handler(v154, &v191);
          dispatch_resume(*(dispatch_object_t *)(v119 + 56));
        }

        sub_1000064BC( "_asl_dir_storedata_open ASL storedata %s fd %d\n",  v147,  v148,  v149,  v150,  v151,  v152,  v153,  (char)handler);
      }

      return 0LL;
    }

    return 0xFFFFFFFFLL;
  }

  if ((*v4 & 0x80000000) == 0) {
    return 0LL;
  }
  unsigned int v33 = asl_out_dst_file_create_open(v3, 0LL);
  *uint64_t v4 = v33;
  if ((v33 & 0x80000000) != 0)
  {
    unsigned int v33 = asl_out_dst_file_create_open(*(void *)(a1 + 24), 0LL);
    *uint64_t v4 = v33;
    if ((v33 & 0x80000000) != 0) {
      return 0xFFFFFFFFLL;
    }
  }

  uint64_t result = (uint64_t)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_vnode,  v33,  1uLL,  (dispatch_queue_t)qword_10001C040);
  *((void *)v4 + 6) = result;
  if (result)
  {
    unsigned int v34 = *v4;
    *(void *)&handler[0].tm_sec = _NSConcreteStackBlock;
    *(void *)&handler[0].tm_hour = 0x40000000LL;
    *(void *)&handler[0].tm_mon = sub_1000040A0;
    *(void *)&handler[0].tm_wday = &unk_100018A50;
    LODWORD(handler[0].tm_gmtoff) = v34;
    *(void *)&handler[0].tm_isdst = a1;
    dispatch_source_set_event_handler((dispatch_source_t)result, handler);
    uint64_t v35 = (dispatch_source_s *)*((void *)v4 + 6);
    *(void *)&v198.st_dev = _NSConcreteStackBlock;
    v198.st_ino = 0x40000000LL;
    *(void *)&v198.st_uid = sub_1000040E0;
    *(void *)&v198.st_rdev = &unk_100018A70;
    LODWORD(v198.st_atimespec.tv_sec) = v34;
    dispatch_source_set_cancel_handler(v35, &v198);
    dispatch_resume(*((dispatch_object_t *)v4 + 6));
    return 0LL;
  }

  return result;
}

void sub_1000039A4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    uint64_t v9 = *(void *)(a1 + 24);
    if (v9)
    {
      if (*(void *)(v9 + 192))
      {
        int v10 = a2;
        int v11 = *(_DWORD *)(a1 + 8);
        switch(v11)
        {
          case 12:
            sub_1000064BC( "_act_dst_close: %s ASL FILE %s\n",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  (char)off_100018A90[a2]);
            uint64_t v20 = *(void *)(a1 + 24);
            if (v20)
            {
              uint64_t v21 = *(void *)(v20 + 192);
              if (*(void *)(v21 + 8))
              {
                int v22 = *(_DWORD *)(v21 + 28);
                if (v22)
                {
                  uint64_t v51 = 0LL;
                  asprintf( &v51,  "[Sender syslogd] [Level 4] [PID %u] [Facility syslog] [Message ASL File %s was closed with %d pending messages]",  dword_10001E37C,  *(const char **)(v20 + 16),  v22);
                  sub_100007114((uint64_t)v51);
                  free(v51);
                }

                uint64_t v23 = *(dispatch_source_s **)(v21 + 32);
                if (v23)
                {
                  dispatch_source_cancel(v23);
                  dispatch_release(*(dispatch_object_t *)(v21 + 32));
                  *(void *)(v21 + 32) = 0LL;
                }

                else
                {
                  char v43 = fileno(*(FILE **)(*(void *)(v21 + 8) + 104LL));
                  sub_1000064BC("close ASL fd %d\n", v44, v45, v46, v47, v48, v49, v50, v43);
                  asl_file_close(*(void *)(v21 + 8));
                }

                *(void *)(v21 + 8) = 0LL;
              }
            }

            break;
          case 14:
            sub_1000064BC( "_act_dst_close: %s FILE %s\n",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  (char)off_100018A90[a2]);
            uint64_t v31 = *(void *)(a1 + 24);
            uint64_t v32 = *(void *)(v31 + 192);
            if ((*(_DWORD *)v32 & 0x80000000) == 0)
            {
              int v33 = *(_DWORD *)(v32 + 24);
              if (v33)
              {
                uint64_t v51 = 0LL;
                asprintf( &v51,  "[Sender syslogd] [Level 4] [PID %u] [Facility syslog] [Message File %s was closed with %d pending messages]",  dword_10001E37C,  *(const char **)(v31 + 16),  v33);
                sub_100007114((uint64_t)v51);
                free(v51);
              }

              unsigned int v34 = *(dispatch_source_s **)(v32 + 48);
              if (v34)
              {
                dispatch_source_cancel(v34);
                dispatch_release(*(dispatch_object_t *)(v32 + 48));
                *(void *)(v32 + 48) = 0LL;
              }

              else
              {
                sub_1000064BC("close fd %d\n", v24, v25, v26, v27, v28, v29, v30, *(_DWORD *)v32);
                close(*(_DWORD *)v32);
              }

              *(_DWORD *)uint64_t v32 = -1;
            }

            break;
          case 13:
            sub_1000064BC( "_act_dst_close: %s ASL DIR %s\n",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  (char)off_100018A90[a2]);
            if (v10)
            {
              uint64_t v12 = *(void *)(*(void *)(a1 + 24) + 192LL);
              if (*(void *)v12)
              {
                if (*(void *)(v12 + 56))
                {
                  dispatch_source_cancel(*(dispatch_source_t *)(v12 + 56));
                  dispatch_release(*(dispatch_object_t *)(v12 + 56));
                }

                else
                {
                  char v35 = fileno(*(FILE **)v12);
                  sub_1000064BC("close ASL storedata fd %d\n", v36, v37, v38, v39, v40, v41, v42, v35);
                  fclose(*(FILE **)v12);
                }

                sub_1000064BC("_asl_dir_storedata_close %p\n", v13, v14, v15, v16, v17, v18, v19, *(void *)v12);
                *(void *)uint64_t v12 = 0LL;
              }
            }

            sub_100003C18(a1);
            break;
        }
      }
    }
  }

void sub_100003C18(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 24);
  uint64_t v2 = *(void *)(v1 + 192);
  if (*(void *)(v2 + 8))
  {
    int v4 = *(_DWORD *)(v2 + 36);
    if (v4)
    {
      uint64_t v14 = 0LL;
      asprintf( &v14,  "[Sender syslogd] [Level 4] [PID %u] [Facility syslog] [Message ASL Store %s was closed with %d pending messages]",  dword_10001E37C,  *(const char **)(v1 + 16),  v4);
      sub_100007114((uint64_t)v14);
      free(v14);
    }

    int v5 = *(dispatch_source_s **)(v2 + 64);
    if (v5)
    {
      dispatch_source_cancel(v5);
      dispatch_release(*(dispatch_object_t *)(v2 + 64));
      *(void *)(v2 + 64) = 0LL;
    }

    else
    {
      char v6 = fileno(*(FILE **)(*(void *)(v2 + 8) + 104LL));
      sub_1000064BC("close ASL fd %d\n", v7, v8, v9, v10, v11, v12, v13, v6);
      asl_file_close(*(void *)(v2 + 8));
    }

    *(void *)(v2 + 40) = 0LL;
    *(_DWORD *)(v2 + 48) = 0;
    free(*(void **)(*(void *)(a1 + 24) + 16LL));
    *(void *)(*(void *)(a1 + 24) + 16LL) = 0LL;
    *(void *)(v2 + 8) = 0LL;
  }

uint64_t sub_100003CF0(uint64_t a1)
{
  if (stat(*(const char **)(*(void *)(a1 + 24) + 8LL), &v26))
  {
    if (*__error() == 2)
    {
      uint64_t result = asl_out_mkpath(qword_10001E418, a1);
      if (!(_DWORD)result) {
        return result;
      }
      sub_1000064BC( "_asl_dir_create: asl_out_mkpath failed: %s\n",  v10,  v11,  v12,  v13,  v14,  v15,  v16,  *(void *)(*(void *)(a1 + 24) + 8LL));
    }

    else
    {
      uint64_t v17 = __error();
      char v25 = strerror(*v17);
      sub_1000064BC("_asl_dir_create: stat error %s\n", v18, v19, v20, v21, v22, v23, v24, v25);
    }
  }

  else
  {
    if ((v26.st_mode & 0xF000) == 0x4000) {
      return 0LL;
    }
    sub_1000064BC( "_asl_dir_create: expected a directory at path %s\n",  v2,  v3,  v4,  v5,  v6,  v7,  v8,  *(void *)(*(void *)(a1 + 24) + 8LL));
  }

  return 0xFFFFFFFFLL;
}

uint64_t sub_100003DD0(uint64_t a1, int a2)
{
  uint64_t result = *(void *)(a1 + 24);
  if (!result) {
    return result;
  }
  uint64_t v5 = *(const char **)(result + 16);
  if (v5)
  {
    if (!a2) {
      goto LABEL_9;
    }
  }

  else
  {
    if (!*(void *)(result + 8)) {
      return 0LL;
    }
    uint64_t v5 = v21;
    asl_dst_make_current_name(result, 0, v21, 0x400uLL);
    uint64_t result = *(void *)(a1 + 24);
    if (!a2) {
      goto LABEL_9;
    }
  }

  if ((*(_BYTE *)(result + 73) & 0x80) == 0)
  {
    int v6 = 0;
    goto LABEL_11;
  }

LABEL_9:
  if (!*(void *)(result + 152)) {
    return 0LL;
  }
  int v6 = 1;
LABEL_11:
  unint64_t st_size = *(void *)(result + 184);
  if (st_size && *(void *)(result + 176))
  {
    if (!v6) {
      goto LABEL_22;
    }
  }

  else
  {
    memset(&v20, 0, sizeof(v20));
    if (stat(v5, &v20) < 0)
    {
      if (*__error() == 2) {
        return 0LL;
      }
      else {
        return 0xFFFFFFFFLL;
      }
    }

    uint64_t result = *(void *)(a1 + 24);
    if (!*(void *)(result + 176))
    {
      __darwin_time_t tv_sec = v20.st_birthtimespec.tv_sec;
      *(void *)(result + 176) = v20.st_birthtimespec.tv_sec;
      if (!tv_sec) {
        *(void *)(result + 176) = v20.st_mtimespec.tv_sec;
      }
    }

    unint64_t st_size = v20.st_size;
    *(void *)(result + 184) = v20.st_size;
    if (!v6) {
      goto LABEL_22;
    }
  }

  if (st_size < *(void *)(result + 152)) {
    return 0LL;
  }
LABEL_22:
  if ((*(_BYTE *)(result + 73) & 1) != 0)
  {
    sub_1000039A4(a1, 0LL);
  }

  else
  {
    snprintf((char *)&v20, 0x400uLL, "%s", v5);
    time_t v9 = time(0LL);
    uint64_t v10 = *(void *)(a1 + 24);
    *(void *)(v10 + 176) = v9;
    asl_dst_make_current_name(v10, 256, __s2, 0x400uLL);
    sub_1000039A4(a1, 0LL);
    if (strcmp((const char *)&v20, __s2))
    {
      rename((const char *)&v20, __s2);
      sub_1000064BC("CHECKPOINT RENAME %s %s\n", v11, v12, v13, v14, v15, v16, v17, (char)&v20);
    }
  }

  uint64_t v18 = *(void *)(a1 + 24);
  *(void *)(v18 + 176) = 0LL;
  *(void *)(v18 + 184) = 0LL;
  return 1LL;
}

          if (sub_1000030C4(a2, 0LL))
          {
            sub_100002FA4((char)"_act_file", a1, a2, 9999LL);
LABEL_11:
            free(v10);
            return;
          }

          *(_DWORD *)(*(void *)(a2 + 24) + 76LL) = 0;
          if (*(_DWORD *)(v5 + 16))
          {
            sub_1000044BC(a2);
            if (v10) {
              goto LABEL_27;
            }
          }

          else
          {
            free(*(void **)(v5 + 32));
            *(void *)(v5 + 32) = 0LL;
            if (v10)
            {
LABEL_27:
              *(void *)(v5 + 32) = strdup(v10 + 16);
              *(_DWORD *)(v5 + 16) = 0;
              *(_DWORD *)(v5 + 20) = v11;
              *(void *)(v5 + 8) = v9;
              if (v19 >= 2)
              {
                uint64_t v16 = write(*(_DWORD *)v5, v10, (v19 - 1));
                if (v16) {
                  *(void *)(*(void *)(a2 + 24) + 184LL) += v16;
                }
                uint64_t v17 = sub_100003DD0(a2, 0);
                if ((_DWORD)v17 == 1) {
                  asl_trigger_aslmanager(v17);
                }
              }

              goto LABEL_11;
            }
          }

          *(_DWORD *)(v5 + 16) = 0;
          *(_DWORD *)(v5 + 20) = v11;
          *(void *)(v5 + 8) = v9;
          goto LABEL_11;
        }
      }
    }
  }

uint64_t sub_100003FC8(uint64_t a1)
{
  return sub_1000039A4(*(void *)(a1 + 32), 1LL);
}

uint64_t sub_100003FD4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return asl_file_close(*(void *)(a1 + 32));
}

uint64_t sub_100004010(uint64_t a1)
{
  return sub_1000039A4(*(void *)(a1 + 32), 1LL);
}

uint64_t sub_10000401C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return fclose(*(FILE **)(a1 + 32));
}

uint64_t sub_100004058(uint64_t a1)
{
  return sub_1000039A4(*(void *)(a1 + 32), 1LL);
}

uint64_t sub_100004064( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return asl_file_close(*(void *)(a1 + 32));
}

uint64_t sub_1000040A0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_1000039A4(*(void *)(a1 + 32), 1LL);
}

uint64_t sub_1000040E0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return close(*(_DWORD *)(a1 + 32));
}

void sub_10000411C(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = *(dispatch_object_s **)(a1 + 40);
    if (v2)
    {
      if (!*(_DWORD *)(a1 + 16))
      {
        dispatch_resume(v2);
        uint64_t v2 = *(dispatch_object_s **)(a1 + 40);
      }

      dispatch_release(v2);
    }

    free(*(void **)(a1 + 32));
    free((void *)a1);
  }

void sub_100004168(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_1000041D0;
  block[3] = &unk_100018AB8;
  __int128 v2 = *(_OWORD *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  dispatch_async((dispatch_queue_t)qword_10001C040, block);
}

uint64_t sub_1000041D0(uint64_t a1)
{
  return asl_msg_release(*(void *)(a1 + 48));
}

void sub_1000041FC(const char **a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    uint64_t v4 = *(void *)(a2 + 24);
    if (v4)
    {
      uint64_t v5 = *(void *)(v4 + 192);
      if (v5)
      {
        int v8 = *(_DWORD *)(v5 + 24);
        if (v8) {
          *(_DWORD *)(v5 + 24) = v8 - 1;
        }
        if ((*(_BYTE *)(v4 + 73) & 0x40) == 0
          || (uint64_t v19 = 0LL, !asl_msg_lookup(a3, "Message", &v19, 0LL)) && v19)
        {
          time_t v9 = time(0LL);
          uint64_t v10 = (char *)asl_format_message( a3,  *(void *)(*(void *)(a2 + 24) + 24LL),  *(void *)(*(void *)(a2 + 24) + 56LL),  1LL,  &v19);
          if ((*(_BYTE *)(*(void *)(a2 + 24) + 72LL) & 8) == 0)
          {
LABEL_8:
            int v11 = 0;
            goto LABEL_9;
          }

          if (!*(void *)(v5 + 40))
          {
            uint64_t v12 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)qword_10001C040);
            *(void *)(v5 + 40) = v12;
            v18[0] = _NSConcreteStackBlock;
            v18[1] = 0x40000000LL;
            v18[2] = sub_1000044B4;
            v18[3] = &unk_100018AF8;
            v18[4] = a2;
            dispatch_source_set_event_handler(v12, v18);
          }

          int v11 = 0;
          if ((void)xmmword_10001E460 && v10)
          {
            if (!*(void *)(v5 + 32)) {
              goto LABEL_8;
            }
            int v11 = asl_core_string_hash(v10 + 16, (v19 - 16));
            if (*(_DWORD *)(v5 + 20) == v11
              && !strcmp(*(const char **)(v5 + 32), v10 + 16)
              && v9 - *(void *)(v5 + 8) < (unint64_t)xmmword_10001E460)
            {
              int v13 = *(_DWORD *)(v5 + 16);
              if (!v13)
              {
                uint64_t v14 = *(dispatch_source_s **)(v5 + 40);
                dispatch_time_t v15 = dispatch_time(0LL, 1000000000 * xmmword_10001E460);
                dispatch_source_set_timer(v14, v15, 0xFFFFFFFFFFFFFFFFLL, 0LL);
                dispatch_resume(*(dispatch_object_t *)(v5 + 40));
                int v13 = *(_DWORD *)(v5 + 16);
              }

              *(_DWORD *)(v5 + 16) = v13 + 1;
              goto LABEL_11;
            }
          }

void sub_1000044B4(uint64_t a1)
{
}

void sub_1000044BC(uint64_t a1)
{
  time_t v18 = time(0LL);
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 24);
    if (v2)
    {
      uint64_t v3 = *(void *)(v2 + 192);
      if (v3)
      {
        free(*(void **)(v3 + 32));
        *(void *)(v3 + 32) = 0LL;
        if (*(_DWORD *)(v3 + 16))
        {
          dispatch_suspend(*(dispatch_object_t *)(v3 + 40));
          *(_OWORD *)stat v20 = 0u;
          __int128 v21 = 0u;
          ctime_r(&v18, v20);
          BYTE3(v21) = 0;
          uint64_t v19 = 0LL;
          int v4 = *(_DWORD *)(v3 + 16);
          uint64_t v5 = "s";
          if (v4 == 1) {
            uint64_t v5 = (const char *)&unk_100015297;
          }
          asprintf(&v19, "%s --- last message repeated %u time%s ---\n", &v20[4], v4, v5);
          *(_DWORD *)(v3 + 16) = 0;
          int v6 = v19;
          *(void *)(v3 + 8) = v18;
          if (v6)
          {
            int open = *(_DWORD *)v3;
            if ((*(_DWORD *)v3 & 0x80000000) != 0)
            {
              int open = asl_out_dst_file_create_open(*(void *)(a1 + 24), 0LL);
              *(_DWORD *)uint64_t v3 = open;
              int v6 = v19;
            }

            int v8 = strlen(v6);
            int v9 = write(open, v6, v8);
            free(v19);
            if (v9 < 0 || v9 < v8)
            {
              uint64_t v10 = __error();
              strerror(*v10);
              sub_1000064BC( "%s: error writing repeat message (%s): %s\n",  v11,  v12,  v13,  v14,  v15,  v16,  v17,  (char)"asl_action");
            }
          }
        }
      }
    }
  }

void sub_100004640(int *a1)
{
  if (a1) {
    notify_cancel(*a1);
  }
  free(a1);
}

char *sub_10000466C(uint64_t a1, void *a2)
{
  uint64_t result = __s1;
  if (__s1)
  {
    xpc_object_t v5 = configuration_profile_to_asl_msg();
    BOOL v6 = asl_msg_cmp(*a2, v5) == 1;
    sub_1000029C4(a1, (unsigned __int8 *)a2[2], v6);
    asl_msg_release(v5);
    return strdup(__s1);
  }

  else
  {
    *((_DWORD *)a2 + 2) = 0;
  }

  return result;
}

void sub_1000046FC(id a1, int a2)
{
}

void sub_100004704(int a1)
{
  uint64_t v2 = qword_10001E418;
  if (!qword_10001E418)
  {
LABEL_13:
    asl_out_module_free(0LL);
    return;
  }

  while (1)
  {
    uint64_t v3 = *(void *)(v2 + 16);
    if (v3) {
      break;
    }
LABEL_12:
    uint64_t v2 = *(void *)(v2 + 24);
    if (!v2) {
      goto LABEL_13;
    }
  }

  while (1)
  {
    int v4 = *(_DWORD *)(v3 + 8);
    if (v4 == 19 || v4 == 18) {
      break;
    }
    if (v4 == 17)
    {
      xpc_object_t v5 = *(_DWORD **)(v3 + 32);
      if (v5)
      {
        if (*v5 == a1)
        {
          sub_1000047A8(v2, v3);
          return;
        }
      }
    }

LABEL_11:
    uint64_t v3 = *(void *)(v3 + 40);
    if (!v3) {
      goto LABEL_12;
    }
  }

  BOOL v6 = *(_DWORD **)(v3 + 32);
  if (!v6 || *v6 != a1) {
    goto LABEL_11;
  }
  uint64_t v7 = sub_10000466C(v2, (void *)v3);
  free(v7);
}

      free(v2);
      return 0LL;
    }
  }

  return v2;
}

void sub_1000047A0(id a1, int a2)
{
}

const char *sub_1000047A8(uint64_t a1, uint64_t a2)
{
  uint64_t result = v7;
  if (v7)
  {
    memset(&v6, 0, sizeof(v6));
    BOOL v5 = stat(v7, &v6) == 0;
    sub_1000029C4(a1, *(unsigned __int8 **)(a2 + 16), v5);
    return v7;
  }

  else
  {
    *(_DWORD *)(a2 + 8) = 0;
  }

  return result;
}

void sub_100004830(id a1, int a2)
{
}

void sub_100004838()
{
  time_t v2 = time(0LL);
  if (!qword_10001C070)
  {
    localtime_r(&v2, &v3);
    *(void *)&v3.tm_sec = 0LL;
    v3.tm_hour = 0;
    ++v3.tm_mday;
    time_t v2 = mktime(&v3);
    when.__darwin_time_t tv_sec = v2;
    when.tv_nsec = 0LL;
    uint64_t v0 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)qword_10001C040);
    qword_10001C070 = (uint64_t)v0;
    dispatch_time_t v1 = dispatch_walltime(&when, 0LL);
    dispatch_source_set_timer(v0, v1, 0x4E94914F0000uLL, 0LL);
    dispatch_source_set_event_handler((dispatch_source_t)qword_10001C070, &stru_100018C38);
    dispatch_resume((dispatch_object_t)qword_10001C070);
  }

void sub_1000048FC(id a1)
{
}

void sub_100004904(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    do
      unsigned int v4 = __ldxr((unsigned int *)&xmmword_10001E388 + 3);
    while (__stxr(v4 + 1, (unsigned int *)&xmmword_10001E388 + 3));
    asl_msg_retain(a1);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 0x40000000LL;
    v5[2] = sub_100004994;
    v5[3] = &unk_100018C58;
    v5[4] = a1;
    v5[5] = a2;
    dispatch_async((dispatch_queue_t)qword_10001C078, v5);
  }

uint64_t sub_100004994(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    time_t v123 = time(0LL);
    tm v3 = (unsigned int *)qword_10001C088;
    if (!qword_10001C088)
    {
      unsigned int v4 = 0LL;
      __s = 0LL;
      goto LABEL_118;
    }

    __s = 0LL;
    unsigned int v4 = 0LL;
    while (1)
    {
      unint64_t v5 = *v3;
      if (!(_DWORD)v5) {
        goto LABEL_90;
      }
      unint64_t v6 = 0LL;
      int v7 = 0;
      do
      {
        while (1)
        {
          int v8 = *(_DWORD *)(*((void *)v3 + 6) + 4 * v6);
          if (v8 == -1) {
            goto LABEL_20;
          }
          if (v7 != 1 || v8 < 0) {
            break;
          }
          ++v6;
          int v7 = 1;
          if (v6 >= v5) {
            goto LABEL_27;
          }
        }

        if (!v7 && v8 == -2)
        {
LABEL_19:
          int v7 = 0;
          goto LABEL_20;
        }

        uint64_t val_for_key = (const char *)asl_msg_get_val_for_key(v2, "Facility");
        uint64_t v10 = *(const char **)(*((void *)v3 + 4) + 8 * v6);
        if (!strcmp(v10, "*")
          || (size_t v11 = *(unsigned int *)(*((void *)v3 + 5) + 4 * v6), (_DWORD)v11) && !strncasecmp(v10, val_for_key, v11)
          || val_for_key && !strcasecmp(v10, val_for_key))
        {
          if (*(_DWORD *)(*((void *)v3 + 6) + 4 * v6) == -2) {
            goto LABEL_19;
          }
          uint64_t v12 = (const char *)asl_msg_get_val_for_key(v2, "Level");
          if (v12)
          {
            int v13 = atoi(v12);
            if ((v13 & 0x80000000) == 0 && v13 <= *(_DWORD *)(*((void *)v3 + 6) + 4 * v6)) {
              int v7 = 1;
            }
          }
        }

LABEL_20:
        ++v6;
        unint64_t v5 = *v3;
      }

      while (v6 < v5);
      if (!v7) {
        goto LABEL_90;
      }
LABEL_27:
      if (v3[4] == -1)
      {
        uint64_t v17 = (const char *)*((void *)v3 + 1);
        int v18 = *(unsigned __int8 *)v17;
        if (v18 == 33)
        {
          *((void *)v3 + 2) = 0x5FFFFFFFFLL;
          goto LABEL_28;
        }

        if (v18 != 64)
        {
          if (v18 != 47)
          {
            else {
              sub_1000064BC( "%s: unsupported / unknown output name: %s\n",  v40,  v41,  v42,  v43,  v44,  v45,  v46,  (char)"bsd_out");
            }
            goto LABEL_28;
          }

          int v19 = open(v17, 131593, 420LL);
          v3[4] = v19;
          if (v19 < 0)
          {
            uint64_t v70 = __error();
            strerror(*v70);
            sub_1000064BC("%s: open failed for file: %s (%s)\n", v71, v72, v73, v74, v75, v76, v77, (char)"bsd_out");
            goto LABEL_28;
          }

          v3[5] = 1;
          else {
            int v20 = 1;
          }
LABEL_44:
          v3[5] = v20;
          goto LABEL_28;
        }

        uint64_t v36 = strdup(v17 + 1);
        if (!v36) {
          goto LABEL_28;
        }
        uint64_t v37 = v36;
        uint64_t v38 = strrchr(v36, 58);
        if (v38)
        {
          *uint64_t v38 = 0;
          uint64_t v39 = v38 + 1;
        }

        else
        {
          uint64_t v39 = "syslog";
        }

        memset(&handler, 0, sizeof(handler));
        handler.ai_socktype = 2;
        int v89 = getaddrinfo(v37, v39, &handler, &v126);
        free(v37);
        if (v89)
        {
          gai_strerror(v89);
          sub_1000064BC( "%s: getaddrinfo failed for node %s service %s: (%s)\n",  v90,  v91,  v92,  v93,  v94,  v95,  v96,  (char)"bsd_out");
          goto LABEL_28;
        }

        int v97 = v126;
        if (v126)
        {
          while (1)
          {
            int v98 = socket(v97->ai_family, v97->ai_socktype, v97->ai_protocol);
            v3[4] = v98;
            if ((v98 & 0x80000000) == 0) {
              break;
            }
            int v97 = v97->ai_next;
            if (!v97) {
              goto LABEL_110;
            }
          }

          size_t ai_addrlen = v97->ai_addrlen;
          uint64_t v100 = malloc(ai_addrlen);
          *((void *)v3 + 3) = v100;
          if (!v100) {
            goto LABEL_28;
          }
          memcpy(v100, v97->ai_addr, ai_addrlen);
        }

LABEL_110:
        freeaddrinfo(v126);
        int v108 = v3[4];
        if (v108 < 0)
        {
          sub_1000064BC("%s: connection failed for %s\n", v101, v102, v103, v104, v105, v106, v107, (char)"bsd_out");
        }

        else
        {
          if ((fcntl(v108, 4, 4LL) & 0x80000000) == 0)
          {
            int v20 = 3;
            goto LABEL_44;
          }

          close(v3[4]);
          v3[4] = -1;
          __darwin_time_t v109 = __error();
          strerror(*v109);
          sub_1000064BC( "%s: couldn't set O_NONBLOCK for fd %d: %s\n",  v110,  v111,  v112,  v113,  v114,  v115,  v116,  (char)"bsd_out");
        }

        free(*((void **)v3 + 3));
        *((void *)v3 + 3) = 0LL;
      }

LABEL_28:
      if (v3[5] == 5)
      {
        notify_post((const char *)(*((void *)v3 + 1) + 1LL));
        goto LABEL_90;
      }

      if (v4 || (unsigned int v4 = (char *)asl_format_message(v2, "bsd", "lcl", 1LL, v125)) != 0LL)
      {
        if ((void)xmmword_10001E460 && *((void *)v3 + 10))
        {
          size_t v14 = strlen(v4 + 16);
          unsigned int v15 = asl_core_string_hash(v4 + 16, v14);
          if (v3[14] != v15 || strcmp(*((const char **)v3 + 10), v4 + 16))
          {
            BOOL v16 = 0;
            goto LABEL_46;
          }

          unint64_t v78 = v123 - *((void *)v3 + 8);
          BOOL v16 = v78 < (unint64_t)xmmword_10001E460;
          BOOL v21 = v78 >= (unint64_t)xmmword_10001E460;
        }

        else
        {
          BOOL v16 = 0;
          unsigned int v15 = 0;
LABEL_46:
          BOOL v21 = 1;
        }

        unsigned int v22 = v3[5];
        if (__s)
        {
LABEL_48:
          if (v22 == 3)
          {
            uint64_t v23 = (const sockaddr *)*((void *)v3 + 3);
            if (v23)
            {
              size_t v24 = strlen(__s);
              if ((sendto(v3[4], __s, v24, 0, v23, v23->sa_len) & 0x80000000) != 0)
              {
                char v25 = "%s: error sending message (%s): %s\n";
                goto LABEL_52;
              }
            }

            goto LABEL_87;
          }

LABEL_63:
          size_t v47 = strlen(v4);
          if (v22 - 1 > 1) {
            goto LABEL_87;
          }
          size_t v48 = v47;
          char v49 = !v21;
          if (v22 != 1) {
            char v49 = 1;
          }
          if ((v49 & 1) == 0 && v3[15]) {
            sub_10000599C((uint64_t)v3);
          }
          uint64_t v50 = (const char *)asl_msg_get_val_for_key(v2, "Facility");
          if (!v50)
          {
            unsigned int v52 = v3[5];
            goto LABEL_74;
          }

          int v51 = strcmp(v50, "kern");
          unsigned int v52 = v3[5];
          if (v51 || (unsigned int v53 = v48, v52 != 2))
          {
LABEL_74:
            BOOL v54 = v52 == 1;
            char v55 = !v16;
            if (!v54) {
              char v55 = 1;
            }
            if ((v55 & 1) != 0)
            {
              unsigned int v53 = write(v3[4], v4, v48);
            }

            else
            {
              if (!*((void *)v3 + 9))
              {
                uint64_t v56 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)qword_10001C078);
                *((void *)v3 + 9) = v56;
                *(void *)&handler.ai_flags = _NSConcreteStackBlock;
                *(void *)&handler.ai_socktype = 0x40000000LL;
                *(void *)&handler.size_t ai_addrlen = sub_100005B60;
                handler.ai_canonname = (char *)&unk_100018D78;
                handler.ai_addr = (sockaddr *)v3;
                dispatch_source_set_event_handler(v56, &handler);
              }

              unsigned int v53 = v48;
              if (!v3[15])
              {
                uint64_t v57 = (dispatch_source_s *)*((void *)v3 + 9);
                dispatch_time_t v58 = dispatch_time(0LL, 1000000000 * xmmword_10001E460);
                dispatch_source_set_timer(v57, v58, 0xFFFFFFFFFFFFFFFFLL, 0LL);
                dispatch_resume(*((dispatch_object_t *)v3 + 9));
                unsigned int v53 = v48;
              }
            }
          }

          if ((v53 & 0x80000000) == 0 && v53 >= v48) {
            goto LABEL_87;
          }
          uint64_t v59 = *((void *)v3 + 1);
          uint64_t v60 = __error();
          uint64_t v122 = strerror(*v60);
          sub_1000064BC("%s: error writing message (%s): %s\n", v61, v62, v63, v64, v65, v66, v67, (char)"bsd_out");
          close(v3[4]);
          int v68 = open(*((const char **)v3 + 1), 131593, 420LL, v59, v122);
          v3[4] = v68;
          if (v68 < 0)
          {
            uint64_t v81 = __error();
            strerror(*v81);
            sub_1000064BC("%s: re-open failed for file: %s (%s)\n", v82, v83, v84, v85, v86, v87, v88, (char)"bsd_out");
          }

          else
          {
            unsigned int v69 = write(v68, v4, v48);
            if ((v69 & 0x80000000) != 0)
            {
              char v25 = "%s: error re-writing message (%s): %s\n";
            }

            else
            {
              char v25 = "%s: error re-writing message (%s): %s\n";
              if (v69 >= v48) {
                goto LABEL_87;
              }
            }

        if (!asl_msg_lookup(v20, "db_memory_str_max", 0LL, 0LL))
        {
          snprintf((char *)&atoken, 0x100uLL, "%u", HIDWORD(xmmword_10001E448));
          asl_msg_set_key_val(v25, "db_memory_str_max", &atoken);
        }

        goto LABEL_66;
      }

      asl_msg_list_release(v23);
    }

    int v35 = 9;
    goto LABEL_31;
  }

  uint64_t v27 = pidp;
  if (pidp <= 0)
  {
    uint64_t v30 = euidp;
  }

  else
  {
    uint64_t v28 = (void *)xpc_copy_entitlement_for_token(0LL, a11);
    if (v28)
    {
      uint64_t v29 = v28;
      if (xpc_dictionary_get_BOOL(v28, "com.apple.asl.access_as_root"))
      {
        euidp = 0;
      }

      else
      {
        value = xpc_dictionary_get_value(v29, "com.apple.asl.access_as_uid");
        if (value)
        {
          uint64_t v32 = value;
        }

        uint64_t v33 = xpc_dictionary_get_value(v29, "com.apple.asl.access_as_gid");
        if (v33)
        {
          unsigned int v34 = v33;
        }
      }

      xpc_release(v29);
    }

    uint64_t v30 = euidp;
    if (!euidp) {
      uint64_t v27 = 0;
    }
  }

  int v35 = sub_100008638(v18, (uint64_t)&v49, a3, a4, a5, a6, (uint64_t)a9, v30, egidp, v27);
LABEL_31:
  *a10 = v35;
  asl_msg_list_release(v18);
  if (*a10 == 2)
  {
    if (v49) {
      asl_msg_list_release(v49);
    }
  }

  else
  {
    LODWORD(sizea) = 0;
    uint64_t v36 = (void *)asl_msg_list_to_string(v49, &sizea);
    asl_msg_list_release(v49);
    if (v36 && (_DWORD)sizea)
    {
      if (vm_allocate(mach_task_self_, (vm_address_t *)atoken.val, sizea, 1358954497))
      {
        free(v36);
        uint64_t v17 = 9999;
        goto LABEL_4;
      }

      memmove(*(void **)atoken.val, v36, sizea);
      free(v36);
      *uint64_t v44 = *(void *)atoken.val;
      *uint64_t v45 = sizea;
    }
  }

LABEL_52:
            stat v26 = __error();
            strerror(*v26);
            sub_1000064BC(v25, v27, v28, v29, v30, v31, v32, v33, (char)"bsd_out");
LABEL_87:
            if (v16)
            {
              ++v3[15];
            }

            else
            {
              free(*((void **)v3 + 10));
              *((void *)v3 + 10) = 0LL;
              *((void *)v3 + 10) = strdup(v4 + 16);
              v3[14] = v15;
              v3[15] = 0;
              *((void *)v3 + 8) = v123;
            }
          }
        }

        else
        {
          if (v22 != 3)
          {
            __s = 0LL;
            goto LABEL_63;
          }

          unsigned int v34 = (const char *)asl_msg_get_val_for_key(v2, "Level");
          if (v34) {
            int v35 = atoi(v34);
          }
          else {
            int v35 = 7;
          }
          uint64_t v79 = asl_msg_get_val_for_key(v2, "Facility");
          int v80 = asl_syslog_faciliy_name_to_num(v79);
          uint64_t v126 = 0LL;
          asprintf((char **)&v126, "<%d>%s", v80 & ~(v80 >> 31) | v35, v4);
          __s = (char *)v126;
          if (v126)
          {
            unsigned int v22 = v3[5];
            goto LABEL_48;
          }

          __s = 0LL;
        }
      }

LABEL_90:
      tm v3 = (unsigned int *)*((void *)v3 + 11);
      if (!v3)
      {
LABEL_118:
        free(v4);
        free(__s);
        uint64_t v117 = *(void *)(a1 + 32);
        goto LABEL_119;
      }
    }
  }

  uint64_t v117 = 0LL;
LABEL_119:
  uint64_t result = asl_msg_release(v117);
  uint64_t v119 = -*(void *)(a1 + 40);
  do
    unint64_t v120 = __ldxr((unint64_t *)&xmmword_10001E388);
  while (__stxr(v120 + v119, (unint64_t *)&xmmword_10001E388));
  do
    unsigned int v121 = __ldxr((unsigned int *)&xmmword_10001E388 + 3);
  while (__stxr(v121 - 1, (unsigned int *)&xmmword_10001E388 + 3));
  return result;
}

uint64_t sub_10000520C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  qword_10001C088 = 0LL;
  qword_10001C090 = (uint64_t)&qword_10001C088;
  int v8 = fopen("/etc/syslog.conf", "r");
  if (v8)
  {
    int v9 = v8;
    line_from_file = get_line_from_file(v8);
    if (line_from_file)
    {
      size_t v11 = line_from_file;
      uint64_t v50 = v9;
      do
      {
        for (uint64_t i = v11; ; ++i)
        {
          int v13 = *i;
          if (v13 != 9 && v13 != 32) {
            break;
          }
        }

        if (v13 != 35)
        {
          int v51 = explode(i, "; \t");
          if (v51)
          {
            size_t v14 = (unsigned int *)calloc(1uLL, 0x68uLL);
            if (v14)
            {
              unsigned int v15 = v14;
              int v16 = -1;
              v14[4] = -1;
              uint64_t v17 = *(_BYTE **)v51;
              if (*(void *)v51)
              {
                uint64_t v18 = 0LL;
                do
                {
                  if (*v17) {
                    int v16 = v18;
                  }
                  uint64_t v17 = *(_BYTE **)&v51[8 * v18++ + 8];
                }

                while (v17);
              }

              int v19 = strdup(*(const char **)&v51[8 * v16]);
              *((void *)v15 + 1) = v19;
              if (v19)
              {
                int v20 = (void **)v51;
                if (v16 >= 1)
                {
                  uint64_t v21 = 0LL;
                  uint64_t v48 = v16;
                  do
                  {
                    unsigned int v22 = (unsigned __int8 *)v20[v21];
                    if (*v22)
                    {
                      uint64_t v23 = explode(v22, ",.");
                      size_t v24 = (void **)v23;
                      char v25 = *(_BYTE **)v23;
                      if (*(void *)v23)
                      {
                        uint64_t v26 = 0LL;
                        LODWORD(v27) = -1;
                        do
                        {
                          if (*v25) {
                            uint64_t v27 = v26;
                          }
                          else {
                            uint64_t v27 = v27;
                          }
                          char v25 = *(_BYTE **)&v23[8 * v26++ + 8];
                        }

                        while (v25);
                        if ((int)v27 >= 1)
                        {
                          uint64_t v28 = (const char **)v23;
                          uint64_t v29 = v27;
                          char v49 = v23;
                          do
                          {
                            if (!**v28) {
                              goto LABEL_66;
                            }
                            uint64_t v30 = (const char *)v24[v27];
                            if (!v30) {
                              goto LABEL_66;
                            }
                            if (!strcasecmp((const char *)v24[v27], "emerg") || !strcasecmp(v30, "panic"))
                            {
                              int v31 = 0;
                            }

                            else if (!strcasecmp(v30, "alert"))
                            {
                              int v31 = 1;
                            }

                            else if (!strcasecmp(v30, "crit"))
                            {
                              int v31 = 2;
                            }

                            else if (!strcasecmp(v30, "err") || !strcasecmp(v30, "error"))
                            {
                              int v31 = 3;
                            }

                            else if (!strcasecmp(v30, "warn") || !strcasecmp(v30, "warning"))
                            {
                              int v31 = 4;
                            }

                            else if (!strcasecmp(v30, "notice"))
                            {
                              int v31 = 5;
                            }

                            else if (!strcasecmp(v30, "info"))
                            {
                              int v31 = 6;
                            }

                            else if (!strcasecmp(v30, "debug") || !strcmp(v30, "*"))
                            {
                              int v31 = 7;
                            }

                            else
                            {
                              if (strcasecmp(v30, "none")) {
                                goto LABEL_66;
                              }
                              int v31 = -2;
                            }

                            if (*v15)
                            {
                              *((void *)v15 + 4) = reallocf(*((void **)v15 + 4), 8LL * (*v15 + 1));
                              *((void *)v15 + 5) = reallocf(*((void **)v15 + 5), 4LL * (*v15 + 1));
                              uint64_t v32 = reallocf(*((void **)v15 + 6), 4LL * (*v15 + 1));
                            }

                            else
                            {
                              *((void *)v15 + 4) = calloc(1uLL, 8uLL);
                              *((void *)v15 + 5) = calloc(1uLL, 4uLL);
                              uint64_t v32 = calloc(1uLL, 4uLL);
                            }

                            *((void *)v15 + 6) = v32;
                            if (!*((void *)v15 + 4) || !*((void *)v15 + 5) || !v32) {
                              goto LABEL_78;
                            }
                            uint64_t v33 = *v28;
                            if (*v28 && (unsigned int v34 = strlen(*v28), (v35 = v34) != 0))
                            {
                              int v36 = *(unsigned __int8 *)v33;
                              if (v36 == 39 || v36 == 34)
                              {
                                else {
                                  int v37 = -1;
                                }
                                unsigned int v35 = v37 + v34;
                              }

                              uint64_t v38 = calloc(1uLL, v35 + 1);
                              uint64_t v39 = v38;
                              if (v38) {
                                memcpy(v38, v33, v35);
                              }
                            }

                            else
                            {
                              uint64_t v39 = 0LL;
                            }

                            uint64_t v40 = *v15;
                            *(void *)(*((void *)v15 + 4) + 8 * v40) = v39;
                            uint64_t v41 = *((void *)v15 + 4);
                            if (!*(void *)(v41 + 8 * v40)) {
                              goto LABEL_78;
                            }
                            uint64_t v42 = *((void *)v15 + 5);
                            *(_DWORD *)(v42 + 4 * v40) = 0;
                            uint64_t v43 = *v15;
                            uint64_t v44 = *(const char **)(v41 + 8 * v43);
                            uint64_t v45 = strchr(v44, 42);
                            if (v45)
                            {
                              *(_DWORD *)(v42 + 4 * v43) = (_DWORD)v45 - (_DWORD)v44;
                              uint64_t v43 = *v15;
                            }

                            *(_DWORD *)(*((void *)v15 + 6) + 4 * v43) = v31;
                            ++*v15;
                            size_t v24 = (void **)v49;
LABEL_66:
                            ++v28;
                            --v29;
                          }

                          while (v29);
                        }
                      }

                      free_string_list(v24);
                      int v20 = (void **)v51;
                    }

                    ++v21;
                  }

                  while (v21 != v48);
                }

                free_string_list(v20);
                *((void *)v15 + 11) = 0LL;
                uint64_t v46 = (void *)qword_10001C090;
                *((void *)v15 + 12) = qword_10001C090;
                *uint64_t v46 = v15;
                qword_10001C090 = (uint64_t)(v15 + 22);
              }
            }
          }
        }

LABEL_78:
        free(v11);
        int v9 = v50;
        size_t v11 = get_line_from_file(v50);
      }

      while (v11);
    }

    fclose(v9);
  }

  if (qword_10001C080 != -1) {
    dispatch_once(&qword_10001C080, &stru_100018C98);
  }
  return 0LL;
}

              if (!asl_msg_lookup(v20, "memory_max", 0LL, 0LL))
              {
                snprintf((char *)&atoken, 0x100uLL, "%lld", qword_10001E480);
                asl_msg_set_key_val(v25, "memory_max", &atoken);
              }

              goto LABEL_81;
            }

void sub_100005700(id a1)
{
  qword_10001C078 = (uint64_t)dispatch_queue_create("BSD Out Queue", 0LL);
  qword_10001C098 = (uint64_t)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)qword_10001C078);
  dispatch_source_set_event_handler((dispatch_source_t)qword_10001C098, &stru_100018CD8);
  dispatch_time_t v1 = (dispatch_source_s *)qword_10001C098;
  dispatch_time_t v2 = dispatch_time(0LL, 300000000000LL);
  dispatch_source_set_timer(v1, v2, 0x45D964B800uLL, 0LL);
  dispatch_resume((dispatch_object_t)qword_10001C098);
}

void sub_100005794(id a1)
{
  time_t v1 = time(0LL);
  uint64_t v2 = qword_10001C088;
  if (qword_10001C088)
  {
    time_t v3 = v1;
    do
    {
      if (*(_DWORD *)(v2 + 20) == 1 && !*(_DWORD *)(v2 + 60) && (unint64_t)(v3 - *(void *)(v2 + 64)) >= 0x12D)
      {
        unsigned int v4 = *(void **)(v2 + 24);
        if (!v4
          || (free(v4), *(void *)(v2 + 24) = 0LL, int v5 = *(_DWORD *)(v2 + 20), (v5 - 1) < 2)
          || v5 == 3)
        {
          int v6 = *(_DWORD *)(v2 + 16);
          if ((v6 & 0x80000000) == 0) {
            close(v6);
          }
          *(_DWORD *)(v2 + 16) = -1;
        }
      }

      uint64_t v2 = *(void *)(v2 + 88);
    }

    while (v2);
  }

uint64_t sub_100005838()
{
  return 0LL;
}

void sub_100005864()
{
  uint64_t v0 = (unsigned int *)qword_10001C088;
  if (qword_10001C088)
  {
    do
    {
      time_t v1 = (unsigned int *)*((void *)v0 + 11);
      uint64_t v2 = (dispatch_source_s *)*((void *)v0 + 9);
      if (v2)
      {
        if (v0[15])
        {
          sub_10000599C((uint64_t)v0);
          uint64_t v2 = (dispatch_source_s *)*((void *)v0 + 9);
        }

        dispatch_source_cancel(v2);
        dispatch_resume(*((dispatch_object_t *)v0 + 9));
        dispatch_release(*((dispatch_object_t *)v0 + 9));
      }

      free(*((void **)v0 + 1));
      free(*((void **)v0 + 3));
      free(*((void **)v0 + 10));
      free(*((void **)v0 + 5));
      free(*((void **)v0 + 6));
      int v3 = v0[4];
      if ((v3 & 0x80000000) == 0) {
        close(v3);
      }
      unsigned int v4 = (void *)*((void *)v0 + 4);
      if (v4)
      {
        if (*v0)
        {
          unint64_t v5 = 0LL;
          do
            free(*(void **)(*((void *)v0 + 4) + 8 * v5++));
          while (v5 < *v0);
          unsigned int v4 = (void *)*((void *)v0 + 4);
        }

        free(v4);
      }

      uint64_t v6 = *((void *)v0 + 11);
      int v7 = (void *)*((void *)v0 + 12);
      if (v6)
      {
        *(void *)(v6 + 96) = v7;
        int v7 = (void *)*((void *)v0 + 12);
      }

      else
      {
        qword_10001C090 = *((void *)v0 + 12);
      }

      *int v7 = v6;
      free(v0);
      uint64_t v0 = v1;
    }

    while (v1);
  }

uint64_t sub_100005960()
{
  return 0LL;
}

void sub_100005988(id a1)
{
}

void sub_10000599C(uint64_t a1)
{
  if (a1 && *(_DWORD *)(a1 + 20) == 1 && *(_DWORD *)(a1 + 60))
  {
    dispatch_suspend(*(dispatch_object_t *)(a1 + 72));
    time_t v27 = time(0LL);
    *(_OWORD *)uint64_t v29 = 0u;
    __int128 v30 = 0u;
    ctime_r(&v27, v29);
    BYTE3(v30) = 0;
    __s = 0LL;
    int v2 = *(_DWORD *)(a1 + 60);
    uint64_t v3 = "s";
    if (v2 == 1) {
      uint64_t v3 = (const char *)&unk_100015297;
    }
    asprintf(&__s, "%s: --- last message repeated %u time%s ---\n", &v29[4], v2, v3);
    *(_DWORD *)(a1 + 60) = 0;
    if (__s)
    {
      int v4 = strlen(__s);
      int v5 = write(*(_DWORD *)(a1 + 16), __s, v4);
      if ((v5 & 0x80000000) == 0 && v5 >= v4) {
        goto LABEL_15;
      }
      uint64_t v6 = *(void *)(a1 + 8);
      uint64_t v7 = __error();
      uint64_t v26 = strerror(*v7);
      sub_1000064BC("%s: error writing repeat message (%s): %s\n", v8, v9, v10, v11, v12, v13, v14, (char)"bsd_out");
      close(*(_DWORD *)(a1 + 16));
      int v15 = open(*(const char **)(a1 + 8), 131593, 420LL, v6, v26);
      *(_DWORD *)(a1 + 16) = v15;
      if (v15 < 0)
      {
        uint64_t v17 = "%s: re-open failed for file: %s (%s)\n";
      }

      else
      {
        int v16 = write(v15, __s, v4);
        uint64_t v17 = "%s: error re-writing message (%s): %s\n";
        if ((v16 & 0x80000000) == 0 && v16 >= v4) {
          goto LABEL_15;
        }
      }

      uint64_t v18 = __error();
      strerror(*v18);
      sub_1000064BC(v17, v19, v20, v21, v22, v23, v24, v25, (char)"bsd_out");
LABEL_15:
      free(__s);
    }
  }

void sub_100005B60(uint64_t a1)
{
}

uint64_t sub_100005B68()
{
  return _os_nospin_lock_unlock(&unk_10001C0A0);
}

uint64_t sub_100005BA8()
{
  if (dword_10001E34C >= 1) {
    --dword_10001E34C;
  }
  return _os_nospin_lock_unlock(&unk_10001C0A0);
}

uint64_t sub_100005BE4()
{
  dword_10001E37C = getpid();
  DWORD2(xmmword_10001E428) = 0;
  free((void *)qword_10001E438);
  qword_10001E438 = 0LL;
  LODWORD(xmmword_10001E408) = 1;
  xmmword_10001E448 = xmmword_100014720;
  qword_10001E458 = 0x1388000001F4LL;
  xmmword_10001E460 = xmmword_100014730;
  qword_10001E480 = 3072000LL;
  xmmword_10001E470 = xmmword_100014740;
  qword_10001E418 = (uint64_t)asl_out_module_init();
  uint64_t result = _os_nospin_lock_unlock(&unk_10001E348);
  if (qword_10001E418)
  {
    for (uint64_t i = *(void *)(qword_10001E418 + 16); i; uint64_t i = *(void *)(i + 40))
    {
      if (*(_DWORD *)(i + 8) == 1 && !*(void *)i)
      {
        int v2 = *(char **)(i + 16);
        uint64_t result = strncmp(v2, "debug", 5uLL);
        if (!(_DWORD)result) {
          uint64_t result = sub_100005CE0((unsigned __int8 *)v2, 1);
        }
      }
    }
  }

  return result;
}

uint64_t sub_100005CE0(unsigned __int8 *a1, int a2)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v2 = *a1;
  if (*a1)
  {
    if ((_DWORD)v2 == 61) {
      ++a1;
    }
    while (1)
    {
      int v4 = *a1;
      if (v4 != 32 && v4 != 9) {
        break;
      }
      ++a1;
    }

    uint64_t v6 = (const char **)explode(a1, " \t");
    if (v6)
    {
      uint64_t v7 = v6;
      unsigned int v8 = -1;
      do
        ++v8;
      while (v6[v8]);
      if (!v8) {
        goto LABEL_17;
      }
      uint64_t v9 = *v6;
      if (!strcasecmp(*v6, "debug"))
      {
        if (v8 == 1)
        {
          int v10 = a2;
          uint64_t v11 = 0LL;
        }

        else
        {
          int v16 = v7[1];
          int v10 = strcmp(v16, "0");
          if (v10)
          {
            if (!strcmp(v16, "1"))
            {
              uint64_t v11 = v7[2];
              int v10 = 1;
            }

            else
            {
              int v10 = a2;
              uint64_t v11 = v16;
            }
          }

          else
          {
            uint64_t v11 = v7[2];
          }
        }

        sub_10000C724(v10, v11);
        goto LABEL_80;
      }

      if (v8 == 1)
      {
LABEL_17:
        uint64_t v2 = 0xFFFFFFFFLL;
LABEL_81:
        free_string_list((void **)v7);
        return v2;
      }

      if (!strcasecmp(v9, "hostname"))
      {
        _os_nospin_lock_lock(&unk_10001E348);
        if (a2)
        {
          uint64_t v17 = strdup(v7[1]);
        }

        else
        {
          free((void *)qword_10001E440);
          uint64_t v17 = 0LL;
        }

        qword_10001E440 = (uint64_t)v17;
      }

      else if (!strcasecmp(v9, "mark_time"))
      {
        _os_nospin_lock_lock(&unk_10001E348);
        if (a2) {
          uint64_t v18 = atoll(v7[1]);
        }
        else {
          uint64_t v18 = 0LL;
        }
        *((void *)&xmmword_10001E460 + 1) = v18;
      }

      else if (!strcasecmp(v9, "dup_delay"))
      {
        _os_nospin_lock_lock(&unk_10001E348);
        if (a2) {
          uint64_t v19 = atoll(v7[1]);
        }
        else {
          uint64_t v19 = 30LL;
        }
        *(void *)&xmmword_10001E460 = v19;
      }

      else if (!strcasecmp(v9, "remote_delay"))
      {
        _os_nospin_lock_lock(&unk_10001E348);
        if (a2) {
          int v20 = atol(v7[1]);
        }
        else {
          int v20 = 5000;
        }
        HIDWORD(qword_10001E458) = v20;
      }

      else if (!strcasecmp(v9, "utmp_ttl"))
      {
        _os_nospin_lock_lock(&unk_10001E348);
        if (a2) {
          uint64_t v21 = atoll(v7[1]);
        }
        else {
          uint64_t v21 = 31622400LL;
        }
        *(void *)&xmmword_10001E470 = v21;
      }

      else if (!strcasecmp(v9, "mps_limit"))
      {
        _os_nospin_lock_lock(&unk_10001E348);
        if (a2) {
          int v22 = atol(v7[1]);
        }
        else {
          int v22 = 500;
        }
        LODWORD(qword_10001E458) = v22;
      }

      else if (!strcasecmp(v9, "memory_max"))
      {
        _os_nospin_lock_lock(&unk_10001E348);
        if (a2) {
          uint64_t v23 = atoll(v7[1]);
        }
        else {
          uint64_t v23 = 3072000LL;
        }
        qword_10001E480 = v23;
      }

      else
      {
        if (strcasecmp(v9, "stats_interval"))
        {
          if (!strcasecmp(v9, "max_file_size"))
          {
            pthread_mutex_lock((pthread_mutex_t *)qword_10001E398);
            if ((xmmword_10001E448 & 1) != 0)
            {
              asl_store_close(xmmword_10001E3E8);
              *(void *)&xmmword_10001E3E8 = 0LL;
              if (a2) {
                int v25 = atoi(v7[1]);
              }
              else {
                int v25 = 25600000;
              }
              DWORD1(xmmword_10001E448) = v25;
            }

            pthread_mutex_unlock((pthread_mutex_t *)qword_10001E398);
            goto LABEL_80;
          }

          if (!strcasecmp(v9, "db") || !strcasecmp(v9, "database") || !strcasecmp(v9, "datastore"))
          {
            if (!a2)
            {
              int v27 = 2;
              int v28 = 25600000;
              int v29 = 256;
              int v30 = 1024000;
LABEL_121:
              sub_10000C788(v27, v28, v29, v30);
              goto LABEL_80;
            }

            uint64_t v12 = v7[1];
            if (*(unsigned __int8 *)v12 - 48 <= 9)
            {
              int v13 = atoi(v7[1]);
              if (v8 < 3)
              {
                int v32 = 0;
                int v33 = 0;
                goto LABEL_113;
              }

              uint64_t v14 = v7[2];
              if (!strcmp(v14, "-")) {
                int v15 = 0;
              }
              else {
                int v15 = atoi(v14);
              }
              if (v8 < 4)
              {
                int v33 = 0;
                int v32 = 0;
              }

              else
              {
                unsigned int v35 = v7[3];
                if (!strcmp(v35, "-")) {
                  int v37 = 0;
                }
                else {
                  int v37 = atoi(v35);
                }
                if (v8 < 5)
                {
                  int v32 = 0;
                }

                else
                {
                  int v36 = v7[4];
                  int v32 = strcmp(v36, "-");
                  if (v32) {
                    int v32 = atoi(v36);
                  }
                }

                int v33 = v37;
              }

LABEL_112:
              int v28 = v15;
              if (v15)
              {
LABEL_114:
                if (v33) {
                  int v29 = v33;
                }
                else {
                  int v29 = DWORD2(xmmword_10001E448);
                }
                if (v32) {
                  int v30 = v32;
                }
                else {
                  int v30 = HIDWORD(xmmword_10001E448);
                }
                int v27 = v13;
                goto LABEL_121;
              }

LABEL_113:
              int v28 = DWORD1(xmmword_10001E448);
              goto LABEL_114;
            }

            if (!strcasecmp(v7[1], "file"))
            {
              if (v8 < 3)
              {
                int v32 = 0;
              }

              else
              {
                unsigned int v34 = v7[2];
                int v32 = strcmp(v34, "-");
                if (v32)
                {
                  int v15 = atoi(v34);
                  int v33 = 0;
                  int v32 = 0;
                  int v13 = 1;
                  goto LABEL_112;
                }
              }

              int v33 = 0;
              int v13 = 1;
              goto LABEL_113;
            }

            if (strncasecmp(v12, "mem", 3uLL)) {
              goto LABEL_17;
            }
            if (v8 < 3)
            {
              int v32 = 0;
            }

            else
            {
              int v31 = v7[2];
              int v32 = strcmp(v31, "-");
              if (v32)
              {
                int v33 = atoi(v31);
                int v32 = 0;
LABEL_105:
                int v13 = 2;
                goto LABEL_113;
              }
            }

            int v33 = 0;
            goto LABEL_105;
          }

LABEL_80:
          uint64_t v2 = 0LL;
          goto LABEL_81;
        }

        _os_nospin_lock_lock(&unk_10001E348);
        if (a2) {
          uint64_t v24 = atoll(v7[1]);
        }
        else {
          uint64_t v24 = 600LL;
        }
        *((void *)&xmmword_10001E470 + 1) = v24;
      }

      _os_nospin_lock_unlock(&unk_10001E348);
      goto LABEL_80;
    }

    return 0xFFFFFFFFLL;
  }

  return v2;
}

      *((_DWORD *)v6 + 2) = v13;
      goto LABEL_81;
    }

    sub_100011964(a1, (unsigned __int8 *)a2 + 1, 4096);
    return 0LL;
  }

  if (v4 == 42) {
    goto LABEL_20;
  }
  if (v4 != 61 || !a1) {
    return 0LL;
  }
  int v5 = calloc(1uLL, 0x30uLL);
  uint64_t v6 = v5;
  if (!v5) {
    return v6;
  }
  for (uint64_t j = a2 + 1; ; ++j)
  {
    unsigned int v8 = *j;
    if (v8 != 39 && v8 != 32) {
      break;
    }
  }

  *((_DWORD *)v5 + 2) = 1;
  if (*j != 91)
  {
    uint64_t v17 = strchr(a2, 91);
    if (!v17)
    {
      *((void *)v6 + 2) = sub_100012EA4(j);
      goto LABEL_76;
    }

    uint64_t v18 = v17;
    if (!strncmp(v17, "[File ", 6uLL) || !strncmp(v18, "[File\t", 6uLL))
    {
      uint64_t v19 = 17;
    }

    else if (!strncmp(v18, "[Plist ", 7uLL) || !strncmp(v18, "[Plist\t", 7uLL))
    {
      uint64_t v19 = 18;
    }

    else
    {
      if (strncmp(v18, "[Profile ", 9uLL) && strncmp(v18, "[Profile\t", 9uLL)) {
        goto LABEL_74;
      }
      uint64_t v19 = 19;
    }

    *((_DWORD *)v6 + 2) = v19;
LABEL_74:
    *((_BYTE *)v18 - 1) = 0;
    *((void *)v6 + 2) = sub_100012EA4(j);
    *((_WORD *)v18 - 1) = 8273;
    a2 = (char *)(v18 - 2);
    goto LABEL_75;
  }

  uint64_t v14 = (char *)sub_100012E2C((uint64_t)a2);
  if (!v14) {
    goto LABEL_100;
  }
  int v15 = v14;
  *((void *)v6 + 2) = sub_100012EA4(v14);
  if (*(v15 - 1) == 93) {
    int v16 = 0LL;
  }
  else {
    int v16 = -1LL;
  }
  v15[v16] = 0;
  *a2 = 81;
LABEL_75:
  int v20 = asl_msg_from_string(a2);
  *(void *)uint64_t v6 = v20;
  if (!v20) {
    goto LABEL_99;
  }
LABEL_76:
  uint64_t v21 = *(void *)(a1 + 16);
  if (!v21) {
    goto LABEL_136;
  }
  do
  {
    int v22 = v21;
    uint64_t v21 = *(void *)(v21 + 40);
  }

  while (v21);
LABEL_135:
  *(void *)(v22 + 40) = v6;
  return v6;
}

void sub_1000062A4(uint64_t a1, int a2)
{
  if (a1)
  {
    uint64_t v3 = a1;
    int v4 = asl_check_option(a1, "control");
    BOOL v12 = v4 != 0;
    if (!v4 && byte_10001C0A4 == 1)
    {
      if (qword_10001E480 >= 0) {
        uint64_t v13 = qword_10001E480;
      }
      else {
        uint64_t v13 = qword_10001E480 + 1;
      }
      if ((uint64_t)xmmword_10001E388 >= v13 >> 1)
      {
        sub_1000064BC("Work queue draining: dropped message.\n", v5, v6, v7, v8, v9, v10, v11, v27);
        asl_msg_release(v3);
        return;
      }

      sub_1000064BC( "Work queue re-enabled at 1/2 max.  size %lld  max %lld\n",  v5,  v6,  v7,  v8,  v9,  v10,  v11,  xmmword_10001E388);
      byte_10001C0A4 = 0;
    }

    uint64_t v14 = os_transaction_create("com.apple.syslogd.message");
    uint64_t v15 = 0LL;
    uint64_t v16 = v3;
    do
    {
      uint64_t v17 = *(void *)(v16 + 16);
      uint64_t v16 = *(void *)(v16 + 24);
      v15 += v17;
    }

    while (v16);
    if ((uint64_t)xmmword_10001E388 + v15 >= qword_10001E480)
    {
      byte_10001C0A4 = 1;
      asl_msg_release(v3);
      sub_1000064BC("Work queue disabled.  msize %lld  size %lld  max %lld\n", v18, v19, v20, v21, v22, v23, v24, v15);
      snprintf( __str,  0x100uLL,  "[Sender syslogd] [Level 2] [PID %u] [Message Internal memory size limit %lld exceeded - dropping messages] [UID 0] [UID 0] [Facility syslog]",  dword_10001E37C,  qword_10001E480);
      uint64_t v3 = asl_msg_from_string(__str);
    }

    do
      unint64_t v25 = __ldxr((unint64_t *)&xmmword_10001E388);
    while (__stxr(v25 + v15, (unint64_t *)&xmmword_10001E388));
    do
      unsigned int v26 = __ldxr((unsigned int *)&dword_10001E380);
    while (__stxr(v26 + 1, (unsigned int *)&dword_10001E380));
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000LL;
    block[2] = sub_10000659C;
    block[3] = &unk_100018DD8;
    int v29 = a2;
    BOOL v30 = v12;
    void block[4] = v3;
    block[5] = v15;
    void block[6] = v14;
    dispatch_async((dispatch_queue_t)qword_10001E3D0, block);
  }

uint64_t sub_1000064BC( const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (DWORD2(xmmword_10001E428))
  {
    uint64_t v10 = qword_10001E438 ? (const char *)qword_10001E438 : "/var/log/syslogd.log";
    uint64_t v11 = fopen(v10, "a");
    if (v11)
    {
      BOOL v12 = v11;
      fprintf(v11, "W %d %llu", dword_10001E380, (void)xmmword_10001E388);
      if (*((void *)&xmmword_10001E3E8 + 1)) {
        fprintf( v12,  "   M %u %u %lu",  *(_DWORD *)(*((void *)&xmmword_10001E3E8 + 1) + 28LL),  *(_DWORD *)(*((void *)&xmmword_10001E3E8 + 1) + 24LL),  *(void *)(*((void *)&xmmword_10001E3E8 + 1) + 48LL));
      }
      fwrite(" ; ", 3uLL, 1uLL, v12);
      vfprintf(v12, a1, &a9);
      fclose(v12);
    }
  }

  return 0LL;
}

void sub_10000659C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2) {
    goto LABEL_64;
  }
  int v3 = *(_DWORD *)(a1 + 56);
  time_t v4 = time(0LL);
  uint64_t val_for_key = (const char *)asl_msg_get_val_for_key(v2, "PID");
  if (val_for_key)
  {
    int v6 = atoi(val_for_key);
    if (v6 == 1)
    {
      uint64_t v7 = (const char *)asl_msg_get_val_for_key(v2, "RefPID");
      if (v7) {
        int v8 = atoi(v7);
      }
      else {
        int v8 = 1;
      }
      uint64_t v9 = (const char *)asl_msg_get_val_for_key(v2, "RefProc");
    }

    else
    {
      int v8 = v6;
      uint64_t v9 = 0LL;
    }
  }

  else
  {
    asl_msg_set_key_val(v2, "PID", "0");
    uint64_t v9 = 0LL;
    int v8 = 0;
  }

  uint64_t v10 = (unsigned __int8 *)asl_msg_get_val_for_key(v2, "Level");
  if (v3 == 4) {
    unsigned int v11 = 5;
  }
  else {
    unsigned int v11 = 7;
  }
  if (v10)
  {
    if (!v10[1])
    {
      int v12 = *v10;
      int v13 = v12 & 0xF8;
      unsigned int v14 = v12 - 48;
      if (v13 == 48) {
        unsigned int v11 = v14;
      }
    }
  }

  snprintf(__str, 0x40uLL, "%d", v11);
  asl_msg_set_key_val(v2, "Level", __str);
  if (!v8 && (_DWORD)qword_10001E458 && !HIDWORD(xmmword_10001E368))
  {
    if (qword_10001C0A8 == v4)
    {
      unsigned int v15 = dword_10001C0B4;
    }

    else
    {
      dword_10001C0B0 = qword_10001E458;
      unsigned int v15 = 7;
      dword_10001C0B4 = 7;
      qword_10001C0A8 = v4;
    }

    if (v15 > v11) {
      dword_10001C0B4 = v11;
    }
    int v16 = dword_10001C0B0;
    if (dword_10001C0B0 >= 1)
    {
      --dword_10001C0B0;
      if (v16 != 1) {
        goto LABEL_34;
      }
      goto LABEL_32;
    }

    if ((dword_10001C0B0 & 0x80000000) == 0)
    {
LABEL_32:
      dword_10001C0B0 = -1;
      v77[0] = 0LL;
      asprintf( v77,  "*** kernel exceeded %d log message per second limit  -  remaining messages this second discarded ***",  qword_10001E458);
      if (v77[0])
      {
        asl_msg_set_key_val(v2, "Message", v77[0]);
        free(v77[0]);
        v76[0] = dword_10001C0B4 + 48;
        v76[1] = 0;
        asl_msg_set_key_val(v2, "Level", v76);
      }

      goto LABEL_34;
    }

LABEL_64:
    uint64_t v28 = -*(void *)(a1 + 40);
    do
      unint64_t v29 = __ldxr((unint64_t *)&xmmword_10001E388);
    while (__stxr(v29 + v28, (unint64_t *)&xmmword_10001E388));
    goto LABEL_150;
  }

  if (v8)
  {
    uuid_clear(uu);
    if (proc_pidinfo(v8, 17, 1uLL, uu, 56) == 56)
    {
      uuid_unparse(uu, out);
      asl_msg_set_key_val(v2, "SenderMachUUID", out);
    }
  }

    int v8 = v10 + 1;
  }

LABEL_34:
  uint64_t v17 = asl_msg_get_val_for_key(v2, "Time");
  if (v17) {
    uint64_t v17 = asl_core_parse_time(v17, 0LL);
  }
  if (v17 > v4 || v17 == 0) {
    time_t v19 = v4;
  }
  else {
    time_t v19 = v17;
  }
  snprintf(__str, 0x3FuLL, "%llu", v19);
  asl_msg_set_key_val(v2, "Time", __str);
  if (!asl_msg_get_val_for_key(v2, "Host"))
  {
    uint64_t v20 = (uint64_t *)qword_10001E440;
    if (!qword_10001E440)
    {
      if (qword_10001C0B8 != -1) {
        dispatch_once(&qword_10001C0B8, &stru_100018E18);
      }
      LODWORD(v77[0]) = 1;
      if (dword_10001C028 < 0 || (uint32_t v30 = notify_check(dword_10001C028, (int *)v77), v30 | LODWORD(v77[0])))
      {
        uint64_t v20 = &qword_10001C0C0;
        if (gethostname((char *)&qword_10001C0C0, 0x100uLL) < 0)
        {
          strcpy((char *)&qword_10001C0C0, "localhost");
        }

        else
        {
          int v32 = strchr((const char *)&qword_10001C0C0, 46);
          if (v32) {
            *int v32 = 0;
          }
        }
      }

      else
      {
        uint64_t v20 = &qword_10001C0C0;
      }
    }

    asl_msg_set_key_val(v2, "Host", v20);
  }

  uint64_t v71 = v4;
  uint64_t v21 = (const char *)asl_msg_get_val_for_key(v2, "UID");
  if (!v21)
  {
LABEL_48:
    asl_msg_set_key_val(v2, "UID", "-2");
    int v23 = -2;
    goto LABEL_49;
  }

  uint64_t v22 = v21;
  int v23 = atoi(v21);
  if (!v23)
  {
    if (!strcmp(v22, "0"))
    {
      int v23 = 0;
      goto LABEL_49;
    }

    goto LABEL_48;
  }

LABEL_49:
  uint64_t v24 = (const char *)asl_msg_get_val_for_key(v2, "GID");
  if (!v24) {
    goto LABEL_52;
  }
  unint64_t v25 = v24;
  int v26 = atoi(v24);
  if (v26) {
    goto LABEL_53;
  }
  if (!strcmp(v25, "0"))
  {
    int v26 = 0;
  }

  else
  {
LABEL_52:
    asl_msg_set_key_val(v2, "GID", "-2");
    int v26 = -2;
  }

LABEL_53:
  if ((v3 - 5) >= 2)
  {
    if (v3 == 4 || v3 == 1)
    {
      char v27 = "0";
      asl_msg_set_key_val(v2, "UID", "0");
      int v23 = 0;
LABEL_57:
      asl_msg_set_key_val(v2, "GID", v27);
      goto LABEL_58;
    }

    if (!v23)
    {
      asl_msg_set_key_val(v2, "UID", "-2");
      int v23 = -2;
    }

    char v27 = "-2";
    if (v26 == 80 || !v26) {
      goto LABEL_57;
    }
  }

LABEL_58:
  if (!v9)
  {
    uint64_t v9 = (const char *)asl_msg_get_val_for_key(v2, "Sender");
    if (!v9)
    {
      if (v3 == 4)
      {
        int v31 = "kernel";
      }

      else
      {
        if (v3 != 1)
        {
LABEL_80:
          uint64_t v9 = 0LL;
          int v31 = "Unknown";
LABEL_88:
          asl_msg_set_key_val(v2, "Sender", v31);
          goto LABEL_89;
        }

        int v31 = "syslogd";
      }

      uint64_t v9 = v31;
      goto LABEL_88;
    }
  }

  if (v3 != 4 && v23 && !strcmp(v9, "kernel")) {
    goto LABEL_80;
  }
LABEL_89:
  uint64_t v33 = asl_msg_get_val_for_key(v2, "Facility");
  if (!v33)
  {
    if (v3 == 4) {
      unsigned int v34 = "kern";
    }
    else {
      unsigned int v34 = "user";
    }
LABEL_102:
    uint64_t v39 = v2;
    uint64_t v38 = v34;
    goto LABEL_103;
  }

  unsigned int v34 = (const char *)v33;
  if (*(_BYTE *)v33 == 35)
  {
    unsigned int v35 = (const char *)(v33 + 1);
    if (*(unsigned __int8 *)(v33 + 1) - 48 > 9)
    {
      uint64_t v36 = 8LL;
    }

    else
    {
      uint64_t v36 = (8 * atoi(v35));
      if (!(_DWORD)v36) {
        uint64_t v36 = 8 * (strcmp(v35, "0") != 0);
      }
    }

    unsigned int v34 = (const char *)asl_syslog_faciliy_num_to_name(v36);
    goto LABEL_102;
  }

  int v37 = strncmp((const char *)v33, "com.apple.system", 0x10uLL);
  if (v23 && !v37)
  {
    uint64_t v38 = "user";
    uint64_t v39 = v2;
LABEL_103:
    asl_msg_set_key_val(v39, "Facility", v38);
  }

  if (v3 == 4)
  {
    asl_msg_set_key_val(v2, "ReadUID", "0");
LABEL_107:
    asl_msg_set_key_val(v2, "ReadGID", "80");
    goto LABEL_108;
  }

  uint64_t v40 = asl_msg_get_val_for_key(v2, "ReadUID");
  if (!(v40 | asl_msg_get_val_for_key(v2, "ReadGID"))) {
    goto LABEL_107;
  }
LABEL_108:
  if (!strcmp(v34, "com.apple.system.utmpx") || !strcmp(v34, "com.apple.system.lastlog"))
  {
    snprintf(__str, 0x40uLL, "%llu", (void)xmmword_10001E470 + v19);
    asl_msg_set_key_val(v2, "ASLExpireTime", __str);
  }

  if (v3 == 4 && v11 <= 3)
  {
    sub_1000085BC(v2);
    goto LABEL_116;
  }

  if (v3 != 1)
  {
    unsigned int v11 = -1;
LABEL_116:
    __s1 = (char *)v9;
    if (*((void *)&xmmword_10001E470 + 1))
    {
      uint64_t v41 = (unsigned int *)xmmword_10001E428;
      if (v71 - qword_10001E420 >= *((uint64_t *)&xmmword_10001E470 + 1) && (void)xmmword_10001E428)
      {
        uint64_t v42 = asl_msg_new(0LL);
        uint64_t v43 = v42;
        if (v42)
        {
          unsigned int v69 = v11;
          asl_msg_set_key_val(v42, "Message", "ASL Sender Statistics");
          asl_msg_set_key_val(v43, "Sender", "syslogd");
          asl_msg_set_key_val(v43, "Facility", "com.apple.asl.statistics");
          snprintf((char *)v77, 0x40uLL, "%d", dword_10001E37C);
          asl_msg_set_key_val(v43, "PID", v77);
          snprintf((char *)v77, 0x40uLL, "%d", 5);
          asl_msg_set_key_val(v43, "Level", v77);
          snprintf((char *)v77, 0x40uLL, "%u", *v41);
          asl_msg_set_key_val(v43, "MsgCount", v77);
          snprintf((char *)v77, 0x40uLL, "%u", v41[1]);
          asl_msg_set_key_val(v43, "ShimCount", v77);
          unint64_t v44 = v41[2];
          if ((_DWORD)v44)
          {
            for (unint64_t i = 0LL; i < v44; ++i)
            {
              uint64_t v46 = *(void ***)(*((void *)v41 + 2) + 8 * i);
              if (v46)
              {
                do
                {
                  uint64_t v72 = 0LL;
                  size_t v47 = (void **)v46[3];
                  snprintf(v76, 0x40uLL, "%llu %llu", v46[1], v46[2]);
                  asprintf(&v72, "*%s", (const char *)*v46);
                  if (v72)
                  {
                    asl_msg_set_key_val(v43, v72, v76);
                    uint64_t v48 = v72;
                  }

                  else
                  {
                    uint64_t v48 = 0LL;
                  }

                  free(v48);
                  free(*v46);
                  free(v46);
                  uint64_t v46 = v47;
                }

                while (v47);
                unint64_t v44 = v41[2];
              }
            }
          }

          free(*((void **)v41 + 2));
          free(v41);
          unsigned int v11 = v69;
        }

        sub_1000062A4(v43, 1LL);
        qword_10001E420 = v71;
        *(void *)&xmmword_10001E428 = 0LL;
        goto LABEL_133;
      }
    }

    else
    {
      uint64_t v41 = (unsigned int *)xmmword_10001E428;
    }

    if (v41)
    {
LABEL_138:
      uint64_t v52 = 0LL;
      uint64_t v53 = v2;
      do
      {
        uint64_t v54 = *(void *)(v53 + 16);
        uint64_t v53 = *(void *)(v53 + 24);
        v52 += v54;
      }

      while (v53);
      uint64_t v55 = asl_msg_get_val_for_key(v2, "ASLSHIM");
      uint64_t v56 = xmmword_10001E428;
      ++*(_DWORD *)xmmword_10001E428;
      if (v55) {
        ++*(_DWORD *)(v56 + 4);
      }
      sub_100007880(v56, "*", v52);
      sub_100007880(xmmword_10001E428, __s1, v52);
      if (*(_DWORD *)(a1 + 56) == 4 && (v11 & 0x80000000) == 0)
      {
        uint64_t v57 = off_100018D98[v11];
        if ((dword_10001C008[v11] & 0x80000000) != 0)
        {
          int v58 = notify_register_plain(off_100018D98[v11]);
          if (v58) {
            sub_1000064BC("notify_register_plain(%s) failed status %u\n", v59, v60, v61, v62, v63, v64, v65, v58);
          }
        }

        notify_post(v57);
      }

      goto LABEL_148;
    }

LABEL_133:
    char v49 = malloc(0x18uLL);
    uint64_t v50 = v49;
    if (v49)
    {
      *((_DWORD *)v49 + 2) = 256;
      int v51 = calloc(0x100uLL, 8uLL);
      v50[2] = v51;
      if (v51)
      {
        *uint64_t v50 = 0LL;
      }

      else
      {
        free(v50);
        uint64_t v50 = 0LL;
      }
    }

    *(void *)&xmmword_10001E428 = v50;
    goto LABEL_138;
  }

LABEL_148:
  if (!v23)
  {
    if (*(_BYTE *)(a1 + 60))
    {
      uint64_t v67 = (const char *)asl_msg_get_val_for_key(*(void *)(a1 + 32), "Message");
      if (v67)
      {
        int v68 = (char *)v67;
        if (!strncmp(v67, "= reset", 7uLL))
        {
          sub_100005BE4();
          sub_100001F6C();
        }

        else
        {
          if (!strncmp(v68, "= crash", 7uLL)) {
            abort();
          }
          if (!strncmp(v68, "@ ", 2uLL))
          {
            sub_100001FF8((unsigned __int8 *)v68);
          }

          else if (!strncmp(v68, "= ", 2uLL))
          {
            sub_100005CE0((unsigned __int8 *)v68, 1);
          }
        }
      }
    }
  }

  sub_1000013CC(*(void *)(a1 + 32), *(void *)(a1 + 40));
LABEL_150:
  asl_msg_release(*(void *)(a1 + 32));
  do
    unsigned int v66 = __ldxr((unsigned int *)&dword_10001E380);
  while (__stxr(v66 - 1, (unsigned int *)&dword_10001E380));
  os_release(*(void **)(a1 + 48));
}

uint64_t sub_100007114(uint64_t a1)
{
  if (!a1) {
    return 1LL;
  }
  uint64_t v1 = asl_msg_from_string(a1);
  if (!v1) {
    return 1LL;
  }
  sub_1000062A4(v1, 1);
  return 0LL;
}

void sub_10000714C()
{
  uint64_t v0 = 0LL;
  asprintf( &v0,  "[Sender syslogd] [Level 6] [PID %u] [Message -- MARK --] [UID 0] [UID 0] [Facility syslog]",  dword_10001E37C);
  sub_100007114((uint64_t)v0);
  free(v0);
}

char *sub_100007198(uint64_t a1, int a2, const char *a3, int a4)
{
  time_t v4 = 0LL;
  if (!a1 || a2 < 1) {
    return v4;
  }
  uint64_t v9 = 0LL;
  if (a4 == 4) {
    int v10 = 5;
  }
  else {
    int v10 = 7;
  }
  uint64_t v50 = 0LL;
  while (1)
  {
    int v11 = *(unsigned __int8 *)(a1 + v9);
    if (v11 != 9 && v11 != 32) {
      break;
    }
    if (a2 == (_DWORD)++v9) {
      return 0LL;
    }
  }

  if (v11 == 60)
  {
    uint64_t v12 = a1 + v9;
    uint64_t v13 = a1 + v9 + 1;
    else {
      uint64_t v47 = 0LL;
    }
    int v14 = v9 + 1;
    if ((int)v9 + 1 < a2)
    {
      if (*(_BYTE *)v13 == 62)
      {
LABEL_22:
        uint64_t v13 = v12 + 2;
        int v14 = v9 + 2;
      }

      else
      {
        while (1)
        {
          uint64_t v15 = a1 + v9;
          if (a2 - 2 == (_DWORD)v9) {
            break;
          }
          ++v9;
          if (*(_BYTE *)(v15 + 2) == 62)
          {
            uint64_t v12 = a1 + v9;
            goto LABEL_22;
          }
        }

        uint64_t v13 = v15 + 2;
        int v14 = a2;
      }
    }
  }

  else
  {
    uint64_t v47 = 0LL;
    uint64_t v13 = a1 + v9;
    int v14 = v9;
  }

  snprintf(__str, 8uLL, "%d", v10);
  if (a2 - v14 >= 16 && *(_BYTE *)(v13 + 9) == 58 && *(_BYTE *)(v13 + 12) == 58 && *(_BYTE *)(v13 + 15) == 32)
  {
    int v16 = (char *)malloc(0x10uLL);
    time_t v4 = v16;
    if (!v16) {
      return v4;
    }
    *(void *)int v16 = *(void *)v13;
    *(void *)(v16 + 7) = *(void *)(v13 + 7);
    v16[15] = 0;
    time_t v48 = asl_core_parse_time(v16, 0LL);
    if (v48 == -1)
    {
      uint64_t v50 = v4;
    }

    else
    {
      free(v4);
      gmtime_r(&v48, &v49);
      asprintf( &v50,  "%d.%02d.%02d %02d:%02d:%02d UTC",  v49.tm_year + 1900,  v49.tm_mon + 1,  v49.tm_mday,  v49.tm_hour,  v49.tm_min,  v49.tm_sec);
    }

    v13 += 16LL;
    v14 += 16;
  }

  if (a4 == 4)
  {
    uint64_t v17 = asl_msg_new(0LL);
    time_t v4 = (char *)v17;
    if (v17)
    {
      asl_msg_set_key_val(v17, "Message", v13);
      asl_msg_set_key_val(v4, "Level", __str);
      uint64_t v18 = "PID";
      time_t v19 = "0";
      uint64_t v20 = v4;
LABEL_36:
      asl_msg_set_key_val(v20, v18, v19);
      return v4;
    }

    return v4;
  }

  if (a4 == 3 && (uint64_t v21 = strchr((const char *)v13, 32)) != 0LL)
  {
    uint64_t v22 = v21;
    int v23 = (_DWORD)v21 - v13;
    int v24 = (_DWORD)v21 - v13 + 1;
    unint64_t v25 = malloc(v24);
    if (!v25) {
      return 0LL;
    }
    int v26 = v25;
    memcpy(v25, (const void *)v13, v23);
    v26[v23] = 0;
    uint64_t v13 = (uint64_t)(v22 + 1);
    v14 += v24;
  }

  else
  {
    int v26 = 0LL;
  }

  char v27 = strchr((const char *)v13, 58);
  uint64_t v28 = strchr((const char *)v13, 91);
  if (v27)
  {
    unint64_t v29 = v28;
    if (v28 && v28 < v27 && *(v27 - 1) == 93)
    {
      uint64_t v30 = ((_DWORD)v28 - v13);
      int v31 = malloc(((uint64_t)&_mh_execute_header + (v30 << 32)) >> 32);
      if (!v31) {
        return 0LL;
      }
      int v32 = v31;
      memcpy(v31, (const void *)v13, (int)v30);
      v32[(int)v30] = 0;
      uint64_t v33 = v29 + 1;
      unsigned int v34 = malloc((int)v27 - ((int)v29 + 1));
      if (!v34) {
        return 0LL;
      }
      unsigned int v35 = v34;
      int v36 = ~(_DWORD)v33 + (_DWORD)v27;
      memcpy(v34, v33, v36);
      v35[v36] = 0;
      int v37 = (_DWORD)v27 - v13;
    }

    else
    {
      int v37 = (_DWORD)v27 - v13;
      uint64_t v38 = malloc(((uint64_t)&_mh_execute_header + ((void)&v27[-v13] << 32)) >> 32);
      if (!v38) {
        return 0LL;
      }
      int v32 = v38;
      memcpy(v38, (const void *)v13, v37);
      unsigned int v35 = 0LL;
      v32[v37] = 0;
    }

    uint64_t v13 = (uint64_t)(v27 + 1);
    v14 += v37 + 1;
  }

  else
  {
    int v32 = 0LL;
    unsigned int v35 = 0LL;
  }

  if (*(_BYTE *)v13 == 32) {
    uint64_t v39 = (const void *)(v13 + 1);
  }
  else {
    uint64_t v39 = (const void *)v13;
  }
  size_t v40 = a2 - v14 - (*(_BYTE *)v13 == 32);
  if ((int)v40 >= 1)
  {
    uint64_t v41 = malloc((v40 + 1));
    if (v41)
    {
      uint64_t v42 = v41;
      memcpy(v41, v39, v40);
      v42[v40] = 0;
      goto LABEL_60;
    }

    return 0LL;
  }

  uint64_t v42 = 0LL;
LABEL_60:
  uint64_t v43 = v47;
  if (!v47) {
    uint64_t v43 = asl_syslog_faciliy_num_to_name(8LL);
  }
  uint64_t v44 = asl_msg_new(0LL);
  time_t v4 = (char *)v44;
  if (v44)
  {
    if (v50)
    {
      asl_msg_set_key_val(v44, "Time", v50);
      free(v50);
    }

    if (v43) {
      uint64_t v45 = (const char *)v43;
    }
    else {
      uint64_t v45 = "user";
    }
    asl_msg_set_key_val(v4, "Facility", v45);
    if (v32)
    {
      asl_msg_set_key_val(v4, "Sender", v32);
      free(v32);
    }

    if (v35)
    {
      asl_msg_set_key_val(v4, "PID", v35);
      free(v35);
    }

    else
    {
      asl_msg_set_key_val(v4, "PID", "-1");
    }

    if (v42)
    {
      asl_msg_set_key_val(v4, "Message", v42);
      free(v42);
    }

    asl_msg_set_key_val(v4, "Level", __str);
    asl_msg_set_key_val(v4, "UID", "-2");
    asl_msg_set_key_val(v4, "GID", "-2");
    if (v26)
    {
      asl_msg_set_key_val(v4, "Host", v26);
      free(v26);
      return v4;
    }

    if (!a3) {
      return v4;
    }
    uint64_t v18 = "Host";
    uint64_t v20 = v4;
    time_t v19 = a3;
    goto LABEL_36;
  }

  return v4;
}

char *sub_100007740( uint64_t a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a4;
  int v10 = a2;
  uint64_t v11 = a1;
  uint64_t v12 = "NULL";
  if (a1) {
    LOBYTE(v12) = a1;
  }
  sub_1000064BC("asl_input_parse: %s\n", a2, (uint64_t)a3, a4, a5, a6, a7, a8, (char)v12);
  if (v11)
  {
    if (!v10) {
      int v10 = strlen((const char *)v11);
    }
    BOOL v13 = *(_BYTE *)v11 == 60 || v10 < 12;
    if (!v13 && sscanf((const char *)v11, "%d ", &v17) == 1 && *(_BYTE *)(v11 + 10) == 32 && *(_BYTE *)(v11 + 11) == 91)
    {
      uint64_t v14 = 11LL;
      if (*(_BYTE *)v11 == 91) {
        uint64_t v14 = 0LL;
      }
      uint64_t v15 = asl_msg_from_string(v11 + v14);
      uint64_t v11 = v15;
      if (v15 && a3) {
        asl_msg_set_key_val(v15, "Host", a3);
      }
    }

    else
    {
      return sub_100007198(v11, v10, a3, v8);
    }
  }

  return (char *)v11;
}

void sub_10000784C(id a1)
{
}

void sub_100007880(uint64_t a1, char *__s1, uint64_t a3)
{
  if (a1 && __s1)
  {
    char v5 = *__s1;
    if (*__s1)
    {
      unsigned __int8 v6 = 0;
      uint64_t v7 = __s1 + 1;
      do
      {
        v6 ^= v5 ^ (2 * v6);
        int v8 = *v7++;
        char v5 = v8;
      }

      while (v8);
      uint64_t v9 = v6;
    }

    else
    {
      uint64_t v9 = 0LL;
    }

    uint64_t v10 = *(void *)(a1 + 16);
    uint64_t v11 = *(void *)(v10 + 8 * v9);
    if (v11)
    {
      uint64_t v12 = *(void *)(v10 + 8 * v9);
      while (!*(void *)v12 || strcmp(__s1, *(const char **)v12))
      {
        uint64_t v12 = *(void *)(v12 + 24);
        if (!v12) {
          goto LABEL_13;
        }
      }

      uint64_t v15 = *(void *)(v12 + 16) + a3;
      ++*(void *)(v12 + 8);
      *(void *)(v12 + 16) = v15;
    }

    else
    {
LABEL_13:
      BOOL v13 = malloc(0x20uLL);
      uint64_t v14 = strdup(__s1);
      *BOOL v13 = v14;
      if (v14)
      {
        v13[1] = 1LL;
        v13[2] = a3;
        v13[3] = v11;
        *(void *)(v10 + 8 * v9) = v13;
      }

      else
      {
        free(v13);
      }
    }
  }

void sub_100007968(int a1)
{
  if (qword_10001C1C8 != -1) {
    dispatch_once(&qword_10001C1C8, &stru_100018E58);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_100007A1C;
  block[3] = &unk_100018E78;
  int v3 = a1;
  dispatch_async((dispatch_queue_t)qword_10001C1D0, block);
}

void sub_1000079F4(id a1)
{
  qword_10001C1D0 = (uint64_t)dispatch_queue_create("Direct Watch Queue", 0LL);
}

uint64_t sub_100007A1C(uint64_t a1)
{
  if (DWORD2(xmmword_10001E368))
  {
    uint64_t v2 = (void *)xmmword_10001E368;
  }

  else
  {
    uint64_t v2 = 0LL;
    *(void *)&xmmword_10001E368 = 0LL;
  }

  uint64_t result = (uint64_t)reallocf(v2, 4LL * (DWORD2(xmmword_10001E368) + 1));
  *(void *)&xmmword_10001E368 = result;
  if (result)
  {
    int v11 = DWORD2(xmmword_10001E368) + 1;
    *(_DWORD *)(result + 4LL * SDWORD2(xmmword_10001E368)) = *(_DWORD *)(a1 + 32);
  }

  else
  {
    uint64_t result = sub_1000064BC("add_lockdown_session: realloc failed\n", v4, v5, v6, v7, v8, v9, v10, v12);
    int v11 = 0;
  }

  DWORD2(xmmword_10001E368) = v11;
  HIDWORD(xmmword_10001E368) = v11 + dword_10001C1D8;
  return result;
}

void sub_100007AA0(int a1)
{
  if (qword_10001C1C8 != -1) {
    dispatch_once(&qword_10001C1C8, &stru_100018EB8);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_100007B54;
  block[3] = &unk_100018ED8;
  int v3 = a1;
  dispatch_async((dispatch_queue_t)qword_10001C1D0, block);
}

void sub_100007B2C(id a1)
{
  qword_10001C1D0 = (uint64_t)dispatch_queue_create("Direct Watch Queue", 0LL);
}

void sub_100007B54(uint64_t a1)
{
  int v1 = DWORD2(xmmword_10001E368);
  if (SDWORD2(xmmword_10001E368) < 1) {
    goto LABEL_11;
  }
  uint64_t v2 = 0LL;
  int v3 = 0;
  uint64_t v4 = xmmword_10001E368;
  do
  {
    int v5 = *(_DWORD *)(v4 + 4 * v2);
    if (v5 != *(_DWORD *)(a1 + 32))
    {
      if (v2 != v3)
      {
        *(_DWORD *)(v4 + 4LL * v3) = v5;
        int v1 = DWORD2(xmmword_10001E368);
      }

      ++v3;
    }

    ++v2;
  }

  while (v2 < v1);
  if (v3)
  {
    *(void *)&xmmword_10001E368 = reallocf((void *)xmmword_10001E368, 4LL * v3);
    if (!(void)xmmword_10001E368)
    {
      sub_1000064BC("remove_lockdown_session: realloc failed\n", v6, v7, v8, v9, v10, v11, v12, v13);
      int v3 = 0;
    }
  }

  else
  {
LABEL_11:
    free((void *)xmmword_10001E368);
    int v3 = 0;
    *(void *)&xmmword_10001E368 = 0LL;
  }

  DWORD2(xmmword_10001E368) = v3;
  HIDWORD(xmmword_10001E368) = v3 + dword_10001C1D8;
}

void sub_100007C08(uint64_t a1)
{
  if (qword_10001C1C8 != -1) {
    dispatch_once(&qword_10001C1C8, &stru_100018F18);
  }
  asl_msg_retain(a1);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_100007CC4;
  block[3] = &unk_100018F38;
  void block[4] = a1;
  dispatch_async((dispatch_queue_t)qword_10001C1D0, block);
}

void sub_100007C9C(id a1)
{
  qword_10001C1D0 = (uint64_t)dispatch_queue_create("Direct Watch Queue", 0LL);
}

uint64_t sub_100007CC4(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = *(void *)(a1 + 32);
  if (SDWORD2(xmmword_10001E368) < 1) {
    goto LABEL_31;
  }
  if (HIDWORD(qword_10001E458) && !gettimeofday(&v70, 0LL))
  {
    if ((void)xmmword_10001C1F8)
    {
      __darwin_time_t tv_sec = v70.tv_sec;
      if (v70.tv_sec <= (uint64_t)xmmword_10001C1F8)
      {
        __darwin_suseconds_t tv_usec = v70.tv_usec;
      }

      else
      {
        __darwin_time_t tv_sec = --v70.tv_sec;
        __darwin_suseconds_t tv_usec = v70.tv_usec + 1000000;
        v70.tv_usec += 1000000;
      }

      unint64_t v5 = 1000000 * (tv_sec - xmmword_10001C1F8) - SDWORD2(xmmword_10001C1F8) + tv_usec;
      if (v5 < HIDWORD(qword_10001E458)) {
        usleep(v5);
      }
    }

    else
    {
      __darwin_suseconds_t tv_usec = v70.tv_usec;
    }

    if (tv_usec > 999999)
    {
      ++v70.tv_sec;
      v70.__darwin_suseconds_t tv_usec = tv_usec - 1000000;
    }

    xmmword_10001C1F8 = (__int128)v70;
  }

  uint64_t v6 = (void *)asl_format_message(v2, "std", "lcl", 1LL, &__nbyte);
  uint64_t v7 = v6;
  if (!DWORD2(xmmword_10001E368))
  {
    free(v6);
LABEL_31:
    int v31 = dword_10001C1D8;
    goto LABEL_34;
  }

  unint64_t v8 = 0LL;
  int v9 = 0;
  do
  {
    if (write(*(_DWORD *)(xmmword_10001E368 + 4 * v8), v7, __nbyte) < 0)
    {
      int v10 = *(_DWORD *)(xmmword_10001E368 + 4 * v8);
      __error();
      uint64_t v11 = __error();
      strerror(*v11);
      sub_1000064BC("send_to_direct_watchers: lockdown %d write error: %d %s\n", v12, v13, v14, v15, v16, v17, v18, v10);
      close(*(_DWORD *)(xmmword_10001E368 + 4 * v8));
      *(_DWORD *)(xmmword_10001E368 + 4 * sub_10000520C(v1, v2, v3, v4, v5, v6, v7, v8) = -1;
      int v9 = 1;
    }

    ++v8;
  }

  while (v8 < DWORD2(xmmword_10001E368));
  free(v7);
  if (!v9) {
    goto LABEL_31;
  }
  int v19 = DWORD2(xmmword_10001E368);
  uint64_t v20 = (_DWORD *)xmmword_10001E368;
  if (SDWORD2(xmmword_10001E368) < 1) {
    goto LABEL_32;
  }
  uint64_t v21 = 0LL;
  int v22 = 0;
  do
  {
    int v23 = v20[v21];
    if ((v23 & 0x80000000) == 0)
    {
      if (v21 != v22)
      {
        v20[v22] = v23;
        int v19 = DWORD2(xmmword_10001E368);
      }

      ++v22;
    }

    ++v21;
  }

  while (v21 < v19);
  if (v22)
  {
    *(void *)&xmmword_10001E368 = reallocf(v20, 4LL * v22);
    if (!(void)xmmword_10001E368)
    {
      sub_1000064BC("sweep_lockdown_session_fds: realloc failed\n", v24, v25, v26, v27, v28, v29, v30, v66);
      int v22 = 0;
    }
  }

  else
  {
LABEL_32:
    free(v20);
    int v22 = 0;
    *(void *)&xmmword_10001E368 = 0LL;
  }

  int v31 = dword_10001C1D8;
  DWORD2(xmmword_10001E368) = v22;
  HIDWORD(xmmword_10001E368) = dword_10001C1D8 + v22;
LABEL_34:
  if (!v31)
  {
    qword_10001C208 = 0LL;
    return asl_msg_release(*(void *)(v1 + 32));
  }

  if (!qword_10001C208)
  {
    dword_10001C1D8 = 0;
    return asl_msg_release(*(void *)(v1 + 32));
  }

  unsigned int v69 = (char *)asl_msg_to_string(v2, &__nbyte);
  if (v69)
  {
    LODWORD(v70.tv_sec) = bswap32(__nbyte);
    int v32 = &dword_10001C000;
    if (!dword_10001C1D8)
    {
      free(v69);
      return asl_msg_release(*(void *)(v1 + 32));
    }

    uint64_t v68 = v1;
    unint64_t v33 = 0LL;
    int v34 = 0;
    do
    {
      if ((unint64_t)send(*(_DWORD *)(qword_10001C208 + 4 * v33), &v70, 4uLL, 0) >= 4)
      {
        if ((_DWORD)__nbyte)
        {
          unsigned int v35 = v32;
          unsigned int v36 = 0;
          unsigned int v37 = 0;
          while (2)
          {
            if (v36 <= 0x65) {
              int v38 = 101;
            }
            else {
              int v38 = v36;
            }
            int v39 = v38 + 1;
            while (1)
            {
              *__error() = 0;
              ssize_t v40 = send(*(_DWORD *)(qword_10001C208 + 4 * v33), &v69[v37], __nbyte - v37, 0);
              char v41 = v40;
              if (v40 > 0) {
                break;
              }
              __error();
              sub_1000064BC( "send_to_direct_watchers: send returned %d (errno %d)\n",  v42,  v43,  v44,  v45,  v46,  v47,  v48,  v41);
              if (*__error() != 35)
              {
                close(*(_DWORD *)(qword_10001C208 + 4 * v33));
                *(_DWORD *)(qword_10001C208 + 4 * v33) = -1;
                int v34 = 1;
                int v32 = v35;
                goto LABEL_57;
              }

              if (v39 == ++v36)
              {
                sub_1000064BC( "send_to_direct_watchers: exceeded EAGAIN limit - closing connection\n",  v49,  v50,  v51,  v52,  v53,  v54,  v55,  v67);
                goto LABEL_56;
              }

              *__error() = 0;
            }

            v37 += v40;
            break;
          }

LABEL_56:
          int v32 = v35;
        }
      }

      else
      {
        close(*(_DWORD *)(qword_10001C208 + 4 * v33));
        *(_DWORD *)(qword_10001C208 + 4 * v33) = -1;
        int v34 = 1;
      }

void sub_1000081B4(uint64_t a1)
{
  if (qword_10001C1E8 != -1) {
    dispatch_once(&qword_10001C1E8, &stru_100018F78);
  }
  sub_100007C08(a1);
  int v2 = xmmword_10001E448;
  LODWORD(v3) = v2 | (asl_check_option(a1, "asl_db_file") != 0);
  uint64_t v4 = v3 | 2;
  else {
    uint64_t v3 = v3;
  }
  sub_100008444(v3);
  if ((v3 & 1) != 0)
  {
    if (asl_store_save(xmmword_10001E3E8, a1))
    {
      char v5 = asl_core_error();
      sub_1000064BC("asl_store_save: %s\n", v6, v7, v8, v9, v10, v11, v12, v5);
      asl_store_release(xmmword_10001E3E8);
      *(void *)&xmmword_10001E3E8 = 0LL;
      sub_100008444(v3);
      if (asl_store_save(xmmword_10001E3E8, a1))
      {
        char v13 = asl_core_error();
        sub_1000064BC("(retry) asl_store_save: %s\n", v14, v15, v16, v17, v18, v19, v20, v13);
        asl_store_release(xmmword_10001E3E8);
        *(void *)&xmmword_10001E3E8 = 0LL;
        LODWORD(xmmword_10001E448) = xmmword_10001E448 | 2;
        if (!*((void *)&xmmword_10001E3E8 + 1)
          && asl_memory_open( DWORD2(xmmword_10001E448),  HIDWORD(xmmword_10001E448),  (void *)&xmmword_10001E3E8 + 1))
        {
          char v21 = asl_core_error();
          sub_1000064BC("asl_memory_open: %s\n", v22, v23, v24, v25, v26, v27, v28, v21);
        }

        uint64_t v3 = v4;
      }
    }
  }

  if ((v3 & 2) != 0)
  {
    uint64_t v47 = 0LL;
    if (asl_memory_save(*((uint64_t *)&xmmword_10001E3E8 + 1), a1, (uint64_t)&v47))
    {
      char v29 = asl_core_error();
      sub_1000064BC("asl_memory_save: %s\n", v30, v31, v32, v33, v34, v35, v36, v29);
      asl_memory_close(*((dispatch_object_t **)&xmmword_10001E3E8 + 1));
      *((void *)&xmmword_10001E3E8 + 1) = 0LL;
      sub_100008444(v3);
      uint64_t v47 = 0LL;
      if (asl_memory_save(*((uint64_t *)&xmmword_10001E3E8 + 1), a1, (uint64_t)&v47))
      {
        char v37 = asl_core_error();
        sub_1000064BC("(retry) asl_memory_save: %s\n", v38, v39, v40, v41, v42, v43, v44, v37);
        asl_memory_close(*((dispatch_object_t **)&xmmword_10001E3E8 + 1));
        *((void *)&xmmword_10001E3E8 + 1) = 0LL;
      }
    }
  }

  if ((byte_10001C1DC & 1) == 0)
  {
    byte_10001C1DC = 1;
    uint64_t v45 = (dispatch_source_s *)qword_10001C1E0;
    dispatch_time_t v46 = dispatch_time(0LL, 500000000LL);
    dispatch_source_set_timer(v45, v46, 0xFFFFFFFFFFFFFFFFLL, 0LL);
    dispatch_resume((dispatch_object_t)qword_10001C1E0);
  }

void sub_1000083CC(id a1)
{
  qword_10001C1E0 = (uint64_t)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  &_dispatch_main_q);
  dispatch_source_set_event_handler((dispatch_source_t)qword_10001C1E0, &stru_100018FB8);
  byte_10001C1DC = 0;
}

void sub_100008414(id a1)
{
  byte_10001C1DC = 0;
}

uint64_t sub_100008444(uint64_t result)
{
  char v1 = result;
  if ((result & 1) == 0 || (void)xmmword_10001E3E8)
  {
LABEL_10:
    if ((v1 & 2) == 0) {
      return result;
    }
    goto LABEL_11;
  }

  memset(&v48, 0, sizeof(v48));
  int v2 = (const char *)asl_filesystem_path(0LL);
  if (stat(v2, &v48))
  {
    int v3 = *__error();
    uint64_t v4 = (const char *)asl_filesystem_path(0LL);
    char v5 = (char)v4;
    if (v3 != 2)
    {
      uint64_t v31 = __error();
      strerror(*v31);
      return sub_1000064BC("error: can't stat data store %s: %s\n", v32, v33, v34, v35, v36, v37, v38, v5);
    }

    if (mkdir(v4, 0x1EDu))
    {
      char v6 = asl_filesystem_path(0LL);
      uint64_t v7 = __error();
      strerror(*v7);
      return sub_1000064BC("error: can't create data store %s: %s\n", v8, v9, v10, v11, v12, v13, v14, v6);
    }
  }

  else if ((v48.st_mode & 0xF000) != 0x4000)
  {
    char v47 = asl_filesystem_path(0LL);
    return sub_1000064BC("error: %s is not a directory", v39, v40, v41, v42, v43, v44, v45, v47);
  }

  uint64_t v15 = asl_store_open_write(0LL, &xmmword_10001E3E8);
  if ((_DWORD)v15)
  {
    char v16 = asl_core_error();
    uint64_t result = sub_1000064BC("asl_store_open_write: %s\n", v17, v18, v19, v20, v21, v22, v23, v16);
    goto LABEL_10;
  }

  if (DWORD1(xmmword_10001E448)) {
    uint64_t v15 = asl_store_max_file_size(xmmword_10001E3E8);
  }
  uint64_t result = asl_trigger_aslmanager(v15);
  if ((v1 & 2) != 0)
  {
LABEL_11:
    if (!*((void *)&xmmword_10001E3E8 + 1))
    {
      uint64_t result = asl_memory_open(DWORD2(xmmword_10001E448), HIDWORD(xmmword_10001E448), (void *)&xmmword_10001E3E8 + 1);
      if ((_DWORD)result)
      {
        char v46 = asl_core_error();
        return sub_1000064BC("asl_memory_open: %s\n", v24, v25, v26, v27, v28, v29, v30, v46);
      }
    }
  }

  return result;
}

uint64_t sub_1000085BC(uint64_t result)
{
  uint64_t v11 = 0LL;
  if ((xmmword_10001E448 & 2) == 0 && !*((void *)&xmmword_10001E3E8 + 1))
  {
    uint64_t v1 = result;
    uint64_t v2 = asl_memory_open(DWORD2(xmmword_10001E448), HIDWORD(xmmword_10001E448), (void *)&xmmword_10001E3E8 + 1);
    if ((_DWORD)v2)
    {
      char v3 = asl_core_error(v2);
      return sub_1000064BC("asl_memory_open: %s\n", v4, v5, v6, v7, v8, v9, v10, v3);
    }

    else
    {
      return asl_memory_save(*((uint64_t *)&xmmword_10001E3E8 + 1), v1, (uint64_t)&v11);
    }
  }

  return result;
}

uint64_t sub_100008638( uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, int a6, uint64_t a7, int a8, int a9, int a10)
{
  if (a4 == -1) {
    return 2 * (xmmword_10001E448 & 1);
  }
  if (a10)
  {
    uuid_clear(uu);
    if (proc_pidinfo(a10, 17, 1uLL, uu, 56) == 56)
    {
      uint64_t v18 = out;
      uuid_unparse(uu, out);
    }

    else
    {
      uint64_t v18 = "NO ACCESS";
    }
  }

  else
  {
    uint64_t v18 = 0LL;
  }

  if (xmmword_10001E448 & 2 | dword_10001E350) {
    return asl_memory_match_restricted_uuid( *((uint64_t *)&xmmword_10001E3E8 + 1),  a1,  a2,  a7,  a3,  a4,  a5,  a6,  a8,  a9,  (uint64_t)v18);
  }
  else {
    return 9999LL;
  }
}

void sub_100008788()
{
  mach_msg_return_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  mach_msg_id_t msgh_id;
  mach_msg_return_t v14;
  void v15[5];
  void block[6];
  char __str[264];
  unint64_t v0 = 0LL;
  uint64_t v1 = &dword_100018FE0;
  do
  {
    else {
      int v2 = 0;
    }
    if (v0 > 4) {
      break;
    }
    ++v0;
    v1 += 4;
  }

  while (!v2);
  qword_10001C1F0 = (uint64_t)dispatch_queue_create("ASL Server Queue", 0LL);
  while (1)
  {
    do
      char v3 = (mach_msg_header_t *)calloc(1uLL, 0x94uLL);
    while (!v3);
    uint64_t v4 = v3;
    v3->msgh_local_port = dword_10001E358;
    v3->msgh_size = 148;
    uint64_t v5 = mach_msg(v3, 50333698, 0, 0x94u, dword_10001E354, 0, 0);
    if (v5) {
      break;
    }
    msgh_id = v4->msgh_id;
    if (v4->msgh_local_port == dword_10001E35C && msgh_id == 72)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 0x40000000LL;
      block[2] = sub_10000893C;
      block[3] = &unk_100019038;
      void block[4] = v4;
      void block[5] = v4;
      dispatch_async((dispatch_queue_t)qword_10001C1F0, block);
    }

    else if (msgh_id == v2)
    {
      sub_100008A40(v4);
    }

    else
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 0x40000000LL;
      v15[2] = sub_100008C10;
      v15[3] = &unk_100019058;
      v15[4] = v4;
      dispatch_async((dispatch_queue_t)qword_10001C1F0, v15);
    }
  }

  uint64_t v14 = v5;
  sub_1000064BC("FATAL ERROR: mach_msg() receive failed with status 0x%08x\n", v6, v7, v8, v9, v10, v11, v12, v5);
  snprintf( __str,  0x100uLL,  "[Sender syslogd] [Level 1] [PID %u] [Facility syslog] [Message FATAL ERROR: mach_msg() receive failed with status 0x%08x]",  dword_10001E37C,  v14);
  sub_100007114((uint64_t)__str);
  sleep(1u);
  abort();
}

void sub_10000893C(uint64_t a1)
{
  mach_port_name_t v2 = *(_DWORD *)(*(void *)(a1 + 32) + 32LL);
  int v3 = dword_10001C218;
  if (dword_10001C218)
  {
    uint64_t v4 = 0LL;
    uint64_t v5 = (_DWORD *)qword_10001C220;
    while (*(_DWORD *)(qword_10001C220 + 4 * v4) != v2)
    {
      if (dword_10001C218 == ++v4) {
        goto LABEL_12;
      }
    }

    if (dword_10001C218 == 1)
    {
      free((void *)qword_10001C220);
      qword_10001C220 = 0LL;
      dword_10001C218 = 0;
    }

    else
    {
      if ((int)v4 + 1 < dword_10001C218)
      {
        do
        {
          v5[v4] = v5[v4 + 1];
          ++v4;
        }

        while (v3 - 1 != (_DWORD)v4);
      }

      dword_10001C218 = v3 - 1;
      qword_10001C220 = (uint64_t)reallocf(v5, 4LL * (v3 - 1));
    }

    sub_1000064BC("cancel_session: %u\n", v6, v7, v8, v9, v10, v11, v12, v2);
    mach_port_deallocate(mach_task_self_, v2);
    sub_100005BA8();
    mach_port_name_t v2 = *(_DWORD *)(*(void *)(a1 + 32) + 32LL);
  }

LABEL_12:
  mach_port_deallocate(mach_task_self_, v2);
  free(*(void **)(a1 + 40));
}

    uint64_t v30 = calloc(1uLL, 0x80uLL);
    if (!v30) {
      goto LABEL_104;
    }
    uint64_t v31 = (uint64_t)v30;
    uint64_t v151 = v24;
    uint64_t v32 = asl_msg_fetch(v27, 0LL, &__s1, &v156, &v158);
    if ((_DWORD)v32 == -1)
    {
LABEL_102:
      uint64_t v15 = v153;
      uint64_t v24 = v151;
      goto LABEL_106;
    }

    uint64_t v33 = v32;
    while (1)
    {
      __darwin_time_t tv_sec = (char *)__s1.tv_sec;
      if (!__s1.tv_sec) {
        goto LABEL_101;
      }
      if (!strcmp((const char *)__s1.tv_sec, "ASLMessageID"))
      {
        uint64_t v41 = (const char *)v156.tv_sec;
        if (v156.tv_sec)
        {
          uint64_t v42 = v22[v23];
          if ((v42 & 1) != 0) {
            goto LABEL_111;
          }
          v22[v23] = v42 | 1;
          *(void *)uint64_t v31 = atoll(v41);
        }

        goto LABEL_101;
      }

      if (!strcmp(tv_sec, "Time"))
      {
        uint64_t v43 = v156.tv_sec;
        if (v156.tv_sec)
        {
          uint64_t v44 = v22[v23];
          if ((v44 & 2) != 0) {
            goto LABEL_111;
          }
          v22[v23] = v44 | 2;
          *(void *)(v31 + 8) = asl_core_parse_time(v43, 0LL);
        }

        goto LABEL_101;
      }

      if (!strcmp(tv_sec, "TimeNanoSec"))
      {
        uint64_t v45 = (const char *)v156.tv_sec;
        if (v156.tv_sec)
        {
          char v46 = v22[v23];
          if ((v46 & 4) != 0) {
            goto LABEL_111;
          }
          v22[v23] = v46 | 4;
          *(_DWORD *)(v31 + 88) = atoll(v45);
        }

        goto LABEL_101;
      }

      if (!strcmp(tv_sec, "Level"))
      {
        char v47 = (const char *)v156.tv_sec;
        if (v156.tv_sec)
        {
          stat v48 = v22[v23];
          if ((v48 & 8) != 0) {
            goto LABEL_111;
          }
          v22[v23] = v48 | 8;
          *(_BYTE *)(v31 + 122) = atoi(v47);
        }

        goto LABEL_101;
      }

      if (!strcmp(tv_sec, "PID"))
      {
        uint64_t v49 = (const char *)v156.tv_sec;
        if (v156.tv_sec)
        {
          uint64_t v50 = v22[v23];
          if ((v50 & 0x10) != 0) {
            goto LABEL_111;
          }
          v22[v23] = v50 | 0x10;
          *(_DWORD *)(v31 + 92) = atoi(v49);
        }

        goto LABEL_101;
      }

      if (!strcmp(tv_sec, "UID"))
      {
        uint64_t v51 = (const char *)v156.tv_sec;
        if (v156.tv_sec)
        {
          uint64_t v52 = v22[v23];
          if ((v52 & 0x20) != 0) {
            goto LABEL_111;
          }
          v22[v23] = v52 | 0x20;
          *(_DWORD *)(v31 + 96) = atoi(v51);
        }

        goto LABEL_101;
      }

      if (!strcmp(tv_sec, "GID"))
      {
        uint64_t v53 = (const char *)v156.tv_sec;
        if (v156.tv_sec)
        {
          uint64_t v54 = v22[v23];
          if ((v54 & 0x40) != 0) {
            goto LABEL_111;
          }
          v22[v23] = v54 | 0x40;
          *(_DWORD *)(v31 + 100) = atoi(v53);
        }

        goto LABEL_101;
      }

      if (!strcmp(tv_sec, "ReadUID"))
      {
        uint64_t v55 = (const char *)v156.tv_sec;
        if (v156.tv_sec)
        {
          unint64_t v56 = v22[v23];
          if ((v56 & 0x80) != 0) {
            goto LABEL_111;
          }
          v22[v23] = v56 | 0x80;
          *(_DWORD *)(v31 + 104) = atoi(v55);
        }

        goto LABEL_101;
      }

      if (!strcmp(tv_sec, "ReadGID"))
      {
        uint64_t v57 = (const char *)v156.tv_sec;
        if (v156.tv_sec)
        {
          unsigned int v58 = v22[v23];
          if ((v58 & 0x100) != 0) {
            goto LABEL_111;
          }
          v22[v23] = v58 | 0x100;
          *(_DWORD *)(v31 + 108) = atoi(v57);
        }

        goto LABEL_101;
      }

      if (!strcmp(tv_sec, "RefPID"))
      {
        uint64_t v59 = (const char *)v156.tv_sec;
        if (v156.tv_sec)
        {
          uint64_t v60 = v22[v23];
          if ((v60 & 0x200) != 0) {
            goto LABEL_111;
          }
          v22[v23] = v60 | 0x200;
          *(_DWORD *)(v31 + 112) = atoi(v59);
        }

        goto LABEL_101;
      }

      if (!strcmp(tv_sec, "Host"))
      {
        int v61 = (char *)v156.tv_sec;
        if (v156.tv_sec)
        {
          uint64_t v62 = v22[v23];
          if ((v62 & 0x400) != 0) {
            goto LABEL_111;
          }
          v22[v23] = v62 | 0x400;
          uint64_t v63 = sub_10000FAA4(a1, v61, 0);
          *(void *)(v31 + 24) = v63;
          if (!v63) {
            goto LABEL_113;
          }
        }

        goto LABEL_101;
      }

      if (!strcmp(tv_sec, "Sender"))
      {
        uint64_t v64 = (char *)v156.tv_sec;
        if (v156.tv_sec)
        {
          uint64_t v65 = v22[v23];
          if ((v65 & 0x800) != 0) {
            goto LABEL_111;
          }
          v22[v23] = v65 | 0x800;
          char v66 = sub_10000FAA4(a1, v64, 0);
          *(void *)(v31 + 32) = v66;
          if (!v66) {
            goto LABEL_113;
          }
        }

        goto LABEL_101;
      }

      if (!strcmp(tv_sec, "SenderMachUUID"))
      {
        char v67 = (char *)v156.tv_sec;
        if (v156.tv_sec)
        {
          uint64_t v68 = v22[v23];
          if ((v68 & 0x1000) != 0) {
            goto LABEL_111;
          }
          v22[v23] = v68 | 0x1000;
          *(void *)(v31 + 32) = sub_10000FAA4(a1, v67, 0);
          if (!*(void *)(v31 + 40)) {
            goto LABEL_113;
          }
        }

        goto LABEL_101;
      }

      if (!strcmp(tv_sec, "Facility"))
      {
        unsigned int v69 = (char *)v156.tv_sec;
        if (v156.tv_sec)
        {
          timeval v70 = v22[v23];
          if ((v70 & 0x2000) != 0) {
            goto LABEL_111;
          }
          v22[v23] = v70 | 0x2000;
          uint64_t v71 = sub_10000FAA4(a1, v69, 0);
          *(void *)(v31 + 48) = v71;
          if (!v71) {
            goto LABEL_113;
          }
        }

        goto LABEL_101;
      }

      if (!strcmp(tv_sec, "Message"))
      {
        uint64_t v72 = (char *)v156.tv_sec;
        if (v156.tv_sec)
        {
          uint64_t v73 = v22[v23];
          if ((v73 & 0x4000) != 0) {
            goto LABEL_111;
          }
          v22[v23] = v73 | 0x4000;
          uint64_t v74 = sub_10000FAA4(a1, v72, 0);
          *(void *)(v31 + 56) = v74;
          if (!v74) {
            goto LABEL_113;
          }
        }

        goto LABEL_101;
      }

      if (!strcmp(tv_sec, "RefProc"))
      {
        uint64_t v75 = (char *)v156.tv_sec;
        if (v156.tv_sec)
        {
          uint64_t v76 = v22[v23];
          if ((v76 & 0x8000) != 0) {
            goto LABEL_111;
          }
          v22[v23] = v76 | 0x8000;
          uint64_t v77 = sub_10000FAA4(a1, v75, 0);
          *(void *)(v31 + 64) = v77;
          if (!v77) {
            goto LABEL_113;
          }
        }

        goto LABEL_101;
      }

      if (strcmp(tv_sec, "Session")) {
        break;
      }
      unint64_t v78 = (char *)v156.tv_sec;
      if (v156.tv_sec)
      {
        uint64_t v79 = v22[v23];
        if ((v79 & 0x10000) != 0) {
          goto LABEL_111;
        }
        v22[v23] = v79 | 0x10000;
        int v80 = sub_10000FAA4(a1, v78, 0);
        *(void *)(v31 + 72) = v80;
        if (!v80)
        {
LABEL_113:
          sub_10000E69C(a1, v31);
          free((void *)v31);
          uint64_t v83 = 0x40000000;
          goto LABEL_112;
        }
      }

void sub_100008A40(mach_msg_header_t *a1)
{
  mach_port_name_t v2 = (mach_msg_header_t *)calloc(1uLL, 0x8CuLL);
  int v3 = voucher_mach_msg_adopt(a1);
  asl_ipc_server(a1, (uint64_t)v2);
  if ((v2->msgh_bits & 0x80000000) == 0)
  {
    mach_port_t msgh_remote_port = v2[1].msgh_remote_port;
    if (msgh_remote_port)
    {
      if (msgh_remote_port == -305)
      {
        v2->mach_port_t msgh_remote_port = 0;
      }

      else if ((a1->msgh_bits & 0x80000000) != 0)
      {
        a1->mach_port_t msgh_remote_port = 0;
        mach_msg_destroy(a1);
      }
    }
  }

  if (!v2->msgh_remote_port)
  {
    if ((v2->msgh_bits & 0x80000000) == 0) {
      goto LABEL_18;
    }
LABEL_17:
    mach_msg_destroy(v2);
    goto LABEL_18;
  }

  uint64_t v5 = mach_msg(v2, 17, v2->msgh_size, 0, 0, 0xAu, 0);
  if ((_DWORD)v5)
  {
    if ((_DWORD)v5 == 268435469)
    {
      sub_1000064BC("ERROR: mach_msg() send failed with MACH_SEND_NO_BUFFER 0x%08x\n", v5, v6, v7, v8, v9, v10, v11, 13);
      snprintf( __str,  0x100uLL,  "[Sender syslogd] [Level 3] [PID %u] [Facility syslog] [Message mach_msg() send failed with status 0x%08x (MACH_SEND_NO_BUFFER)]");
    }

    else
    {
      if ((_DWORD)v5 != 268435472) {
        sub_100013BB0(__str, v5, v6, v7, v8, v9, v10, v11);
      }
      sub_1000064BC( "ERROR: mach_msg() send failed with MACH_SEND_INVALID_HEADER 0x%08x\n",  v5,  v6,  v7,  v8,  v9,  v10,  v11,  16);
      snprintf( __str,  0x100uLL,  "[Sender syslogd] [Level 3] [PID %u] [Facility syslog] [Message mach_msg() send failed with status 0x%08x (MACH_S END_INVALID_HEADER)]");
    }

    sub_100007114((uint64_t)__str);
    goto LABEL_17;
  }

LABEL_18:
  voucher_mach_msg_revert(v3);
  free(a1);
  free(v2);
}

void sub_100008C10(uint64_t a1)
{
}

uint64_t sub_100008C18( int a1, vm_address_t address, vm_size_t size, uint64_t a4, int a5, char a6, void *a7, _DWORD *a8, void *a9, int *a10, _OWORD *a11)
{
  if ((a6 & 1) != 0) {
    int v11 = -1;
  }
  else {
    int v11 = 1;
  }
  sub_100008C68(address, size, a4, a5, 0, v11, a7, a8, a9, a10, a11);
  return 0LL;
}

void sub_100008C68( vm_address_t address, vm_size_t size, uint64_t a3, int a4, int a5, int a6, void *a7, _DWORD *a8, void *a9, int *a10, _OWORD *a11)
{
  *a7 = 0LL;
  *a8 = 0;
  *a9 = 0LL;
  *a10 = 0;
  if (address)
  {
    unsigned int v15 = size;
    if (*(_BYTE *)(address + (size - 1)))
    {
      vm_deallocate(mach_task_self_, address, size);
      int v17 = 1;
LABEL_4:
      *a10 = v17;
      return;
    }

    uint64_t v44 = a7;
    uint64_t v45 = a8;
    uint64_t v18 = asl_msg_list_from_string(address, size);
    vm_deallocate(mach_task_self_, address, v15);
  }

  else
  {
    uint64_t v44 = a7;
    uint64_t v45 = a8;
    uint64_t v18 = asl_msg_list_from_string(0LL, size);
  }

  uint64_t v49 = 0LL;
  gid_t egidp = -1;
  uid_t euidp = -1;
  pid_t pidp = -1;
  __int128 v19 = a11[1];
  *(_OWORD *)atoken.val = *a11;
  *(_OWORD *)&atoken.val[4] = v19;
  audit_token_to_au32(&atoken, 0LL, &euidp, &egidp, 0LL, 0LL, &pidp, 0LL, 0LL);
  if (v18 && *(_DWORD *)(v18 + 8) == 1 && asl_check_option(**(void **)(v18 + 16), "control"))
  {
    uint64_t v20 = **(void **)(v18 + 16);
    uid_t v21 = euidp;
    uint64_t v49 = 0LL;
    uint64_t v22 = asl_msg_list_new();
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = asl_msg_new(0LL);
      if (v24)
      {
        uint64_t v25 = v24;
        uid_t v43 = v21;
        asl_msg_list_append(v23, v24);
        int v26 = asl_msg_count(v20);
        if (DWORD2(xmmword_10001E428)) {
          snprintf((char *)&atoken, 0x100uLL, "1 %s", (const char *)qword_10001E438);
        }
        else {
          LOWORD(atoken.val[0]) = 48;
        }
        asl_msg_set_key_val(v25, "debug", &atoken);
        if (v26 != 1)
        {
LABEL_120:
        }

        unsigned int v37 = ((xmmword_10001E448 >> 1) & 1) + (xmmword_10001E448 & 1);
        if (v37)
        {
          __int128 v64 = 0u;
          __int128 v65 = 0u;
          __int128 v62 = 0u;
          __int128 v63 = 0u;
          __int128 v60 = 0u;
          __int128 v61 = 0u;
          __int128 v58 = 0u;
          __int128 v59 = 0u;
          __int128 v57 = 0u;
          __int128 v55 = 0u;
          __int128 v56 = 0u;
          __int128 v53 = 0u;
          __int128 v54 = 0u;
          __int128 v52 = 0u;
          memset(&atoken, 0, sizeof(atoken));
          if ((xmmword_10001E448 & 1) != 0)
          {
            __strncat_chk(&atoken, "file", 4LL, 256LL);
            if (v37 >= 2) {
              __strncat_chk(&atoken, " ", 1LL, 256LL);
            }
            unsigned int v38 = 2;
          }

          else
          {
            unsigned int v38 = 1;
          }

          if ((xmmword_10001E448 & 2) != 0)
          {
            p_audit_token_t atoken = &atoken;
            __strncat_chk(&atoken, "memory", 6LL, 256LL);
            if (v38 < v37)
            {
              p_audit_token_t atoken = &atoken;
              __strncat_chk(&atoken, " ", 1LL, 256LL);
            }
          }

          else
          {
            p_audit_token_t atoken = &atoken;
          }
        }

        else
        {
          p_audit_token_t atoken = (audit_token_t *)"unknown";
        }

        asl_msg_set_key_val(v25, "dbtype", p_atoken);
        if (v26 == 1)
        {
          snprintf((char *)&atoken, 0x100uLL, "%u", DWORD1(xmmword_10001E448));
          asl_msg_set_key_val(v25, "db_file_max", &atoken);
        }

        else
        {
LABEL_119:
          if (!asl_msg_lookup(v20, "db_file_max", 0LL, 0LL))
          {
            snprintf((char *)&atoken, 0x100uLL, "%u", DWORD1(xmmword_10001E448));
            asl_msg_set_key_val(v25, "db_file_max", &atoken);
          }
        }

        snprintf((char *)&atoken, 0x100uLL, "%u", DWORD2(xmmword_10001E448));
        asl_msg_set_key_val(v25, "db_memory_max", &atoken);
        if (v26 == 1)
        {
          snprintf((char *)&atoken, 0x100uLL, "%u", HIDWORD(xmmword_10001E448));
          asl_msg_set_key_val(v25, "db_memory_str_max", &atoken);
LABEL_66:
          snprintf((char *)&atoken, 0x100uLL, "%u", qword_10001E458);
          asl_msg_set_key_val(v25, "mps_limit", &atoken);
          if (v26 == 1)
          {
            snprintf((char *)&atoken, 0x100uLL, "%llu", (void)xmmword_10001E460);
            asl_msg_set_key_val(v25, "bsd_max_dup_time", &atoken);
LABEL_71:
            snprintf((char *)&atoken, 0x100uLL, "%llu", *((void *)&xmmword_10001E460 + 1));
            asl_msg_set_key_val(v25, "mark_time", &atoken);
            if (v26 == 1)
            {
              snprintf((char *)&atoken, 0x100uLL, "%llu", (void)xmmword_10001E470);
              asl_msg_set_key_val(v25, "utmp_ttl", &atoken);
LABEL_76:
              snprintf((char *)&atoken, 0x100uLL, "%lld", (void)xmmword_10001E388);
              asl_msg_set_key_val(v25, "memory_size", &atoken);
              if (v26 == 1)
              {
                snprintf((char *)&atoken, 0x100uLL, "%lld", qword_10001E480);
                asl_msg_set_key_val(v25, "memory_max", &atoken);
LABEL_81:
                snprintf((char *)&atoken, 0x100uLL, "%lld", *((void *)&xmmword_10001E470 + 1));
                asl_msg_set_key_val(v25, "stats_interval", &atoken);
                if (v26 == 1)
                {
                  snprintf((char *)&atoken, 0x100uLL, "%d", dword_10001E380);
                  asl_msg_set_key_val(v25, "work_queue_count", &atoken);
LABEL_86:
                  snprintf((char *)&atoken, 0x100uLL, "%d", DWORD2(xmmword_10001E388));
                  asl_msg_set_key_val(v25, "asl_queue_count", &atoken);
                  if (v26 == 1)
                  {
                    snprintf((char *)&atoken, 0x100uLL, "%d", HIDWORD(xmmword_10001E388));
                    asl_msg_set_key_val(v25, "bsd_queue_count", &atoken);
LABEL_91:
                    snprintf((char *)&atoken, 0x100uLL, "%d", dword_10001E34C);
                    asl_msg_set_key_val(v25, "client_count", &atoken);
                    if (v26 == 1)
                    {
                      snprintf((char *)&atoken, 0x100uLL, "%d", dword_10001E350);
                      asl_msg_set_key_val(v25, "disaster_occurred", &atoken);
LABEL_96:
                      snprintf((char *)&atoken, 0x100uLL, "%d", DWORD2(xmmword_10001E368));
                      asl_msg_set_key_val(v25, "lockdown_session_count", &atoken);
                      if (v26 == 1)
                      {
                        snprintf((char *)&atoken, 0x100uLL, "%u", HIDWORD(qword_10001E458));
                        asl_msg_set_key_val(v25, "remote_delay_time", &atoken);
LABEL_101:
                        snprintf((char *)&atoken, 0x100uLL, "%d", HIDWORD(xmmword_10001E368));
                        asl_msg_set_key_val(v25, "watchers_active", &atoken);
LABEL_102:
                        if (dword_10001E400)
                        {
                          unint64_t v40 = 0LL;
                          do
                          {
                            if (v26 == 1
                              || !asl_msg_lookup( v20,  **(void **)(*((void *)&xmmword_10001E408 + 1) + 8 * v40),  0LL,  0LL))
                            {
                              if (*(_DWORD *)(*(void *)(*((void *)&xmmword_10001E408 + 1) + 8 * v40) + 8LL)) {
                                uint64_t v41 = "enabled";
                              }
                              else {
                                uint64_t v41 = "disabled";
                              }
                              snprintf((char *)&atoken, 0x100uLL, "%s", v41);
                              asl_msg_set_key_val( v25,  **(void **)(*((void *)&xmmword_10001E408 + 1) + 8 * v40),  &atoken);
                            }

                            ++v40;
                          }

                          while (v40 < dword_10001E400);
                        }

                        sub_1000028C4(v20, v25, v26 == 1);
                        if (!asl_msg_lookup(v20, "action", &sizea, 0LL))
                        {
                          if (v43) {
                            int v42 = -1;
                          }
                          else {
                            int v42 = sub_100001FF8((unsigned __int8 *)sizea);
                          }
                          snprintf((char *)&atoken, 0x100uLL, "%d", v42);
                          asl_msg_set_key_val(v25, "action", &atoken);
                        }

                        asl_msg_release(v25);
                        int v35 = 0;
                        uint64_t v49 = v23;
                        goto LABEL_31;
                      }

LABEL_98:
                      if (!asl_msg_lookup(v20, "remote_delay_time", 0LL, 0LL))
                      {
                        snprintf((char *)&atoken, 0x100uLL, "%u", HIDWORD(qword_10001E458));
                        asl_msg_set_key_val(v25, "remote_delay_time", &atoken);
                      }

                      goto LABEL_101;
                    }

LABEL_93:
                    if (!asl_msg_lookup(v20, "disaster_occurred", 0LL, 0LL))
                    {
                      snprintf((char *)&atoken, 0x100uLL, "%d", dword_10001E350);
                      asl_msg_set_key_val(v25, "disaster_occurred", &atoken);
                    }

                    goto LABEL_96;
                  }

LABEL_88:
                  if (!asl_msg_lookup(v20, "bsd_queue_count", 0LL, 0LL))
                  {
                    snprintf((char *)&atoken, 0x100uLL, "%d", HIDWORD(xmmword_10001E388));
                    asl_msg_set_key_val(v25, "bsd_queue_count", &atoken);
                  }

                  goto LABEL_91;
                }

LABEL_83:
                if (!asl_msg_lookup(v20, "work_queue_count", 0LL, 0LL))
                {
                  snprintf((char *)&atoken, 0x100uLL, "%d", dword_10001E380);
                  asl_msg_set_key_val(v25, "work_queue_count", &atoken);
                }

                goto LABEL_86;
              }

LABEL_73:
            if (!asl_msg_lookup(v20, "utmp_ttl", 0LL, 0LL))
            {
              snprintf((char *)&atoken, 0x100uLL, "%llu", (void)xmmword_10001E470);
              asl_msg_set_key_val(v25, "utmp_ttl", &atoken);
            }

            goto LABEL_76;
          }

LABEL_68:
          if (!asl_msg_lookup(v20, "bsd_max_dup_time", 0LL, 0LL))
          {
            snprintf((char *)&atoken, 0x100uLL, "%llu", (void)xmmword_10001E460);
            asl_msg_set_key_val(v25, "bsd_max_dup_time", &atoken);
          }

          goto LABEL_71;
        }

    uint64_t v6 = asl_msg_fetch(v4, v6, &__s1, &__s, 0LL);
    if ((_DWORD)v6 == -1) {
      goto LABEL_69;
    }
  }

  uint64_t v9 = v8;
  if (__s) {
    unsigned int v38 = sub_10000FAA4(v2, __s, 1);
  }
  else {
    unsigned int v38 = 0LL;
  }
  uint64_t v13 = reallocf(*(void **)(v3 + 80), 8LL * (*(_DWORD *)(v3 + 116) + 2));
  *(void *)(v3 + 80) = v13;
  if (v13)
  {
    uint64_t v14 = *(unsigned int *)(v3 + 116);
    v13[v14] = v9;
    unsigned int v15 = *(void *)(v3 + 80);
    *(_DWORD *)(v3 + 116) = v14 + 2;
    *(void *)(v15 + 8LL * (v14 + 1)) = v38;
    goto LABEL_68;
  }

  sub_10000E69C(v2, v3);
  char v16 = 9;
LABEL_71:
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v16;
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    int v17 = *(void *)(a1 + 40);
    uint64_t v18 = *(_DWORD *)(v17 + 32);
    __int128 v19 = **(void **)(a1 + 56);
    if (v19)
    {
      **(void **)(v17 + 16) = v19;
      uint64_t v20 = v18;
    }

    else
    {
      uid_t v21 = asl_core_new_msg_id(0LL);
      int v17 = *(void *)(a1 + 40);
      **(void **)(v17 + 16) = v21;
      **(void **)(a1 + 56) = v21;
      uint64_t v20 = *(_DWORD *)(v17 + 32);
    }

    uint64_t v22 = *(void *)(*(void *)(v17 + 8) + 8LL * v20);
    sub_10000E69C(v17, v22);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 8LL * *(unsigned int *)(*(void *)(a1 + 40) + 32LL)) = *(void *)(*(void *)(a1 + 40) + 16LL);
    *(void *)(*(void *)(a1 + 40) + 16LL) = v22;
    uint64_t v23 = *(void *)(a1 + 40);
    uint64_t v24 = *(_DWORD *)(v23 + 32);
    else {
      uint64_t v25 = 0;
    }
    *(_DWORD *)(v23 + 32) = v25;
    while (1)
    {
      int v26 = *(void *)(a1 + 40);
      if (*(void *)(v26 + 48) <= *(void *)(v26 + 40)) {
        break;
      }
      sub_10000E69C(v26, *(void *)(*(void *)(v26 + 8) + 8LL * *(unsigned int *)(v26 + 32)));
      pid_t v27 = *(void *)(a1 + 40);
      uint64_t v28 = *(_DWORD *)(v27 + 28);
      uint64_t v29 = *(_DWORD *)(v27 + 32);
      if (v29 + 1 < v28) {
        uid_t v30 = v29 + 1;
      }
      else {
        uid_t v30 = 0;
      }
      *(_DWORD *)(v27 + 32) = v30;
      if (v30 == v18)
      {
        if (v28)
        {
          uint64_t v31 = 0LL;
          do
          {
            uint64_t v32 = *(_OWORD **)(*(void *)(v27 + 8) + 8 * v31);
            v32[6] = 0uLL;
            v32[7] = 0uLL;
            v32[4] = 0uLL;
            v32[5] = 0uLL;
            v32[2] = 0uLL;
            v32[3] = 0uLL;
            *uint64_t v32 = 0uLL;
            v32[1] = 0uLL;
            ++v31;
          }

          while (v31 < *(unsigned int *)(v27 + 28));
        }

        xpc_object_t v33 = *(void **)v27;
        if (*(void *)v27)
        {
          uint64_t v34 = *(unsigned int *)(v27 + 24);
          if ((_DWORD)v34)
          {
            for (unint64_t i = 0LL; i < v34; ++i)
            {
              uint64_t v36 = *(void **)v27;
              unsigned int v37 = *(void *)(*(void *)v27 + 8 * i);
              if (v37)
              {
                free(*(void **)(v37 + 8));
                free(*(void **)(*(void *)v27 + 8 * i));
                uint64_t v36 = *(void **)v27;
                uint64_t v34 = *(unsigned int *)(v27 + 24);
              }

              v36[i] = 0LL;
            }

            xpc_object_t v33 = *(void **)v27;
          }

          free(v33);
          *(void *)pid_t v27 = 0LL;
        }

        *(_DWORD *)(v27 + 24) = 0;
        *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 9999;
        return;
      }
    }
  }

uint64_t sub_1000099F0( int a1, vm_address_t address, vm_size_t size, uint64_t a4, int a5, int a6, int a7, void *a8, _DWORD *a9, __int128 a10, _OWORD *a11)
{
  return 0LL;
}

uint64_t sub_100009A44( int a1, vm_address_t address, uint64_t size, _OWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (address)
  {
    int v8 = size;
    vm_size_t v10 = size;
    if (*(_BYTE *)(address + (size - 1)))
    {
LABEL_10:
      vm_deallocate(mach_task_self_, address, v10);
      return 0LL;
    }

    sub_1000064BC("__asl_server_message: %s\n", address, size, (uint64_t)a4, a5, a6, a7, a8, address);
    if ((uint64_t)(xmmword_10001E388 + v10) > qword_10001E480)
    {
      sub_1000064BC( "Server queue dropped message.  message size %u  queue size %lld  max %lld\n",  v12,  v13,  v14,  v15,  v16,  v17,  v18,  v8);
      snprintf( (char *)__str,  0x100uLL,  "[Sender syslogd] [Level 2] [PID %u] [Message Received message size %u overflows work queue (size %lld limit %lld) - dropping message] [UID 0] [UID 0] [Facility syslog]",  dword_10001E37C,  v8,  (void)xmmword_10001E388,  qword_10001E480);
      sub_100007114((uint64_t)__str);
      goto LABEL_10;
    }

    __int128 v19 = malloc(v10);
    if (!v19) {
      goto LABEL_10;
    }
    uint64_t v20 = v19;
    memcpy(v19, (const void *)address, v10);
    vm_deallocate(mach_task_self_, address, v10);
    gid_t egidp = -1;
    uid_t euidp = -1;
    pid_t pidp = -1;
    __int128 v21 = a4[1];
    *(_OWORD *)__str[0].val = *a4;
    *(_OWORD *)&__str[0].val[4] = v21;
    audit_token_to_au32(__str, 0LL, &euidp, &egidp, 0LL, 0LL, &pidp, 0LL, 0LL);
    do
      unsigned int v22 = __ldxr((unsigned int *)&dword_10001E380);
    while (__stxr(v22 + 1, (unsigned int *)&dword_10001E380));
    do
      unint64_t v23 = __ldxr((unint64_t *)&xmmword_10001E388);
    while (__stxr(v23 + v10, (unint64_t *)&xmmword_10001E388));
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000LL;
    block[2] = sub_100009C44;
    block[3] = &unk_100019078;
    void block[4] = v20;
    int v26 = v8;
    uid_t v27 = euidp;
    gid_t v28 = egidp;
    pid_t v29 = pidp;
    dispatch_async((dispatch_queue_t)qword_10001C1F0, block);
  }

  return 0LL;
}

void sub_100009C44(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned int *)(a1 + 40);
  int v2 = *(_DWORD *)(a1 + 44);
  int v5 = *(_DWORD *)(a1 + 48);
  int v4 = *(_DWORD *)(a1 + 52);
  uint64_t v6 = asl_msg_from_string(v1);
  free(v1);
  do
    unint64_t v7 = __ldxr((unint64_t *)&xmmword_10001E388);
  while (__stxr(v7 - v3, (unint64_t *)&xmmword_10001E388));
  do
    unsigned int v8 = __ldxr((unsigned int *)&dword_10001E380);
  while (__stxr(v8 - 1, (unsigned int *)&dword_10001E380));
  if (v6)
  {
    mach_port_name_t tn = 0;
    if (!task_name_for_pid(mach_task_self_, v4, &tn)) {
      sub_10000A07C(tn);
    }
    snprintf(__str, 0x40uLL, "%d", v2);
    asl_msg_set_key_val(v6, "UID", __str);
    snprintf(__str, 0x40uLL, "%d", v5);
    asl_msg_set_key_val(v6, "GID", __str);
    snprintf(__str, 0x40uLL, "%d", v4);
    asl_msg_set_key_val(v6, "PID", __str);
    sub_1000062A4(v6, 5);
  }

uint64_t sub_100009DB0( int a1, vm_address_t address, uint64_t size, _DWORD *a4, vm_address_t *a5, _DWORD *a6, int *a7, _OWORD *a8)
{
  *a4 = 0;
  *a5 = 0LL;
  *a6 = 0;
  *a7 = 0;
  if (!address) {
    goto LABEL_4;
  }
  unsigned int v9 = size;
  if (*(_BYTE *)(address + (size - 1)))
  {
    vm_deallocate(mach_task_self_, address, size);
LABEL_4:
    int v11 = 1;
LABEL_5:
    *a7 = v11;
    return 0LL;
  }

  sub_1000064BC( "__asl_server_create_aux_link: %s\n",  address,  size,  (uint64_t)a4,  (uint64_t)a5,  (uint64_t)a6,  (uint64_t)a7,  (uint64_t)a8,  address);
  if ((xmmword_10001E448 & 1) == 0)
  {
    vm_deallocate(mach_task_self_, address, v9);
    int v11 = 2;
    goto LABEL_5;
  }

  uint64_t v17 = asl_msg_from_string(address);
  vm_deallocate(mach_task_self_, address, v9);
  if (v17)
  {
    gid_t egidp = -1;
    uid_t euidp = -1;
    pid_t pidp = -1;
    __int128 v18 = a8[1];
    *(_OWORD *)atoken.val = *a8;
    *(_OWORD *)&atoken.val[4] = v18;
    audit_token_to_au32(&atoken, 0LL, &euidp, &egidp, 0LL, 0LL, &pidp, 0LL, 0LL);
    mach_port_name_t tn = 0;
    if (!task_name_for_pid(mach_task_self_, pidp, &tn)) {
      sub_10000A07C(tn);
    }
    snprintf((char *)&atoken, 0x40uLL, "%d", euidp);
    asl_msg_set_key_val(v17, "UID", &atoken);
    snprintf((char *)&atoken, 0x40uLL, "%d", egidp);
    asl_msg_set_key_val(v17, "GID", &atoken);
    snprintf((char *)&atoken, 0x40uLL, "%d", pidp);
    asl_msg_set_key_val(v17, "PID", &atoken);
    *a7 = asl_store_open_aux(xmmword_10001E3E8, v17, &v22, &__s);
    asl_msg_release(v17);
    if (!*a7)
    {
      if (__s)
      {
        int v19 = fileport_makeport(v22, a4);
        close(v22);
        uint64_t v20 = __s;
        if ((v19 & 0x80000000) == 0)
        {
          vm_size_t v21 = strlen(__s) + 1;
          *a6 = v21;
          if (!vm_allocate(mach_task_self_, &addressa, v21, 1358954497))
          {
            memmove((void *)addressa, __s, *a6);
            free(__s);
            *a5 = addressa;
            return 0LL;
          }

          uint64_t v20 = __s;
        }

        free(v20);
      }

      else if ((v22 & 0x80000000) == 0)
      {
        close(v22);
      }

      int v11 = 9999;
      goto LABEL_5;
    }
  }

  return 0LL;
}

uint64_t sub_10000A07C(uint64_t name)
{
  if ((_DWORD)name)
  {
    mach_port_name_t v1 = name;
    if (!dword_10001E35C) {
      return mach_port_deallocate(mach_task_self_, v1);
    }
    if (dword_10001C218)
    {
      int v2 = (int *)qword_10001C220;
      uint64_t v3 = dword_10001C218;
      while (1)
      {
        int v4 = *v2++;
        if (v4 == (_DWORD)name) {
          return mach_port_deallocate(mach_task_self_, v1);
        }
        if (!--v3)
        {
          int v5 = reallocf((void *)qword_10001C220, 4LL * (dword_10001C218 + 1));
          goto LABEL_9;
        }
      }
    }

    int v5 = calloc(1uLL, 4uLL);
LABEL_9:
    qword_10001C220 = (uint64_t)v5;
    if (!v5) {
      return mach_port_deallocate(mach_task_self_, v1);
    }
    int v13 = dword_10001C218;
    v5[dword_10001C218] = v1;
    dword_10001C218 = v13 + 1;
    sub_1000064BC("register_session: %u   PID %d\n", v6, v7, v8, v9, v10, v11, v12, v1);
    mach_port_t previous = 0;
    mach_port_request_notification(mach_task_self_, v1, 72, 0, dword_10001E35C, 0x15u, &previous);
    mach_port_deallocate(mach_task_self_, previous);
    return sub_100005B68();
  }

  return name;
}

uint64_t sub_10000A1A0(uint64_t a1, __int16 a2, _OWORD *a3)
{
  pid_t pidp = -1;
  __int128 v4 = a3[1];
  *(_OWORD *)atoken.val = *a3;
  *(_OWORD *)&atoken.val[4] = v4;
  audit_token_to_au32(&atoken, 0LL, 0LL, 0LL, 0LL, 0LL, &pidp, 0LL, 0LL);
  sub_1000064BC("__asl_server_register_direct_watch: pid %u port %hu\n", v5, v6, v7, v8, v9, v10, v11, pidp);
  if (qword_10001C1C8 != -1) {
    dispatch_once(&qword_10001C1C8, &stru_1000190B8);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_10000A2AC;
  block[3] = &unk_1000190D8;
  __int16 v14 = a2;
  dispatch_async((dispatch_queue_t)qword_10001C1D0, block);
  return 0LL;
}

void sub_10000A284(id a1)
{
  qword_10001C1D0 = (uint64_t)dispatch_queue_create("Direct Watch Queue", 0LL);
}

void sub_10000A2AC(uint64_t a1)
{
  __int16 v1 = *(_WORD *)(a1 + 32);
  if (v1)
  {
    int v2 = socket(2, 1, 0);
    if ((v2 & 0x80000000) == 0)
    {
      int v3 = v2;
      v13.sa_family = 2;
      *(_WORD *)v13.sa_data = v1;
      *(_DWORD *)&v13.sa_data[2] = 16777343;
      if (!connect(v2, &v13, 0x10u))
      {
        int v12 = 1;
        setsockopt(v3, 0xFFFF, 4130, &v12, 4u);
        int v12 = 1;
        setsockopt(v3, 6, 1, &v12, 4u);
        int v4 = fcntl(v3, 3, 0LL);
        LODWORD(v5) = v4 | 4;
        if (v4 == -1) {
          uint64_t v5 = 4LL;
        }
        else {
          uint64_t v5 = v5;
        }
        fcntl(v3, 4, v5);
        if (dword_10001C1D8)
        {
          unsigned int v6 = dword_10001C1D8 + 1;
          uint64_t v7 = reallocf((void *)qword_10001C208, 4LL * (dword_10001C1D8 + 1));
          qword_10001C208 = (uint64_t)v7;
          uint64_t v8 = reallocf((void *)qword_10001C210, 2LL * v6);
        }

        else
        {
          qword_10001C208 = (uint64_t)calloc(1uLL, 4uLL);
          uint64_t v8 = calloc(1uLL, 2uLL);
          uint64_t v7 = (_DWORD *)qword_10001C208;
        }

        qword_10001C210 = (uint64_t)v8;
        if (v7 && v8)
        {
          uint64_t v9 = dword_10001C1D8;
          v7[dword_10001C1D8] = v3;
          v8[v9] = v1;
          int v10 = v9 + 1;
          int v11 = DWORD2(xmmword_10001E368) + v10;
        }

        else
        {
          close(v3);
          free((void *)qword_10001C208);
          qword_10001C208 = 0LL;
          free((void *)qword_10001C210);
          int v10 = 0;
          qword_10001C210 = 0LL;
          int v11 = SDWORD2(xmmword_10001E368) > 0;
        }

        dword_10001C1D8 = v10;
        HIDWORD(xmmword_10001E368) = v11;
      }
    }
  }

uint64_t sub_10000A488( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int16 v8 = a2;
  sub_1000064BC("__asl_server_cancel_direct_watch: %hu\n", a2, a3, a4, a5, a6, a7, a8, bswap32(a2) >> 16);
  if (qword_10001C1C8 != -1) {
    dispatch_once(&qword_10001C1C8, &stru_100019118);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_10000A558;
  block[3] = &unk_100019138;
  __int16 v11 = v8;
  dispatch_async((dispatch_queue_t)qword_10001C1D0, block);
  return 0LL;
}

void sub_10000A530(id a1)
{
  qword_10001C1D0 = (uint64_t)dispatch_queue_create("Direct Watch Queue", 0LL);
}

void sub_10000A558(uint64_t a1)
{
  int v1 = dword_10001C1D8;
  if (dword_10001C1D8)
  {
    uint64_t v2 = 0LL;
    int v3 = (void *)qword_10001C210;
    while (*(unsigned __int16 *)(qword_10001C210 + 2 * v2) != *(unsigned __int16 *)(a1 + 32))
    {
      if (dword_10001C1D8 == ++v2) {
        return;
      }
    }

    if (dword_10001C1D8 == 1)
    {
      free((void *)qword_10001C208);
      qword_10001C208 = 0LL;
LABEL_13:
      free(v3);
      qword_10001C210 = 0LL;
      dword_10001C1D8 = 0;
      HIDWORD(xmmword_10001E368) = SDWORD2(xmmword_10001E368) > 0;
      return;
    }

    int v4 = (_DWORD *)qword_10001C208;
    if ((int)v2 + 1 < dword_10001C1D8)
    {
      do
      {
        v4[v2] = v4[v2 + 1];
        *((_WORD *)v3 + v2) = *((_WORD *)v3 + v2 + 1);
        ++v2;
      }

      while (v1 - 1 != (_DWORD)v2);
    }

    unsigned int v5 = v1 - 1;
    dword_10001C1D8 = v1 - 1;
    HIDWORD(xmmword_10001E368) = DWORD2(xmmword_10001E368) + v1 - 1;
    unsigned int v6 = reallocf(v4, 4LL * (v1 - 1));
    qword_10001C208 = (uint64_t)v6;
    uint64_t v7 = reallocf(v3, 2LL * v5);
    int v3 = v7;
    qword_10001C210 = (uint64_t)v7;
    if (!v6 || !v7)
    {
      free(v6);
      qword_10001C208 = 0LL;
      goto LABEL_13;
    }
  }

void sub_10000A68C(int a1)
{
  ssize_t v1 = read(a1, (char *)&unk_10001C228 + dword_10001D228, 4096LL - dword_10001D228);
  if (v1 >= 1)
  {
    uint64_t v6 = v1;
    uint64_t v7 = 0LL;
    int v8 = dword_10001D228;
    uint64_t v9 = (char *)&unk_10001C228 + dword_10001D228;
    unsigned int v10 = dword_10001D228 + &unk_10001C228;
    __int16 v11 = (char *)&unk_10001C228;
    do
    {
      if (v9[v7] == 10)
      {
        v9[v7] = 0;
        int v12 = sub_100007740((uint64_t)v11, v10 + v7 - v11, 0LL, 4LL, v2, v3, v4, v5);
        sub_1000062A4((uint64_t)v12, 4);
        __int16 v11 = &v9[v7 + 1];
      }

      ++v7;
    }

    while (v6 > v7);
    if (v11 != (char *)&unk_10001C228)
    {
      __memmove_chk(&unk_10001C228, v11, 4095 - dword_10001D228, 4096LL);
      dword_10001D228 = v8 + &unk_10001C228 - (_DWORD)v11 + v7;
    }
  }

uint64_t sub_10000A788( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (qword_10001D230 != -1) {
    dispatch_once(&qword_10001D230, &stru_100019178);
  }
  sub_1000064BC("%s: init\n", a2, a3, a4, a5, a6, a7, a8, (char)"klog_in");
  if (dword_10001C02C < 0)
  {
    int v10 = open("/dev/klog", 0, 0LL);
    dword_10001C02C = v10;
    if (v10 < 0)
    {
      __int16 v11 = __error();
      strerror(*v11);
      sub_1000064BC("%s: couldn't open %s: %s\n", v12, v13, v14, v15, v16, v17, v18, (char)"klog_in");
      return 0xFFFFFFFFLL;
    }

    if (fcntl(v10, 4, 4LL) < 0)
    {
      close(dword_10001C02C);
      uint64_t v8 = 0xFFFFFFFFLL;
      dword_10001C02C = -1;
      int v19 = __error();
      strerror(*v19);
      sub_1000064BC( "%s: couldn't set O_NONBLOCK for fd %d (%s): %s\n",  v20,  v21,  v22,  v23,  v24,  v25,  v26,  (char)"klog_in");
      return v8;
    }

    qword_10001D240 = (uint64_t)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_read,  dword_10001C02C,  0LL,  (dispatch_queue_t)qword_10001D238);
    dispatch_source_set_event_handler((dispatch_source_t)qword_10001D240, &stru_1000191B8);
    dispatch_resume((dispatch_object_t)qword_10001D240);
  }

  return 0LL;
}

void sub_10000A8D0(id a1)
{
  qword_10001D238 = (uint64_t)dispatch_queue_create("klog_in", 0LL);
}

void sub_10000A8F8(id a1)
{
}

uint64_t sub_10000A904()
{
  if (dword_10001C02C < 0) {
    return 1LL;
  }
  dispatch_source_cancel((dispatch_source_t)qword_10001D240);
  dispatch_release((dispatch_object_t)qword_10001D240);
  qword_10001D240 = 0LL;
  close(dword_10001C02C);
  uint64_t result = 0LL;
  dword_10001C02C = -1;
  return result;
}

uint64_t sub_10000A95C()
{
  return 0LL;
}

uint64_t sub_10000A964(int a1)
{
  uint64_t v2 = 0LL;
  if (a1 == 2)
  {
    asl_memory_statistics(*((uint64_t **)&xmmword_10001E3E8 + 1), &v2);
  }

  else if (a1 == 1)
  {
    asl_store_statistics(xmmword_10001E3E8, &v2);
  }

  return v2;
}

void sub_10000A9C0(int *a1)
{
  if (!a1) {
    goto LABEL_269;
  }
  int v1 = a1[1];
  unint64_t v2 = *a1;
  free(a1);
  sub_1000064BC("%s %d: starting interactive session for %ssocket %d\n", v3, v4, v5, v6, v7, v8, v9, (char)"remote");
  int out_token = -1;
  int notify_fd = -1;
  if ((xmmword_10001E448 & 2) != 0) {
    int v10 = 2;
  }
  else {
    int v10 = xmmword_10001E448 & 1;
  }
  int v167 = v10;
  unint64_t v173 = 0LL;
  uint64_t v181 = 0LL;
  uint64_t v182 = 0LL;
  uint64_t v180 = 0LL;
  if ((v1 & 1) != 0) {
    sleep(1u);
  }
  strcpy(__s, "\n========================\nASL is here to serve you\n");
  size_t v11 = strlen(__s);
  if (write(v2, __s, v11) < 0)
  {
    close(v2);
    goto LABEL_268;
  }

  if ((v1 & 1) != 0)
  {
    strcpy(__s, "> ");
    size_t v12 = strlen(__s);
    if (write(v2, __s, v12) < 0)
    {
      sub_1000064BC("%s %d: terminating session for %ssocket %d\n", v13, v14, v15, v16, v17, v18, v19, (char)"remote");
      uint64_t v20 = 0LL;
      if ((v2 & 0x80000000) == 0)
      {
        uint64_t v168 = 0LL;
        LODWORD(v21) = 0;
        goto LABEL_258;
      }

      goto LABEL_264;
    }
  }

  unint64_t v169 = 0LL;
  uint64_t v22 = 0LL;
  int v23 = 0;
  int v171 = 1 << v2;
  unint64_t v170 = v2 >> 5;
  uint64_t v168 = 0LL;
  int v24 = 1;
  while (1)
  {
    do
    {
      do
      {
LABEL_14:
        int v172 = v23;
        uint64_t v21 = v22;
        if ((v1 & 1) == 0)
        {
          if (v24)
          {
            strcpy(__s, "> ");
            size_t v25 = strlen(__s);
            if (write(v2, __s, v25) < 0) {
              goto LABEL_256;
            }
          }
        }

        bzero(__s, 0x400uLL);
        memset(&v175, 0, sizeof(v175));
        if (__darwin_check_fd_set_overflow(v2, &v175, 0)) {
          v175.fds_bits[v170] |= v171;
        }
        memset(&v174, 0, sizeof(v174));
        if (__darwin_check_fd_set_overflow(v2, &v174, 0)) {
          v174.fds_bits[v170] |= v171;
        }
        unint64_t v33 = notify_fd;
        int v34 = v2;
        if (notify_fd != -1)
        {
          if (__darwin_check_fd_set_overflow(notify_fd, &v175, 0)) {
            *(__int32_t *)((char *)v175.fds_bits + ((v33 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v33;
          }
          int v34 = notify_fd;
        }

        int v35 = select(v34 + 1, &v175, 0LL, &v174, 0LL);
        int v24 = 1;
        uint64_t v22 = v21;
        int v23 = v172;
      }

      while (!v35);
      if (v35 < 0)
      {
        __error();
        uint64_t v151 = __error();
        strerror(*v151);
        sub_1000064BC("%s %d: select %d %s\n", v152, v153, v154, v155, v156, v157, v158, (char)"remote");
        goto LABEL_256;
      }

      if (__darwin_check_fd_set_overflow(v2, &v174, 0) && (v174.fds_bits[v170] & v171) != 0)
      {
        sub_1000064BC("%s %d: error on socket %d\n", v36, v37, v38, v39, v40, v41, v42, (char)"remote");
        goto LABEL_256;
      }

      unint64_t v43 = notify_fd;
      if (notify_fd != -1
        && __darwin_check_fd_set_overflow(notify_fd, &v175, 0)
        && ((*(unsigned int *)((char *)v175.fds_bits + ((v43 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v43) & 1) != 0)
      {
        read(notify_fd, v186, 4uLL);
      }

      if (__darwin_check_fd_set_overflow(v2, &v174, 0) && (v174.fds_bits[v170] & v171) != 0)
      {
        sub_1000064BC("%s %d: socket %d reported error\n", v44, v45, v46, v47, v48, v49, v50, (char)"remote");
        goto LABEL_256;
      }

      if (!__darwin_check_fd_set_overflow(v2, &v175, 0) || (v175.fds_bits[v170] & v171) == 0) {
        goto LABEL_203;
      }
      ssize_t v51 = read(v2, __s, 0x3FFuLL);
      if (v51 < 1)
      {
        __error();
        uint64_t v159 = __error();
        strerror(*v159);
        sub_1000064BC( "%s %d: read error on socket %d: %d %s\n",  v160,  v161,  v162,  v163,  v164,  v165,  v166,  (char)"remote");
        goto LABEL_256;
      }

      if (v51 != 1)
      {
        do
        {
          int v52 = __s[v51 - 1];
          if (v52 != 13 && v52 != 10) {
            break;
          }
          __s[v51 - 1] = 0;
        }

        while ((unint64_t)v51-- > 2);
      }

      if (*(unsigned __int16 *)__s == 113
        || !(*(_DWORD *)__s ^ 0x74697571 | __s[4])
        || !(*(_DWORD *)__s ^ 0x74697865 | __s[4]))
      {
        strcpy(__s, "Goodbye\n");
        size_t v142 = strlen(__s);
        write(v2, __s, v142);
        close(v2);
        sub_1000064BC( "%s %d: terminating session for %ssocket %d\n",  v143,  v144,  v145,  v146,  v147,  v148,  v149,  (char)"remote");
        goto LABEL_261;
      }

      if (*(unsigned __int16 *)__s == 63 || !(*(_DWORD *)__s ^ 0x706C6568 | __s[4]))
      {
        strcpy(__s, "Commands\n");
        size_t v60 = strlen(__s);
        if (write(v2, __s, v60) < 0) {
          goto LABEL_256;
        }
        strcpy(__s, "    quit                 exit session\n");
        size_t v61 = strlen(__s);
        if (write(v2, __s, v61) < 0) {
          goto LABEL_256;
        }
        strcpy(__s, "    select [val]         get [set] current database\n");
        size_t v62 = strlen(__s);
        if (write(v2, __s, v62) < 0) {
          goto LABEL_256;
        }
        strcpy(__s, "                         val must be file or mem\n");
        size_t v63 = strlen(__s);
        if (write(v2, __s, v63) < 0) {
          goto LABEL_256;
        }
        strcpy(__s, "    file [on/off]        enable / disable file store\n");
        size_t v64 = strlen(__s);
        if (write(v2, __s, v64) < 0) {
          goto LABEL_256;
        }
        strcpy(__s, "    memory [on/off]      enable / disable memory store\n");
        size_t v65 = strlen(__s);
        if (write(v2, __s, v65) < 0) {
          goto LABEL_256;
        }
        strcpy(__s, "    stats                database statistics\n");
        size_t v66 = strlen(__s);
        if (write(v2, __s, v66) < 0) {
          goto LABEL_256;
        }
        strcpy(__s, "    flush                flush database\n");
        size_t v67 = strlen(__s);
        if (write(v2, __s, v67) < 0) {
          goto LABEL_256;
        }
        strcpy(__s, "    dbsize [val]         get [set] database size (# of records)\n");
        size_t v68 = strlen(__s);
        if (write(v2, __s, v68) < 0) {
          goto LABEL_256;
        }
        strcpy(__s, "    watch                print new messages as they arrive\n");
        size_t v69 = strlen(__s);
        if (write(v2, __s, v69) < 0) {
          goto LABEL_256;
        }
        strcpy(__s, "    stop                 stop watching for new messages\n");
        size_t v70 = strlen(__s);
        if (write(v2, __s, v70) < 0) {
          goto LABEL_256;
        }
        strcpy(__s, "    raw                  use raw format for printing messages\n");
        size_t v71 = strlen(__s);
        if (write(v2, __s, v71) < 0) {
          goto LABEL_256;
        }
        strcpy(__s, "    std                  use standard format for printing messages\n");
        size_t v72 = strlen(__s);
        if (write(v2, __s, v72) < 0) {
          goto LABEL_256;
        }
        strcpy(__s, "    *                    show all log messages\n");
        size_t v73 = strlen(__s);
        if (write(v2, __s, v73) < 0) {
          goto LABEL_256;
        }
        strcpy(__s, "    * key val            equality search for messages (single key/value pair)\n");
        size_t v74 = strlen(__s);
        if (write(v2, __s, v74) < 0) {
          goto LABEL_256;
        }
        strcpy(__s, "    * op key val         search for matching messages (single key/value pair)\n");
        size_t v75 = strlen(__s);
        if (write(v2, __s, v75) < 0) {
          goto LABEL_256;
        }
        strcpy(__s, "    * [op key val] ...   search for matching messages (multiple key/value pairs)\n");
        size_t v76 = strlen(__s);
        if (write(v2, __s, v76) < 0) {
          goto LABEL_256;
        }
        strcpy(__s, "                         operators:  =  <  >  ! (not equal)  T (key exists)  R (regex)\n");
        size_t v77 = strlen(__s);
        if (write(v2, __s, v77) < 0) {
          goto LABEL_256;
        }
        strcpy(__s, "                         modifiers (must follow operator):\n");
        size_t v78 = strlen(__s);
        if (write(v2, __s, v78) < 0) {
          goto LABEL_256;
        }
        strcpy(__s, "                                 C=casefold  N=numeric  S=substring  A=prefix  Z=suffix\n");
        size_t v79 = strlen(__s);
        if (write(v2, __s, v79) < 0) {
          goto LABEL_256;
        }
        strcpy(__s, "\n");
        goto LABEL_89;
      }

      if (*(_DWORD *)__s == 1952543859 && *(unsigned __int16 *)&__s[4] == 115)
      {
        uint64_t v82 = sub_10000A964(v167);
        uint64_t v83 = (void *)asl_format_message(v82, "raw", "sec", 0LL, &v179);
        write(v2, v83, v179);
        free(v83);
        asl_msg_release(v82);
        int v24 = 1;
        uint64_t v22 = v21;
        int v23 = v172;
        goto LABEL_14;
      }

      if (*(_DWORD *)__s == 1701602675 && *(unsigned __int16 *)&__s[4] == 29795)
      {
        for (unint64_t i = &__s[6]; ; ++i)
        {
          int v85 = *i;
          if (v85 != 9 && v85 != 32) {
            break;
          }
        }

        if (!*i)
        {
          if (v167 == 1)
          {
            strcpy(__s, "file store\n");
          }

          else if (v167)
          {
            strcpy(__s, "memory store\n");
          }

          else
          {
            strcpy(__s, "no store\n");
          }

          goto LABEL_89;
        }

        if (strncmp(i, "file", 4uLL))
        {
          if (strncmp(i, "mem", 3uLL))
          {
            strcpy(__s, "unknown database type\n");
            goto LABEL_161;
          }

          if ((xmmword_10001E448 & 2) == 0)
          {
            strcpy(__s, "memory database is not enabled\n");
            goto LABEL_89;
          }

          int v167 = 2;
LABEL_181:
          strcpy(__s, "OK\n");
          goto LABEL_89;
        }

        if ((xmmword_10001E448 & 1) != 0)
        {
          int v167 = 1;
          goto LABEL_181;
        }

        strcpy(__s, "file database is not enabled\n");
LABEL_161:
        size_t v104 = strlen(__s);
        ssize_t v81 = write(v2, __s, v104);
        int v24 = 1;
        uint64_t v22 = v21;
LABEL_92:
        int v23 = v172;
        if (v81 < 0) {
          goto LABEL_256;
        }
        goto LABEL_14;
      }

      if (*(_DWORD *)__s == 1701603686)
      {
        for (uint64_t j = &__s[4]; ; ++j)
        {
          int v59 = *j;
          if (v59 != 9 && v59 != 32) {
            break;
          }
        }

        if (!*j)
        {
          uint64_t v92 = (const char *)&unk_100015297;
          if ((xmmword_10001E448 & 1) == 0) {
            uint64_t v92 = "not ";
          }
          snprintf(__s, 0x400uLL, "file database is %senabled\n", v92);
          size_t v93 = strlen(__s);
          if (write(v2, __s, v93) < 0) {
            goto LABEL_256;
          }
          int v94 = v167;
          if ((xmmword_10001E448 & 1) != 0) {
            int v94 = 1;
          }
LABEL_149:
          int v167 = v94;
          int v24 = 1;
          uint64_t v22 = v21;
          int v23 = v172;
          goto LABEL_14;
        }

        if (!strcmp(j, "on"))
        {
          int v95 = xmmword_10001E448 | 1;
        }

        else
        {
          if (strcmp(j, "off")) {
            goto LABEL_181;
          }
          int v95 = xmmword_10001E448 & 0xFFFFFFFE;
        }

        goto LABEL_180;
      }

      if (*(_DWORD *)__s == 1869440365 && *(unsigned __int16 *)&__s[4] == 31090)
      {
        for (k = &__s[6]; ; ++k)
        {
          int v97 = *k;
          if (v97 != 9 && v97 != 32) {
            break;
          }
        }

        if (!*k)
        {
          int v98 = (const char *)&unk_100015297;
          if ((xmmword_10001E448 & 2) == 0) {
            int v98 = "not ";
          }
          snprintf(__s, 0x400uLL, "memory database is %senabled\n", v98);
          size_t v99 = strlen(__s);
          if (write(v2, __s, v99) < 0) {
            goto LABEL_256;
          }
          int v94 = v167;
          if ((xmmword_10001E448 & 2) != 0) {
            int v94 = 2;
          }
          goto LABEL_149;
        }

        if (!strcmp(k, "on"))
        {
          int v95 = xmmword_10001E448 | 2;
        }

        else
        {
          if (strcmp(k, "off")) {
            goto LABEL_181;
          }
          int v95 = xmmword_10001E448 & 0xFFFFFFFD;
        }

LABEL_180:
        LODWORD(xmmword_10001E448) = v95;
        goto LABEL_181;
      }

      if (*(_DWORD *)__s == 1769169508 && *(unsigned __int16 *)&__s[4] == 25978)
      {
        uint64_t v100 = &__s[6];
        if (!v167)
        {
          strcpy(__s, "no store\n");
          size_t v101 = strlen(__s);
          ssize_t v81 = write(v2, __s, v101);
          int v167 = 0;
LABEL_90:
          int v24 = 1;
LABEL_91:
          uint64_t v22 = v21;
          goto LABEL_92;
        }

        while (1)
        {
          int v102 = *(unsigned __int8 *)v100;
          if (v102 != 9 && v102 != 32) {
            break;
          }
          ++v100;
        }

        if (*v100)
        {
          int v106 = atoi(v100);
          v186[0] = v106;
          if (v167 == 2)
          {
            DWORD2(xmmword_10001E448) = v106;
          }

          else if (v167 == 1)
          {
            DWORD1(xmmword_10001E448) = v106;
          }

          goto LABEL_181;
        }

        if (v167 == 2)
        {
          int v103 = DWORD2(xmmword_10001E448);
        }

        else if (v167 == 1)
        {
          int v103 = DWORD1(xmmword_10001E448);
        }

        else
        {
          int v103 = 0;
        }

        snprintf(__s, 0x400uLL, "DB size %u\n", v103);
LABEL_89:
        size_t v80 = strlen(__s);
        ssize_t v81 = write(v2, __s, v80);
        goto LABEL_90;
      }

      if (!(*(_DWORD *)__s ^ 0x706F7473 | __s[4]))
      {
        if ((_DWORD)v21)
        {
          notify_cancel(out_token);
          int out_token = -1;
          int notify_fd = -1;
          unint64_t v173 = 0LL;
          if (v168) {
            free(v168);
          }
          strcpy(__s, "OK\n");
          size_t v105 = strlen(__s);
          ssize_t v81 = write(v2, __s, v105);
          uint64_t v168 = 0LL;
          unint64_t v169 = 0LL;
          uint64_t v22 = 0LL;
          LODWORD(v21) = 0;
        }

        else
        {
          strcpy(__s, "not watching!\n");
          size_t v107 = strlen(__s);
          ssize_t v81 = write(v2, __s, v107);
          uint64_t v22 = 0LL;
        }

        int v24 = 1;
        goto LABEL_92;
      }

      if (*(_DWORD *)__s == 6583411)
      {
        int v23 = 0;
        int v24 = 1;
        uint64_t v22 = v21;
        goto LABEL_14;
      }

      int v24 = 1;
      uint64_t v22 = v21;
      int v23 = 1;
    }

    while (*(_DWORD *)__s == 7823730);
    int v89 = __s[0];
    if (__s[0] - 33 > 0x33 || ((1LL << (__s[0] - 33)) & 0x8000038000201LL) == 0)
    {
      strcpy(__s, "unrecognized command\n");
      size_t v139 = strlen(__s);
      if (write(v2, __s, v139) < 0) {
        goto LABEL_256;
      }
      strcpy(__s, "enter help for help\n");
      goto LABEL_250;
    }

    uint64_t v180 = 0LL;
    uint64_t v181 = 0LL;
    uint64_t v182 = 0LL;
    if (v168)
    {
      free(v168);
      int v89 = __s[0];
    }

    for (m = (_BYTE *)((unint64_t)__s | (v89 == 42)); ; ++m)
    {
      unsigned int v91 = *m;
      if (v91 > 0x51)
      {
        if (v91 == 82 || v91 == 84)
        {
LABEL_201:
          uint64_t v176 = 0LL;
          asprintf(&v176, "Q [%s]");
        }

        else if (v91 == 91)
        {
          uint64_t v176 = 0LL;
          asprintf(&v176, "Q %s");
        }

        else
        {
LABEL_251:
          uint64_t v176 = 0LL;
          asprintf(&v176, "Q [= %s]");
        }

        uint64_t v168 = (void *)asl_msg_from_string(v176);
        free(v176);
LABEL_203:
        int v108 = 0;
        int v110 = 1;
        goto LABEL_204;
      }

      if (v91 > 0x3E) {
        goto LABEL_251;
      }
      if (((1LL << v91) & 0x100000200LL) == 0) {
        break;
      }
    }

    if (((1LL << v91) & 0x7000000200000000LL) != 0) {
      goto LABEL_201;
    }
    if (*m) {
      goto LABEL_251;
    }
    int v108 = 0;
    uint64_t v168 = 0LL;
    BOOL v109 = v21 == 2;
    int v24 = 1;
    if ((v1 & 1) != 0)
    {
      uint64_t v22 = 2LL;
      int v23 = v172;
      if ((_DWORD)v21 == 2) {
        continue;
      }
    }

LABEL_209:
    if ((_DWORD)v21) {
      unint64_t v111 = v169;
    }
    else {
      unint64_t v111 = 0LL;
    }
    uint64_t v183 = 0LL;
    unint64_t v173 = 0LL;
    sub_100008638((uint64_t)&v180, (uint64_t)&v183, v111, 0, 0, 0, (uint64_t)&v173, 0, 0, 0);
    if (v173 >= v111) {
      unint64_t v112 = v173 + 1;
    }
    else {
      unint64_t v112 = v111;
    }
    if (!v109) {
      unint64_t v112 = v111;
    }
    unint64_t v169 = v112;
    uint64_t v113 = v183;
    if (v183)
    {
      if (v172)
      {
        if (v109 && (strcpy(__s, "\n"), size_t v114 = strlen(__s), write(v2, __s, v114) < 0))
        {
          LODWORD(v21) = 2;
        }

        else
        {
          unsigned int v179 = 0;
          uint64_t v115 = (void *)asl_msg_list_to_string();
          write(v2, v115, v179);
          free(v115);
          strcpy(__s, "\n");
          size_t v116 = strlen(__s);
          if ((write(v2, __s, v116) & 0x8000000000000000LL) == 0)
          {
            uint64_t v113 = v183;
            goto LABEL_238;
          }
        }

LABEL_256:
        sub_1000064BC("%s %d: terminating session for %ssocket %d\n", v26, v27, v28, v29, v30, v31, v32, (char)"remote");
        if ((v2 & 0x80000000) == 0)
        {
          if ((v1 & 1) != 0) {
LABEL_258:
          }
            sub_100007AA0(v2);
LABEL_259:
          close(v2);
        }

LABEL_261:
        if ((_DWORD)v21 == 1) {
          dispatch_resume((dispatch_object_t)qword_10001E3D0);
        }
        uint64_t v20 = v168;
LABEL_264:
        if ((out_token & 0x80000000) == 0)
        {
          uint64_t v150 = v20;
          notify_cancel(out_token);
          uint64_t v20 = v150;
        }

        if (v20) {
          asl_msg_release(v20);
        }
LABEL_268:
        a1 = 0LL;
LABEL_269:
        pthread_exit(a1);
      }

      uint64_t v21 = v21;
      if ((v21 - 1) <= 1)
      {
        strcpy(__s, "\n");
        size_t v117 = strlen(__s);
        if (write(v2, __s, v117) < 0) {
          goto LABEL_256;
        }
        uint64_t v113 = v183;
      }

      strcpy(__s, "\n");
      v186[0] = 0;
      if (*(_DWORD *)(v113 + 8))
      {
        int v118 = 0;
        while (1)
        {
          uint64_t v119 = (void *)asl_format_message(*(void *)(*(void *)(v113 + 16) + 8LL * v118), "std", "lcl", 1LL, &v179);
          do
          {
            *__error() = 0;
            if ((write(v2, v119, v179) & 0x80000000) != 0)
            {
              __error();
              unint64_t v120 = __error();
              strerror(*v120);
              sub_1000064BC( "%s %d: %d/%d write data failed: %d %s\n",  v121,  v122,  v123,  v124,  v125,  v126,  v127,  (char)"remote");
              if (*__error() != 35)
              {
                free(v119);
                asl_msg_list_release(v183);
                uint64_t v183 = 0LL;
                goto LABEL_256;
              }

              usleep(0x2710u);
            }
          }

          while (*__error() == 35);
          free(v119);
          if (HIDWORD(qword_10001E458)) {
            usleep(HIDWORD(qword_10001E458));
          }
          int v118 = v186[0] + 1;
          v186[0] = v118;
          uint64_t v113 = v183;
          if (v118 >= *(_DWORD *)(v183 + 8))
          {
LABEL_238:
            uint64_t v21 = v21;
            break;
          }
        }
      }

LABEL_239:
      asl_msg_list_release(v113);
      uint64_t v22 = v21;
      int v23 = v172;
      if ((_DWORD)v21 == 1)
      {
        sub_100007968(v2);
        dispatch_resume((dispatch_object_t)qword_10001E3D0);
        uint64_t v22 = 2LL;
        int v23 = v172;
      }
    }

    else
    {
      if ((_DWORD)v21)
      {
        uint64_t v113 = 0LL;
        int v24 = v108;
        goto LABEL_239;
      }

      strcpy(__s, "-nil-\n");
      size_t v128 = strlen(__s);
      if (write(v2, __s, v128) < 0)
      {
        LODWORD(v21) = 0;
        goto LABEL_256;
      }

      asl_msg_list_release(v183);
      uint64_t v22 = 0LL;
      int v24 = 1;
      int v23 = v172;
    }
  }

  if ((v1 & 1) == 0 && (_DWORD)v21)
  {
    strcpy(__s, "already watching!\n");
LABEL_250:
    size_t v140 = strlen(__s);
    ssize_t v81 = write(v2, __s, v140);
    goto LABEL_91;
  }

  if ((v1 & 1) != 0)
  {
    dispatch_suspend((dispatch_object_t)qword_10001E3D0);
    uint64_t v21 = 1LL;
  }

  else
  {
    uint32_t v129 = notify_register_file_descriptor("com.apple.system.logger.message", &notify_fd, 0, &out_token);
    if (v129)
    {
      snprintf(__s, 0x400uLL, "notify_register_file_descriptor failed: %d\n", v129);
      size_t v130 = strlen(__s);
      ssize_t v131 = write(v2, __s, v130);
      uint64_t v22 = v21;
      int v23 = v172;
      if (v131 < 0)
      {
        sub_1000064BC( "%s %d: terminating session for %ssocket %d\n",  v132,  v133,  v134,  v135,  v136,  v137,  v138,  (char)"remote");
        if ((v2 & 0x80000000) == 0) {
          goto LABEL_259;
        }
        goto LABEL_261;
      }

      goto LABEL_14;
    }

    uint64_t v21 = 2LL;
  }

  strcpy(__s, "OK\n");
  size_t v141 = strlen(__s);
  if (write(v2, __s, v141) < 0) {
    goto LABEL_256;
  }
  int v108 = 2;
  int v110 = 2;
LABEL_204:
  BOOL v109 = v21 == 2;
  if ((v1 & 1) == 0 || (uint64_t v22 = 2LL, v24 = 1, v23 = v172, (_DWORD)v21 != 2))
  {
    if (v168)
    {
      LODWORD(v181) = 1;
      uint64_t v178 = v168;
      int v24 = v110;
      uint64_t v182 = &v178;
    }

    else
    {
      uint64_t v168 = 0LL;
      int v24 = v110;
    }

    goto LABEL_209;
  }

  goto LABEL_14;
}

uint64_t sub_10000C0B4(int a1, int a2)
{
  if (a2 == 1) {
    socklen_t v3 = 128;
  }
  else {
    socklen_t v3 = 106;
  }
  socklen_t v36 = v3;
  sockaddr v37 = (sockaddr)0;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  int v4 = accept(a1, &v37, &v36);
  if (v4 == -1)
  {
    uint64_t v8 = __error();
    strerror(*v8);
    sub_1000064BC("%s: accept: %s\n", v9, v10, v11, v12, v13, v14, v15, (char)"remote");
    return 0LL;
  }

  int v5 = v4;
  unsigned int v35 = fcntl(v4, 3, 0LL) & 0xFFFFFFFB;
  if (fcntl(v5, 4, v35) < 0)
  {
    uint64_t v16 = __error();
    strerror(*v16);
    sub_1000064BC("%s: fcntl: %s\n", v17, v18, v19, v20, v21, v22, v23, (char)"remote");
LABEL_15:
    close(v5);
    return 0LL;
  }

  int v34 = 1;
  setsockopt(v5, 0xFFFF, 4130, &v34, 4u);
  if (a2 == 1)
  {
    unsigned int v35 = 1;
    setsockopt(v5, 6, 1, &v35, 4u);
  }

  uint64_t v6 = calloc(1uLL, 8uLL);
  if (!v6)
  {
    int v24 = __error();
    strerror(*v24);
    sub_1000064BC("%s: malloc: %s\n", v25, v26, v27, v28, v29, v30, v31, (char)"remote");
    goto LABEL_15;
  }

  uint64_t v7 = v6;
  _DWORD *v6 = v5;
  if (!a2) {
    v6[1] |= 1u;
  }
  pthread_attr_init(&v45);
  pthread_attr_setdetachstate(&v45, 2);
  pthread_create(&v33, &v45, (void *(__cdecl *)(void *))sub_10000A9C0, v7);
  pthread_attr_destroy(&v45);
  return 0LL;
}

uint64_t sub_10000C294()
{
  uint64_t v0 = socket(1, 1, 0);
  if ((v0 & 0x80000000) != 0)
  {
    unint64_t v2 = __error();
    strerror(*v2);
    sub_1000064BC("%s: socket: %s\n", v3, v4, v5, v6, v7, v8, v9, (char)"remote");
    return 0xFFFFFFFFLL;
  }

  uint64_t v1 = v0;
  int v45 = 1;
  if (setsockopt(v0, 0xFFFF, 512, &v45, 4u) < 0)
  {
    uint64_t v10 = __error();
    strerror(*v10);
    sub_1000064BC("%s: setsockopt: %s\n", v11, v12, v13, v14, v15, v16, v17, (char)"remote");
LABEL_12:
    close(v1);
    return 0xFFFFFFFFLL;
  }

  mkdir("/var/run/lockdown", 0x1FFu);
  sockaddr v46 = (sockaddr)0;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  memset(v51, 0, sizeof(v51));
  v46.sa_family = 1;
  __strlcpy_chk(v46.sa_data, "/var/run/lockdown/syslog.sock", 104LL, 104LL);
  unlink(v46.sa_data);
  if (bind(v1, &v46, 0x69u) < 0)
  {
    uint64_t v18 = __error();
    strerror(*v18);
    sub_1000064BC("%s: bind: %s\n", v19, v20, v21, v22, v23, v24, v25, (char)"remote");
    goto LABEL_12;
  }

  if (fcntl(v1, 4, 4LL) < 0)
  {
    uint64_t v26 = __error();
    strerror(*v26);
    sub_1000064BC("%s: fcntl: %s\n", v27, v28, v29, v30, v31, v32, v33, (char)"remote");
    goto LABEL_12;
  }

  if (listen(v1, 5) < 0)
  {
    int v34 = __error();
    strerror(*v34);
    sub_1000064BC("%s: listen: %s\n", v35, v36, v37, v38, v39, v40, v41, (char)"remote");
    goto LABEL_12;
  }

  chmod("/var/run/lockdown/syslog.sock", 0x1B6u);
  qword_10001D250 = (uint64_t)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_read,  v1,  0LL,  (dispatch_queue_t)qword_10001D248);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000LL;
  handler[2] = sub_10000C4E8;
  handler[3] = &unk_1000191D8;
  int v44 = v1;
  dispatch_source_set_event_handler((dispatch_source_t)qword_10001D250, handler);
  dispatch_resume((dispatch_object_t)qword_10001D250);
  return v1;
}

uint64_t sub_10000C4E8(uint64_t a1)
{
  return sub_10000C0B4(*(_DWORD *)(a1 + 32), 0);
}

uint64_t sub_10000C4F4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (qword_10001D258 != -1) {
    dispatch_once(&qword_10001D258, &stru_100019218);
  }
  sub_1000064BC("%s: init\n", a2, a3, a4, a5, a6, a7, a8, (char)"remote");
  dword_10001C030 = sub_10000C294();
  return 0LL;
}

void sub_10000C55C(id a1)
{
  qword_10001D248 = (uint64_t)dispatch_queue_create("remote", 0LL);
}

uint64_t sub_10000C584()
{
  if ((dword_10001C030 & 0x80000000) == 0) {
    close(dword_10001C030);
  }
  dword_10001C030 = -1;
  return 0LL;
}

uint64_t sub_10000C5B8()
{
  return 0LL;
}

uint64_t sub_10000C5C0()
{
  kern_return_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  kern_return_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  kern_return_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t result;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v0 = launch_data_new_string("CheckIn");
  qword_10001E360 = (uint64_t)launch_msg(v0);
  launch_data_free(v0);
  if (!qword_10001E360)
  {
    sub_1000064BC("%d launchd checkin failed\n", v1, v2, v3, v4, v5, v6, v7, dword_10001E37C);
    goto LABEL_16;
  }

  uint64_t v8 = launch_data_dict_lookup((const launch_data_t)qword_10001E360, "MachServices");
  if (!v8)
  {
    sub_1000064BC( "%d launchd lookup of LAUNCH_JOBKEY_MACHSERVICES failed\n",  v9,  v10,  v11,  v12,  v13,  v14,  v15,  dword_10001E37C);
    goto LABEL_16;
  }

  uint64_t v16 = launch_data_dict_lookup(v8, "com.apple.system.logger");
  if (!v16)
  {
    sub_1000064BC("%d launchd lookup of SERVICE_NAME failed\n", v17, v18, v19, v20, v21, v22, v23, dword_10001E37C);
    goto LABEL_16;
  }

  dword_10001E358 = launch_data_get_machport(v16);
  uint64_t v24 = mach_port_allocate(mach_task_self_, 1u, (mach_port_name_t *)&dword_10001E35C);
  if (v24)
  {
    sub_1000064BC("mach_port_allocate dead_session_port failed: %d", v25, v26, v27, v28, v29, v30, v31, v24);
    goto LABEL_16;
  }

  uint64_t v32 = mach_port_allocate(mach_task_self_, 3u, (mach_port_name_t *)&dword_10001E354);
  if (v32)
  {
    sub_1000064BC("mach_port_allocate listen_set failed: %d", v33, v34, v35, v36, v37, v38, v39, v32);
    goto LABEL_16;
  }

  uint64_t v40 = mach_port_move_member(mach_task_self_, dword_10001E358, dword_10001E354);
  if (v40)
  {
    sub_1000064BC("mach_port_move_member server_port failed: %d", v41, v42, v43, v44, v45, v46, v47, v40);
    goto LABEL_16;
  }

  uint64_t result = mach_port_move_member(mach_task_self_, dword_10001E35C, dword_10001E354);
  if ((_DWORD)result)
  {
    sub_1000064BC("mach_port_move_member dead_session_port failed (%u)", v49, v50, v51, v52, v53, v54, v55, result);
LABEL_16:
    exit(1);
  }

  return result;
}

uint64_t sub_10000C724(int a1, const char *a2)
{
  DWORD2(xmmword_10001E428) = a1;
  free((void *)qword_10001E438);
  qword_10001E438 = 0LL;
  if (a2) {
    qword_10001E438 = (uint64_t)strdup(a2);
  }
  return _os_nospin_lock_unlock(&unk_10001E348);
}

uint64_t sub_10000C788(int a1, int a2, int a3, int a4)
{
  char v8 = xmmword_10001E448;
  if ((xmmword_10001E448 & 1) != 0)
  {
    asl_store_close(xmmword_10001E3E8);
    *(void *)&xmmword_10001E3E8 = 0LL;
    char v8 = xmmword_10001E448;
  }

  if ((v8 & 2) != 0)
  {
    asl_memory_close(*((dispatch_object_t **)&xmmword_10001E3E8 + 1));
    *((void *)&xmmword_10001E3E8 + 1) = 0LL;
  }

  LODWORD(xmmword_10001E448) = a1;
  DWORD1(xmmword_10001E448) = a2;
  DWORD2(xmmword_10001E448) = a3;
  HIDWORD(xmmword_10001E448) = a4;
  return pthread_mutex_unlock((pthread_mutex_t *)qword_10001E398);
}

void sub_10000C810(uint64_t a1)
{
  *(void *)uint64_t v10 = 0x1500000001LL;
  if (!(_DWORD)a1)
  {
    uint64_t v6 = asl_msg_new(a1);
    if (!v6) {
      return;
    }
    uint64_t v2 = v6;
    asl_msg_set_key_val(v6, "Sender", "syslogd");
    asl_msg_set_key_val(v2, "Facility", "daemon");
    asl_msg_set_key_val(v2, "Level", "Notice");
    asl_msg_set_key_val(v2, "UID", "0");
    asl_msg_set_key_val(v2, "GID", "0");
    snprintf(__str, 0x100uLL, "%u", dword_10001E37C);
    asl_msg_set_key_val(v2, "PID", __str);
    uint64_t v4 = "Message";
    uint64_t v5 = "--- syslogd restarted ---";
    goto LABEL_10;
  }

  bzero(&v8, 0x280uLL);
  v8.ut_type = 2;
  v8.ut_pid = 1;
  size_t v7 = 16LL;
  if (sysctl(v10, 2u, &v8.ut_tv, &v7, 0LL, 0LL) < 0) {
    gettimeofday(&v8.ut_tv, 0LL);
  }
  pututxline(&v8);
  uint64_t v1 = asl_msg_new(0LL);
  if (v1)
  {
    uint64_t v2 = v1;
    asl_msg_set_key_val(v1, "Sender", "bootlog");
    asl_msg_set_key_val(v2, "Facility", "com.apple.system.utmpx");
    asl_msg_set_key_val(v2, "Level", "Notice");
    asl_msg_set_key_val(v2, "UID", "0");
    asl_msg_set_key_val(v2, "GID", "0");
    asl_msg_set_key_val(v2, "PID", "0");
    snprintf(__str, 0x100uLL, "BOOT_TIME %lu %u", v8.ut_tv.tv_sec, v8.ut_tv.tv_usec);
    asl_msg_set_key_val(v2, "Message", __str);
    asl_msg_set_key_val(v2, "ut_id", "0x00 0x00 0x00 0x00");
    asl_msg_set_key_val(v2, "ut_pid", "1");
    asl_msg_set_key_val(v2, "ut_type", "2");
    snprintf(__str, 0x100uLL, "%lu", v8.ut_tv.tv_sec);
    asl_msg_set_key_val(v2, "Time", __str);
    asl_msg_set_key_val(v2, "ut_tv.tv_sec", __str);
    snprintf(__str, 0x100uLL, "%u", v8.ut_tv.tv_usec);
    asl_msg_set_key_val(v2, "ut_tv.tv_usec", __str);
    uint64_t v3 = "000";
    if (!v8.ut_tv.tv_usec) {
      uint64_t v3 = (const char *)&unk_100015297;
    }
    snprintf(__str, 0x100uLL, "%u%s", v8.ut_tv.tv_usec, v3);
    uint64_t v4 = "TimeNanoSec";
    uint64_t v5 = __str;
LABEL_10:
    asl_msg_set_key_val(v2, v4, v5);
    sub_1000062A4(v2, 1);
  }

void start(int a1, uint64_t a2)
{
  unk_10001E348 = 0u;
  *(_OWORD *)&dword_10001E358 = 0u;
  xmmword_10001E368 = 0u;
  unk_10001E378 = 0u;
  xmmword_10001E388 = 0u;
  *(_OWORD *)&qword_10001E398 = 0u;
  xmmword_10001E3A8 = 0u;
  unk_10001E3B8 = 0u;
  unk_10001E3C8 = 0u;
  *(_OWORD *)&qword_10001E3D8 = 0u;
  xmmword_10001E3E8 = 0u;
  unk_10001E3F8 = 0u;
  xmmword_10001E408 = 0u;
  *(_OWORD *)&qword_10001E418 = 0u;
  xmmword_10001E428 = 0u;
  *(_OWORD *)&qword_10001E438 = 0u;
  xmmword_10001E448 = 0u;
  *(_OWORD *)&qword_10001E458 = 0u;
  *(__int128 *)((char *)&xmmword_10001E460 + 8) = 0u;
  *(__int128 *)((char *)&xmmword_10001E470 + 8) = 0u;
  qword_10001E398 = (uint64_t)calloc(1uLL, 0x40uLL);
  pthread_mutex_init((pthread_mutex_t *)qword_10001E398, 0LL);
  qword_10001E3D0 = (uint64_t)dispatch_queue_create("Work Queue", 0LL);
  dispatch_suspend((dispatch_object_t)qword_10001E3D0);
  sub_100005BE4();
  dword_10001D260 = 1;
  dword_10001C034 = 0;
  _malloc_no_asl_log = 1;
  if (a1 < 2)
  {
    int v94 = xmmword_10001E448;
LABEL_65:
    if (!v94) {
      *(void *)&xmmword_10001E448 = 0x186A00000000001LL;
    }
    signal(1, (void (__cdecl *)(int))1);
    *(_OWORD *)uint64_t v96 = 0u;
    __int128 v97 = 0u;
    time_t v95 = time(0LL);
    ctime_r(&v95, v96);
    BYTE3(v97) = 0;
    sub_1000064BC("\n%s syslogd PID %d starting\n", v16, v17, v18, v19, v20, v21, v22, (char)v96);
    memset(&v101, 0, sizeof(v101));
    if (stat("/var/run/syslog.pid", &v101)) {
      BOOL v23 = 0;
    }
    else {
      BOOL v23 = (v101.st_mode & 0xF000) == 0x8000;
    }
    uint64_t v24 = !v23;
    uint64_t v25 = fopen("/var/run/syslog.pid", "w");
    if (v25)
    {
      uint64_t v26 = v25;
      fprintf(v25, "%d\n", dword_10001E37C);
      fclose(v26);
    }

    sub_10000C810(v24);
    notify_register_plain("com.apple.system.syslog.master");
    notify_set_state(token, 0LL);
    sub_1000064BC("reading launch plist\n", v27, v28, v29, v30, v31, v32, v33, v88);
    sub_10000C5C0();
    sub_1000064BC("initializing modules\n", v34, v35, v36, v37, v38, v39, v40, v89);
    uint64_t v41 = calloc(1uLL, 0x28uLL);
    if (v41)
    {
      __int128 v50 = v41;
      *(void *)uint64_t v41 = "asl_action";
      v41[2] = 1;
      *((void *)v41 + setiopolicy_np(0, 0, 2) = sub_100001B3C;
      *((void *)v41 + 3) = sub_100001F6C;
      *((void *)v41 + 4) = sub_100001E10;
      sub_100001B3C((uint64_t)v41, v42, v43, v44, v45, v46, v47, v48);
      ssize_t v51 = calloc(1uLL, 0x28uLL);
      if (v51)
      {
        int v52 = v51;
        *(void *)ssize_t v51 = "bsd_out";
        int v53 = dword_10001C034;
        v51[2] = dword_10001C034;
        *((void *)v51 + setiopolicy_np(0, 0, 2) = sub_10000520C;
        *((void *)v51 + 3) = sub_100005960;
        *((void *)v51 + 4) = sub_100005838;
        if (v53)
        {
          sub_10000520C((uint64_t)v51, v42, v43, v44, v45, v46, v47, v48);
          dword_10001E404 = 1;
        }

        __int128 v54 = calloc(1uLL, 0x28uLL);
        if (v54)
        {
          __int128 v55 = v54;
          *(void *)__int128 v54 = "klog_in";
          int v56 = dword_10001C038;
          v54[2] = dword_10001C038;
          *((void *)v54 + setiopolicy_np(0, 0, 2) = sub_10000A788;
          *((void *)v54 + 3) = sub_10000A95C;
          *((void *)v54 + 4) = sub_10000A904;
          if (v56) {
            sub_10000A788((uint64_t)v54, v42, v43, v44, v45, v46, v47, v48);
          }
          __int128 v57 = calloc(1uLL, 0x28uLL);
          if (v57)
          {
            __int128 v58 = v57;
            *(void *)__int128 v57 = "udp_in";
            int v59 = dword_10001C03C;
            v57[2] = dword_10001C03C;
            *((void *)v57 + setiopolicy_np(0, 0, 2) = sub_10000D7F8;
            *((void *)v57 + 3) = sub_10000DB08;
            *((void *)v57 + 4) = sub_10000DA90;
            if (v59) {
              sub_10000D7F8((uint64_t)v57, v42, v43, v44, v45, v46, v47, v48);
            }
            size_t v60 = calloc(1uLL, 0x28uLL);
            if (v60)
            {
              size_t v61 = v60;
              *(void *)size_t v60 = "remote";
              int v62 = dword_10001D260;
              v60[2] = dword_10001D260;
              *((void *)v60 + setiopolicy_np(0, 0, 2) = sub_10000C4F4;
              *((void *)v60 + 3) = sub_10000C5B8;
              *((void *)v60 + 4) = sub_10000C584;
              if (v62) {
                sub_10000C4F4((uint64_t)v60, v42, v43, v44, v45, v46, v47, v48);
              }
              dword_10001E400 = 5;
              size_t v63 = calloc(5uLL, 8uLL);
              *((void *)&xmmword_10001E408 + 1) = v63;
              if (v63)
              {
                *size_t v63 = v50;
                *(void *)(*((void *)&xmmword_10001E408 + 1) + 8LL) = v52;
                *(void *)(*((void *)&xmmword_10001E408 + 1) + 16LL) = v55;
                *(void *)(*((void *)&xmmword_10001E408 + 1) + 24LL) = v58;
                *(void *)(*((void *)&xmmword_10001E408 + 1) + 32LL) = v61;
                sub_1000064BC( "setting up network change notification handler\n",  v42,  v43,  v44,  v45,  v46,  v47,  v48,  v90);
                notify_register_dispatch( "com.apple.system.config.network_change",  &out_token,  (dispatch_queue_t)qword_10001E3D0,  &stru_100019258);
                sub_1000064BC("setting up quota notification handler\n", v64, v65, v66, v67, v68, v69, v70, v91);
                *(void *)&v101.st_dev = 0LL;
                asprintf((char **)&v101, "%s%s", "com.apple.system.notify.service.path:0x87:", "/etc/asl/.noquota");
                if (*(void *)&v101.st_dev)
                {
                  notify_register_dispatch(*(const char **)&v101.st_dev, &v99, &_dispatch_main_q, &stru_100019298);
                  free(*(void **)&v101.st_dev);
                }

                qword_10001E3E0 = (uint64_t)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_signal,  1uLL,  0LL,  &_dispatch_main_q);
                dispatch_source_set_event_handler((dispatch_source_t)qword_10001E3E0, &stru_1000192D8);
                dispatch_resume((dispatch_object_t)qword_10001E3E0);
                notify_register_plain("com.apple.system.logger.message");
                if (*((void *)&xmmword_10001E460 + 1))
                {
                  qword_10001E3D8 = (uint64_t)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  &_dispatch_main_q);
                  dispatch_source_set_event_handler((dispatch_source_t)qword_10001E3D8, &stru_100019358);
                  size_t v78 = (dispatch_source_s *)qword_10001E3D8;
                  dispatch_time_t v79 = dispatch_time(0LL, 1000000000LL * *((void *)&xmmword_10001E460 + 1));
                  dispatch_source_set_timer(v78, v79, 1000000000LL * *((void *)&xmmword_10001E460 + 1), 0LL);
                  dispatch_resume((dispatch_object_t)qword_10001E3D8);
                }

                sub_1000064BC("starting mach service\n", v71, v72, v73, v74, v75, v76, v77, v92);
                dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
                dispatch_async(global_queue, &stru_100019398);
                sub_1000064BC("starting work queue\n", v81, v82, v83, v84, v85, v86, v87, v93);
                dispatch_resume((dispatch_object_t)qword_10001E3D0);
                dispatch_main();
              }

              __int128 v49 = "alloc failed (init_modules)\n";
            }

            else
            {
              __int128 v49 = "alloc failed (init_modules remote)\n";
            }
          }

          else
          {
            __int128 v49 = "alloc failed (init_modules udp_in)\n";
          }
        }

        else
        {
          __int128 v49 = "alloc failed (init_modules klog_in)\n";
        }
      }

      else
      {
        __int128 v49 = "alloc failed (init_modules bsd_out)\n";
      }
    }

    else
    {
      __int128 v49 = "alloc failed (init_modules asl_action)\n";
    }

    sub_1000064BC(v49, v42, v43, v44, v45, v46, v47, v48, v90);
    exit(1);
  }

  int v4 = 1;
  do
  {
    uint64_t v5 = v4 + 1LL;
    if (!strcmp(*(const char **)(a2 + 8LL * v4), "-config") && (int)v5 < a1)
    {
      size_t v7 = *(const char **)(a2 + 8 * v5);
      if (*v7 != 45)
      {
        if (!strcmp(*(const char **)(a2 + 8 * v5), "mac"))
        {
          *(void *)&xmmword_10001E448 = 0x186A00000000001LL;
        }

        else if (!strcmp(v7, "appletv"))
        {
          *(void *)&xmmword_10001E448 = 0x9C400000000001LL;
        }

        else if (!strcmp(v7, "iphone"))
        {
          LODWORD(xmmword_10001E448) = 2;
          dword_10001D260 = 1;
        }

        ++v4;
      }
    }

    ++v4;
  }

  while (v4 < a1);
  int v94 = xmmword_10001E448;
  int v8 = 1;
  while (1)
  {
    uint64_t v9 = *(const char **)(a2 + 8LL * v8);
    if (!strcmp(v9, "-d"))
    {
      DWORD2(xmmword_10001E428) = 1;
      uint64_t v10 = v8 + 1LL;
      if (v8 + 1 >= a1 || (uint64_t v11 = *(const char **)(a2 + 8 * v10), *v11 == 45))
      {
LABEL_63:
        LODWORD(v10) = v8;
        goto LABEL_64;
      }

      qword_10001E438 = (uint64_t)strdup(v11);
    }

    else if (!strcmp(v9, "-db"))
    {
      uint64_t v12 = v8 + 1LL;
      if (v8 + 1 >= a1) {
        goto LABEL_63;
      }
      uint64_t v13 = *(const char **)(a2 + 8 * v12);
      if (*v13 == 45) {
        goto LABEL_63;
      }
      if (!strcmp(*(const char **)(a2 + 8 * v12), "file"))
      {
        LODWORD(xmmword_10001E448) = v94 | 1;
        uint64_t v10 = v8 + 2LL;
        v94 |= 1u;
        if (v8 + 2 < a1)
        {
          uint64_t v15 = *(const char **)(a2 + 8 * v10);
          if (*v15 != 45)
          {
            DWORD1(xmmword_10001E448) = atol(v15);
            goto LABEL_64;
          }
        }

LABEL_55:
        LODWORD(v10) = v8 + 1;
        goto LABEL_64;
      }

      if (strcmp(v13, "memory")) {
        goto LABEL_55;
      }
      LODWORD(xmmword_10001E448) = v94 | 2;
      uint64_t v10 = v8 + 2LL;
      v94 |= 2u;
      if (v8 + 2 >= a1) {
        goto LABEL_55;
      }
      uint64_t v14 = *(const char **)(a2 + 8 * v10);
      if (*v14 == 45) {
        goto LABEL_55;
      }
      DWORD2(xmmword_10001E448) = atol(v14);
    }

    else if (!strcmp(v9, "-m"))
    {
      uint64_t v10 = v8 + 1LL;
      if (v8 + 1 >= a1) {
        goto LABEL_63;
      }
      *((void *)&xmmword_10001E460 + 1) = 60 * atoll(*(const char **)(a2 + 8 * v10));
    }

    else if (!strcmp(v9, "-utmp_ttl"))
    {
      uint64_t v10 = v8 + 1LL;
      if (v8 + 1 >= a1) {
        goto LABEL_63;
      }
      *(void *)&xmmword_10001E470 = atol(*(const char **)(a2 + 8 * v10));
    }

    else if (!strcmp(v9, "-mps_limit"))
    {
      uint64_t v10 = v8 + 1LL;
      if (v8 + 1 >= a1) {
        goto LABEL_63;
      }
      LODWORD(qword_10001E458) = atol(*(const char **)(a2 + 8 * v10));
    }

    else if (!strcmp(v9, "-dup_delay"))
    {
      uint64_t v10 = v8 + 1LL;
      if (v8 + 1 >= a1) {
        goto LABEL_63;
      }
      *(void *)&xmmword_10001E460 = atoll(*(const char **)(a2 + 8 * v10));
    }

    else if (!strcmp(v9, "-klog_in"))
    {
      uint64_t v10 = v8 + 1LL;
      if (v8 + 1 >= a1) {
        goto LABEL_63;
      }
      dword_10001C038 = atoi(*(const char **)(a2 + 8 * v10));
    }

    else if (!strcmp(v9, "-udp_in"))
    {
      uint64_t v10 = v8 + 1LL;
      if (v8 + 1 >= a1) {
        goto LABEL_63;
      }
      dword_10001C03C = atoi(*(const char **)(a2 + 8 * v10));
    }

    else if (!strcmp(v9, "-launchd_in"))
    {
      uint64_t v10 = v8 + 1LL;
      if (v8 + 1 >= a1) {
        goto LABEL_63;
      }
      LODWORD(xmmword_10001E408) = atoi(*(const char **)(a2 + 8 * v10));
    }

    else if (!strcmp(v9, "-bsd_out"))
    {
      uint64_t v10 = v8 + 1LL;
      if (v8 + 1 >= a1) {
        goto LABEL_63;
      }
      dword_10001C034 = atoi(*(const char **)(a2 + 8 * v10));
    }

    else
    {
      if (strcmp(v9, "-remote")) {
        goto LABEL_63;
      }
      uint64_t v10 = v8 + 1LL;
      if (v8 + 1 >= a1) {
        goto LABEL_63;
      }
      dword_10001D260 = atoi(*(const char **)(a2 + 8 * v10));
    }

void sub_10000D560(id a1, int a2)
{
  if (dword_10001C03C) {
    sub_10000DB08();
  }
  if (dword_10001C034) {
    sub_100005960();
  }
}

void sub_10000D594(id a1, int a2)
{
  uint64_t v2 = 0LL;
  if (stat("/etc/asl/.noquota", &v3)) {
    asprintf(&v2, "[Sender syslogd] [Level 2] [PID %u] [Facility syslog] [Message *** MESSAGE QUOTAS ENABLED ***]");
  }
  else {
    asprintf( &v2,  "[Sender syslogd] [Level 2] [PID %u] [Facility syslog] [Message *** MESSAGE QUOTAS DISABLED FOR ALL PROCESSES ***]");
  }
  sub_100007114((uint64_t)v2);
  free(v2);
}

void sub_10000D61C(id a1)
{
}

void sub_10000D630(id a1)
{
  uint64_t v8 = sub_1000064BC("SIGHUP reset\n", v1, v2, v3, v4, v5, v6, v7, v13);
  int v9 = dword_10001E400;
  if (dword_10001E400 >= 1)
  {
    uint64_t v10 = 0LL;
    uint64_t v11 = *((void *)&xmmword_10001E408 + 1);
    do
    {
      uint64_t v12 = *(void *)(v11 + 8 * v10);
      if (*(_DWORD *)(v12 + 8))
      {
        uint64_t v8 = (*(uint64_t (**)(uint64_t))(v12 + 24))(v8);
        uint64_t v11 = *((void *)&xmmword_10001E408 + 1);
        int v9 = dword_10001E400;
      }

      ++v10;
    }

    while (v10 < v9);
  }

void sub_10000D6A8(int a1)
{
  socklen_t v19 = 128;
  sockaddr v21 = (sockaddr)0;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  ssize_t v1 = recvfrom(a1, byte_10001D268, 0x1000uLL, 0, &v21, &v19);
  if (v1 < 1) {
    return;
  }
  uint64_t v2 = v1;
  v20[0] = 0;
  if (v21.sa_family == 30)
  {
    uint64_t v3 = &v21.sa_data[6];
    int v4 = 30;
  }

  else
  {
    if (v21.sa_family != 2)
    {
      uint64_t v5 = 0LL;
      goto LABEL_8;
    }

    uint64_t v3 = &v21.sa_data[2];
    int v4 = 2;
  }

  inet_ntop(v4, v3, v20, 0x40u);
  uint64_t v5 = v20;
  sub_1000064BC("%s: fd %d recvfrom %s len %d\n", v6, v7, v8, v9, v10, v11, v12, (char)"udp_in");
LABEL_8:
  byte_10001D268[v2] = 0;
  char v13 = strrchr(byte_10001D268, 10);
  if (v13) {
    *char v13 = 0;
  }
  uint64_t v18 = sub_100007740((uint64_t)byte_10001D268, v2, v5, 3LL, v14, v15, v16, v17);
  sub_1000062A4((uint64_t)v18, 3);
}

uint64_t sub_10000D7F8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (qword_10001E270 != -1) {
    dispatch_once(&qword_10001E270, &stru_1000193D8);
  }
  sub_1000064BC("%s: init\n", a2, a3, a4, a5, a6, a7, a8, (char)"udp_in");
  if (dword_10001E280 > 0) {
    return 0LL;
  }
  if (qword_10001E360)
  {
    uint64_t v16 = launch_data_dict_lookup((const launch_data_t)qword_10001E360, "Sockets");
    if (v16)
    {
      __int128 v24 = launch_data_dict_lookup(v16, "NetworkListener");
      if (v24)
      {
        uint64_t v32 = v24;
        dword_10001E280 = launch_data_array_get_count(v24);
        if (dword_10001E280 < 1)
        {
          sub_1000064BC("%s: launchd fd array is empty\n", v33, v34, v35, v36, v37, v38, v39, (char)"udp_in");
        }

        else
        {
          size_t v40 = 0LL;
          while (1)
          {
            dword_10001E284[v40] = -1;
            index = launch_data_array_get_index(v32, v40);
            if (!index) {
              break;
            }
            uint64_t fd = launch_data_get_fd(index);
            int v71 = 0x20000;
            if (setsockopt(fd, 0xFFFF, 4098, &v71, 4u) < 0)
            {
              __int128 v50 = __error();
              uint64_t v67 = fd;
              uint64_t v68 = strerror(*v50);
              sub_1000064BC( "%s: couldn't set receive buffer size for file descriptor %d: %s\n",  v51,  v52,  v53,  v54,  v55,  v56,  v57,  (char)"udp_in");
            }

            if (fcntl(fd, 4, 4LL, v67, v68) < 0)
            {
              __int128 v58 = __error();
              uint64_t v67 = fd;
              uint64_t v68 = strerror(*v58);
              sub_1000064BC( "%s: couldn't set O_NONBLOCK for file descriptor %d: %s\n",  v59,  v60,  v61,  v62,  v63,  v64,  v65,  (char)"udp_in");
            }

            dword_10001E284[v40] = fd;
            uint64_t v66 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_read,  (int)fd,  0LL,  (dispatch_queue_t)qword_10001E278);
            qword_10001E2C8[v40] = v66;
            handler[0] = _NSConcreteStackBlock;
            handler[1] = 0x40000000LL;
            handler[2] = sub_10000DA88;
            handler[3] = &unk_1000193F8;
            int v70 = fd;
            dispatch_source_set_event_handler(v66, handler);
            dispatch_resume(qword_10001E2C8[v40]);
            uint64_t result = 0LL;
          }

          sub_1000064BC( "%s: launchd file discriptor array element 0 is NULL\n",  v42,  v43,  v44,  v45,  v46,  v47,  v48,  (char)"udp_in");
        }
      }

      else
      {
        sub_1000064BC( "%s: launchd lookup of UDP_SOCKET_NAME failed\n",  v25,  v26,  v27,  v28,  v29,  v30,  v31,  (char)"udp_in");
      }
    }

    else
    {
      sub_1000064BC( "%s: launchd lookup of LAUNCH_JOBKEY_SOCKETS failed\n",  v17,  v18,  v19,  v20,  v21,  v22,  v23,  (char)"udp_in");
    }
  }

  else
  {
    sub_1000064BC("%s: launchd dict is NULL\n", v8, v9, v10, v11, v12, v13, v14, (char)"udp_in");
  }

  return 0xFFFFFFFFLL;
}

void sub_10000DA60(id a1)
{
  qword_10001E278 = (uint64_t)dispatch_queue_create("udp_in", 0LL);
}

void sub_10000DA88(uint64_t a1)
{
}

uint64_t sub_10000DA90()
{
  int v0 = dword_10001E280;
  if (!dword_10001E280) {
    return 0xFFFFFFFFLL;
  }
  if (dword_10001E280 >= 1)
  {
    uint64_t v1 = 0LL;
    do
    {
      int v2 = dword_10001E284[v1];
      if (v2 != -1)
      {
        close(v2);
        dword_10001E284[v1] = -1;
        int v0 = dword_10001E280;
      }

      ++v1;
    }

    while (v1 < v0);
  }

  uint64_t result = 0LL;
  dword_10001E280 = 0;
  return result;
}

uint64_t sub_10000DB08()
{
  uint64_t v0 = sub_10000DA90();
  if ((_DWORD)v0) {
    return 0xFFFFFFFFLL;
  }
  else {
    return sub_10000D7F8(v0, v1, v2, v3, v4, v5, v6, v7);
  }
}

uint64_t asl_memory_statistics(uint64_t *a1, uint64_t *a2)
{
  if (!a1) {
    return 2LL;
  }
  if (!a2) {
    return 1LL;
  }
  uint64_t v4 = asl_msg_new(0LL);
  if (!v4) {
    return 9LL;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *((unsigned int *)a1 + 6);
  unint64_t v7 = ((unint64_t)(*((_DWORD *)a1 + 7) + 1) << 7) | 0x40;
  if ((_DWORD)v6)
  {
    uint64_t v8 = *a1;
    do
    {
      uint64_t v9 = *(const char **)(*(void *)v8 + 8LL);
      if (v9) {
        v7 += strlen(v9) + 17;
      }
      else {
        v7 += 16LL;
      }
      v8 += 8LL;
      --v6;
    }

    while (v6);
  }

  snprintf(__str, 0x100uLL, "%llu", v7);
  asl_msg_set_key_val(v5, "Size", __str);
  if (*((_DWORD *)a1 + 7))
  {
    int v10 = 0;
    uint64_t v11 = (void **)a1[1];
    uint64_t v12 = *((unsigned int *)a1 + 7);
    do
    {
      uint64_t v13 = *v11++;
      if (*v13) {
        ++v10;
      }
      --v12;
    }

    while (v12);
  }

  else
  {
    int v10 = 0;
  }

  snprintf(__str, 0x100uLL, "%u", *((_DWORD *)a1 + 7));
  asl_msg_set_key_val(v5, "MaxRecords", __str);
  snprintf(__str, 0x100uLL, "%u", v10);
  asl_msg_set_key_val(v5, "RecordCount", __str);
  snprintf(__str, 0x100uLL, "%u", *((_DWORD *)a1 + 6));
  asl_msg_set_key_val(v5, "StringCount", __str);
  snprintf(__str, 0x100uLL, "%lu", a1[6]);
  asl_msg_set_key_val(v5, "StringMemory", __str);
  snprintf(__str, 0x100uLL, "%lu", a1[5]);
  asl_msg_set_key_val(v5, "MaxStringMemory", __str);
  uint64_t result = 0LL;
  *a2 = v5;
  return result;
}

uint64_t asl_memory_close(dispatch_object_t *a1)
{
  if (a1)
  {
    uint64_t v2 = (dispatch_queue_s *)a1[7];
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000LL;
    block[2] = sub_10000DDD0;
    block[3] = &unk_100019418;
    void block[4] = a1;
    dispatch_sync(v2, block);
    dispatch_release(a1[7]);
    free(a1);
  }

  return 0LL;
}

void sub_10000DDD0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 8);
  if (v3)
  {
    if (*(_DWORD *)(v2 + 28))
    {
      unint64_t v4 = 0LL;
      do
      {
        free(*(void **)(*(void *)(v2 + 8) + 8 * v4));
        *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 8 * v4++) = 0LL;
        uint64_t v2 = *(void *)(a1 + 32);
      }

      while (v4 < *(unsigned int *)(v2 + 28));
      uint64_t v3 = *(void **)(v2 + 8);
    }

    free(v3);
    *(void *)(*(void *)(a1 + 32) + 8LL) = 0LL;
    uint64_t v2 = *(void *)(a1 + 32);
  }

  free(*(void **)(v2 + 16));
  *(void *)(*(void *)(a1 + 32) + 16LL) = 0LL;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)v5;
  if (*(void *)v5)
  {
    if (*(_DWORD *)(v5 + 24))
    {
      unint64_t v7 = 0LL;
      do
      {
        uint64_t v8 = *(void **)v5;
        uint64_t v9 = v8[v7];
        if (v9)
        {
          free(*(void **)(v9 + 8));
          free(*(void **)(**(void **)(a1 + 32) + 8 * v7));
          uint64_t v8 = **(void ***)(a1 + 32);
        }

        v8[v7++] = 0LL;
        uint64_t v5 = *(void *)(a1 + 32);
      }

      while (v7 < *(unsigned int *)(v5 + 24));
      uint64_t v6 = *(void **)v5;
    }

    free(v6);
    **(void **)(a1 + 3setiopolicy_np(0, 0, 2) = 0LL;
  }

uint64_t asl_memory_open(unsigned int a1, uint64_t a2, void *a3)
{
  if (!a3) {
    return 1LL;
  }
  if (a1) {
    size_t v4 = a1;
  }
  else {
    size_t v4 = 2000LL;
  }
  if (a2) {
    uint64_t v5 = a2;
  }
  else {
    uint64_t v5 = 4096000LL;
  }
  uint64_t v6 = calloc(1uLL, 0x40uLL);
  if (v6)
  {
    unint64_t v7 = v6;
    dispatch_queue_t v8 = dispatch_queue_create("ASL Memory Queue", 0LL);
    *((void *)v7 + 7) = v8;
    if (v8)
    {
      *((void *)v7 + 5) = v5;
      *((_DWORD *)v7 + 7) = v4;
      uint64_t v9 = calloc(v4, 8uLL);
      *((void *)v7 + 1) = v9;
      if (v9)
      {
        uint64_t v10 = 0LL;
        while (1)
        {
          *(void *)(*((void *)v7 + 1) + 8 * v10) = calloc(1uLL, 0x80uLL);
          if (!*(void *)(*((void *)v7 + 1) + 8 * v10)) {
            break;
          }
          if (v4 == ++v10)
          {
            uint64_t v11 = calloc(1uLL, 0x80uLL);
            *((void *)v7 + setiopolicy_np(0, 0, 2) = v11;
            if (v11)
            {
              uint64_t result = 0LL;
              *a3 = v7;
              return result;
            }

            break;
          }
        }

        asl_memory_close((dispatch_object_t *)v7);
        return 9LL;
      }

      dispatch_release(*((dispatch_object_t *)v7 + 7));
    }

    free(v7);
  }

  return 9LL;
}

uint64_t asl_memory_save(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = 0LL;
  dispatch_queue_t v8 = &v7;
  uint64_t v9 = 0x2000000000LL;
  if (a1 && *(void *)(a1 + 16))
  {
    uint64_t v3 = *(dispatch_queue_s **)(a1 + 56);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 0x40000000LL;
    v6[2] = sub_10000E06C;
    v6[3] = &unk_100019440;
    v6[4] = &v7;
    v6[5] = a1;
    v6[6] = a2;
    v6[7] = a3;
    dispatch_sync(v3, v6);
    uint64_t v4 = *((unsigned int *)v8 + 6);
  }

  else
  {
    uint64_t v4 = 2LL;
  }

  _Block_object_dispose(&v7, 8);
  return v4;
}

void sub_10000E06C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (!v2 || (uint64_t v3 = *(void *)(v2 + 16)) == 0)
  {
    int v16 = 2;
    goto LABEL_71;
  }

  uint64_t v4 = *(void *)(a1 + 48);
  if (!v4)
  {
    int v16 = 5;
    goto LABEL_71;
  }

  *(_OWORD *)(v3 + 96) = 0u;
  *(_OWORD *)(v3 + 11setiopolicy_np(0, 0, 2) = 0u;
  *(_OWORD *)(v3 + 64) = 0u;
  *(_OWORD *)(v3 + 80) = 0u;
  *(_OWORD *)(v3 + 3setiopolicy_np(0, 0, 2) = 0u;
  *(_OWORD *)(v3 + 48) = 0u;
  *(_OWORD *)uint64_t v3 = 0u;
  *(_OWORD *)(v3 + 16) = 0u;
  *(_WORD *)(v3 + 120) = 0;
  *(_BYTE *)(v3 + 12setiopolicy_np(0, 0, 2) = 7;
  *(void *)(v3 + 104) = -1LL;
  *(void *)(v3 + 8) = -1LL;
  *(_OWORD *)(v3 + 88) = xmmword_100014770;
  __s = 0LL;
  __s1 = 0LL;
  uint64_t v5 = asl_msg_fetch(v4, 0LL, &__s1, &__s, 0LL);
  if ((_DWORD)v5 == -1)
  {
LABEL_69:
    int v16 = 0;
    goto LABEL_71;
  }

  uint64_t v6 = v5;
  while (1)
  {
    uint64_t v7 = __s1;
    if (!__s1) {
      goto LABEL_68;
    }
    if (!strcmp(__s1, "Time"))
    {
      if (__s) {
        *(void *)(v3 + 8) = asl_core_parse_time(__s, 0LL);
      }
      goto LABEL_68;
    }

    if (!strcmp(v7, "TimeNanoSec"))
    {
      if (__s) {
        *(_DWORD *)(v3 + 88) = atoi(__s);
      }
      goto LABEL_68;
    }

    if (!strcmp(v7, "Host"))
    {
      if (__s) {
        *(void *)(v3 + 24) = sub_10000FAA4(v2, __s, 1);
      }
      goto LABEL_68;
    }

    if (!strcmp(v7, "Sender"))
    {
      if (__s) {
        *(void *)(v3 + 3setiopolicy_np(0, 0, 2) = sub_10000FAA4(v2, __s, 1);
      }
      goto LABEL_68;
    }

    if (!strcmp(v7, "PID"))
    {
      if (__s) {
        *(_DWORD *)(v3 + 9setiopolicy_np(0, 0, 2) = atoi(__s);
      }
      goto LABEL_68;
    }

    if (!strcmp(v7, "RefPID"))
    {
      if (__s) {
        *(_DWORD *)(v3 + 11setiopolicy_np(0, 0, 2) = atoi(__s);
      }
      goto LABEL_68;
    }

    if (!strcmp(v7, "UID"))
    {
      if (__s) {
        *(_DWORD *)(v3 + 96) = atoi(__s);
      }
      goto LABEL_68;
    }

    if (!strcmp(v7, "GID"))
    {
      if (__s) {
        *(_DWORD *)(v3 + 100) = atoi(__s);
      }
      goto LABEL_68;
    }

    if (!strcmp(v7, "Level"))
    {
      if (__s) {
        *(_BYTE *)(v3 + 12setiopolicy_np(0, 0, 2) = atoi(__s);
      }
      goto LABEL_68;
    }

    if (!strcmp(v7, "Message"))
    {
      if (__s) {
        *(void *)(v3 + 56) = sub_10000FAA4(v2, __s, 1);
      }
      goto LABEL_68;
    }

    if (!strcmp(v7, "SenderMachUUID"))
    {
      if (__s) {
        *(void *)(v3 + 40) = sub_10000FAA4(v2, __s, 1);
      }
      goto LABEL_68;
    }

    if (!strcmp(v7, "Facility"))
    {
      if (__s) {
        *(void *)(v3 + 48) = sub_10000FAA4(v2, __s, 1);
      }
      goto LABEL_68;
    }

    if (!strcmp(v7, "RefProc"))
    {
      if (__s) {
        *(void *)(v3 + 64) = sub_10000FAA4(v2, __s, 1);
      }
      goto LABEL_68;
    }

    if (!strcmp(v7, "Session"))
    {
      if (__s) {
        *(void *)(v3 + 7setiopolicy_np(0, 0, 2) = sub_10000FAA4(v2, __s, 1);
      }
      goto LABEL_68;
    }

    if (!strcmp(v7, "ReadUID"))
    {
      __int16 v10 = *(_WORD *)(v3 + 120);
      if ((v10 & 1) != 0 || !__s) {
        goto LABEL_68;
      }
      *(_DWORD *)(v3 + 104) = atoi(__s);
      __int16 v11 = v10 | 1;
LABEL_62:
      *(_WORD *)(v3 + 120) = v11;
      goto LABEL_68;
    }

    if (!strcmp(v7, "ReadGID"))
    {
      __int16 v12 = *(_WORD *)(v3 + 120);
      if ((v12 & 2) != 0 || !__s) {
        goto LABEL_68;
      }
      *(_DWORD *)(v3 + 108) = atoi(__s);
      __int16 v11 = v12 | 2;
      goto LABEL_62;
    }

    if (!strcmp(v7, "OSActivityID"))
    {
      if (__s) {
        *(void *)(v3 + 16) = atoll(__s);
      }
      goto LABEL_68;
    }

    if (strcmp(v7, "ASLMessageID"))
    {
      dispatch_queue_t v8 = sub_10000FAA4(v2, v7, 1);
      if (v8) {
        break;
      }
    }

double sub_10000E69C(uint64_t a1, uint64_t a2)
{
  if (a1 && a2)
  {
    sub_10000FD18(a1, *(void *)(a2 + 24));
    sub_10000FD18(a1, *(void *)(a2 + 32));
    sub_10000FD18(a1, *(void *)(a2 + 40));
    sub_10000FD18(a1, *(void *)(a2 + 48));
    sub_10000FD18(a1, *(void *)(a2 + 56));
    sub_10000FD18(a1, *(void *)(a2 + 64));
    sub_10000FD18(a1, *(void *)(a2 + 72));
    if (*(_DWORD *)(a2 + 116))
    {
      unint64_t v4 = 0LL;
      do
        sub_10000FD18(a1, *(void *)(*(void *)(a2 + 80) + 8 * v4++));
      while (v4 < *(unsigned int *)(a2 + 116));
    }

    uint64_t v5 = *(void **)(a2 + 80);
    if (v5) {
      free(v5);
    }
    double result = 0.0;
    *(_OWORD *)(a2 + 96) = 0u;
    *(_OWORD *)(a2 + 11setiopolicy_np(0, 0, 2) = 0u;
    *(_OWORD *)(a2 + 64) = 0u;
    *(_OWORD *)(a2 + 80) = 0u;
    *(_OWORD *)(a2 + 3setiopolicy_np(0, 0, 2) = 0u;
    *(_OWORD *)(a2 + 48) = 0u;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }

  return result;
}

uint64_t sub_10000E768(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  if (!a1) {
    return 2LL;
  }
  uint64_t result = 1LL;
  if (a2 && a3)
  {
    *a3 = 0LL;
    uint64_t v6 = asl_msg_new(0LL);
    if (v6)
    {
      uint64_t v7 = v6;
      snprintf(__str, 0x40uLL, "%llu", *(void *)a2);
      asl_msg_set_key_val(v7, "ASLMessageID", __str);
      snprintf(__str, 0x40uLL, "%u", *(unsigned __int8 *)(a2 + 122));
      asl_msg_set_key_val(v7, "Level", __str);
      if (*(void *)(a2 + 8) != -1LL)
      {
        snprintf(__str, 0x40uLL, "%llu", *(void *)(a2 + 8));
        asl_msg_set_key_val(v7, "Time", __str);
      }

      if (*(_DWORD *)(a2 + 88) != -1)
      {
        snprintf(__str, 0x40uLL, "%u", *(_DWORD *)(a2 + 88));
        asl_msg_set_key_val(v7, "TimeNanoSec", __str);
      }

      uint64_t v8 = *(void *)(a2 + 24);
      if (v8) {
        asl_msg_set_key_val(v7, "Host", *(void *)(v8 + 8));
      }
      uint64_t v9 = *(void *)(a2 + 32);
      if (v9) {
        asl_msg_set_key_val(v7, "Sender", *(void *)(v9 + 8));
      }
      uint64_t v10 = *(void *)(a2 + 40);
      if (v10) {
        asl_msg_set_key_val(v7, "SenderMachUUID", *(void *)(v10 + 8));
      }
      uint64_t v11 = *(void *)(a2 + 48);
      if (v11) {
        asl_msg_set_key_val(v7, "Facility", *(void *)(v11 + 8));
      }
      uint64_t v12 = *(void *)(a2 + 64);
      if (v12) {
        asl_msg_set_key_val(v7, "RefProc", *(void *)(v12 + 8));
      }
      uint64_t v13 = *(void *)(a2 + 72);
      if (v13) {
        asl_msg_set_key_val(v7, "Session", *(void *)(v13 + 8));
      }
      if (*(_DWORD *)(a2 + 92) != -1)
      {
        snprintf(__str, 0x40uLL, "%d", *(_DWORD *)(a2 + 92));
        asl_msg_set_key_val(v7, "PID", __str);
      }

      if (*(_DWORD *)(a2 + 112))
      {
        snprintf(__str, 0x40uLL, "%d", *(_DWORD *)(a2 + 112));
        asl_msg_set_key_val(v7, "RefPID", __str);
      }

      if (*(_DWORD *)(a2 + 96) != -2)
      {
        snprintf(__str, 0x40uLL, "%d", *(_DWORD *)(a2 + 96));
        asl_msg_set_key_val(v7, "UID", __str);
      }

      if (*(_DWORD *)(a2 + 100) != -2)
      {
        snprintf(__str, 0x40uLL, "%d", *(_DWORD *)(a2 + 100));
        asl_msg_set_key_val(v7, "GID", __str);
      }

      uint64_t v14 = *(void *)(a2 + 56);
      if (v14) {
        asl_msg_set_key_val(v7, "Message", *(void *)(v14 + 8));
      }
      __int16 v15 = *(_WORD *)(a2 + 120);
      if ((v15 & 1) != 0)
      {
        snprintf(__str, 0x40uLL, "%d", *(_DWORD *)(a2 + 104));
        asl_msg_set_key_val(v7, "ReadUID", __str);
        __int16 v15 = *(_WORD *)(a2 + 120);
      }

      if ((v15 & 2) != 0)
      {
        snprintf(__str, 0x40uLL, "%d", *(_DWORD *)(a2 + 108));
        asl_msg_set_key_val(v7, "ReadGID", __str);
      }

      if (*(void *)(a2 + 16))
      {
        snprintf(__str, 0x40uLL, "%llu", *(void *)(a2 + 16));
        asl_msg_set_key_val(v7, "OSActivityID", __str);
      }

      unsigned int v16 = *(_DWORD *)(a2 + 116);
      if (v16)
      {
        unsigned int v17 = 0;
        while (1)
        {
          uint64_t v18 = *(void *)(a2 + 80);
          uint64_t v19 = *(void *)(v18 + 8LL * v17);
          uint64_t v20 = v19 ? *(void *)(v19 + 8) : 0LL;
          uint64_t v21 = *(void *)(v18 + 8LL * (v17 + 1));
          if (!v21) {
            break;
          }
          uint64_t v22 = *(void *)(v21 + 8);
          if (v20) {
            goto LABEL_44;
          }
LABEL_45:
          v17 += 2;
          if (v17 >= v16) {
            goto LABEL_50;
          }
        }

        uint64_t v22 = 0LL;
        if (!v20) {
          goto LABEL_45;
        }
LABEL_44:
        asl_msg_set_key_val(v7, v20, v22);
        unsigned int v16 = *(_DWORD *)(a2 + 116);
        goto LABEL_45;
      }

LABEL_50:
      uint64_t result = 0LL;
      *a3 = v7;
    }

    else
    {
      return 9LL;
    }
  }

  return result;
}

uint64_t asl_memory_match_restricted_uuid( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, int a7, int a8, int a9, int a10, uint64_t a11)
{
  uint64_t v20 = 0LL;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2000000000LL;
  if (a1)
  {
    if (a3)
    {
      uint64_t v11 = *(dispatch_queue_s **)(a1 + 56);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 0x40000000LL;
      v14[2] = sub_10000EC3C;
      v14[3] = &unk_100019468;
      v14[4] = &v20;
      v14[5] = a1;
      v14[6] = a2;
      v14[7] = a3;
      v14[8] = a4;
      v14[9] = a5;
      int v15 = a6;
      int v16 = a7;
      int v17 = a8;
      int v18 = a9;
      int v19 = a10;
      v14[10] = a11;
      dispatch_sync(v11, v14);
      uint64_t v12 = *((unsigned int *)v21 + 6);
    }

    else
    {
      uint64_t v12 = 1LL;
    }
  }

  else
  {
    uint64_t v12 = 2LL;
  }

  _Block_object_dispose(&v20, 8);
  return v12;
}

uint64_t sub_10000EC3C(uint64_t a1)
{
  uint64_t result = sub_10000EC94( *(void *)(a1 + 40),  *(void *)(a1 + 48),  *(uint64_t **)(a1 + 56),  *(void **)(a1 + 64),  *(void *)(a1 + 72),  *(_DWORD *)(a1 + 88),  *(_DWORD *)(a1 + 92),  *(unsigned int *)(a1 + 96),  *(_DWORD *)(a1 + 100),  *(_DWORD *)(a1 + 104),  *(const char **)(a1 + 80));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

uint64_t sub_10000EC94( uint64_t a1, uint64_t a2, uint64_t *a3, void *a4, unint64_t a5, int a6, unsigned int a7, uint64_t a8, unsigned int a9, unsigned int a10, const char *a11)
{
  uint64_t v15 = a2;
  size_t v17 = asl_msg_list_count(a2);
  size_t v18 = v17;
  if (!v17)
  {
    unsigned int v146 = a7;
    int v142 = a6;
    uint64_t v153 = v15;
    uint64_t v145 = a3;
    int v152 = 0;
    uint64_t v22 = 0LL;
    uint64_t v20 = 0LL;
LABEL_116:
    unsigned int v85 = *(_DWORD *)(a1 + 28);
    if (v85)
    {
      int v86 = 0;
      unsigned int v87 = v85 - 1;
      while (1)
      {
        if ((a8 & 0x80000000) != 0)
        {
          unsigned int v88 = (v87 + *(_DWORD *)(a1 + 32)) % v85;
          if (**(void **)(*(void *)(a1 + 8) + 8LL * v88) - 1LL < a5) {
            break;
          }
          goto LABEL_126;
        }

        unsigned int v88 = (v86 + *(_DWORD *)(a1 + 32)) % v85;
        unint64_t v89 = **(void **)(*(void *)(a1 + 8) + 8LL * v88);
        if (v89 && v89 >= a5) {
          break;
        }
LABEL_126:
        ++v86;
        if (--v87 == -1) {
          goto LABEL_127;
        }
      }

      v156.__darwin_time_t tv_sec = 0LL;
      *(void *)&v156.__darwin_suseconds_t tv_usec = 0LL;
      if (v146)
      {
        if (gettimeofday(&v156, 0LL))
        {
          unsigned int v95 = 0;
          unint64_t v96 = 0LL;
          v156.__darwin_time_t tv_sec = 0LL;
          *(void *)&v156.__darwin_suseconds_t tv_usec = 0LL;
        }

        else
        {
          unint64_t v96 = v156.tv_sec + v146 / 0xF4240uLL;
          unsigned int v95 = v156.tv_usec + v146 % 0xF4240;
          if (v95 > 0xF4240)
          {
            v95 -= 1000000;
            v156.__darwin_suseconds_t tv_usec = v95;
            v156.__darwin_time_t tv_sec = ++v96;
          }
        }
      }

      else
      {
        unsigned int v95 = 0;
        unint64_t v96 = 0LL;
      }

      if (*(_DWORD *)(a1 + 28))
      {
        __darwin_suseconds_t v139 = v95;
        __darwin_time_t v141 = v96;
        int v101 = 0;
        int v102 = 0;
        unsigned int v143 = v142 - 1;
        unsigned int v103 = v88;
        uint64_t v144 = v22;
        while (1)
        {
          uint64_t v104 = v103;
          uint64_t v105 = *(void *)(*(void *)(a1 + 8) + 8LL * v103);
          if (!*(void *)v105) {
            goto LABEL_222;
          }
          uint64_t v155 = v104;
          int v106 = asl_core_check_access( *(unsigned int *)(v105 + 104),  *(unsigned int *)(v105 + 108),  a9,  a10,  *(unsigned __int16 *)(v105 + 120));
          if (!a11 || v106)
          {
            uint64_t v104 = v155;
            if (v106) {
              goto LABEL_222;
            }
            uint64_t v107 = *(void *)(*(void *)(a1 + 8) + 8 * v155);
          }

          else
          {
            LODWORD(v104) = v155;
            uint64_t v107 = *(void *)(*(void *)(a1 + 8) + 8 * v155);
            uint64_t v108 = *(void *)(v107 + 40);
            if (!v108) {
              goto LABEL_222;
            }
            int v109 = strcmp(*(const char **)(v108 + 8), a11);
            uint64_t v104 = v155;
            if (v109) {
              goto LABEL_222;
            }
          }

          __int16 v110 = *(_WORD *)(v107 + 120) & 0x7FFF;
          *(_WORD *)(v107 + 120) = v110;
          *a4 = *(void *)v107;
          if (v152)
          {
            if (v18)
            {
              int v140 = v101;
              size_t v111 = 0LL;
              int v112 = 0;
              int v147 = v102;
              do
              {
                int v113 = v22[v111];
                if (v113)
                {
                  if (v113 != 0x40000000)
                  {
                    if (v113 == 0x80000000) {
                      goto LABEL_215;
                    }
                    uint64_t v114 = *(void *)(*(void *)(a1 + 8) + 8 * v104);
                    if (v114)
                    {
                      uint64_t v115 = v20[v111];
                      if (!v115) {
                        goto LABEL_215;
                      }
                      if (((v113 & 1) == 0 || *(void *)v115 == *(void *)v114)
                        && ((v113 & 2) == 0 || *(void *)(v115 + 8) == *(void *)(v114 + 8))
                        && ((v113 & 4) == 0 || *(_DWORD *)(v115 + 88) == *(_DWORD *)(v114 + 88))
                        && ((v113 & 8) == 0 || *(unsigned __int8 *)(v115 + 122) == *(unsigned __int8 *)(v114 + 122))
                        && ((v113 & 0x10) == 0 || *(_DWORD *)(v115 + 92) == *(_DWORD *)(v114 + 92))
                        && ((v113 & 0x20) == 0 || *(_DWORD *)(v115 + 96) == *(_DWORD *)(v114 + 96))
                        && ((v113 & 0x40) == 0 || *(_DWORD *)(v115 + 100) == *(_DWORD *)(v114 + 100))
                        && ((v113 & 0x80) == 0 || *(_DWORD *)(v115 + 104) == *(_DWORD *)(v114 + 104))
                        && ((v113 & 0x100) == 0 || *(_DWORD *)(v115 + 108) == *(_DWORD *)(v114 + 108))
                        && ((v113 & 0x200) == 0 || *(_DWORD *)(v115 + 112) == *(_DWORD *)(v114 + 112))
                        && ((v113 & 0x400) == 0 || *(void *)(v115 + 24) == *(void *)(v114 + 24))
                        && ((v113 & 0x800) == 0 || *(void *)(v115 + 32) == *(void *)(v114 + 32))
                        && ((v113 & 0x1000) == 0 || *(void *)(v115 + 40) == *(void *)(v114 + 40))
                        && ((v113 & 0x2000) == 0 || *(void *)(v115 + 48) == *(void *)(v114 + 48))
                        && ((v113 & 0x4000) == 0 || *(void *)(v115 + 56) == *(void *)(v114 + 56))
                        && ((v113 & 0x8000) == 0 || *(void *)(v115 + 64) == *(void *)(v114 + 64))
                        && ((v113 & 0x10000) == 0 || *(void *)(v115 + 72) == *(void *)(v114 + 72)))
                      {
                        unsigned int v116 = *(_DWORD *)(v115 + 116);
                        if (!v116) {
                          goto LABEL_215;
                        }
                        unsigned int v117 = *(_DWORD *)(v114 + 116);
                        if (v117)
                        {
                          unsigned int v118 = 0;
                          uint64_t v119 = *(void *)(v115 + 80);
                          uint64_t v120 = *(void *)(v114 + 80);
                          while (1)
                          {
                            unsigned int v121 = 1;
                            while (*(void *)(v119 + 8LL * v118) != *(void *)(v120 + 8LL * (v121 - 1)))
                            {
                              BOOL v122 = 0;
                              unsigned int v123 = v121 + 1;
                              v121 += 2;
                              if (v123 >= v117) {
                                goto LABEL_210;
                              }
                            }

                            if (*(void *)(v119 + 8LL * (v118 | 1)) != *(void *)(v120 + 8LL * v121)) {
                              break;
                            }
                            v118 += 2;
                            if (v118 >= v116) {
                              goto LABEL_215;
                            }
                          }
                        }
                      }
                    }
                  }

                  BOOL v122 = 0;
                }

                else
                {
                  size_t v124 = v18;
                  uint64_t v125 = v20;
                  uint64_t v126 = a8;
                  uint64_t v127 = *(void *)(*(void *)(a1 + 8) + 8 * v104);
                  uint64_t index = asl_msg_list_get_index(v153, v111);
                  uint64_t v158 = 0LL;
                  if (sub_10000E768(a1, v127, &v158))
                  {
                    BOOL v122 = 0;
                  }

                  else
                  {
                    BOOL v122 = asl_msg_cmp(index, v158) != 0;
                    asl_msg_release(v158);
                  }

                  a8 = v126;
                  uint64_t v20 = v125;
                  size_t v18 = v124;
                  uint64_t v22 = v144;
                  int v102 = v147;
                  uint64_t v104 = v155;
                }

LABEL_210:
                size_t v111 = (v112 + 1);
                BOOL v129 = v18 > v111 && !v122;
                ++v112;
              }

              while (v129);
              if (v122)
              {
LABEL_215:
                uint64_t v107 = *(void *)(*(void *)(a1 + 8) + 8 * v104);
                __int16 v110 = *(_WORD *)(v107 + 120);
                int v101 = v140;
                goto LABEL_216;
              }

              int v101 = v140;
            }
          }

          else
          {
LABEL_216:
            *(_WORD *)(v107 + 120) = v110 | 0x8000;
            if (v143 < ++v101) {
              goto LABEL_234;
            }
          }

          if (v141)
          {
            int v130 = gettimeofday(&__s1, 0LL);
            LODWORD(v104) = v155;
            if (!v130 && (__s1.tv_sec > v141 || __s1.tv_sec == v141 && __s1.tv_usec > v139)) {
              goto LABEL_234;
            }
          }

LABEL_222:
          if ((a8 & 0x80000000) != 0)
          {
            if ((_DWORD)v104) {
              unsigned int v103 = v104 - 1;
            }
            else {
              unsigned int v103 = *(_DWORD *)(a1 + 28) - 1;
            }
          }

          else if ((v104 + 1) < *(_DWORD *)(a1 + 28))
          {
            unsigned int v103 = v104 + 1;
          }

          else
          {
            unsigned int v103 = 0;
          }

          goto LABEL_234;
        }
      }

      int v101 = 0;
LABEL_234:
      if (v20)
      {
        if (v18)
        {
          uint64_t v131 = 0LL;
          unsigned int v132 = 1;
          do
          {
            uint64_t v133 = (void *)v20[v131];
            sub_10000E69C(a1, (uint64_t)v133);
            free(v133);
            uint64_t v131 = v132;
            BOOL v94 = v18 > v132++;
          }

          while (v94);
        }

        free(v20);
        free(v22);
      }

      uint64_t *v145 = 0LL;
      if (v101)
      {
        uint64_t v134 = asl_msg_list_new();
        uint64_t *v145 = v134;
        if (v134)
        {
          while (1)
          {
            uint64_t v135 = *(void *)(*(void *)(a1 + 8) + 8LL * v88);
            int v136 = *(__int16 *)(v135 + 120);
            if (v136 < 0)
            {
              *(_WORD *)(v135 + 120) = v136 & 0x7FFF;
              uint64_t v100 = sub_10000E768(a1, v135, &v158);
              uint64_t v137 = *v145;
              if ((_DWORD)v100)
              {
                asl_msg_list_release(v137);
                uint64_t *v145 = 0LL;
                return v100;
              }

              asl_msg_list_append(v137, v158);
              asl_msg_release(v158);
              if (v101 == 1) {
                return 0LL;
              }
            }

            if ((a8 & 0x80000000) != 0)
            {
              if (v88) {
                --v88;
              }
              else {
                unsigned int v88 = *(_DWORD *)(a1 + 28) - 1;
              }
            }

            else if (v88 + 1 < *(_DWORD *)(a1 + 28))
            {
              ++v88;
            }

            else
            {
              unsigned int v88 = 0;
            }

            if (v88 == *(_DWORD *)(a1 + 32)) {
              return 0LL;
            }
          }
        }

        return 9LL;
      }
    }

    else
    {
LABEL_127:
      if (v20)
      {
        if (v18)
        {
          uint64_t v91 = 0LL;
          unsigned int v92 = 1;
          do
          {
            char v93 = (void *)v20[v91];
            sub_10000E69C(a1, (uint64_t)v93);
            free(v93);
            uint64_t v91 = v92;
            BOOL v94 = v18 > v92++;
          }

          while (v94);
        }

        free(v20);
        free(v22);
      }
    }

    return 0LL;
  }

  int v19 = calloc(v17, 8uLL);
  if (!v19) {
    return 9LL;
  }
  uint64_t v20 = v19;
  unsigned int v146 = a7;
  uint64_t v145 = a3;
  uint64_t v21 = calloc(v18, 4uLL);
  if (!v21)
  {
    free(v20);
    return 9LL;
  }

  uint64_t v22 = v21;
  int v142 = a6;
  unsigned int v150 = a8;
  uint64_t v23 = 0LL;
  int v24 = 0;
  unsigned int v25 = 0;
  uint64_t v153 = v15;
  while (2)
  {
    uint64_t v26 = asl_msg_list_get_index(v15, v23);
    if (!a1)
    {
LABEL_104:
      int v83 = 0x20000000;
      goto LABEL_105;
    }

    uint64_t v27 = v26;
    v22[v23] = 0x80000000;
    v22[v23] = 0;
    uint64_t v28 = asl_msg_fetch(v27, 0LL, 0LL, 0LL, &v158);
    if ((_DWORD)v28 != -1)
    {
      uint64_t v29 = v28;
      while ((unsigned __int16)v158 == 1)
      {
        uint64_t v29 = asl_msg_fetch(v27, v29, 0LL, 0LL, &v158);
        if ((_DWORD)v29 == -1) {
          goto LABEL_12;
        }
      }

LABEL_103:
      uint64_t v31 = 0LL;
      goto LABEL_106;
    }

LABEL_101:
      uint64_t v33 = asl_msg_fetch(v27, v33, &__s1, &v156, &v158);
      if ((_DWORD)v33 == -1) {
        goto LABEL_102;
      }
    }

    uint64_t v35 = sub_10000FAA4(a1, tv_sec, 0);
    if (!v35) {
      goto LABEL_113;
    }
    uint64_t v36 = v35;
    unsigned int v37 = *(_DWORD *)(v31 + 116);
    if (v37)
    {
      unsigned int v38 = 0;
      while (*(void **)(*(void *)(v31 + 80) + 8LL * v38) != v35)
      {
        v38 += 2;
        if (v38 >= v37) {
          goto LABEL_38;
        }
      }

LABEL_111:
      sub_10000E69C(a1, v31);
      free((void *)v31);
      int v83 = 0;
      goto LABEL_112;
    }

LABEL_38:
    uint64_t v149 = sub_10000FAA4(a1, (char *)v156.tv_sec, 0);
    int v39 = *(_DWORD *)(v31 + 116);
    if (v39) {
      size_t v40 = reallocf(*(void **)(v31 + 80), 8LL * (v39 + 2));
    }
    else {
      size_t v40 = calloc(2uLL, 8uLL);
    }
    *(void *)(v31 + 80) = v40;
    if (v40)
    {
      uint64_t v81 = *(unsigned int *)(v31 + 116);
      v40[v81] = v36;
      uint64_t v82 = *(void *)(v31 + 80);
      *(_DWORD *)(v31 + 116) = v81 + 2;
      *(void *)(v82 + 8LL * (v81 + 1)) = v149;
      goto LABEL_101;
    }

    sub_10000E69C(a1, v31);
    free((void *)v31);
    int v83 = 0x20000000;
LABEL_112:
    uint64_t v15 = v153;
    int v24 = v151;
LABEL_105:
    uint64_t v31 = 0LL;
    v22[v23] = v83;
LABEL_106:
    v20[v23] = v31;
    int v84 = v22[v23];
    if (v84 == 0x80000000)
    {
LABEL_109:
      uint64_t v23 = ++v25;
      if (v18 <= v25)
      {
        int v152 = v24;
        a8 = v150;
        goto LABEL_116;
      }

      continue;
    }

    break;
  }

  if (v84 != 0x20000000)
  {
    int v24 = 1;
    goto LABEL_109;
  }

  if (v25)
  {
    uint64_t v97 = v25;
    int v98 = (void **)v20;
    do
    {
      int v99 = *v98++;
      sub_10000E69C(a1, (uint64_t)v99);
      free(v99);
      --v97;
    }

    while (v97);
  }

  free(v20);
  free(v22);
  return 9999LL;
}

void *sub_10000FAA4(uint64_t a1, char *__s, int a3)
{
  if (!__s) {
    return 0LL;
  }
  size_t v6 = strlen(__s);
  unsigned int v7 = asl_core_string_hash(__s, v6);
  unsigned int v8 = sub_10000FC48(a1, v7);
  if (v8 < *(_DWORD *)(a1 + 24))
  {
    uint64_t v9 = *(void **)a1;
    while (1)
    {
      uint64_t v10 = (void *)v9[v8];
      if (*(_DWORD *)v10 != v7) {
        break;
      }
      if (!strcmp(__s, *((const char **)v10 + 1)))
      {
        ++*((_DWORD *)v10 + 1);
        return v10;
      }

      ++v8;
    }
  }

  if (!a3) {
    return 0LL;
  }
  uint64_t v11 = calloc(1uLL, 0x10uLL);
  if (!v11) {
    return 0LL;
  }
  uint64_t v12 = v11;
  *uint64_t v11 = v7;
  v11[1] = 1;
  uint64_t v13 = malloc((v6 + 1));
  uint64_t v10 = v13;
  v12[1] = v13;
  if (!v13)
  {
    free(v12);
    return v10;
  }

  memcpy(v13, __s, v6);
  *((_BYTE *)v10 + v6) = 0;
  uint64_t v14 = reallocf(*(void **)a1, 8LL * (*(_DWORD *)(a1 + 24) + 1));
  *(void *)a1 = v14;
  if (!v14)
  {
    *(_DWORD *)(a1 + 24) = 0;
    free(v12);
    return 0LL;
  }

  uint64_t v15 = *(unsigned int *)(a1 + 24);
  if (v15 > v8)
  {
    uint64_t v16 = 8 * v15;
    uint64_t v17 = 8LL * (v15 - 1);
    unsigned int v18 = *(_DWORD *)(a1 + 24);
    do
    {
      *(void *)(*(void *)a1 + v16) = *(void *)(*(void *)a1 + v17);
      v16 -= 8LL;
      v17 -= 8LL;
      --v18;
    }

    while (v8 < v18);
    uint64_t v14 = *(void **)a1;
  }

  uint64_t v19 = v6 + *(void *)(a1 + 48) + 17LL;
  v14[v8] = v12;
  *(void *)(a1 + 48) = v19;
  *(_DWORD *)(a1 + 24) = v15 + 1;
  return *(void **)(*(void *)a1 + 8LL * v8);
}

uint64_t sub_10000FC48(uint64_t a1, unsigned int a2)
{
  unsigned int v2 = *(_DWORD *)(a1 + 24);
  if (!v2) {
    return *(unsigned int *)(a1 + 24);
  }
  unsigned int v3 = v2 - 1;
  if (v2 == 1) {
    return ***(_DWORD ***)a1 <= a2;
  }
  uint64_t v5 = *(_DWORD ***)a1;
  if (v3 < 2)
  {
    uint64_t result = 0LL;
    unsigned int v3 = 1;
LABEL_14:
    if (*v5[result] < a2)
    {
      if (*v5[v3] >= a2) {
        return v3;
      }
      else {
        return v2;
      }
    }
  }

  else
  {
    LODWORD(result) = 0;
    unsigned int v6 = v3 >> 1;
    while (1)
    {
      unsigned int v7 = *v5[v6];
      if (v7 == a2) {
        break;
      }
      if (v7 <= a2)
      {
        uint64_t result = v6;
      }

      else
      {
        unsigned int v3 = v6;
        uint64_t result = result;
      }

      unsigned int v6 = result + ((v3 - result) >> 1);
    }

    LODWORD(result) = v6 + 1;
    unsigned int v8 = v5 - 1;
    for (uint64_t i = v6; i * 8; --i)
    {
      int v10 = *v8[i];
      uint64_t result = (result - 1);
      if (v10 != a2) {
        return result;
      }
    }

    return 0LL;
  }

  return result;
}

void sub_10000FD18(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    int v4 = *(_DWORD *)(a2 + 4);
    if (!v4 || (int v5 = v4 - 1, (*(_DWORD *)(a2 + 4) = v5) == 0))
    {
      unsigned int v6 = *(_DWORD *)a2;
      unsigned int v7 = sub_10000FC48(a1, *(_DWORD *)a2);
      if (**(_DWORD **)(*(void *)a1 + 8LL * v7) == v6)
      {
        unint64_t v8 = v7 + 1;
        while (1)
        {
          uint64_t v9 = *(_DWORD **)(*(void *)a1 + 8LL * v7);
          if (v9 == (_DWORD *)a2) {
            break;
          }
          if (*v9 == v6)
          {
            ++v7;
            ++v8;
            if (v7 < *(_DWORD *)(a1 + 24)) {
              continue;
            }
          }

          return;
        }

        unint64_t v10 = *(unsigned int *)(a1 + 24);
        if (v8 < v10)
        {
          do
            *(void *)(*(void *)a1 + 8LL * v7++) = *(void *)(*(void *)a1 + 8 * v8++);
          while (v8 < v10);
        }

        uint64_t v11 = *(void **)(a2 + 8);
        if (v11) {
          uint64_t v12 = *(void *)(a1 + 48) - strlen(*(const char **)(a2 + 8)) - 17;
        }
        else {
          uint64_t v12 = *(void *)(a1 + 48) - 16LL;
        }
        *(void *)(a1 + 48) = v12;
        free(v11);
        free((void *)a2);
        uint64_t v13 = *(void **)a1;
        unsigned int v14 = *(_DWORD *)(a1 + 24) - 1;
        *(_DWORD *)(a1 + 24) = v14;
        if (v14)
        {
          uint64_t v15 = reallocf(v13, 8LL * v14);
          *(void *)a1 = v15;
          if (!v15) {
            *(_DWORD *)(a1 + 24) = 0;
          }
        }

        else
        {
          free(v13);
          *(void *)a1 = 0LL;
        }
      }
    }
  }

xpc_object_t xpc_object_to_asl_msg(xpc_object_t object)
{
  xpc_object_t v1 = object;
  uint64_t v4 = 0LL;
  int v5 = &v4;
  uint64_t v6 = 0x2000000000LL;
  if (object)
  {
    if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_dictionary)
    {
      v5[3] = asl_msg_new(0LL);
      applier[0] = _NSConcreteStackBlock;
      applier[1] = 0x40000000LL;
      applier[2] = sub_10000FF0C;
      applier[3] = &unk_100019490;
      applier[4] = &v4;
      xpc_dictionary_apply(v1, applier);
      xpc_object_t v1 = (xpc_object_t)v5[3];
    }

    else
    {
      xpc_object_t v1 = 0LL;
    }
  }

  _Block_object_dispose(&v4, 8);
  return v1;
}

uint64_t sub_10000FF0C(uint64_t a1, uint64_t a2, xpc_object_t object)
{
  if (xpc_get_type(object) != (xpc_type_t)&_xpc_type_null)
  {
    if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_BOOL)
    {
      BOOL value = xpc_BOOL_get_value(object);
      uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
      if (value) {
        string_ptr = "1";
      }
      else {
        string_ptr = "0";
      }
      goto LABEL_25;
    }

    if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_int64)
    {
      xpc_int64_get_value(object);
    }

    else
    {
      if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_uint64)
      {
        xpc_uint64_get_value(object);
        snprintf(__str, 0x40uLL, "%llu");
        goto LABEL_24;
      }

      if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_double)
      {
        xpc_double_get_value(object);
        snprintf(__str, 0x40uLL, "%f");
        goto LABEL_24;
      }

      if (xpc_get_type(object) != (xpc_type_t)&_xpc_type_date)
      {
        if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_data)
        {
          size_t length = xpc_data_get_length(object);
          bytes_ptr = xpc_data_get_bytes_ptr(object);
          unsigned int v14 = (void *)asl_core_encode_buffer(bytes_ptr, length);
          asl_msg_set_key_val_op(*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL), a2, v14, 0LL);
          free(v14);
          return 1LL;
        }

        if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_string)
        {
          uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
          string_ptr = xpc_string_get_string_ptr(object);
          uint64_t v7 = v15;
          goto LABEL_25;
        }

        if (xpc_get_type(object) != (xpc_type_t)&_xpc_type_uuid)
        {
          if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_fd)
          {
            uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
            string_ptr = "{XPC_TYPE_FD}";
          }

          else if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_shmem)
          {
            uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
            string_ptr = "{XPC_TYPE_SHMEM}";
          }

          else if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_array)
          {
            uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
            string_ptr = "{XPC_TYPE_ARRAY}";
          }

          else if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_dictionary)
          {
            uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
            string_ptr = "{XPC_TYPE_DICTIONARY}";
          }

          else
          {
            xpc_type_t type = xpc_get_type(object);
            uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
            if (type == (xpc_type_t)&_xpc_type_error) {
              string_ptr = "{XPC_TYPE_ERROR}";
            }
            else {
              string_ptr = "{XPC_TYPE_???}";
            }
          }

          goto LABEL_25;
        }

        bytes = xpc_uuid_get_bytes(object);
        uuid_unparse(bytes, __str);
LABEL_24:
        uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
        string_ptr = __str;
LABEL_25:
        uint64_t v9 = a2;
        goto LABEL_26;
      }

      xpc_date_get_value(object);
    }

    snprintf(__str, 0x40uLL, "%lld");
    goto LABEL_24;
  }

  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  uint64_t v9 = a2;
  string_ptr = 0LL;
LABEL_26:
  asl_msg_set_key_val_op(v7, v9, string_ptr, 0LL);
  return 1LL;
}

xpc_object_t configuration_profile_to_asl_msg()
{
  uint64_t v0 = (void *)configuration_profile_copy_property_list();
  xpc_object_t v1 = xpc_object_to_asl_msg(v0);
  if (v0) {
    xpc_release(v0);
  }
  return v1;
}

char *explode(unsigned __int8 *a1, char *__s)
{
  if (!a1) {
    return 0LL;
  }
  unsigned int v2 = a1;
  LOBYTE(v3) = *a1;
  if (!*a1) {
    return 0LL;
  }
  unsigned __int8 v5 = 0;
  uint64_t v6 = 0LL;
  do
  {
    uint64_t v7 = 0LL;
    while (1)
    {
      if (v5)
      {
        goto LABEL_16;
      }

      else {
        char v8 = 0;
      }
      else {
        unsigned __int8 v5 = v8;
      }
LABEL_16:
      uint64_t v9 = v7 + 1;
      int v3 = v2[++v7];
      if (!v3)
      {
        size_t v10 = v9;
        uint64_t v7 = v9;
        goto LABEL_19;
      }
    }

    unsigned __int8 v5 = 0;
    size_t v10 = v7;
LABEL_19:
    size_t v11 = v10 + 1;
    uint64_t v12 = (char *)malloc(v10 + 1);
    if (!v12) {
      return 0LL;
    }
    uint64_t v13 = v12;
    if (v10) {
      memcpy(v12, v2, v10);
    }
    v13[v7] = 0;
    uint64_t v6 = (char *)sub_100010404(v13, v6);
    free(v13);
    unsigned int v14 = &v2[v10];
    if (!v2[v10]) {
      break;
    }
    int v3 = v2[v11];
    if (!v2[v11])
    {
      uint64_t v6 = (char *)sub_100010404((const char *)&unk_100015297, v6);
      int v3 = v14[1];
    }

    unsigned int v2 = v14 + 1;
  }

  while (v3);
  return v6;
}

void *sub_100010404(const char *a1, char *__ptr)
{
  unsigned int v2 = __ptr;
  if (a1)
  {
    if (!__ptr)
    {
      unsigned int v2 = malloc(0x10uLL);
      if (!v2) {
        return v2;
      }
      char v8 = strdup(a1);
      *unsigned int v2 = v8;
      if (v8)
      {
        v2[1] = 0LL;
        return v2;
      }

      goto LABEL_11;
    }

    uint64_t v4 = 0LL;
    int v5 = 0;
    do
    {
      uint64_t v6 = *(void *)&__ptr[v4 * 8];
      ++v5;
      ++v4;
    }

    while (v6);
    unsigned int v2 = reallocf(__ptr, (v4 * 8 + 8) & 0x7FFFFFFF8LL);
    if (v2)
    {
      uint64_t v7 = strdup(a1);
      v2[v4 - 1] = v7;
      if (v7)
      {
        v2[v5] = 0LL;
        return v2;
      }

void free_string_list(void **a1)
{
  if (a1)
  {
    unsigned int v2 = *a1;
    if (v2)
    {
      int v3 = a1 + 1;
      do
      {
        free(v2);
        uint64_t v4 = *v3++;
        unsigned int v2 = v4;
      }

      while (v4);
    }

    free(a1);
  }

_BYTE *get_line_from_file(FILE *a1)
{
  xpc_object_t v1 = fgetln(a1, &v8);
  if (!v1) {
    return 0LL;
  }
  size_t v2 = v8;
  if (!v8) {
    return 0LL;
  }
  int v3 = v1;
  uint64_t v4 = malloc(v8 + 1);
  int v5 = v4;
  if (v4)
  {
    memcpy(v4, v3, v2);
    size_t v6 = v2 - 1;
    if (v5[v2 - 1] != 10) {
      size_t v6 = v2;
    }
    v5[v6] = 0;
  }

  return v5;
}

_BYTE *next_word_from_string(unsigned __int8 **a1)
{
  if (!a1) {
    return 0LL;
  }
  xpc_object_t v1 = *a1;
  if (!*a1) {
    return 0LL;
  }
  int v2 = *v1;
  BOOL v3 = v2 == 39;
  uint64_t v4 = v2 == 39 ? v1 + 1 : *a1;
  BOOL v5 = *v4 == 34;
  size_t v6 = *v4 == 34 ? v4 + 1 : v4;
  int v7 = *v4 == 34 ? v3 + 1 : v2 == 39;
  int v8 = -(int)v1 - v7;
  uint64_t v9 = v6;
  while (1)
  {
    int64_t v10 = ((unint64_t)~(_DWORD)v6 << 32) + ((void)v9 << 32);
    for (int i = v8 + (_DWORD)v9++; ; i += 2)
    {
      int v12 = *(v9 - 1);
      if (v12 != 92) {
        break;
      }
      if (!*v9) {
        goto LABEL_30;
      }
      v9 += 2;
      v10 += 0x200000000LL;
    }

    if (!*(v9 - 1)) {
      break;
    }
    if (v12 == 39)
    {
      BOOL v3 = !v3;
    }

    else
    {
      if (v12 == 34) {
        BOOL v5 = !v5;
      }
      if (v12 == 32)
      {
        if (!v3 && !v5) {
          goto LABEL_30;
        }
      }

      else if (v12 == 9 && !v3 && !v5)
      {
        goto LABEL_30;
      }
    }
  }

  --v9;
LABEL_30:
  *a1 = v9;
  if (v2 == 34 || v2 == 39) {
    i -= v2 == v6[v10 >> 32];
  }
  if (!i) {
    return 0LL;
  }
  uint64_t v13 = malloc(i + 1);
  unsigned int v14 = v13;
  if (v13)
  {
    memcpy(v13, v6, i);
    v14[i] = 0;
  }

  return v14;
}

uint64_t asl_out_dest_for_path(uint64_t a1, char *__s2)
{
  uint64_t v2 = 0LL;
  if (a1 && __s2)
  {
    uint64_t v4 = a1;
    while (1)
    {
      uint64_t v5 = *(void *)(v4 + 16);
      if (v5) {
        break;
      }
LABEL_10:
      uint64_t v4 = *(void *)(v4 + 24);
      if (!v4) {
        return 0LL;
      }
    }

    while (1)
    {
      if (*(_DWORD *)(v5 + 8) == 2)
      {
        uint64_t v2 = *(void *)(v5 + 24);
        if (v2)
        {
          size_t v6 = *(const char **)(v2 + 8);
          if (v6)
          {
            if (!strcmp(v6, __s2)) {
              break;
            }
          }
        }
      }

      uint64_t v5 = *(void *)(v5 + 40);
      if (!v5) {
        goto LABEL_10;
      }
    }
  }

  return v2;
}

uint64_t asl_out_mkpath(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v3 = *(void *)(a2 + 24);
  if (!v3) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v4 = *(const char **)(v3 + 8);
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  snprintf(__str, 0x400uLL, "%s", v4);
  if (*(_DWORD *)(a2 + 8) != 13)
  {
    size_t v6 = strrchr(__str, 47);
    if (!v6) {
      return 0xFFFFFFFFLL;
    }
    char *v6 = 0;
  }

  memset(&v22, 0, sizeof(v22));
  if (stat(__str, &v22))
  {
    if (*__error() != 2) {
      return 0xFFFFFFFFLL;
    }
    int v7 = *(_DWORD *)(*(void *)(a2 + 24) + 72LL);
    uint64_t result = (uint64_t)explode((unsigned __int8 *)__str, "/");
    if (result)
    {
      uint64_t v9 = (void **)result;
      uint64_t v10 = asl_string_new(0LL);
      if (v9[__str[0] == 47])
      {
        size_t v11 = &v9[(__str[0] == 47) + 1];
        while (1)
        {
          asl_string_append_char_no_encoding(v10, 47LL);
          asl_string_append_no_encoding(v10, *(v11 - 1));
          int v12 = (char *)asl_string_bytes(v10);
          memset(&v23, 0, sizeof(v23));
          if (lstat(v12, &v23)) {
            break;
          }
          int v18 = v23.st_mode & 0xF000;
          if (v18 == 40960)
          {
            if (!realpath_DARWIN_EXTSN(v12, v25)) {
              goto LABEL_39;
            }
            memset(&v23, 0, sizeof(v23));
            if (stat(v25, &v23)) {
              break;
            }
            int v18 = v23.st_mode & 0xF000;
          }

          if (v18 != 0x4000) {
            goto LABEL_39;
          }
LABEL_34:
          if (!*v11++) {
            goto LABEL_35;
          }
        }

        if (*__error() != 2 || (uint64_t v13 = asl_out_dest_for_path(a1, v12), v14 = v13, (v7 & 0x20) != 0) && !v13)
        {
LABEL_39:
          asl_string_release(v10);
          free_string_list(v9);
          return 0xFFFFFFFFLL;
        }

        if (v13)
        {
          if (*(_WORD *)(v13 + 116) == 4096) {
            mode_t v15 = 493;
          }
          else {
            mode_t v15 = *(_WORD *)(v13 + 116);
          }
          mode_t v16 = umask(0);
          mkdir(v12, v15);
          umask(v16);
          if (*(_DWORD *)(v14 + 128)) {
            uid_t v17 = **(_DWORD **)(v14 + 120);
          }
          else {
            uid_t v17 = 0;
          }
          if (*(_DWORD *)(v14 + 144))
          {
            gid_t v20 = **(_DWORD **)(v14 + 136);
LABEL_33:
            chown(v12, v17, v20);
            goto LABEL_34;
          }
        }

        else
        {
          mode_t v19 = umask(0);
          mkdir(v12, 0x1EDu);
          umask(v19);
          uid_t v17 = 0;
        }

        gid_t v20 = 80;
        goto LABEL_33;
      }

time_t asl_make_timestamp(time_t result, char a2, char *__str, size_t __size)
{
  time_t v38 = result;
  if (__str)
  {
    if ((a2 & 4) != 0)
    {
      memset(&v37, 0, sizeof(v37));
      gmtime_r(&v38, &v37);
      return snprintf(__str, __size, "%d-%02d-%02dT%02d:%02d:%02dZ", (v37.tm_year + 1900));
    }

    if ((a2 & 8) != 0)
    {
      memset(&v37, 0, sizeof(v37));
      gmtime_r(&v38, &v37);
      return snprintf(__str, __size, "%d%02d%02dT%02d%02d%02dZ", (v37.tm_year + 1900));
    }

    if ((a2 & 0x10) != 0)
    {
      memset(&v37, 0, sizeof(v37));
      localtime_r(&v38, &v37);
      LODWORD(v6) = v37.tm_gmtoff;
      if (v37.tm_gmtoff < 0)
      {
        uint64_t v6 = -v37.tm_gmtoff;
        v37.tm_gmtoff = -v37.tm_gmtoff;
        uint64_t v7 = 45LL;
      }

      else
      {
        uint64_t v7 = 43LL;
      }

      unint64_t v10 = v6 / 0xE10uLL;
      unsigned int v11 = v6 % 0xE10;
      unsigned __int16 v12 = v6 % 0xE10;
      uint64_t v13 = v12 / 0x3Cu;
      unsigned __int16 v14 = v12 % 0x3Cu;
      uint64_t v15 = (v37.tm_year + 1900);
      uint64_t v16 = (v37.tm_mon + 1);
      uint64_t tm_hour = v37.tm_hour;
      uint64_t tm_mday = v37.tm_mday;
      if (v12 % 0x3Cu)
      {
        uint64_t v32 = v7;
        unint64_t v34 = v10;
        uint64_t tm_min = v37.tm_min;
        uint64_t tm_sec = v37.tm_sec;
        uint64_t v26 = v37.tm_mday;
        uint64_t v27 = v37.tm_hour;
        uint64_t v24 = (v37.tm_year + 1900);
        uint64_t v25 = (v37.tm_mon + 1);
        mode_t v19 = "%d-%02d-%02dT%02d:%02d:%02d%c%u:%02u:%02u";
        return snprintf(__str, __size, v19, v24, v25, v26, v27, tm_min, tm_sec, v32, v34, v13, v14);
      }

      if (v11 >= 0x3C)
      {
        unint64_t v35 = v10;
        uint64_t v36 = v12 / 0x3Cu;
        uint64_t v31 = v37.tm_sec;
        uint64_t v33 = v7;
        uint64_t v29 = v37.tm_min;
        gid_t v20 = "%d-%02d-%02dT%02d:%02d:%02d%c%u:%02u";
      }

      else
      {
        uint64_t v33 = v7;
        unint64_t v35 = v10;
        uint64_t v29 = v37.tm_min;
        uint64_t v31 = v37.tm_sec;
        gid_t v20 = "%d-%02d-%02dT%02d:%02d:%02d%c%u";
      }
    }

    else
    {
      if ((a2 & 0x20) == 0) {
        return snprintf(__str, __size, "%c%llu");
      }
      memset(&v37, 0, sizeof(v37));
      localtime_r(&v38, &v37);
      LODWORD(sub_10000520C(v1, v2, v3, v4, v5, v6, v7, v8) = v37.tm_gmtoff;
      if (v37.tm_gmtoff < 0)
      {
        uint64_t v8 = -v37.tm_gmtoff;
        v37.tm_gmtoff = -v37.tm_gmtoff;
        uint64_t v9 = 45LL;
      }

      else
      {
        uint64_t v9 = 43LL;
      }

      unint64_t v21 = v8 / 0xE10uLL;
      unsigned int v22 = v8 % 0xE10;
      unsigned __int16 v23 = v8 % 0xE10;
      uint64_t v13 = v23 / 0x3Cu;
      unsigned __int16 v14 = v23 % 0x3Cu;
      uint64_t v15 = (v37.tm_year + 1900);
      uint64_t v16 = (v37.tm_mon + 1);
      uint64_t tm_hour = v37.tm_hour;
      uint64_t tm_mday = v37.tm_mday;
      if (v23 % 0x3Cu)
      {
        uint64_t v32 = v9;
        unint64_t v34 = v21;
        uint64_t tm_min = v37.tm_min;
        uint64_t tm_sec = v37.tm_sec;
        uint64_t v26 = v37.tm_mday;
        uint64_t v27 = v37.tm_hour;
        uint64_t v24 = (v37.tm_year + 1900);
        uint64_t v25 = (v37.tm_mon + 1);
        mode_t v19 = "%d%02d%02dT%02d%02d%02d%c%02u%02u%02u";
        return snprintf(__str, __size, v19, v24, v25, v26, v27, tm_min, tm_sec, v32, v34, v13, v14);
      }

      if (v22 >= 0x3C)
      {
        unint64_t v35 = v21;
        uint64_t v36 = v23 / 0x3Cu;
        uint64_t v31 = v37.tm_sec;
        uint64_t v33 = v9;
        uint64_t v29 = v37.tm_min;
        gid_t v20 = "%d%02d%02dT%02d%02d%02d%c%02u%02u";
      }

      else
      {
        uint64_t v33 = v9;
        unint64_t v35 = v21;
        uint64_t v29 = v37.tm_min;
        uint64_t v31 = v37.tm_sec;
        gid_t v20 = "%d%02d%02dT%02d%02d%02d%c%02u";
      }
    }

    return snprintf(__str, __size, v20, v15, v16, tm_mday, tm_hour, v29, v31, v33, v35, v36);
  }

  return result;
}

uint64_t asl_dst_make_current_name(uint64_t result, int a2, char *a3, size_t a4)
{
  if (result && a3)
  {
    uint64_t v6 = result;
    int v7 = *(_DWORD *)(result + 72) | a2;
    time_t v8 = *(void *)(result + 176);
    if (!v8)
    {
      time_t v8 = time(0LL);
      *(void *)(v6 + 176) = v8;
    }

    asl_make_timestamp(v8, *(_DWORD *)(v6 + 64), __str, 0x20uLL);
    if ((v7 & 0x2000) != 0) {
      return snprintf(a3, a4, "%s.%s");
    }
    if ((v7 & 0x100) == 0) {
      return snprintf(a3, a4, "%s");
    }
    if (*(void *)v6 && (*(_BYTE *)(v6 + 67) & 0x40) != 0) {
      return snprintf(a3, a4, "%s/%s.%s.%s");
    }
    else {
      return snprintf(a3, a4, "%s.%s");
    }
  }

  return result;
}

uint64_t asl_check_option(uint64_t a1, char *__s)
{
  uint64_t v2 = 0LL;
  if (a1 && __s)
  {
    size_t v5 = strlen(__s);
    if (!v5) {
      return 0LL;
    }
    uint64_t val_for_key = (const char *)asl_msg_get_val_for_key(a1, "ASLOption");
    if (!val_for_key) {
      return 0LL;
    }
    int v7 = val_for_key;
    uint64_t v2 = *(unsigned __int8 *)val_for_key;
    if (*val_for_key)
    {
      while (1)
      {
LABEL_6:
        if ((int)v2 <= 31)
        {
          if ((_DWORD)v2 != 9)
          {
            if (!(_DWORD)v2) {
              return v2;
            }
LABEL_13:
            if (strncasecmp(v7, __s, v5)
              || ((v7 += v5, uint64_t v2 = *(unsigned __int8 *)v7, v2 <= 0x2C)
                ? (BOOL v9 = ((1LL << v2) & 0x100100000201LL) == 0)
                : (BOOL v9 = 1),
                  v9))
            {
              while (1)
              {
                if ((int)v2 > 31)
                {
                  if ((_DWORD)v2 == 32 || (_DWORD)v2 == 44) {
                    goto LABEL_6;
                  }
                }

                else
                {
                  if (!(_DWORD)v2) {
                    return v2;
                  }
                  if ((_DWORD)v2 == 9) {
                    goto LABEL_6;
                  }
                }

                unsigned int v10 = *(unsigned __int8 *)++v7;
                uint64_t v2 = v10;
              }
            }

            return 1LL;
          }
        }

        else if ((_DWORD)v2 != 44 && (_DWORD)v2 != 32)
        {
          goto LABEL_13;
        }

        unsigned int v8 = *(unsigned __int8 *)++v7;
        uint64_t v2 = v8;
      }
    }
  }

  return v2;
}

void asl_out_dst_data_release(uint64_t a1)
{
  if (a1)
  {
    int v2 = *(_DWORD *)(a1 + 168);
    if (!v2 || (int v3 = v2 - 1, (*(_DWORD *)(a1 + 168) = v3) == 0))
    {
      free(*(void **)a1);
      free(*(void **)(a1 + 8));
      free(*(void **)(a1 + 16));
      free(*(void **)(a1 + 40));
      free(*(void **)(a1 + 48));
      free(*(void **)(a1 + 32));
      free(*(void **)(a1 + 24));
      free(*(void **)(a1 + 120));
      free(*(void **)(a1 + 136));
      free((void *)a1);
    }
  }

uint64_t asl_out_dst_data_retain(uint64_t result)
{
  if (result) {
    ++*(_DWORD *)(result + 168);
  }
  return result;
}

uint64_t asl_out_dst_set_access(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0xFFFFFFFFLL;
  if ((a1 & 0x80000000) == 0 && a2)
  {
    uid_t v4 = *(_DWORD *)(a2 + 128);
    if (v4) {
      uid_t v4 = **(_DWORD **)(a2 + 120);
    }
    if (*(_DWORD *)(a2 + 144)) {
      gid_t v5 = **(_DWORD **)(a2 + 136);
    }
    else {
      gid_t v5 = 80;
    }
    fchown(a1, v4, v5);
    return a1;
  }

  return result;
}

uint64_t asl_out_dst_file_create_open(uint64_t a1, char **a2)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (!*(void *)(a1 + 8)) {
    return 0xFFFFFFFFLL;
  }
  asl_dst_make_current_name(a1, 0, __s1, 0x400uLL);
  free(*(void **)(a1 + 16));
  uid_t v4 = strdup(__s1);
  *(void *)(a1 + 16) = v4;
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  if (a2) {
    *a2 = strdup(__s1);
  }
  memset(&v10, 0, sizeof(v10));
  if (!stat(__s1, &v10))
  {
    if ((v10.st_mode & 0xF000) == 0x8000)
    {
      uint64_t v7 = open(__s1, 2058, 0LL);
      if (!*(void *)(a1 + 176))
      {
        __darwin_time_t tv_sec = v10.st_birthtimespec.tv_sec;
        *(void *)(a1 + 176) = v10.st_birthtimespec.tv_sec;
        if (!tv_sec) {
          *(void *)(a1 + 176) = v10.st_mtimespec.tv_sec;
        }
      }

      *(void *)(a1 + 184) = v10.st_size;
      if ((~*(_DWORD *)(a1 + 72) & 0x300) == 0) {
        goto LABEL_18;
      }
      return v7;
    }

    return 0xFFFFFFFFLL;
  }

  if (*__error() != 2) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v5 = open(__s1, 2562, *(_WORD *)(a1 + 116) & 0x1B6);
  if ((v5 & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v6 = v5;
  *(void *)(a1 + 176) = time(0LL);
  uint64_t v7 = asl_out_dst_set_access(v6, a1);
  if ((v7 & 0x80000000) != 0) {
    unlink(__s1);
  }
  if ((~*(_DWORD *)(a1 + 72) & 0x300) == 0)
  {
    unlink(*(const char **)(a1 + 8));
LABEL_18:
    symlink(__s1, *(const char **)(a1 + 8));
  }

  return v7;
}

void asl_out_module_free(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = a1;
    do
    {
      uint64_t v2 = *(void *)(v1 + 24);
      free(*(void **)v1);
      int v3 = *(void **)(v1 + 16);
      if (v3)
      {
        do
        {
          uid_t v4 = (void *)v3[5];
          uint64_t v5 = v3[3];
          if (v5) {
            asl_out_dst_data_release(v5);
          }
          if (*v3) {
            asl_msg_release(*v3);
          }
          free((void *)v3[2]);
          free(v3);
          int v3 = v4;
        }

        while (v4);
      }

      free((void *)v1);
      uint64_t v1 = v2;
    }

    while (v2);
  }

_DWORD *asl_out_module_new(const char *a1)
{
  uint64_t v2 = calloc(1uLL, 0x20uLL);
  uint64_t result = 0LL;
  if (a1 && v2)
  {
    uid_t v4 = strdup(a1);
    *(void *)uint64_t v2 = v4;
    if (v4)
    {
      v2[2] = 1;
      return v2;
    }

    else
    {
      free(v2);
      return 0LL;
    }
  }

  return result;
}

void *asl_out_module_parse_line(uint64_t a1, char *a2)
{
  while (1)
  {
    unsigned int v4 = *a2;
    if (v4 > 0x1F) {
      break;
    }
    if (v4 != 9) {
      return 0LL;
    }
LABEL_6:
    ++a2;
  }

  if (*a2 <= 0x29u)
  {
    if (v4 != 32) {
      return 0LL;
    }
    goto LABEL_6;
  }

  if (*a2 > 0x3Du)
  {
    if (v4 != 62)
    {
      if (v4 != 63 && v4 != 81) {
        return 0LL;
      }
LABEL_20:
      if (!a1) {
        return 0LL;
      }
      uint64_t v6 = calloc(1uLL, 0x30uLL);
      if (!v6) {
        return v6;
      }
      BOOL v9 = (const char *)sub_100012E2C((uint64_t)a2);
      if (!v9) {
        return 0LL;
      }
      stat v10 = v9;
      unsigned int v11 = strchr(v9, 32);
      if (v11 || (unsigned int v11 = strchr(v10, 9)) != 0LL)
      {
        char v12 = 0;
        *unsigned int v11 = 0;
      }

      else
      {
        char v12 = 1;
      }

      if (!strcasecmp(v10, "ignore"))
      {
        int v13 = 3;
      }

      else if (!strcasecmp(v10, "skip"))
      {
        int v13 = 4;
      }

      else if (!strcasecmp(v10, "claim"))
      {
        int v13 = 5;
      }

      else if (!strcasecmp(v10, "notify"))
      {
        int v13 = 6;
      }

      else if (!strcasecmp(v10, "file"))
      {
        int v13 = 14;
      }

      else if (!strcasecmp(v10, "asl_file"))
      {
        int v13 = 12;
      }

      else if (!strcasecmp(v10, "directory") {
             || !strcasecmp(v10, "dir")
      }
             || !strcasecmp(v10, "asl_directory")
             || !strcasecmp(v10, "asl_dir")
             || !strcasecmp(v10, "store_dir")
             || !strcasecmp(v10, "store_directory"))
      {
        int v13 = 13;
      }

      else if (!strcasecmp(v10, "control"))
      {
        int v13 = 16;
      }

      else if (!strcasecmp(v10, "save") || !strcasecmp(v10, "store"))
      {
        int v13 = 11;
      }

      else if (!strcasecmp(v10, "access"))
      {
        int v13 = 8;
      }

      else if (!strcasecmp(v10, "set"))
      {
        int v13 = 9;
      }

      else if (!strcasecmp(v10, "unset"))
      {
        int v13 = 10;
      }

      else
      {
        if (strcasecmp(v10, "broadcast"))
        {
          if (!strcasecmp(v10, "forward"))
          {
            int v13 = 15;
            goto LABEL_80;
          }

LABEL_81:
          if (*((_DWORD *)v6 + 2))
          {
            if ((v12 & 1) != 0) {
              goto LABEL_91;
            }
            for (int i = v11 + 1; ; ++i)
            {
              int v24 = *(i - 1);
              if (v24 != 32 && v24 != 9) {
                break;
              }
            }

            uint64_t v26 = sub_100012EA4(i);
            *((void *)v6 + setiopolicy_np(0, 0, 2) = v26;
            if (v26)
            {
LABEL_91:
              *((_BYTE *)v10 - 1) = 0;
              if (*a2 == 42)
              {
                uint64_t v27 = asl_msg_new(1LL);
              }

              else
              {
                *a2 = 81;
                uint64_t v27 = asl_msg_from_string(a2);
              }

              *(void *)uint64_t v6 = v27;
              if (v27)
              {
                if (*((_DWORD *)v6 + 2) != 11) {
                  goto LABEL_108;
                }
                uint64_t v28 = (unsigned __int8 *)*((void *)v6 + 2);
                if (v28)
                {
                  if (strncmp(*((const char **)v6 + 2), "/var/log/asl", 0xCuLL))
                  {
                    *((_DWORD *)v6 + setiopolicy_np(0, 0, 2) = 12;
                    goto LABEL_108;
                  }

                  uint64_t v31 = a1;
                  int v30 = v28;
                }

                else
                {
                  int v30 = "/var/log/asl";
                  uint64_t v31 = a1;
                }

                uint64_t v32 = sub_100011964(v31, v30, 493);
                if (v32) {
                  ++v32[42];
                }
                *((void *)v6 + 3) = v32;
LABEL_108:
                int v33 = *((_DWORD *)v6 + 2);
                if (v33 == 13) {
                  __int16 v34 = 493;
                }
                else {
                  __int16 v34 = 420;
                }
                unint64_t v35 = sub_100011964(a1, *((unsigned __int8 **)v6 + 2), v34);
                if (!v35)
                {
                  *((void *)v6 + 3) = 0LL;
                  *((_DWORD *)v6 + setiopolicy_np(0, 0, 2) = 0;
                  return v6;
                }

                uint64_t v36 = v35;
                ++v35[42];
                *((void *)v6 + 3) = v35;
                if (*((_WORD *)v35 + 58) == 4096) {
                  *((_WORD *)v35 + 58) = v34;
                }
                int v37 = *((_DWORD *)v6 + 2);
                if (v37 == 12)
                {
LABEL_121:
                  unsigned int v39 = v36[18] | 0x1000;
                }

                else
                {
                  if (v37 == 13)
                  {
                    unsigned int v40 = v35[18];
                    unsigned int v41 = v40 & 0xFFFFDFF7 | 0x2000;
                  }

                  else
                  {
                    if (v37 == 14)
                    {
                      time_t v38 = (const char *)*((void *)v35 + 3);
                      if (v38 && !strcasecmp(v38, "asl"))
                      {
                        *((_DWORD *)v6 + setiopolicy_np(0, 0, 2) = 12;
                        goto LABEL_121;
                      }

LABEL_129:
                      if (!v36[32])
                      {
                        sub_100012F40(v36, "0");
                        uint64_t v36 = (unsigned int *)*((void *)v6 + 3);
                      }

                      if (!v36[36]) {
                        sub_100012FE8(v36, "80");
                      }
LABEL_133:
                      uint64_t v42 = *(void *)(a1 + 16);
                      if (v42)
                      {
                        do
                        {
                          uint64_t v22 = v42;
                          uint64_t v42 = *(void *)(v42 + 40);
                        }

                        while (v42);
                        goto LABEL_135;
                      }

LABEL_136:
                      *(void *)(a1 + 16) = v6;
                      return v6;
                    }

                    unsigned int v41 = v35[18];
                  }

                  unsigned int v39 = v41 & 0xFFFFFFFB;
                }

                v36[18] = v39;
                goto LABEL_129;
              }

LABEL_99:
              free(*((void **)v6 + 2));
            }
          }

LABEL_100:
          free(v6);
          return 0LL;
        }

        int v13 = 7;
      }

unsigned int *sub_100011964(uint64_t a1, unsigned __int8 *a2, __int16 a3)
{
  int v3 = 0LL;
  if (!a1 || !a2) {
    return v3;
  }
  while (1)
  {
    int v6 = *a2;
    if (v6 != 32 && v6 != 9) {
      break;
    }
    ++a2;
  }

  uint64_t v59 = a2;
  int v8 = next_word_from_string(&v59);
  __s = v8;
  if (!v8) {
    return 0LL;
  }
  uint64_t v57 = a1;
  BOOL v9 = (void **)explode((unsigned __int8 *)v8, "/");
  uint64_t v10 = asl_string_new(0LL);
  uint64_t v11 = v10;
  BOOL v12 = 0;
  int v13 = 5;
  __int16 v56 = a3;
  if (v9 && v10)
  {
    int v14 = 5;
    while (1)
    {
      uint64_t v15 = (const char *)*v9;
      if (*v9) {
        break;
      }
      BOOL v12 = 0;
      int v16 = 0;
LABEL_33:
      free_string_list(v9);
      if (v16 != 1 || v12)
      {
        BOOL v9 = 0LL;
        int v13 = v14;
        goto LABEL_40;
      }

      free(__s);
      __s = (char *)asl_string_release_return_bytes(v11);
      uint64_t v11 = asl_string_new(0LL);
      int v24 = explode((unsigned __int8 *)__s, "/");
      BOOL v9 = (void **)v24;
      int v13 = v14 - 1;
      if (v14 >= 2)
      {
        if (v24)
        {
          --v14;
          if (v11) {
            continue;
          }
        }
      }

      goto LABEL_40;
    }

    int v16 = 0;
    BOOL v12 = 0;
    unsigned int v17 = 1;
    int v18 = (const char **)v9;
    while (strncmp(v15, "$ENV(", 5uLL))
    {
      if (v17 == 1)
      {
        if (!*(_BYTE *)*v9) {
          goto LABEL_25;
        }
        uint64_t v19 = v11;
        uint64_t v20 = v15;
      }

      else
      {
        asl_string_append_char_no_encoding(v11, 47LL);
        uint64_t v20 = *v18;
        uint64_t v19 = v11;
      }

      asl_string_append_no_encoding(v19, v20);
      if (!v12)
      {
LABEL_29:
        BOOL v12 = strcmp(*v18, "..") == 0;
        goto LABEL_30;
      }

LABEL_25:
    if (!v12) {
      goto LABEL_29;
    }
    goto LABEL_26;
  }

LABEL_40:
  free(__s);
  free_string_list(v9);
  if (v12 || !v13)
  {
    asl_string_release(v11);
    return 0LL;
  }

  unint64_t v25 = asl_string_release_return_bytes(v11);
  __s = (char *)v25;
  uint64_t v26 = v57;
  for (uint64_t i = *(void *)(v57 + 16); i; uint64_t i = *(void *)(i + 40))
  {
    if (*(_DWORD *)(i + 8) == 2)
    {
      int v3 = *(unsigned int **)(i + 24);
      if (v3)
      {
        uint64_t v28 = (const char *)*((void *)v3 + 1);
        if (v25 && v28)
        {
          if (*(_BYTE *)v25 != 47)
          {
            uint64_t v29 = strrchr(*((const char **)v3 + 1), 47);
            if (v29) {
              uint64_t v28 = v29 + 1;
            }
          }

          if (!strcmp((const char *)v25, v28))
          {
LABEL_178:
            free((void *)v25);
            return v3;
          }
        }

        else if (!(v25 | (unint64_t)v28))
        {
          goto LABEL_178;
        }
      }
    }
  }

  if (*(_BYTE *)v25 == 47)
  {
    int v30 = 8;
    if (strncmp((const char *)v25, "/var/log/", 9uLL))
    {
      else {
        int v30 = 40;
      }
    }
  }

  else
  {
    else {
      asprintf(&__s, "%s/module/%s/%s");
    }
    free((void *)v25);
    int v30 = 8;
  }

  uint64_t v31 = calloc(1uLL, 0x30uLL);
  uint64_t v32 = (unsigned int *)calloc(1uLL, 0xC8uLL);
  int v3 = v32;
  if (!v31 || !v32)
  {
    free(__s);
    free(v31);
    free(v3);
    return 0LL;
  }

  v32[42] = 1;
  int v33 = __s;
  *((void *)v32 + 1) = __s;
  __int16 v34 = strrchr(v33, 47);
  if (v34)
  {
    unint64_t v35 = v34;
    *__int16 v34 = 0;
    *(void *)int v3 = strdup(*((const char **)v3 + 1));
    *unint64_t v35 = 47;
    int v33 = __s;
  }

  *((_WORD *)v3 + 58) = v56;
  v3[28] = 604800;
  v3[18] = v30;
  uint64_t v36 = strrchr(v33, 47);
  if (v36) {
    int v37 = v36 + 1;
  }
  else {
    int v37 = v33;
  }
  time_t v38 = strrchr(v33, 46);
  if (v38)
  {
    unsigned int v39 = v38;
    *time_t v38 = 0;
    *((void *)v3 + 6) = strdup(v38 + 1);
    *((void *)v3 + 5) = strdup(v37);
    char *v39 = 46;
  }

  else
  {
    *((void *)v3 + 5) = strdup(v37);
  }

  unsigned int v41 = next_word_from_string(&v59);
  if (v41)
  {
    uint64_t v42 = v41;
    do
    {
      if (!strncasecmp(v42, "mode=", 5uLL))
      {
        *((_WORD *)v3 + 58) = strtol(v42 + 5, 0LL, 0);
      }

      else if (!strncasecmp(v42, "uid=", 4uLL))
      {
        sub_100012F40(v3, v42 + 4);
      }

      else if (!strncasecmp(v42, "gid=", 4uLL))
      {
        sub_100012FE8(v3, v42 + 4);
      }

      else
      {
        if (!strncasecmp(v42, "fmt=", 4uLL))
        {
          int v44 = v42 + 4;
LABEL_109:
          *((void *)v3 + 3) = sub_100013090(v44);
          goto LABEL_124;
        }

        if (!strncasecmp(v42, "format=", 7uLL))
        {
          int v44 = v42 + 7;
          goto LABEL_109;
        }

        if (!strncasecmp(v42, "dest=", 5uLL))
        {
          uint64_t v45 = v42 + 5;
LABEL_112:
          *((void *)v3 + 4) = sub_100012EA4(v45);
          goto LABEL_124;
        }

        if (!strncasecmp(v42, "dst=", 4uLL))
        {
          uint64_t v45 = v42 + 4;
          goto LABEL_112;
        }

        if (!strncasecmp(v42, "coalesce=", 9uLL))
        {
          if (!strncasecmp(v42 + 9, "0", 1uLL) || !strncasecmp(v42 + 9, "off", 3uLL))
          {
            v3[18] &= ~8u;
            uint64_t v26 = v57;
          }

          else
          {
            uint64_t v26 = v57;
            if (!strncasecmp(v42 + 9, "false", 5uLL))
            {
              unsigned int v43 = v3[18] & 0xFFFFFFF7;
              goto LABEL_123;
            }
          }
        }

        else
        {
          if (!strncasecmp(v42, "compress", 8uLL))
          {
            unsigned int v43 = v3[18] | 0x10;
            goto LABEL_123;
          }

          if (!strncasecmp(v42, "extern", 6uLL))
          {
            unsigned int v43 = v3[18] | 0x40;
            goto LABEL_123;
          }

          if (!strncasecmp(v42, "truncate", 8uLL))
          {
            unsigned int v43 = v3[18] | 0x80;
            goto LABEL_123;
          }

          if (!strncasecmp(v42, "dir", 3uLL))
          {
            unsigned int v43 = v3[18] | 0x2000;
            goto LABEL_123;
          }

          if (!strncasecmp(v42, "soft", 4uLL))
          {
            unsigned int v43 = v3[18] | 0x800;
            goto LABEL_123;
          }

          if (!strncasecmp(v42, "file_max=", 9uLL))
          {
            *((void *)v3 + 19) = asl_core_str_to_size(v42 + 9);
            goto LABEL_124;
          }

          if (!strncasecmp(v42, "all_max=", 8uLL))
          {
            *((void *)v3 + 20) = asl_core_str_to_size(v42 + 8);
            goto LABEL_124;
          }

          if (!strncasecmp(v42, "style=", 6uLL) || !strncasecmp(v42, "rotate=", 7uLL))
          {
            uint64_t v46 = 6LL;
            if (*v42 == 114) {
              uint64_t v46 = 7LL;
            }
LABEL_136:
            unsigned int v43 = v3[18] | 4;
LABEL_123:
            v3[18] = v43;
            goto LABEL_124;
          }

          if (!strncasecmp(v42, "rotate", 6uLL))
          {
            if (*((void *)v3 + 6)) {
              int v47 = 536870913;
            }
            else {
              int v47 = 268435457;
            }
            v3[16] = v47;
            goto LABEL_136;
          }

          if (!strncasecmp(v42, "crashlog", 8uLL))
          {
            unsigned int v43 = v3[18] & 0xFFFFFAF3 | 0x504;
            goto LABEL_123;
          }

          if (!strncasecmp(v42, "basestamp", 9uLL))
          {
            unsigned int v43 = v3[18] | 0x100;
            goto LABEL_123;
          }

          if (!strncasecmp(v42, "link", 4uLL) || !strncasecmp(v42, "symlink", 7uLL))
          {
            unsigned int v43 = v3[18] | 0x200;
            goto LABEL_123;
          }

          if (!strncasecmp(v42, "ttl", 3uLL))
          {
            uint64_t v48 = (char)v42[3];
            if (v48 == 61)
            {
              v3[28] = asl_core_str_to_time(v42 + 4, 86400LL);
              uint64_t v26 = v57;
            }

            else
            {
              uint64_t v26 = v57;
              if ((v48 & 0xFFFFFFF8) == 0x30 && v42[4] == 61) {
                v3[(v48 - 48) + 20] = asl_core_str_to_time(v42 + 5, 86400LL);
              }
            }

            goto LABEL_124;
          }

          uint64_t v26 = v57;
          if (!strncasecmp(v42, "size_only", 9uLL))
          {
            unsigned int v43 = v3[18] | 0x8000;
            goto LABEL_123;
          }
        }
      }

LABEL_124:
      free(v42);
      uint64_t v42 = next_word_from_string(&v59);
    }

    while (v42);
  }

  __int128 v49 = (const char *)*((void *)v3 + 1);
  if (!strncasecmp(v49, "/Library/Logs/CrashReporter", 0x1BuLL)
    || !strncasecmp(v49, "/var/mobile/Library/Logs/CrashReporter", 0x26uLL)
    || !strncasecmp(v49, "/private/var/mobile/Library/Logs/CrashReporter", 0x2EuLL))
  {
    v3[18] = v3[18] & 0xFFFFFAF3 | 0x504;
  }

  unsigned int v50 = v3[28];
  for (uint64_t j = 20LL; j != 28; ++j)
  {
    unsigned int v52 = v3[j];
    if (v52 > v50)
    {
      v3[28] = v52;
      unsigned int v50 = v52;
    }
  }

  uint64_t v53 = (char *)*((void *)v3 + 3);
  if (!v53)
  {
    uint64_t v53 = strdup("std");
    *((void *)v3 + 3) = v53;
  }

  if (strcmp(v53, "std") && strcmp(v53, "bsd")) {
    v3[18] &= ~8u;
  }
  if (!strcmp(v53, "std") || !strcmp(v53, "bsd") || !strcmp(v53, "msg"))
  {
    unsigned int v54 = v3[18] | 0x4000;
    v3[18] = v54;
  }

  else
  {
    unsigned int v54 = v3[18];
  }

  if ((~v54 & 0x102) == 0)
  {
    unsigned int v54 = v54 & 0xFFFFFFFC | 1;
    v3[18] = v54;
  }

  if (!strcmp(v53, "raw")) {
    *((void *)v3 + 7) = "sec";
  }
  if (!strcmp(v49, "/var/log/asl"))
  {
    unsigned int v54 = 0x2000;
    v3[18] = 0x2000;
  }

  uint64_t v55 = *((void *)v3 + 19);
  if (!v55)
  {
    uint64_t v55 = *((void *)v3 + 20);
    *((void *)v3 + 19) = v55;
  }

  if ((v54 & 0x8000) != 0 && (!v55 || !*((void *)v3 + 20)))
  {
    v54 &= ~0x8000u;
    v3[18] = v54;
  }

  if ((~v54 & 0x8400) == 0) {
    v3[18] = v54 & 0xFFFF7FFF;
  }
  *((_DWORD *)v31 + setiopolicy_np(0, 0, 2) = 2;
  *((void *)v31 + 3) = v3;
  *((void *)v31 + 5) = *(void *)(v26 + 16);
  *(void *)(v26 + 16) = v31;
  return v3;
}

_DWORD *asl_out_module_init_from_file(const char *a1, FILE *a2)
{
  if (!a2) {
    return 0LL;
  }
  int v3 = asl_out_module_new(a1);
  if (v3)
  {
    line_from_file = get_line_from_file(a2);
    if (line_from_file)
    {
      uint64_t v5 = line_from_file;
      do
      {
        asl_out_module_parse_line((uint64_t)v3, v5);
        free(v5);
        uint64_t v5 = get_line_from_file(a2);
      }

      while (v5);
    }
  }

  return v3;
}

_DWORD *asl_out_module_init()
{
  *(void *)uint64_t v5 = 0LL;
  sub_1000125A0((DIR *)v5, "/usr/local/etc/asl", 2);
  sub_1000125A0((DIR *)v5, "/etc/asl", 0);
  uint64_t v0 = *(void *)v5;
  if (!sub_100012734(*(uint64_t *)v5, "com.apple.asl"))
  {
    uint64_t v2 = fopen("/etc/asl.conf", "r");
    if (v2)
    {
      int v3 = v2;
      unsigned int v4 = asl_out_module_init_from_file("com.apple.asl", v2);
      fclose(v3);
      uint64_t v0 = *(void *)v5;
      if (v4)
      {
        *((void *)v4 + 3) = *(void *)v5;
        return v4;
      }
    }

    else
    {
      return *(_DWORD **)v5;
    }
  }

  return (_DWORD *)v0;
}

DIR *sub_1000125A0(DIR *result, char *a2, int a3)
{
  if (result && a2)
  {
    p_dd_uint64_t fd = (uint64_t *)&result->__dd_fd;
    uint64_t v6 = *(void *)&result->__dd_fd;
    if (*(void *)&result->__dd_fd)
    {
      do
      {
        uint64_t v7 = (_DWORD *)v6;
        uint64_t v6 = *(void *)(v6 + 24);
      }

      while (v6);
    }

    else
    {
      uint64_t v7 = 0LL;
    }

    uint64_t result = opendir(a2);
    if (result)
    {
      int v8 = result;
      BOOL v9 = "%s/%s";
      while (1)
      {
        uint64_t v10 = readdir(v8);
        if (!v10) {
          break;
        }
        d_name = v10->d_name;
        if (v10->d_name[0] != 46 && !sub_100012734(*p_dd_fd, d_name))
        {
          BOOL v12 = v9;
          snprintf(__str, 0x400uLL, v9, a2, d_name);
          int v13 = fopen(__str, "r");
          if (v13 && (int v14 = v13, v15 = asl_out_module_init_from_file(d_name, v13), fclose(v14), v15))
          {
            v15[2] |= a3;
            int v16 = strcmp(d_name, "com.apple.asl");
            uint64_t v17 = *p_dd_fd;
            if (v16)
            {
              if (v17) {
                *((void *)v7 + 3) = v15;
              }
              else {
                *p_dd_uint64_t fd = (uint64_t)v15;
              }
            }

            else
            {
              *((void *)v15 + 3) = v17;
              *p_dd_uint64_t fd = (uint64_t)v15;
              if (v7) {
                uint64_t v15 = v7;
              }
            }
          }

          else
          {
            uint64_t v15 = v7;
          }

          uint64_t v7 = v15;
          BOOL v9 = v12;
        }
      }

      return (DIR *)closedir(v8);
    }
  }

  return result;
}

uint64_t sub_100012734(uint64_t a1, char *__s2)
{
  uint64_t result = 0LL;
  if (a1 && __s2)
  {
    while (!*(void *)a1 || strcmp(*(const char **)a1, __s2))
    {
      a1 = *(void *)(a1 + 24);
      if (!a1) {
        return 0LL;
      }
    }

    return a1;
  }

  return result;
}

void asl_out_module_print(FILE *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (v2)
  {
    while (1)
    {
      unsigned int v4 = (char *)asl_msg_to_string(*(void *)v2, v18);
      fprintf(a1, "  %s", off_1000194B0[*(unsigned int *)(v2 + 8)]);
      if (*(void *)v2) {
        fprintf(a1, " %s", v4);
      }
      if (*(void *)(v2 + 16)) {
        fprintf(a1, " %s", *(const char **)(v2 + 16));
      }
      if (*(_DWORD *)(v2 + 8) != 2) {
        goto LABEL_68;
      }
      uint64_t v5 = *(void *)(v2 + 24);
      if (v5) {
        break;
      }
      fwrite("  data: NULL", 0xCuLL, 1uLL, a1);
LABEL_68:
      fputc(10, a1);
      uint64_t v2 = *(void *)(v2 + 40);
      free(v4);
      if (!v2) {
        return;
      }
    }

    fprintf(a1, "%s\n", *(const char **)(v5 + 8));
    fprintf(a1, "    rules: %u\n", *(_DWORD *)(v5 + 168) - 1);
    uint64_t v6 = *(const char **)(v5 + 32);
    if (!v6) {
      uint64_t v6 = "(none)";
    }
    fprintf(a1, "    dest: %s\n", v6);
    uint64_t v7 = *(const char **)(v5 + 24);
    if (!v7) {
      uint64_t v7 = "std";
    }
    fprintf(a1, "    format: %s\n", v7);
    int v8 = *(const char **)(v5 + 56);
    if (!v8) {
      int v8 = "lcl";
    }
    fprintf(a1, "    time_format: %s\n", v8);
    fprintf(a1, "    flags: 0x%08x", *(_DWORD *)(v5 + 72));
    if (!*(_DWORD *)(v5 + 72))
    {
LABEL_34:
      fputc(10, a1);
      if ((*(_BYTE *)(v5 + 72) & 4) != 0)
      {
        fwrite("        rotatation style: ", 0x1AuLL, 1uLL, a1);
        int v11 = *(_DWORD *)(v5 + 64);
        if ((v11 & 0x10000000) != 0)
        {
          sub_100012DC0(v11);
          fprintf(a1, "[base=%s].%s\n");
        }

        else if ((v11 & 0x20000000) != 0)
        {
          sub_100012DC0(v11);
          fprintf(a1, "[base=%s].[ext=%s].%s\n");
        }

        else if ((v11 & 0x40000000) != 0)
        {
          sub_100012DC0(v11);
          fprintf(a1, "[base=%s].%s.[ext=%s]\n");
        }

        else
        {
          fprintf(a1, "0x%08x\n");
        }
      }

      asl_core_time_to_str(*(unsigned int *)(v5 + 112), v19, 150LL);
      fprintf(a1, "    ttl: %s\n", v19);
      unint64_t v12 = 0LL;
      do
      {
        int v13 = *(_DWORD *)(v5 + 80 + 4 * v12);
        if (v12 > 6) {
          break;
        }
        ++v12;
      }

      while (!v13);
      if (v13)
      {
        for (uint64_t i = 0LL; i != 8; ++i)
        {
          uint64_t v15 = *(unsigned int *)(v5 + 80 + 4 * i);
          if (!(_DWORD)v15) {
            uint64_t v15 = *(unsigned int *)(v5 + 112);
          }
          asl_core_time_to_str(v15, v19, 150LL);
          fprintf(a1, " [%d %s]", i, v19);
        }

        fputc(10, a1);
      }

      fprintf(a1, "    mode: 0%o\n", *(unsigned __int16 *)(v5 + 116));
      fprintf(a1, "    file_max: %lu\n", *(void *)(v5 + 152));
      fprintf(a1, "    all_max: %lu\n", *(void *)(v5 + 160));
      fwrite("    uid:", 8uLL, 1uLL, a1);
      if (*(_DWORD *)(v5 + 128))
      {
        unint64_t v16 = 0LL;
        do
          fprintf(a1, " %d", *(_DWORD *)(*(void *)(v5 + 120) + 4 * v16++));
        while (v16 < *(unsigned int *)(v5 + 128));
      }

      fputc(10, a1);
      fwrite("    gid:", 8uLL, 1uLL, a1);
      if (*(_DWORD *)(v5 + 144))
      {
        unint64_t v17 = 0LL;
        do
          fprintf(a1, " %d", *(_DWORD *)(*(void *)(v5 + 136) + 4 * v17++));
        while (v17 < *(unsigned int *)(v5 + 144));
      }

      goto LABEL_68;
    }

    fputc(32, a1);
    int v9 = *(_DWORD *)(v5 + 72);
    if ((v9 & 1) != 0)
    {
      fprintf(a1, "%cenabled", 40LL);
      int v9 = *(_DWORD *)(v5 + 72);
      uint64_t v10 = 32LL;
      if ((v9 & 0x800) == 0) {
        goto LABEL_21;
      }
    }

    else
    {
      uint64_t v10 = 40LL;
      if ((v9 & 0x800) == 0)
      {
LABEL_21:
        if ((v9 & 4) != 0)
        {
          fprintf(a1, "%crotate", v10);
          int v9 = *(_DWORD *)(v5 + 72);
          uint64_t v10 = 32LL;
          if ((v9 & 8) == 0)
          {
LABEL_23:
            if ((v9 & 0x10) == 0) {
              goto LABEL_24;
            }
            goto LABEL_41;
          }
        }

        else if ((v9 & 8) == 0)
        {
          goto LABEL_23;
        }

        fprintf(a1, "%ccoalesce", v10);
        int v9 = *(_DWORD *)(v5 + 72);
        uint64_t v10 = 32LL;
        if ((v9 & 0x10) == 0)
        {
LABEL_24:
          if ((v9 & 0x100) == 0) {
            goto LABEL_25;
          }
          goto LABEL_42;
        }

LABEL_41:
        fprintf(a1, "%ccompress", v10);
        int v9 = *(_DWORD *)(v5 + 72);
        uint64_t v10 = 32LL;
        if ((v9 & 0x100) == 0)
        {
LABEL_25:
          if ((v9 & 0x200) == 0) {
            goto LABEL_26;
          }
          goto LABEL_43;
        }

LABEL_42:
        fprintf(a1, "%cbasestamp", v10);
        int v9 = *(_DWORD *)(v5 + 72);
        uint64_t v10 = 32LL;
        if ((v9 & 0x200) == 0)
        {
LABEL_26:
          if ((v9 & 0x20) == 0) {
            goto LABEL_27;
          }
          goto LABEL_44;
        }

LABEL_43:
        fprintf(a1, "%csymlink", v10);
        int v9 = *(_DWORD *)(v5 + 72);
        uint64_t v10 = 32LL;
        if ((v9 & 0x20) == 0)
        {
LABEL_27:
          if ((v9 & 0x40) == 0) {
            goto LABEL_28;
          }
          goto LABEL_45;
        }

LABEL_44:
        fprintf(a1, "%cnon-std_dir", v10);
        int v9 = *(_DWORD *)(v5 + 72);
        uint64_t v10 = 32LL;
        if ((v9 & 0x40) == 0)
        {
LABEL_28:
          if ((v9 & 0x400) == 0) {
            goto LABEL_29;
          }
          goto LABEL_46;
        }

LABEL_45:
        fprintf(a1, "%cexternal", v10);
        int v9 = *(_DWORD *)(v5 + 72);
        uint64_t v10 = 32LL;
        if ((v9 & 0x400) == 0)
        {
LABEL_29:
          if ((v9 & 0x1000) == 0) {
            goto LABEL_30;
          }
          goto LABEL_47;
        }

LABEL_46:
        fprintf(a1, "%ccrashlog", v10);
        int v9 = *(_DWORD *)(v5 + 72);
        uint64_t v10 = 32LL;
        if ((v9 & 0x1000) == 0)
        {
LABEL_30:
          if ((v9 & 0x2000) == 0) {
            goto LABEL_31;
          }
          goto LABEL_48;
        }

LABEL_47:
        fprintf(a1, "%casl_file", v10);
        int v9 = *(_DWORD *)(v5 + 72);
        uint64_t v10 = 32LL;
        if ((v9 & 0x2000) == 0)
        {
LABEL_31:
          if ((v9 & 0x8000) == 0)
          {
LABEL_33:
            fputc(41, a1);
            goto LABEL_34;
          }

LABEL_32:
          fprintf(a1, "%csize_only", v10);
          goto LABEL_33;
        }

LABEL_48:
        fprintf(a1, "%casl_directory", v10);
        uint64_t v10 = 32LL;
        if ((*(_DWORD *)(v5 + 72) & 0x8000) == 0) {
          goto LABEL_33;
        }
        goto LABEL_32;
      }
    }

    fprintf(a1, "%csoft", v10);
    int v9 = *(_DWORD *)(v5 + 72);
    uint64_t v10 = 32LL;
    goto LABEL_21;
  }

const char *sub_100012DC0(char a1)
{
  uint64_t v1 = "<sequence>";
  uint64_t v2 = "<utc>";
  int v3 = "<utc-basic>";
  unsigned int v4 = "<local>";
  uint64_t v5 = "<local-basic>";
  if ((a1 & 0x20) == 0) {
    uint64_t v5 = "<unknown>";
  }
  if ((a1 & 0x10) == 0) {
    unsigned int v4 = v5;
  }
  if ((a1 & 8) == 0) {
    int v3 = v4;
  }
  if ((a1 & 4) == 0) {
    uint64_t v2 = v3;
  }
  if ((a1 & 2) == 0) {
    uint64_t v1 = v2;
  }
  if ((a1 & 1) != 0) {
    return "<seconds>";
  }
  else {
    return v1;
  }
}

uint64_t sub_100012E2C(uint64_t result)
{
  if (result)
  {
    do
    {
      while (1)
      {
        int v2 = *(unsigned __int8 *)++result;
        int v1 = v2;
        if (v2 <= 31) {
          break;
        }
        if (v1 != 32)
        {
          if (v1 != 91) {
            return result;
          }
          do
          {
            int v3 = *(unsigned __int8 *)(result + 1);
            if (v3 == 92)
            {
              int v4 = *(unsigned __int8 *)(result + 2);
              BOOL v5 = v4 == 93;
              if (v4 == 93) {
                uint64_t v6 = 3LL;
              }
              else {
                uint64_t v6 = 2LL;
              }
              int v3 = *(unsigned __int8 *)(result + v6);
              if (v5) {
                result += 3LL;
              }
              else {
                result += 2LL;
              }
            }

            else
            {
              ++result;
            }
          }

          while (v3 != 93);
        }
      }
    }

    while (v1 == 9);
    if (!v1) {
      return 0LL;
    }
  }

  return result;
}

_BYTE *sub_100012EA4(char *__s)
{
  if (!__s) {
    return 0LL;
  }
  for (uint64_t i = __s; ; ++i)
  {
    int v2 = *(unsigned __int8 *)i;
    if (v2 != 32 && v2 != 9) {
      break;
    }
  }

  size_t v4 = strlen(i);
  if (!v4) {
    return 0LL;
  }
  size_t v5 = v4;
  while (1)
  {
    int v6 = i[v5 - 1];
    if (v6 != 32 && v6 != 9) {
      break;
    }
    if (!--v5) {
      return 0LL;
    }
  }

  uint64_t v10 = malloc(v5 + 1);
  int v8 = v10;
  if (v10)
  {
    memcpy(v10, i, v5);
    v8[v5] = 0;
  }

  return v8;
}

_DWORD *sub_100012F40(_DWORD *result, char *a2)
{
  if (result && a2)
  {
    int v2 = result;
    int pw_uid = atoi(a2);
    if (pw_uid == 501)
    {
      size_t v4 = getpwnam("mobile");
      if (v4) {
        int pw_uid = v4->pw_uid;
      }
      else {
        int pw_uid = 501;
      }
    }

    int v5 = v2[32];
    uint64_t result = (_DWORD *)*((void *)v2 + 15);
    if (v5)
    {
      uint64_t v6 = v2[32];
      uint64_t v7 = (int *)*((void *)v2 + 15);
      while (1)
      {
        int v8 = *v7++;
        if (v8 == pw_uid) {
          break;
        }
        if (!--v6) {
          goto LABEL_11;
        }
      }
    }

    else
    {
LABEL_11:
      uint64_t result = reallocf(result, 4LL * (v5 + 1));
      *((void *)v2 + 15) = result;
      if (result)
      {
        uint64_t v9 = v2[32];
        v2[32] = v9 + 1;
        result[v9] = pw_uid;
      }

      else
      {
        v2[32] = 0;
      }
    }
  }

  return result;
}

_DWORD *sub_100012FE8(_DWORD *result, char *a2)
{
  if (result && a2)
  {
    int v2 = result;
    int pw_gid = atoi(a2);
    if (pw_gid == 501)
    {
      size_t v4 = getpwnam("mobile");
      if (v4) {
        int pw_gid = v4->pw_gid;
      }
      else {
        int pw_gid = 501;
      }
    }

    int v5 = v2[36];
    uint64_t result = (_DWORD *)*((void *)v2 + 17);
    if (v5)
    {
      uint64_t v6 = v2[36];
      uint64_t v7 = (int *)*((void *)v2 + 17);
      while (1)
      {
        int v8 = *v7++;
        if (v8 == pw_gid) {
          break;
        }
        if (!--v6) {
          goto LABEL_11;
        }
      }
    }

    else
    {
LABEL_11:
      uint64_t result = reallocf(result, 4LL * (v5 + 1));
      *((void *)v2 + 17) = result;
      if (result)
      {
        uint64_t v9 = v2[36];
        v2[36] = v9 + 1;
        result[v9] = pw_gid;
      }

      else
      {
        v2[36] = 0;
      }
    }
  }

  return result;
}

const char *sub_100013090(const char *result)
{
  if (!result) {
    return result;
  }
  int v1 = result;
  size_t v2 = strlen(result);
  size_t v3 = v2;
  if (v2 >= 2)
  {
    int v4 = *(unsigned __int8 *)v1;
    if (v4 != 39 && v4 != 34 || v1[v2 - 1] != v4)
    {
LABEL_8:
      uint64_t v5 = 0LL;
      uint64_t v6 = 0LL;
      do
      {
        if (v1[v6] == 92) {
          ++v5;
        }
        ++v6;
      }

      while (v3 != v6);
      char v7 = 0;
      goto LABEL_14;
    }

    ++v1;
    size_t v3 = v2 - 2;
  }

  if (v3) {
    goto LABEL_8;
  }
  uint64_t v5 = 0LL;
  char v7 = 1;
LABEL_14:
  uint64_t result = (const char *)malloc(v3 - v5 + 1);
  if (result)
  {
    uint64_t v8 = 0LL;
    if ((v7 & 1) == 0)
    {
      do
      {
        int v10 = *(unsigned __int8 *)v1++;
        char v9 = v10;
        if (v10 != 92) {
          result[v8++] = v9;
        }
        --v3;
      }

      while (v3);
    }

    result[v8] = 0;
  }

  return result;
}

uint64_t sub_100013160(uint64_t a1, const char *a2)
{
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  if (*a2 == 46)
  {
    int v4 = a2;
  }

  else
  {
    int v10 = *(const char **)(a1 + 40);
    if (!v10) {
      return 0xFFFFFFFFLL;
    }
    size_t v11 = strlen(*(const char **)(a1 + 40));
    if (strncmp(a2, v10, v11) || (int v4 = &a2[v11], a2[v11] != 46))
    {
      int v12 = sub_100013304((uint64_t)a2);
      *(_DWORD *)(a1 + 64) = v12;
      if (v12)
      {
        int v13 = v12;
        uint64_t result = 0LL;
        if (*(void *)(a1 + 48)) {
          int v14 = 0x20000000;
        }
        else {
          int v14 = 0x10000000;
        }
        int v15 = v14 | v13;
        goto LABEL_26;
      }

      return 0xFFFFFFFFLL;
    }
  }

  uint64_t v5 = v4 + 1;
  for (uint64_t i = v4 + 2; ; ++i)
  {
    unsigned int v7 = *((unsigned __int8 *)i - 1);
    if (v7 <= 0x1F)
    {
      if (*(i - 1)) {
        BOOL v8 = v7 == 9;
      }
      else {
        BOOL v8 = 1;
      }
      if (v8)
      {
LABEL_24:
        int v16 = sub_100013304((uint64_t)v5);
        *(_DWORD *)(a1 + 64) = v16;
        if (!v16) {
          return 0xFFFFFFFFLL;
        }
        int v17 = v16;
        uint64_t result = 0LL;
        int v15 = v17 | 0x10000000;
        goto LABEL_26;
      }

      continue;
    }

    if (v7 == 32) {
      goto LABEL_24;
    }
    if (v7 == 46) {
      break;
    }
  }

  int v18 = *(const char **)(a1 + 48);
  if (!v18) {
    return 0xFFFFFFFFLL;
  }
  size_t v19 = strlen(*(const char **)(a1 + 48));
  if (strncmp(v5, v18, v19) || v5[v19] != 46)
  {
    if (!strncmp(i, v18, v19))
    {
      int v22 = sub_100013304((uint64_t)v5);
      *(_DWORD *)(a1 + 64) = v22;
      if (v22)
      {
        int v23 = v22;
        uint64_t result = 0LL;
        int v15 = v23 | 0x40000000;
        goto LABEL_26;
      }
    }

    return 0xFFFFFFFFLL;
  }

  int v20 = sub_100013304((uint64_t)i);
  *(_DWORD *)(a1 + 64) = v20;
  if (!v20) {
    return 0xFFFFFFFFLL;
  }
  int v21 = v20;
  uint64_t result = 0LL;
  int v15 = v21 | 0x20000000;
LABEL_26:
  *(_DWORD *)(a1 + 64) = v15;
  return result;
}

uint64_t sub_100013304(uint64_t result)
{
  if (!result) {
    return result;
  }
  for (unint64_t i = 0LL; ; ++i)
  {
    int v2 = *(unsigned __int8 *)(result + i);
    if (i > 0xA) {
      goto LABEL_9;
    }
LABEL_8:
    *((_BYTE *)&v9 + i) = v2;
  }

  if (i <= 0xA && v2 == 45) {
    goto LABEL_8;
  }
LABEL_9:
  *((_BYTE *)&v9 + i) = 0;
  if ((_DWORD)v9 == 6514035 || v9 == 0x73646E6F636573LL) {
    return 1LL;
  }
  if ((_DWORD)v9 == 761492597 && WORD2(v9) == 98) {
    return 8LL;
  }
  BOOL v5 = (_DWORD)v9 == 1633906540 && WORD2(v9) == 108;
  if (v5 || (_DWORD)v9 == 7103340) {
    return 16LL;
  }
  if (v9 == 0x622D6C61636F6CLL) {
    return 32LL;
  }
  if ((_DWORD)v9 == 762078060 && WORD2(v9) == 98) {
    return 32LL;
  }
  if (v9 == 0x61622D6C61636F6CLL && v10 == 6515059) {
    return 32LL;
  }
  return 2 * ((v9 ^ 0x65636E6575716573LL | v10) == 0);
}

uint64_t (*asl_ipc_server_routine(uint64_t a1))()
{
  int v1 = *(_DWORD *)(a1 + 20);
  else {
    return 0LL;
  }
}

uint64_t sub_1000135A4(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 56)
  {
    int v3 = -304;
    goto LABEL_10;
  }

  if (*(_BYTE *)(result + 39) != 1 || *(_DWORD *)(result + 40) != *(_DWORD *)(result + 52))
  {
    int v3 = -300;
    goto LABEL_10;
  }

  if (*(_DWORD *)(result + 56) || *(_DWORD *)(result + 60) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_10:
    *(_DWORD *)(a2 + 3setiopolicy_np(0, 0, 2) = v3;
    goto LABEL_11;
  }

  int v4 = (_DWORD *)(a2 + 28);
  *(void *)(a2 + 3setiopolicy_np(0, 0, 2) = 0x11000000000000LL;
  BOOL v5 = (vm_address_t *)(a2 + 40);
  *(_DWORD *)(a2 + 48) = 16777473;
  int v6 = *(_DWORD *)(result + 12);
  vm_address_t v7 = *(void *)(result + 28);
  uint64_t v8 = *(unsigned int *)(result + 40);
  __int128 v9 = *(_OWORD *)(result + 92);
  v10[0] = *(_OWORD *)(result + 76);
  v10[1] = v9;
  uint64_t result = sub_100009DB0(v6, v7, v8, v4, v5, (_DWORD *)(a2 + 64), (int *)(a2 + 68), v10);
  if (!(_DWORD)result)
  {
    *(_DWORD *)(a2 + 5setiopolicy_np(0, 0, 2) = *(_DWORD *)(a2 + 64);
    *(NDR_record_t *)(a2 + 56) = NDR_record;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 72;
    *(_DWORD *)(a2 + 24) = 2;
    return result;
  }

  *(_DWORD *)(a2 + 3setiopolicy_np(0, 0, 2) = result;
LABEL_11:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_1000136D0( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 56)
  {
    if (*(_BYTE *)(result + 39) == 1 && (uint64_t v9 = *(unsigned int *)(result + 40), (_DWORD)v9 == *(_DWORD *)(result + 52)))
    {
      if (!*(_DWORD *)(result + 56) && *(_DWORD *)(result + 60) > 0x1Fu)
      {
        int v11 = *(_DWORD *)(result + 12);
        vm_address_t v12 = *(void *)(result + 28);
        __int128 v13 = *(_OWORD *)(result + 92);
        v14[0] = *(_OWORD *)(result + 76);
        v14[1] = v13;
        uint64_t result = sub_100009A44(v11, v12, v9, v14, a5, a6, a7, a8);
        *(_DWORD *)(a2 + 3setiopolicy_np(0, 0, 2) = result;
        return result;
      }

      int v10 = -309;
    }

    else
    {
      int v10 = -300;
    }
  }

  else
  {
    int v10 = -304;
  }

  *(_DWORD *)(a2 + 3setiopolicy_np(0, 0, 2) = v10;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100013798(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    int v3 = -304;
  }

  else
  {
    if (!*(_DWORD *)(result + 36) && *(_DWORD *)(result + 40) > 0x1Fu)
    {
      uint64_t v4 = *(unsigned int *)(result + 12);
      int v5 = *(_DWORD *)(result + 32);
      __int128 v6 = *(_OWORD *)(result + 72);
      v7[0] = *(_OWORD *)(result + 56);
      v7[1] = v6;
      uint64_t result = sub_10000A1A0(v4, v5, v7);
      *(_DWORD *)(a2 + 3setiopolicy_np(0, 0, 2) = result;
      return result;
    }

    int v3 = -309;
  }

  *(_DWORD *)(a2 + 3setiopolicy_np(0, 0, 2) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100013830( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    int v9 = -304;
  }

  else
  {
    if (!*(_DWORD *)(result + 36) && *(_DWORD *)(result + 40) > 0x1Fu)
    {
      uint64_t v10 = *(unsigned int *)(result + 12);
      uint64_t v11 = *(unsigned int *)(result + 32);
      __int128 v12 = *(_OWORD *)(result + 72);
      v13[0] = *(_OWORD *)(result + 56);
      v13[1] = v12;
      uint64_t result = sub_10000A488(v10, v11, (uint64_t)v13, a4, a5, a6, a7, a8);
      *(_DWORD *)(a2 + 3setiopolicy_np(0, 0, 2) = result;
      return result;
    }

    int v9 = -309;
  }

  *(_DWORD *)(a2 + 3setiopolicy_np(0, 0, 2) = v9;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_1000138C8(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 72)
  {
    int v3 = -304;
    goto LABEL_10;
  }

  if (*(_BYTE *)(result + 39) != 1 || *(_DWORD *)(result + 40) != *(_DWORD *)(result + 52))
  {
    int v3 = -300;
    goto LABEL_10;
  }

  if (*(_DWORD *)(result + 72) || *(_DWORD *)(result + 76) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_10:
    *(_DWORD *)(a2 + 3setiopolicy_np(0, 0, 2) = v3;
    goto LABEL_11;
  }

  *(_DWORD *)(a2 + 36) = 16777473;
  uint64_t v4 = (void *)(a2 + 28);
  int v5 = *(_DWORD *)(result + 12);
  vm_address_t v6 = *(void *)(result + 28);
  vm_size_t v7 = *(unsigned int *)(result + 40);
  uint64_t v8 = *(void *)(result + 56);
  int v9 = *(_DWORD *)(result + 64);
  int v10 = *(_DWORD *)(result + 68);
  __int128 v11 = *(_OWORD *)(result + 108);
  v12[0] = *(_OWORD *)(result + 92);
  v12[1] = v11;
  uint64_t result = sub_100008C18(v5, v6, v7, v8, v9, v10, v4, (_DWORD *)(a2 + 52), (void *)(a2 + 56), (int *)(a2 + 64), v12);
  if (!(_DWORD)result)
  {
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
    *(NDR_record_t *)(a2 + 44) = NDR_record;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 68;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }

  *(_DWORD *)(a2 + 3setiopolicy_np(0, 0, 2) = result;
LABEL_11:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_1000139F8(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 80)
  {
    int v3 = -304;
    goto LABEL_10;
  }

  if (*(_BYTE *)(result + 39) != 1 || *(_DWORD *)(result + 40) != *(_DWORD *)(result + 52))
  {
    int v3 = -300;
    goto LABEL_10;
  }

  if (*(_DWORD *)(result + 80) || *(_DWORD *)(result + 84) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_10:
    *(_DWORD *)(a2 + 3setiopolicy_np(0, 0, 2) = v3;
    goto LABEL_11;
  }

  *(_DWORD *)(a2 + 36) = 16777473;
  uint64_t v4 = (void *)(a2 + 28);
  int v5 = *(_DWORD *)(result + 12);
  vm_address_t v6 = *(void *)(result + 28);
  vm_size_t v7 = *(unsigned int *)(result + 40);
  uint64_t v8 = *(void *)(result + 56);
  uint64_t v9 = *(void *)(result + 64);
  int v10 = *(_DWORD *)(result + 72);
  int v11 = *(_DWORD *)(result + 76);
  __int128 v12 = *(_OWORD *)(result + 116);
  v14[0] = *(_OWORD *)(result + 100);
  v14[1] = v12;
  *((void *)&v13 + 1) = a2 + 64;
  *(void *)&__int128 v13 = a2 + 56;
  uint64_t result = sub_1000099F0(v5, v6, v7, v8, v9, v10, v11, v4, (_DWORD *)(a2 + 52), v13, v14);
  if (!(_DWORD)result)
  {
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
    *(NDR_record_t *)(a2 + 44) = NDR_record;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 68;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }

  *(_DWORD *)(a2 + 3setiopolicy_np(0, 0, 2) = result;
LABEL_11:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t asl_ipc_server(_DWORD *a1, uint64_t a2)
{
  int v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 1setiopolicy_np(0, 0, 2) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  int v4 = a1[5];
  if ((v4 - 123) >= 0xFFFFFFF7
    && (int v5 = (void (*)(void))_asl_ipc_subsystem[5 * (v4 - 114) + 5]) != 0LL)
  {
    v5();
    return 1LL;
  }

  else
  {
    uint64_t result = 0LL;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 3setiopolicy_np(0, 0, 2) = -303;
  }

  return result;
}

void sub_100013BB0( char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a2;
  sub_1000064BC("FATAL ERROR: mach_msg() send failed with status 0x%08x\n", a2, a3, a4, a5, a6, a7, a8, a2);
  snprintf( a1,  0x100uLL,  "[Sender syslogd] [Level 1] [PID %u] [Facility syslog] [Message FATAL ERROR: mach_msg() send failed with status 0x%08x]",  dword_10001E37C,  v8);
  sub_100007114((uint64_t)a1);
  sleep(1u);
  abort();
}