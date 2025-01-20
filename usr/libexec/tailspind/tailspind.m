double sub_1000014AC(unint64_t a1)
{
  if (qword_1000125B8 != -1) {
    dispatch_once(&qword_1000125B8, &stru_10000C630);
  }
  return *(double *)&qword_1000125B0 * (double)a1 * 0.000000001;
}

void sub_10000150C(id a1)
{
  LODWORD(v1) = info.numer;
  LODWORD(v2) = info.denom;
  *(double *)&qword_1000125B0 = (double)v1 / (double)v2;
}
}

id sub_100002490()
{
  if (qword_1000125C8 != -1) {
    dispatch_once(&qword_1000125C8, &stru_10000C650);
  }
  return (id)qword_1000125C0;
}

void sub_1000024D0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.tailspin", "library");
  unint64_t v2 = (void *)qword_1000125C0;
  qword_1000125C0 = (uint64_t)v1;

  id v3 = (id)qword_1000125C0;
  if (!v3) {
    sub_100007660();
  }
}

uint64_t sub_10000251C( int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t result = snprintf(byte_1000125D0, 0x400uLL, "%d ", a1);
  qword_100012578 = (uint64_t)byte_1000125D0;
  return result;
}

uint64_t sub_100002598(uint64_t a1)
{
  size_t __sizep = 0LL;
  __bufp = 0LL;
  if (qword_100012440 == (unint64_t)ktrace_config_kdebug_get_buffer_size() >> 20)
  {
    uint64_t typefilter = ktrace_config_kdebug_get_typefilter(a1);
    if (typefilter)
    {
      uint64_t v3 = typefilter;
      memcpy(__dst, &unk_10001041C, sizeof(__dst));
      if (qword_100012468) {
        BOOL v4 = 0;
      }
      else {
        BOOL v4 = qword_100012490 == 0;
      }
      if (!v4 || dword_1000124DC != 0)
      {
        for (unsigned int i = 0; i != 256; ++i)
          __dst[(i >> 3) | 0x4A0LL] |= 1 << (i & 7);
      }

      int v7 = 0;
      while (2)
      {
        for (int j = 0; j != 256; ++j)
        {
          unint64_t v9 = j | (v7 << 8);
          int v10 = 1 << (j & 7);
          if ((v10 & __dst[v9 >> 3]) != 0 && (v10 & *(_BYTE *)(v3 + (v9 >> 3))) == 0)
          {
            int v16 = *__error();
            id v19 = sub_100002490();
            v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              sub_100007A18();
            }
            goto LABEL_34;
          }
        }

        if (++v7 != 256) {
          continue;
        }
        break;
      }

      uint64_t timer_period_ns = ktrace_config_kperf_get_timer_period_ns(a1, qword_100012528);
      if (timer_period_ns == qword_100012468)
      {
        if (!timer_period_ns) {
          goto LABEL_23;
        }
        uint64_t timer_action_id = ktrace_config_kperf_get_timer_action_id(a1, qword_100012528);
        if ((_DWORD)timer_action_id == HIDWORD(qword_100012528))
        {
          if (ktrace_config_kperf_get_action_samplers(a1, timer_action_id) == dword_100012530)
          {
            if (ktrace_config_kperf_get_pet_mode(a1) == 2)
            {
LABEL_23:
              uint64_t v13 = ktrace_config_kperf_get_timer_period_ns(a1, dword_100012534);
              if (v13 == qword_100012490)
              {
                if (!v13) {
                  return 1LL;
                }
                uint64_t v14 = ktrace_config_kperf_get_timer_action_id(a1, dword_100012534);
                if ((_DWORD)v14 == dword_100012538)
                {
                  if (ktrace_config_kperf_get_action_samplers(a1, v14) == dword_10001253C) {
                    return 1LL;
                  }
                  int v16 = *__error();
                  id v32 = sub_100002490();
                  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
                  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
                    sub_10000775C();
                  }
                }

                else
                {
                  int v16 = *__error();
                  id v31 = sub_100002490();
                  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
                  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
                    sub_1000077C4();
                  }
                }
              }

              else
              {
                int v16 = *__error();
                id v28 = sub_100002490();
                v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
                if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
                  sub_100007830();
                }
              }
            }

            else
            {
              int v16 = *__error();
              id v30 = sub_100002490();
              v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
                sub_1000078A4();
              }
            }
          }

          else
          {
            int v16 = *__error();
            id v29 = sub_100002490();
            v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              sub_1000078D0();
            }
          }
        }

        else
        {
          int v16 = *__error();
          id v27 = sub_100002490();
          v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            sub_100007938();
          }
        }
      }

      else
      {
        int v16 = *__error();
        id v26 = sub_100002490();
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_1000079A4();
        }
      }
    }

    else
    {
      int v16 = *__error();
      id v20 = sub_100002490();
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_1000076E4(v18);
      }
    }
  }

  else
  {
    int v16 = *__error();
    id v17 = sub_100002490();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100007A7C();
    }
  }

LABEL_34:
  *__error() = v16;
  uint64_t result = (uint64_t)open_memstream(&__bufp, &__sizep);
  if (result)
  {
    v21 = (FILE *)result;
    if (!ktrace_config_print_description(a1, result))
    {
      int v22 = *__error();
      id v23 = sub_100002490();
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_100007678((uint64_t *)&__bufp, v24, v25);
      }

      *__error() = v22;
    }

    fclose(v21);
    free(__bufp);
    return 0LL;
  }

  return result;
}

void sub_100002A4C()
{
  uint64_t tailspin_profile_config = get_tailspin_profile_config();
  if (tailspin_profile_config)
  {
    uint64_t v1 = tailspin_profile_config;
LABEL_3:
    sub_100002B14(v1);
    tailspin_config_free(v1);
    goto LABEL_4;
  }

  uint64_t tailspin_tasking_config = get_tailspin_tasking_config();
  if (tailspin_tasking_config)
  {
    uint64_t v1 = tailspin_tasking_config;
    if (dword_100010418 == 2)
    {
      tailspin_config_free(tailspin_tasking_config);
      return;
    }

    goto LABEL_3;
  }

  if ((dword_100010418 & 0xFFFFFFFD) != 1) {
    return;
  }
  sub_100002B14(0LL);
LABEL_4:
  uint64_t v2 = sub_100003FA8();
  if ((v2 & 1) != 0)
  {
    sub_100004284(v2);
    sub_100003E64();
  }

  else
  {
    int v3 = *__error();
    id v4 = sub_100002490();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100007AF0();
    }

    *__error() = v3;
  }

uint64_t sub_100002B14(uint64_t a1)
{
  uint64_t v2 = (const char *)(a1 + 8204);
  if (a1 && (*(_BYTE *)a1 & 0x80) != 0)
  {
    uint64_t v8 = qword_100010410;
    if ((qword_100010410 & 0x80) != 0)
    {
      char v14 = byte_1000124B8;
      int v9 = *__error();
      id v15 = sub_100002490();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = v2 + 157;
        if (!v2[157])
        {
          int v17 = *(_DWORD *)(a1 + 8);
          if (v17 == 3)
          {
            int v16 = "<profile>";
          }

          else if (v17 == 1)
          {
            int v16 = "<tasking>";
          }

          else
          {
            int v16 = "<unknown>";
          }
        }

        int v23 = *((unsigned __int8 *)v2 + 156);
        v24 = &byte_1000124B9;
        if (!byte_1000124B9)
        {
          if (dword_100010418 == 3)
          {
            v24 = "<profile>";
          }

          else if (dword_100010418 == 1)
          {
            v24 = "<tasking>";
          }

          else
          {
            v24 = "<unknown>";
          }
        }

        int v149 = 136446978;
        v150 = (void *)v16;
        __int16 v151 = 1024;
        *(_DWORD *)v152 = v23;
        *(_WORD *)&v152[4] = 2082;
        *(void *)&v152[6] = v24;
        *(_WORD *)&v152[14] = 1024;
        *(_DWORD *)&v152[16] = byte_1000124B8;
        id v20 = "%{public}s requested to change tailspin enablement to %d, overriding previous request from %{public}s to c"
              "hange tailspin enablement to %d";
        v21 = v11;
        uint32_t v22 = 34;
        goto LABEL_40;
      }
    }

    else
    {
      int v9 = *__error();
      id v10 = sub_100002490();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = v2 + 157;
        if (!v2[157])
        {
          int v13 = *(_DWORD *)(a1 + 8);
          if (v13 == 3)
          {
            v12 = "<profile>";
          }

          else if (v13 == 1)
          {
            v12 = "<tasking>";
          }

          else
          {
            v12 = "<unknown>";
          }
        }

        int v19 = *((unsigned __int8 *)v2 + 156);
        int v149 = 136446722;
        v150 = (void *)v12;
        __int16 v151 = 1024;
        *(_DWORD *)v152 = v19;
        *(_WORD *)&v152[4] = 1024;
        *(_DWORD *)&v152[6] = byte_1000124B8;
        id v20 = "%{public}s requested to change tailspin enablement to %d from default %d";
        v21 = v11;
        uint32_t v22 = 24;
LABEL_40:
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v149, v22);
      }
    }

    *__error() = v9;
    uint64_t v8 = qword_100010410;
    char v14 = v2[156];
LABEL_42:
    qword_100010410 = v8 | 0x80;
    *((_BYTE *)&qword_100010410 + &loc_1000020A8) = v14;
    v18 = (int *)set_config_field_modifier( (char *)&qword_100010410 + &loc_1000020A8,  a1 + &loc_1000020A8);
    goto LABEL_43;
  }

  uint64_t v3 = qword_100010410;
  if ((qword_100010410 & 0x80) != 0)
  {
    int v4 = *__error();
    id v5 = sub_100002490();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = &byte_1000124B9;
      if (!byte_1000124B9)
      {
        if (dword_100010418 == 3)
        {
          int v7 = "<profile>";
        }

        else if (dword_100010418 == 1)
        {
          int v7 = "<tasking>";
        }

        else
        {
          int v7 = "<unknown>";
        }
      }

      int v149 = 136446722;
      v150 = v7;
      __int16 v151 = 1024;
      *(_DWORD *)v152 = byte_1000124B8;
      *(_WORD *)&v152[4] = 1024;
      *(_DWORD *)&v152[6] = tailspin_enabled_get_default();
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Reverted previous request by %{public}s to change tailspin enablement to %d to default %d",  (uint8_t *)&v149,  0x18u);
    }

    *__error() = v4;
    uint64_t v3 = qword_100010410;
  }

  qword_100010410 = v3 & 0xFFFFFFFFFFFFFF7FLL;
  *((_BYTE *)&qword_100010410 + &loc_1000020A8) = tailspin_enabled_get_default();
  v18 = (int *)set_config_field_modifier((char *)&qword_100010410 + &loc_1000020A8, 0LL);
  if (a1)
  {
LABEL_43:
    if ((*(_BYTE *)a1 & 2) == 0) {
      goto LABEL_44;
    }
    uint64_t v30 = qword_100010410;
    if ((qword_100010410 & 2) != 0)
    {
      uint64_t v36 = qword_100012440;
      int v31 = *__error();
      id v37 = sub_100002490();
      v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v38 = v2 + 44;
        if (!v2[44])
        {
          int v39 = *(_DWORD *)(a1 + 8);
          if (v39 == 3)
          {
            v38 = "<profile>";
          }

          else if (v39 == 1)
          {
            v38 = "<tasking>";
          }

          else
          {
            v38 = "<unknown>";
          }
        }

        uint64_t v47 = *(void *)(a1 + 8240);
        v48 = &byte_100012448;
        if (!byte_100012448)
        {
          if (dword_100010418 == 3)
          {
            v48 = "<profile>";
          }

          else if (dword_100010418 == 1)
          {
            v48 = "<tasking>";
          }

          else
          {
            v48 = "<unknown>";
          }
        }

        int v149 = 136446978;
        v150 = (void *)v38;
        __int16 v151 = 2048;
        *(void *)v152 = v47;
        *(_WORD *)&v152[8] = 2082;
        *(void *)&v152[10] = v48;
        *(_WORD *)&v152[18] = 2048;
        uint64_t v153 = qword_100012440;
        v44 = "%{public}s requested to change tailspin buffer size to %zu MB, overriding previous request from %{public}s"
              " to change tailspin buffer size to %zu MB";
        v45 = v33;
        uint32_t v46 = 42;
        goto LABEL_81;
      }
    }

    else
    {
      int v31 = *__error();
      id v32 = sub_100002490();
      v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v34 = v2 + 44;
        if (!v2[44])
        {
          int v35 = *(_DWORD *)(a1 + 8);
          if (v35 == 3)
          {
            v34 = "<profile>";
          }

          else if (v35 == 1)
          {
            v34 = "<tasking>";
          }

          else
          {
            v34 = "<unknown>";
          }
        }

        uint64_t v43 = *(void *)(a1 + 8240);
        int v149 = 136446722;
        v150 = (void *)v34;
        __int16 v151 = 2048;
        *(void *)v152 = v43;
        *(_WORD *)&v152[8] = 2048;
        *(void *)&v152[10] = qword_100012440;
        v44 = "%{public}s requested to change tailspin buffer size to %zu MB from default %zu MB";
        v45 = v33;
        uint32_t v46 = 32;
LABEL_81:
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, v44, (uint8_t *)&v149, v46);
      }
    }

    *__error() = v31;
    uint64_t v30 = qword_100010410;
    uint64_t v36 = *(void *)(a1 + 8240);
LABEL_83:
    qword_100010410 = v30 | 2;
    qword_100012440 = v36;
    uint64_t v42 = set_config_field_modifier( (char *)&qword_100010410 + &loc_100002038,  a1 + &loc_100002038);
    goto LABEL_84;
  }

LABEL_44:
  uint64_t v25 = qword_100010410;
  if ((qword_100010410 & 2) != 0)
  {
    int v26 = *__error();
    id v27 = sub_100002490();
    id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      id v29 = &byte_100012448;
      if (!byte_100012448)
      {
        if (dword_100010418 == 3)
        {
          id v29 = "<profile>";
        }

        else if (dword_100010418 == 1)
        {
          id v29 = "<tasking>";
        }

        else
        {
          id v29 = "<unknown>";
        }
      }

      uint64_t v40 = qword_100012440;
      uint64_t v41 = ((uint64_t (*)(void))tailspin_buffer_size_get_default)();
      int v149 = 136446722;
      v150 = v29;
      __int16 v151 = 2048;
      *(void *)v152 = v40;
      *(_WORD *)&v152[8] = 2048;
      *(void *)&v152[10] = v41;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Reverted previous request by %{public}s to change tailspin buffer size to %zu MB to default %zu MB",  (uint8_t *)&v149,  0x20u);
    }

    v18 = __error();
    int *v18 = v26;
    uint64_t v25 = qword_100010410;
  }

  qword_100010410 = v25 & 0xFFFFFFFFFFFFFFFDLL;
  qword_100012440 = tailspin_buffer_size_get_default(v18);
  uint64_t v42 = set_config_field_modifier((char *)&qword_100010410 + &loc_100002038, 0LL);
  if (a1)
  {
LABEL_84:
    if ((*(_BYTE *)a1 & 1) == 0) {
      goto LABEL_85;
    }
    uint64_t v57 = qword_100010410;
    if ((qword_100010410 & 1) != 0)
    {
      if (!memcmp(&unk_10001041C, (const void *)(a1 + 12), 0x2000uLL)
        && !strncmp(&byte_10001241C, (const char *)(a1 + 8204), 0x20uLL))
      {
        goto LABEL_124;
      }

      v58 = (void *)trace_print_filter(a1 + 12);
      v59 = (void *)trace_print_filter(&unk_10001041C);
      int v60 = *__error();
      id v65 = sub_100002490();
      v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        v66 = v2;
        if (!*v2)
        {
          int v67 = *(_DWORD *)(a1 + 8);
          if (v67 == 3)
          {
            v66 = "<profile>";
          }

          else if (v67 == 1)
          {
            v66 = "<tasking>";
          }

          else
          {
            v66 = "<unknown>";
          }
        }

        v73 = &byte_10001241C;
        if (!byte_10001241C)
        {
          if (dword_100010418 == 3)
          {
            v73 = "<profile>";
          }

          else if (dword_100010418 == 1)
          {
            v73 = "<tasking>";
          }

          else
          {
            v73 = "<unknown>";
          }
        }

        int v149 = 136446978;
        v150 = (void *)v66;
        __int16 v151 = 2082;
        *(void *)v152 = v58;
        *(_WORD *)&v152[8] = 2082;
        *(void *)&v152[10] = v73;
        *(_WORD *)&v152[18] = 2082;
        uint64_t v153 = (uint64_t)v59;
        v70 = "%{public}s requested to change tailspin typefilter to %{public}s, overriding previous request from %{publi"
              "c}s to change tailspin typefilter to %{public}s";
        v71 = v62;
        uint32_t v72 = 42;
        goto LABEL_122;
      }
    }

    else
    {
      v58 = (void *)trace_print_filter(&unk_10001041C);
      v59 = (void *)trace_print_filter(a1 + 12);
      int v60 = *__error();
      id v61 = sub_100002490();
      v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        v63 = v2;
        if (!*v2)
        {
          int v64 = *(_DWORD *)(a1 + 8);
          if (v64 == 3)
          {
            v63 = "<profile>";
          }

          else if (v64 == 1)
          {
            v63 = "<tasking>";
          }

          else
          {
            v63 = "<unknown>";
          }
        }

        int v149 = 136446722;
        v150 = (void *)v63;
        __int16 v151 = 2082;
        *(void *)v152 = v59;
        *(_WORD *)&v152[8] = 2082;
        *(void *)&v152[10] = v58;
        v70 = "%{public}s requested to change tailspin typefilter to %{public}s from default %{public}s";
        v71 = v62;
        uint32_t v72 = 32;
LABEL_122:
        _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, v70, (uint8_t *)&v149, v72);
      }
    }

    *__error() = v60;
    free(v59);
    free(v58);
    uint64_t v57 = qword_100010410;
LABEL_124:
    qword_100010410 = v57 | 1;
    memcpy(&unk_10001041C, (const void *)(a1 + 12), 0x2000uLL);
    v69 = (int *)set_config_field_modifier( (char *)&qword_100010410 + &loc_10000200C,  a1 + &loc_10000200C);
    goto LABEL_125;
  }

LABEL_85:
  uint64_t v49 = qword_100010410;
  if ((qword_100010410 & 1) != 0)
  {
    v50 = (void *)trace_print_filter(&unk_10001041C);
    uint64_t v51 = ((uint64_t (*)(void))tailspin_kdbg_filter_get_default)();
    v52 = (void *)trace_print_filter(v51);
    int v53 = *__error();
    id v54 = sub_100002490();
    v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      v56 = &byte_10001241C;
      if (!byte_10001241C)
      {
        if (dword_100010418 == 3)
        {
          v56 = "<profile>";
        }

        else if (dword_100010418 == 1)
        {
          v56 = "<tasking>";
        }

        else
        {
          v56 = "<unknown>";
        }
      }

      int v149 = 136446722;
      v150 = v56;
      __int16 v151 = 2082;
      *(void *)v152 = v50;
      *(_WORD *)&v152[8] = 2082;
      *(void *)&v152[10] = v52;
      _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "Reverted previous request by %{public}s to change tailspin typefilter to %{public}s to default %{public}s",  (uint8_t *)&v149,  0x20u);
    }

    *__error() = v53;
    free(v50);
    free(v52);
    uint64_t v49 = qword_100010410;
  }

  qword_100010410 = v49 & 0xFFFFFFFFFFFFFFFELL;
  v68 = (const void *)tailspin_kdbg_filter_get_default(v42);
  memcpy(&unk_10001041C, v68, 0x2000uLL);
  v69 = (int *)set_config_field_modifier((char *)&qword_100010410 + &loc_10000200C, 0LL);
  if (a1)
  {
LABEL_125:
    if ((*(_BYTE *)a1 & 8) == 0) {
      goto LABEL_126;
    }
    uint64_t v79 = qword_100010410;
    if ((qword_100010410 & 8) != 0)
    {
      uint64_t v85 = qword_100012468;
      int v80 = *__error();
      id v86 = sub_100002490();
      v82 = (os_log_s *)objc_claimAutoreleasedReturnValue(v86);
      if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
      {
        v87 = v2 + 84;
        if (!v2[84])
        {
          int v88 = *(_DWORD *)(a1 + 8);
          if (v88 == 3)
          {
            v87 = "<profile>";
          }

          else if (v88 == 1)
          {
            v87 = "<tasking>";
          }

          else
          {
            v87 = "<unknown>";
          }
        }

        uint64_t v96 = *(void *)(a1 + 8280);
        v97 = &byte_100012470;
        if (!byte_100012470)
        {
          if (dword_100010418 == 3)
          {
            v97 = "<profile>";
          }

          else if (dword_100010418 == 1)
          {
            v97 = "<tasking>";
          }

          else
          {
            v97 = "<unknown>";
          }
        }

        int v149 = 136446978;
        v150 = (void *)v87;
        __int16 v151 = 2048;
        *(void *)v152 = v96;
        *(_WORD *)&v152[8] = 2082;
        *(void *)&v152[10] = v97;
        *(_WORD *)&v152[18] = 2048;
        uint64_t v153 = qword_100012468;
        v93 = "%{public}s requested to change tailspin full system sampling period to %llu ns, overriding previous reques"
              "t from %{public}s to change tailspin full system sampling period to %llu ns";
        v94 = v82;
        uint32_t v95 = 42;
        goto LABEL_163;
      }
    }

    else
    {
      int v80 = *__error();
      id v81 = sub_100002490();
      v82 = (os_log_s *)objc_claimAutoreleasedReturnValue(v81);
      if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
      {
        v83 = v2 + 84;
        if (!v2[84])
        {
          int v84 = *(_DWORD *)(a1 + 8);
          if (v84 == 3)
          {
            v83 = "<profile>";
          }

          else if (v84 == 1)
          {
            v83 = "<tasking>";
          }

          else
          {
            v83 = "<unknown>";
          }
        }

        uint64_t v92 = *(void *)(a1 + 8280);
        int v149 = 136446722;
        v150 = (void *)v83;
        __int16 v151 = 2048;
        *(void *)v152 = v92;
        *(_WORD *)&v152[8] = 2048;
        *(void *)&v152[10] = qword_100012468;
        v93 = "%{public}s requested to change tailspin full system sampling period to %llu ns from default %llu ns";
        v94 = v82;
        uint32_t v95 = 32;
LABEL_163:
        _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEFAULT, v93, (uint8_t *)&v149, v95);
      }
    }

    *__error() = v80;
    uint64_t v79 = qword_100010410;
    uint64_t v85 = *(void *)(a1 + 8280);
LABEL_165:
    qword_100010410 = v79 | 8;
    qword_100012468 = v85;
    v91 = (int *)set_config_field_modifier( (char *)&qword_100010410 + &loc_100002060,  a1 + &loc_100002060);
    goto LABEL_166;
  }

LABEL_126:
  uint64_t v74 = qword_100010410;
  if ((qword_100010410 & 8) != 0)
  {
    int v75 = *__error();
    id v76 = sub_100002490();
    v77 = (os_log_s *)objc_claimAutoreleasedReturnValue(v76);
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
    {
      v78 = &byte_100012470;
      if (!byte_100012470)
      {
        if (dword_100010418 == 3)
        {
          v78 = "<profile>";
        }

        else if (dword_100010418 == 1)
        {
          v78 = "<tasking>";
        }

        else
        {
          v78 = "<unknown>";
        }
      }

      uint64_t v89 = qword_100012468;
      uint64_t v90 = ((uint64_t (*)(void))tailspin_full_sampling_period_get_default)();
      int v149 = 136446722;
      v150 = v78;
      __int16 v151 = 2048;
      *(void *)v152 = v89;
      *(_WORD *)&v152[8] = 2048;
      *(void *)&v152[10] = v90;
      _os_log_impl( (void *)&_mh_execute_header,  v77,  OS_LOG_TYPE_DEFAULT,  "Reverted previous request by %{public}s to change tailspin full system sampling period to %llu ns to default %llu ns",  (uint8_t *)&v149,  0x20u);
    }

    v69 = __error();
    int *v69 = v75;
    uint64_t v74 = qword_100010410;
  }

  qword_100010410 = v74 & 0xFFFFFFFFFFFFFFF7LL;
  qword_100012468 = tailspin_full_sampling_period_get_default(v69);
  v91 = (int *)set_config_field_modifier((char *)&qword_100010410 + &loc_100002060, 0LL);
  if (a1)
  {
LABEL_166:
    if ((*(_BYTE *)a1 & 0x10) == 0) {
      goto LABEL_167;
    }
    uint64_t v103 = qword_100010410;
    if ((qword_100010410 & 0x10) != 0)
    {
      uint64_t v109 = qword_100012490;
      int v104 = *__error();
      id v110 = sub_100002490();
      v106 = (os_log_s *)objc_claimAutoreleasedReturnValue(v110);
      if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
      {
        v111 = v2 + 124;
        if (!v2[124])
        {
          int v112 = *(_DWORD *)(a1 + 8);
          if (v112 == 3)
          {
            v111 = "<profile>";
          }

          else if (v112 == 1)
          {
            v111 = "<tasking>";
          }

          else
          {
            v111 = "<unknown>";
          }
        }

        uint64_t v120 = *(void *)(a1 + 8320);
        v121 = &byte_100012498;
        if (!byte_100012498)
        {
          if (dword_100010418 == 3)
          {
            v121 = "<profile>";
          }

          else if (dword_100010418 == 1)
          {
            v121 = "<tasking>";
          }

          else
          {
            v121 = "<unknown>";
          }
        }

        int v149 = 136446978;
        v150 = (void *)v111;
        __int16 v151 = 2048;
        *(void *)v152 = v120;
        *(_WORD *)&v152[8] = 2082;
        *(void *)&v152[10] = v121;
        *(_WORD *)&v152[18] = 2048;
        uint64_t v153 = qword_100012490;
        v117 = "%{public}s requested to change tailspin oncore sampling period to %llu ns, overriding previous request fr"
               "om %{public}s to change tailspin oncore sampling period to %llu ns";
        v118 = v106;
        uint32_t v119 = 42;
        goto LABEL_204;
      }
    }

    else
    {
      int v104 = *__error();
      id v105 = sub_100002490();
      v106 = (os_log_s *)objc_claimAutoreleasedReturnValue(v105);
      if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
      {
        v107 = v2 + 124;
        if (!v2[124])
        {
          int v108 = *(_DWORD *)(a1 + 8);
          if (v108 == 3)
          {
            v107 = "<profile>";
          }

          else if (v108 == 1)
          {
            v107 = "<tasking>";
          }

          else
          {
            v107 = "<unknown>";
          }
        }

        uint64_t v116 = *(void *)(a1 + 8320);
        int v149 = 136446722;
        v150 = (void *)v107;
        __int16 v151 = 2048;
        *(void *)v152 = v116;
        *(_WORD *)&v152[8] = 2048;
        *(void *)&v152[10] = qword_100012490;
        v117 = "%{public}s requested to change tailspin oncore sampling period to %llu ns from default %llu ns";
        v118 = v106;
        uint32_t v119 = 32;
LABEL_204:
        _os_log_impl((void *)&_mh_execute_header, v118, OS_LOG_TYPE_DEFAULT, v117, (uint8_t *)&v149, v119);
      }
    }

    *__error() = v104;
    uint64_t v103 = qword_100010410;
    uint64_t v109 = *(void *)(a1 + 8320);
LABEL_206:
    qword_100010410 = v103 | 0x10;
    qword_100012490 = v109;
    v115 = (int *)set_config_field_modifier( (char *)&qword_100010410 + &loc_100002084 + 4,  a1 + &loc_100002084 + 4);
    goto LABEL_207;
  }

LABEL_167:
  uint64_t v98 = qword_100010410;
  if ((qword_100010410 & 0x10) != 0)
  {
    int v99 = *__error();
    id v100 = sub_100002490();
    v101 = (os_log_s *)objc_claimAutoreleasedReturnValue(v100);
    if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
    {
      v102 = &byte_100012498;
      if (!byte_100012498)
      {
        if (dword_100010418 == 3)
        {
          v102 = "<profile>";
        }

        else if (dword_100010418 == 1)
        {
          v102 = "<tasking>";
        }

        else
        {
          v102 = "<unknown>";
        }
      }

      uint64_t v113 = qword_100012490;
      uint64_t v114 = ((uint64_t (*)(void))tailspin_oncore_sampling_period_get_default)();
      int v149 = 136446722;
      v150 = v102;
      __int16 v151 = 2048;
      *(void *)v152 = v113;
      *(_WORD *)&v152[8] = 2048;
      *(void *)&v152[10] = v114;
      _os_log_impl( (void *)&_mh_execute_header,  v101,  OS_LOG_TYPE_DEFAULT,  "Reverted previous request by %{public}s to change tailspin oncore sampling period to %llu ns to default %llu ns",  (uint8_t *)&v149,  0x20u);
    }

    v91 = __error();
    int *v91 = v99;
    uint64_t v98 = qword_100010410;
  }

  qword_100010410 = v98 & 0xFFFFFFFFFFFFFFEFLL;
  qword_100012490 = tailspin_oncore_sampling_period_get_default(v91);
  v115 = (int *)set_config_field_modifier((char *)&qword_100010410 + &loc_100002084 + 4, 0LL);
  if (a1)
  {
LABEL_207:
    if ((*(_BYTE *)a1 & 0x20) == 0) {
      goto LABEL_208;
    }
    uint64_t v127 = qword_100010410;
    if ((qword_100010410 & 0x20) != 0)
    {
      int v134 = dword_1000124DC;
      int v128 = *__error();
      id v135 = sub_100002490();
      v130 = (os_log_s *)objc_claimAutoreleasedReturnValue(v135);
      if (os_log_type_enabled(v130, OS_LOG_TYPE_DEFAULT))
      {
        int v137 = *((unsigned __int8 *)v2 + 196);
        v136 = v2 + 196;
        if (!v137)
        {
          int v138 = *(_DWORD *)(a1 + 8);
          if (v138 == 3)
          {
            v136 = "<profile>";
          }

          else if (v138 == 1)
          {
            v136 = "<tasking>";
          }

          else
          {
            v136 = "<unknown>";
          }
        }

        int v147 = *(_DWORD *)(a1 + 8396);
        v148 = &byte_1000124E0;
        if (!byte_1000124E0)
        {
          if (dword_100010418 == 3)
          {
            v148 = "<profile>";
          }

          else if (dword_100010418 == 1)
          {
            v148 = "<tasking>";
          }

          else
          {
            v148 = "<unknown>";
          }
        }

        int v149 = 136446978;
        v150 = (void *)v136;
        __int16 v151 = 1024;
        *(_DWORD *)v152 = v147;
        *(_WORD *)&v152[4] = 2082;
        *(void *)&v152[6] = v148;
        *(_WORD *)&v152[14] = 1024;
        *(_DWORD *)&v152[16] = dword_1000124DC;
        v144 = "%{public}s requested to change tailspin sampling modifers to 0x%x, overriding previous request from %{pub"
               "lic}s to change tailspin sampling modifiers to 0x%x";
        v145 = v130;
        uint32_t v146 = 34;
        goto LABEL_245;
      }
    }

    else
    {
      int v128 = *__error();
      id v129 = sub_100002490();
      v130 = (os_log_s *)objc_claimAutoreleasedReturnValue(v129);
      if (os_log_type_enabled(v130, OS_LOG_TYPE_DEFAULT))
      {
        int v132 = *((unsigned __int8 *)v2 + 196);
        v131 = v2 + 196;
        if (!v132)
        {
          int v133 = *(_DWORD *)(a1 + 8);
          if (v133 == 3)
          {
            v131 = "<profile>";
          }

          else if (v133 == 1)
          {
            v131 = "<tasking>";
          }

          else
          {
            v131 = "<unknown>";
          }
        }

        int v143 = *(_DWORD *)(a1 + 8396);
        int v149 = 136446722;
        v150 = (void *)v131;
        __int16 v151 = 1024;
        *(_DWORD *)v152 = v143;
        *(_WORD *)&v152[4] = 1024;
        *(_DWORD *)&v152[6] = dword_1000124DC;
        v144 = "%{public}s requested to change tailspin sampling modifiers to %x from default %x";
        v145 = v130;
        uint32_t v146 = 24;
LABEL_245:
        _os_log_impl((void *)&_mh_execute_header, v145, OS_LOG_TYPE_DEFAULT, v144, (uint8_t *)&v149, v146);
      }
    }

    *__error() = v128;
    uint64_t v127 = qword_100010410;
    int v134 = *(_DWORD *)(a1 + 8396);
LABEL_247:
    qword_100010410 = v127 | 0x20;
    dword_1000124DC = v134;
    uint64_t result = set_config_field_modifier( (char *)&qword_100010410 + &locret_1000020D0,  a1 + &locret_1000020D0);
LABEL_248:
    int v142 = *(_DWORD *)(a1 + 8);
    goto LABEL_249;
  }

LABEL_208:
  uint64_t v122 = qword_100010410;
  if ((qword_100010410 & 0x20) != 0)
  {
    int v123 = *__error();
    id v124 = sub_100002490();
    v125 = (os_log_s *)objc_claimAutoreleasedReturnValue(v124);
    if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
    {
      v126 = &byte_1000124E0;
      if (!byte_1000124E0)
      {
        if (dword_100010418 == 3)
        {
          v126 = "<profile>";
        }

        else if (dword_100010418 == 1)
        {
          v126 = "<tasking>";
        }

        else
        {
          v126 = "<unknown>";
        }
      }

      int v139 = dword_1000124DC;
      int v140 = ((uint64_t (*)(void))tailspin_sampling_options_get_default)();
      int v149 = 136446722;
      v150 = v126;
      __int16 v151 = 1024;
      *(_DWORD *)v152 = v139;
      *(_WORD *)&v152[4] = 1024;
      *(_DWORD *)&v152[6] = v140;
      _os_log_impl( (void *)&_mh_execute_header,  v125,  OS_LOG_TYPE_DEFAULT,  "Reverted previous request by %{public}s to change tailspin sampling options to %x to default %x",  (uint8_t *)&v149,  0x18u);
    }

    v115 = __error();
    int *v115 = v123;
    uint64_t v122 = qword_100010410;
  }

  qword_100010410 = v122 & 0xFFFFFFFFFFFFFFDFLL;
  dword_1000124DC = tailspin_sampling_options_get_default(v115);
  uint64_t result = set_config_field_modifier((char *)&qword_100010410 + &locret_1000020D0, 0LL);
  if (a1) {
    goto LABEL_248;
  }
  int v142 = 0;
LABEL_249:
  dword_100010418 = v142;
  return result;
}

void sub_100003E64()
{
  uint64_t ondisk_config = tailspin_make_ondisk_config(&qword_100010410, 0LL);
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(ondisk_config);
  uint64_t v2 = v1;
  if (v1)
  {
    if (([v1 writeToFile:@"/var/db/tailspin_config.plist" atomically:1] & 1) == 0)
    {
      int v3 = *__error();
      id v4 = sub_100002490();
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_100007B1C();
      }

      *__error() = v3;
    }
  }

  else
  {
    unlink("/var/db/tailspin_config.plist");
  }
}

uint64_t sub_100003F08()
{
  int v0 = *__error();
  id v1 = sub_100002490();
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100007BBC();
  }

  *__error() = v0;
  uint64_t v3 = sub_100003FA8();
  if ((v3 & 1) != 0)
  {
    sub_100004284(v3);
    return 0LL;
  }

  else
  {
    int v5 = *__error();
    id v6 = sub_100002490();
    int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100007B90();
    }

    *__error() = v5;
    return 5LL;
  }

uint64_t sub_100003FA8()
{
  if (byte_1000124B8)
  {
    uint64_t v0 = ktrace_session_create();
    ktrace_session_set_event_names_enabled(v0, 0LL);
    ktrace_set_buffer_size(v0, qword_100012440);
    memcpy(__dst, &unk_10001041C, 0x2000uLL);
    int v1 = dword_1000124DC;
    if (qword_100012468) {
      BOOL v2 = 0;
    }
    else {
      BOOL v2 = qword_100012490 == 0;
    }
    if (!v2 || dword_1000124DC != 0)
    {
      for (unsigned int i = 0; i != 256; ++i)
        *((_BYTE *)__dst + ((i >> 3) | 0x4A0LL)) |= 1 << (i & 7);
      if (v1)
      {
        if (tailspin_sampling_option_get(&qword_100010410, 2LL))
        {
          HIBYTE(__dst[16]) |= 0x10u;
          HIBYTE(__dst[64]) |= 0x10u;
        }
      }
    }

    int v5 = ktrace_configure(v0);
    ktrace_session_free(v0);
    BOOL v6 = v5 == 0;
    int v7 = *__error();
    id v8 = sub_100002490();
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    id v10 = v9;
    if (v5)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100007C6C();
      }

      *__error() = v7;
    }

    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Successfully enacted kdbg config", v18, 2u);
      }

      *__error() = v7;
      uint64_t v16 = mach_absolute_time();
      sub_100004804(v16, "KDBG_STATE");
    }
  }

  else
  {
    int v11 = ktrace_reset_existing();
    int v12 = *__error();
    id v13 = sub_100002490();
    char v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    id v15 = v14;
    if (v11)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100007BF4(v15);
      }

      BOOL v6 = 0LL;
      *__error() = v12;
    }

    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        __dst[0] = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "Successfully reset kdbg config",  (uint8_t *)__dst,  2u);
      }

      *__error() = v12;
      return 1LL;
    }
  }

  return v6;
}

uint64_t sub_100004284(uint64_t a1)
{
  if (byte_1000124B8) {
    uint64_t v1 = qword_100012468;
  }
  else {
    uint64_t v1 = 0LL;
  }
  if (byte_1000124B8) {
    uint64_t v2 = qword_100012490;
  }
  else {
    uint64_t v2 = 0LL;
  }
  if (byte_1000124B8) {
    int v3 = dword_1000124DC;
  }
  else {
    int v3 = 0;
  }
  if (kperf_reset(a1))
  {
    uint64_t v4 = 724LL;
    goto LABEL_33;
  }

  if (v1)
  {
    qword_100012528 = 0x200000000LL;
    uint64_t v5 = 1LL;
    uint64_t v6 = 2LL;
    if (!v2) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }

  uint64_t v5 = 0LL;
  uint64_t v6 = 1LL;
  if (v2)
  {
LABEL_14:
    uint64_t v6 = (v6 + 1);
    dword_100012534 = v5;
    dword_100012538 = v6;
    uint64_t v5 = (v5 + 1);
  }

LABEL_15:
  if (v3)
  {
    uint64_t v6 = (v6 + 1);
    dword_100012544 = v6;
  }

  if (kperf_action_count_get(&v22))
  {
    uint64_t v4 = 756LL;
    goto LABEL_33;
  }

  if (v22 < v6 && kperf_action_count_set(v6))
  {
    uint64_t v4 = 760LL;
    goto LABEL_33;
  }

  if (kperf_timer_count_get(&v21))
  {
    uint64_t v4 = 765LL;
    goto LABEL_33;
  }

  if (v21 < v5 && kperf_timer_count_set(v5))
  {
    uint64_t v4 = 768LL;
    goto LABEL_33;
  }

  if (kperf_lazy_cpu_action_set(1LL))
  {
    uint64_t v4 = 773LL;
    goto LABEL_33;
  }

  uint64_t v7 = kperf_ns_to_ticks(60000000000LL);
  if (kperf_lazy_cpu_time_threshold_set(v7))
  {
    uint64_t v4 = 776LL;
    goto LABEL_33;
  }

  if (v1)
  {
    if (kperf_action_samplers_set(HIDWORD(qword_100012528), dword_100012530))
    {
      uint64_t v4 = 781LL;
      goto LABEL_33;
    }

    if (kperf_timer_action_set(qword_100012528, HIDWORD(qword_100012528)))
    {
      uint64_t v4 = 784LL;
      goto LABEL_33;
    }

    uint64_t v13 = qword_100012528;
    uint64_t v14 = kperf_ns_to_ticks(v1);
    if (kperf_timer_period_set(v13, v14))
    {
      uint64_t v4 = 787LL;
      goto LABEL_33;
    }

    int v20 = 1;
    if (sysctlbyname("kperf.lightweight_pet", 0LL, 0LL, &v20, 4uLL))
    {
      uint64_t v4 = 790LL;
      goto LABEL_33;
    }

    if (kperf_timer_pet_set(qword_100012528))
    {
      uint64_t v4 = 793LL;
      goto LABEL_33;
    }
  }

  if (v2)
  {
    if (kperf_action_samplers_set(dword_100012538, dword_10001253C))
    {
      uint64_t v4 = 799LL;
      goto LABEL_33;
    }

    if (kperf_timer_action_set(dword_100012534, dword_100012538))
    {
      uint64_t v4 = 802LL;
      goto LABEL_33;
    }

    uint64_t v15 = dword_100012534;
    uint64_t v16 = kperf_ns_to_ticks(v2);
    if (kperf_timer_period_set(v15, v16))
    {
      uint64_t v4 = 805LL;
      goto LABEL_33;
    }
  }

  if (!v3) {
    goto LABEL_78;
  }
  uint64_t v17 = kperf_kdebug_filter_create();
  uint64_t v18 = v17;
  if ((v3 & 1) == 0)
  {
    uint64_t v19 = 0LL;
    if ((v3 & 2) == 0) {
      goto LABEL_58;
    }
LABEL_66:
    if (kperf_kdebug_filter_add_class_subclass_fn(v18, 17563650LL))
    {
      uint64_t v4 = 826LL;
      goto LABEL_33;
    }

    if (kperf_kdebug_filter_add_class_subclass_fn(v18, 67895298LL))
    {
      uint64_t v4 = 828LL;
      goto LABEL_33;
    }

    uint64_t v19 = v19 | 8;
    if ((v3 & 4) != 0) {
      goto LABEL_59;
    }
    goto LABEL_72;
  }

  if (kperf_kdebug_filter_add_debugid(v17, 20971520LL))
  {
    uint64_t v4 = 818LL;
    goto LABEL_33;
  }

  if (kperf_kdebug_filter_add_debugid(v18, 20971528LL))
  {
    uint64_t v4 = 820LL;
    goto LABEL_33;
  }

  uint64_t v19 = 16396LL;
  if ((v3 & 2) != 0) {
    goto LABEL_66;
  }
LABEL_58:
  if ((v3 & 4) != 0)
  {
LABEL_59:
    if (kperf_kdebug_filter_add_class_subclass_fn(v18, 19922946LL))
    {
      uint64_t v4 = 834LL;
      goto LABEL_33;
    }

    uint64_t v19 = v19 | 8;
  }

LABEL_72:
  if (kperf_action_samplers_set(dword_100012544, v19))
  {
    uint64_t v4 = 838LL;
    goto LABEL_33;
  }

  if (kperf_kdebug_filter_set(v18))
  {
    uint64_t v4 = 841LL;
    goto LABEL_33;
  }

  if (kperf_kdebug_action_set(dword_100012544))
  {
    uint64_t v4 = 844LL;
    goto LABEL_33;
  }

LABEL_78:
  uint64_t result = kperf_sample_on();
  if (!(_DWORD)result) {
    return result;
  }
  uint64_t v4 = 848LL;
LABEL_33:
  int v8 = *__error();
  id v9 = sub_100002490();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_100007CE4(v4, v10);
  }

  int v11 = __error();
  int *v11 = v8;
  return kperf_reset(v11);
}

void start()
{
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  int v15 = 0;
  _os_crash_callback = sub_10000490C;
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.tailspind.ipc_queue", 0LL);
  uint64_t v1 = (void *)qword_1000129D8;
  qword_1000129D8 = (uint64_t)v0;

  if (!qword_1000129D8)
  {
    uint64_t v8 = _os_assert_log(0LL);
    _os_crash(v8);
    __break(1u);
    goto LABEL_8;
  }

  dispatch_queue_t v2 = dispatch_queue_create("com.apple.tailspind.timeout_queue", 0LL);
  int v3 = (void *)qword_1000129E0;
  qword_1000129E0 = (uint64_t)v2;

  if (!qword_1000129E0)
  {
LABEL_8:
    uint64_t v9 = _os_assert_log(0LL);
    _os_crash(v9);
    __break(1u);
    goto LABEL_9;
  }

  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.tailspind", 0LL, 1uLL);
  uint64_t v5 = (void *)qword_1000129D0;
  qword_1000129D0 = (uint64_t)mach_service;

  if (qword_1000129D0)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100004A38;
    block[3] = &unk_10000C6B8;
    block[4] = &v12;
    dispatch_sync((dispatch_queue_t)qword_1000129D8, block);
    if (!*((_DWORD *)v13 + 6))
    {
      xpc_connection_set_event_handler((xpc_connection_t)qword_1000129D0, &stru_10000C6F8);
      xpc_connection_resume((xpc_connection_t)qword_1000129D0);
      dispatch_source_t v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, 0LL);
      uint64_t v7 = (void *)qword_1000129E8;
      qword_1000129E8 = (uint64_t)v6;

      dispatch_source_set_event_handler((dispatch_source_t)qword_1000129E8, &stru_10000C740);
      dispatch_resume((dispatch_object_t)qword_1000129E8);
      dispatch_main();
    }

    xpc_connection_set_event_handler((xpc_connection_t)qword_1000129D0, &stru_10000C6D8);
    xpc_connection_resume((xpc_connection_t)qword_1000129D0);
    dispatch_main();
  }

LABEL_9:
  uint64_t v10 = _os_assert_log(0LL);
  _os_crash(v10);
  __break(1u);
}

void sub_1000047E0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

char *sub_100004804(uint64_t a1, const char *a2)
{
  int v4 = *__error();
  id v5 = sub_100002490();
  dispatch_source_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315906;
    uint64_t v9 = a2;
    __int16 v10 = 2048;
    uint64_t v11 = a1;
    __int16 v12 = 2080;
    uint64_t v13 = asc_100012550;
    __int16 v14 = 2048;
    uint64_t v15 = qword_100012548;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Updating trace buffer start info: %s at %llu (was %s at %llu)",  (uint8_t *)&v8,  0x2Au);
  }

  *__error() = v4;
  qword_100012548 = a1;
  return strncpy(asc_100012550, a2, 0x20uLL);
}

uint64_t sub_10000490C(uint64_t a1)
{
  int v2 = *__error();
  id v3 = sub_100002490();
  int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v10[0] = 136315138;
    *(void *)&v10[1] = a1;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "Cleaning up kernel state before exiting because: %s",  (uint8_t *)v10,  0xCu);
  }

  *__error() = v2;
  v10[2] = 7;
  *(void *)__int16 v10 = 0x1800000001LL;
  if (sysctl(v10, 3u, 0LL, 0LL, 0LL, 0LL) < 0)
  {
    int v5 = *__error();
    id v6 = sub_100002490();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100007D60(v7);
    }

    *__error() = v5;
  }

  uint64_t v8 = kperf_sample_off();
  return kperf_reset(v8);
}

void sub_100004A38(uint64_t a1)
{
  tailspin_uint64_t ondisk_config = get_tailspin_ondisk_config();
  sub_100002B14(tailspin_ondisk_config);
  if (tailspin_ondisk_config) {
    tailspin_config_free(tailspin_ondisk_config);
  }
  if (dword_1000129F8) {
    goto LABEL_4;
  }
  if (qword_1000129F0) {
    sub_100007CD0();
  }
  if (task_get_special_port(mach_task_self_, 4, &special_port))
  {
    int v4 = *__error();
    id v5 = sub_100002490();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100007EF8();
    }
LABEL_17:

    *__error() = v4;
    int v3 = -1;
    goto LABEL_18;
  }

  if (bootstrap_check_in(special_port, "com.apple.tailspind.ktrace_background", (mach_port_t *)&dword_1000129F8))
  {
    int v4 = *__error();
    id v7 = sub_100002490();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100007E94();
    }
    goto LABEL_17;
  }

  int v16 = 1;
  int v8 = sysctlbyname("ktrace.init_background", 0LL, 0LL, &v16, 4uLL);
  if (v8)
  {
    int v9 = v8;
    int v10 = *__error();
    id v11 = sub_100002490();
    __int16 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100007E68();
    }

    *__error() = v10;
    int v4 = *__error();
    id v13 = sub_100002490();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100007DD8(v9, v6);
    }
    goto LABEL_17;
  }

  dispatch_source_t v14 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_mach_recv,  dword_1000129F8,  0LL,  (dispatch_queue_t)qword_1000129D8);
  uint64_t v15 = (void *)qword_1000129F0;
  qword_1000129F0 = (uint64_t)v14;

  dispatch_source_set_event_handler((dispatch_source_t)qword_1000129F0, &stru_10000C760);
  dispatch_resume((dispatch_object_t)qword_1000129F0);
LABEL_4:
  int v3 = 0;
LABEL_18:
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v3;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)qword_1000129D8, &stru_10000C690);
}

void sub_100004C54(id a1, OS_xpc_object *a2)
{
  int v2 = a2;
  string = xpc_dictionary_get_string(v2, "XPCEventName");
  int v10 = xpc_dictionary_get_string(v2, "Notification");
  if (!string) {
    goto LABEL_14;
  }
  if (!strcmp(string, "com.apple.tailspin.tasking_changed") && v10 && !strcmp(v10, "com.apple.da.tasking_changed"))
  {
    int v11 = *__error();
    id v16 = sub_100002490();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
      goto LABEL_11;
    }
    __int16 v18 = 0;
    dispatch_source_t v14 = "Resolving tasking change";
    uint64_t v15 = (uint8_t *)&v18;
    goto LABEL_10;
  }

  if (strcmp(string, "com.apple.tailspin.profile_changed")
    || !v10
    || strcmp(v10, "com.apple.ManagedConfiguration.profileListChanged"))
  {
LABEL_14:
    sub_100007F5C((char)string, (uint64_t)v10, v4, v5, v6, v7, v8, v9);
  }

  int v11 = *__error();
  id v12 = sub_100002490();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    __int16 v17 = 0;
    dispatch_source_t v14 = "Resolving profile change";
    uint64_t v15 = (uint8_t *)&v17;
LABEL_10:
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, v14, v15, 2u);
  }

LABEL_11:
  *__error() = v11;
  sub_100002A4C();
}

void sub_100004DA8(id a1, OS_xpc_object *a2)
{
  connection = a2;
  if (xpc_get_type(connection) == (xpc_type_t)&_xpc_type_connection)
  {
    xpc_connection_cancel(connection);
    int v2 = connection;
  }

  else
  {
    int v2 = connection;
    if (connection == (OS_xpc_object *)&_xpc_error_connection_invalid)
    {
      fwrite("tailspind is not intended to be run manually", 0x2CuLL, 1uLL, __stderrp);
      exit(1);
    }
  }
}

void sub_100004E24(id a1, OS_xpc_object *a2)
{
  int v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_connection)
  {
    int v3 = (char *)calloc(1uLL, 0x40uLL);
    uint64_t pid = xpc_connection_get_pid(v2);
    proc_name(pid, v3, 0x20u);
    int v5 = *__error();
    id v6 = sub_100002490();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    uint64_t v8 = v7;
    if ((pid - 1) <= 0xFFFFFFFD && os_signpost_enabled(v7))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v30 = v3;
      __int16 v31 = 1024;
      int v32 = pid;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v8,  OS_SIGNPOST_EVENT,  (int)pid,  "NewClientConnection",  "New connection for client %{public}s [%d]",  buf,  0x12u);
    }

    *__error() = v5;
    int responsible_pid_and_name = get_responsible_pid_and_name(pid, v3 + 32, 32LL);
    int v10 = (void *)xpc_connection_copy_entitlement_value(v2, "com.apple.tailspin.dump-output");
    int v11 = v10;
    BOOL v12 = v10 && xpc_get_type(v10) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v11);
    id v13 = (void *)xpc_connection_copy_entitlement_value(v2, "com.apple.tailspin.config-apply");

    BOOL v14 = v13 && xpc_get_type(v13) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v13);
    xpc_connection_set_context(v2, v3);
    xpc_connection_set_finalizer_f(v2, (xpc_finalizer_t)&_free);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100005118;
    handler[3] = &unk_10000C720;
    int v25 = responsible_pid_and_name;
    int v26 = pid;
    int v23 = v3 + 32;
    v24 = v3;
    BOOL v27 = v12;
    BOOL v28 = v14;
    unsigned int v22 = v2;
    uint64_t v15 = v2;
    xpc_connection_set_event_handler(v15, handler);
    xpc_connection_set_target_queue(v15, (dispatch_queue_t)qword_1000129D8);
    xpc_connection_resume(v15);
  }

  else
  {
    xpc_type_t type = xpc_get_type(v2);
    int v17 = *__error();
    id v18 = sub_100002490();
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (type == (xpc_type_t)&_xpc_type_error)
    {
      if (v20) {
        sub_100007F88(v2, v19);
      }

      *__error() = v17;
      _os_crash("XPC error object received in main handler");
      __break(1u);
    }

    if (v20) {
      sub_100008008(v2, v19);
    }

    *__error() = v17;
    _os_crash("unknown XPC object received in main handler");
    __break(1u);
  }

void sub_100005118(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_get_type(v3) != (xpc_type_t)&_xpc_type_dictionary)
  {
    xpc_type_t type = xpc_get_type(v3);
    int v5 = *(_DWORD *)(a1 + 60);
    int v6 = *(_DWORD *)(a1 + 56);
    int v7 = *__error();
    id v8 = sub_100002490();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    int v10 = v9;
    if (type != (xpc_type_t)&_xpc_type_error)
    {
      BOOL v11 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
      if (v6 == v5)
      {
        if (v11) {
          sub_100008380();
        }
      }

      else if (v11)
      {
        uint64_t v30 = *(void *)(a1 + 40);
        uint64_t v31 = *(void *)(a1 + 48);
        int v32 = *(_DWORD *)(a1 + 56);
        int v33 = *(_DWORD *)(a1 + 60);
        *(_DWORD *)buf = 136446978;
        *(void *)&uint8_t buf[4] = v30;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v32;
        *(_WORD *)&buf[18] = 2082;
        *(void *)&buf[20] = v31;
        *(_WORD *)&buf[28] = 1024;
        *(_DWORD *)&buf[30] = v33;
        _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "client %{public}s [%d] (via %{public}s [%d]) received unknown request type",  buf,  0x22u);
      }

      goto LABEL_24;
    }

    BOOL v24 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
    if (v6 == v5)
    {
      if (v24)
      {
        uint64_t v25 = *(void *)(a1 + 48);
        int v26 = *(_DWORD *)(a1 + 60);
        *(_DWORD *)buf = 136446722;
        *(void *)&uint8_t buf[4] = v25;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v26;
        *(_WORD *)&buf[18] = 2082;
        *(void *)&buf[20] = xpc_dictionary_get_string(v3, _xpc_error_key_description);
        BOOL v27 = "client %{public}s [%d] received error %{public}s";
        BOOL v28 = v10;
        uint32_t v29 = 28;
LABEL_90:
        _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, v27, buf, v29);
      }
    }

    else if (v24)
    {
      uint64_t v122 = *(void *)(a1 + 40);
      uint64_t v123 = *(void *)(a1 + 48);
      int v124 = *(_DWORD *)(a1 + 56);
      int v125 = *(_DWORD *)(a1 + 60);
      *(_DWORD *)buf = 136447234;
      *(void *)&uint8_t buf[4] = v122;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v124;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = v123;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = v125;
      *(_WORD *)&buf[34] = 2082;
      *(void *)&buf[36] = xpc_dictionary_get_string(v3, _xpc_error_key_description);
      BOOL v27 = "client %{public}s [%d] (via %{public}s [%d]) received error %{public}s";
      BOOL v28 = v10;
      uint32_t v29 = 44;
      goto LABEL_90;
    }

LABEL_24:
    *__error() = v7;
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
    goto LABEL_25;
  }

  int uint64 = xpc_dictionary_get_uint64(v3, "tailspin_request_type");
  if (uint64 < 0)
  {
    if (uint64 == -559035649)
    {
      int v59 = *__error();
      id v60 = sub_100002490();
      id v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "tailspin has been poked!", buf, 2u);
      }

      *__error() = v59;
    }

    else if (uint64 == -559035648)
    {
      int v34 = *__error();
      id v35 = sub_100002490();
      uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "tailspin has been asked to resolve ondisk, profile and tasking configs",  buf,  2u);
      }

      *__error() = v34;
      sub_100002A4C();
    }

    goto LABEL_25;
  }

  if (!uint64)
  {
    int v37 = *(_DWORD *)(a1 + 60);
    int v38 = *(_DWORD *)(a1 + 56);
    int v39 = *__error();
    id v40 = sub_100002490();
    uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    BOOL v42 = os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT);
    if (v38 == v37)
    {
      if (v42)
      {
        uint64_t v43 = *(void *)(a1 + 48);
        int v44 = *(_DWORD *)(a1 + 60);
        *(_DWORD *)buf = 136446466;
        *(void *)&uint8_t buf[4] = v43;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v44;
        v45 = "client %{public}s [%d] is setting tailspin config (TAILSPIN_APPLY_CONFIG)";
        uint32_t v46 = v41;
        uint32_t v47 = 18;
LABEL_51:
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, v45, buf, v47);
      }
    }

    else if (v42)
    {
      uint64_t v85 = *(void *)(a1 + 40);
      uint64_t v86 = *(void *)(a1 + 48);
      int v87 = *(_DWORD *)(a1 + 56);
      int v88 = *(_DWORD *)(a1 + 60);
      *(_DWORD *)buf = 136446978;
      *(void *)&uint8_t buf[4] = v85;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v87;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = v86;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = v88;
      v45 = "client %{public}s [%d] (via %{public}s [%d]) is setting tailspin config (TAILSPIN_APPLY_CONFIG)";
      uint32_t v46 = v41;
      uint32_t v47 = 34;
      goto LABEL_51;
    }

    *__error() = v39;
    if (*(_BYTE *)(a1 + 65))
    {
      id v68 = v3;
      *(void *)buf = 0LL;
      data = (int *)xpc_dictionary_get_data(v68, "tailspin_config", (size_t *)buf);
      if (*(void *)buf == 8472LL)
      {
        uint64_t v90 = data;
        int v91 = data[2];
        if ((v91 | 2) != 2) {
          sub_1000082D8(v91, v91 == 0);
        }
        switch(dword_100010418)
        {
          case 0:
            if (v91) {
              goto LABEL_97;
            }
            goto LABEL_101;
          case 1:
            if (v91) {
              goto LABEL_97;
            }
            int v126 = *__error();
            id v127 = sub_100002490();
            int v128 = (os_log_s *)objc_claimAutoreleasedReturnValue(v127);
            if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR)) {
              sub_100008354();
            }
            goto LABEL_106;
          case 2:
            if (!v91)
            {
              uint64_t tailspin_tasking_config = (const void *)get_tailspin_tasking_config();
              if (tailspin_tasking_config)
              {
                v130 = tailspin_tasking_config;
                memcpy(v90, tailspin_tasking_config, 0x2118uLL);
                tailspin_config_free(v130);
              }
            }

            goto LABEL_97;
          case 3:
            int v126 = *__error();
            id v136 = sub_100002490();
            int v128 = (os_log_s *)objc_claimAutoreleasedReturnValue(v136);
            if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR)) {
              sub_100008328();
            }
            goto LABEL_106;
          default:
LABEL_97:
            sub_100002B14((uint64_t)v90);
            uint64_t v131 = sub_100003FA8();
            if ((v131 & 1) != 0)
            {
              sub_100004284(v131);
              int v132 = *__error();
              id v133 = sub_100002490();
              int v134 = (os_log_s *)objc_claimAutoreleasedReturnValue(v133);
              if (os_log_type_enabled(v134, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)v198 = 0;
                _os_log_impl((void *)&_mh_execute_header, v134, OS_LOG_TYPE_INFO, "tailspin state enacted", v198, 2u);
              }

              *__error() = v132;
              sub_100003E64();
LABEL_101:
              BOOL v110 = 1;
            }

            else
            {
              int v126 = *__error();
              id v135 = sub_100002490();
              int v128 = (os_log_s *)objc_claimAutoreleasedReturnValue(v135);
              if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR)) {
                sub_1000082FC();
              }
LABEL_106:

              int v137 = __error();
              BOOL v110 = 0;
              *int v137 = v126;
            }

            break;
        }
      }

      else
      {
        BOOL v110 = 0;
      }

      sub_100006568(v68, v110);
      goto LABEL_108;
    }

    int v107 = *__error();
    id v108 = sub_100002490();
    uint64_t v109 = (os_log_s *)objc_claimAutoreleasedReturnValue(v108);
    if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR)) {
      sub_100008278();
    }

    *__error() = v107;
    sub_100006568(v3, 0);
    goto LABEL_25;
  }

  if (uint64 == 1)
  {
    int v48 = *(_DWORD *)(a1 + 56);
    int v49 = *(_DWORD *)(a1 + 60);
    int v50 = *__error();
    id v51 = sub_100002490();
    v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
    BOOL v53 = os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT);
    if (v48 == v49)
    {
      if (!v53) {
        goto LABEL_61;
      }
      uint64_t v54 = *(void *)(a1 + 48);
      int v55 = *(_DWORD *)(a1 + 60);
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = v54;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v55;
      v56 = "client %{public}s [%d] asked for tailspin config (TAILSPIN_GET_CONFIG)";
      uint64_t v57 = v52;
      uint32_t v58 = 18;
    }

    else
    {
      if (!v53) {
        goto LABEL_61;
      }
      uint64_t v92 = *(void *)(a1 + 40);
      uint64_t v93 = *(void *)(a1 + 48);
      int v94 = *(_DWORD *)(a1 + 56);
      int v95 = *(_DWORD *)(a1 + 60);
      *(_DWORD *)buf = 136446978;
      *(void *)&uint8_t buf[4] = v92;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v94;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = v93;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = v95;
      v56 = "client %{public}s [%d] (via %{public}s [%d]) asked for tailspin config (TAILSPIN_GET_CONFIG)";
      uint64_t v57 = v52;
      uint32_t v58 = 34;
    }

    _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, v56, buf, v58);
LABEL_61:

    *__error() = v50;
    id v68 = v3;
    uint64_t v96 = memcpy(buf, &qword_100010410, 0x2118uLL);
    if (is_apple_internal_setting(v96))
    {
      uint64_t current = ktrace_config_create_current();
      if (current)
      {
        uint64_t v98 = current;
        owner_uint64_t pid = ktrace_config_get_owner_pid();
        ktrace_config_destroy(v98);
      }
    }

    reply = (TSPSaveMeasurements *)xpc_dictionary_create_reply(v68);
    if (!reply) {
      sub_100007CD0();
    }
    v69 = reply;
    xpc_dictionary_set_BOOL(reply, "tailspin_succeeded", 1);
    xpc_dictionary_set_data(v69, "tailspin_config", buf, 0x2118uLL);
    xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(v68);
    v102 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
    if (!v102) {
      sub_100007CD0();
    }
    uint64_t v103 = v102;
    xpc_connection_send_message(v102, v69);

    goto LABEL_88;
  }

  int v13 = *(_DWORD *)(a1 + 60);
  int v14 = *(_DWORD *)(a1 + 56);
  int v15 = *__error();
  id v16 = sub_100002490();
  int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v14 == v13)
  {
    if (v18)
    {
      uint64_t v19 = *(void *)(a1 + 48);
      int v20 = *(_DWORD *)(a1 + 60);
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = v19;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v20;
      unsigned int v21 = "client %{public}s [%d] asked for tailspin output (TAILSPIN_DUMP_OUTPUT)";
      unsigned int v22 = v17;
      uint32_t v23 = 18;
LABEL_37:
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
    }
  }

  else if (v18)
  {
    uint64_t v62 = *(void *)(a1 + 40);
    uint64_t v63 = *(void *)(a1 + 48);
    int v64 = *(_DWORD *)(a1 + 56);
    int v65 = *(_DWORD *)(a1 + 60);
    *(_DWORD *)buf = 136446978;
    *(void *)&uint8_t buf[4] = v62;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v64;
    *(_WORD *)&buf[18] = 2082;
    *(void *)&buf[20] = v63;
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = v65;
    unsigned int v21 = "client %{public}s [%d] (via %{public}s [%d]) asked for tailspin output (TAILSPIN_DUMP_OUTPUT)";
    unsigned int v22 = v17;
    uint32_t v23 = 34;
    goto LABEL_37;
  }

  *__error() = v15;
  sub_100007324(*(void *)(a1 + 40));
  if (*(_BYTE *)(a1 + 64))
  {
    uint64_t v66 = *(void *)(a1 + 40);
    uint64_t v67 = *(unsigned int *)(a1 + 60);
    id v68 = v3;
    v69 = objc_alloc_init(&OBJC_CLASS___TSPSaveMeasurements);
    -[TSPSaveMeasurements startRecordingTimeForDumpRequestPhase:pid:]( v69,  "startRecordingTimeForDumpRequestPhase:pid:",  v66,  v67);
    if (byte_1000124B8)
    {
      uint64_t v70 = xpc_dictionary_dup_fd(v68, "tailspin_dump_fd");
      uint64_t v71 = v70;
      if ((v70 & 0x80000000) != 0)
      {
        int v114 = *__error();
        id v115 = sub_100002490();
        uint64_t v116 = (os_log_s *)objc_claimAutoreleasedReturnValue(v115);
        if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446722;
          *(void *)&uint8_t buf[4] = v66;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v67;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v71;
          _os_log_error_impl( (void *)&_mh_execute_header,  v116,  OS_LOG_TYPE_ERROR,  "Unable to save tailspin for %{public}s [%d]: bad file descriptor %d",  buf,  0x18u);
        }

        *__error() = v114;
        v117 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Bad file descriptor %d",  v71);
        -[TSPSaveMeasurements stopRecordingTimeForDumpRequestPhase:](v69, "stopRecordingTimeForDumpRequestPhase:", v117);

        v82 = v68;
        int v83 = 6;
      }

      else
      {
        if (fcntl(v70, 3) == 2)
        {
          off_t v72 = sub_100006670(v71);
          if (v72 >= 1)
          {
            off_t v73 = v72;
            *(void *)v198 = 0LL;
            int v196 = sub_1000066CC(v71, (uint64_t *)v198);
            int v74 = *__error();
            id v75 = sub_100002490();
            id v76 = (os_log_s *)objc_claimAutoreleasedReturnValue(v75);
            BOOL v77 = os_log_type_enabled(v76, OS_LOG_TYPE_FAULT);
            v78 = *(char **)v198;
            if (v77)
            {
              v172 = "<unknown>";
              if (v196 != -1) {
                v172 = *(const char **)v198;
              }
              *(_DWORD *)buf = 67110146;
              *(_DWORD *)&uint8_t buf[4] = v71;
              *(_WORD *)&buf[8] = 2082;
              *(void *)&buf[10] = v66;
              *(_WORD *)&buf[18] = 1024;
              *(_DWORD *)&buf[20] = v67;
              *(_WORD *)&buf[24] = 2048;
              *(void *)&buf[26] = v73;
              *(_WORD *)&buf[34] = 2080;
              *(void *)&buf[36] = v172;
              _os_log_fault_impl( (void *)&_mh_execute_header,  v76,  OS_LOG_TYPE_FAULT,  "Detected fd %d from %{public}s [%d] with non-zero file size %lld! Path: %s",  buf,  0x2Cu);
            }

            *__error() = v74;
            uint64_t v79 = objc_alloc(&OBJC_CLASS___NSString);
            int v80 = "<unknown>";
            if (v196 != -1) {
              int v80 = v78;
            }
            id v81 = -[NSString initWithFormat:]( v79,  "initWithFormat:",  @"Detected fd %d from %s [%d] with non-zero file size %lld! Path: %s",  v71,  v66,  v67,  v73,  v80);
            -[TSPSaveMeasurements stopRecordingTimeForDumpRequestPhase:]( v69,  "stopRecordingTimeForDumpRequestPhase:",  v81);

            -[TSPSaveMeasurements setFileSizeBytes:](v69, "setFileSizeBytes:", v73);
            if (v78) {
              free(v78);
            }
            v82 = v68;
            int v83 = 25;
            int v84 = v69;
            goto LABEL_87;
          }

          uint64_t v194 = xpc_dictionary_get_uint64(v68, "tailspin_dump_request_timestamp");
          int v138 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
          [v138 setObject:&__kCFBooleanFalse forKeyedSubscript:UnsafePointer];
          [v138 setObject:&__kCFBooleanTrue forKeyedSubscript:UnsafePointer];
          [v138 setObject:&__kCFBooleanFalse forKeyedSubscript:UnsafePointer];
          [v138 setObject:&__kCFBooleanFalse forKeyedSubscript:UnsafePointer];
          [v138 setObject:&__kCFBooleanTrue forKeyedSubscript:UnsafePointer];
          [v138 setObject:&__kCFBooleanTrue forKeyedSubscript:UnsafePointer];
          id v139 = [v138 copy];
          size_t length = 0LL;
          int v140 = xpc_dictionary_get_data(v68, "tailspin_dump_options", &length);
          v195 = v138;
          if (v140)
          {
            uint64_t v141 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v140, length));
            if (!v141)
            {
              int v163 = *__error();
              id v164 = sub_100002490();
              v165 = (os_log_s *)objc_claimAutoreleasedReturnValue(v164);
              if (os_log_type_enabled(v165, OS_LOG_TYPE_ERROR)) {
                sub_100008218();
              }

              *__error() = v163;
              -[TSPSaveMeasurements stopRecordingTimeForDumpRequestPhase:]( v69,  "stopRecordingTimeForDumpRequestPhase:",  @"Can't parse client dump output options");
              sub_100006498(v68, 8, 0LL);
              goto LABEL_143;
            }

            int v142 = (void *)v141;
            v197 = v139;
            id v205 = 0LL;
            id v139 = (id)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v141,  0LL,  0LL,  &v205));
            id v143 = v205;
            if (!v139)
            {
              int v166 = *__error();
              id v167 = sub_100002490();
              v168 = (os_log_s *)objc_claimAutoreleasedReturnValue(v167);
              if (os_log_type_enabled(v168, OS_LOG_TYPE_ERROR))
              {
                id v189 = objc_claimAutoreleasedReturnValue([v143 description]);
                id v190 = [v189 UTF8String];
                *(_DWORD *)buf = 136446722;
                *(void *)&uint8_t buf[4] = v66;
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = v67;
                *(_WORD *)&buf[18] = 2080;
                *(void *)&buf[20] = v190;
                _os_log_error_impl( (void *)&_mh_execute_header,  v168,  OS_LOG_TYPE_ERROR,  "Unable to save tailspin for %{public}s [%d]: Failed to deserialize dump options due to %s",  buf,  0x1Cu);
              }

              *__error() = v166;
              v169 = objc_alloc(&OBJC_CLASS___NSString);
              v170 = (void *)objc_claimAutoreleasedReturnValue([v143 description]);
              v171 = -[NSString initWithFormat:]( v169,  "initWithFormat:",  @"Failed to deserialize dump options due to %@",  v170);
              -[TSPSaveMeasurements stopRecordingTimeForDumpRequestPhase:]( v69,  "stopRecordingTimeForDumpRequestPhase:",  v171);

              sub_100006498(v68, 9, 0LL);
              goto LABEL_142;
            }
          }

          id v144 = v139;
          uint64_t v145 = mach_absolute_time();
          uint64_t v192 = qword_100012548;
          double v148 = sub_100006B7C(v145 - qword_100012548, v146, v147);
          int v149 = (void *)objc_claimAutoreleasedReturnValue([v144 objectForKeyedSubscript:UnsafePointer]);

          double v150 = 0.5;
          v197 = v144;
          if (v149)
          {
            uint64_t v151 = objc_opt_class(&OBJC_CLASS___NSNumber);
            if ((objc_opt_isKindOfClass(v149, v151) & 1) != 0)
            {
              [v149 doubleValue];
              if (v152 >= 0.0)
              {
                double v150 = v152;
              }

              else
              {
                int v153 = *__error();
                id v154 = sub_100002490();
                v155 = (os_log_s *)objc_claimAutoreleasedReturnValue(v154);
                if (os_log_type_enabled(v155, OS_LOG_TYPE_ERROR)) {
                  sub_1000081A0(v155, v156, v157, v158, v159, v160, v161, v162);
                }

                *__error() = v153;
              }
            }
          }

          sub_10000734C((uint64_t)asc_100012550, v66, v148);
          int v173 = *__error();
          id v174 = sub_100002490();
          v175 = (os_log_s *)objc_claimAutoreleasedReturnValue(v174);
          if (os_log_type_enabled(v175, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218752;
            *(double *)&uint8_t buf[4] = v148;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = v145;
            *(_WORD *)&buf[22] = 2048;
            *(void *)&buf[24] = v192;
            *(_WORD *)&buf[32] = 2048;
            *(double *)&buf[34] = v150;
            _os_log_impl( (void *)&_mh_execute_header,  v175,  OS_LOG_TYPE_DEFAULT,  "Duration since trace buffer start: %0.3fs (%llu - %llu), minimum acceptable duration: %.3f",  buf,  0x2Au);
          }

          *__error() = v173;
          if (v150 == 0.0)
          {
            int v176 = *__error();
            id v177 = sub_100002490();
            v178 = (os_log_s *)objc_claimAutoreleasedReturnValue(v177);
            if (os_log_type_enabled(v178, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v178,  OS_LOG_TYPE_DEFAULT,  "Not enforcing minimum acceptable duration since trace buffer start because of client override",  buf,  2u);
            }

            *__error() = v176;
            goto LABEL_136;
          }

          if (v148 >= v150)
          {
LABEL_136:
            v179 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v66));
            dispatch_time_t when = dispatch_time(0LL, 90000000000LL);
            v180 = (dispatch_queue_s *)qword_1000129E0;
            *(void *)buf = _NSConcreteStackBlock;
            *(void *)&buf[8] = 3221225472LL;
            *(void *)&buf[16] = sub_100006800;
            *(void *)&buf[24] = &unk_10000C788;
            v181 = v69;
            *(void *)&buf[32] = v181;
            *(void *)&buf[40] = v179;
            *(_DWORD *)&buf[64] = v67;
            *(_DWORD *)&buf[68] = v71;
            *(void *)&buf[56] = v66;
            id v182 = v68;
            *(void *)&buf[48] = v182;
            id v193 = v179;
            dispatch_after(when, v180, buf);
            atomic_store(-[TSPSaveMeasurements request_id](v181, "request_id"), &dword_1000129FC);
            if (v194) {
              -[TSPSaveMeasurements recordRequestProcessingLatencySecsWithStartMCT:endMCT:]( v181,  "recordRequestProcessingLatencySecsWithStartMCT:endMCT:",  v194,  mach_continuous_time());
            }
            uint64_t ondisk_config = tailspin_make_ondisk_config(&qword_100010410, 1LL);
            v184 = (void *)objc_claimAutoreleasedReturnValue(ondisk_config);
            uint64_t v185 = qword_1000129D8;
            *(void *)v198 = _NSConcreteStackBlock;
            uint64_t v199 = 3221225472LL;
            v200 = sub_100006A74;
            v201 = &unk_10000C7B0;
            uint64_t v204 = v66;
            v202 = v181;
            id v203 = v182;
            id v139 = v197;
            tailspin_save_trace_with_standard_chunks(v71, v66, v67, v197, v184, v185, v202, v198);

            goto LABEL_143;
          }

          int v186 = *__error();
          id v187 = sub_100002490();
          v188 = (os_log_s *)objc_claimAutoreleasedReturnValue(v187);
          if (os_log_type_enabled(v188, OS_LOG_TYPE_ERROR)) {
            sub_10000813C();
          }

          *__error() = v186;
          -[TSPSaveMeasurements stopRecordingTimeForDumpRequestPhase:]( v69,  "stopRecordingTimeForDumpRequestPhase:",  @"Resulting trace would be shorter than desired duration");
          sub_100006498(v68, 10, 0LL);
LABEL_142:
          id v139 = v197;
LABEL_143:

          goto LABEL_88;
        }

        int v118 = *__error();
        id v119 = sub_100002490();
        uint64_t v120 = (os_log_s *)objc_claimAutoreleasedReturnValue(v119);
        if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446722;
          *(void *)&uint8_t buf[4] = v66;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v67;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v71;
          _os_log_error_impl( (void *)&_mh_execute_header,  v120,  OS_LOG_TYPE_ERROR,  "Unable to save tailspin for %{public}s [%d]: file descriptor is not read-write %d",  buf,  0x18u);
        }

        *__error() = v118;
        v121 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"File descriptor is not read-write %d",  v71);
        -[TSPSaveMeasurements stopRecordingTimeForDumpRequestPhase:](v69, "stopRecordingTimeForDumpRequestPhase:", v121);

        v82 = v68;
        int v83 = 7;
      }
    }

    else
    {
      int v111 = *__error();
      id v112 = sub_100002490();
      uint64_t v113 = (os_log_s *)objc_claimAutoreleasedReturnValue(v112);
      if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR)) {
        sub_1000080DC();
      }

      *__error() = v111;
      -[TSPSaveMeasurements stopRecordingTimeForDumpRequestPhase:]( v69,  "stopRecordingTimeForDumpRequestPhase:",  @"tailspin is disabled");
      v82 = v68;
      int v83 = 2;
    }

    int v84 = 0LL;
LABEL_87:
    sub_100006498(v82, v83, v84);
LABEL_88:

LABEL_108:
    goto LABEL_25;
  }

  int v104 = *__error();
  id v105 = sub_100002490();
  v106 = (os_log_s *)objc_claimAutoreleasedReturnValue(v105);
  if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR)) {
    sub_10000807C();
  }

  *__error() = v104;
  sub_100006498(v3, 3, 0LL);
LABEL_25:
}

void sub_100006498(void *a1, int a2, void *a3)
{
  xpc_object_t xdict = a1;
  id v5 = a3;
  xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(xdict);
  int v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
  if (!v7) {
    sub_100007CD0();
  }
  id v8 = v7;
  context = xpc_connection_get_context(v7);
  sub_100007334((uint64_t)context + 32, a2, v5);
  sub_100006568(xdict, a2 == 0);
  if ((a2 - 25) <= 1)
  {
    int v10 = *__error();
    id v11 = sub_100002490();
    BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000083E0();
    }

    *__error() = v10;
    exit(-1);
  }
}

void sub_100006568(void *a1, BOOL a2)
{
  xpc_object_t xdict = a1;
  xpc_object_t reply = xpc_dictionary_create_reply(xdict);
  if (!reply) {
    sub_100007CD0();
  }
  uint64_t v4 = reply;
  xpc_dictionary_set_BOOL(reply, "tailspin_succeeded", a2);
  xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(xdict);
  int v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
  if (!v6) {
    sub_100007CD0();
  }
  int v7 = v6;
  xpc_connection_send_message(v6, v4);
}

void sub_1000065E0(id a1)
{
  int v1 = *__error();
  id v2 = sub_100002490();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "server has been SIGTERMed", v4, 2u);
  }

  *__error() = v1;
  sub_10000490C((uint64_t)"exiting for SIGTERM");
  exit(0);
}

void sub_100006658(id a1)
{
}

off_t sub_100006670(int a1)
{
  off_t v2 = lseek(a1, 0LL, 1);
  off_t v3 = lseek(a1, 0LL, 2);
  lseek(a1, v2, 0);
  return v3;
}

uint64_t sub_1000066CC(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = calloc(1uLL, 0x400uLL);
  *a2 = (uint64_t)v4;
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v5 = fcntl(a1, 50, v4);
  int v6 = *__error();
  id v7 = sub_100002490();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = v8;
  if ((_DWORD)v5 == -1)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10000840C(a1, v9);
    }
    uint64_t v5 = 0xFFFFFFFFLL;
  }

  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *a2;
    *(_DWORD *)buf = 67109378;
    int v13 = a1;
    __int16 v14 = 2080;
    uint64_t v15 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Received request for fd %d, path: %s",  buf,  0x12u);
  }

  *__error() = v6;
  return v5;
}

int *sub_100006800(uint64_t a1)
{
  signed int v2 = atomic_load(&dword_1000129FC);
  int v3 = v2;
  if (v2 != -1 && (unint64_t)objc_msgSend(*(id *)(a1 + 32), "request_id") >= v2)
  {
    int v26 = 0LL;
    int v8 = sub_1000066CC(*(unsigned int *)(a1 + 68), (uint64_t *)&v26);
    off_t v9 = sub_100006670(*(_DWORD *)(a1 + 68));
    int v10 = *__error();
    id v11 = sub_100002490();
    BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      uint64_t v13 = *(void *)(a1 + 56);
      int v14 = *(_DWORD *)(a1 + 64);
      id v15 = objc_msgSend(*(id *)(a1 + 32), "request_id");
      uint64_t v16 = (uint64_t)v26;
      if (v8 == -1) {
        int v17 = "<unknown>";
      }
      else {
        int v17 = v26;
      }
      *(_DWORD *)buf = 136447490;
      uint64_t v28 = v13;
      __int16 v29 = 1024;
      int v30 = v14;
      __int16 v31 = 2048;
      id v32 = v15;
      __int16 v33 = 1024;
      int v34 = 90;
      __int16 v35 = 2048;
      off_t v36 = v9;
      __int16 v37 = 2080;
      int v38 = v17;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_FAULT,  "Save from %{public}s [%d] (request ID %llu) exceeded %ds timeout! Size: %lld, Path: %s",  buf,  0x36u);
    }

    else
    {
      uint64_t v16 = (uint64_t)v26;
    }

    *__error() = v10;
    BOOL v18 = *(void **)(a1 + 32);
    uint64_t v19 = objc_alloc(&OBJC_CLASS___NSString);
    id v20 = [*(id *)(a1 + 40) UTF8String];
    if (v8 == -1) {
      unsigned int v21 = "<unknown>";
    }
    else {
      unsigned int v21 = (const char *)v16;
    }
    unsigned int v22 = -[NSString initWithFormat:]( v19,  "initWithFormat:",  @"Save from %s [%d] exceeded %ds timeout! Size: %lld, Path: %s",  v20,  *(unsigned int *)(a1 + 64),  90LL,  v9,  v21);
    [v18 stopRecordingTimeForDumpRequestPhase:v22];

    [*(id *)(a1 + 32) setFileSizeBytes:v9];
    sub_100006498(*(void **)(a1 + 48), 27, *(void **)(a1 + 32));
    int v23 = *__error();
    id v24 = sub_100002490();
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_1000083E0();
    }

    *__error() = v23;
    exit(-1);
  }

  int v4 = *__error();
  id v5 = sub_100002490();
  int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100008488(a1, v3, v6);
  }

  uint64_t result = __error();
  *uint64_t result = v4;
  return result;
}

void sub_100006A74(uint64_t a1, int a2)
{
  if (!a2)
  {
    size_t v10 = 8LL;
    uint64_t v11 = 0LL;
    int v4 = sysctlbyname("kern.kdbg.oldest_time", &v11, &v10, 0LL, 0LL);
    int v5 = *__error();
    id v6 = sub_100002490();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    int v8 = v7;
    if (v4 < 0)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100008560(v8);
      }

      *__error() = v5;
    }

    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        sub_1000085D8((uint64_t *)&v11, v8);
      }

      *__error() = v5;
      uint64_t v9 = v11;
      if (v11) {
        goto LABEL_11;
      }
    }

    uint64_t v9 = mach_absolute_time();
LABEL_11:
    sub_100004804(v9, *(const char **)(a1 + 48));
  }

  [*(id *)(a1 + 32) stopRecordingTimeForDumpRequestPhase:0];
  sub_100006498(*(void **)(a1 + 40), a2, *(void **)(a1 + 32));
  atomic_store(0xFFFFFFFF, &dword_1000129FC);
}

double sub_100006B7C(unint64_t a1, double a2, double a3)
{
  if (qword_100012A08 != -1) {
    dispatch_once(&qword_100012A08, &stru_10000C7D0);
  }
  LODWORD(a3) = dword_100012A00;
  return (double)*(unint64_t *)&a3
}

void sub_100006BF0(id a1)
{
  if (mach_timebase_info((mach_timebase_info_t)&dword_100012A00)) {
    sub_100007CD0();
  }
}

void sub_100006C14( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_100006C2C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

void sub_100006C40(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

void sub_100006C54(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

uint64_t sub_100006C60()
{
  return _os_assert_log(0LL);
}

  ;
}

  ;
}

  ;
}

void sub_100006C98(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_100006CA4( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

void sub_100006D18(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

int *sub_100006D2C()
{
  return __error();
}

void sub_100006D34( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100006D44( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

void sub_100006D90(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(va, 8) = a1;
}

int *sub_100006DA0()
{
  return __error();
}

  ;
}

  ;
}

void sub_100006DC0(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (a2) {
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a2));
  }
  else {
    int v4 = @"Unknown";
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100006E64;
  v6[3] = &unk_10000C7F8;
  id v7 = v4;
  int v5 = v4;
  AnalyticsSendEventLazy(v3, v6);
}

id sub_100006E64(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v3 = @"Execname";
  uint64_t v4 = v1;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL));
}

void sub_100006ED4(void *a1, uint64_t a2, int a3, void *a4)
{
  id v7 = a1;
  id v8 = a4;
  if (a2) {
    uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a2));
  }
  else {
    uint64_t v9 = @"Unknown";
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100006FAC;
  v12[3] = &unk_10000C820;
  int v15 = a3;
  uint64_t v13 = v9;
  id v14 = v8;
  id v10 = v8;
  uint64_t v11 = v9;
  AnalyticsSendEventLazy(v7, v12);
}

id sub_100006FAC(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = *(void *)(a1 + 32);
  v35[1] = @"SaveResultEnum";
  v36[0] = v2;
  v35[0] = @"ExecName";
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(a1 + 48)));
  v36[1] = v3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v36,  v35,  2LL));
  int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v4));

  id v6 = *(void **)(v1 + 40);
  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v6 fileSizeBytes]));
    [v5 setObject:v7 forKeyedSubscript:@"FileSize"];

    [*(id *)(v1 + 40) tailspinDurationSecs];
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    [v5 setObject:v8 forKeyedSubscript:@"TailspinDuration"];

    [*(id *)(v1 + 40) requestProcessingLatencySecs];
    if (v9 != -1.0)
    {
      [*(id *)(v1 + 40) requestProcessingLatencySecs];
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
      [v5 setObject:v10 forKeyedSubscript:@"RequestProcessingLatency"];
    }

    [*(id *)(v1 + 40) ratioTimePeriodCovered];
    if (v11 != -1.0)
    {
      [*(id *)(v1 + 40) ratioTimePeriodCovered];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  (int)(v12 * 100.0)));
      [v5 setObject:v13 forKeyedSubscript:@"PercentageTimeCovered"];
    }

    [*(id *)(v1 + 40) lostTimePeriodAtStartSecs];
    if (v14 != -1.0)
    {
      [*(id *)(v1 + 40) lostTimePeriodAtStartSecs];
      int v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
      [v5 setObject:v15 forKeyedSubscript:@"LostTimePeriodAtStart"];
    }

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 40) timeSpentByPhases]);

    if (v16)
    {
      int v17 = v5;
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      obint j = (id)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 40) timeSpentByPhases]);
      id v18 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v18)
      {
        id v19 = v18;
        uint64_t v20 = *(void *)v31;
        do
        {
          for (unsigned int i = 0LL; i != v19; unsigned int i = (char *)i + 1)
          {
            if (*(void *)v31 != v20) {
              objc_enumerationMutation(obj);
            }
            uint64_t v22 = *(void *)(*((void *)&v30 + 1) + 8LL * (void)i);
            int v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Duration_%@",  v22));
            if (v23)
            {
              uint64_t v24 = v1;
              uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 40) timeSpentByPhases]);
              int v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:v22]);
              [v17 setObject:v26 forKeyedSubscript:v23];

              uint64_t v1 = v24;
            }
          }

          id v19 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
        }

        while (v19);
      }

      int v5 = v17;
    }
  }

  id v27 = [v5 copy];

  return v27;
}

void sub_100007324(uint64_t a1)
{
}

void sub_100007334(uint64_t a1, int a2, void *a3)
{
}

void sub_10000734C(uint64_t a1, uint64_t a2, double a3)
{
  if (!a1)
  {
    int v5 = @"Unknown";
    if (a2) {
      goto LABEL_3;
    }
LABEL_5:
    id v6 = @"Unknown";
    goto LABEL_6;
  }

  int v5 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a1));
  if (!a2) {
    goto LABEL_5;
  }
LABEL_3:
  id v6 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a2));
LABEL_6:
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100007438;
  v9[3] = &unk_10000C848;
  id v10 = v5;
  double v11 = v6;
  double v12 = a3;
  id v7 = v6;
  id v8 = v5;
  AnalyticsSendEventLazy(@"com.apple.tailspind.durationsincetracebufferstart.v1", v9);
}

id sub_100007438(uint64_t a1)
{
  v5[0] = @"TraceBufferStartEventName";
  v5[1] = @"SaveExecname";
  uint64_t v1 = *(void *)(a1 + 40);
  v6[0] = *(void *)(a1 + 32);
  v6[1] = v1;
  v5[2] = @"DurationSinceTraceBufferStartSec";
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 48)));
  v6[2] = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v6,  v5,  3LL));

  return v3;
}

void sub_1000074F4(uint64_t a1)
{
}

void sub_100007504(uint64_t a1, int a2)
{
}

_DWORD *(*sub_10000751C(uint64_t a1))(_DWORD *result, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 20) == 670) {
    return sub_100007534;
  }
  else {
    return 0LL;
  }
}

_DWORD *sub_100007534(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    uint64_t result = (_DWORD *)sub_100003F08();
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  return result;
}

uint64_t sub_10000758C(_DWORD *a1, uint64_t a2)
{
  unsigned int v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = a1[5] + 100;
  *(void *)(a2 + _Block_object_dispose(va, 8) = v2;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  if (a1[5] == 670)
  {
    if ((*a1 & 0x80000000) != 0 || a1[1] != 24)
    {
      *(_DWORD *)(a2 + 32) = -304;
      *(NDR_record_t *)(a2 + 24) = NDR_record;
    }

    else
    {
      *(_DWORD *)(a2 + 32) = sub_100003F08();
    }

    return 1LL;
  }

  else
  {
    uint64_t result = 0LL;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 32) = -303;
  }

  return result;
}

void sub_100007638()
{
  __assert_rtn("-[TSPSaveMeasurements _stopRecordingTimeForPhase:]", "TSPSaveMeasurements.m", 226, "startTime != nil");
}

void sub_100007660()
{
  uint64_t v0 = _os_assert_log(0LL);
  _os_crash(v0);
  __break(1u);
}

void sub_100007678(uint64_t *a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  int v4 = 136446210;
  uint64_t v5 = v3;
  sub_100006C98((void *)&_mh_execute_header, a2, a3, "Current system config = \n%{public}s", (uint8_t *)&v4);
  sub_100006C24();
}

void sub_1000076E4(os_log_s *a1)
{
}

void sub_10000775C()
{
  sub_100006D18( (void *)&_mh_execute_header,  v0,  v1,  "action %u's samplers = %llu != %u = tailspin_fss_samplers",  v2,  v3,  v4);
  sub_100006C24();
}

void sub_1000077C4()
{
  sub_100006D44( (void *)&_mh_execute_header,  v0,  v1,  "timer %u's action id = %u != %u = tailspin_oncore_action_id",  v2,  v3,  v4,  v5,  v6);
  sub_100006C24();
}

void sub_100007830()
{
  sub_100006D34( (void *)&_mh_execute_header,  v0,  v1,  "timer %u's period = %llu != %llu = tailspin_oncore_timer_period",  v2,  v3,  v4,  v5,  v6);
}

void sub_1000078A4()
{
}

void sub_1000078D0()
{
  sub_100006D18( (void *)&_mh_execute_header,  v0,  v1,  "action %u's samplers = %llu != %u = tailspin_fss_samplers",  v2,  v3,  v4);
  sub_100006C24();
}

void sub_100007938()
{
  sub_100006D44( (void *)&_mh_execute_header,  v0,  v1,  "timer %u's action id = %u != %u = tailspin_fss_action_id",  v2,  v3,  v4,  v5,  v6);
  sub_100006C24();
}

void sub_1000079A4()
{
  sub_100006D34( (void *)&_mh_execute_header,  v0,  v1,  "timer %u's period = %llu != %llu = tailspin_fss_timer_period",  v2,  v3,  v4,  v5,  v6);
}

void sub_100007A18()
{
}

void sub_100007A7C()
{
  sub_100006CA4( (void *)&_mh_execute_header,  v0,  v1,  "actual_buf_size = %llu != %zu = tailspin_buf_size",  v2,  v3,  v4,  v5,  v6);
  sub_100006C24();
}

void sub_100007AF0()
{
}

void sub_100007B1C()
{
}

void sub_100007B90()
{
}

void sub_100007BBC()
{
}

void sub_100007BF4(os_log_s *a1)
{
}

void sub_100007C6C()
{
}

void sub_100007CD0()
{
  uint64_t v0 = sub_100006C60();
  _os_crash(v0);
  __break(1u);
}

void sub_100007CE4(uint64_t a1, os_log_s *a2)
{
  uint64_t v3 = sub_100006DA0();
  strerror(*v3);
  sub_100006D78();
  sub_100006C54((void *)&_mh_execute_header, a2, v4, "Failed to configure kperf sampling (line %u): %s", v5);
  sub_100006C68();
}

void sub_100007D60(os_log_s *a1)
{
}

void sub_100007DD8(int a1, os_log_s *a2)
{
  int v4 = *sub_100006DA0();
  v5[0] = 67109376;
  v5[1] = a1;
  __int16 v6 = 1024;
  int v7 = v4;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "sysctlbyname(ktrace.init_background): ret %d, %d errno",  (uint8_t *)v5,  0xEu);
  sub_100006C68();
}

void sub_100007E68()
{
}

void sub_100007E94()
{
}

void sub_100007EF8()
{
}

void sub_100007F5C( char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = sub_100006C60();
  _os_crash(v8);
  __break(1u);
}

void sub_100007F88(void *a1, os_log_s *a2)
{
}

void sub_100008008(void *a1, os_log_s *a2)
{
}

void sub_10000807C()
{
    v2,
    v3);
  sub_100006C24();
}

void sub_1000080DC()
{
}

void sub_10000813C()
{
}

void sub_1000081A0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100008218()
{
}

void sub_100008278()
{
    v2,
    v3);
  sub_100006C24();
}

void sub_1000082D8(int a1, char a2)
{
  uint64_t v2 = _os_assert_log((a1 == 2) | (a2 & 1));
  _os_crash(v2);
  __break(1u);
}

void sub_1000082FC()
{
}

void sub_100008328()
{
}

void sub_100008354()
{
}

void sub_100008380()
{
}

void sub_1000083E0()
{
}

void sub_10000840C(uint64_t a1, os_log_s *a2)
{
  uint64_t v3 = sub_100006DA0();
  strerror(*v3);
  sub_100006D78();
  sub_100006C54((void *)&_mh_execute_header, a2, v4, "Failed to get file path for fd %d: %{errno}s", v5);
  sub_100006C68();
}

void sub_100008488(uint64_t a1, int a2, os_log_s *a3)
{
  id v6 = [*(id *)(a1 + 40) UTF8String];
  int v7 = *(_DWORD *)(a1 + 64);
  id v8 = objc_msgSend(*(id *)(a1 + 32), "request_id");
  int v9 = 136446978;
  id v10 = v6;
  __int16 v11 = 1024;
  int v12 = v7;
  __int16 v13 = 2048;
  id v14 = v8;
  __int16 v15 = 1024;
  int v16 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_DEBUG,  "tailspin request for %{public}s [%d] (request ID: %llu) successfully completed before timeout (val = %d).",  (uint8_t *)&v9,  0x22u);
}

void sub_100008560(os_log_s *a1)
{
}

void sub_1000085D8(uint64_t *a1, os_log_s *a2)
{
  uint64_t v4 = *a1;
  uint64_t v5 = mach_absolute_time();
  double v8 = sub_100006B7C(v5 - *a1, v6, v7);
  int v9 = 134218240;
  uint64_t v10 = v4;
  __int16 v11 = 2048;
  double v12 = v8;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Successfully got oldest kdebug time (%llu, %.2fs ago)",  (uint8_t *)&v9,  0x16u);
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:");
}