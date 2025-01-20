LABEL_126:
      if ((qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
        && a1[139])
      {
        v77 = _os_log_pack_size();
        v78 = (char *)&v82 - ((MEMORY[0x1895F8858](v77, v77) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v79 = _os_log_pack_fill();
        v80 = quic_cid_describe((unsigned __int8 *)(a1[139] + 38LL));
        v81 = quic_cid_describe((unsigned __int8 *)(a1[139] + 17LL));
        *(_DWORD *)v79 = 136447234;
        *(void *)(v79 + 4) = "quic_stream_closed_already";
        *(_WORD *)(v79 + 12) = 2082;
        *(void *)(v79 + 14) = a1 + 122;
        *(_WORD *)(v79 + 22) = 2082;
        *(void *)(v79 + 24) = v80;
        *(_WORD *)(v79 + 32) = 2082;
        *(void *)(v79 + 34) = v81;
        *(_WORD *)(v79 + 42) = 2048;
        *(void *)(v79 + 44) = a2;
        qlog_internal(16, (uint64_t)v78, 842LL);
      }

      v6 = 0LL;
      a1[134] = 4LL;
      a1[135] = "exceeded maximum stream ID";
      return v6;
    }
  }

  else if ((a2 & 1) != 0)
  {
    goto LABEL_12;
  }

  if (v5 >= a2)
  {
    if ((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1
      || (v6 = 1LL, os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO)))
    {
      if (a1[139])
      {
        v52 = _os_log_pack_size();
        v53 = (char *)&v82 - ((MEMORY[0x1895F8858](v52, v52) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v54 = _os_log_pack_fill();
        v84 = a1 + 122;
        v55 = (unsigned __int8 *)a1[139];
        if (quic_cid_describe_state % 3 == 2) {
          v56 = &quic_cid_describe_cid_buf2;
        }
        else {
          v56 = &quic_cid_describe_cid_buf3;
        }
        if (quic_cid_describe_state % 3) {
          v57 = v56;
        }
        else {
          v57 = &quic_cid_describe_cid_buf1;
        }
        v58 = ++quic_cid_describe_state;
        v59 = v55[38];
        v60 = 0uLL;
        *(_OWORD *)((char *)v57 + 25) = 0u;
        if (v59 >= 0x14) {
          v61 = 20LL;
        }
        else {
          v61 = v59;
        }
        *v57 = 0uLL;
        v57[1] = 0uLL;
        if ((_DWORD)v61)
        {
          v62 = v55 + 39;
          do
          {
            v63 = *v62++;
            snprintf((char *)v57, 0x29uLL, "%s%02x", (const char *)v57, v63);
            --v61;
          }

          while (v61);
          v55 = (unsigned __int8 *)a1[139];
          v58 = quic_cid_describe_state;
          v60 = 0uLL;
        }

        if (v58 % 3 == 2) {
          v64 = &quic_cid_describe_cid_buf2;
        }
        else {
          v64 = &quic_cid_describe_cid_buf3;
        }
        if (v58 % 3) {
          v65 = v64;
        }
        else {
          v65 = &quic_cid_describe_cid_buf1;
        }
        quic_cid_describe_state = v58 + 1;
        if (v55[17] >= 0x14u) {
          v66 = 20LL;
        }
        else {
          v66 = v55[17];
        }
        *v65 = v60;
        v65[1] = v60;
        *(_OWORD *)((char *)v65 + 25) = v60;
        if ((_DWORD)v66)
        {
          v67 = v55 + 18;
          do
          {
            v68 = *v67++;
            snprintf((char *)v65, 0x29uLL, "%s%02x", (const char *)v65, v68);
            --v66;
          }

          while (v66);
        }

        v69 = a1[86];
        v70 = a1[96];
        *(_DWORD *)v54 = 136447746;
        *(void *)(v54 + 4) = "quic_stream_closed_already";
        *(_WORD *)(v54 + 12) = 2082;
        *(void *)(v54 + 14) = v84;
        *(_WORD *)(v54 + 22) = 2082;
        *(void *)(v54 + 24) = v57;
        *(_WORD *)(v54 + 32) = 2082;
        *(void *)(v54 + 34) = v65;
        *(_WORD *)(v54 + 42) = 2048;
        *(void *)(v54 + 44) = a2;
        *(_WORD *)(v54 + 52) = 2048;
        *(void *)(v54 + 54) = v69;
        *(_WORD *)(v54 + 62) = 2048;
        *(void *)(v54 + 64) = v70;
        v6 = 1LL;
        v50 = (uint64_t)v53;
        v51 = 822LL;
        goto LABEL_115;
      }

      return 1LL;
    }
  }

  else
  {
    if (((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1
       || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
      && a1[139])
    {
      v11 = _os_log_pack_size();
      v84 = &v82;
      v12 = (char *)&v82 - ((MEMORY[0x1895F8858](v11, v11) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v13 = _os_log_pack_fill();
      v83 = a1 + 122;
      v14 = (unsigned __int8 *)a1[139];
      if (quic_cid_describe_state % 3 == 2) {
        v15 = &quic_cid_describe_cid_buf2;
      }
      else {
        v15 = &quic_cid_describe_cid_buf3;
      }
      if (quic_cid_describe_state % 3) {
        v16 = v15;
      }
      else {
        v16 = &quic_cid_describe_cid_buf1;
      }
      v17 = ++quic_cid_describe_state;
      v18 = v14[38];
      v19 = 0uLL;
      *(_OWORD *)((char *)v16 + 25) = 0u;
      if (v18 >= 0x14) {
        v20 = 20LL;
      }
      else {
        v20 = v18;
      }
      *v16 = 0uLL;
      v16[1] = 0uLL;
      if ((_DWORD)v20)
      {
        v21 = v14 + 39;
        do
        {
          v22 = *v21++;
          snprintf((char *)v16, 0x29uLL, "%s%02x", (const char *)v16, v22);
          --v20;
        }

        while (v20);
        v14 = (unsigned __int8 *)a1[139];
        v17 = quic_cid_describe_state;
        v19 = 0uLL;
      }

      v23 = (void *)((char *)a1 + 1380);
      if (v17 % 3 == 2) {
        v24 = &quic_cid_describe_cid_buf2;
      }
      else {
        v24 = &quic_cid_describe_cid_buf3;
      }
      if (v17 % 3) {
        v25 = v24;
      }
      else {
        v25 = &quic_cid_describe_cid_buf1;
      }
      quic_cid_describe_state = v17 + 1;
      if (v14[17] >= 0x14u) {
        v26 = 20LL;
      }
      else {
        v26 = v14[17];
      }
      *v25 = v19;
      v25[1] = v19;
      *(_OWORD *)((char *)v25 + 25) = v19;
      if ((_DWORD)v26)
      {
        v27 = v14 + 18;
        do
        {
          v28 = *v27++;
          snprintf((char *)v25, 0x29uLL, "%s%02x", (const char *)v25, v28);
          --v26;
        }

        while (v26);
      }

      v29 = "server";
      v30 = a1[86];
      if ((*v23 & 1LL) != 0) {
        v31 = "server";
      }
      else {
        v31 = "client";
      }
      v32 = a1[96];
      if ((*v23 & 1LL) != 0) {
        v29 = "client";
      }
      *(_DWORD *)v13 = 136448258;
      *(void *)(v13 + 4) = "quic_stream_closed_already";
      *(_WORD *)(v13 + 12) = 2082;
      *(void *)(v13 + 14) = v83;
      *(_WORD *)(v13 + 22) = 2082;
      *(void *)(v13 + 24) = v16;
      *(_WORD *)(v13 + 32) = 2082;
      *(void *)(v13 + 34) = v25;
      *(_WORD *)(v13 + 42) = 2082;
      *(void *)(v13 + 44) = v31;
      *(_WORD *)(v13 + 52) = 2082;
      *(void *)(v13 + 54) = v29;
      *(_WORD *)(v13 + 62) = 2048;
      *(void *)(v13 + 64) = a2;
      *(_WORD *)(v13 + 72) = 2048;
      *(void *)(v13 + 74) = v30;
      *(_WORD *)(v13 + 82) = 2048;
      *(void *)(v13 + 84) = v32;
      qlog_internal(16, (uint64_t)v12, 833LL);
    }

    v6 = 0LL;
    a1[134] = 5LL;
    a1[135] = "invalid stream ID";
  }

  return v6;
}

void quic_stream_ready(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v25[1] = *MEMORY[0x1895F89C0];
  if (*MEMORY[0x189608EC8] != a3)
  {
    if ((*(_BYTE *)(a2 + 352) & 0x20) == 0)
    {
      char v6 = qlog_nwlog_enabled;
      if (qlog_datapath_enabled) {
        BOOL v7 = 0;
      }
      else {
        BOOL v7 = qlog_nwlog_enabled == 0;
      }
      if (!v7)
      {
        if (qlog_debug_enabled) {
          char v6 = 1;
        }
        if ((v6 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v21 = _os_log_pack_size();
          v22 = (char *)v25 - ((MEMORY[0x1895F8858](v21, v21) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          uint64_t v23 = _os_log_pack_fill();
          uint64_t v24 = *(void *)a2;
          *(_DWORD *)uint64_t v23 = 136446722;
          *(void *)(v23 + 4) = "quic_stream_ready";
          *(_WORD *)(v23 + 12) = 2048;
          *(void *)(v23 + 14) = a3;
          *(_WORD *)(v23 + 22) = 2048;
          *(void *)(v23 + 24) = v24;
          qlog_internal(2, (uint64_t)v22, 986LL);
        }
      }

      nw_protocol_instance_set_flow_for_key();
      if ((*(_BYTE *)(a2 + 353) & 0x40) == 0) {
        quic_fsm_recv_stream_change((_BYTE *)(a2 + 251), 1u);
      }
      quic_fsm_send_stream_change((_BYTE *)(a2 + 250), 1u);
      quic_fc_setup_stream(a1, a2, a3);
      nw_protocol_instance_report_ready();
      return;
    }

    nw_protocol_instance_update_outbound_data_limit();
    int v8 = *(_DWORD *)(a2 + 352);
    uint64_t v9 = a2 + 288;
    *(void *)(a2 + 288) = 0LL;
    if ((v8 & 0x4000) != 0)
    {
      v14 = *(uint64_t **)(a1 + 808);
      *(void *)(a2 + 296) = v14;
      uint64_t *v14 = a2;
      *(void *)(a1 + 808) = v9;
      if (*(_BYTE *)(a1 + 477) == 9)
      {
        v11 = (unint64_t *)(a1 + 736);
        v12 = (void *)a1;
        uint64_t v13 = 23LL;
        goto LABEL_16;
      }
    }

    else
    {
      v10 = *(uint64_t **)(a1 + 728);
      *(void *)(a2 + 296) = v10;
      uint64_t *v10 = a2;
      *(void *)(a1 + 728) = v9;
      if (*(_BYTE *)(a1 + 477) == 9)
      {
        v11 = (unint64_t *)(a1 + 656);
        v12 = (void *)a1;
        uint64_t v13 = 22LL;
LABEL_16:
        quic_send_streams_blocked(v12, v13, v11);
      }
    }

    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = _os_log_pack_size();
      v16 = (char *)v25 - ((MEMORY[0x1895F8858](v15, v15) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v17 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v17 = 136446466;
      *(void *)(v17 + 4) = "quic_stream_ready";
      *(_WORD *)(v17 + 12) = 2048;
      *(void *)(v17 + 14) = a3;
      qlog_internal(2, (uint64_t)v16, 983LL);
    }

    return;
  }

  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    uint64_t v18 = _os_log_pack_size();
    v19 = (char *)v25 - ((MEMORY[0x1895F8858](v18, v18) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v20 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v20 = 136446210;
    *(void *)(v20 + 4) = "quic_stream_ready";
    qlog_internal(17, (uint64_t)v19, 961LL);
  }

void quic_stream_send_create(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v86 = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }

    uint64_t v61 = _os_log_pack_size();
    v62 = (char *)&v76 - ((MEMORY[0x1895F8858](v61, v61) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v63 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v63 = 136446210;
    *(void *)(v63 + 4) = "quic_stream_send_create";
    uint64_t v64 = (uint64_t)v62;
    uint64_t v65 = 1005LL;
LABEL_113:
    qlog_internal(17, v64, v65);
    return;
  }

  if (*MEMORY[0x189608EC8] == a2)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }

    uint64_t v66 = _os_log_pack_size();
    v67 = (char *)&v76 - ((MEMORY[0x1895F8858](v66, v66) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v68 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v68 = 136446210;
    *(void *)(v68 + 4) = "quic_stream_send_create";
    uint64_t v64 = (uint64_t)v67;
    uint64_t v65 = 1006LL;
    goto LABEL_113;
  }

  if (!a3)
  {
    if (!((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1)
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }

    uint64_t v69 = _os_log_pack_size();
    v70 = (char *)&v76 - ((MEMORY[0x1895F8858](v69, v69) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v71 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v71 = 136446210;
    *(void *)(v71 + 4) = "quic_stream_send_create";
    uint64_t v64 = (uint64_t)v70;
    uint64_t v65 = 1007LL;
    goto LABEL_113;
  }

  if ((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = _os_log_pack_size();
    BOOL v7 = (char *)&v76 - ((MEMORY[0x1895F8858](v6, v6) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136446466;
    *(void *)(v8 + 4) = "quic_stream_send_create";
    *(_WORD *)(v8 + 12) = 2048;
    *(void *)(v8 + 14) = a2;
    qlog_internal(2, (uint64_t)v7, 1009LL);
  }

  uint64_t v9 = nw_protocol_instance_copy_options();
  if (v9)
  {
    v10 = (void *)v9;
    if (nw_protocol_options_is_quic_stream())
    {
      else {
        int v11 = 0;
      }
      *(_DWORD *)(a3 + 352) = *(_DWORD *)(a3 + 352) & 0xFFFFBFFF | v11;
      else {
        int v12 = 0;
      }
      *(_DWORD *)(a3 + 352) = *(_DWORD *)(a3 + 352) & 0xFFFFEFFF | v12;
      unint64_t associated_stream_id = nw_quic_stream_get_associated_stream_id();
      uint64_t datagram_context_id = nw_quic_stream_get_datagram_context_id();
    }

    else
    {
      uint64_t datagram_context_id = 0LL;
      unint64_t associated_stream_id = 0LL;
    }

    nw_release(v10);
    unsigned int v15 = *(_DWORD *)(a3 + 352);
    if ((v15 & 0x1000) == 0) {
      goto LABEL_52;
    }
  }

  else
  {
    unint64_t associated_stream_id = 0LL;
    uint64_t datagram_context_id = 0LL;
    unsigned int v15 = *(_DWORD *)(a3 + 352);
    if ((v15 & 0x1000) == 0)
    {
LABEL_52:
      *(void *)(a3 + 24) = a2;
      *(void *)(a3 + 8) = a1;
      v33 = (void *)(a1 + 1380);
      if ((v15 & 0x4000) != 0)
      {
        ++*(_DWORD *)(a1 + 1232);
        unint64_t v34 = *v33 & 1LL | (4LL * *(void *)(a1 + 760)) | 2;
      }

      else
      {
        ++*(_DWORD *)(a1 + 1236);
        unint64_t v34 = (4 * *(_DWORD *)(a1 + 680)) | *v33 & 1LL;
      }

      if (quic_stream_id_is_available((void *)a1, v34))
      {
        uint64_t v35 = quic_stream_alloc_new_id((void *)a1, (v15 >> 14) & 1);
        unsigned int v36 = *(_DWORD *)(a3 + 352) & 0xFFFFFFDF;
      }

      else
      {
        unsigned int v36 = *(_DWORD *)(a3 + 352) | 0x20;
        uint64_t v35 = -4LL;
      }

      *(void *)a3 = v35;
      *(_DWORD *)(a3 + 352) = v36;
      goto LABEL_95;
    }
  }

  if (*(_WORD *)(a1 + 586))
  {
    *(void *)(a3 + 24) = a2;
    *(void *)(a3 + 8) = a1;
    if ((~*(_DWORD *)(a1 + 1380) & 0x30000000) != 0)
    {
      *(void *)a3 = quic_stream_alloc_new_id((void *)a1, 2);
      unsigned int v15 = *(_DWORD *)(a3 + 352);
    }

    else
    {
      if ((associated_stream_id & 3) != 0)
      {
        if ((qlog_debug_enabled
           || (qlog_nwlog_enabled & 1) != 0
           || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
          && *(void *)(a1 + 1112))
        {
          uint64_t v16 = _os_log_pack_size();
          uint64_t v17 = (char *)&v76 - ((MEMORY[0x1895F8858](v16, v16) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          uint64_t v18 = _os_log_pack_fill();
          v77 = (uint64_t *)(a1 + 976);
          v19 = *(unsigned __int8 **)(a1 + 1112);
          if (quic_cid_describe_state % 3 == 2) {
            uint64_t v20 = &quic_cid_describe_cid_buf2;
          }
          else {
            uint64_t v20 = &quic_cid_describe_cid_buf3;
          }
          if (quic_cid_describe_state % 3) {
            uint64_t v21 = v20;
          }
          else {
            uint64_t v21 = &quic_cid_describe_cid_buf1;
          }
          int v22 = ++quic_cid_describe_state;
          unsigned int v23 = v19[38];
          __int128 v24 = 0uLL;
          *(_OWORD *)((char *)v21 + 25) = 0u;
          if (v23 >= 0x14) {
            uint64_t v25 = 20LL;
          }
          else {
            uint64_t v25 = v23;
          }
          *uint64_t v21 = 0uLL;
          v21[1] = 0uLL;
          if ((_DWORD)v25)
          {
            v26 = v19 + 39;
            do
            {
              int v27 = *v26++;
              snprintf((char *)v21, 0x29uLL, "%s%02x", (const char *)v21, v27);
              --v25;
            }

            while (v25);
            v19 = *(unsigned __int8 **)(a1 + 1112);
            int v22 = quic_cid_describe_state;
            __int128 v24 = 0uLL;
          }

          if (v22 % 3 == 2) {
            v28 = &quic_cid_describe_cid_buf2;
          }
          else {
            v28 = &quic_cid_describe_cid_buf3;
          }
          if (v22 % 3) {
            v29 = v28;
          }
          else {
            v29 = &quic_cid_describe_cid_buf1;
          }
          quic_cid_describe_state = v22 + 1;
          if (v19[17] >= 0x14u) {
            uint64_t v30 = 20LL;
          }
          else {
            uint64_t v30 = v19[17];
          }
          _OWORD *v29 = v24;
          v29[1] = v24;
          *(_OWORD *)((char *)v29 + 25) = v24;
          if ((_DWORD)v30)
          {
            v31 = v19 + 18;
            do
            {
              int v32 = *v31++;
              snprintf((char *)v29, 0x29uLL, "%s%02x", (const char *)v29, v32);
              --v30;
            }

            while (v30);
          }

          *(_DWORD *)uint64_t v18 = 136447234;
          *(void *)(v18 + 4) = "quic_stream_send_create";
          *(_WORD *)(v18 + 12) = 2082;
          *(void *)(v18 + 14) = v77;
          *(_WORD *)(v18 + 22) = 2082;
          *(void *)(v18 + 24) = v21;
          *(_WORD *)(v18 + 32) = 2082;
          *(void *)(v18 + 34) = v29;
          *(_WORD *)(v18 + 42) = 2048;
          *(void *)(v18 + 44) = associated_stream_id;
          qlog_internal(16, (uint64_t)v17, 1043LL);
        }

        return;
      }

      *(void *)a3 = (associated_stream_id >> 2) | 0x8000000000000000LL;
      *(void *)(a3 + 240) = datagram_context_id;
    }

    *(_DWORD *)(a3 + 352) = v15 & 0xFFFFFFDF;
    uint64_t v84 = 0x2000000000LL;
    v78[0] = MEMORY[0x1895F87A8];
    v79 = __quic_conn_get_min_mss_path_block_invoke;
    v80 = &unk_18A117B40;
    uint64_t v82 = 0LL;
    v83 = &v82;
    uint64_t v85 = 0LL;
    v78[1] = 0x40000000LL;
    v81 = &v82;
    uint64_t v54 = *(void *)(a1 + 1360);
    do
    {
      if (!v54) {
        break;
      }
      uint64_t v55 = *(void *)(v54 + 312);
      char v56 = ((uint64_t (*)(void *))v79)(v78);
      uint64_t v54 = v55;
    }

    while ((v56 & 1) != 0);
    uint64_t v57 = v83[3];
    _Block_object_dispose(&v82, 8);
    quic_stream_compute_datagram_usable_frame_size(a1, v57, a3);
LABEL_95:
    quic_stream_setup_metadata_handlers(a1, a3, *(void *)(a3 + 16));
    nw_frame_array_init();
    uint64_t v58 = *(void *)(a1 + 1320);
    v59 = calloc(1uLL, 0x48uLL);
    if (v59)
    {
      v59[6] = 0LL;
      v59[7] = v59 + 6;
      v59[4] = -1LL;
      v59[5] = v58 + 48;
      *(void *)(a3 + 256) = v59;
      if ((*(_BYTE *)(a3 + 353) & 0x10) == 0)
      {
        quic_stream_ready(a1, a3, a2);
        return;
      }

      char v60 = qlog_nwlog_enabled;
      if (!qlog_datapath_enabled && !qlog_nwlog_enabled) {
        goto LABEL_100;
      }
    }

    else
    {
      qlog_abort_internal("%s strict_calloc(%zu, %zu) failed", "strict_calloc", 1uLL, 0x48uLL);
    }

    if (qlog_debug_enabled) {
      char v60 = 1;
    }
    if ((v60 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v72 = _os_log_pack_size();
      v73 = (char *)&v76 - ((MEMORY[0x1895F8858](v72, v72) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v74 = _os_log_pack_fill();
      uint64_t v75 = *(void *)a3;
      *(_DWORD *)uint64_t v74 = 136446722;
      *(void *)(v74 + 4) = "quic_stream_send_create";
      *(_WORD *)(v74 + 12) = 2048;
      *(void *)(v74 + 14) = a2;
      *(_WORD *)(v74 + 22) = 2048;
      *(void *)(v74 + 24) = v75;
      qlog_internal(2, (uint64_t)v73, 1091LL);
    }

LABEL_100:
    nw_protocol_instance_set_flow_for_key();
    quic_fsm_send_stream_change((_BYTE *)(a3 + 250), 1u);
    quic_fsm_recv_stream_change((_BYTE *)(a3 + 251), 1u);
    nw_protocol_instance_update_outbound_data_limit();
    nw_protocol_instance_report_ready();
    return;
  }

  if ((qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0
                           || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
    && *(void *)(a1 + 1112))
  {
    uint64_t v37 = _os_log_pack_size();
    v77 = &v76;
    v38 = (char *)&v76 - ((MEMORY[0x1895F8858](v37, v37) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v39 = _os_log_pack_fill();
    uint64_t v76 = a1 + 976;
    v40 = *(unsigned __int8 **)(a1 + 1112);
    if (quic_cid_describe_state % 3 == 2) {
      v41 = &quic_cid_describe_cid_buf2;
    }
    else {
      v41 = &quic_cid_describe_cid_buf3;
    }
    if (quic_cid_describe_state % 3) {
      v42 = v41;
    }
    else {
      v42 = &quic_cid_describe_cid_buf1;
    }
    int v43 = ++quic_cid_describe_state;
    unsigned int v44 = v40[38];
    __int128 v45 = 0uLL;
    *(_OWORD *)((char *)v42 + 25) = 0u;
    if (v44 >= 0x14) {
      uint64_t v46 = 20LL;
    }
    else {
      uint64_t v46 = v44;
    }
    _OWORD *v42 = 0uLL;
    v42[1] = 0uLL;
    if ((_DWORD)v46)
    {
      v47 = v40 + 39;
      do
      {
        int v48 = *v47++;
        snprintf((char *)v42, 0x29uLL, "%s%02x", (const char *)v42, v48);
        --v46;
      }

      while (v46);
      v40 = *(unsigned __int8 **)(a1 + 1112);
      int v43 = quic_cid_describe_state;
      __int128 v45 = 0uLL;
    }

    if (v43 % 3 == 2) {
      v49 = &quic_cid_describe_cid_buf2;
    }
    else {
      v49 = &quic_cid_describe_cid_buf3;
    }
    if (v43 % 3) {
      v50 = v49;
    }
    else {
      v50 = &quic_cid_describe_cid_buf1;
    }
    quic_cid_describe_state = v43 + 1;
    if (v40[17] >= 0x14u) {
      uint64_t v51 = 20LL;
    }
    else {
      uint64_t v51 = v40[17];
    }
    _OWORD *v50 = v45;
    v50[1] = v45;
    *(_OWORD *)((char *)v50 + 25) = v45;
    if ((_DWORD)v51)
    {
      v52 = v40 + 18;
      do
      {
        int v53 = *v52++;
        snprintf((char *)v50, 0x29uLL, "%s%02x", (const char *)v50, v53);
        --v51;
      }

      while (v51);
    }

    *(_DWORD *)uint64_t v39 = 136446978;
    *(void *)(v39 + 4) = "quic_stream_send_create";
    *(_WORD *)(v39 + 12) = 2082;
    *(void *)(v39 + 14) = v76;
    *(_WORD *)(v39 + 22) = 2082;
    *(void *)(v39 + 24) = v42;
    *(_WORD *)(v39 + 32) = 2082;
    *(void *)(v39 + 34) = v50;
    qlog_internal(16, (uint64_t)v38, 1029LL);
  }

uint64_t quic_stream_compute_datagram_usable_frame_size(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v32[1] = *MEMORY[0x1895F89C0];
  unint64_t v6 = *(unsigned __int8 *)(a2 + 17)
     + (unint64_t)quic_protector_get_tag_size( *(void *)(a1 + 568),  *(unsigned __int8 *)(a1 + 600))
     + 5;
  unint64_t v7 = quic_tp_get(*(_BYTE **)(a1 + 544), 3LL);
  unint64_t v8 = *(unsigned __int16 *)(a2 + 426);
  if (v7 < v8) {
    LOWORD(v8) = quic_tp_get(*(_BYTE **)(a1 + 544), 3LL);
  }
  int v9 = (unsigned __int16)v8 - (_DWORD)v6;
  if ((v9 & 0xFFFF0000) != 0)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      uint64_t v10 = _os_log_pack_size();
      int v11 = (char *)v32 - ((MEMORY[0x1895F8858](v10, v10) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v12 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v12 = 136447234;
      *(void *)(v12 + 4) = "quic_stream_compute_datagram_usable_frame_size";
      *(_WORD *)(v12 + 12) = 2082;
      *(void *)(v12 + 14) = "remote_usable_udp_payload_size";
      *(_WORD *)(v12 + 22) = 2048;
      *(void *)(v12 + 24) = (unsigned __int16)v9 + v6;
      *(_WORD *)(v12 + 32) = 2048;
      *(void *)(v12 + 34) = v6;
      *(_WORD *)(v12 + 42) = 2048;
      *(void *)(v12 + 44) = (unsigned __int16)v9;
      qlog_internal(17, (uint64_t)v11, 1338LL);
      int v13 = 1;
      LOWORD(v9) = 0;
      goto LABEL_11;
    }
  }

  else if ((_WORD)v8 != (_WORD)v6)
  {
    int v13 = byte_187C047FC[(73 - __clz((unsigned __int16)(v8 - v6))) >> 3];
    goto LABEL_11;
  }

  LOWORD(v9) = 0;
  int v13 = 1;
LABEL_11:
  uint64_t v14 = (v13 + 1);
  unsigned int v15 = *(unsigned __int16 *)(a1 + 586);
  unsigned __int16 v16 = v15 - v14;
  if (((v15 - (_DWORD)v14) & 0xFFFF0000) != 0)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      uint64_t v17 = _os_log_pack_size();
      uint64_t v18 = (char *)v32 - ((MEMORY[0x1895F8858](v17, v17) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v19 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v19 = 136447234;
      *(void *)(v19 + 4) = "quic_stream_compute_datagram_usable_frame_size";
      *(_WORD *)(v19 + 12) = 2082;
      *(void *)(v19 + 14) = "usable_datagram_frame_size";
      *(_WORD *)(v19 + 22) = 2048;
      *(void *)(v19 + 24) = v16 + v14;
      *(_WORD *)(v19 + 32) = 2048;
      *(void *)(v19 + 34) = v14;
      *(_WORD *)(v19 + 42) = 2048;
      *(void *)(v19 + 44) = v16;
      qlog_internal(17, (uint64_t)v18, 1347LL);
    }

    unsigned __int16 v16 = 0;
  }

  if ((*(_BYTE *)(a1 + 1383) & 0x10) != 0)
  {
    unint64_t v20 = *(void *)a3 & 0x7FFFFFFFFFFFFFFFLL;
    if (v20)
    {
      if (v20 >> 62) {
        qlog_abort_internal("%s unable to calculate length, value: %llu", "quic_vle_length", v20);
      }
      unsigned int v21 = byte_187C047FC[(73 - __clz(v20)) >> 3];
    }

    else
    {
      unsigned int v21 = 1;
    }

    unsigned int v22 = v16 - v21;
    v16 -= v21;
    if ((v22 & 0xFFFF0000) != 0)
    {
      if (qlog_debug_enabled
        || (qlog_nwlog_enabled & 1) != 0
        || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
      {
        uint64_t v23 = _os_log_pack_size();
        __int128 v24 = (char *)v32 - ((MEMORY[0x1895F8858](v23, v23) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v25 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v25 = 136447234;
        *(void *)(v25 + 4) = "quic_stream_compute_datagram_usable_frame_size";
        *(_WORD *)(v25 + 12) = 2082;
        *(void *)(v25 + 14) = "usable_datagram_frame_size";
        *(_WORD *)(v25 + 22) = 2048;
        *(void *)(v25 + 24) = (unsigned __int16)v22 + (unint64_t)v21;
        *(_WORD *)(v25 + 32) = 2048;
        *(void *)(v25 + 34) = v21;
        *(_WORD *)(v25 + 42) = 2048;
        *(void *)(v25 + 44) = (unsigned __int16)v22;
        qlog_internal(17, (uint64_t)v24, 1353LL);
      }

      unsigned __int16 v16 = 0;
    }
  }

  quic_stream_set_usable_datagram_size(a3, v16);
  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v26 = _os_log_pack_size();
    int v27 = (char *)v32 - ((MEMORY[0x1895F8858](v26, v26) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v28 = _os_log_pack_fill();
    uint64_t v29 = *(void *)a3;
    int v30 = *(unsigned __int16 *)(a3 + 248);
    *(_DWORD *)uint64_t v28 = 136446722;
    *(void *)(v28 + 4) = "quic_stream_compute_datagram_usable_frame_size";
    *(_WORD *)(v28 + 12) = 2048;
    *(void *)(v28 + 14) = v29;
    *(_WORD *)(v28 + 22) = 1024;
    *(_DWORD *)(v28 + 24) = v30;
    qlog_internal(2, (uint64_t)v27, 1358LL);
  }

  return nw_protocol_instance_set_flow_is_datagram();
}

BOOL quic_stream_id_is_available(void *a1, unint64_t a2)
{
  v19[1] = *MEMORY[0x1895F89C0];
  if (a2 == -4LL)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || (BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT)))
    {
      uint64_t v16 = _os_log_pack_size();
      uint64_t v17 = (char *)v19 - ((MEMORY[0x1895F8858](v16, v16) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v18 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v18 = 136446210;
      *(void *)(v18 + 4) = "quic_stream_id_is_available";
      int v9 = 17;
      uint64_t v10 = (uint64_t)v17;
      uint64_t v11 = 1272LL;
      goto LABEL_15;
    }

    return result;
  }

  if ((a2 & 2) == 0)
  {
    if (!a1[82] || a1[88] < a2)
    {
      if (qlog_debug_enabled
        || (qlog_nwlog_enabled & 1) != 0
        || (BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG)))
      {
        uint64_t v5 = _os_log_pack_size();
        unint64_t v6 = (char *)v19 - ((MEMORY[0x1895F8858](v5, v5) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v7 = _os_log_pack_fill();
        uint64_t v8 = a1[88];
        *(_DWORD *)uint64_t v7 = 136446722;
        *(void *)(v7 + 4) = "quic_stream_id_is_available";
        *(_WORD *)(v7 + 12) = 2048;
        *(void *)(v7 + 14) = a2;
        *(_WORD *)(v7 + 22) = 2048;
        *(void *)(v7 + 24) = v8;
        int v9 = 2;
        uint64_t v10 = (uint64_t)v6;
        uint64_t v11 = 1278LL;
LABEL_15:
        qlog_internal(v9, v10, v11);
        return 0LL;
      }

      return result;
    }

    return 1LL;
  }

  if (a1[92] && a1[98] >= a2) {
    return 1LL;
  }
  if (qlog_debug_enabled
    || (qlog_nwlog_enabled & 1) != 0
    || (BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG)))
  {
    uint64_t v12 = _os_log_pack_size();
    int v13 = (char *)v19 - ((MEMORY[0x1895F8858](v12, v12) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v14 = _os_log_pack_fill();
    uint64_t v15 = a1[98];
    *(_DWORD *)uint64_t v14 = 136446722;
    *(void *)(v14 + 4) = "quic_stream_id_is_available";
    *(_WORD *)(v14 + 12) = 2048;
    *(void *)(v14 + 14) = a2;
    *(_WORD *)(v14 + 22) = 2048;
    *(void *)(v14 + 24) = v15;
    int v9 = 2;
    uint64_t v10 = (uint64_t)v13;
    uint64_t v11 = 1285LL;
    goto LABEL_15;
  }

  return result;
}

void quic_stream_update_fc_credit(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  v25[1] = *MEMORY[0x1895F89C0];
  unint64_t v7 = *(void *)(a2 + 88);
  *(void *)(a2 + 96) += a3;
  quic_grow_rcvhiwat(a1, (uint64_t *)a2, a3);
  *(void *)(a2 + 80) = quic_stream_rcvwnd(a2);
  *(void *)(a1 + 880) = quic_conn_rcvwnd(a1);
  if (*(void *)(a2 + 88) <= v7)
  {
    char v9 = qlog_nwlog_enabled;
    if (qlog_datapath_enabled) {
      BOOL v10 = 0;
    }
    else {
      BOOL v10 = qlog_nwlog_enabled == 0;
    }
    if (!v10)
    {
      if (qlog_debug_enabled) {
        char v9 = 1;
      }
      if ((v9 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v11 = _os_log_pack_size();
        uint64_t v12 = (char *)v25 - ((MEMORY[0x1895F8858](v11, v11) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v13 = _os_log_pack_fill();
        uint64_t v14 = *(void *)a2;
        uint64_t v15 = *(void *)(a2 + 88);
        *(_DWORD *)uint64_t v13 = 136446978;
        *(void *)(v13 + 4) = "quic_stream_update_fc_credit";
        *(_WORD *)(v13 + 12) = 2048;
        *(void *)(v13 + 14) = v14;
        *(_WORD *)(v13 + 22) = 2048;
        *(void *)(v13 + 24) = v7;
        *(_WORD *)(v13 + 32) = 2048;
        *(void *)(v13 + 34) = v15;
        qlog_internal(2, (uint64_t)v12, 1130LL);
      }
    }
  }

  else if ((a4 & 1) != 0 || *(unsigned __int8 *)(a2 + 251) >= 2u)
  {
    char v8 = qlog_nwlog_enabled;
    if (qlog_datapath_enabled || qlog_nwlog_enabled)
    {
      if (qlog_debug_enabled) {
        char v8 = 1;
      }
      if ((v8 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v17 = _os_log_pack_size();
        uint64_t v18 = (char *)v25 - ((MEMORY[0x1895F8858](v17, v17) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v19 = _os_log_pack_fill();
        uint64_t v20 = *(void *)a2;
        *(_DWORD *)uint64_t v19 = 136446466;
        *(void *)(v19 + 4) = "quic_stream_update_fc_credit";
        *(_WORD *)(v19 + 12) = 2048;
        *(void *)(v19 + 14) = v20;
        qlog_internal(2, (uint64_t)v18, 1145LL);
      }
    }

    quic_conn_send_fc_credit(a1);
  }

  else
  {
    char v16 = qlog_nwlog_enabled;
    if (qlog_datapath_enabled || qlog_nwlog_enabled)
    {
      if (qlog_debug_enabled) {
        char v16 = 1;
      }
      if ((v16 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v21 = _os_log_pack_size();
        unsigned int v22 = (char *)v25 - ((MEMORY[0x1895F8858](v21, v21) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v23 = _os_log_pack_fill();
        uint64_t v24 = *(void *)a2;
        *(_DWORD *)uint64_t v23 = 136446466;
        *(void *)(v23 + 4) = "quic_stream_update_fc_credit";
        *(_WORD *)(v23 + 12) = 2048;
        *(void *)(v23 + 14) = v24;
        qlog_internal(2, (uint64_t)v22, 1150LL);
      }
    }

    quic_stream_send_fc_credit(a1, a2);
  }

void quic_stream_send_fc_credit(uint64_t a1, uint64_t a2)
{
  v20[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if (a2)
    {
      if (*(unsigned __int8 *)(a1 + 477) <= 9u)
      {
        BOOL v4 = quic_prepare_max_data((void *)a1);
        int v5 = quic_prepare_max_stream_data((uint64_t *)a2);
        int v6 = v5;
        if (v4 || v5)
        {
          if (v4) {
            quic_frame_alloc_MAX_DATA(*(void *)(a1 + 560), *(void *)(a1 + 856));
          }
          if (v6) {
            quic_frame_alloc_MAX_STREAM_DATA(*(void *)(a1 + 560), *(void *)a2, *(void *)(a2 + 48));
          }
          uint64_t path = quic_conn_select_next_path((void *)a1, (uint64_t)&__block_literal_global_98);
          if ((quic_conn_send_internal(a1, path, 0LL) & 1) == 0
            && (qlog_debug_enabled
             || (qlog_nwlog_enabled & 1) != 0
             || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG)))
          {
            uint64_t v8 = _os_log_pack_size();
            char v9 = (char *)v20 - ((MEMORY[0x1895F8858](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0LL);
            _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
            uint64_t v10 = _os_log_pack_fill();
            *(_DWORD *)uint64_t v10 = 136446210;
            *(void *)(v10 + 4) = "quic_stream_send_fc_credit";
            int v11 = 2;
            uint64_t v12 = (uint64_t)v9;
            uint64_t v13 = 1496LL;
LABEL_15:
            qlog_internal(v11, v12, v13);
          }
        }
      }
    }

    else if (qlog_debug_enabled {
           || (qlog_nwlog_enabled & 1) != 0
    }
           || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      uint64_t v17 = _os_log_pack_size();
      uint64_t v18 = (char *)v20 - ((MEMORY[0x1895F8858](v17, v17) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v19 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v19 = 136446210;
      *(void *)(v19 + 4) = "quic_stream_send_fc_credit";
      int v11 = 17;
      uint64_t v12 = (uint64_t)v18;
      uint64_t v13 = 1464LL;
      goto LABEL_15;
    }
  }

  else if (qlog_debug_enabled {
         || (qlog_nwlog_enabled & 1) != 0
  }
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    uint64_t v14 = _os_log_pack_size();
    uint64_t v15 = (char *)v20 - ((MEMORY[0x1895F8858](v14, v14) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136446210;
    *(void *)(v16 + 4) = "quic_stream_send_fc_credit";
    int v11 = 17;
    uint64_t v12 = (uint64_t)v15;
    uint64_t v13 = 1463LL;
    goto LABEL_15;
  }

BOOL quic_stream_process(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return 0LL;
    }

    uint64_t v6 = _os_log_pack_size();
    unint64_t v7 = (char *)v17 - ((MEMORY[0x1895F8858](v6, v6) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136446210;
    *(void *)(v8 + 4) = "quic_stream_process";
    uint64_t v9 = (uint64_t)v7;
    uint64_t v10 = 1233LL;
    goto LABEL_18;
  }

  if (*MEMORY[0x189608EC8] == a2)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return 0LL;
    }

    uint64_t v11 = _os_log_pack_size();
    uint64_t v12 = (char *)v17 - ((MEMORY[0x1895F8858](v11, v11) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v13 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v13 = 136446210;
    *(void *)(v13 + 4) = "quic_stream_process";
    uint64_t v9 = (uint64_t)v12;
    uint64_t v10 = 1234LL;
    goto LABEL_18;
  }

  if (!a4)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return 0LL;
    }

    uint64_t v14 = _os_log_pack_size();
    uint64_t v15 = (char *)v17 - ((MEMORY[0x1895F8858](v14, v14) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136446210;
    *(void *)(v16 + 4) = "quic_stream_process";
    uint64_t v9 = (uint64_t)v15;
    uint64_t v10 = 1235LL;
LABEL_18:
    qlog_internal(17, v9, v10);
    return 0LL;
  }

  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2000000000LL;
  char v21 = 1;
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 0x40000000LL;
  v17[2] = __quic_stream_process_block_invoke;
  v17[3] = &unk_18A1174D8;
  v17[4] = &v18;
  v17[5] = a2;
  v17[6] = a1;
  v17[7] = a3;
  v17[8] = a4;
  nw_protocol_instance_access_flow_state();
  BOOL v4 = *((_BYTE *)v19 + 24) != 0;
  _Block_object_dispose(&v18, 8);
  return v4;
}

uint64_t __quic_stream_process_block_invoke(uint64_t a1, uint64_t a2)
{
  v20[1] = *MEMORY[0x1895F89C0];
  char v4 = qlog_nwlog_enabled;
  if (qlog_datapath_enabled) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = qlog_nwlog_enabled == 0;
  }
  if (!v5)
  {
    if (qlog_debug_enabled) {
      char v4 = 1;
    }
    if ((v4 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = _os_log_pack_size();
      uint64_t v11 = (char *)v20 - ((MEMORY[0x1895F8858](v10, v10) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v12 = _os_log_pack_fill();
      uint64_t v13 = *(void *)a2;
      uint64_t v14 = *(void *)(a1 + 40);
      *(_DWORD *)uint64_t v12 = 136446722;
      *(void *)(v12 + 4) = "quic_stream_process_block_invoke";
      *(_WORD *)(v12 + 12) = 2048;
      *(void *)(v12 + 14) = v13;
      *(_WORD *)(v12 + 22) = 2048;
      *(void *)(v12 + 24) = v14;
      qlog_internal(2, (uint64_t)v11, 1243LL);
    }
  }

  int v6 = *(_DWORD *)(a2 + 352);
  if ((v6 & 0x800) != 0)
  {
    *(_DWORD *)(a2 + 352) = v6 & 0xFFFFF7FF;
    nw_protocol_instance_report_ready();
  }

  unsigned int v7 = *(unsigned __int8 *)(a2 + 251);
  if (v7 < 3)
  {
    if (v7 - 1 <= 1) {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = quic_stream_process_inner( *(void **)(a1 + 48),  a2,  *(void *)(a1 + 56),  *(void *)(a1 + 64));
    }
    char v8 = qlog_nwlog_enabled;
    if (qlog_datapath_enabled || qlog_nwlog_enabled)
    {
      if (qlog_debug_enabled) {
        char v8 = 1;
      }
      if ((v8 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v15 = _os_log_pack_size();
        uint64_t v16 = (char *)v20 - ((MEMORY[0x1895F8858](v15, v15) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v17 = _os_log_pack_fill();
        uint64_t v18 = *(void *)a2;
        uint64_t v19 = *(void *)(a2 + 96);
        *(_DWORD *)uint64_t v17 = 136446722;
        *(void *)(v17 + 4) = "quic_stream_process_block_invoke";
        *(_WORD *)(v17 + 12) = 2048;
        *(void *)(v17 + 14) = v18;
        *(_WORD *)(v17 + 22) = 2048;
        *(void *)(v17 + 24) = v19;
        qlog_internal(2, (uint64_t)v16, 1260LL);
      }
    }
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
  }

  return 1LL;
}

BOOL quic_stream_process_inner(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v69 = *MEMORY[0x1895F89C0];
  if (!*(void *)(a2 + 128))
  {
    uint64_t v8 = mach_continuous_time();
    if (timebase_info_once != -1) {
      dispatch_once(&timebase_info_once, &__block_literal_global_397);
    }
    *(void *)(a2 + 128) = timebase_info_info * v8 / dword_18C4D003C / 0x3E8;
  }

  unint64_t v9 = *(void *)(a4 + 40);
  if (v9 > *(void *)(a2 + 88))
  {
    if (!qlog_debug_enabled && (qlog_nwlog_enabled & 1) == 0)
    {
      BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR);
      if (!result) {
        return result;
      }
    }

    if (a1[139])
    {
      uint64_t v11 = _os_log_pack_size();
      p_unint64_t StatusReg = &StatusReg;
      uint64_t v12 = MEMORY[0x1895F8858](v11, v11);
      unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v67 = (char *)&StatusReg - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v13 = _os_log_pack_fill();
      uint64_t v14 = (unsigned __int8 *)a1[139];
      if (quic_cid_describe_state % 3 == 2) {
        uint64_t v15 = &quic_cid_describe_cid_buf2;
      }
      else {
        uint64_t v15 = &quic_cid_describe_cid_buf3;
      }
      if (quic_cid_describe_state % 3) {
        uint64_t v16 = v15;
      }
      else {
        uint64_t v16 = &quic_cid_describe_cid_buf1;
      }
      int v17 = ++quic_cid_describe_state;
      unsigned int v18 = v14[38];
      __int128 v19 = 0uLL;
      *(_OWORD *)((char *)v16 + 25) = 0u;
      if (v18 >= 0x14) {
        uint64_t v20 = 20LL;
      }
      else {
        uint64_t v20 = v18;
      }
      _OWORD *v16 = 0uLL;
      v16[1] = 0uLL;
      if ((_DWORD)v20)
      {
        char v21 = v14 + 39;
        do
        {
          int v22 = *v21++;
          snprintf((char *)v16, 0x29uLL, "%s%02x", (const char *)v16, v22);
          --v20;
        }

        while (v20);
        uint64_t v14 = (unsigned __int8 *)a1[139];
        int v17 = quic_cid_describe_state;
        __int128 v19 = 0uLL;
      }

      uint64_t v23 = a1 + 122;
      if (v17 % 3 == 2) {
        uint64_t v24 = &quic_cid_describe_cid_buf2;
      }
      else {
        uint64_t v24 = &quic_cid_describe_cid_buf3;
      }
      if (v17 % 3) {
        uint64_t v25 = v24;
      }
      else {
        uint64_t v25 = &quic_cid_describe_cid_buf1;
      }
      quic_cid_describe_state = v17 + 1;
      if (v14[17] >= 0x14u) {
        uint64_t v26 = 20LL;
      }
      else {
        uint64_t v26 = v14[17];
      }
      *uint64_t v25 = v19;
      v25[1] = v19;
      *(_OWORD *)((char *)v25 + 25) = v19;
      if ((_DWORD)v26)
      {
        int v27 = v14 + 18;
        do
        {
          int v28 = *v27++;
          snprintf((char *)v25, 0x29uLL, "%s%02x", (const char *)v25, v28);
          --v26;
        }

        while (v26);
      }

      uint64_t v29 = *(void *)(a4 + 40);
      if (a2)
      {
        uint64_t v30 = *(void *)(a2 + 88);
      }

      else if (qlog_debug_enabled {
             || (qlog_nwlog_enabled & 1) != 0
      }
             || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
      {
        uint64_t v63 = _os_log_pack_size();
        uint64_t v64 = (char *)&StatusReg - ((MEMORY[0x1895F8858](v63, v63) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        uint64_t v65 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v65 = 136446210;
        *(void *)(v65 + 4) = "quic_stream_get_rcvhiwat";
        qlog_internal(17, (uint64_t)v64, 371LL);
        uint64_t v30 = 0LL;
      }

      else
      {
        uint64_t v30 = 0LL;
      }

      uint64_t v31 = (uint64_t)v67;
      *(_DWORD *)uint64_t v13 = 136447490;
      *(void *)(v13 + 4) = "quic_stream_process_inner";
      *(_WORD *)(v13 + 12) = 2082;
      *(void *)(v13 + 14) = v23;
      *(_WORD *)(v13 + 22) = 2082;
      *(void *)(v13 + 24) = v16;
      *(_WORD *)(v13 + 32) = 2082;
      *(void *)(v13 + 34) = v25;
      *(_WORD *)(v13 + 42) = 2048;
      *(void *)(v13 + 44) = v29;
      *(_WORD *)(v13 + 52) = 2048;
      *(void *)(v13 + 54) = v30;
      qlog_internal(16, v31, 1171LL);
      return 0LL;
    }

    return 0LL;
  }

  unint64_t v32 = quic_reassq_append( *(unint64_t **)(a2 + 256),  a3,  *(void *)(a4 + 32),  v9,  *(_BYTE **)(a4 + 48),  *(_BYTE *)(a4 + 16) & 1);
  if ((*(_BYTE *)(a4 + 16) & 1) != 0) {
    uint64_t v33 = *(void *)(a4 + 40) + *(void *)(a4 + 32);
  }
  else {
    uint64_t v33 = -1LL;
  }
  unint64_t offset = quic_reassq_last_offset(*(void *)(a2 + 256));
  if (quic_stream_update_last_offset(a1, a2, offset, v33, *(_BYTE *)(a4 + 16) & 1) == -1)
  {
    a1[135] = "final_size invariants violated";
    a1[134] = 1LL;
    if (!qlog_debug_enabled && (qlog_nwlog_enabled & 1) == 0)
    {
      BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR);
      if (!result) {
        return result;
      }
    }

    if (a1[139])
    {
      uint64_t v35 = _os_log_pack_size();
      p_unint64_t StatusReg = &StatusReg;
      unsigned int v36 = (char *)&StatusReg - ((MEMORY[0x1895F8858](v35, v35) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v37 = _os_log_pack_fill();
      v67 = (char *)(a1 + 122);
      v38 = (unsigned __int8 *)a1[139];
      if (quic_cid_describe_state % 3 == 2) {
        uint64_t v39 = &quic_cid_describe_cid_buf2;
      }
      else {
        uint64_t v39 = &quic_cid_describe_cid_buf3;
      }
      if (quic_cid_describe_state % 3) {
        v40 = v39;
      }
      else {
        v40 = &quic_cid_describe_cid_buf1;
      }
      int v41 = ++quic_cid_describe_state;
      unsigned int v42 = v38[38];
      __int128 v43 = 0uLL;
      *(_OWORD *)((char *)v40 + 25) = 0u;
      if (v42 >= 0x14) {
        uint64_t v44 = 20LL;
      }
      else {
        uint64_t v44 = v42;
      }
      _OWORD *v40 = 0uLL;
      v40[1] = 0uLL;
      if ((_DWORD)v44)
      {
        __int128 v45 = v38 + 39;
        do
        {
          int v46 = *v45++;
          snprintf((char *)v40, 0x29uLL, "%s%02x", (const char *)v40, v46);
          --v44;
        }

        while (v44);
        v38 = (unsigned __int8 *)a1[139];
        int v41 = quic_cid_describe_state;
        __int128 v43 = 0uLL;
      }

      if (v41 % 3 == 2) {
        v47 = &quic_cid_describe_cid_buf2;
      }
      else {
        v47 = &quic_cid_describe_cid_buf3;
      }
      if (v41 % 3) {
        int v48 = v47;
      }
      else {
        int v48 = &quic_cid_describe_cid_buf1;
      }
      quic_cid_describe_state = v41 + 1;
      if (v38[17] >= 0x14u) {
        uint64_t v49 = 20LL;
      }
      else {
        uint64_t v49 = v38[17];
      }
      *int v48 = v43;
      v48[1] = v43;
      *(_OWORD *)((char *)v48 + 25) = v43;
      if ((_DWORD)v49)
      {
        v50 = v38 + 18;
        do
        {
          int v51 = *v50++;
          snprintf((char *)v48, 0x29uLL, "%s%02x", (const char *)v48, v51);
          --v49;
        }

        while (v49);
      }

      uint64_t v52 = a1[135];
      *(_DWORD *)uint64_t v37 = 136447234;
      *(void *)(v37 + 4) = "quic_stream_process_inner";
      *(_WORD *)(v37 + 12) = 2082;
      *(void *)(v37 + 14) = v67;
      *(_WORD *)(v37 + 22) = 2082;
      *(void *)(v37 + 24) = v40;
      *(_WORD *)(v37 + 32) = 2082;
      *(void *)(v37 + 34) = v48;
      *(_WORD *)(v37 + 42) = 2082;
      *(void *)(v37 + 44) = v52;
      qlog_internal(16, (uint64_t)v36, 1187LL);
    }

    return 0LL;
  }

  if (v33 != -1 && *(_BYTE *)(a2 + 251) != 2) {
    quic_fsm_recv_stream_change((_BYTE *)(a2 + 251), 2u);
  }
  if (v32)
  {
    if (__quic_signpost_is_enabled__quic_signposts_once_3645 != -1) {
      dispatch_once(&__quic_signpost_is_enabled__quic_signposts_once_3645, &__block_literal_global_3646);
    }
  }

  else
  {
    if (!quic_reassq_has_fin(*(void *)(a2 + 256))) {
      return 1LL;
    }
    if (__quic_signpost_is_enabled__quic_signposts_once_3645 != -1) {
      dispatch_once(&__quic_signpost_is_enabled__quic_signposts_once_3645, &__block_literal_global_3646);
    }
    unint64_t v32 = 0LL;
  }

  quic_stream_update_fc_credit((uint64_t)a1, a2, v32, 0);
  uint64_t v53 = *(void *)(a2 + 96);
  if (v53 == quic_reassq_fin_offset(*(void *)(a2 + 256))) {
    quic_fsm_recv_stream_change((_BYTE *)(a2 + 251), 3u);
  }
  unint64_t v54 = *(void *)(a2 + 96);
  if (v54 <= quic_reassq_fin_offset(*(void *)(a2 + 256)))
  {
    if ((*(_BYTE *)(a2 + 353) & 2) == 0)
    {
      uint64_t v55 = (uint64_t *)a1[167];
      *(void *)(a2 + 304) = 0LL;
      *(void *)(a2 + 312) = v55;
      *uint64_t v55 = a2;
      a1[167] = a2 + 304;
      *(_DWORD *)(a2 + 352) |= 0x200u;
    }

    return 1LL;
  }

  if ((qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0
                           || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
    && a1[139])
  {
    uint64_t v56 = _os_log_pack_size();
    uint64_t v57 = (char *)&StatusReg - ((MEMORY[0x1895F8858](v56, v56) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v58 = _os_log_pack_fill();
    v59 = quic_cid_describe((unsigned __int8 *)(a1[139] + 38LL));
    char v60 = quic_cid_describe((unsigned __int8 *)(a1[139] + 17LL));
    uint64_t v61 = *(void *)(a2 + 96);
    uint64_t v62 = quic_reassq_fin_offset(*(void *)(a2 + 256));
    *(_DWORD *)uint64_t v58 = 136447490;
    *(void *)(v58 + 4) = "quic_stream_process_inner";
    *(_WORD *)(v58 + 12) = 2082;
    *(void *)(v58 + 14) = a1 + 122;
    *(_WORD *)(v58 + 22) = 2082;
    *(void *)(v58 + 24) = v59;
    *(_WORD *)(v58 + 32) = 2082;
    *(void *)(v58 + 34) = v60;
    *(_WORD *)(v58 + 42) = 2048;
    *(void *)(v58 + 44) = v61;
    *(_WORD *)(v58 + 52) = 2048;
    *(void *)(v58 + 54) = v62;
    qlog_internal(16, (uint64_t)v57, 1212LL);
  }

  a1[134] = 1LL;
  a1[135] = "bytes received larger than FIN offset";
  quic_conn_close((uint64_t)a1);
  return 0LL;
}

uint64_t quic_stream_update_last_offset(void *a1, uint64_t a2, unint64_t a3, uint64_t a4, int a5)
{
  uint64_t v132 = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return -1LL;
    }

    uint64_t v105 = _os_log_pack_size();
    v106 = (char *)&v129 - ((MEMORY[0x1895F8858](v105, v105) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v107 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v107 = 136446210;
    *(void *)(v107 + 4) = "quic_stream_update_last_offset";
    uint64_t v108 = (uint64_t)v106;
    uint64_t v109 = 1506LL;
    goto LABEL_177;
  }

  if (!a2)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return -1LL;
    }

    uint64_t v110 = _os_log_pack_size();
    v111 = (char *)&v129 - ((MEMORY[0x1895F8858](v110, v110) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v112 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v112 = 136446210;
    *(void *)(v112 + 4) = "quic_stream_update_last_offset";
    uint64_t v108 = (uint64_t)v111;
    uint64_t v109 = 1507LL;
LABEL_177:
    qlog_internal(17, v108, v109);
    return -1LL;
  }

  unint64_t v8 = *(void *)(a2 + 176);
  if (v8 == -1LL || (a5 & 1) != 0)
  {
    if (v8 == -1LL && a5 != 0)
    {
      if (*(void *)(a2 + 168) > a3)
      {
        if ((qlog_debug_enabled
           || (qlog_nwlog_enabled & 1) != 0
           || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
          && a1[139])
        {
          unint64_t v131 = a3;
          uint64_t v51 = _os_log_pack_size();
          v130 = &v129;
          uint64_t v52 = (char *)&v129 - ((MEMORY[0x1895F8858](v51, v51) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          uint64_t v53 = _os_log_pack_fill();
          v129 = a1 + 122;
          unint64_t v54 = (unsigned __int8 *)a1[139];
          if (quic_cid_describe_state % 3 == 2) {
            uint64_t v55 = &quic_cid_describe_cid_buf2;
          }
          else {
            uint64_t v55 = &quic_cid_describe_cid_buf3;
          }
          if (quic_cid_describe_state % 3) {
            uint64_t v56 = v55;
          }
          else {
            uint64_t v56 = &quic_cid_describe_cid_buf1;
          }
          int v57 = ++quic_cid_describe_state;
          unsigned int v58 = v54[38];
          __int128 v59 = 0uLL;
          *(_OWORD *)((char *)v56 + 25) = 0u;
          if (v58 >= 0x14) {
            uint64_t v60 = 20LL;
          }
          else {
            uint64_t v60 = v58;
          }
          *uint64_t v56 = 0uLL;
          v56[1] = 0uLL;
          if ((_DWORD)v60)
          {
            uint64_t v61 = v54 + 39;
            do
            {
              int v62 = *v61++;
              snprintf((char *)v56, 0x29uLL, "%s%02x", (const char *)v56, v62);
              --v60;
            }

            while (v60);
            unint64_t v54 = (unsigned __int8 *)a1[139];
            int v57 = quic_cid_describe_state;
            __int128 v59 = 0uLL;
          }

          if (v57 % 3 == 2) {
            uint64_t v63 = &quic_cid_describe_cid_buf2;
          }
          else {
            uint64_t v63 = &quic_cid_describe_cid_buf3;
          }
          if (v57 % 3) {
            uint64_t v64 = v63;
          }
          else {
            uint64_t v64 = &quic_cid_describe_cid_buf1;
          }
          quic_cid_describe_state = v57 + 1;
          if (v54[17] >= 0x14u) {
            uint64_t v65 = 20LL;
          }
          else {
            uint64_t v65 = v54[17];
          }
          *uint64_t v64 = v59;
          v64[1] = v59;
          *(_OWORD *)((char *)v64 + 25) = v59;
          if ((_DWORD)v65)
          {
            uint64_t v66 = v54 + 18;
            do
            {
              int v67 = *v66++;
              snprintf((char *)v64, 0x29uLL, "%s%02x", (const char *)v64, v67);
              --v65;
            }

            while (v65);
          }

          uint64_t v68 = *(void *)a2;
          uint64_t v69 = *(void *)(a2 + 168);
          BOOL v70 = *(void *)(a2 + 176) != -1LL;
          int v71 = *(unsigned __int8 *)(a2 + 251);
          *(_DWORD *)uint64_t v53 = 136448258;
          *(void *)(v53 + 4) = "quic_stream_update_last_offset";
          *(_WORD *)(v53 + 12) = 2082;
          *(void *)(v53 + 14) = v129;
          *(_WORD *)(v53 + 22) = 2082;
          *(void *)(v53 + 24) = v56;
          *(_WORD *)(v53 + 32) = 2082;
          *(void *)(v53 + 34) = v64;
          *(_WORD *)(v53 + 42) = 2048;
          *(void *)(v53 + 44) = v68;
          *(_WORD *)(v53 + 52) = 1024;
          *(_DWORD *)(v53 + 54) = v70;
          *(_WORD *)(v53 + 58) = 1024;
          *(_DWORD *)(v53 + 60) = v71;
          *(_WORD *)(v53 + 64) = 2048;
          *(void *)(v53 + 66) = v131;
          *(_WORD *)(v53 + 74) = 2048;
          *(void *)(v53 + 76) = v69;
          qlog_internal(16, (uint64_t)v52, 1534LL);
        }

        a1[134] = 6LL;
        uint64_t v29 = "received final size lower than already received size";
        goto LABEL_166;
      }

      if (a4 == -1)
      {
        if (qlog_debug_enabled
          || (qlog_nwlog_enabled & 1) != 0
          || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
        {
          uint64_t v121 = _os_log_pack_size();
          v122 = (char *)&v129 - ((MEMORY[0x1895F8858](v121, v121) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          uint64_t v123 = _os_log_pack_fill();
          *(_DWORD *)uint64_t v123 = 136446210;
          *(void *)(v123 + 4) = "quic_stream_update_last_offset";
          qlog_internal(17, (uint64_t)v122, 1558LL);
        }

        a1[134] = 1LL;
        return -1LL;
      }

      *(void *)(a2 + 176) = a4;
      char v72 = qlog_nwlog_enabled;
      if (qlog_datapath_enabled || qlog_nwlog_enabled)
      {
        if (qlog_debug_enabled) {
          char v72 = 1;
        }
        if ((v72 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v124 = _os_log_pack_size();
          v125 = (char *)&v129 - ((MEMORY[0x1895F8858](v124, v124) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          uint64_t v126 = _os_log_pack_fill();
          uint64_t v127 = *(void *)a2;
          uint64_t v128 = *(void *)(a2 + 176);
          *(_DWORD *)uint64_t v126 = 136446722;
          *(void *)(v126 + 4) = "quic_stream_update_last_offset";
          *(_WORD *)(v126 + 12) = 2048;
          *(void *)(v126 + 14) = v127;
          *(_WORD *)(v126 + 22) = 2048;
          *(void *)(v126 + 24) = v128;
          qlog_internal(2, (uint64_t)v125, 1564LL);
        }
      }

      goto LABEL_111;
    }
  }

  else if (v8 < a3)
  {
    if ((qlog_debug_enabled
       || (qlog_nwlog_enabled & 1) != 0
       || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
      && a1[139])
    {
      unint64_t v131 = a3;
      uint64_t v9 = _os_log_pack_size();
      v130 = &v129;
      uint64_t v10 = (char *)&v129 - ((MEMORY[0x1895F8858](v9, v9) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v11 = _os_log_pack_fill();
      v129 = a1 + 122;
      uint64_t v12 = (unsigned __int8 *)a1[139];
      if (quic_cid_describe_state % 3 == 2) {
        uint64_t v13 = &quic_cid_describe_cid_buf2;
      }
      else {
        uint64_t v13 = &quic_cid_describe_cid_buf3;
      }
      if (quic_cid_describe_state % 3) {
        uint64_t v14 = v13;
      }
      else {
        uint64_t v14 = &quic_cid_describe_cid_buf1;
      }
      int v15 = ++quic_cid_describe_state;
      unsigned int v16 = v12[38];
      __int128 v17 = 0uLL;
      *(_OWORD *)((char *)v14 + 25) = 0u;
      if (v16 >= 0x14) {
        uint64_t v18 = 20LL;
      }
      else {
        uint64_t v18 = v16;
      }
      _OWORD *v14 = 0uLL;
      v14[1] = 0uLL;
      if ((_DWORD)v18)
      {
        __int128 v19 = v12 + 39;
        do
        {
          int v20 = *v19++;
          snprintf((char *)v14, 0x29uLL, "%s%02x", (const char *)v14, v20);
          --v18;
        }

        while (v18);
        uint64_t v12 = (unsigned __int8 *)a1[139];
        int v15 = quic_cid_describe_state;
        __int128 v17 = 0uLL;
      }

      if (v15 % 3 == 2) {
        char v21 = &quic_cid_describe_cid_buf2;
      }
      else {
        char v21 = &quic_cid_describe_cid_buf3;
      }
      if (v15 % 3) {
        int v22 = v21;
      }
      else {
        int v22 = &quic_cid_describe_cid_buf1;
      }
      quic_cid_describe_state = v15 + 1;
      if (v12[17] >= 0x14u) {
        uint64_t v23 = 20LL;
      }
      else {
        uint64_t v23 = v12[17];
      }
      _OWORD *v22 = v17;
      v22[1] = v17;
      *(_OWORD *)((char *)v22 + 25) = v17;
      if ((_DWORD)v23)
      {
        uint64_t v24 = v12 + 18;
        do
        {
          int v25 = *v24++;
          snprintf((char *)v22, 0x29uLL, "%s%02x", (const char *)v22, v25);
          --v23;
        }

        while (v23);
      }

      uint64_t v26 = *(void *)a2;
      uint64_t v27 = *(void *)(a2 + 176);
      int v28 = *(unsigned __int8 *)(a2 + 251);
      *(_DWORD *)uint64_t v11 = 136448258;
      *(void *)(v11 + 4) = "quic_stream_update_last_offset";
      *(_WORD *)(v11 + 12) = 2082;
      *(void *)(v11 + 14) = v129;
      *(_WORD *)(v11 + 22) = 2082;
      *(void *)(v11 + 24) = v14;
      *(_WORD *)(v11 + 32) = 2082;
      *(void *)(v11 + 34) = v22;
      *(_WORD *)(v11 + 42) = 2048;
      *(void *)(v11 + 44) = v26;
      *(_WORD *)(v11 + 52) = 1024;
      *(_DWORD *)(v11 + 54) = v27 != -1;
      *(_WORD *)(v11 + 58) = 1024;
      *(_DWORD *)(v11 + 60) = v28;
      *(_WORD *)(v11 + 64) = 2048;
      *(void *)(v11 + 66) = v131;
      *(_WORD *)(v11 + 74) = 2048;
      *(void *)(v11 + 76) = v27;
      qlog_internal(16, (uint64_t)v10, 1519LL);
    }

    a1[134] = 6LL;
    uint64_t v29 = "stream offset exceeded its final size";
LABEL_166:
    a1[135] = v29;
    return -1LL;
  }

  if (v8 != -1LL && v8 != a4 && a5)
  {
    if ((qlog_debug_enabled
       || (qlog_nwlog_enabled & 1) != 0
       || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
      && a1[139])
    {
      unint64_t v131 = a3;
      uint64_t v31 = _os_log_pack_size();
      v130 = &v129;
      unint64_t v32 = (char *)&v129 - ((MEMORY[0x1895F8858](v31, v31) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v33 = _os_log_pack_fill();
      v129 = a1 + 122;
      unint64_t v34 = (unsigned __int8 *)a1[139];
      if (quic_cid_describe_state % 3 == 2) {
        uint64_t v35 = &quic_cid_describe_cid_buf2;
      }
      else {
        uint64_t v35 = &quic_cid_describe_cid_buf3;
      }
      if (quic_cid_describe_state % 3) {
        unsigned int v36 = v35;
      }
      else {
        unsigned int v36 = &quic_cid_describe_cid_buf1;
      }
      int v37 = ++quic_cid_describe_state;
      unsigned int v38 = v34[38];
      __int128 v39 = 0uLL;
      *(_OWORD *)((char *)v36 + 25) = 0u;
      if (v38 >= 0x14) {
        uint64_t v40 = 20LL;
      }
      else {
        uint64_t v40 = v38;
      }
      *unsigned int v36 = 0uLL;
      v36[1] = 0uLL;
      if ((_DWORD)v40)
      {
        int v41 = v34 + 39;
        do
        {
          int v42 = *v41++;
          snprintf((char *)v36, 0x29uLL, "%s%02x", (const char *)v36, v42);
          --v40;
        }

        while (v40);
        unint64_t v34 = (unsigned __int8 *)a1[139];
        int v37 = quic_cid_describe_state;
        __int128 v39 = 0uLL;
      }

      if (v37 % 3 == 2) {
        __int128 v43 = &quic_cid_describe_cid_buf2;
      }
      else {
        __int128 v43 = &quic_cid_describe_cid_buf3;
      }
      if (v37 % 3) {
        uint64_t v44 = v43;
      }
      else {
        uint64_t v44 = &quic_cid_describe_cid_buf1;
      }
      quic_cid_describe_state = v37 + 1;
      if (v34[17] >= 0x14u) {
        uint64_t v45 = 20LL;
      }
      else {
        uint64_t v45 = v34[17];
      }
      *uint64_t v44 = v39;
      v44[1] = v39;
      *(_OWORD *)((char *)v44 + 25) = v39;
      if ((_DWORD)v45)
      {
        int v46 = v34 + 18;
        do
        {
          int v47 = *v46++;
          snprintf((char *)v44, 0x29uLL, "%s%02x", (const char *)v44, v47);
          --v45;
        }

        while (v45);
      }

      uint64_t v48 = *(void *)a2;
      uint64_t v49 = *(void *)(a2 + 176);
      int v50 = *(unsigned __int8 *)(a2 + 251);
      *(_DWORD *)uint64_t v33 = 136448258;
      *(void *)(v33 + 4) = "quic_stream_update_last_offset";
      *(_WORD *)(v33 + 12) = 2082;
      *(void *)(v33 + 14) = v129;
      *(_WORD *)(v33 + 22) = 2082;
      *(void *)(v33 + 24) = v36;
      *(_WORD *)(v33 + 32) = 2082;
      *(void *)(v33 + 34) = v44;
      *(_WORD *)(v33 + 42) = 2048;
      *(void *)(v33 + 44) = v48;
      *(_WORD *)(v33 + 52) = 1024;
      *(_DWORD *)(v33 + 54) = v49 != -1;
      *(_WORD *)(v33 + 58) = 1024;
      *(_DWORD *)(v33 + 60) = v50;
      *(_WORD *)(v33 + 64) = 2048;
      *(void *)(v33 + 66) = v131;
      *(_WORD *)(v33 + 74) = 2048;
      *(void *)(v33 + 76) = v49;
      qlog_internal(16, (uint64_t)v32, 1550LL);
    }

    a1[134] = 6LL;
    uint64_t v29 = "received final size different to already established final size";
    goto LABEL_166;
  }

LABEL_111:
  unint64_t v73 = *(void *)(a2 + 168);
  unint64_t v74 = a3 - v73;
  if (a3 <= v73)
  {
    unint64_t v74 = 0LL;
  }

  else
  {
    uint64_t v75 = a1[117];
    int v76 = qlog_nwlog_enabled;
    a1[117] = v75 + v74;
    if (__CFADD__(v75, v74))
    {
      if (qlog_debug_enabled) {
        LOBYTE(v76) = 1;
      }
      if ((v76 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
      {
        uint64_t v77 = _os_log_pack_size();
        v78 = (char *)&v129 - ((MEMORY[0x1895F8858](v77, v77) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v79 = _os_log_pack_fill();
        uint64_t v80 = a1[117];
        *(_DWORD *)uint64_t v79 = 136447234;
        *(void *)(v79 + 4) = "quic_stream_update_last_offset";
        *(_WORD *)(v79 + 12) = 2082;
        *(void *)(v79 + 14) = "conn->last_offset";
        *(_WORD *)(v79 + 22) = 2048;
        *(void *)(v79 + 24) = v80 - v74;
        *(_WORD *)(v79 + 32) = 2048;
        *(void *)(v79 + 34) = v74;
        *(_WORD *)(v79 + 42) = 2048;
        *(void *)(v79 + 44) = v80;
        qlog_internal(17, (uint64_t)v78, 1572LL);
        int v76 = qlog_nwlog_enabled;
      }

      else
      {
        int v76 = 0;
      }

      a1[117] = -1LL;
    }

    uint64_t v81 = *(void *)(a2 + 168);
    *(void *)(a2 + 168) = v81 + v74;
    if (__CFADD__(v81, v74))
    {
      if (qlog_debug_enabled) {
        LOBYTE(v76) = 1;
      }
      if ((v76 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
      {
        uint64_t v82 = _os_log_pack_size();
        v83 = (char *)&v129 - ((MEMORY[0x1895F8858](v82, v82) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v84 = _os_log_pack_fill();
        uint64_t v85 = *(void *)(a2 + 168);
        *(_DWORD *)uint64_t v84 = 136447234;
        *(void *)(v84 + 4) = "quic_stream_update_last_offset";
        *(_WORD *)(v84 + 12) = 2082;
        *(void *)(v84 + 14) = "stream->last_offset";
        *(_WORD *)(v84 + 22) = 2048;
        *(void *)(v84 + 24) = v85 - v74;
        *(_WORD *)(v84 + 32) = 2048;
        *(void *)(v84 + 34) = v74;
        *(_WORD *)(v84 + 42) = 2048;
        *(void *)(v84 + 44) = v85;
        qlog_internal(17, (uint64_t)v83, 1574LL);
        int v76 = qlog_nwlog_enabled;
      }

      else
      {
        int v76 = 0;
      }

      *(void *)(a2 + 168) = -1LL;
    }

    if (qlog_datapath_enabled || v76)
    {
      if (qlog_debug_enabled) {
        LOBYTE(v76) = 1;
      }
      if ((v76 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v113 = _os_log_pack_size();
        v114 = (char *)&v129 - ((MEMORY[0x1895F8858](v113, v113) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v115 = _os_log_pack_fill();
        uint64_t v116 = *(void *)a2;
        uint64_t v117 = *(void *)(a2 + 168);
        BOOL v118 = *(void *)(a2 + 176) != -1LL;
        int v119 = *(unsigned __int8 *)(a2 + 251);
        uint64_t v120 = a1[117];
        *(_DWORD *)uint64_t v115 = 136447490;
        *(void *)(v115 + 4) = "quic_stream_update_last_offset";
        *(_WORD *)(v115 + 12) = 2048;
        *(void *)(v115 + 14) = v116;
        *(_WORD *)(v115 + 22) = 1024;
        *(_DWORD *)(v115 + 24) = v118;
        *(_WORD *)(v115 + 28) = 1024;
        *(_DWORD *)(v115 + 30) = v119;
        *(_WORD *)(v115 + 34) = 2048;
        *(void *)(v115 + 36) = v120;
        *(_WORD *)(v115 + 44) = 2048;
        *(void *)(v115 + 46) = v117;
        qlog_internal(2, (uint64_t)v114, 1581LL);
      }
    }
  }

  if (quic_conn_data_blocked(a1, (uint64_t *)a2) || quic_stream_data_blocked((uint64_t *)a2))
  {
    if ((qlog_debug_enabled
       || (qlog_nwlog_enabled & 1) != 0
       || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
      && a1[139])
    {
      unint64_t v131 = a3;
      uint64_t v86 = _os_log_pack_size();
      v130 = &v129;
      v87 = (char *)&v129 - ((MEMORY[0x1895F8858](v86, v86) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v88 = _os_log_pack_fill();
      v129 = a1 + 122;
      v89 = (unsigned __int8 *)a1[139];
      if (quic_cid_describe_state % 3 == 2) {
        v90 = &quic_cid_describe_cid_buf2;
      }
      else {
        v90 = &quic_cid_describe_cid_buf3;
      }
      if (quic_cid_describe_state % 3) {
        v91 = v90;
      }
      else {
        v91 = &quic_cid_describe_cid_buf1;
      }
      int v92 = ++quic_cid_describe_state;
      unsigned int v93 = v89[38];
      __int128 v94 = 0uLL;
      *(_OWORD *)((char *)v91 + 25) = 0u;
      if (v93 >= 0x14) {
        uint64_t v95 = 20LL;
      }
      else {
        uint64_t v95 = v93;
      }
      _OWORD *v91 = 0uLL;
      v91[1] = 0uLL;
      if ((_DWORD)v95)
      {
        v96 = v89 + 39;
        do
        {
          int v97 = *v96++;
          snprintf((char *)v91, 0x29uLL, "%s%02x", (const char *)v91, v97);
          --v95;
        }

        while (v95);
        v89 = (unsigned __int8 *)a1[139];
        int v92 = quic_cid_describe_state;
        __int128 v94 = 0uLL;
      }

      if (v92 % 3 == 2) {
        v98 = &quic_cid_describe_cid_buf2;
      }
      else {
        v98 = &quic_cid_describe_cid_buf3;
      }
      if (v92 % 3) {
        v99 = v98;
      }
      else {
        v99 = &quic_cid_describe_cid_buf1;
      }
      quic_cid_describe_state = v92 + 1;
      if (v89[17] >= 0x14u) {
        uint64_t v100 = 20LL;
      }
      else {
        uint64_t v100 = v89[17];
      }
      _OWORD *v99 = v94;
      v99[1] = v94;
      *(_OWORD *)((char *)v99 + 25) = v94;
      if ((_DWORD)v100)
      {
        v101 = v89 + 18;
        do
        {
          int v102 = *v101++;
          snprintf((char *)v99, 0x29uLL, "%s%02x", (const char *)v99, v102);
          --v100;
        }

        while (v100);
      }

      uint64_t v103 = *(void *)a2;
      *(_DWORD *)uint64_t v88 = 136447490;
      *(void *)(v88 + 4) = "quic_stream_update_last_offset";
      *(_WORD *)(v88 + 12) = 2082;
      *(void *)(v88 + 14) = v129;
      *(_WORD *)(v88 + 22) = 2082;
      *(void *)(v88 + 24) = v91;
      *(_WORD *)(v88 + 32) = 2082;
      *(void *)(v88 + 34) = v99;
      *(_WORD *)(v88 + 42) = 2048;
      *(void *)(v88 + 44) = v103;
      *(_WORD *)(v88 + 52) = 2048;
      *(void *)(v88 + 54) = v131;
      qlog_internal(16, (uint64_t)v87, 1591LL);
    }

    a1[134] = 3LL;
    uint64_t v29 = "exceeded flow control limits";
    goto LABEL_166;
  }

  return v74;
}

uint64_t ____quic_signpost_is_enabled_block_invoke_3650()
{
  uint64_t result = nw_settings_get_signposts_enabled();
  __quic_signpost_is_enabled__quic_signposts_enabled_3647 = result;
  return result;
}

void quic_stream_close(uint64_t a1, uint64_t a2)
{
  v10[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if (a2)
    {
      *(_DWORD *)(a2 + 352) |= 0x40u;
      nw_protocol_instance_clear_flow_for_key();
      nw_protocol_instance_report_done();
      return;
    }

    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      uint64_t v7 = _os_log_pack_size();
      unint64_t v8 = (char *)v10 - ((MEMORY[0x1895F8858](v7, v7) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v9 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v9 = 136446210;
      *(void *)(v9 + 4) = "quic_stream_close";
      uint64_t v5 = (uint64_t)v8;
      uint64_t v6 = 1369LL;
      goto LABEL_12;
    }
  }

  else if (qlog_debug_enabled {
         || (qlog_nwlog_enabled & 1) != 0
  }
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    uint64_t v2 = _os_log_pack_size();
    v3 = (char *)v10 - ((MEMORY[0x1895F8858](v2, v2) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v4 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v4 = 136446210;
    *(void *)(v4 + 4) = "quic_stream_close";
    uint64_t v5 = (uint64_t)v3;
    uint64_t v6 = 1368LL;
LABEL_12:
    qlog_internal(17, v5, v6);
  }

void quic_stream_reset_id(uint64_t a1)
{
  if (nw_protocol_metadata_is_quic_connection())
  {
    uint64_t v2 = nw_quic_connection_copy_stream_metadata();
    if (v2)
    {
      v3 = (void *)v2;
      nw_quic_stream_set_id();
      if ((*(_BYTE *)(a1 + 353) & 0x10) == 0) {
        quic_stream_id_to_type(*(void *)a1);
      }
      nw_quic_stream_set_type();
      nw_release(v3);
    }

    uint64_t v4 = nw_protocol_metadata_copy_original();
    if (v4)
    {
      uint64_t v5 = (void *)v4;
      uint64_t v6 = nw_quic_connection_copy_stream_metadata();
      if (v6)
      {
        uint64_t v7 = (void *)v6;
        nw_quic_stream_set_id();
        if ((*(_BYTE *)(a1 + 353) & 0x10) == 0) {
          quic_stream_id_to_type(*(void *)a1);
        }
        nw_quic_stream_set_type();
        nw_release(v7);
      }

      nw_release(v5);
    }
  }

  else
  {
    nw_quic_stream_set_id();
    if ((*(_BYTE *)(a1 + 353) & 0x10) == 0) {
      quic_stream_id_to_type(*(void *)a1);
    }
    nw_quic_stream_set_type();
  }

void quic_stream_zombie_final_size(void *a1, uint64_t *a2, unint64_t a3)
{
  uint64_t v85 = *MEMORY[0x1895F89C0];
  v3 = &unk_18C6EB000;
  if (a1)
  {
    if ((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = _os_log_pack_size();
      unint64_t v8 = (char *)&v59 - ((MEMORY[0x1895F8858](v7, v7) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v9 = _os_log_pack_fill();
      uint64_t v10 = *a2;
      uint64_t v11 = a2[1];
      *(_DWORD *)uint64_t v9 = 136446978;
      *(void *)(v9 + 4) = "quic_stream_zombie_final_size";
      *(_WORD *)(v9 + 12) = 2048;
      *(void *)(v9 + 14) = v10;
      *(_WORD *)(v9 + 22) = 2048;
      *(void *)(v9 + 24) = a3;
      *(_WORD *)(v9 + 32) = 2048;
      *(void *)(v9 + 34) = v11;
      qlog_internal(2, (uint64_t)v8, 1712LL);
    }

    unint64_t v12 = a3 - 1;
    if (a3) {
      unint64_t v13 = a3 - 1;
    }
    else {
      unint64_t v13 = 0LL;
    }
    unint64_t v14 = a2[1];
    if (v14) {
      unint64_t v15 = v14 - 1;
    }
    else {
      unint64_t v15 = 0LL;
    }
    if (v14 < a3)
    {
      int v16 = qlog_debug_enabled;
      char v17 = qlog_nwlog_enabled;
      uint64_t v18 = v12 - v14;
      if (v12 < v14)
      {
        if (qlog_debug_enabled) {
          char v17 = 1;
        }
        if ((v17 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
        {
          uint64_t v19 = _os_log_pack_size();
          int v20 = (char *)&v59 - ((MEMORY[0x1895F8858](v19, v19) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          uint64_t v21 = _os_log_pack_fill();
          uint64_t v22 = a2[1];
          *(_DWORD *)uint64_t v21 = 136447234;
          *(void *)(v21 + 4) = "quic_stream_zombie_final_size";
          *(_WORD *)(v21 + 12) = 2082;
          *(void *)(v21 + 14) = "inorder_offset_delta";
          *(_WORD *)(v21 + 22) = 2048;
          *(void *)(v21 + 24) = v22 + v18;
          *(_WORD *)(v21 + 32) = 2048;
          *(void *)(v21 + 34) = v22;
          *(_WORD *)(v21 + 42) = 2048;
          *(void *)(v21 + 44) = v18;
          qlog_internal(17, (uint64_t)v20, 1724LL);
          int v16 = qlog_debug_enabled;
          char v17 = qlog_nwlog_enabled;
        }

        else
        {
          char v17 = 0;
          int v16 = 0;
        }

        uint64_t v18 = -1LL;
      }

      uint64_t v23 = a1[116];
      a1[116] = v23 + v18;
      if (__CFADD__(v23, v18))
      {
        if (v16) {
          char v17 = 1;
        }
        if ((v17 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
        {
          uint64_t v24 = _os_log_pack_size();
          int v25 = (char *)&v59 - ((MEMORY[0x1895F8858](v24, v24) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          uint64_t v26 = _os_log_pack_fill();
          uint64_t v27 = a1[116];
          *(_DWORD *)uint64_t v26 = 136447234;
          *(void *)(v26 + 4) = "quic_stream_zombie_final_size";
          *(_WORD *)(v26 + 12) = 2082;
          *(void *)(v26 + 14) = "conn->inorder_offset";
          *(_WORD *)(v26 + 22) = 2048;
          *(void *)(v26 + 24) = v27 - v18;
          *(_WORD *)(v26 + 32) = 2048;
          *(void *)(v26 + 34) = v18;
          *(_WORD *)(v26 + 42) = 2048;
          *(void *)(v26 + 44) = v27;
          qlog_internal(17, (uint64_t)v25, 1726LL);
          v3 = &unk_18C6EB000;
          int v28 = qlog_debug_enabled;
          char v17 = qlog_nwlog_enabled;
        }

        else
        {
          char v17 = 0;
          int v28 = 0;
          v3 = &unk_18C6EB000;
        }

        a1[116] = -1LL;
        if (v28) {
          goto LABEL_33;
        }
      }

      else
      {
        v3 = (_BYTE *)&unk_18C6EB000;
        if (v16)
        {
LABEL_33:
          uint64_t v29 = _os_log_pack_size();
          uint64_t v30 = (char *)&v59 - ((MEMORY[0x1895F8858](v29, v29) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          uint64_t v31 = _os_log_pack_fill();
          uint64_t v32 = *a2;
          uint64_t v33 = a1[116];
          *(_DWORD *)uint64_t v31 = 136446722;
          *(void *)(v31 + 4) = "quic_stream_zombie_final_size";
          *(_WORD *)(v31 + 12) = 2048;
          *(void *)(v31 + 14) = v32;
          *(_WORD *)(v31 + 22) = 2048;
          *(void *)(v31 + 24) = v33;
          qlog_internal(2, (uint64_t)v30, 1729LL);
          goto LABEL_34;
        }
      }

      if ((v17 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_33;
      }
    }

LABEL_69:
    a1[103] = v55;
    goto LABEL_70;
  }

  if ((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    uint64_t v56 = _os_log_pack_size();
    int v57 = (char *)&v59 - ((MEMORY[0x1895F8858](v56, v56) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v58 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v58 = 136446210;
    *(void *)(v58 + 4) = "quic_stream_zombie_final_size";
    qlog_internal(17, (uint64_t)v57, 1707LL);
  }

  quic_send_max_streams_uni(*(void *)(a1 + 40), v3);
}

  quic_send_max_streams_bidi(*(void **)(a1 + 40), v4);
}

void quic_stream_app_read(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v34[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if (a2)
    {
      if (__quic_signpost_is_enabled__quic_signposts_once_3645 != -1) {
        dispatch_once(&__quic_signpost_is_enabled__quic_signposts_once_3645, &__block_literal_global_3646);
      }
      char v6 = qlog_nwlog_enabled;
      if (qlog_datapath_enabled || qlog_nwlog_enabled)
      {
        if (qlog_debug_enabled) {
          char v6 = 1;
        }
        if ((v6 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v19 = _os_log_pack_size();
          int v20 = (char *)v34 - ((MEMORY[0x1895F8858](v19, v19) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          uint64_t v21 = _os_log_pack_fill();
          uint64_t v22 = *(void *)a1;
          *(_DWORD *)uint64_t v21 = 136446722;
          *(void *)(v21 + 4) = "quic_stream_app_read";
          *(_WORD *)(v21 + 12) = 2048;
          *(void *)(v21 + 14) = v22;
          *(_WORD *)(v21 + 22) = 2048;
          *(void *)(v21 + 24) = a3;
          qlog_internal(2, (uint64_t)v20, 1784LL);
        }
      }

      *(void *)(a1 + 104) += a3;
      *(void *)(a1 + 120) += a3;
      *(void *)(a2 + 904) += a3;
      *(void *)(a2 + 944) += a3;
      if ((*(_BYTE *)(a1 + 354) & 1) == 0) {
        *(void *)(a2 + 928) += quic_reassq_inorder_offset(*(void *)(a1 + 256)) - *(void *)(a1 + 160);
      }
      *(void *)(a1 + 160) = quic_reassq_inorder_offset(*(void *)(a1 + 256));
      unint64_t v7 = quic_stream_inorder_unread(a1);
      unint64_t v8 = *(void *)(a1 + 152);
      unint64_t v9 = quic_stream_inorder_unread(a1);
      if (v7 > v8) {
        unint64_t v8 = *(void *)(a1 + 152);
      }
      *(void *)(a2 + 920) += v9 - v8;
      unint64_t v10 = quic_stream_inorder_unread(a1);
      *(void *)(a1 + 152) = v10;
      *(void *)(a1 + 80) = (*(void *)(a1 + 88) - v10) & ~((uint64_t)(*(void *)(a1 + 88) - v10) >> 63);
      if (*(void *)(a2 + 904) > *(void *)(a2 + 928)
        && (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT)))
      {
        uint64_t v23 = _os_log_pack_size();
        uint64_t v24 = (char *)v34 - ((MEMORY[0x1895F8858](v23, v23) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v25 = _os_log_pack_fill();
        uint64_t v26 = *(void *)(a2 + 904);
        uint64_t v27 = *(void *)(a2 + 928);
        *(_DWORD *)uint64_t v25 = 136446722;
        *(void *)(v25 + 4) = "quic_stream_app_read";
        *(_WORD *)(v25 + 12) = 2048;
        *(void *)(v25 + 14) = v26;
        *(_WORD *)(v25 + 22) = 2048;
        *(void *)(v25 + 24) = v27;
        qlog_internal(17, (uint64_t)v24, 1818LL);
      }

      if (*(void *)(a1 + 104) > *(void *)(a1 + 160)
        && (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT)))
      {
        uint64_t v28 = _os_log_pack_size();
        uint64_t v29 = (char *)v34 - ((MEMORY[0x1895F8858](v28, v28) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v30 = _os_log_pack_fill();
        uint64_t v31 = *(void *)a1;
        uint64_t v32 = *(void *)(a1 + 104);
        uint64_t v33 = *(void *)(a1 + 160);
        *(_DWORD *)uint64_t v30 = 136446978;
        *(void *)(v30 + 4) = "quic_stream_app_read";
        *(_WORD *)(v30 + 12) = 2048;
        *(void *)(v30 + 14) = v31;
        *(_WORD *)(v30 + 22) = 2048;
        *(void *)(v30 + 24) = v32;
        *(_WORD *)(v30 + 32) = 2048;
        *(void *)(v30 + 34) = v33;
        qlog_internal(17, (uint64_t)v29, 1824LL);
      }

      if (*(_BYTE *)(a1 + 251) != 1) {
        goto LABEL_21;
      }
      uint64_t v11 = 80LL;
      if ((*(_BYTE *)(a1 + 354) & 2) == 0) {
        uint64_t v11 = 48LL;
      }
      if (*(void *)(a1 + 120) > *(void *)(a1 + v11) >> 1)
      {
        quic_stream_send_fc_credit(a2, a1);
      }

      else
      {
LABEL_21:
        if (*(_BYTE *)(a2 + 477) == 9)
        {
          uint64_t v12 = 880LL;
          if ((*(_BYTE *)(a2 + 1382) & 4) == 0) {
            uint64_t v12 = 856LL;
          }
          if (*(void *)(a2 + 944) > *(void *)(a2 + v12) >> 1) {
            quic_conn_send_fc_credit(a2);
          }
        }
      }

      if (*(_BYTE *)(a1 + 251) == 5 && (*(_DWORD *)(a1 + 352) & 0x2040) == 0x2000)
      {
        *(_DWORD *)(a1 + 352) |= 0x40u;
        nw_protocol_instance_clear_flow_for_key();
        nw_protocol_instance_report_done();
      }
    }

    else if (qlog_debug_enabled {
           || (qlog_nwlog_enabled & 1) != 0
    }
           || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      uint64_t v16 = _os_log_pack_size();
      char v17 = (char *)v34 - ((MEMORY[0x1895F8858](v16, v16) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v18 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v18 = 136446210;
      *(void *)(v18 + 4) = "quic_stream_app_read";
      qlog_internal(17, (uint64_t)v17, 1780LL);
    }
  }

  else if (qlog_debug_enabled {
         || (qlog_nwlog_enabled & 1) != 0
  }
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    uint64_t v13 = _os_log_pack_size();
    unint64_t v14 = (char *)v34 - ((MEMORY[0x1895F8858](v13, v13) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v15 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v15 = 136446210;
    *(void *)(v15 + 4) = "quic_stream_app_read";
    qlog_internal(17, (uint64_t)v14, 1779LL);
  }

uint64_t quic_conn_allocate()
{
  if (quic_init_onceToken != -1) {
    dispatch_once(&quic_init_onceToken, &__block_literal_global_4593);
  }
  v0 = calloc(1uLL, 0x570uLL);
  if (!v0)
  {
    uint64_t v11 = 1392LL;
    goto LABEL_14;
  }

  v1 = v0;
  v0[298] = 1200;
  v0[239] = 1200;
  *((void *)v0 + 106) = 0xFFFFLL;
  uint64_t v2 = calloc(1uLL, 0x18uLL);
  if (!v2)
  {
    uint64_t v11 = 24LL;
    goto LABEL_14;
  }

  *uint64_t v2 = 0LL;
  v2[1] = v2;
  *((void *)v1 + 4) = v2;
  *((void *)v1 + 82) = -1LL;
  *((void *)v1 + 83) = -1LL;
  *((void *)v1 + 88) = -4LL;
  *((void *)v1 + 92) = -1LL;
  *((void *)v1 + 93) = -1LL;
  *((void *)v1 + 98) = -4LL;
  int64x2_t v3 = vdupq_n_s64(0xFFFFFFFFFFFFFFFCLL);
  *((int64x2_t *)v1 + 43) = v3;
  *((int64x2_t *)v1 + 48) = v3;
  *((void *)v1 + 90) = 0LL;
  *((void *)v1 + 91) = v1 + 360;
  *((void *)v1 + 100) = 0LL;
  *((void *)v1 + 101) = v1 + 400;
  *((void *)v1 + 102) = 0LL;
  *((void *)v1 + 103) = v1 + 408;
  *((int64x2_t *)v1 + 33) = vdupq_n_s64(3uLL);
  *((void *)v1 + 1) = nw_quic_create_connection_metadata();
  *((_BYTE *)v1 + 600) = 1;
  uint64_t v4 = calloc(1uLL, 0x10uLL);
  if (!v4)
  {
LABEL_10:
    uint64_t v11 = 16LL;
LABEL_14:
    uint64_t v12 = qlog_abort_internal("%s strict_calloc(%zu, %zu) failed", "strict_calloc", 1uLL, v11);
    return quic_conn_deallocate(v12);
  }

  uint64_t v5 = v4;
  *uint64_t v4 = 10;
  char v6 = calloc(0xAuLL, 0x30uLL);
  if (v6)
  {
    *((void *)v5 + 1) = v6;
    *((void *)v1 + 47) = v5;
    unint64_t v7 = calloc(1uLL, 0x10uLL);
    if (v7)
    {
      unint64_t v8 = v7;
      *unint64_t v7 = 10;
      unint64_t v9 = calloc(0xAuLL, 0x30uLL);
      if (v9)
      {
        *((void *)v8 + 1) = v9;
        *((void *)v1 + 48) = v8;
        *((void *)v1 + 168) = 0LL;
        *((void *)v1 + 169) = v1 + 672;
        *((void *)v1 + 166) = 0LL;
        *((void *)v1 + 167) = v1 + 664;
        *((void *)v1 + 104) = 0LL;
        *((void *)v1 + 105) = v1 + 416;
        nw_frame_array_init();
        nw_frame_array_init();
        nw_frame_array_init();
        nw_frame_array_init();
        *(void *)(v1 + 690) &= 0xFFFFFFFFFBFFF3FFLL;
        return (uint64_t)v1;
      }

      goto LABEL_11;
    }

    goto LABEL_10;
  }

void quic_conn_deallocate(uint64_t a1, uint64_t a2)
{
  v30[1] = *MEMORY[0x1895F89C0];
  if (a2)
  {
    nw_quic_connection_set_max_data_handler();
    nw_quic_connection_set_max_stream_data_bidirectional_local_handler();
    nw_quic_connection_set_max_stream_data_bidirectional_remote_handler();
    nw_quic_connection_set_max_stream_data_unidirectional_handler();
    nw_quic_connection_set_local_max_streams_bidirectional_handler();
    nw_quic_connection_set_local_max_streams_unidirectional_handler();
    nw_quic_connection_get_local_max_streams_bidirectional_handler();
    nw_quic_connection_get_local_max_streams_unidirectional_handler();
    nw_quic_connection_get_remote_max_streams_bidirectional_handler();
    nw_quic_connection_get_remote_max_streams_unidirectional_handler();
    nw_quic_connection_set_close_with_error_handler();
    nw_quic_connection_set_keepalive_handler();
    nw_quic_connection_set_application_result_handler();
    nw_quic_connection_get_application_result_handler();
    nw_quic_connection_inject_packet_handler();
    nw_quic_connection_get_peer_idle_timeout_handler();
    nw_quic_connection_get_keepalive_handler();
    nw_quic_connection_set_link_flow_controlled_handler();
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v4 = _os_log_pack_size();
      uint64_t v5 = (char *)v30 - ((MEMORY[0x1895F8858](v4, v4) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v6 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v6 = 136446210;
      *(void *)(v6 + 4) = "quic_conn_deallocate";
      qlog_internal(2, (uint64_t)v5, 126LL);
    }

    unint64_t v7 = *(void ***)(a2 + 1120);
    if (v7)
    {
      _quic_migration_destroy(v7);
      *(void *)(a2 + 1120) = 0LL;
    }

    unint64_t v8 = *(unsigned __int8 ***)(a2 + 32);
    if (v8)
    {
      _quic_crypto_queue_destroy(v8, v3);
      *(void *)(a2 + 32) = 0LL;
    }

    if (*(void *)(a2 + 24)
      && (qlog_debug_enabled
       || (qlog_nwlog_enabled & 1) != 0
       || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT)))
    {
      uint64_t v9 = _os_log_pack_size();
      unint64_t v10 = (char *)v30 - ((MEMORY[0x1895F8858](v9, v9) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v11 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v11 = 136446210;
      *(void *)(v11 + 4) = "quic_conn_deallocate";
      qlog_internal(17, (uint64_t)v10, 136LL);
    }

    uint64_t v12 = *(dispatch_object_s **)(a2 + 16);
    if (v12)
    {
      dispatch_release(v12);
      *(void *)(a2 + 16) = 0LL;
    }

    uint64_t v13 = *(char **)(a2 + 568);
    if (v13)
    {
      _quic_protector_destroy(v13);
      *(void *)(a2 + 568) = 0LL;
    }

    unint64_t v14 = *(void **)(a2 + 960);
    if (v14)
    {
      _quic_ack_destroy(v14);
      *(void *)(a2 + 960) = 0LL;
    }

    uint64_t v15 = *(void **)(a2 + 552);
    if (v15)
    {
      free(v15);
      *(void *)(a2 + 552) = 0LL;
    }

    uint64_t v16 = *(void **)(a2 + 544);
    if (v16)
    {
      free(v16);
      *(void *)(a2 + 544) = 0LL;
    }

    quic_cid_array_destroy(*(void **)(a2 + 376));
    quic_cid_array_destroy(*(void **)(a2 + 384));
    char v17 = *(void **)(a2 + 8);
    if (v17)
    {
      nw_release(v17);
      *(void *)(a2 + 8) = 0LL;
    }

    uint64_t v18 = *(void *)(a2 + 952);
    if (v18)
    {
      _quic_recovery_destroy(v18);
      *(void *)(a2 + 952) = 0LL;
    }

    uint64_t v19 = *(void **)(a2 + 968);
    if (v19)
    {
      free(v19);
      *(void *)(a2 + 968) = 0LL;
    }

    int v20 = *(void **)(a2 + 1128);
    if (v20)
    {
      free(v20);
      *(void *)(a2 + 1128) = 0LL;
    }

    uint64_t v21 = *(void **)(a2 + 1136);
    if (v21)
    {
      os_release(v21);
      *(void *)(a2 + 1136) = 0LL;
    }

    uint64_t v22 = *(void ***)(a2 + 576);
    if (v22)
    {
      quic_timer_destroy(v22);
      *(void *)(a2 + 576) = 0LL;
    }

    uint64_t v23 = *(void **)(a2 + 1104);
    if (v23)
    {
      nw_release(v23);
      *(void *)(a2 + 1104) = 0LL;
    }

    while (1)
    {
      uint64_t v25 = *(void **)(a2 + 816);
      if (!v25) {
        break;
      }
      uint64_t v26 = v25[3];
      uint64_t v24 = (void *)v25[4];
      if (v26)
      {
        *(void *)(v26 + 32) = v24;
        uint64_t v24 = (void *)v25[4];
      }

      else
      {
        *(void *)(a2 + 824) = v24;
      }

      *uint64_t v24 = v26;
      free(v25);
    }

    free((void *)a2);
  }

  else if (qlog_debug_enabled {
         || (qlog_nwlog_enabled & 1) != 0
  }
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    uint64_t v27 = _os_log_pack_size();
    uint64_t v28 = (char *)v30 - ((MEMORY[0x1895F8858](v27, v27) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v29 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v29 = 136446210;
    *(void *)(v29 + 4) = "quic_conn_deallocate";
    qlog_internal(17, (uint64_t)v28, 121LL);
  }

BOOL quic_conn_initialize(uint64_t a1, char a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if (quic_conn_initialize_once_token[0] != -1) {
      dispatch_once(quic_conn_initialize_once_token, &__block_literal_global_3742);
    }
    nw_protocol_instance_set_limit_outbound_data();
    nw_protocol_instance_set_is_datagram();
    v8[1] = MEMORY[0x1895F87A8];
    v8[2] = 0x40000000LL;
    v8[3] = __quic_conn_initialize_block_invoke_2;
    v8[4] = &__block_descriptor_tmp_3_3743;
    v8[5] = a1;
    char v9 = a2;
    nw_protocol_instance_access_state();
  }

  else if (qlog_debug_enabled {
         || (qlog_nwlog_enabled & 1) != 0
  }
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    uint64_t v5 = _os_log_pack_size();
    uint64_t v6 = (char *)v8 - ((MEMORY[0x1895F8858](v5, v5) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v7 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v7 = 136446210;
    *(void *)(v7 + 4) = "quic_conn_initialize";
    qlog_internal(17, (uint64_t)v6, 648LL);
  }

  return a1 != 0;
}

uint64_t __quic_conn_initialize_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return 1LL;
}

uint64_t __quic_conn_initialize_block_invoke_3(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(a1 + 32) + 1320LL) = a2;
  return 1LL;
}

void quic_conn_initialize_inner(uint64_t a1, void *a2, unsigned int a3)
{
  uint64_t v205 = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      uint64_t v86 = _os_log_pack_size();
      v87 = (char *)&v98 - ((MEMORY[0x1895F8858](v86, v86) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v88 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v88 = 136446210;
      *(void *)(v88 + 4) = "quic_conn_initialize_inner";
      qlog_internal(17, (uint64_t)v87, 196LL);
    }

    return;
  }

  uint64_t v111 = 0LL;
  uint64_t v112 = &v111;
  uint64_t v113 = 0x2000000000LL;
  uint64_t v114 = 0LL;
  uint64_t v5 = (unint64_t *)(a1 + 1380);
  *(void *)(a1 + 1380) = *(void *)(a1 + 1380) & 0xFFFFFFFFFFFFFFFELL | a3;
  if (a3) {
    size_t size = 8LL;
  }
  else {
    size_t size = 0LL;
  }
  int level = nw_protocol_instance_get_level();
  int v8 = level != 3;
  uint64_t v106 = *MEMORY[0x189608EB8];
  char v9 = (void *)nw_protocol_instance_copy_options();
  if (!v9)
  {
    int probe_simultaneously = 0;
    LODWORD(v108) = 1;
    goto LABEL_58;
  }

  uint64_t v103 = a1 + 976;
  nw_protocol_options_get_log_id_str();
  *(_WORD *)(a1 + 594) = nw_protocol_options_get_log_id_num();
  if (nw_protocol_options_is_quic_stream())
  {
    uint64_t v10 = nw_quic_stream_copy_shared_connection_options();
    nw_release(v9);
    char v9 = (void *)v10;
  }

  *(_WORD *)(a1 + 596) = nw_quic_connection_get_initial_packet_size();
  v112[3] = nw_quic_connection_get_source_connection_id();
  int v8 = 0;
  *(_WORD *)(a1 + 590) = nw_quic_connection_get_keepalive_count();
  *(_WORD *)(a1 + 592) = 0;
  if (level != 3) {
    int v8 = nw_quic_connection_get_migration_for_non_transport() ^ 1;
  }
  uint64_t v11 = 1LL;
  LODWORD(v107) = 1;
  if (!quic_enable_multipath) {
    LODWORD(v107) = nw_quic_connection_get_enable_multipath();
  }
  uint64_t max_paths_per_interface = nw_quic_connection_get_max_paths_per_interface();
  *(_DWORD *)(a1 + 604) = nw_quic_connection_get_stream_path_affinity();
  uint64_t v13 = (void *)nw_quic_connection_copy_sec_protocol_options();
  quic_crypto_intercept_alpn();
  *(_DWORD *)(a1 + 1376) = 1;
  if ((nw_quic_connection_get_disable_spin_bit() & 1) != 0)
  {
    *v5 &= ~0x40uLL;
    int spin_bit_value = nw_quic_connection_get_spin_bit_value();
    uint64_t v15 = 0x2000LL;
    if (!spin_bit_value) {
      uint64_t v15 = 0LL;
    }
    goto LABEL_19;
  }

  uint32_t v17 = arc4random_uniform(0x10u);
  *uint64_t v5 = *v5 & 0xFFFFFFFFFFFFFFBFLL | ((unint64_t)(v17 != 0) << 6);
  if (!v17)
  {
    uint64_t v15 = (arc4random() >> 18) & 0x2000;
LABEL_19:
    *uint64_t v5 = *v5 & 0xFFFFFFFFFFFFDFFFLL | v15;
  }

  uint64_t v200 = 0LL;
  uint64_t v195 = 0LL;
  uint64_t v190 = 0LL;
  uint64_t v185 = 0LL;
  uint64_t v180 = 0LL;
  uint64_t v175 = 0LL;
  LODWORD(v108) = max_paths_per_interface;
  if (nw_quic_get_remote_transport_parameters())
  {
    if ((qlog_debug_enabled
       || (qlog_nwlog_enabled & 1) != 0
       || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))
      && *(void *)(a1 + 1112))
    {
      v101 = v13;
      v104 = v5;
      size_t v105 = size;
      uint64_t v18 = _os_log_pack_size();
      uint64_t v100 = &v98;
      uint64_t v19 = MEMORY[0x1895F8858](v18, v18);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v99 = (uint64_t)&v98 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v11 = _os_log_pack_fill();
      int v20 = *(unsigned __int8 **)(a1 + 1112);
      if (quic_cid_describe_state % 3 == 2) {
        uint64_t v21 = &quic_cid_describe_cid_buf2;
      }
      else {
        uint64_t v21 = &quic_cid_describe_cid_buf3;
      }
      if (quic_cid_describe_state % 3) {
        uint64_t v22 = v21;
      }
      else {
        uint64_t v22 = &quic_cid_describe_cid_buf1;
      }
      int v23 = ++quic_cid_describe_state;
      unsigned int v24 = v20[38];
      __int128 v25 = 0uLL;
      *(_OWORD *)((char *)v22 + 25) = 0u;
      if (v24 >= 0x14) {
        uint64_t v26 = 20LL;
      }
      else {
        uint64_t v26 = v24;
      }
      _OWORD *v22 = 0uLL;
      v22[1] = 0uLL;
      int v102 = v8;
      if ((_DWORD)v26)
      {
        uint64_t v27 = v20 + 39;
        do
        {
          int v28 = *v27++;
          snprintf((char *)v22, 0x29uLL, "%s%02x", (const char *)v22, v28);
          --v26;
        }

        while (v26);
        int v20 = *(unsigned __int8 **)(a1 + 1112);
        int v23 = quic_cid_describe_state;
        __int128 v25 = 0uLL;
      }

      if (v23 % 3 == 2) {
        uint64_t v29 = &quic_cid_describe_cid_buf2;
      }
      else {
        uint64_t v29 = &quic_cid_describe_cid_buf3;
      }
      if (v23 % 3) {
        uint64_t max_paths_per_interface = (uint64_t)v29;
      }
      else {
        uint64_t max_paths_per_interface = (uint64_t)&quic_cid_describe_cid_buf1;
      }
      quic_cid_describe_state = v23 + 1;
      if (v20[17] >= 0x14u) {
        uint64_t v30 = 20LL;
      }
      else {
        uint64_t v30 = v20[17];
      }
      *(_OWORD *)uint64_t max_paths_per_interface = v25;
      *(_OWORD *)(max_paths_per_interface + 16) = v25;
      *(_OWORD *)(max_paths_per_interface + 25) = v25;
      if ((_DWORD)v30)
      {
        uint64_t v31 = v20 + 18;
        do
        {
          int v32 = *v31++;
          snprintf((char *)max_paths_per_interface, 0x29uLL, "%s%02x", (const char *)max_paths_per_interface, v32);
          --v30;
        }

        while (v30);
      }

      *(_DWORD *)uint64_t v11 = 136446978;
      *(void *)(v11 + 4) = "quic_conn_initialize_inner";
      *(_WORD *)(v11 + 12) = 2082;
      *(void *)(v11 + 14) = v103;
      *(_WORD *)(v11 + 22) = 2082;
      *(void *)(v11 + 24) = v22;
      *(_WORD *)(v11 + 32) = 2082;
      *(void *)(v11 + 34) = max_paths_per_interface;
      qlog_internal(1, v99, 297LL);
      uint64_t v13 = v101;
      uint64_t v5 = v104;
      size_t size = v105;
      int v8 = v102;
    }

    uint64_t v33 = calloc(1uLL, 0x698uLL);
    if (!v33)
    {
      uint64_t v89 = 1688LL;
      goto LABEL_154;
    }

    unint64_t v34 = v33;
    v33[30] = 65527LL;
    v33[100] = 3LL;
    v33[110] = 25LL;
    *((_DWORD *)v33 + 420) = arc4random();
    *(void *)(a1 + 544) = v34;
    quic_tp_set(v34, 5LL, v200);
    quic_tp_set(*(void **)(a1 + 544), 6LL, v195);
    quic_tp_set(*(void **)(a1 + 544), 4LL, v190);
    quic_tp_set(*(void **)(a1 + 544), 7LL, v185);
    quic_tp_set(*(void **)(a1 + 544), 8LL, v180);
    quic_tp_set(*(void **)(a1 + 544), 9LL, v175);
  }

  int probe_simultaneously = nw_quic_connection_get_probe_simultaneously();
  if (v13) {
    nw_release(v13);
  }
  if (v9) {
    nw_release(v9);
  }
  LODWORD(v9) = v107;
LABEL_58:
  uint64_t v35 = nw_retain(a2);
  *(void *)a1 = v35;
  unsigned int v36 = *(unsigned __int16 *)(a1 + 596);
  LODWORD(v107) = probe_simultaneously;
  if (v36 <= 0x4AF)
  {
    *(_WORD *)(a1 + 596) = 1200;
    goto LABEL_75;
  }

  uint64_t v37 = v35;
  char v38 = qlog_nwlog_enabled;
  if (qlog_datapath_enabled || qlog_nwlog_enabled)
  {
    if (qlog_debug_enabled) {
      char v38 = 1;
    }
    if ((v38 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v90 = _os_log_pack_size();
      v91 = (char *)&v98 - ((MEMORY[0x1895F8858](v90, v90) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v92 = _os_log_pack_fill();
      int v93 = *(unsigned __int16 *)(a1 + 596);
      *(_DWORD *)uint64_t v92 = 136446466;
      *(void *)(v92 + 4) = "quic_conn_initialize_inner";
      *(_WORD *)(v92 + 12) = 1024;
      *(_DWORD *)(v92 + 14) = v93;
      qlog_internal(2, (uint64_t)v91, 333LL);
      uint64_t v37 = *(void **)a1;
    }
  }

  if (v37)
  {
    uint64_t v39 = nw_protocol_instance_copy_path();
    if (v39)
    {
      uint64_t v11 = v39;
      size_t v40 = size;
      LODWORD(size) = (_DWORD)v9;
      LOBYTE(v9) = v8;
      size_t v105 = v40;
      unsigned __int16 mtu = nw_path_get_mtu();
      unsigned int v42 = (nw_endpoint *)nw_path_copy_endpoint();
      if (v42)
      {
        __int128 v43 = v42;
        if (nw_endpoint_get_type(v42) == nw_endpoint_type_address)
        {
          sa_family_t sa_family = nw_endpoint_get_address(v43)->sa_family;
          int v102 = v8;
          LODWORD(v9) = sa_family;
          nw_release(v43);
          BOOL v45 = (_DWORD)v9 == 30;
          LOBYTE(v9) = v102;
          if (v45) {
            int v46 = -48;
          }
          else {
            int v46 = -28;
          }
LABEL_71:
          int v47 = v46 + mtu;
          uint64_t max_paths_per_interface = v105;
          if (v47 < *(unsigned __int16 *)(a1 + 596))
          {
            *(_WORD *)(a1 + 596) = v47;
            char v48 = qlog_nwlog_enabled;
            if (qlog_datapath_enabled || qlog_nwlog_enabled) {
              goto LABEL_155;
            }
          }

          goto LABEL_74;
        }

        nw_release(v43);
      }

      int v46 = -28;
      goto LABEL_71;
    }
  }

  while (1)
  {
LABEL_75:
    uint64_t max_paths_per_interface = MEMORY[0x1895F87A8];
    if (*(void *)(a1 + 8))
    {
      uint64_t v200 = MEMORY[0x1895F87A8];
      uint64_t v201 = 0x40000000LL;
      v202 = __quic_conn_set_metadata_handlers_block_invoke;
      v203 = &__block_descriptor_tmp_9_3789;
      uint64_t v204 = a1;
      nw_quic_connection_set_max_data_handler();
      uint64_t v195 = max_paths_per_interface;
      uint64_t v196 = 0x40000000LL;
      v197 = __quic_conn_set_metadata_handlers_block_invoke_10;
      v198 = &__block_descriptor_tmp_15;
      uint64_t v199 = a1;
      nw_quic_connection_set_max_stream_data_bidirectional_local_handler();
      uint64_t v190 = max_paths_per_interface;
      uint64_t v191 = 0x40000000LL;
      v192 = __quic_conn_set_metadata_handlers_block_invoke_16;
      v193 = &__block_descriptor_tmp_21_3790;
      uint64_t v194 = a1;
      nw_quic_connection_set_max_stream_data_bidirectional_remote_handler();
      uint64_t v185 = max_paths_per_interface;
      uint64_t v186 = 0x40000000LL;
      v187 = __quic_conn_set_metadata_handlers_block_invoke_22;
      v188 = &__block_descriptor_tmp_27_3791;
      uint64_t v189 = a1;
      nw_quic_connection_set_max_stream_data_unidirectional_handler();
      uint64_t v180 = max_paths_per_interface;
      uint64_t v181 = 0x40000000LL;
      v182 = __quic_conn_set_metadata_handlers_block_invoke_28;
      v183 = &__block_descriptor_tmp_32_3792;
      uint64_t v184 = a1;
      nw_quic_connection_set_local_max_streams_bidirectional_handler();
      uint64_t v175 = max_paths_per_interface;
      uint64_t v176 = 0x40000000LL;
      v177 = __quic_conn_set_metadata_handlers_block_invoke_33;
      v178 = &__block_descriptor_tmp_36;
      uint64_t v179 = a1;
      nw_quic_connection_set_local_max_streams_unidirectional_handler();
      uint64_t v170 = max_paths_per_interface;
      uint64_t v171 = 0x40000000LL;
      v172 = __quic_conn_set_metadata_handlers_block_invoke_37;
      v173 = &__block_descriptor_tmp_40_3793;
      uint64_t v174 = a1;
      nw_quic_connection_set_close_with_error_handler();
      uint64_t v165 = max_paths_per_interface;
      uint64_t v166 = 0x40000000LL;
      v167 = __quic_conn_set_metadata_handlers_block_invoke_3_41;
      v168 = &__block_descriptor_tmp_44;
      uint64_t v169 = a1;
      nw_quic_connection_set_keepalive_handler();
      uint64_t v160 = max_paths_per_interface;
      uint64_t v161 = 0x40000000LL;
      v162 = __quic_conn_set_metadata_handlers_block_invoke_5;
      v163 = &__block_descriptor_tmp_46;
      uint64_t v164 = a1;
      nw_quic_connection_get_local_max_streams_bidirectional_handler();
      uint64_t v155 = max_paths_per_interface;
      uint64_t v156 = 0x40000000LL;
      v157 = __quic_conn_set_metadata_handlers_block_invoke_47;
      v158 = &__block_descriptor_tmp_48;
      uint64_t v159 = a1;
      nw_quic_connection_get_local_max_streams_unidirectional_handler();
      uint64_t v150 = max_paths_per_interface;
      uint64_t v151 = 0x40000000LL;
      v152 = __quic_conn_set_metadata_handlers_block_invoke_49;
      v153 = &__block_descriptor_tmp_50_3794;
      uint64_t v154 = a1;
      nw_quic_connection_get_remote_max_streams_bidirectional_handler();
      uint64_t v145 = max_paths_per_interface;
      uint64_t v146 = 0x40000000LL;
      v147 = __quic_conn_set_metadata_handlers_block_invoke_51;
      v148 = &__block_descriptor_tmp_52;
      uint64_t v149 = a1;
      nw_quic_connection_get_remote_max_streams_unidirectional_handler();
      uint64_t v140 = max_paths_per_interface;
      uint64_t v141 = 0x40000000LL;
      v142 = __quic_conn_set_metadata_handlers_block_invoke_53;
      v143 = &__block_descriptor_tmp_54_3795;
      uint64_t v144 = a1;
      nw_quic_connection_get_peer_idle_timeout_handler();
      uint64_t v135 = max_paths_per_interface;
      uint64_t v136 = 0x40000000LL;
      v137 = __quic_conn_set_metadata_handlers_block_invoke_2_55;
      v138 = &__block_descriptor_tmp_57;
      uint64_t v139 = a1;
      nw_quic_connection_get_keepalive_handler();
      uint64_t v130 = max_paths_per_interface;
      uint64_t v131 = 0x40000000LL;
      uint64_t v132 = __quic_conn_set_metadata_handlers_block_invoke_3_58;
      v133 = &__block_descriptor_tmp_62_3796;
      uint64_t v134 = a1;
      nw_quic_connection_set_application_result_handler();
      uint64_t v125 = max_paths_per_interface;
      uint64_t v126 = 0x40000000LL;
      uint64_t v127 = __quic_conn_set_metadata_handlers_block_invoke_63;
      uint64_t v128 = &__block_descriptor_tmp_67;
      uint64_t v129 = a1;
      nw_quic_connection_get_application_result_handler();
      uint64_t v120 = max_paths_per_interface;
      uint64_t v121 = 0x40000000LL;
      v122 = __quic_conn_set_metadata_handlers_block_invoke_3_68;
      uint64_t v123 = &__block_descriptor_tmp_72_3797;
      uint64_t v124 = a1;
      nw_quic_connection_inject_packet_handler();
      uint64_t v115 = max_paths_per_interface;
      uint64_t v116 = 0x40000000LL;
      uint64_t v117 = __quic_conn_set_metadata_handlers_block_invoke_5_73;
      BOOL v118 = &__block_descriptor_tmp_75;
      uint64_t v119 = a1;
      nw_quic_connection_set_link_flow_controlled_handler();
    }

    uint64_t v11 = *(void *)(a1 + 1320);
    uint64_t v49 = calloc(1uLL, 0x60uLL);
    if (!v49)
    {
      uint64_t v89 = 96LL;
      goto LABEL_154;
    }

    void *v49 = v11;
    v49[1] = v11 + 24;
    v49[4] = 0LL;
    v49[5] = v49 + 4;
    v49[6] = 0LL;
    v49[7] = v49 + 6;
    v49[8] = 0LL;
    v49[9] = v49 + 8;
    *(void *)(a1 + 560) = v49;
    *(void *)(a1 + 576) = quic_timer_create(a2);
    quic_fsm_conn_change(a1, 1u);
    *(void *)(a1 + 952) = quic_recovery_create(a1);
    *(void *)(a1 + 1360) = 0LL;
    *(void *)(a1 + 1368) = a1 + 1360;
    uint64_t v50 = quic_path_create((uint64_t *)(a1 + 1360), a1, *MEMORY[0x189608EC0], 0LL, 0, 1);
    *(void *)(a1 + 1112) = v50;
    *(_BYTE *)(v50 + 17) = 8;
    arc4random_buf((void *)(v50 + 18), 8uLL);
    *(void *)(a1 + 960) = quic_ack_create(*(void *)(a1 + 576), a1, *(void *)(a1 + 560));
    int v51 = (dispatch_data_s *)v112[3];
    if (v51)
    {
      size_t size = dispatch_data_get_size((dispatch_data_t)v112[3]);
      v110[0] = max_paths_per_interface;
      v110[1] = 0x40000000LL;
      v110[2] = __quic_conn_initialize_inner_block_invoke;
      v110[3] = &unk_18A1180C0;
      v110[4] = &v111;
      v110[5] = a1;
      dispatch_data_apply(v51, v110);
    }

    if ((v8 & 1) != 0)
    {
      int multipath_service = 0;
      if (!(_DWORD)v9) {
        goto LABEL_93;
      }
    }

    else
    {
      int multipath_service = nw_protocol_instance_get_multipath_service();
      if (!(_DWORD)v9) {
        goto LABEL_93;
      }
    }

    uint64_t v53 = (void *)v112[3];
    if (v53)
    {
      if (size <= 3u)
      {
        os_release(v53);
        v112[3] = 0LL;
        if (qlog_debug_enabled
          || (qlog_nwlog_enabled & 1) != 0
          || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
        {
          uint64_t v54 = _os_log_pack_size();
          size_t v105 = size;
          uint64_t v55 = (char *)&v98 - ((MEMORY[0x1895F8858](v54, v54) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          uint64_t v56 = _os_log_pack_fill();
          *(_DWORD *)uint64_t v56 = 136446210;
          *(void *)(v56 + 4) = "quic_conn_initialize_inner";
          qlog_internal(17, (uint64_t)v55, 422LL);
          LOBYTE(size) = v105;
        }
      }
    }

    LODWORD(size) = size <= 4u ? 4 : size;
LABEL_93:
    uint64_t v57 = *(void *)(a1 + 1112);
    *(_BYTE *)(a1 + 455) = *(_BYTE *)(v57 + 17);
    int v58 = *(_DWORD *)(v57 + 34);
    *(_OWORD *)(a1 + 456) = *(_OWORD *)(v57 + 18);
    *(_DWORD *)(a1 + 472) = v58;
    __int128 v59 = (void *)v112[3];
    if (v59)
    {
      os_release(v59);
      v112[3] = 0LL;
    }

    else
    {
      quic_cid_create(size, (_BYTE *)(*(void *)(a1 + 1112) + 38LL));
    }

    *(void *)(a1 + 496) = 1LL;
    *(void *)(a1 + 480) = 1LL;
    unsigned int v60 = *(_DWORD *)(a1 + 1376);
    *(_DWORD *)(a1 + 520) = v60;
    quic_packet_builder_set_version(*(void *)(a1 + 560), v60);
    int quic_l4s_enabled = network_config_get_quic_l4s_enabled();
    uint64_t v62 = 0x2000000LL;
    if (!quic_l4s_enabled) {
      uint64_t v62 = 0LL;
    }
    *uint64_t v5 = *v5 & 0xFFFFFFFFFDFFFFFFLL | v62;
    v109[0] = max_paths_per_interface;
    v109[1] = 0x40000000LL;
    v109[2] = __quic_conn_initialize_inner_block_invoke_185;
    v109[3] = &__block_descriptor_tmp_188;
    v109[4] = a1;
    if (quic_conn_initialize_inner_onceToken[0] != -1) {
      dispatch_once(quic_conn_initialize_inner_onceToken, v109);
    }
    uint64_t v11 = v107;
    uint64_t max_paths_per_interface = v108;
    unint64_t v63 = *v5;
    *v5 |= 0x200000000uLL;
    if (quic_disable_kernel_pacing) {
      *uint64_t v5 = v63 & 0xFFFFFFFDFFFFFFFFLL;
    }
    quic_conn_init_hiwat(a1, quic_fc_initial_conn_snd_space, quic_fc_initial_conn_rcv_space);
    if (quiclog_directory) {
      *(void *)(a1 + 1136) = objc_alloc_init(&OBJC_CLASS___QUICLog);
    }
    quic_conn_set_mss(a1, *(void *)(a1 + 1112), *(unsigned __int16 *)(a1 + 596));
    *(void *)(a1 + 64) = quic_crypto_identifier;
    *(void *)(a1 + 72) = &quic_crypto_callbacks;
    *(void *)(a1 + 88) = a2;
    *(void *)(a1 + 128) = quic_crypto_identifier;
    *(void *)(a1 + 136) = &quic_crypto_callbacks;
    *(void *)(a1 + 152) = a2;
    *(void *)(a1 + 256) = quic_crypto_identifier;
    *(void *)(a1 + 264) = &quic_crypto_callbacks;
    *(void *)(a1 + 280) = a2;
    *(void *)(a1 + 192) = quic_crypto_identifier;
    *(void *)(a1 + 200) = &quic_crypto_callbacks;
    *(void *)(a1 + 216) = a2;
    quic_migration_create( (void *)a1,  *(void *)(a1 + 576),  multipath_service,  (int)v9,  max_paths_per_interface,  *(_DWORD *)v5 & 1,  v11);
    *(void *)(a1 + 1120) = v64;
    *(void *)(a1 + 1304) = nw_protocol_instance_get_stats();
    if ((nw_protocol_instance_get_logging_disabled() & 1) != 0
      || (nw_protocol_instance_get_sensitive_redacted() & 1) != 0)
    {
      goto LABEL_108;
    }

    __int128 v65 = (char *)calloc(1uLL, 0x49D8uLL);
    if (v65) {
      break;
    }
    uint64_t v89 = 18904LL;
LABEL_154:
    qlog_abort_internal("%s strict_calloc(%zu, %zu) failed", "strict_calloc", 1uLL, v89);
LABEL_155:
    if (qlog_debug_enabled) {
      char v48 = 1;
    }
    if ((v48 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v94 = _os_log_pack_size();
      uint64_t v95 = (char *)&v98 - ((MEMORY[0x1895F8858](v94, v94) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v96 = _os_log_pack_fill();
      int v97 = *(unsigned __int16 *)(a1 + 596);
      *(_DWORD *)uint64_t v96 = 136446466;
      *(void *)(v96 + 4) = "quic_conn_initialize_inner";
      *(_WORD *)(v96 + 12) = 1024;
      *(_DWORD *)(v96 + 14) = v97;
      qlog_internal(2, (uint64_t)v95, 363LL);
      uint64_t max_paths_per_interface = v105;
    }

uint64_t __quic_conn_initialize_inner_block_invoke( uint64_t a1, int a2, int a3, void *__src, unint64_t a5)
{
  v12[1] = *MEMORY[0x1895F89C0];
  if (a5 < 0x15)
  {
    quic_cid_read(__src, a5, (_BYTE *)(*(void *)(*(void *)(a1 + 40) + 1112LL) + 38LL));
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 1112LL);
    if (!*(_WORD *)(v9 + 39)
      && !*(_BYTE *)(v9 + 41)
      && !*(_BYTE *)(v9 + 42)
      && !*(_BYTE *)(v9 + 43)
      && !*(_BYTE *)(v9 + 44)
      && !*(_BYTE *)(v9 + 45)
      && !*(_BYTE *)(v9 + 46)
      && !*(_BYTE *)(v9 + 47)
      && !*(_BYTE *)(v9 + 48)
      && !*(_BYTE *)(v9 + 49)
      && !*(_BYTE *)(v9 + 50)
      && !*(_BYTE *)(v9 + 51)
      && !*(_BYTE *)(v9 + 52)
      && !*(_BYTE *)(v9 + 53)
      && !*(_BYTE *)(v9 + 54)
      && !*(_BYTE *)(v9 + 55)
      && !*(_BYTE *)(v9 + 56)
      && !*(_BYTE *)(v9 + 57)
      && !*(_BYTE *)(v9 + 58))
    {
      uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
      if (v10)
      {
        os_release(v10);
        *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0LL;
      }
    }
  }

  else if (qlog_debug_enabled {
         || (qlog_nwlog_enabled & 1) != 0
  }
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    uint64_t v5 = _os_log_pack_size();
    uint64_t v6 = (char *)v12 - ((MEMORY[0x1895F8858](v5, v5) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v7 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v7 = 136446210;
    *(void *)(v7 + 4) = "quic_conn_initialize_inner_block_invoke";
    qlog_internal(17, (uint64_t)v6, 396LL);
  }

  return 1LL;
}

const char *__quic_conn_initialize_inner_block_invoke_185(uint64_t a1)
{
  uint64_t result = getenv("QUIC_USE_L4S");
  if (result)
  {
    uint64_t result = (const char *)strcmp(result, "1");
    if (!(_DWORD)result) {
      *(void *)(*(void *)(a1 + 32) + 1380LL) |= 0x2000000uLL;
    }
  }

  return result;
}

void quic_conn_set_mss(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v70 = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }

    uint64_t v29 = _os_log_pack_size();
    uint64_t v30 = (char *)v52 - ((MEMORY[0x1895F8858](v29, v29) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v31 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v31 = 136446210;
    *(void *)(v31 + 4) = "quic_conn_set_mss";
    uint64_t v32 = (uint64_t)v30;
    uint64_t v33 = 1191LL;
LABEL_46:
    qlog_internal(17, v32, v33);
    return;
  }

  if (!a2)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }

    uint64_t v34 = _os_log_pack_size();
    uint64_t v35 = (char *)v52 - ((MEMORY[0x1895F8858](v34, v34) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v36 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v36 = 136446210;
    *(void *)(v36 + 4) = "quic_conn_set_mss";
    uint64_t v32 = (uint64_t)v35;
    uint64_t v33 = 1192LL;
    goto LABEL_46;
  }

  if (a3 <= 0x4AF)
  {
    *(_WORD *)(a2 + 426) = 1200;
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      uint64_t v37 = _os_log_pack_size();
      char v38 = (char *)v52 - ((MEMORY[0x1895F8858](v37, v37) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v39 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v39 = 136446466;
      *(void *)(v39 + 4) = "quic_conn_set_mss";
      *(_WORD *)(v39 + 12) = 1024;
      *(_DWORD *)(v39 + 14) = a3;
      uint64_t v40 = (uint64_t)v38;
      uint64_t v41 = 1197LL;
LABEL_55:
      qlog_internal(17, v40, v41);
    }
  }

  else
  {
    unsigned int v6 = *(unsigned __int16 *)(a2 + 428);
    if (v6 < 0x4B1 || v6 >= a3)
    {
      unsigned int v8 = *(unsigned __int16 *)(a2 + 424);
      if (v8 > a3)
      {
        *(_WORD *)(a2 + 426) = v8;
        if ((qlog_debug_enabled
           || (qlog_nwlog_enabled & 1) != 0
           || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))
          && *(void *)(a1 + 1112))
        {
          uint64_t v46 = _os_log_pack_size();
          int v47 = (char *)v52 - ((MEMORY[0x1895F8858](v46, v46) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          uint64_t v48 = _os_log_pack_fill();
          uint64_t v49 = quic_cid_describe((unsigned __int8 *)(*(void *)(a1 + 1112) + 38LL));
          uint64_t v50 = quic_cid_describe((unsigned __int8 *)(*(void *)(a1 + 1112) + 17LL));
          int v51 = *(unsigned __int16 *)(a2 + 426);
          *(_DWORD *)uint64_t v48 = 136447490;
          *(void *)(v48 + 4) = "quic_conn_set_mss";
          *(_WORD *)(v48 + 12) = 2082;
          *(void *)(v48 + 14) = a1 + 976;
          *(_WORD *)(v48 + 22) = 2082;
          *(void *)(v48 + 24) = v49;
          *(_WORD *)(v48 + 32) = 2082;
          *(void *)(v48 + 34) = v50;
          *(_WORD *)(v48 + 42) = 1024;
          *(_DWORD *)(v48 + 44) = v51;
          *(_WORD *)(v48 + 48) = 1024;
          *(_DWORD *)(v48 + 50) = a3;
          qlog_internal(1, (uint64_t)v47, 1206LL);
        }
      }

      else
      {
        *(_WORD *)(a2 + 426) = a3;
      }
    }

    else
    {
      *(_WORD *)(a2 + 426) = v6;
      if (qlog_debug_enabled
        || (qlog_nwlog_enabled & 1) != 0
        || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
      {
        uint64_t v42 = _os_log_pack_size();
        __int128 v43 = (char *)v52 - ((MEMORY[0x1895F8858](v42, v42) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v44 = _os_log_pack_fill();
        int v45 = *(unsigned __int16 *)(a2 + 428);
        *(_DWORD *)uint64_t v44 = 136446722;
        *(void *)(v44 + 4) = "quic_conn_set_mss";
        *(_WORD *)(v44 + 12) = 1024;
        *(_DWORD *)(v44 + 14) = a3;
        *(_WORD *)(v44 + 18) = 1024;
        *(_DWORD *)(v44 + 20) = v45;
        uint64_t v40 = (uint64_t)v43;
        uint64_t v41 = 1202LL;
        goto LABEL_55;
      }
    }
  }

  uint64_t v9 = MEMORY[0x1895F87A8];
  if (*(void *)a2 == *MEMORY[0x189608EC0])
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = _os_log_pack_size();
      uint64_t v11 = (char *)v52 - ((MEMORY[0x1895F8858](v10, v10) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v12 = _os_log_pack_fill();
      int v13 = *(unsigned __int16 *)(a2 + 426);
      *(_DWORD *)uint64_t v12 = 136446722;
      *(void *)(v12 + 4) = "quic_conn_set_mss";
      *(_WORD *)(v12 + 12) = 2048;
      *(void *)(v12 + 14) = a2;
      *(_WORD *)(v12 + 22) = 1024;
      *(_DWORD *)(v12 + 24) = v13;
      qlog_internal(2, (uint64_t)v11, 1214LL);
    }

    *(_WORD *)(a1 + 478) = *(_WORD *)(a2 + 426);
    uint64_t v14 = *(void *)(a2 + 360);
    if (!v14) {
      goto LABEL_29;
    }
  }

  else
  {
    uint64_t v15 = (nw_interface *)nw_protocol_instance_copy_interface_for_path();
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v16 = _os_log_pack_size();
      uint32_t v17 = (char *)v52 - ((MEMORY[0x1895F8858](v16, v16) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v18 = _os_log_pack_fill();
      name = nw_interface_get_name(v15);
      int v20 = *(unsigned __int16 *)(a2 + 426);
      *(_DWORD *)uint64_t v18 = 136446978;
      *(void *)(v18 + 4) = "quic_conn_set_mss";
      *(_WORD *)(v18 + 12) = 2048;
      *(void *)(v18 + 14) = a2;
      *(_WORD *)(v18 + 22) = 2082;
      *(void *)(v18 + 24) = name;
      *(_WORD *)(v18 + 32) = 1024;
      *(_DWORD *)(v18 + 34) = v20;
      qlog_internal(2, (uint64_t)v17, 1224LL);
    }

    LOWORD(v67) = *(_WORD *)(a2 + 426);
    uint64_t v54 = (uint64_t (*)(void *))__quic_conn_set_mss_block_invoke;
    uint64_t v55 = &unk_18A117AC8;
    uint64_t v64 = 0LL;
    uint64_t v65 = (uint64_t)&v64;
    uint64_t v66 = 0x2000000000LL;
    v53[0] = v9;
    v53[1] = 0x40000000LL;
    uint64_t v58 = a1;
    __int128 v59 = v15;
    uint64_t v56 = &v64;
    uint64_t v57 = a2;
    uint64_t v21 = *(void *)(a1 + 1360);
    do
    {
      if (!v21) {
        break;
      }
      uint64_t v22 = *(void *)(v21 + 312);
      char v23 = v54(v53);
      uint64_t v21 = v22;
    }

    while ((v23 & 1) != 0);
    *(_WORD *)(a1 + 478) = *(_WORD *)(v65 + 24);
    if (v15) {
      nw_release(v15);
    }
    _Block_object_dispose(&v64, 8);
    uint64_t v14 = *(void *)(a2 + 360);
    if (!v14) {
      goto LABEL_29;
    }
  }

  quic_cc_mss_changed(v14);
LABEL_29:
  uint64_t v60 = 0LL;
  uint64_t v61 = &v60;
  uint64_t v62 = 0x2000000000LL;
  uint64_t v63 = 0LL;
  uint64_t v64 = v9;
  uint64_t v65 = 0x40000000LL;
  uint64_t v66 = (uint64_t)__quic_conn_get_min_mss_path_block_invoke;
  __int128 v67 = &unk_18A117B40;
  uint64_t v68 = &v60;
  uint64_t v24 = *(void *)(a1 + 1360);
  do
  {
    if (!v24) {
      break;
    }
    uint64_t v25 = *(void *)(v24 + 312);
    char v26 = ((uint64_t (*)(uint64_t *))v66)(&v64);
    uint64_t v24 = v25;
  }

  while ((v26 & 1) != 0);
  uint64_t v27 = v61[3];
  _Block_object_dispose(&v60, 8);
  v52[2] = __quic_conn_set_mss_block_invoke_83;
  v52[3] = &unk_18A117AF0;
  uint64_t v60 = 0LL;
  uint64_t v61 = &v60;
  uint64_t v62 = 0x2000000000LL;
  LOBYTE(v63) = 0;
  v52[0] = v9;
  v52[1] = 0x40000000LL;
  v52[6] = v27;
  v52[5] = a1;
  v52[4] = &v60;
  uint64_t v64 = -1LL;
  uint64_t flow_for_key = nw_protocol_instance_get_flow_for_key();
  if (*(_BYTE *)(a1 + 477) == 9)
  {
    uint64_t v64 = v9;
    uint64_t v65 = 0x40000000LL;
    uint64_t v66 = (uint64_t)__quic_enumerate_open_data_streams_block_invoke;
    __int128 v67 = &unk_18A117490;
    uint64_t v68 = v52;
    uint64_t v69 = flow_for_key;
    nw_protocol_instance_enumerate_flows();
  }

  if (*((_BYTE *)v61 + 24)) {
    nw_protocol_instance_notify_updated_message_properties();
  }
  _Block_object_dispose(&v60, 8);
}

void quic_conn_restore_token(void *a1)
{
  v12[5] = *MEMORY[0x1895F89C0];
  if (*a1)
  {
    if (a1[70])
    {
      uint64_t v2 = nw_protocol_instance_copy_association();
      if (v2)
      {
        __n128 v3 = (void *)v2;
        v12[0] = MEMORY[0x1895F87A8];
        v12[1] = 0x40000000LL;
        void v12[2] = __quic_conn_restore_token_block_invoke;
        v12[3] = &__block_descriptor_tmp_94_3764;
        v12[4] = a1;
        nw_quic_access_token_on_queue();
        nw_release(v3);
      }

      return;
    }

    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      uint64_t v9 = _os_log_pack_size();
      uint64_t v10 = (char *)v12 - ((MEMORY[0x1895F8858](v9, v9) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v11 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v11 = 136446210;
      *(void *)(v11 + 4) = "quic_conn_restore_token";
      uint64_t v7 = (uint64_t)v10;
      uint64_t v8 = 1706LL;
      goto LABEL_14;
    }
  }

  else if (qlog_debug_enabled {
         || (qlog_nwlog_enabled & 1) != 0
  }
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    uint64_t v4 = _os_log_pack_size();
    uint64_t v5 = (char *)v12 - ((MEMORY[0x1895F8858](v4, v4) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v6 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v6 = 136446210;
    *(void *)(v6 + 4) = "quic_conn_restore_token";
    uint64_t v7 = (uint64_t)v5;
    uint64_t v8 = 1705LL;
LABEL_14:
    qlog_internal(17, v7, v8);
  }

void __quic_conn_restore_token_block_invoke(uint64_t a1, dispatch_data_t data)
{
  v30[4] = *MEMORY[0x1895F89C0];
  if (data)
  {
    size_t size = dispatch_data_get_size(data);
    if (size <= 0x3E8)
    {
      size_t v5 = size;
      if ((qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEFAULT))
        && *(void *)(*(void *)(a1 + 32) + 1112LL))
      {
        uint64_t v6 = _os_log_pack_size();
        v27[1] = v27;
        uint64_t v7 = (char *)v27 - ((MEMORY[0x1895F8858](v6, v6) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v8 = _os_log_pack_fill();
        uint64_t v9 = *(void *)(a1 + 32);
        v27[0] = v9 + 976;
        uint64_t v10 = *(void *)(v9 + 1112);
        if (quic_cid_describe_state % 3 == 2) {
          uint64_t v11 = &quic_cid_describe_cid_buf2;
        }
        else {
          uint64_t v11 = &quic_cid_describe_cid_buf3;
        }
        if (quic_cid_describe_state % 3) {
          uint64_t v12 = v11;
        }
        else {
          uint64_t v12 = &quic_cid_describe_cid_buf1;
        }
        int v13 = ++quic_cid_describe_state;
        unsigned int v14 = *(unsigned __int8 *)(v10 + 38);
        __int128 v15 = 0uLL;
        *(_OWORD *)((char *)v12 + 25) = 0u;
        if (v14 >= 0x14) {
          uint64_t v16 = 20LL;
        }
        else {
          uint64_t v16 = v14;
        }
        _OWORD *v12 = 0uLL;
        v12[1] = 0uLL;
        if ((_DWORD)v16)
        {
          uint32_t v17 = (unsigned __int8 *)(v10 + 39);
          do
          {
            int v18 = *v17++;
            snprintf((char *)v12, 0x29uLL, "%s%02x", (const char *)v12, v18);
            --v16;
          }

          while (v16);
          int v13 = quic_cid_describe_state;
          __int128 v15 = 0uLL;
        }

        uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 1112LL);
        if (v13 % 3 == 2) {
          int v20 = &quic_cid_describe_cid_buf2;
        }
        else {
          int v20 = &quic_cid_describe_cid_buf3;
        }
        if (v13 % 3) {
          uint64_t v21 = v20;
        }
        else {
          uint64_t v21 = &quic_cid_describe_cid_buf1;
        }
        quic_cid_describe_state = v13 + 1;
        else {
          uint64_t v22 = *(unsigned __int8 *)(v19 + 17);
        }
        *uint64_t v21 = v15;
        v21[1] = v15;
        *(_OWORD *)((char *)v21 + 25) = v15;
        if ((_DWORD)v22)
        {
          char v23 = (unsigned __int8 *)(v19 + 18);
          do
          {
            int v24 = *v23++;
            snprintf((char *)v21, 0x29uLL, "%s%02x", (const char *)v21, v24);
            --v22;
          }

          while (v22);
        }

        *(_DWORD *)uint64_t v8 = 136447234;
        *(void *)(v8 + 4) = "quic_conn_restore_token_block_invoke";
        *(_WORD *)(v8 + 12) = 2082;
        *(void *)(v8 + 14) = v27[0];
        *(_WORD *)(v8 + 22) = 2082;
        *(void *)(v8 + 24) = v12;
        *(_WORD *)(v8 + 32) = 2082;
        *(void *)(v8 + 34) = v21;
        *(_WORD *)(v8 + 42) = 1024;
        *(_DWORD *)(v8 + 44) = v5;
        qlog_internal(0, (uint64_t)v7, 1721LL);
      }

      if (v5)
      {
        uint64_t v25 = calloc(1uLL, v5);
        if (v25)
        {
          char v26 = v25;
          v30[0] = 0LL;
          v30[1] = v30;
          void v30[2] = 0x2000000000LL;
          v30[3] = 0LL;
          v29[0] = 0LL;
          v29[1] = v29;
          v29[2] = 0x2000000000LL;
          v29[3] = v25;
          applier[0] = MEMORY[0x1895F87A8];
          applier[1] = 0x40000000LL;
          applier[2] = __quic_dispatch_data_copyout_block_invoke;
          applier[3] = &unk_18A118548;
          applier[5] = v29;
          applier[6] = v5;
          applier[4] = v30;
          dispatch_data_apply(data, applier);
          _Block_object_dispose(v29, 8);
          _Block_object_dispose(v30, 8);
          quic_packet_builder_set_initial_token(*(void *)(*(void *)(a1 + 32) + 560LL), (unsigned __int16)v5, v26);
          free(v26);
          return;
        }
      }

      else
      {
        qlog_abort_internal("%s strict_calloc called with size 0", "strict_calloc");
      }

      qlog_abort_internal("%s strict_calloc(%zu, %zu) failed", "strict_calloc", 1uLL, v5);
    }
  }

uint64_t __quic_conn_set_mss_block_invoke(void *a1, uint64_t a2)
{
  v14[1] = *MEMORY[0x1895F89C0];
  if (a1[5] != a2)
  {
    uint64_t v4 = (void *)nw_protocol_instance_copy_interface_for_path();
    uint64_t v5 = a1[5];
    if (v4 == (void *)a1[7])
    {
      *(_WORD *)(a2 + 426) = *(_WORD *)(v5 + 426);
      if (qlog_debug_enabled
        || (qlog_nwlog_enabled & 1) != 0
        || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v6 = _os_log_pack_size();
        uint64_t v7 = (char *)v14 - ((MEMORY[0x1895F8858](v6, v6) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v8 = _os_log_pack_fill();
        uint64_t v9 = a1[5];
        int v10 = *(unsigned __int16 *)(v9 + 426);
        *(_DWORD *)uint64_t v8 = 136446722;
        *(void *)(v8 + 4) = "quic_conn_set_mss_block_invoke";
        *(_WORD *)(v8 + 12) = 2048;
        *(void *)(v8 + 14) = v9;
        *(_WORD *)(v8 + 22) = 1024;
        *(_DWORD *)(v8 + 24) = v10;
        qlog_internal(2, (uint64_t)v7, 1238LL);
        uint64_t v5 = a1[5];
      }
    }

    unsigned int v11 = *(unsigned __int16 *)(v5 + 426);
    uint64_t v12 = *(void *)(a1[4] + 8LL);
    *(_WORD *)(v12 + 24) = v11;
    if (v4) {
      nw_release(v4);
    }
  }

  return 1LL;
}

uint64_t __quic_conn_get_min_mss_path_block_invoke(uint64_t a1, uint64_t a2)
{
  if (quic_path_is_initial(a2) || quic_path_is_validated(a2))
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
    uint64_t v5 = *(void *)(v4 + 24);
  }

  return 1LL;
}

uint64_t __quic_conn_set_mss_block_invoke_83(void *a1, uint64_t a2, uint64_t a3)
{
  if ((*(_BYTE *)(a3 + 353) & 0x10) != 0)
  {
    quic_stream_compute_datagram_usable_frame_size(a1[5], a1[6], a3);
    *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) = 1;
  }

  return 1LL;
}

uint64_t __quic_conn_set_metadata_handlers_block_invoke()
{
  return nw_protocol_instance_async_if_needed();
}

uint64_t __quic_conn_set_metadata_handlers_block_invoke_10()
{
  return nw_protocol_instance_async_if_needed();
}

uint64_t __quic_conn_set_metadata_handlers_block_invoke_16()
{
  return nw_protocol_instance_async_if_needed();
}

uint64_t __quic_conn_set_metadata_handlers_block_invoke_22()
{
  return nw_protocol_instance_async_if_needed();
}

uint64_t __quic_conn_set_metadata_handlers_block_invoke_28()
{
  return nw_protocol_instance_async_if_needed();
}

uint64_t __quic_conn_set_metadata_handlers_block_invoke_33()
{
  return nw_protocol_instance_async_if_needed();
}

uint64_t __quic_conn_set_metadata_handlers_block_invoke_37()
{
  return nw_protocol_instance_async_if_needed();
}

uint64_t __quic_conn_set_metadata_handlers_block_invoke_3_41()
{
  return nw_protocol_instance_async_if_needed();
}

uint64_t __quic_conn_set_metadata_handlers_block_invoke_5(uint64_t a1)
{
  v7[1] = *MEMORY[0x1895F89C0];
  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v2 = _os_log_pack_size();
    __n128 v3 = (char *)v7 - ((MEMORY[0x1895F8858](v2, v2) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v4 = _os_log_pack_fill();
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 672LL);
    *(_DWORD *)uint64_t v4 = 136446466;
    *(void *)(v4 + 4) = "quic_conn_set_metadata_handlers_block_invoke_5";
    *(_WORD *)(v4 + 12) = 2048;
    *(void *)(v4 + 14) = v5;
    qlog_internal(2, (uint64_t)v3, 1051LL);
  }

  return *(void *)(*(void *)(a1 + 32) + 672LL);
}

uint64_t __quic_conn_set_metadata_handlers_block_invoke_47(uint64_t a1)
{
  v7[1] = *MEMORY[0x1895F89C0];
  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v2 = _os_log_pack_size();
    __n128 v3 = (char *)v7 - ((MEMORY[0x1895F8858](v2, v2) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v4 = _os_log_pack_fill();
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 752LL);
    *(_DWORD *)uint64_t v4 = 136446466;
    *(void *)(v4 + 4) = "quic_conn_set_metadata_handlers_block_invoke";
    *(_WORD *)(v4 + 12) = 2048;
    *(void *)(v4 + 14) = v5;
    qlog_internal(2, (uint64_t)v3, 1057LL);
  }

  return *(void *)(*(void *)(a1 + 32) + 752LL);
}

uint64_t __quic_conn_set_metadata_handlers_block_invoke_49(uint64_t a1)
{
  v7[1] = *MEMORY[0x1895F89C0];
  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v2 = _os_log_pack_size();
    __n128 v3 = (char *)v7 - ((MEMORY[0x1895F8858](v2, v2) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v4 = _os_log_pack_fill();
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 656LL);
    *(_DWORD *)uint64_t v4 = 136446466;
    *(void *)(v4 + 4) = "quic_conn_set_metadata_handlers_block_invoke";
    *(_WORD *)(v4 + 12) = 2048;
    *(void *)(v4 + 14) = v5;
    qlog_internal(2, (uint64_t)v3, 1063LL);
  }

  return *(void *)(*(void *)(a1 + 32) + 656LL);
}

uint64_t __quic_conn_set_metadata_handlers_block_invoke_51(uint64_t a1)
{
  v7[1] = *MEMORY[0x1895F89C0];
  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v2 = _os_log_pack_size();
    __n128 v3 = (char *)v7 - ((MEMORY[0x1895F8858](v2, v2) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v4 = _os_log_pack_fill();
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 736LL);
    *(_DWORD *)uint64_t v4 = 136446466;
    *(void *)(v4 + 4) = "quic_conn_set_metadata_handlers_block_invoke";
    *(_WORD *)(v4 + 12) = 2048;
    *(void *)(v4 + 14) = v5;
    qlog_internal(2, (uint64_t)v3, 1069LL);
  }

  return *(void *)(*(void *)(a1 + 32) + 736LL);
}

uint64_t __quic_conn_set_metadata_handlers_block_invoke_53(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 544LL);
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = 88LL;
  if ((*(_BYTE *)(v1 + 152) & 1) == 0) {
    uint64_t v2 = 80LL;
  }
  return *(void *)(v1 + v2);
}

uint64_t __quic_conn_set_metadata_handlers_block_invoke_2_55(uint64_t a1)
{
  return (unsigned __int16)(*(void *)(*(void *)(a1 + 32) + 616LL) / 0xF4240uLL);
}

uint64_t __quic_conn_set_metadata_handlers_block_invoke_3_58()
{
  return nw_protocol_instance_async_if_needed();
}

uint64_t __quic_conn_set_metadata_handlers_block_invoke_63()
{
  return nw_protocol_instance_async_if_needed();
}

void __quic_conn_set_metadata_handlers_block_invoke_3_68()
{
  v0 = dispatch_semaphore_create(0LL);
  nw_protocol_instance_async_if_needed();
  dispatch_time_t v1 = dispatch_time(0LL, 1000000000LL);
  dispatch_semaphore_wait(v0, v1);
  if (v0) {
    dispatch_release(v0);
  }
}

uint64_t __quic_conn_set_metadata_handlers_block_invoke_5_73()
{
  return nw_protocol_instance_async_if_needed();
}

uint64_t __quic_conn_set_metadata_handlers_block_invoke_6()
{
  return nw_protocol_instance_set_link_flow_controlled();
}

uint64_t __quic_conn_set_metadata_handlers_block_invoke_4_69(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v2 + 477) == 9)
  {
    quic_conn_select_next_path(*(void **)(a1 + 32), (uint64_t)&__block_literal_global_194);
    quic_protector_get_tag_size(*(void *)(v2 + 568), *(unsigned __int8 *)(v2 + 600));
    nw_protocol_request_outbound_data();
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

uint64_t quic_conn_select_next_path(void *a1, uint64_t a2)
{
  v15[1] = *MEMORY[0x1895F89C0];
  if (!quic_migration_multipath_ready(a1[140])) {
    return a1[139];
  }
  uint64_t v4 = quic_path_select_next(a1 + 170, a2);
  if (!v4) {
    return a1[139];
  }
  uint64_t v5 = v4;
  char v6 = qlog_nwlog_enabled;
  if (qlog_datapath_enabled) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = qlog_nwlog_enabled == 0;
  }
  if (!v7)
  {
    if (qlog_debug_enabled) {
      char v6 = 1;
    }
    if ((v6 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = _os_log_pack_size();
      uint64_t v9 = (char *)v15 - ((MEMORY[0x1895F8858](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v10 = _os_log_pack_fill();
      unsigned int v11 = quic_cid_describe((unsigned __int8 *)(v5 + 17));
      uint64_t v12 = *(void *)(v5 + 328);
      int v13 = *(unsigned __int8 *)(v5 + 16);
      *(_DWORD *)uint64_t v10 = 136446978;
      *(void *)(v10 + 4) = "quic_conn_select_next_path";
      *(_WORD *)(v10 + 12) = 2082;
      *(void *)(v10 + 14) = v11;
      *(_WORD *)(v10 + 22) = 2048;
      *(void *)(v10 + 24) = v12;
      *(_WORD *)(v10 + 32) = 1024;
      *(_DWORD *)(v10 + 34) = v13;
      qlog_internal(2, (uint64_t)v9, 5816LL);
    }
  }

  return v5;
}

uint64_t __quic_conn_inject_packet_block_invoke_2()
{
  return nw_protocol_instance_add_outbound();
}

BOOL __quic_conn_inject_packet_block_invoke_3(BOOL result, char *a2, uint64_t a3)
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  if (*(void *)(result + 32) == a3)
  {
    uint64_t v4 = result;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    uint64_t v34 = 0LL;
    __int128 v33 = 0u;
    __int128 v32 = 0u;
    __int128 v31 = 0u;
    __int128 v30 = 0u;
    __int128 v29 = 0u;
    __int128 v28 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    BYTE11(v24) = 3;
    uint64_t v5 = *(void *)(result + 40);
    BYTE10(v24) = *(_BYTE *)(v5 + 600);
    BOOL v6 = quic_migration_multipath_ready(*(void *)(v5 + 1120));
    uint64_t v7 = 0LL;
    if (v6)
    {
      uint64_t v7 = *(void *)(*(void *)(v4 + 48) + 328LL);
      *((void *)&v33 + 1) = v7;
    }

    uint64_t pn = quic_protector_get_pn(*(void *)(*(void *)(v4 + 40) + 568LL), 3u, v7);
    unsigned int v9 = pn;
    *((void *)&v26 + 1) = pn;
    LODWORD(v34) = 0;
    int v10 = *(unsigned __int8 *)(*(void *)(v4 + 40) + 600LL);
    BYTE13(v24) = 4;
    if (v10 == 4) {
      char v11 = 67;
    }
    else {
      char v11 = 71;
    }
    uint64_t v19 = a2;
    uint64_t v12 = *(unsigned __int8 *)(v4 + 72);
    BYTE12(v24) = *(_BYTE *)(v4 + 72);
    *a2 = v11;
    uint64_t v13 = *(void *)(v4 + 48);
    unsigned int v16 = *(unsigned __int8 *)(v13 + 17);
    unsigned int v14 = (unsigned __int8 *)(v13 + 17);
    uint64_t v15 = v16;
    if (v16) {
      quic_cid_write(v14, a2 + 1, 0x10uLL);
    }
    *(_DWORD *)&a2[v15 + 1] = bswap32(v9);
    uint64_t v18 = *(void *)(v4 + 48);
    size_t v17 = *(void *)(v4 + 56);
    LOWORD(v25) = v17;
    *(void *)&__int128 v20 = &a2[v12];
    *((void *)&v20 + 1) = &a2[v12 + (unsigned __int16)v17];
    HIBYTE(v24) = *(_BYTE *)(v4 + 73);
    BYTE14(v24) = 16;
    *(void *)&__int128 v21 = &a2[v15 + 1];
    *((void *)&v21 + 1) = &a2[v15 + 5];
    *((void *)&v28 + 1) = v18;
    memcpy(&a2[v12], *(const void **)(v4 + 64), v17);
    return quic_protector_seal(*(void *)(*(void *)(v4 + 40) + 568LL), (uint64_t)&v19);
  }

  return result;
}

uint64_t __quic_conn_inject_packet_block_invoke()
{
  return 1LL;
}

void __quic_conn_set_metadata_handlers_block_invoke_2_64(uint64_t a1)
{
  uint64_t v2 = nw_protocol_instance_copy_association();
  if (v2)
  {
    __n128 v3 = (void *)v2;
    nw_quic_access_application_result_on_queue();
    nw_release(v3);
  }

  else
  {
    (*(void (**)(void, void, void))(*(void *)(a1 + 32) + 16LL))(*(void *)(a1 + 32), 0LL, 0LL);
  }

void __quic_conn_set_metadata_handlers_block_invoke_4_59()
{
  v5[1] = *MEMORY[0x1895F89C0];
  uint64_t v0 = nw_protocol_instance_copy_association();
  if (v0)
  {
    dispatch_time_t v1 = (void *)v0;
    nw_quic_report_application_result_on_queue();
    nw_release(v1);
  }

  else if (qlog_debug_enabled {
         || (qlog_nwlog_enabled & 1) != 0
  }
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    uint64_t v2 = _os_log_pack_size();
    __n128 v3 = (char *)v5 - ((MEMORY[0x1895F8858](v2, v2) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v4 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v4 = 136446210;
    *(void *)(v4 + 4) = "quic_conn_set_metadata_handlers_block_invoke_4";
    qlog_internal(17, (uint64_t)v3, 1089LL);
  }

void __quic_conn_set_metadata_handlers_block_invoke_4(uint64_t a1)
{
  unsigned int v1 = *(unsigned __int16 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  if (v1 == 0xFFFF) {
    unsigned int v3 = 20;
  }
  else {
    unsigned int v3 = v1;
  }
  quic_conn_keepalive_configure(v2, v3);
}

void quic_conn_keepalive_configure(uint64_t a1, unsigned int a2)
{
  v55[5] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if (!a2 && !*(void *)(a1 + 616)) {
      return;
    }
    *(void *)(a1 + 616) = 1000000LL * a2;
    if (*(_BYTE *)(a1 + 477) != 9) {
      return;
    }
    unint64_t v3 = quic_tp_get(*(_BYTE **)(a1 + 552), 1LL);
    unint64_t v4 = quic_tp_get(*(_BYTE **)(a1 + 544), 1LL);
    if (v3 >= v4) {
      unint64_t v5 = v4;
    }
    else {
      unint64_t v5 = v3;
    }
    if (v4) {
      BOOL v6 = v3 == 0;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6) {
      unint64_t v7 = v4 + v3;
    }
    else {
      unint64_t v7 = v5;
    }
    unint64_t v8 = *(void *)(a1 + 616);
    int v9 = *(unsigned __int8 *)(a1 + 584);
    if (*(_BYTE *)(a1 + 584))
    {
      uint64_t v10 = *(void *)(a1 + 616);
      if (v8) {
        goto LABEL_16;
      }
    }

    else
    {
      uint64_t v32 = *(void *)(a1 + 576);
      v55[0] = MEMORY[0x1895F87A8];
      v55[1] = 0x40000000LL;
      v55[2] = __quic_conn_keepalive_configure_block_invoke;
      v55[3] = &__block_descriptor_tmp_126;
      v55[4] = a1;
      int v9 = quic_timer_insert(v32, (uint64_t)"keepalive", 0LL, v55);
      *(_BYTE *)(a1 + 584) = v9;
      uint64_t v10 = *(void *)(a1 + 616);
      if (v10)
      {
LABEL_16:
        if (v7 - 1 >= v8 / 0x3E8)
        {
          quic_timer_reschedule(*(unsigned __int8 ***)(a1 + 576), v9, v10);
          if (qlog_debug_enabled
            || (qlog_nwlog_enabled & 1) != 0
            || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))
          {
            if (*(void *)(a1 + 1112))
            {
              uint64_t v11 = _os_log_pack_size();
              uint64_t v12 = (char *)&v53 - ((MEMORY[0x1895F8858](v11, v11) + 15) & 0xFFFFFFFFFFFFFFF0LL);
              _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
              uint64_t v13 = _os_log_pack_fill();
              uint64_t v54 = a1 + 976;
              unsigned int v14 = *(unsigned __int8 **)(a1 + 1112);
              if (quic_cid_describe_state % 3 == 2) {
                uint64_t v15 = &quic_cid_describe_cid_buf2;
              }
              else {
                uint64_t v15 = &quic_cid_describe_cid_buf3;
              }
              if (quic_cid_describe_state % 3) {
                unsigned int v16 = v15;
              }
              else {
                unsigned int v16 = &quic_cid_describe_cid_buf1;
              }
              int v17 = ++quic_cid_describe_state;
              unsigned int v18 = v14[38];
              __int128 v19 = 0uLL;
              *(_OWORD *)((char *)v16 + 25) = 0u;
              if (v18 >= 0x14) {
                uint64_t v20 = 20LL;
              }
              else {
                uint64_t v20 = v18;
              }
              _OWORD *v16 = 0uLL;
              v16[1] = 0uLL;
              if ((_DWORD)v20)
              {
                __int128 v21 = v14 + 39;
                do
                {
                  int v22 = *v21++;
                  snprintf((char *)v16, 0x29uLL, "%s%02x", (const char *)v16, v22);
                  --v20;
                }

                while (v20);
                unsigned int v14 = *(unsigned __int8 **)(a1 + 1112);
                int v17 = quic_cid_describe_state;
                __int128 v19 = 0uLL;
              }

              if (v17 % 3 == 2) {
                __int128 v23 = &quic_cid_describe_cid_buf2;
              }
              else {
                __int128 v23 = &quic_cid_describe_cid_buf3;
              }
              if (v17 % 3) {
                __int128 v24 = v23;
              }
              else {
                __int128 v24 = &quic_cid_describe_cid_buf1;
              }
              quic_cid_describe_state = v17 + 1;
              if (v14[17] >= 0x14u) {
                uint64_t v25 = 20LL;
              }
              else {
                uint64_t v25 = v14[17];
              }
              *__int128 v24 = v19;
              v24[1] = v19;
              *(_OWORD *)((char *)v24 + 25) = v19;
              if ((_DWORD)v25)
              {
                __int128 v26 = v14 + 18;
                do
                {
                  int v27 = *v26++;
                  snprintf((char *)v24, 0x29uLL, "%s%02x", (const char *)v24, v27);
                  --v25;
                }

                while (v25);
              }

              unint64_t v28 = *(void *)(a1 + 616);
              *(void *)(v13 + 4) = "quic_conn_keepalive_configure";
              *(_DWORD *)uint64_t v13 = 136447234;
              *(void *)(v13 + 14) = v54;
              *(_WORD *)(v13 + 12) = 2082;
              *(_WORD *)(v13 + 22) = 2082;
              *(void *)(v13 + 24) = v16;
              *(_WORD *)(v13 + 32) = 2082;
              *(void *)(v13 + 34) = v24;
              *(_WORD *)(v13 + 42) = 2048;
              *(void *)(v13 + 44) = v28 / 0xF4240;
              int v29 = 1;
              uint64_t v30 = (uint64_t)v12;
              uint64_t v31 = 4839LL;
              goto LABEL_78;
            }
          }
        }

        return;
      }
    }

    quic_timer_reschedule(*(unsigned __int8 ***)(a1 + 576), v9, v10);
    if ((qlog_debug_enabled
       || (qlog_nwlog_enabled & 1) != 0
       || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))
      && *(void *)(a1 + 1112))
    {
      uint64_t v33 = _os_log_pack_size();
      uint64_t v34 = (char *)&v53 - ((MEMORY[0x1895F8858](v33, v33) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v35 = _os_log_pack_fill();
      uint64_t v54 = a1 + 976;
      uint64_t v36 = *(unsigned __int8 **)(a1 + 1112);
      if (quic_cid_describe_state % 3 == 2) {
        uint64_t v37 = &quic_cid_describe_cid_buf2;
      }
      else {
        uint64_t v37 = &quic_cid_describe_cid_buf3;
      }
      if (quic_cid_describe_state % 3) {
        char v38 = v37;
      }
      else {
        char v38 = &quic_cid_describe_cid_buf1;
      }
      int v39 = ++quic_cid_describe_state;
      unsigned int v40 = v36[38];
      __int128 v41 = 0uLL;
      *(_OWORD *)((char *)v38 + 25) = 0u;
      if (v40 >= 0x14) {
        uint64_t v42 = 20LL;
      }
      else {
        uint64_t v42 = v40;
      }
      _OWORD *v38 = 0uLL;
      v38[1] = 0uLL;
      if ((_DWORD)v42)
      {
        __int128 v43 = v36 + 39;
        do
        {
          int v44 = *v43++;
          snprintf((char *)v38, 0x29uLL, "%s%02x", (const char *)v38, v44);
          --v42;
        }

        while (v42);
        uint64_t v36 = *(unsigned __int8 **)(a1 + 1112);
        int v39 = quic_cid_describe_state;
        __int128 v41 = 0uLL;
      }

      if (v39 % 3 == 2) {
        int v45 = &quic_cid_describe_cid_buf2;
      }
      else {
        int v45 = &quic_cid_describe_cid_buf3;
      }
      if (v39 % 3) {
        uint64_t v46 = v45;
      }
      else {
        uint64_t v46 = &quic_cid_describe_cid_buf1;
      }
      quic_cid_describe_state = v39 + 1;
      if (v36[17] >= 0x14u) {
        uint64_t v47 = 20LL;
      }
      else {
        uint64_t v47 = v36[17];
      }
      *uint64_t v46 = v41;
      v46[1] = v41;
      *(_OWORD *)((char *)v46 + 25) = v41;
      if ((_DWORD)v47)
      {
        uint64_t v48 = v36 + 18;
        do
        {
          int v49 = *v48++;
          snprintf((char *)v46, 0x29uLL, "%s%02x", (const char *)v46, v49);
          --v47;
        }

        while (v47);
      }

      *(_DWORD *)uint64_t v35 = 136446978;
      *(void *)(v35 + 4) = "quic_conn_keepalive_configure";
      *(_WORD *)(v35 + 12) = 2082;
      *(void *)(v35 + 14) = v54;
      *(_WORD *)(v35 + 22) = 2082;
      *(void *)(v35 + 24) = v38;
      *(_WORD *)(v35 + 32) = 2082;
      *(void *)(v35 + 34) = v46;
      int v29 = 1;
      uint64_t v30 = (uint64_t)v34;
      uint64_t v31 = 4833LL;
      goto LABEL_78;
    }

    return;
  }

  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    uint64_t v50 = _os_log_pack_size();
    int v51 = (char *)&v53 - ((MEMORY[0x1895F8858](v50, v50) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v52 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v52 = 136446210;
    *(void *)(v52 + 4) = "quic_conn_keepalive_configure";
    int v29 = 17;
    uint64_t v30 = (uint64_t)v51;
    uint64_t v31 = 4785LL;
LABEL_78:
    qlog_internal(v29, v30, v31);
  }

void __quic_conn_keepalive_configure_block_invoke(uint64_t a1, unsigned __int8 **a2, int a3)
{
}

void quic_conn_keepalive_handler(uint64_t a1, unsigned __int8 **a2, int a3)
{
  uint64_t v122 = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }

    uint64_t v106 = _os_log_pack_size();
    uint64_t v107 = (char *)&v117 - ((MEMORY[0x1895F8858](v106, v106) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v108 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v108 = 136446210;
    *(void *)(v108 + 4) = "quic_conn_keepalive_handler";
    uint64_t v109 = (uint64_t)v107;
    uint64_t v110 = 4714LL;
LABEL_170:
    qlog_internal(17, v109, v110);
    return;
  }

  if (!a2)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }

    uint64_t v111 = _os_log_pack_size();
    uint64_t v112 = (char *)&v117 - ((MEMORY[0x1895F8858](v111, v111) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v113 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v113 = 136446210;
    *(void *)(v113 + 4) = "quic_conn_keepalive_handler";
    uint64_t v109 = (uint64_t)v112;
    uint64_t v110 = 4715LL;
    goto LABEL_170;
  }

  uint64_t v6 = mach_continuous_time();
  if (timebase_info_once != -1) {
    dispatch_once(&timebase_info_once, &__block_literal_global_397);
  }
  unint64_t v7 = timebase_info_info * v6 / dword_18C4D003C / 0x3E8;
  if (v7 < *(void *)(a1 + 632))
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }

    uint64_t v114 = _os_log_pack_size();
    uint64_t v115 = (char *)&v117 - ((MEMORY[0x1895F8858](v114, v114) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v116 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v116 = 136446210;
    *(void *)(v116 + 4) = "quic_conn_keepalive_handler";
    uint64_t v109 = (uint64_t)v115;
    uint64_t v110 = 4723LL;
    goto LABEL_170;
  }

  uint64_t stats_region = nw_protocol_instance_get_stats_region();
  if (stats_region) {
    int v9 = (void *)stats_region;
  }
  else {
    int v9 = &g_quic_stats;
  }
  *(void *)(a1 + 1312) = v9;
  uint64_t stats = nw_protocol_instance_get_stats();
  *(void *)(a1 + 1304) = stats;
  if (stats)
  {
    *(void *)(stats + 16) = *(void *)(a1 + 1144);
    uint64_t v11 = *(void *)(a1 + 1304);
    if (v11)
    {
      *(void *)(v11 + 24) = *(void *)(a1 + 1152);
      uint64_t v12 = *(void *)(a1 + 1304);
      if (v12)
      {
        *(void *)(v12 + 32) = *(void *)(a1 + 1160);
        uint64_t v13 = *(void *)(a1 + 1304);
        if (v13)
        {
          *(void *)(v13 + 40) = *(void *)(a1 + 1168);
          uint64_t v14 = *(void *)(a1 + 1304);
          if (v14)
          {
            *(_DWORD *)(v14 + 48) = *(_DWORD *)(a1 + 1176);
            uint64_t v15 = *(void *)(a1 + 1304);
            if (v15)
            {
              *(_DWORD *)(v15 + 52) = *(_DWORD *)(a1 + 1180);
              uint64_t v16 = *(void *)(a1 + 1304);
              if (v16)
              {
                *(_DWORD *)(v16 + 56) = *(_DWORD *)(a1 + 1188);
                uint64_t v17 = *(void *)(a1 + 1304);
                if (v17)
                {
                  *(_DWORD *)(v17 + 60) = *(_DWORD *)(a1 + 1192);
                  uint64_t v18 = *(void *)(a1 + 1304);
                  if (v18)
                  {
                    *(_DWORD *)(v18 + 60) = *(unsigned __int8 *)(a1 + 477) == 9;
                    uint64_t v19 = *(void *)(a1 + 1304);
                    if (v19) {
                      *(_DWORD *)(v19 + 124) = *(unsigned __int8 *)(a1 + 477);
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

  uint64_t v20 = *(void *)(a1 + 1112);
  uint64_t v121 = a2;
  if (v20 && quic_rtt_has_initial_measurement(*(void *)(v20 + 272)))
  {
    uint64_t v21 = *(void *)(a1 + 1304);
    if (!v21) {
      goto LABEL_28;
    }
    *(_DWORD *)(*(void *)(a1 + 1304) + 68LL) = (unint64_t)((4
                                                                   * (quic_rtt_get_min_rtt(*(void *)(*(void *)(a1 + 1112) + 272LL)) & 0x7FFFFFFFFFFFFFFuLL)
                                                                   * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4;
    uint64_t v21 = *(void *)(a1 + 1304);
    if (!v21) {
      goto LABEL_28;
    }
    *(_DWORD *)(*(void *)(a1 + 1304) + 72LL) = (unint64_t)((4
                                                                   * (quic_rtt_get_smoothed_rtt(*(void *)(*(void *)(a1 + 1112) + 272LL)) & 0x7FFFFFFFFFFFFFFuLL)
                                                                   * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4;
    uint64_t v21 = *(void *)(a1 + 1304);
    if (!v21) {
      goto LABEL_28;
    }
    *(_DWORD *)(*(void *)(a1 + 1304) + 76LL) = (unint64_t)((2
                                                                   * (quic_rtt_get_rtt_variance(*(void *)(*(void *)(a1 + 1112) + 272LL)) & 0xFFFFFFFFFFFFFFFuLL)
                                                                   * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4;
  }

  uint64_t v21 = *(void *)(a1 + 1304);
  if (v21)
  {
    *(_OWORD *)(v21 + 128) = *(_OWORD *)(a1 + 1288);
    uint64_t v21 = *(void *)(a1 + 1304);
  }

LABEL_83:
  int v58 = (unsigned __int16)(*(_WORD *)(a1 + 592))++ + 1;
  __int128 v59 = (void *)(a1 + 1380);
  uint64_t v60 = v121;
  if ((v58 & 0x10000) != 0)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      uint64_t v61 = _os_log_pack_size();
      uint64_t v62 = (char *)&v117 - ((MEMORY[0x1895F8858](v61, v61) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v63 = _os_log_pack_fill();
      uint64_t v64 = *(unsigned __int16 *)(a1 + 592);
      *(_DWORD *)uint64_t v63 = 136447234;
      *(void *)(v63 + 4) = "quic_conn_keepalive_handler";
      *(_WORD *)(v63 + 12) = 2082;
      *(void *)(v63 + 14) = "conn->unacked_keepalive_count";
      *(_WORD *)(v63 + 22) = 2048;
      *(void *)(v63 + 24) = v64 - 1;
      *(_WORD *)(v63 + 32) = 2048;
      *(void *)(v63 + 34) = 1LL;
      *(_WORD *)(v63 + 42) = 2048;
      *(void *)(v63 + 44) = v64;
      qlog_internal(17, (uint64_t)v62, 4754LL);
    }

    *(_WORD *)(a1 + 592) = -1;
  }

  uint64_t v65 = *(void *)(a1 + 560);
  uint64_t frame_pool = quic_packet_builder_get_frame_pool(v65);
  __int128 v67 = quic_frame_create(frame_pool, 1LL);
  *((_WORD *)v67 + 4) = 1;
  *((_BYTE *)v67 + 120) = v67[15] & 0xF9 | 4;
  quic_packet_builder_append_for_pn_space(v65, (uint64_t)v67, 3u);
  quic_timer_reschedule(v60, a3, *(void *)(a1 + 616));
  uint64_t path = quic_conn_select_next_path((void *)a1, (uint64_t)&__block_literal_global_96);
  quic_conn_send_internal(a1, path, 1LL);
  ++*(_DWORD *)(a1 + 1216);
  quic_migration_keepalive_loss_event( *(void *)(a1 + 1120),  a1,  *(void *)(a1 + 1112),  *(unsigned __int16 *)(a1 + 592));
  *v59 |= 0x800000uLL;
  uint64_t v69 = nw_protocol_instance_get_stats_region();
  if (v69) {
    uint64_t v70 = (void *)v69;
  }
  else {
    uint64_t v70 = &g_quic_stats;
  }
  *(void *)(a1 + 1312) = v70;
  uint64_t v71 = nw_protocol_instance_get_stats();
  *(void *)(a1 + 1304) = v71;
  if (v71)
  {
    *(void *)(v71 + 16) = *(void *)(a1 + 1144);
    uint64_t v72 = *(void *)(a1 + 1304);
    if (v72)
    {
      *(void *)(v72 + 24) = *(void *)(a1 + 1152);
      uint64_t v73 = *(void *)(a1 + 1304);
      if (v73)
      {
        *(void *)(v73 + 32) = *(void *)(a1 + 1160);
        uint64_t v74 = *(void *)(a1 + 1304);
        if (v74)
        {
          *(void *)(v74 + 40) = *(void *)(a1 + 1168);
          uint64_t v75 = *(void *)(a1 + 1304);
          if (v75)
          {
            *(_DWORD *)(v75 + 48) = *(_DWORD *)(a1 + 1176);
            uint64_t v76 = *(void *)(a1 + 1304);
            if (v76)
            {
              *(_DWORD *)(v76 + 52) = *(_DWORD *)(a1 + 1180);
              uint64_t v77 = *(void *)(a1 + 1304);
              if (v77)
              {
                *(_DWORD *)(v77 + 56) = *(_DWORD *)(a1 + 1188);
                uint64_t v78 = *(void *)(a1 + 1304);
                if (v78)
                {
                  *(_DWORD *)(v78 + 60) = *(_DWORD *)(a1 + 1192);
                  uint64_t v79 = *(void *)(a1 + 1304);
                  if (v79)
                  {
                    *(_DWORD *)(v79 + 60) = *(unsigned __int8 *)(a1 + 477) == 9;
                    uint64_t v80 = *(void *)(a1 + 1304);
                    if (v80) {
                      *(_DWORD *)(v80 + 124) = *(unsigned __int8 *)(a1 + 477);
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

  uint64_t v81 = *(void *)(a1 + 1112);
  if (!v81 || !quic_rtt_has_initial_measurement(*(void *)(v81 + 272))) {
    goto LABEL_111;
  }
  uint64_t v82 = *(void *)(a1 + 1304);
  if (v82)
  {
    *(_DWORD *)(*(void *)(a1 + 1304) + 68LL) = (unint64_t)((4
                                                                   * (quic_rtt_get_min_rtt(*(void *)(*(void *)(a1 + 1112) + 272LL)) & 0x7FFFFFFFFFFFFFFuLL)
                                                                   * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4;
    uint64_t v82 = *(void *)(a1 + 1304);
    if (v82)
    {
      *(_DWORD *)(*(void *)(a1 + 1304) + 72LL) = (unint64_t)((4
                                                                     * (quic_rtt_get_smoothed_rtt(*(void *)(*(void *)(a1 + 1112) + 272LL)) & 0x7FFFFFFFFFFFFFFuLL)
                                                                     * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4;
      uint64_t v82 = *(void *)(a1 + 1304);
      if (v82)
      {
        *(_DWORD *)(*(void *)(a1 + 1304) + 76LL) = (unint64_t)((2
                                                                       * (quic_rtt_get_rtt_variance(*(void *)(*(void *)(a1 + 1112) + 272LL)) & 0xFFFFFFFFFFFFFFFuLL)
                                                                       * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4;
LABEL_111:
        uint64_t v82 = *(void *)(a1 + 1304);
        if (v82)
        {
          *(_OWORD *)(v82 + 128) = *(_OWORD *)(a1 + 1288);
          uint64_t v82 = *(void *)(a1 + 1304);
        }
      }
    }
  }

  if ((*(_BYTE *)(a1 + 1381) & 2) != 0)
  {
    if (!v82) {
      return;
    }
    unsigned int v83 = *(_DWORD *)(v82 + 116) | 1;
  }

  else
  {
    if (!v82) {
      return;
    }
    unsigned int v83 = *(_DWORD *)(v82 + 116) & 0xFFFFFFFE;
  }

  *(_DWORD *)(v82 + 116) = v83;
  uint64_t v103 = *(void *)(a1 + 1304);
  if (v103)
  {
    *(_BYTE *)(v103 + 144) |= (*(_DWORD *)v59 & 0x200000) != 0;
    uint64_t v104 = *(void *)(a1 + 1304);
    if (v104)
    {
      *(_BYTE *)(v104 + 144) |= (*(_DWORD *)v59 >> 22) & 2;
      uint64_t v105 = *(void *)(a1 + 1304);
      if (v105) {
        *(_BYTE *)(v105 + 144) |= (*(_DWORD *)v59 >> 19) & 8;
      }
    }
  }

void quic_conn_close(uint64_t a1)
{
  v48[5] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if (*(unsigned __int8 *)(a1 + 477) >= 0xAu)
    {
      if (qlog_debug_enabled
        || (qlog_nwlog_enabled & 1) != 0
        || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v2 = _os_log_pack_size();
        unint64_t v3 = (char *)v48 - ((MEMORY[0x1895F8858](v2, v2) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v4 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v4 = 136446210;
        *(void *)(v4 + 4) = "quic_conn_close";
        int v5 = 2;
        uint64_t v6 = (uint64_t)v3;
        uint64_t v7 = 4494LL;
LABEL_7:
        qlog_internal(v5, v6, v7);
        return;
      }

      return;
    }

    if (!*(void *)a1) {
      goto LABEL_39;
    }
    uint64_t stats_region = nw_protocol_instance_get_stats_region();
    int v9 = &g_quic_stats;
    if (stats_region) {
      int v9 = (void *)stats_region;
    }
    *(void *)(a1 + 1312) = v9;
    uint64_t stats = nw_protocol_instance_get_stats();
    *(void *)(a1 + 1304) = stats;
    if (stats)
    {
      *(void *)(stats + 16) = *(void *)(a1 + 1144);
      uint64_t v11 = *(void *)(a1 + 1304);
      if (v11)
      {
        *(void *)(v11 + 24) = *(void *)(a1 + 1152);
        uint64_t v12 = *(void *)(a1 + 1304);
        if (v12)
        {
          *(void *)(v12 + 32) = *(void *)(a1 + 1160);
          uint64_t v13 = *(void *)(a1 + 1304);
          if (v13)
          {
            *(void *)(v13 + 40) = *(void *)(a1 + 1168);
            uint64_t v14 = *(void *)(a1 + 1304);
            if (v14)
            {
              *(_DWORD *)(v14 + 48) = *(_DWORD *)(a1 + 1176);
              uint64_t v15 = *(void *)(a1 + 1304);
              if (v15)
              {
                *(_DWORD *)(v15 + 52) = *(_DWORD *)(a1 + 1180);
                uint64_t v16 = *(void *)(a1 + 1304);
                if (v16)
                {
                  *(_DWORD *)(v16 + 56) = *(_DWORD *)(a1 + 1188);
                  uint64_t v17 = *(void *)(a1 + 1304);
                  if (v17)
                  {
                    *(_DWORD *)(v17 + 60) = *(_DWORD *)(a1 + 1192);
                    uint64_t v18 = *(void *)(a1 + 1304);
                    if (v18)
                    {
                      *(_DWORD *)(v18 + 60) = *(unsigned __int8 *)(a1 + 477) == 9;
                      uint64_t v19 = *(void *)(a1 + 1304);
                      if (v19) {
                        *(_DWORD *)(v19 + 124) = *(unsigned __int8 *)(a1 + 477);
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

    uint64_t v20 = *(void *)(a1 + 1112);
    if (v20 && quic_rtt_has_initial_measurement(*(void *)(v20 + 272)))
    {
      uint64_t v21 = *(void *)(a1 + 1304);
      if (!v21
        || (*(_DWORD *)(*(void *)(a1 + 1304) + 68LL) = (unint64_t)((4
                                                                           * (quic_rtt_get_min_rtt(*(void *)(*(void *)(a1 + 1112) + 272LL)) & 0x7FFFFFFFFFFFFFFuLL)
                                                                           * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4,
            (uint64_t v21 = *(void *)(a1 + 1304)) == 0)
        || (*(_DWORD *)(*(void *)(a1 + 1304) + 72LL) = (unint64_t)((4
                                                                           * (quic_rtt_get_smoothed_rtt(*(void *)(*(void *)(a1 + 1112) + 272LL)) & 0x7FFFFFFFFFFFFFFuLL)
                                                                           * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4,
            (uint64_t v21 = *(void *)(a1 + 1304)) == 0))
      {
LABEL_30:
        if ((*(_BYTE *)(a1 + 1381) & 2) != 0)
        {
          if (!v21) {
            goto LABEL_39;
          }
          unsigned int v22 = *(_DWORD *)(v21 + 116) | 1;
        }

        else
        {
          if (!v21) {
            goto LABEL_39;
          }
          unsigned int v22 = *(_DWORD *)(v21 + 116) & 0xFFFFFFFE;
        }

        *(_DWORD *)(v21 + 116) = v22;
        uint64_t v23 = *(void *)(a1 + 1304);
        if (v23)
        {
          uint64_t v24 = (_DWORD *)(a1 + 1380);
          *(_BYTE *)(v23 + 144) |= (*(_DWORD *)(a1 + 1380) & 0x200000) != 0;
          uint64_t v25 = *(void *)(a1 + 1304);
          if (v25)
          {
            *(_BYTE *)(v25 + 144) |= (*v24 >> 22) & 2;
            uint64_t v26 = *(void *)(a1 + 1304);
            if (v26) {
              *(_BYTE *)(v26 + 144) |= (*v24 >> 19) & 8;
            }
          }
        }

uint64_t quic_conn_send_internal(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    if (!qlog_debug_enabled && (qlog_nwlog_enabled & 1) == 0)
    {
      uint64_t result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT);
      if (!(_DWORD)result) {
        return result;
      }
    }

    uint64_t v12 = _os_log_pack_size();
    uint64_t v13 = &v20[-((MEMORY[0x1895F8858](v12, v12) + 15) & 0xFFFFFFFFFFFFFFF0LL)];
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 136446210;
    *(void *)(v14 + 4) = "quic_conn_send_internal";
    uint64_t v15 = (uint64_t)v13;
    uint64_t v16 = 2336LL;
LABEL_37:
    qlog_internal(17, v15, v16);
    return 0LL;
  }

  if (!a2)
  {
    if (!qlog_debug_enabled && (qlog_nwlog_enabled & 1) == 0)
    {
      uint64_t result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT);
      if (!(_DWORD)result) {
        return result;
      }
    }

    uint64_t v17 = _os_log_pack_size();
    uint64_t v18 = &v20[-((MEMORY[0x1895F8858](v17, v17) + 15) & 0xFFFFFFFFFFFFFFF0LL)];
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v19 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v19 = 136446210;
    *(void *)(v19 + 4) = "quic_conn_send_internal";
    uint64_t v15 = (uint64_t)v18;
    uint64_t v16 = 2337LL;
    goto LABEL_37;
  }

  uint64_t v6 = *(unsigned __int16 *)(a2 + 426);
  if (!*(_WORD *)(a2 + 426))
  {
    quic_conn_set_mss(a1, a2, *(unsigned __int16 *)(a1 + 596));
    uint64_t v6 = *(unsigned __int16 *)(a2 + 426);
  }

  char v21 = 0;
  if (!quic_conn_can_send_frames(a1, a2, &v21)) {
    return v21 != 0;
  }
  while (quic_packet_builder_has_frames(*(void *)(a1 + 560), 1u))
  {
    if ((quic_conn_send_frames_for_key_state(a1, a2, 0LL, 1LL, a3, v6) & 1) == 0) {
      return 0LL;
    }
  }

  while (quic_packet_builder_has_frames(*(void *)(a1 + 560), 2u))
  {
    uint64_t result = quic_conn_send_frames_for_key_state(a1, a2, 0LL, 2LL, a3, v6);
    if (!(_DWORD)result) {
      return result;
    }
    if ((*(_WORD *)(a1 + 1380) & 0x401) == 0) {
      quic_conn_discard_initial_keys(a1);
    }
  }

  while (quic_packet_builder_has_frames(*(void *)(a1 + 560), 3u))
  {
    int v8 = *(unsigned __int8 *)(a1 + 600);
    if (v8 == 5) {
      unsigned int v9 = 5;
    }
    else {
      unsigned int v9 = 4;
    }
    if (v8 == 1) {
      uint64_t v10 = 3LL;
    }
    else {
      uint64_t v10 = v9;
    }
    if ((quic_conn_send_frames_for_key_state(a1, a2, 0LL, v10, a3, v6) & 1) == 0) {
      return 0LL;
    }
  }

  uint64_t v11 = *(void *)(a2 + 400);
  if (v11 && (*(_BYTE *)(v11 + 90) & 2) != 0 && *(void *)(v11 + 80) == a2) {
    quic_pmtud_send_probe();
  }
  return 1LL;
}

BOOL quic_conn_can_send_frames(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  v30[1] = *MEMORY[0x1895F89C0];
  *a3 = 0;
  if (*(_BYTE *)(a1 + 477) == 11)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v4 = _os_log_pack_size();
      int v5 = (char *)v30 - ((MEMORY[0x1895F8858](v4, v4) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v6 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v6 = 136446210;
      *(void *)(v6 + 4) = "quic_conn_can_send_frames";
      qlog_internal(2, (uint64_t)v5, 1821LL);
    }

    BOOL result = 0LL;
    *a3 = 1;
    return result;
  }

  if (quic_path_is_flow_controlled(a2))
  {
    if (!qlog_debug_enabled && (qlog_nwlog_enabled & 1) == 0)
    {
      BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG);
      if (!result) {
        return result;
      }
    }

    uint64_t v10 = _os_log_pack_size();
    uint64_t v11 = (char *)v30 - ((MEMORY[0x1895F8858](v10, v10) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v12 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v12 = 136446210;
    *(void *)(v12 + 4) = "quic_conn_can_send_frames";
    uint64_t v13 = (uint64_t)v11;
    uint64_t v14 = 1827LL;
LABEL_26:
    qlog_internal(2, v13, v14);
    return 0LL;
  }

  if ((*(void *)(a1 + 1380) & 0x100) != 0)
  {
    if (!qlog_debug_enabled && (qlog_nwlog_enabled & 1) == 0)
    {
      BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG);
      if (!result) {
        return result;
      }
    }

    uint64_t v17 = _os_log_pack_size();
    uint64_t v18 = (char *)v30 - ((MEMORY[0x1895F8858](v17, v17) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v19 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v19 = 136446210;
    *(void *)(v19 + 4) = "quic_conn_can_send_frames";
    uint64_t v13 = (uint64_t)v18;
    uint64_t v14 = 1833LL;
    goto LABEL_26;
  }

  if ((*(void *)(a1 + 1380) & 0x801LL) == 1)
  {
    unint64_t v15 = *(unsigned __int8 *)(a1 + 600);
    char v16 = v15 >= 6 ? 0 : 0x30303020100uLL >> (8 * v15);
    if (*(void *)(a1 + 1168)
       + (unint64_t)quic_packet_builder_rough_size(*(void *)(a1 + 560), v16 & 3) >= 3LL * *(void *)(a1 + 1152))
    {
      if (!qlog_debug_enabled && (qlog_nwlog_enabled & 1) == 0)
      {
        BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR);
        if (!result) {
          return result;
        }
      }

      if (*(void *)(a1 + 1112))
      {
        uint64_t v20 = _os_log_pack_size();
        char v21 = (char *)v30 - ((MEMORY[0x1895F8858](v20, v20) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v22 = _os_log_pack_fill();
        uint64_t v23 = quic_cid_describe((unsigned __int8 *)(*(void *)(a1 + 1112) + 38LL));
        uint64_t v24 = quic_cid_describe((unsigned __int8 *)(*(void *)(a1 + 1112) + 17LL));
        *(_DWORD *)uint64_t v22 = 136446978;
        *(void *)(v22 + 4) = "quic_conn_can_send_frames";
        *(_WORD *)(v22 + 12) = 2082;
        *(void *)(v22 + 14) = a1 + 976;
        *(_WORD *)(v22 + 22) = 2082;
        *(void *)(v22 + 24) = v23;
        *(_WORD *)(v22 + 32) = 2082;
        *(void *)(v22 + 34) = v24;
        qlog_internal(16, (uint64_t)v21, 1855LL);
      }

      return 0LL;
    }
  }

  if ((quic_migration_is_disabled(*(void *)(a1 + 1120)) & 1) != 0
    || *(_BYTE *)(a1 + 477) != 9
    || quic_path_is_established(a2))
  {
    return 1LL;
  }

  if (qlog_debug_enabled
    || (qlog_nwlog_enabled & 1) != 0
    || (BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG)))
  {
    uint64_t v25 = _os_log_pack_size();
    uint64_t v26 = (char *)v30 - ((MEMORY[0x1895F8858](v25, v25) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v27 = _os_log_pack_fill();
    unint64_t v28 = *(unsigned __int8 *)(a2 + 16);
    if (v28 > 8) {
      uint64_t v29 = "???";
    }
    else {
      uint64_t v29 = off_18A113D78[v28];
    }
    *(_DWORD *)uint64_t v27 = 136446722;
    *(void *)(v27 + 4) = "quic_conn_can_send_frames";
    *(_WORD *)(v27 + 12) = 2048;
    *(void *)(v27 + 14) = a2;
    *(_WORD *)(v27 + 22) = 2082;
    *(void *)(v27 + 24) = v29;
    qlog_internal(2, (uint64_t)v26, 1868LL);
    return 0LL;
  }

  return result;
}

uint64_t quic_conn_send_frames_for_key_state( uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, unsigned int a5, uint64_t a6)
{
  uint64_t v136 = *MEMORY[0x1895F89C0];
  if (!(_DWORD)a4)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return 0LL;
    }

    uint64_t v68 = _os_log_pack_size();
    uint64_t v69 = (char *)v86 - ((MEMORY[0x1895F8858](v68, v68) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v70 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v70 = 136446210;
    *(void *)(v70 + 4) = "quic_conn_send_frames_for_key_state";
    uint64_t v71 = (uint64_t)v69;
    uint64_t v72 = 2065LL;
    goto LABEL_118;
  }

  if (!(_DWORD)a6)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return 0LL;
    }

    uint64_t v73 = _os_log_pack_size();
    uint64_t v74 = (char *)v86 - ((MEMORY[0x1895F8858](v73, v73) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v75 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v75 = 136446210;
    *(void *)(v75 + 4) = "quic_conn_send_frames_for_key_state";
    uint64_t v71 = (uint64_t)v74;
    uint64_t v72 = 2066LL;
LABEL_118:
    qlog_internal(17, v71, v72);
    return 0LL;
  }

  uint64_t v11 = (unint64_t *)a1;
  uint64_t v132 = 0LL;
  v133 = &v132;
  uint64_t v134 = 0x2000000000LL;
  char v135 = 0;
  BOOL v12 = a4 < 6;
  else {
    int v13 = 0x30303020100uLL >> (8 * a4);
  }
  if (!a3 && !quic_packet_builder_has_frames(*(void *)(a1 + 560), v13))
  {
    uint64_t v16 = 1LL;
    goto LABEL_103;
  }

  BOOL v93 = v12;
  uint64_t v14 = (char *)v11 + 1380;
  uint64_t v15 = *(unint64_t *)((char *)v11 + 1380);
  if (((_DWORD)a4 != 1 || (v15 & 0x400) == 0) && ((_DWORD)a4 != 2 || (v15 & 0x4000000) == 0))
  {
    unsigned int v92 = a5;
    uint64_t v17 = (char *)&unk_18C6EB000;
    if (quic_protector_seal_key_ready(v11[71], a4))
    {
      int v91 = v13;
      if (a3)
      {
        uint64_t v18 = (uint64_t *)*a3;
        if (*a3)
        {
          v86[1] = v86;
          uint64_t v87 = a2;
          uint64_t v88 = v11;
          uint64_t v89 = (char *)v11 + 1380;
          do
          {
            else {
              unint64_t v19 = *v18 - 12237272;
            }
            if (quic_frame_is_type_index_valid(v19, *v18) && ((uint64_t)quic_frames[6 * v19 + 5] & 1) == 0)
            {
              BOOL has_ack_eliciting_frame = 1;
              goto LABEL_30;
            }

            uint64_t v18 = (uint64_t *)v18[12];
          }

          while (v18);
          BOOL has_ack_eliciting_frame = 0;
LABEL_30:
          a2 = v87;
          uint64_t v11 = v88;
          uint64_t v17 = (_BYTE *)&unk_18C6EB000;
          uint64_t v14 = v89;
        }

        else
        {
          BOOL has_ack_eliciting_frame = 0;
        }

        LOBYTE(v13) = v91;
      }

      else
      {
        BOOL has_ack_eliciting_frame = quic_packet_builder_has_ack_eliciting_frame(v11[70], v13);
      }

      largest_acked_uint64_t pn = quic_recovery_get_largest_acked_pn(v11[119], v13, a2);
      char v22 = v17[369];
      if (qlog_datapath_enabled || v17[369])
      {
        if (qlog_debug_enabled) {
          char v22 = 1;
        }
        if ((v22 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v79 = _os_log_pack_size();
          uint64_t v89 = v14;
          uint64_t v80 = (char *)v86 - ((MEMORY[0x1895F8858](v79, v79) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          uint64_t v81 = _os_log_pack_fill();
          uint64_t v82 = quic_cid_describe((unsigned __int8 *)(a2 + 17));
          *(_DWORD *)uint64_t v81 = 136446722;
          *(void *)(v81 + 4) = "quic_conn_send_frames_for_key_state";
          *(_WORD *)(v81 + 12) = 2048;
          *(void *)(v81 + 14) = a2;
          *(_WORD *)(v81 + 22) = 2082;
          *(void *)(v81 + 24) = v82;
          qlog_internal(2, (uint64_t)v80, 2105LL);
          uint64_t v17 = (_BYTE *)&unk_18C6EB000;
          uint64_t v14 = v89;
        }
      }

      if (!a3)
      {
        unsigned int v23 = v91;
        if (!quic_packet_builder_find_for_pn_space(v11[70], 2LL, v91)
          && !quic_packet_builder_find_for_pn_space(v11[70], 12237312LL, v23))
        {
          unsigned int v24 = v91;
          LODWORD(v89) = quic_packet_builder_remaining_length( v11[70],  v11[71],  v91,  a2,  largest_acked_pn,  a6);
          received_ip_ecn_counter = (unint64_t *)quic_ecn_get_received_ip_ecn_counter(v11[121], v24, a2);
          uint64_t v26 = v11[120];
          unint64_t v27 = v11[67];
          uint64_t v87 = *(void *)(a2 + 336);
          uint64_t v88 = received_ip_ecn_counter;
          unsigned int v28 = quic_ack_for_pn_space(v26, v27, v24, v87, 0LL, received_ip_ecn_counter);
          if (v89 > v28)
          {
            quic_ack_assemble_for_pn_space((char *)v11[120], v11[67], v24, v87, v11[70], v88);
            *((_BYTE *)v133 + 24) = 1;
          }
        }

        if ((_DWORD)a4 == 1 && !quic_packet_builder_find_for_pn_space(v11[70], 0LL, 1u)) {
          quic_frame_alloc_PADDING(v11[70], -1, 1u, 0, 0LL);
        }
      }

      int v29 = quic_packet_builder_calculate_size(v11[70], v11[71], a4, a2, largest_acked_pn, a3, a6);
      if (v29)
      {
        unsigned __int16 v30 = v29 + quic_protector_get_tag_size(v11[71], a4);
        if ((v92 & 1) != 0 || (quic_cc_can_send_packet(*(void *)(a2 + 360)) & 1) != 0)
        {
          uint64_t v31 = v14;
          uint64_t v128 = 0LL;
          uint64_t v129 = &v128;
          uint64_t v130 = 0x2000000000LL;
          uint64_t v32 = mach_continuous_time();
          if (timebase_info_once != -1) {
            dispatch_once(&timebase_info_once, &__block_literal_global_397);
          }
          unint64_t v131 = timebase_info_info * v32 / dword_18C4D003C / 0x3E8;
          unint64_t v33 = v129[3];
          unint64_t v34 = v11[80];
          BOOL v35 = v33 > v34;
          unint64_t v36 = v33 - v34;
          if (v35 && v36 >= 0xABA9501 && *((_BYTE *)v11 + 477) == 9)
          {
            quic_cc_idle_timeout(*(void *)(a2 + 360));
            uint64_t v37 = *(void *)(a2 + 392);
            if (v37) {
              quic_pacer_reset(v37);
            }
          }

          uint64_t v124 = 0LL;
          uint64_t v125 = &v124;
          uint64_t v126 = 0x2000000000LL;
          uint64_t v127 = 0LL;
          uint64_t v120 = 0LL;
          uint64_t v121 = &v120;
          uint64_t v122 = 0x2000000000LL;
          uint64_t v123 = 0LL;
          uint64_t v116 = 0LL;
          uint64_t v117 = &v116;
          uint64_t v118 = 0x2000000000LL;
          char v119 = 0;
          uint64_t v112 = 0LL;
          uint64_t v113 = &v112;
          uint64_t v114 = 0x2000000000LL;
          uint64_t v115 = 0LL;
          uint64_t v38 = *(void *)a2;
          uint64_t v94 = MEMORY[0x1895F87A8];
          uint64_t v95 = 0x40000000LL;
          uint64_t v96 = __quic_conn_send_frames_for_key_state_block_invoke;
          int v97 = &unk_18A1181F0;
          uint64_t v104 = a2;
          uint64_t v105 = v11;
          uint64_t v98 = &v116;
          uint64_t v99 = &v124;
          unsigned __int16 v108 = v30;
          BOOL v109 = has_ack_eliciting_frame;
          int v100 = &v112;
          int v101 = &v120;
          char v110 = a4;
          uint64_t v106 = v38;
          uint64_t v107 = a3;
          int v102 = &v128;
          uint64_t v103 = &v132;
          char v111 = v91;
          int v39 = nw_protocol_request_outbound_data();
          if (v39 && !*((_BYTE *)v117 + 24)) {
            goto LABEL_59;
          }
          if (v30)
          {
            uint64_t v40 = (char *)calloc(1uLL, v30);
            if (v40)
            {
              v121[3] = (uint64_t)v40;
              if (!quic_conn_assemble_and_encrypt(v11, a4, a2, v125 + 3, a3, v40, v30))
              {
                if ((qlog_debug_enabled
                   || (v17[369] & 1) != 0
                   || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
                  && v11[139])
                {
                  uint64_t v47 = _os_log_pack_size();
                  __int128 v48 = (char *)v86 - ((MEMORY[0x1895F8858](v47, v47) + 15) & 0xFFFFFFFFFFFFFFF0LL);
                  _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
                  uint64_t v49 = _os_log_pack_fill();
                  uint64_t v50 = quic_cid_describe((unsigned __int8 *)(v11[139] + 38));
                  int v51 = quic_cid_describe((unsigned __int8 *)(v11[139] + 17));
                  *(_DWORD *)uint64_t v49 = 136446978;
                  *(void *)(v49 + 4) = "quic_conn_send_frames_for_key_state";
                  *(_WORD *)(v49 + 12) = 2082;
                  *(void *)(v49 + 14) = v11 + 122;
                  *(_WORD *)(v49 + 22) = 2082;
                  *(void *)(v49 + 24) = v50;
                  *(_WORD *)(v49 + 32) = 2082;
                  *(void *)(v49 + 34) = v51;
                  qlog_internal(16, (uint64_t)v48, 2308LL);
                }

                uint64_t v52 = (void *)v125[3];
                if (v52)
                {
                  _quic_packet_destroy(v52);
                  v125[3] = 0LL;
                }

                uint64_t v53 = (void *)v121[3];
                if (v53)
                {
                  free(v53);
                  uint64_t v16 = 0LL;
                  v121[3] = 0LL;
                }

                else
                {
                  uint64_t v16 = 0LL;
                }

                goto LABEL_102;
              }

LABEL_59:
              if (*((_BYTE *)v133 + 24) && ((v31[4] & 2) != 0 || (quic_conn_is_pacing((uint64_t)v11, a2) & 1) == 0))
              {
                if ((v31[4] & 2) != 0 && (v39 & quic_conn_is_pacing((uint64_t)v11, a2)) == 1)
                {
                  unint64_t v61 = v113[3];
                  if (!v61)
                  {
                    if (qlog_debug_enabled
                      || (v17[369] & 1) != 0
                      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
                    {
                      uint64_t v83 = _os_log_pack_size();
                      uint64_t v84 = (char *)v86 - ((MEMORY[0x1895F8858](v83, v83) + 15) & 0xFFFFFFFFFFFFFFF0LL);
                      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
                      uint64_t v85 = _os_log_pack_fill();
                      *(_DWORD *)uint64_t v85 = 136446210;
                      *(void *)(v85 + 4) = "quic_conn_send_frames_for_key_state";
                      qlog_internal(17, (uint64_t)v84, 2322LL);
                      unint64_t v61 = v113[3];
                    }

                    else
                    {
                      unint64_t v61 = 0LL;
                    }
                  }

                  uint64_t v62 = v11[120];
                  unint64_t v63 = v61 / 0x3E8;
                }

                else
                {
                  uint64_t v62 = v11[120];
                  unint64_t v63 = v129[3];
                }

                quic_ack_sent(v62, v63);
              }

              uint64_t v16 = 1LL;
LABEL_102:
              _Block_object_dispose(&v112, 8);
              _Block_object_dispose(&v116, 8);
              _Block_object_dispose(&v120, 8);
              _Block_object_dispose(&v124, 8);
              _Block_object_dispose(&v128, 8);
              goto LABEL_103;
            }
          }

          else
          {
            qlog_abort_internal("%s strict_calloc called with size 0", "strict_calloc");
          }

          uint64_t v77 = qlog_abort_internal("%s strict_calloc(%zu, %zu) failed", "strict_calloc", 1uLL, v30);
          goto LABEL_133;
        }

        char v54 = v17[369];
        if (qlog_datapath_enabled || v17[369])
        {
          if (qlog_debug_enabled) {
            char v54 = 1;
          }
          if ((v54 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v55 = _os_log_pack_size();
            int v56 = (char *)v86 - ((MEMORY[0x1895F8858](v55, v55) + 15) & 0xFFFFFFFFFFFFFFF0LL);
            _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
            uint64_t v57 = _os_log_pack_fill();
            *(_DWORD *)uint64_t v57 = 136446466;
            *(void *)(v57 + 4) = "quic_conn_send_frames_for_key_state";
            *(_WORD *)(v57 + 12) = 1024;
            *(_DWORD *)(v57 + 14) = v30;
            int v44 = 2;
            uint64_t v45 = (uint64_t)v56;
            uint64_t v46 = 2182LL;
            goto LABEL_68;
          }
        }
      }

      else
      {
        if (!a3)
        {
          uint64_t v58 = *(void *)(a2 + 400);
          if (v58)
          {
            if ((*(_BYTE *)(v58 + 90) & 2) != 0)
            {
              BOOL v59 = *(void *)(v58 + 80) == a2;
              unsigned int v60 = v93 & (0x38u >> a4) ^ 1;
              if (!v59) {
                LOBYTE(v60) = 1;
              }
              if ((v60 & 1) == 0 && quic_packet_builder_has_frames(v11[70], v91))
              {
                if (quic_packet_builder_split_frames(v11[70], (uint64_t)v11, a2, largest_acked_pn, a6))
                {
                  uint64_t v16 = quic_conn_send_frames_for_key_state(v11, a2, 0LL, a4, v92, a6);
                }

                else
                {
                  if (qlog_debug_enabled
                    || (v17[369] & 1) != 0
                    || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
                  {
                    uint64_t v65 = _os_log_pack_size();
                    uint64_t v66 = (char *)v86 - ((MEMORY[0x1895F8858](v65, v65) + 15) & 0xFFFFFFFFFFFFFFF0LL);
                    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
                    uint64_t v67 = _os_log_pack_fill();
                    *(_DWORD *)uint64_t v67 = 136446210;
                    *(void *)(v67 + 4) = "quic_conn_send_frames_for_key_state";
                    qlog_internal(16, (uint64_t)v66, 2161LL);
                  }

                  v11[134] = 1LL;
                  v11[135] = (unint64_t)"no frames fit in current MSS";
                  quic_conn_close((uint64_t)v11);
                  uint64_t v16 = 0LL;
                }

                goto LABEL_103;
              }
            }
          }
        }

        if (qlog_debug_enabled || (v17[369] & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
        {
          uint64_t v41 = _os_log_pack_size();
          uint64_t v42 = (char *)v86 - ((MEMORY[0x1895F8858](v41, v41) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          uint64_t v43 = _os_log_pack_fill();
          *(_DWORD *)uint64_t v43 = 136446210;
          *(void *)(v43 + 4) = "quic_conn_send_frames_for_key_state";
          int v44 = 16;
          uint64_t v45 = (uint64_t)v42;
          uint64_t v46 = 2169LL;
LABEL_68:
          qlog_internal(v44, v45, v46);
          uint64_t v16 = 0LL;
          goto LABEL_103;
        }
      }
    }

    else
    {
      char v20 = qlog_nwlog_enabled;
      if (qlog_datapath_enabled || qlog_nwlog_enabled)
      {
        if (qlog_debug_enabled) {
          char v20 = 1;
        }
        if ((v20 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v76 = _os_log_pack_size();
          uint64_t v17 = (char *)v86 - ((MEMORY[0x1895F8858](v76, v76) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          uint64_t v77 = _os_log_pack_fill();
          if (a4 <= 5)
          {
            uint64_t v78 = off_18A1184D8[(a4 - 1)];
LABEL_134:
            *(_DWORD *)uint64_t v77 = 136446466;
            *(void *)(v77 + 4) = "quic_conn_send_frames_for_key_state";
            *(_WORD *)(v77 + 12) = 2082;
            *(void *)(v77 + 14) = v78;
            qlog_internal(2, (uint64_t)v17, 2089LL);
            uint64_t v16 = 0LL;
            goto LABEL_103;
          }

LABEL_133:
          uint64_t v78 = "???";
          goto LABEL_134;
        }
      }
    }

    uint64_t v16 = 0LL;
    goto LABEL_103;
  }

  quic_packet_builder_flush_for_pn_space(v11[70], v13);
  uint64_t v16 = 1LL;
LABEL_103:
  _Block_object_dispose(&v132, 8);
  return v16;
}

void quic_conn_discard_initial_keys(uint64_t a1)
{
  v5[1] = *MEMORY[0x1895F89C0];
  quic_conn_discard_keys(a1, 1u);
  *(void *)(a1 + 1380) |= 0x400uLL;
  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v2 = _os_log_pack_size();
    unint64_t v3 = (char *)v5 - ((MEMORY[0x1895F8858](v2, v2) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v4 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v4 = 136446210;
    *(void *)(v4 + 4) = "quic_conn_discard_initial_keys";
    qlog_internal(2, (uint64_t)v3, 4995LL);
  }

void quic_conn_discard_keys(uint64_t a1, unsigned int a2)
{
  uint64_t v4 = *(void *)(a1 + 1112);
  unint64_t v5 = (0x30303020100uLL >> (8 * a2)) & 3;
  quic_packet_builder_flush_for_pn_space(*(void *)(a1 + 560), (0x30303020100uLL >> (8 * a2)) & 3);
  uint64_t v6 = *(char **)(a1 + 960);
  uint64_t v7 = *(void *)(a1 + 536);
  uint64_t v8 = *(void *)(a1 + 560);
  received_ip_ecn_counter = (unint64_t *)quic_ecn_get_received_ip_ecn_counter(*(void *)(a1 + 968), v5, v4);
  quic_ack_assemble_for_pn_space(v6, v7, v5, -1LL, v8, received_ip_ecn_counter);
  uint64_t path = quic_conn_select_next_path((void *)a1, (uint64_t)&__block_literal_global_98);
  quic_conn_send_internal(a1, path, 0LL);
  quic_protector_drop_key_state(*(void *)(a1 + 568), a2);
  quic_recovery_reset_pn_space(*(void **)(a1 + 952), v5);
  quic_recovery_destroy_pn_space(*(void *)(a1 + 952), v5);
  quic_ack_flush_for_pn_space(*(char **)(a1 + 960), v5);
  quic_recovery_reset_pto_count(*(void *)(a1 + 952));
}

uint64_t __quic_conn_send_frames_block_invoke()
{
  return 1LL;
}

void __quic_conn_send_frames_for_key_state_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  uint64_t v37 = 0LL;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x2000000000LL;
  uint64_t v40 = *(void *)(a1 + 80);
  if (a2)
  {
    v28[2] = MEMORY[0x1895F87A8];
    v28[3] = 0x40000000LL;
    v28[4] = __quic_conn_send_frames_for_key_state_block_invoke_207;
    v28[5] = &unk_18A1181C8;
    int v35 = *(_DWORD *)(a1 + 112);
    uint64_t v3 = *(void *)(a1 + 32);
    __int128 v32 = *(_OWORD *)(a1 + 88);
    v28[6] = v3;
    v28[7] = &v37;
    uint64_t v4 = *(void *)(a1 + 104);
    __int128 v5 = *(_OWORD *)(a1 + 56);
    __int128 v29 = *(_OWORD *)(a1 + 40);
    __int128 v30 = v5;
    uint64_t v33 = v4;
    uint64_t v34 = a2;
    uint64_t v31 = *(void *)(a1 + 72);
    char v36 = *(_BYTE *)(a1 + 116);
    nw_protocol_data_access_buffer();
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
    if ((qlog_debug_enabled
       || (qlog_nwlog_enabled & 1) != 0
       || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
      && *(void *)(*(void *)(a1 + 88) + 1112LL))
    {
      uint64_t v6 = _os_log_pack_size();
      v28[1] = v28;
      uint64_t v7 = (char *)v28 - ((MEMORY[0x1895F8858](v6, v6) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v8 = _os_log_pack_fill();
      uint64_t v9 = *(void *)(a1 + 88);
      v28[0] = v9 + 976;
      uint64_t v10 = *(unsigned __int8 **)(v9 + 1112);
      if (quic_cid_describe_state % 3 == 2) {
        uint64_t v11 = &quic_cid_describe_cid_buf2;
      }
      else {
        uint64_t v11 = &quic_cid_describe_cid_buf3;
      }
      if (quic_cid_describe_state % 3) {
        BOOL v12 = v11;
      }
      else {
        BOOL v12 = &quic_cid_describe_cid_buf1;
      }
      int v13 = ++quic_cid_describe_state;
      unsigned int v14 = v10[38];
      __int128 v15 = 0uLL;
      *(_OWORD *)((char *)v12 + 25) = 0u;
      if (v14 >= 0x14) {
        uint64_t v16 = 20LL;
      }
      else {
        uint64_t v16 = v14;
      }
      _OWORD *v12 = 0uLL;
      v12[1] = 0uLL;
      if ((_DWORD)v16)
      {
        uint64_t v17 = v10 + 39;
        do
        {
          int v18 = *v17++;
          snprintf((char *)v12, 0x29uLL, "%s%02x", (const char *)v12, v18);
          --v16;
        }

        while (v16);
        uint64_t v10 = *(unsigned __int8 **)(*(void *)(a1 + 88) + 1112LL);
        int v13 = quic_cid_describe_state;
        __int128 v15 = 0uLL;
      }

      if (v13 % 3 == 2) {
        unint64_t v19 = &quic_cid_describe_cid_buf2;
      }
      else {
        unint64_t v19 = &quic_cid_describe_cid_buf3;
      }
      if (v13 % 3) {
        char v20 = v19;
      }
      else {
        char v20 = &quic_cid_describe_cid_buf1;
      }
      quic_cid_describe_state = v13 + 1;
      if (v10[17] >= 0x14u) {
        uint64_t v21 = 20LL;
      }
      else {
        uint64_t v21 = v10[17];
      }
      *char v20 = v15;
      v20[1] = v15;
      *(_OWORD *)((char *)v20 + 25) = v15;
      if ((_DWORD)v21)
      {
        char v22 = v10 + 18;
        do
        {
          int v23 = *v22++;
          snprintf((char *)v20, 0x29uLL, "%s%02x", (const char *)v20, v23);
          --v21;
        }

        while (v21);
      }

      *(_DWORD *)uint64_t v8 = 136446978;
      *(void *)(v8 + 4) = "quic_conn_send_frames_for_key_state_block_invoke";
      *(_WORD *)(v8 + 12) = 2082;
      *(void *)(v8 + 14) = v28[0];
      *(_WORD *)(v8 + 22) = 2082;
      *(void *)(v8 + 24) = v12;
      *(_WORD *)(v8 + 32) = 2082;
      *(void *)(v8 + 34) = v20;
      qlog_internal(16, (uint64_t)v7, 2224LL);
    }

    refreshed = quic_conn_refresh_path(*(void *)(a1 + 88), *(void *)(a1 + 96));
    uint64_t v25 = v38;
    v38[3] = (uint64_t)refreshed;
    uint64_t v26 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
    if (v26)
    {
      *(void *)(v26 + 144) = refreshed;
      quic_conn_handle_sent_packet( *(void *)(a1 + 88),  v25[3],  *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL),  *(unsigned __int16 *)(a1 + 112),  *(_BYTE *)(a1 + 114),  (unint64_t *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL));
    }

    unint64_t v27 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
    if (v27)
    {
      free(v27);
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0LL;
    }
  }

  _Block_object_dispose(&v37, 8);
}

BOOL quic_conn_assemble_and_encrypt( void *a1, uint64_t a2, unint64_t a3, uint64_t *a4, uint64_t *a5, char *a6, int a7)
{
  uint64_t v81 = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || (BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT)))
    {
      uint64_t v62 = _os_log_pack_size();
      unint64_t v63 = (char *)&v78 - ((MEMORY[0x1895F8858](v62, v62) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v64 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v64 = 136446210;
      *(void *)(v64 + 4) = "quic_conn_assemble_and_encrypt";
      qlog_internal(17, (uint64_t)v63, 1885LL);
      return 0LL;
    }

    return result;
  }

  if (!(_DWORD)a2)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || (BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT)))
    {
      uint64_t v65 = _os_log_pack_size();
      uint64_t v66 = (char *)&v78 - ((MEMORY[0x1895F8858](v65, v65) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v67 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v67 = 136446210;
      *(void *)(v67 + 4) = "quic_conn_assemble_and_encrypt";
      qlog_internal(17, (uint64_t)v66, 1886LL);
      return 0LL;
    }

    return result;
  }

  if (!a6)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || (BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT)))
    {
      uint64_t v68 = _os_log_pack_size();
      uint64_t v69 = (char *)&v78 - ((MEMORY[0x1895F8858](v68, v68) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v70 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v70 = 136446210;
      *(void *)(v70 + 4) = "quic_conn_assemble_and_encrypt";
      qlog_internal(17, (uint64_t)v69, 1887LL);
      return 0LL;
    }

    return result;
  }

  if (!a7)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || (BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT)))
    {
      uint64_t v71 = _os_log_pack_size();
      uint64_t v72 = (char *)&v78 - ((MEMORY[0x1895F8858](v71, v71) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v73 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v73 = 136446210;
      *(void *)(v73 + 4) = "quic_conn_assemble_and_encrypt";
      qlog_internal(17, (uint64_t)v72, 1888LL);
      return 0LL;
    }

    return result;
  }

  uint64_t v80 = a4;
  uint64_t v13 = a1[119];
  unint64_t v14 = 0x30303020100uLL >> (8 * a2);
  largest_acked_uint64_t pn = quic_recovery_get_largest_acked_pn(v13, v14 & 3, a3);
  char v16 = qlog_nwlog_enabled;
  if (qlog_datapath_enabled || qlog_nwlog_enabled)
  {
    if (qlog_debug_enabled) {
      char v16 = 1;
    }
    if ((v16 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v74 = _os_log_pack_size();
      uint64_t v75 = (char *)&v78 - ((MEMORY[0x1895F8858](v74, v74) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v76 = _os_log_pack_fill();
      else {
        uint64_t v77 = off_18A1184D8[(a2 - 1)];
      }
      *(_DWORD *)uint64_t v76 = 136446722;
      *(void *)(v76 + 4) = "quic_conn_assemble_and_encrypt";
      *(_WORD *)(v76 + 12) = 2082;
      *(void *)(v76 + 14) = v77;
      *(_WORD *)(v76 + 22) = 1024;
      *(_DWORD *)(v76 + 24) = a7;
      qlog_internal(2, (uint64_t)v75, 1894LL);
    }
  }

  tag_size_t size = quic_protector_get_tag_size(a1[71], a2);
  unsigned __int8 v18 = tag_size;
  unsigned __int16 v19 = a7 - tag_size;
  uint64_t v20 = a1[70];
  uint64_t v21 = quic_packet_create(*(void *)(v20 + 8));
  char v22 = v21;
  if (a5) {
    BOOL v23 = _quic_packet_builder_assemble(v20, (uint64_t)a1, a2, a3, largest_acked_pn, a5, a6, v19, v18, (uint64_t)v21);
  }
  else {
    BOOL v23 = _quic_packet_builder_assemble(v20, (uint64_t)a1, a2, a3, largest_acked_pn, 0LL, a6, v19, v18, (uint64_t)v21);
  }
  if (v23)
  {
    unsigned int v24 = v80;
    uint64_t *v80 = (uint64_t)v22;
    if (v22)
    {
      v22[18] = a3;
      if (quic_protector_seal(a1[71], *v24)) {
        return 1LL;
      }
      if (qlog_debug_enabled
        || (qlog_nwlog_enabled & 1) != 0
        || (BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR)))
      {
        if (!a1[139]) {
          return 0LL;
        }
        uint64_t v45 = _os_log_pack_size();
        uint64_t v80 = &v78;
        uint64_t v46 = (char *)&v78 - ((MEMORY[0x1895F8858](v45, v45) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v47 = _os_log_pack_fill();
        uint64_t v79 = a1 + 122;
        __int128 v48 = (unsigned __int8 *)a1[139];
        if (quic_cid_describe_state % 3 == 2) {
          uint64_t v49 = &quic_cid_describe_cid_buf2;
        }
        else {
          uint64_t v49 = &quic_cid_describe_cid_buf3;
        }
        if (quic_cid_describe_state % 3) {
          uint64_t v50 = v49;
        }
        else {
          uint64_t v50 = &quic_cid_describe_cid_buf1;
        }
        int v51 = ++quic_cid_describe_state;
        unsigned int v52 = v48[38];
        __int128 v53 = 0uLL;
        *(_OWORD *)((char *)v50 + 25) = 0u;
        if (v52 >= 0x14) {
          uint64_t v54 = 20LL;
        }
        else {
          uint64_t v54 = v52;
        }
        _OWORD *v50 = 0uLL;
        v50[1] = 0uLL;
        if ((_DWORD)v54)
        {
          uint64_t v55 = v48 + 39;
          do
          {
            int v56 = *v55++;
            snprintf((char *)v50, 0x29uLL, "%s%02x", (const char *)v50, v56);
            --v54;
          }

          while (v54);
          __int128 v48 = (unsigned __int8 *)a1[139];
          int v51 = quic_cid_describe_state;
          __int128 v53 = 0uLL;
        }

        if (v51 % 3 == 2) {
          uint64_t v57 = &quic_cid_describe_cid_buf2;
        }
        else {
          uint64_t v57 = &quic_cid_describe_cid_buf3;
        }
        if (v51 % 3) {
          uint64_t v58 = v57;
        }
        else {
          uint64_t v58 = &quic_cid_describe_cid_buf1;
        }
        quic_cid_describe_state = v51 + 1;
        if (v48[17] >= 0x14u) {
          uint64_t v59 = 20LL;
        }
        else {
          uint64_t v59 = v48[17];
        }
        *uint64_t v58 = v53;
        v58[1] = v53;
        *(_OWORD *)((char *)v58 + 25) = v53;
        if ((_DWORD)v59)
        {
          unsigned int v60 = v48 + 18;
          do
          {
            int v61 = *v60++;
            snprintf((char *)v58, 0x29uLL, "%s%02x", (const char *)v58, v61);
            --v59;
          }

          while (v59);
        }

        *(_DWORD *)uint64_t v47 = 136446978;
        *(void *)(v47 + 4) = "quic_conn_assemble_and_encrypt";
        *(_WORD *)(v47 + 12) = 2082;
        *(void *)(v47 + 14) = v79;
        *(_WORD *)(v47 + 22) = 2082;
        *(void *)(v47 + 24) = v50;
        *(_WORD *)(v47 + 32) = 2082;
        *(void *)(v47 + 34) = v58;
        uint64_t v43 = (uint64_t)v46;
        uint64_t v44 = 1917LL;
        goto LABEL_47;
      }

      return result;
    }
  }

  else
  {
    _quic_packet_destroy(v22);
    uint64_t *v80 = 0LL;
  }

  if (qlog_debug_enabled
    || (qlog_nwlog_enabled & 1) != 0
    || (BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR)))
  {
    if (!a1[139]) {
      return 0LL;
    }
    uint64_t v26 = _os_log_pack_size();
    uint64_t v80 = &v78;
    unint64_t v27 = (char *)&v78 - ((MEMORY[0x1895F8858](v26, v26) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v28 = _os_log_pack_fill();
    uint64_t v79 = a1 + 122;
    __int128 v29 = (unsigned __int8 *)a1[139];
    if (quic_cid_describe_state % 3 == 2) {
      __int128 v30 = &quic_cid_describe_cid_buf2;
    }
    else {
      __int128 v30 = &quic_cid_describe_cid_buf3;
    }
    if (quic_cid_describe_state % 3) {
      uint64_t v31 = v30;
    }
    else {
      uint64_t v31 = &quic_cid_describe_cid_buf1;
    }
    int v32 = ++quic_cid_describe_state;
    unsigned int v33 = v29[38];
    __int128 v34 = 0uLL;
    *(_OWORD *)((char *)v31 + 25) = 0u;
    if (v33 >= 0x14) {
      uint64_t v35 = 20LL;
    }
    else {
      uint64_t v35 = v33;
    }
    _OWORD *v31 = 0uLL;
    v31[1] = 0uLL;
    if ((_DWORD)v35)
    {
      char v36 = v29 + 39;
      do
      {
        int v37 = *v36++;
        snprintf((char *)v31, 0x29uLL, "%s%02x", (const char *)v31, v37);
        --v35;
      }

      while (v35);
      __int128 v29 = (unsigned __int8 *)a1[139];
      int v32 = quic_cid_describe_state;
      __int128 v34 = 0uLL;
    }

    if (v32 % 3 == 2) {
      uint64_t v38 = &quic_cid_describe_cid_buf2;
    }
    else {
      uint64_t v38 = &quic_cid_describe_cid_buf3;
    }
    if (v32 % 3) {
      uint64_t v39 = v38;
    }
    else {
      uint64_t v39 = &quic_cid_describe_cid_buf1;
    }
    quic_cid_describe_state = v32 + 1;
    if (v29[17] >= 0x14u) {
      uint64_t v40 = 20LL;
    }
    else {
      uint64_t v40 = v29[17];
    }
    *uint64_t v39 = v34;
    v39[1] = v34;
    *(_OWORD *)((char *)v39 + 25) = v34;
    if ((_DWORD)v40)
    {
      uint64_t v41 = v29 + 18;
      do
      {
        int v42 = *v41++;
        snprintf((char *)v39, 0x29uLL, "%s%02x", (const char *)v39, v42);
        --v40;
      }

      while (v40);
    }

    *(_DWORD *)uint64_t v28 = 136446978;
    *(void *)(v28 + 4) = "quic_conn_assemble_and_encrypt";
    *(_WORD *)(v28 + 12) = 2082;
    *(void *)(v28 + 14) = v79;
    *(_WORD *)(v28 + 22) = 2082;
    *(void *)(v28 + 24) = v31;
    *(_WORD *)(v28 + 32) = 2082;
    *(void *)(v28 + 34) = v39;
    uint64_t v43 = (uint64_t)v27;
    uint64_t v44 = 1911LL;
LABEL_47:
    qlog_internal(16, v43, v44);
    return 0LL;
  }

  return result;
}

uint64_t quic_conn_is_pacing(uint64_t a1, uint64_t a2)
{
  v6[1] = *MEMORY[0x1895F89C0];
  if (a2)
  {
    if (*(unsigned __int8 *)(a1 + 477) >= 9u && (*(_BYTE *)(a1 + 1381) & 2) == 0)
    {
      uint64_t result = *(void *)(a2 + 416);
      if (!result) {
        return result;
      }
      if (*(void *)(a2 + 392)) {
        return quic_ecn_get_state(result) == 4;
      }
    }

    return 0LL;
  }

  if (qlog_debug_enabled
    || (qlog_nwlog_enabled & 1) != 0
    || (uint64_t result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT), (_DWORD)result))
  {
    uint64_t v3 = _os_log_pack_size();
    uint64_t v4 = (char *)v6 - ((MEMORY[0x1895F8858](v3, v3) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v5 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v5 = 136446210;
    *(void *)(v5 + 4) = "quic_conn_is_pacing";
    qlog_internal(17, (uint64_t)v4, 1390LL);
    return 0LL;
  }

  return result;
}

uint64_t *quic_conn_refresh_path(uint64_t a1, uint64_t a2)
{
  v35[1] = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      uint64_t v32 = _os_log_pack_size();
      unsigned int v33 = (char *)v35 - ((MEMORY[0x1895F8858](v32, v32) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v34 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v34 = 136446210;
      *(void *)(v34 + 4) = "quic_conn_refresh_path";
      int v29 = 17;
      uint64_t v30 = (uint64_t)v33;
      uint64_t v31 = 1928LL;
LABEL_53:
      qlog_internal(v29, v30, v31);
      return 0LL;
    }

    return 0LL;
  }

  uint64_t v4 = *(uint64_t **)(a1 + 1112);
  if (v4 && *v4 == a2) {
    return v4;
  }
  uint64_t result = *(uint64_t **)(a1 + 1360);
  if (*MEMORY[0x189608EC0] == a2)
  {
    if (result)
    {
      while ((*(_WORD *)((_BYTE *)result + 431) & 1) == 0)
      {
        uint64_t result = (uint64_t *)result[39];
        if (!result) {
          goto LABEL_12;
        }
      }

      return result;
    }

void quic_conn_handle_sent_packet( uint64_t a1, uint64_t a2, void *a3, unsigned int a4, char a5, unint64_t *a6)
{
  v36[1] = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }

    uint64_t v22 = _os_log_pack_size();
    int v23 = (char *)v36 - ((MEMORY[0x1895F8858](v22, v22) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v24 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v24 = 136446210;
    *(void *)(v24 + 4) = "quic_conn_handle_sent_packet";
    uint64_t v25 = (uint64_t)v23;
    uint64_t v26 = 1957LL;
LABEL_45:
    qlog_internal(17, v25, v26);
    return;
  }

  if (!a2)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }

    uint64_t v27 = _os_log_pack_size();
    int v28 = (char *)v36 - ((MEMORY[0x1895F8858](v27, v27) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v29 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v29 = 136446210;
    *(void *)(v29 + 4) = "quic_conn_handle_sent_packet";
    uint64_t v25 = (uint64_t)v28;
    uint64_t v26 = 1958LL;
    goto LABEL_45;
  }

  if (!a3)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }

    uint64_t v30 = _os_log_pack_size();
    uint64_t v31 = (char *)v36 - ((MEMORY[0x1895F8858](v30, v30) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v32 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v32 = 136446210;
    *(void *)(v32 + 4) = "quic_conn_handle_sent_packet";
    uint64_t v25 = (uint64_t)v31;
    uint64_t v26 = 1959LL;
    goto LABEL_45;
  }

  if (!a6)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }

    uint64_t v33 = _os_log_pack_size();
    uint64_t v34 = (char *)v36 - ((MEMORY[0x1895F8858](v33, v33) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v35 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v35 = 136446210;
    *(void *)(v35 + 4) = "quic_conn_handle_sent_packet";
    uint64_t v25 = (uint64_t)v34;
    uint64_t v26 = 1960LL;
    goto LABEL_45;
  }

  uint64_t v11 = a1 + 1380;
  uint64_t v12 = *(void *)(a1 + 1380);
  if ((v12 & 0x200000000LL) != 0
    && *(unsigned __int8 *)(a1 + 477) >= 9u
    && (v12 & 0x200) == 0
    && (uint64_t v16 = *(void *)(a2 + 416)) != 0
    && *(void *)(a2 + 392)
    && quic_ecn_get_state(v16) == 4)
  {
    quic_pacer_get_packet_tx_time(a2, *(void *)(a2 + 392), a4, v36, a6);
    unint64_t v18 = *a6;
    uint64_t v19 = *(void *)(a1 + 1128);
    if (v19) {
      quic_shorthand_process_packet(v19, (uint64_t)a3, 1);
    }
    __int128 v20 = *(void **)(a1 + 1136);
    if (v20)
    {
      id v21 = v20;
      [v21 packetSent:a3];
    }

    if ((a5 & 1) != 0 || (*(_BYTE *)(v11 + 3) & 2) != 0) {
      quic_recovery_sent_packet(*(void *)(a1 + 952), (uint64_t)a3, v18 / 0x3E8);
    }
    else {
      _quic_packet_destroy(a3);
    }
  }

  else
  {
    uint64_t v13 = *(void *)(a1 + 1128);
    if (v13) {
      quic_shorthand_process_packet(v13, (uint64_t)a3, 1);
    }
    uint64_t v14 = *(void **)(a1 + 1136);
    if (v14)
    {
      id v15 = v14;
      [v15 packetSent:a3];
    }

    if ((a5 & 1) != 0 || (*(_BYTE *)(v11 + 3) & 2) != 0) {
      quic_recovery_sent_packet(*(void *)(a1 + 952), (uint64_t)a3, 0LL);
    }
    else {
      _quic_packet_destroy(a3);
    }
  }

void __quic_conn_send_frames_for_key_state_block_invoke_207(uint64_t a1, void *__dst, size_t a3)
{
  uint64_t v58 = *MEMORY[0x1895F89C0];
  size_t v4 = *(unsigned __int16 *)(a1 + 120);
  if (v4 > a3)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
    if ((qlog_debug_enabled
       || (qlog_nwlog_enabled & 1) != 0
       || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
      && *(void *)(*(void *)(a1 + 88) + 1112LL))
    {
      uint64_t v6 = _os_log_pack_size();
      int v7 = (char *)&v55 - ((MEMORY[0x1895F8858](v6, v6) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v8 = _os_log_pack_fill();
      uint64_t v9 = *(void *)(a1 + 88);
      uint64_t v57 = (uint64_t *)(v9 + 976);
      uint64_t v10 = *(unsigned __int8 **)(v9 + 1112);
      if (quic_cid_describe_state % 3 == 2) {
        uint64_t v11 = &quic_cid_describe_cid_buf2;
      }
      else {
        uint64_t v11 = &quic_cid_describe_cid_buf3;
      }
      if (quic_cid_describe_state % 3) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = &quic_cid_describe_cid_buf1;
      }
      int v13 = ++quic_cid_describe_state;
      unsigned int v14 = v10[38];
      __int128 v15 = 0uLL;
      *(_OWORD *)((char *)v12 + 25) = 0u;
      if (v14 >= 0x14) {
        uint64_t v16 = 20LL;
      }
      else {
        uint64_t v16 = v14;
      }
      _OWORD *v12 = 0uLL;
      v12[1] = 0uLL;
      if ((_DWORD)v16)
      {
        uint64_t v17 = v10 + 39;
        do
        {
          int v18 = *v17++;
          snprintf((char *)v12, 0x29uLL, "%s%02x", (const char *)v12, v18);
          --v16;
        }

        while (v16);
        uint64_t v10 = *(unsigned __int8 **)(*(void *)(a1 + 88) + 1112LL);
        int v13 = quic_cid_describe_state;
        __int128 v15 = 0uLL;
      }

      if (v13 % 3 == 2) {
        uint64_t v19 = &quic_cid_describe_cid_buf2;
      }
      else {
        uint64_t v19 = &quic_cid_describe_cid_buf3;
      }
      if (v13 % 3) {
        __int128 v20 = v19;
      }
      else {
        __int128 v20 = &quic_cid_describe_cid_buf1;
      }
      quic_cid_describe_state = v13 + 1;
      if (v10[17] >= 0x14u) {
        uint64_t v21 = 20LL;
      }
      else {
        uint64_t v21 = v10[17];
      }
      *__int128 v20 = v15;
      v20[1] = v15;
      *(_OWORD *)((char *)v20 + 25) = v15;
      if ((_DWORD)v21)
      {
        uint64_t v22 = v10 + 18;
        do
        {
          int v23 = *v22++;
          snprintf((char *)v20, 0x29uLL, "%s%02x", (const char *)v20, v23);
          --v21;
        }

        while (v21);
      }

      int v24 = *(unsigned __int16 *)(a1 + 120);
      *(_DWORD *)uint64_t v8 = 136447490;
      *(void *)(v8 + 4) = "quic_conn_send_frames_for_key_state_block_invoke";
      *(_WORD *)(v8 + 12) = 2082;
      *(void *)(v8 + 14) = v57;
      *(_WORD *)(v8 + 22) = 2082;
      *(void *)(v8 + 24) = v12;
      *(_WORD *)(v8 + 32) = 2082;
      *(void *)(v8 + 34) = v20;
      *(_WORD *)(v8 + 42) = 2048;
      *(void *)(v8 + 44) = a3;
      *(_WORD *)(v8 + 52) = 1024;
      *(_DWORD *)(v8 + 54) = v24;
      qlog_internal(16, (uint64_t)v7, 2242LL);
    }

    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = quic_conn_refresh_path( *(void *)(a1 + 88),  *(void *)(a1 + 96));
    uint64_t v25 = *(void *)(*(void *)(a1 + 48) + 8LL);
    uint64_t v28 = *(void *)(v25 + 24);
    uint64_t v26 = (uint64_t *)(v25 + 24);
    uint64_t v27 = v28;
    if (v28)
    {
      *(void *)(v27 + 144) = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
      quic_conn_handle_sent_packet( *(void *)(a1 + 88),  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL),  *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL),  (unsigned __int16)a3,  *(_BYTE *)(a1 + 122),  (unint64_t *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL));
    }

    else
    {
      quic_conn_handle_small_buffer( *(void **)(a1 + 88),  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL),  *(unsigned __int16 *)(a1 + 120),  v26,  *(_BYTE *)(a1 + 122),  *(unsigned __int8 *)(a1 + 123),  *(uint64_t **)(a1 + 104),  (unint64_t *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL));
    }

    uint64_t v33 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL);
    if (v33)
    {
      free(v33);
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0LL;
    }

    return;
  }

  uint64_t v30 = *(const void **)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL);
  if (v30)
  {
    memcpy(__dst, v30, v4);
    uint64_t v31 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL);
    if (v31)
    {
      free(v31);
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0LL;
    }

    uint64_t v32 = mach_continuous_time();
    if (timebase_info_once != -1) {
      dispatch_once(&timebase_info_once, &__block_literal_global_397);
    }
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = timebase_info_info
                                                                * v32
                                                                / dword_18C4D003C
                                                                / 0x3E8;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = quic_conn_refresh_path( *(void *)(a1 + 88),  *(void *)(a1 + 96));
    goto LABEL_44;
  }

  if (quic_conn_assemble_and_encrypt( *(void **)(a1 + 88),  *(unsigned __int8 *)(a1 + 123),  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL),  (uint64_t *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL),  *(uint64_t **)(a1 + 104),  (char *)__dst,  v4))
  {
LABEL_44:
    quic_ecn_outgoing_ip_codepoint( *(void *)(*(void *)(a1 + 88) + 968LL),  *(void *)(a1 + 88),  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL));
    nw_protocol_data_set_ecn_flag();
    uint64_t v34 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
    if (*(_BYTE *)(v34 + 83) == 3) {
      int v35 = *(unsigned __int8 *)(v34 + 232) >> 7;
    }
    else {
      LOBYTE(v35) = 0;
    }
    quic_conn_continue_sending( *(void *)(a1 + 88),  *(uint64_t **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL),  v34,  *(unsigned __int8 *)(a1 + 122),  *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL),  *(unsigned __int8 *)(a1 + 124),  *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL),  *(void **)(a1 + 112),  v4,  v35,  (void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL));
    return;
  }

  char v36 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
  if (v36)
  {
    _quic_packet_destroy(v36);
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0LL;
  }

  if ((qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0
                           || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
    && *(void *)(*(void *)(a1 + 88) + 1112LL))
  {
    uint64_t v37 = _os_log_pack_size();
    uint64_t v57 = &v55;
    uint64_t v38 = (char *)&v55 - ((MEMORY[0x1895F8858](v37, v37) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v39 = _os_log_pack_fill();
    uint64_t v40 = *(void *)(a1 + 88);
    uint64_t v56 = v40 + 976;
    uint64_t v41 = *(unsigned __int8 **)(v40 + 1112);
    if (quic_cid_describe_state % 3 == 2) {
      int v42 = &quic_cid_describe_cid_buf2;
    }
    else {
      int v42 = &quic_cid_describe_cid_buf3;
    }
    if (quic_cid_describe_state % 3) {
      uint64_t v43 = v42;
    }
    else {
      uint64_t v43 = &quic_cid_describe_cid_buf1;
    }
    int v44 = ++quic_cid_describe_state;
    unsigned int v45 = v41[38];
    __int128 v46 = 0uLL;
    *(_OWORD *)((char *)v43 + 25) = 0u;
    if (v45 >= 0x14) {
      uint64_t v47 = 20LL;
    }
    else {
      uint64_t v47 = v45;
    }
    *uint64_t v43 = 0uLL;
    v43[1] = 0uLL;
    if ((_DWORD)v47)
    {
      __int128 v48 = v41 + 39;
      do
      {
        int v49 = *v48++;
        snprintf((char *)v43, 0x29uLL, "%s%02x", (const char *)v43, v49);
        --v47;
      }

      while (v47);
      uint64_t v41 = *(unsigned __int8 **)(*(void *)(a1 + 88) + 1112LL);
      int v44 = quic_cid_describe_state;
      __int128 v46 = 0uLL;
    }

    if (v44 % 3 == 2) {
      uint64_t v50 = &quic_cid_describe_cid_buf2;
    }
    else {
      uint64_t v50 = &quic_cid_describe_cid_buf3;
    }
    if (v44 % 3) {
      int v51 = v50;
    }
    else {
      int v51 = &quic_cid_describe_cid_buf1;
    }
    quic_cid_describe_state = v44 + 1;
    if (v41[17] >= 0x14u) {
      uint64_t v52 = 20LL;
    }
    else {
      uint64_t v52 = v41[17];
    }
    *int v51 = v46;
    v51[1] = v46;
    *(_OWORD *)((char *)v51 + 25) = v46;
    if ((_DWORD)v52)
    {
      __int128 v53 = v41 + 18;
      do
      {
        int v54 = *v53++;
        snprintf((char *)v51, 0x29uLL, "%s%02x", (const char *)v51, v54);
        --v52;
      }

      while (v52);
    }

    *(_DWORD *)uint64_t v39 = 136446978;
    *(void *)(v39 + 4) = "quic_conn_send_frames_for_key_state_block_invoke";
    *(_WORD *)(v39 + 12) = 2082;
    *(void *)(v39 + 14) = v56;
    *(_WORD *)(v39 + 22) = 2082;
    *(void *)(v39 + 24) = v43;
    *(_WORD *)(v39 + 32) = 2082;
    *(void *)(v39 + 34) = v51;
    qlog_internal(16, (uint64_t)v38, 2276LL);
  }

void quic_conn_handle_small_buffer( void *a1, unint64_t a2, size_t __size, uint64_t *a4, char a5, uint64_t a6, uint64_t *a7, unint64_t *a8)
{
  uint64_t v56 = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }

    uint64_t v36 = _os_log_pack_size();
    uint64_t v37 = (char *)&v53 - ((MEMORY[0x1895F8858](v36, v36) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v38 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v38 = 136446210;
    *(void *)(v38 + 4) = "quic_conn_handle_small_buffer";
    uint64_t v39 = (uint64_t)v37;
    uint64_t v40 = 1980LL;
LABEL_64:
    qlog_internal(17, v39, v40);
    return;
  }

  if (!a2)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }

    uint64_t v41 = _os_log_pack_size();
    int v42 = (char *)&v53 - ((MEMORY[0x1895F8858](v41, v41) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v43 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v43 = 136446210;
    *(void *)(v43 + 4) = "quic_conn_handle_small_buffer";
    uint64_t v39 = (uint64_t)v42;
    uint64_t v40 = 1981LL;
    goto LABEL_64;
  }

  if (!a4)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }

    uint64_t v44 = _os_log_pack_size();
    unsigned int v45 = (char *)&v53 - ((MEMORY[0x1895F8858](v44, v44) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v46 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v46 = 136446210;
    *(void *)(v46 + 4) = "quic_conn_handle_small_buffer";
    uint64_t v39 = (uint64_t)v45;
    uint64_t v40 = 1982LL;
    goto LABEL_64;
  }

  if (!a7)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }

    uint64_t v47 = _os_log_pack_size();
    __int128 v48 = (char *)&v53 - ((MEMORY[0x1895F8858](v47, v47) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v49 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v49 = 136446210;
    *(void *)(v49 + 4) = "quic_conn_handle_small_buffer";
    uint64_t v39 = (uint64_t)v48;
    uint64_t v40 = 1983LL;
    goto LABEL_64;
  }

  if (!a8)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }

    uint64_t v50 = _os_log_pack_size();
    int v51 = (char *)&v53 - ((MEMORY[0x1895F8858](v50, v50) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v52 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v52 = 136446210;
    *(void *)(v52 + 4) = "quic_conn_handle_small_buffer";
    uint64_t v39 = (uint64_t)v51;
    uint64_t v40 = 1984LL;
    goto LABEL_64;
  }

  unsigned int v13 = __size;
  if (!(_DWORD)__size)
  {
    qlog_abort_internal("%s strict_calloc called with size 0", "strict_calloc");
LABEL_66:
    qlog_abort_internal("%s strict_calloc(%zu, %zu) failed", "strict_calloc", 1uLL, v8);
  }

  uint64_t v8 = __size;
  uint64_t v17 = (char *)calloc(1uLL, __size);
  if (!v17) {
    goto LABEL_66;
  }
  int v18 = v17;
  if (quic_conn_assemble_and_encrypt(a1, a6, a2, a4, a7, v17, v13))
  {
    quic_conn_handle_sent_packet((uint64_t)a1, a2, (void *)*a4, v13, a5, a8);
    free(v18);
  }

  else
  {
    if ((qlog_debug_enabled
       || (qlog_nwlog_enabled & 1) != 0
       || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
      && a1[139])
    {
      uint64_t v19 = _os_log_pack_size();
      uint64_t v55 = &v53;
      __int128 v20 = (char *)&v53 - ((MEMORY[0x1895F8858](v19, v19) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v21 = _os_log_pack_fill();
      int v54 = a1 + 122;
      uint64_t v22 = (unsigned __int8 *)a1[139];
      if (quic_cid_describe_state % 3 == 2) {
        int v23 = &quic_cid_describe_cid_buf2;
      }
      else {
        int v23 = &quic_cid_describe_cid_buf3;
      }
      if (quic_cid_describe_state % 3) {
        int v24 = v23;
      }
      else {
        int v24 = &quic_cid_describe_cid_buf1;
      }
      int v25 = ++quic_cid_describe_state;
      unsigned int v26 = v22[38];
      __int128 v27 = 0uLL;
      *(_OWORD *)((char *)v24 + 25) = 0u;
      if (v26 >= 0x14) {
        uint64_t v28 = 20LL;
      }
      else {
        uint64_t v28 = v26;
      }
      *int v24 = 0uLL;
      v24[1] = 0uLL;
      if ((_DWORD)v28)
      {
        uint64_t v29 = v22 + 39;
        do
        {
          int v30 = *v29++;
          snprintf((char *)v24, 0x29uLL, "%s%02x", (const char *)v24, v30);
          --v28;
        }

        while (v28);
        uint64_t v22 = (unsigned __int8 *)a1[139];
        int v25 = quic_cid_describe_state;
        __int128 v27 = 0uLL;
      }

      if (v25 % 3 == 2) {
        uint64_t v31 = &quic_cid_describe_cid_buf2;
      }
      else {
        uint64_t v31 = &quic_cid_describe_cid_buf3;
      }
      if (v25 % 3) {
        uint64_t v32 = v31;
      }
      else {
        uint64_t v32 = &quic_cid_describe_cid_buf1;
      }
      quic_cid_describe_state = v25 + 1;
      if (v22[17] >= 0x14u) {
        uint64_t v33 = 20LL;
      }
      else {
        uint64_t v33 = v22[17];
      }
      *uint64_t v32 = v27;
      v32[1] = v27;
      *(_OWORD *)((char *)v32 + 25) = v27;
      if ((_DWORD)v33)
      {
        uint64_t v34 = v22 + 18;
        do
        {
          int v35 = *v34++;
          snprintf((char *)v32, 0x29uLL, "%s%02x", (const char *)v32, v35);
          --v33;
        }

        while (v33);
      }

      *(_DWORD *)uint64_t v21 = 136446978;
      *(void *)(v21 + 4) = "quic_conn_handle_small_buffer";
      *(_WORD *)(v21 + 12) = 2082;
      *(void *)(v21 + 14) = v54;
      *(_WORD *)(v21 + 22) = 2082;
      *(void *)(v21 + 24) = v24;
      *(_WORD *)(v21 + 32) = 2082;
      *(void *)(v21 + 34) = v32;
      qlog_internal(16, (uint64_t)v20, 1995LL);
    }

    if (*a4)
    {
      _quic_packet_destroy((void *)*a4);
      *a4 = 0LL;
    }

    free(v18);
  }

void quic_conn_continue_sending( uint64_t a1, uint64_t *a2, uint64_t a3, int a4, int a5, int a6, unint64_t a7, void *a8, unsigned __int16 a9, unsigned __int8 a10, void *a11)
{
  int v12 = a10;
  unsigned int v13 = a9;
  v55[1] = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }

    uint64_t v32 = _os_log_pack_size();
    uint64_t v33 = (char *)&v52 - ((MEMORY[0x1895F8858](v32, v32) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v34 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v34 = 136446210;
    *(void *)(v34 + 4) = "quic_conn_continue_sending";
    uint64_t v35 = (uint64_t)v33;
    uint64_t v36 = 2012LL;
LABEL_41:
    qlog_internal(17, v35, v36);
    return;
  }

  if (!a2)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }

    uint64_t v37 = _os_log_pack_size();
    uint64_t v38 = (char *)&v52 - ((MEMORY[0x1895F8858](v37, v37) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v39 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v39 = 136446210;
    *(void *)(v39 + 4) = "quic_conn_continue_sending";
    uint64_t v35 = (uint64_t)v38;
    uint64_t v36 = 2013LL;
    goto LABEL_41;
  }

  if (!a3)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }

    uint64_t v40 = _os_log_pack_size();
    uint64_t v41 = (char *)&v52 - ((MEMORY[0x1895F8858](v40, v40) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v42 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v42 = 136446210;
    *(void *)(v42 + 4) = "quic_conn_continue_sending";
    uint64_t v35 = (uint64_t)v41;
    uint64_t v36 = 2014LL;
    goto LABEL_41;
  }

  if (!a8)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }

    uint64_t v43 = _os_log_pack_size();
    uint64_t v44 = (char *)&v52 - ((MEMORY[0x1895F8858](v43, v43) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v45 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v45 = 136446210;
    *(void *)(v45 + 4) = "quic_conn_continue_sending";
    uint64_t v35 = (uint64_t)v44;
    uint64_t v36 = 2015LL;
    goto LABEL_41;
  }

  if (!a11)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }

    uint64_t v46 = _os_log_pack_size();
    uint64_t v47 = (char *)&v52 - ((MEMORY[0x1895F8858](v46, v46) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v48 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v48 = 136446210;
    *(void *)(v48 + 4) = "quic_conn_continue_sending";
    uint64_t v35 = (uint64_t)v47;
    uint64_t v36 = 2016LL;
    goto LABEL_41;
  }

  if (*(unsigned __int8 *)(a1 + 477) >= 9u
    && (*(_BYTE *)(a1 + 1381) & 2) == 0
    && (uint64_t v20 = a2[52]) != 0
    && a2[49]
    && (v53 = a9, v54 = a10, state = quic_ecn_get_state(v20), unsigned int v13 = a9, v12 = a10, state == 4))
  {
    if ((*(_BYTE *)(a1 + 1384) & 2) == 0)
    {
      quic_pacer_send_packet(a2[49], a8, a3, v53, a4, a5);
      return;
    }

    v55[0] = 0LL;
    quic_pacer_get_packet_tx_time((uint64_t)a2, a2[49], v53, v55, a11);
    quic_conn_send_packet( (void *)a1,  (uint64_t)a8,  v53,  *(void *)(a3 + 112),  *(unsigned __int8 *)(a3 + 82),  v55[0],  (*(_DWORD *)(a3 + 232) >> 3) & 1,  a10);
    unint64_t v31 = *a11 / 0x3E8uLL;
    uint64_t v28 = a1;
    uint64_t v29 = (void *)a3;
    int v30 = a4;
  }

  else
  {
    unsigned int v23 = *(_DWORD *)(a3 + 232);
    int v24 = a4;
    if ((v23 & 0x2000) != 0)
    {
      int v54 = v12;
      unsigned int v25 = v13;
      int generation_count = quic_ack_get_generation_count(*(char **)(a1 + 960), a6, a2[42], a7);
      char v27 = qlog_nwlog_enabled;
      if (qlog_datapath_enabled || qlog_nwlog_enabled)
      {
        if (qlog_debug_enabled) {
          char v27 = 1;
        }
        if ((v27 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v49 = _os_log_pack_size();
          uint64_t v50 = (char *)&v52 - ((MEMORY[0x1895F8858](v49, v49) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          uint64_t v51 = _os_log_pack_fill();
          *(_DWORD *)uint64_t v51 = 136446466;
          *(void *)(v51 + 4) = "quic_conn_continue_sending";
          *(_WORD *)(v51 + 12) = 1024;
          *(_DWORD *)(v51 + 14) = generation_count;
          qlog_internal(2, (uint64_t)v50, 2026LL);
          int v24 = a4;
        }
      }

      nw_protocol_data_set_compression_generation_count();
      unsigned int v23 = *(_DWORD *)(a3 + 232);
      unsigned int v13 = v25;
      int v12 = v54;
    }

    quic_conn_send_packet( (void *)a1,  (uint64_t)a8,  v13,  *(void *)(a3 + 112),  *(unsigned __int8 *)(a3 + 82),  0LL,  (v23 >> 3) & 1,  v12);
    uint64_t v28 = a1;
    uint64_t v29 = (void *)a3;
    int v30 = v24;
    unint64_t v31 = a7;
  }

  quic_conn_packet_dispatched(v28, v29, v30, v31);
}

void quic_conn_send_packet( void *a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  v24[1] = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }

    uint64_t v13 = _os_log_pack_size();
    unsigned int v14 = (char *)v24 - ((MEMORY[0x1895F8858](v13, v13) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v15 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v15 = 136446210;
    *(void *)(v15 + 4) = "quic_conn_send_packet";
    uint64_t v16 = (uint64_t)v14;
    uint64_t v17 = 5115LL;
LABEL_27:
    qlog_internal(17, v16, v17);
    return;
  }

  if (!a2)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }

    uint64_t v18 = _os_log_pack_size();
    uint64_t v19 = (char *)v24 - ((MEMORY[0x1895F8858](v18, v18) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v20 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v20 = 136446210;
    *(void *)(v20 + 4) = "quic_conn_send_packet";
    uint64_t v16 = (uint64_t)v19;
    uint64_t v17 = 5116LL;
    goto LABEL_27;
  }

  if (!a3)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }

    uint64_t v21 = _os_log_pack_size();
    uint64_t v22 = (char *)v24 - ((MEMORY[0x1895F8858](v21, v21) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v23 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v23 = 136446210;
    *(void *)(v23 + 4) = "quic_conn_send_packet";
    uint64_t v16 = (uint64_t)v22;
    uint64_t v17 = 5117LL;
    goto LABEL_27;
  }

  uint64_t v11 = (void *)a1[164];
  if (v11)
  {
    uint64_t v12 = v11[1] + a3;
    ++*v11;
    v11[1] = v12;
  }

  a1[146] += a3;
  ++a1[145];
  if (a8) {
    ++a1[156];
  }
  nw_protocol_instance_add_outbound();
  if (__quic_signpost_is_enabled__quic_signposts_once_3883[0] != -1) {
    dispatch_once(__quic_signpost_is_enabled__quic_signposts_once_3883, &__block_literal_global_192);
  }
  if (__quic_signpost_is_enabled__quic_signposts_enabled_3884)
  {
  }

void quic_conn_packet_dispatched(uint64_t a1, void *a2, int a3, unint64_t a4)
{
  v17[1] = *MEMORY[0x1895F89C0];
  uint64_t v4 = a2[18];
  if (v4)
  {
    uint64_t v9 = *(void *)(a1 + 1128);
    if (v9) {
      quic_shorthand_process_packet(v9, (uint64_t)a2, 1);
    }
    uint64_t v10 = *(void **)(a1 + 1136);
    if (v10)
    {
      id v11 = v10;
      [v11 packetSent:a2];
    }

    if ((a3 & 1) != 0 || (*(_BYTE *)(a1 + 1383) & 2) != 0) {
      quic_recovery_sent_packet(*(void *)(a1 + 952), (uint64_t)a2, a4);
    }
    else {
      _quic_packet_destroy(a2);
    }
    uint64_t v12 = *(void *)(a1 + 1380);
    if ((v12 & 0x200000000LL) != 0) {
      goto LABEL_18;
    }
    if (*(unsigned __int8 *)(a1 + 477) < 9u
      || (v12 & 0x200) != 0
      || (uint64_t v13 = *(void *)(v4 + 416)) == 0
      || !*(void *)(v4 + 392))
    {
      if (!a3) {
        return;
      }
      goto LABEL_21;
    }

    if (quic_ecn_get_state(v13) != 4)
    {
LABEL_18:
      if (!a3) {
        return;
      }
    }

    else
    {
      quic_pacer_packet_sent(*(uint64_t **)(v4 + 392));
      if (!a3) {
        return;
      }
    }

uint64_t ____quic_signpost_is_enabled_block_invoke_3885()
{
  uint64_t result = nw_settings_get_signposts_enabled();
  __quic_signpost_is_enabled__quic_signposts_enabled_3884 = result;
  return result;
}

uint64_t __quic_conn_force_send_frames_block_invoke()
{
  return 1LL;
}

void quic_conn_drain(uint64_t a1)
{
  v65[4] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v1 = a1;
    int v2 = *(unsigned __int8 *)(a1 + 477);
    if (v2 != 11)
    {
      if (v2 == 1)
      {
        if (qlog_debug_enabled
          || (qlog_nwlog_enabled & 1) != 0
          || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v3 = _os_log_pack_size();
          uint64_t v4 = (char *)&v60 - ((MEMORY[0x1895F8858](v3, v3) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          uint64_t v5 = _os_log_pack_fill();
          *(_DWORD *)uint64_t v5 = 136446210;
          *(void *)(v5 + 4) = "quic_conn_drain";
          qlog_internal(2, (uint64_t)v4, 4654LL);
        }

        return;
      }

      uint64_t stats_region = nw_protocol_instance_get_stats_region();
      uint64_t v10 = &g_quic_stats;
      if (stats_region) {
        uint64_t v10 = (void *)stats_region;
      }
      *(void *)(v1 + 1312) = v10;
      uint64_t stats = nw_protocol_instance_get_stats();
      *(void *)(v1 + 1304) = stats;
      if (stats)
      {
        *(void *)(stats + 16) = *(void *)(v1 + 1144);
        uint64_t v12 = *(void *)(v1 + 1304);
        if (v12)
        {
          *(void *)(v12 + 24) = *(void *)(v1 + 1152);
          uint64_t v13 = *(void *)(v1 + 1304);
          if (v13)
          {
            *(void *)(v13 + 32) = *(void *)(v1 + 1160);
            uint64_t v14 = *(void *)(v1 + 1304);
            if (v14)
            {
              *(void *)(v14 + 40) = *(void *)(v1 + 1168);
              uint64_t v15 = *(void *)(v1 + 1304);
              if (v15)
              {
                *(_DWORD *)(v15 + 48) = *(_DWORD *)(v1 + 1176);
                uint64_t v16 = *(void *)(v1 + 1304);
                if (v16)
                {
                  *(_DWORD *)(v16 + 52) = *(_DWORD *)(v1 + 1180);
                  uint64_t v17 = *(void *)(v1 + 1304);
                  if (v17)
                  {
                    *(_DWORD *)(v17 + 56) = *(_DWORD *)(v1 + 1188);
                    uint64_t v18 = *(void *)(v1 + 1304);
                    if (v18)
                    {
                      *(_DWORD *)(v18 + 60) = *(_DWORD *)(v1 + 1192);
                      uint64_t v19 = *(void *)(v1 + 1304);
                      if (v19)
                      {
                        *(_DWORD *)(v19 + 60) = *(unsigned __int8 *)(v1 + 477) == 9;
                        uint64_t v20 = *(void *)(v1 + 1304);
                        if (v20) {
                          *(_DWORD *)(v20 + 124) = *(unsigned __int8 *)(v1 + 477);
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

      uint64_t v21 = *(void *)(v1 + 1112);
      if (v21 && quic_rtt_has_initial_measurement(*(void *)(v21 + 272)))
      {
        uint64_t v22 = *(void *)(v1 + 1304);
        if (!v22) {
          goto LABEL_33;
        }
        *(_DWORD *)(*(void *)(v1 + 1304) + 68LL) = (unint64_t)((4
                                                                       * (quic_rtt_get_min_rtt(*(void *)(*(void *)(v1 + 1112) + 272LL)) & 0x7FFFFFFFFFFFFFFuLL)
                                                                       * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4;
        uint64_t v22 = *(void *)(v1 + 1304);
        if (!v22) {
          goto LABEL_33;
        }
        *(_DWORD *)(*(void *)(v1 + 1304) + 72LL) = (unint64_t)((4
                                                                       * (quic_rtt_get_smoothed_rtt(*(void *)(*(void *)(v1 + 1112) + 272LL)) & 0x7FFFFFFFFFFFFFFuLL)
                                                                       * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4;
        uint64_t v22 = *(void *)(v1 + 1304);
        if (!v22) {
          goto LABEL_33;
        }
        *(_DWORD *)(*(void *)(v1 + 1304) + 76LL) = (unint64_t)((2
                                                                       * (quic_rtt_get_rtt_variance(*(void *)(*(void *)(v1 + 1112) + 272LL)) & 0xFFFFFFFFFFFFFFFuLL)
                                                                       * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4;
      }

      uint64_t v22 = *(void *)(v1 + 1304);
      if (v22)
      {
        *(_OWORD *)(v22 + 128) = *(_OWORD *)(v1 + 1288);
        uint64_t v22 = *(void *)(v1 + 1304);
      }

void __quic_conn_close_block_invoke_2(uint64_t a1)
{
}

void quic_conn_log_summary(uint64_t a1, _DWORD *a2)
{
  uint64_t v121 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 1112);
  if (v2)
  {
    if (*(_BYTE *)(v2 + 16) == 2)
    {
      if (qlog_debug_enabled
        || (qlog_nwlog_enabled & 1) != 0
        || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = _os_log_pack_size();
        uint64_t v120 = &v109;
        uint64_t v6 = (char *)&v109 - ((MEMORY[0x1895F8858](v5, v5) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v7 = _os_log_pack_fill();
        char v119 = (char *)(a1 + 976);
        uint64_t v8 = *(unsigned __int8 **)(a1 + 1112);
        if (quic_cid_describe_state % 3 == 2) {
          uint64_t v9 = &quic_cid_describe_cid_buf2;
        }
        else {
          uint64_t v9 = &quic_cid_describe_cid_buf3;
        }
        if (quic_cid_describe_state % 3) {
          uint64_t v10 = v9;
        }
        else {
          uint64_t v10 = &quic_cid_describe_cid_buf1;
        }
        int v11 = ++quic_cid_describe_state;
        unsigned int v12 = v8[38];
        __int128 v13 = 0uLL;
        *(_OWORD *)((char *)v10 + 25) = 0u;
        if (v12 >= 0x14) {
          uint64_t v14 = 20LL;
        }
        else {
          uint64_t v14 = v12;
        }
        _OWORD *v10 = 0uLL;
        v10[1] = 0uLL;
        if ((_DWORD)v14)
        {
          uint64_t v15 = v8 + 39;
          do
          {
            int v16 = *v15++;
            snprintf((char *)v10, 0x29uLL, "%s%02x", (const char *)v10, v16);
            --v14;
          }

          while (v14);
          uint64_t v8 = *(unsigned __int8 **)(a1 + 1112);
          int v11 = quic_cid_describe_state;
          __int128 v13 = 0uLL;
        }

        if (v11 % 3 == 2) {
          uint64_t v17 = &quic_cid_describe_cid_buf2;
        }
        else {
          uint64_t v17 = &quic_cid_describe_cid_buf3;
        }
        if (v11 % 3) {
          uint64_t v18 = v17;
        }
        else {
          uint64_t v18 = &quic_cid_describe_cid_buf1;
        }
        quic_cid_describe_unsigned int state = v11 + 1;
        if (v8[17] >= 0x14u) {
          uint64_t v19 = 20LL;
        }
        else {
          uint64_t v19 = v8[17];
        }
        *uint64_t v18 = v13;
        v18[1] = v13;
        *(_OWORD *)((char *)v18 + 25) = v13;
        if ((_DWORD)v19)
        {
          uint64_t v20 = v8 + 18;
          do
          {
            int v21 = *v20++;
            snprintf((char *)v18, 0x29uLL, "%s%02x", (const char *)v18, v21);
            --v19;
          }

          while (v19);
        }

        uint64_t v22 = *(void *)(a1 + 1380);
        int v23 = a2[12];
        int v24 = a2[13];
        if ((v22 & 0x20) != 0) {
          uint64_t v25 = "yes";
        }
        else {
          uint64_t v25 = "no";
        }
        if ((v22 & 0x8000) != 0) {
          uint64_t v26 = "yes";
        }
        else {
          uint64_t v26 = "no";
        }
        int v27 = a2[18];
        int v28 = a2[19];
        int v30 = a2[24];
        int v29 = a2[25];
        int v31 = a2[20];
        int v32 = a2[21];
        int v33 = a2[22];
        int v34 = a2[23];
        int v35 = a2[14];
        int v36 = a2[15];
        int v37 = a2[16];
        int v38 = a2[17];
        *(_DWORD *)uint64_t v7 = 136451074;
        *(void *)(v7 + 4) = "quic_conn_log_summary";
        *(_WORD *)(v7 + 12) = 2082;
        *(void *)(v7 + 14) = v119;
        *(_WORD *)(v7 + 22) = 2082;
        *(void *)(v7 + 24) = v10;
        *(_WORD *)(v7 + 32) = 2082;
        *(void *)(v7 + 34) = v18;
        *(_WORD *)(v7 + 42) = 1024;
        *(_DWORD *)(v7 + 44) = v23;
        *(_WORD *)(v7 + 48) = 2080;
        *(void *)(v7 + 50) = v25;
        *(_WORD *)(v7 + 58) = 1024;
        *(_DWORD *)(v7 + 60) = v24;
        *(_WORD *)(v7 + 64) = 2080;
        *(void *)(v7 + 66) = v26;
        *(_WORD *)(v7 + 74) = 1024;
        *(_DWORD *)(v7 + 76) = v27;
        *(_WORD *)(v7 + 80) = 1024;
        *(_DWORD *)(v7 + 82) = v28;
        *(_WORD *)(v7 + 86) = 1024;
        *(_DWORD *)(v7 + 88) = v29;
        *(_WORD *)(v7 + 92) = 1024;
        *(_DWORD *)(v7 + 94) = v30;
        *(_WORD *)(v7 + 98) = 1024;
        *(_DWORD *)(v7 + 100) = v31;
        *(_WORD *)(v7 + 104) = 1024;
        *(_DWORD *)(v7 + 106) = v32;
        *(_WORD *)(v7 + 110) = 1024;
        *(_DWORD *)(v7 + 112) = v33;
        *(_WORD *)(v7 + 116) = 1024;
        *(_DWORD *)(v7 + 118) = v34;
        *(_WORD *)(v7 + 122) = 1024;
        *(_DWORD *)(v7 + 124) = v35;
        *(_WORD *)(v7 + 128) = 1024;
        *(_DWORD *)(v7 + 130) = v37;
        *(_WORD *)(v7 + 134) = 1024;
        *(_DWORD *)(v7 + 136) = v36;
        *(_WORD *)(v7 + 140) = 1024;
        *(_DWORD *)(v7 + 142) = v38;
        uint64_t v39 = (uint64_t)v6;
        uint64_t v40 = 4597LL;
LABEL_114:
        qlog_internal(0, v39, v40);
      }
    }

    else if (quic_rtt_has_initial_measurement(*(void *)(v2 + 272)))
    {
      if (((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEFAULT))
        && *(void *)(a1 + 1112))
      {
        uint64_t v41 = _os_log_pack_size();
        uint64_t v120 = &v109;
        uint64_t v42 = MEMORY[0x1895F8858](v41, v41);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        char v119 = (char *)&v109 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        uint64_t v43 = _os_log_pack_fill();
        uint64_t v44 = *(unsigned __int8 **)(a1 + 1112);
        if (quic_cid_describe_state % 3 == 2) {
          int v45 = &quic_cid_describe_cid_buf2;
        }
        else {
          int v45 = &quic_cid_describe_cid_buf3;
        }
        if (quic_cid_describe_state % 3) {
          unsigned int v46 = v45;
        }
        else {
          unsigned int v46 = &quic_cid_describe_cid_buf1;
        }
        int v47 = ++quic_cid_describe_state;
        unsigned int v48 = v44[38];
        __int128 v49 = 0uLL;
        *(_OWORD *)((char *)v46 + 25) = 0u;
        if (v48 >= 0x14) {
          uint64_t v50 = 20LL;
        }
        else {
          uint64_t v50 = v48;
        }
        *unsigned int v46 = 0uLL;
        v46[1] = 0uLL;
        if ((_DWORD)v50)
        {
          uint64_t v51 = v44 + 39;
          do
          {
            int v52 = *v51++;
            snprintf((char *)v46, 0x29uLL, "%s%02x", (const char *)v46, v52);
            --v50;
          }

          while (v50);
          uint64_t v44 = *(unsigned __int8 **)(a1 + 1112);
          int v47 = quic_cid_describe_state;
          __int128 v49 = 0uLL;
        }

        if (v47 % 3 == 2) {
          uint64_t v53 = &quic_cid_describe_cid_buf2;
        }
        else {
          uint64_t v53 = &quic_cid_describe_cid_buf3;
        }
        if (v47 % 3) {
          int v54 = v53;
        }
        else {
          int v54 = &quic_cid_describe_cid_buf1;
        }
        quic_cid_describe_unsigned int state = v47 + 1;
        if (v44[17] >= 0x14u) {
          uint64_t v55 = 20LL;
        }
        else {
          uint64_t v55 = v44[17];
        }
        *int v54 = v49;
        v54[1] = v49;
        *(_OWORD *)((char *)v54 + 25) = v49;
        if ((_DWORD)v55)
        {
          uint64_t v56 = v44 + 18;
          do
          {
            int v57 = *v56++;
            snprintf((char *)v54, 0x29uLL, "%s%02x", (const char *)v54, v57);
            --v55;
          }

          while (v55);
        }

        uint64_t v113 = a1 + 976;
        uint64_t v58 = (uint64_t *)(a1 + 1380);
        uint64_t v59 = "yes";
        uint64_t v60 = *v58;
        if ((*v58 & 0x20) != 0) {
          int v61 = "yes";
        }
        else {
          int v61 = "no";
        }
        uint64_t v114 = v61;
        int v112 = a2[12];
        int v62 = a2[13];
        if ((v60 & 0x8000) == 0) {
          uint64_t v59 = "no";
        }
        uint64_t v115 = v59;
        int v63 = a2[18];
        int v116 = v62;
        int v117 = v63;
        int v118 = a2[19];
        unsigned int state = quic_ecn_get_state(*(void *)(v2 + 416));
        if (state > 7) {
          uint64_t v65 = "???";
        }
        else {
          uint64_t v65 = off_18A118448[state];
        }
        char v111 = v65;
        if ((*v58 & 0x2000000) != 0) {
          uint64_t v86 = "enabled";
        }
        else {
          uint64_t v86 = "disabled";
        }
        uint64_t v87 = *(void *)(v2 + 272);
        unint64_t v109 = *(void *)(v87 + 128) / 0x3E8uLL;
        char v110 = v86;
        unint64_t v88 = *(void *)(v87 + 8) / 0x3E8uLL;
        unint64_t v89 = quic_rtt_get_latest_rtt(v87) / 0x3E8uLL;
        unint64_t v90 = quic_rtt_get_min_rtt(*(void *)(v2 + 272)) / 0x3E8uLL;
        unint64_t v91 = quic_rtt_get_smoothed_rtt(*(void *)(v2 + 272)) / 0x3E8uLL;
        unint64_t v92 = quic_rtt_get_rtt_variance(*(void *)(v2 + 272)) / 0x3E8uLL;
        uint64_t v93 = *(void *)(v2 + 400);
        int v94 = 1280;
        if (v93)
        {
          int v95 = *(unsigned __int16 *)(v93 + 8);
          int v96 = (unsigned __int16)(1280 - *(_WORD *)(v93 + 12));
          int v94 = v95;
        }

        else
        {
          int v96 = 1200;
        }

        int v97 = a2[24];
        int v98 = a2[25];
        int v99 = a2[20];
        int v100 = a2[21];
        int v102 = a2[22];
        int v101 = a2[23];
        int v104 = a2[14];
        int v103 = a2[15];
        int v106 = a2[16];
        int v105 = a2[17];
        *(_DWORD *)uint64_t v43 = 136453634;
        *(void *)(v43 + 4) = "quic_conn_log_summary";
        *(_WORD *)(v43 + 12) = 2082;
        uint64_t v107 = v114;
        *(void *)(v43 + 14) = v113;
        *(_WORD *)(v43 + 22) = 2082;
        *(void *)(v43 + 24) = v46;
        *(_WORD *)(v43 + 32) = 2082;
        *(void *)(v43 + 34) = v54;
        *(_WORD *)(v43 + 42) = 1024;
        *(_DWORD *)(v43 + 44) = v112;
        *(_WORD *)(v43 + 48) = 2080;
        *(void *)(v43 + 50) = v107;
        *(_WORD *)(v43 + 58) = 1024;
        *(_DWORD *)(v43 + 60) = v116;
        *(_WORD *)(v43 + 64) = 2080;
        *(void *)(v43 + 66) = v115;
        *(_WORD *)(v43 + 74) = 1024;
        *(_DWORD *)(v43 + 76) = v117;
        *(_WORD *)(v43 + 80) = 1024;
        *(_DWORD *)(v43 + 82) = v118;
        *(_WORD *)(v43 + 86) = 2080;
        *(void *)(v43 + 88) = v111;
        *(_WORD *)(v43 + 96) = 2080;
        unint64_t v108 = v109;
        *(void *)(v43 + 98) = v110;
        *(_WORD *)(v43 + 106) = 2048;
        *(void *)(v43 + 108) = v108;
        *(_WORD *)(v43 + 116) = 2048;
        *(void *)(v43 + 118) = v88;
        *(_WORD *)(v43 + 126) = 2048;
        *(void *)(v43 + 128) = v89;
        *(_WORD *)(v43 + 136) = 2048;
        *(void *)(v43 + 138) = v90;
        *(_WORD *)(v43 + 146) = 2048;
        *(void *)(v43 + 148) = v91;
        *(_WORD *)(v43 + 156) = 2048;
        *(void *)(v43 + 158) = v92;
        *(_WORD *)(v43 + 166) = 1024;
        *(_DWORD *)(v43 + 168) = v94;
        *(_WORD *)(v43 + 172) = 1024;
        *(_DWORD *)(v43 + 174) = v96;
        *(_WORD *)(v43 + 178) = 1024;
        *(_DWORD *)(v43 + 180) = v98;
        *(_WORD *)(v43 + 184) = 1024;
        *(_DWORD *)(v43 + 186) = v97;
        *(_WORD *)(v43 + 190) = 1024;
        *(_DWORD *)(v43 + 192) = v99;
        *(_WORD *)(v43 + 196) = 1024;
        *(_DWORD *)(v43 + 198) = v100;
        *(_WORD *)(v43 + 202) = 1024;
        *(_DWORD *)(v43 + 204) = v102;
        *(_WORD *)(v43 + 208) = 1024;
        *(_DWORD *)(v43 + 210) = v101;
        *(_WORD *)(v43 + 214) = 1024;
        *(_DWORD *)(v43 + 216) = v104;
        *(_WORD *)(v43 + 220) = 1024;
        *(_DWORD *)(v43 + 222) = v106;
        *(_WORD *)(v43 + 226) = 1024;
        *(_DWORD *)(v43 + 228) = v103;
        *(_WORD *)(v43 + 232) = 1024;
        *(_DWORD *)(v43 + 234) = v105;
        uint64_t v39 = (uint64_t)v119;
        uint64_t v40 = 4636LL;
        goto LABEL_114;
      }
    }

    else if (((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1 {
            || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEFAULT))
    }
           && *(void *)(a1 + 1112))
    {
      uint64_t v66 = _os_log_pack_size();
      uint64_t v120 = &v109;
      uint64_t v67 = (char *)&v109 - ((MEMORY[0x1895F8858](v66, v66) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v68 = _os_log_pack_fill();
      char v119 = (char *)(a1 + 976);
      uint64_t v69 = *(unsigned __int8 **)(a1 + 1112);
      if (quic_cid_describe_state % 3 == 2) {
        uint64_t v70 = &quic_cid_describe_cid_buf2;
      }
      else {
        uint64_t v70 = &quic_cid_describe_cid_buf3;
      }
      if (quic_cid_describe_state % 3) {
        uint64_t v71 = v70;
      }
      else {
        uint64_t v71 = &quic_cid_describe_cid_buf1;
      }
      int v72 = ++quic_cid_describe_state;
      unsigned int v73 = v69[38];
      __int128 v74 = 0uLL;
      *(_OWORD *)((char *)v71 + 25) = 0u;
      if (v73 >= 0x14) {
        uint64_t v75 = 20LL;
      }
      else {
        uint64_t v75 = v73;
      }
      *uint64_t v71 = 0uLL;
      v71[1] = 0uLL;
      if ((_DWORD)v75)
      {
        uint64_t v76 = v69 + 39;
        do
        {
          int v77 = *v76++;
          snprintf((char *)v71, 0x29uLL, "%s%02x", (const char *)v71, v77);
          --v75;
        }

        while (v75);
        uint64_t v69 = *(unsigned __int8 **)(a1 + 1112);
        int v72 = quic_cid_describe_state;
        __int128 v74 = 0uLL;
      }

      if (v72 % 3 == 2) {
        uint64_t v78 = &quic_cid_describe_cid_buf2;
      }
      else {
        uint64_t v78 = &quic_cid_describe_cid_buf3;
      }
      if (v72 % 3) {
        uint64_t v79 = v78;
      }
      else {
        uint64_t v79 = &quic_cid_describe_cid_buf1;
      }
      quic_cid_describe_unsigned int state = v72 + 1;
      if (v69[17] >= 0x14u) {
        uint64_t v80 = 20LL;
      }
      else {
        uint64_t v80 = v69[17];
      }
      *uint64_t v79 = v74;
      v79[1] = v74;
      *(_OWORD *)((char *)v79 + 25) = v74;
      if ((_DWORD)v80)
      {
        uint64_t v81 = v69 + 18;
        do
        {
          int v82 = *v81++;
          snprintf((char *)v79, 0x29uLL, "%s%02x", (const char *)v79, v82);
          --v80;
        }

        while (v80);
      }

      int v83 = a2[12];
      int v84 = a2[13];
      if ((*(void *)(a1 + 1380) & 0x20LL) != 0) {
        uint64_t v85 = "yes";
      }
      else {
        uint64_t v85 = "no";
      }
      *(_DWORD *)uint64_t v68 = 136447746;
      *(void *)(v68 + 4) = "quic_conn_log_summary";
      *(_WORD *)(v68 + 12) = 2082;
      *(void *)(v68 + 14) = v119;
      *(_WORD *)(v68 + 22) = 2082;
      *(void *)(v68 + 24) = v71;
      *(_WORD *)(v68 + 32) = 2082;
      *(void *)(v68 + 34) = v79;
      *(_WORD *)(v68 + 42) = 1024;
      *(_DWORD *)(v68 + 44) = v83;
      *(_WORD *)(v68 + 48) = 2080;
      *(void *)(v68 + 50) = v85;
      *(_WORD *)(v68 + 58) = 1024;
      *(_DWORD *)(v68 + 60) = v84;
      uint64_t v39 = (uint64_t)v67;
      uint64_t v40 = 4644LL;
      goto LABEL_114;
    }
  }

void __quic_conn_write_quiclog_block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  *(_OWORD *)__s = 0u;
  __int128 v12 = 0u;
  bzero(__str, 0x400uLL);
  uint64_t v2 = *(const char **)(a1 + 40);
  if (strlen(v2) >= 2)
  {
    uint64_t v3 = 0LL;
    while (1)
    {
      int v4 = v2[v3 + 1];
      __s[v3] = v4;
      if (!v4) {
        break;
      }
      if (++v3 == 127)
      {
        HIBYTE(v18) = 0;
        break;
      }
    }
  }

  size_t v5 = strlen(__s);
  if (v5) {
    __s[v5 - 1] = 0;
  }
  uint64_t v6 = getprogname();
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = "unknown";
  }
  pid_t v8 = getpid();
  snprintf(__str, 0x400uLL, "%s/%s-%d-%s.qlog", &quiclog_directory, v7, v8, __s);
  quiclog_dump_to_file(*(void **)(a1 + 48), (uint64_t)__str, *(unsigned __int8 *)(a1 + 56));
  uint64_t v9 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  if (v9)
  {
    os_release(v9);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0LL;
  }

dispatch_queue_t __quic_conn_write_quiclog_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.network.quic.quiclog", MEMORY[0x1895F8AF8]);
  quic_conn_write_quiclog_quiclog_queue = (uint64_t)result;
  return result;
}

void __quic_conn_set_metadata_handlers_block_invoke_2_38(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  *(void *)(v1 + 1096) = *(void *)(a1 + 40);
  *(void *)(v1 + 1380) |= 0x8000000uLL;
  quic_conn_close(*(void *)(a1 + 32));
}

void __quic_conn_set_metadata_handlers_block_invoke_2_34(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32) <= *(void *)(v2 + 752)) {
    unint64_t v3 = *(void *)(v2 + 752);
  }
  else {
    unint64_t v3 = *(void *)(a1 + 32);
  }
  int v4 = qlog_debug_enabled;
  char v5 = qlog_nwlog_enabled;
  if (v3 >= 0x1000000000000001LL)
  {
    if (qlog_debug_enabled) {
      char v6 = 1;
    }
    else {
      char v6 = qlog_nwlog_enabled;
    }
    if ((v6 & 1) == 0 && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
    {
      char v5 = 0;
      unint64_t v3 = 0x1000000000000000LL;
      goto LABEL_40;
    }

    if (*(void *)(v2 + 1112))
    {
      uint64_t v7 = _os_log_pack_size();
      int v47 = &v45;
      pid_t v8 = (char *)&v45 - ((MEMORY[0x1895F8858](v7, v7) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v9 = _os_log_pack_fill();
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v46 = v10 + 976;
      uint64_t v11 = *(void *)(v10 + 1112);
      if (quic_cid_describe_state % 3 == 2) {
        __int128 v12 = &quic_cid_describe_cid_buf2;
      }
      else {
        __int128 v12 = &quic_cid_describe_cid_buf3;
      }
      if (quic_cid_describe_state % 3) {
        __int128 v13 = v12;
      }
      else {
        __int128 v13 = &quic_cid_describe_cid_buf1;
      }
      int v14 = ++quic_cid_describe_state;
      unsigned int v15 = *(unsigned __int8 *)(v11 + 38);
      __int128 v16 = 0uLL;
      *(_OWORD *)((char *)v13 + 25) = 0u;
      if (v15 >= 0x14) {
        uint64_t v17 = 20LL;
      }
      else {
        uint64_t v17 = v15;
      }
      *__int128 v13 = 0uLL;
      v13[1] = 0uLL;
      if ((_DWORD)v17)
      {
        __int128 v18 = (unsigned __int8 *)(v11 + 39);
        do
        {
          int v19 = *v18++;
          snprintf((char *)v13, 0x29uLL, "%s%02x", (const char *)v13, v19);
          --v17;
        }

        while (v17);
        int v14 = quic_cid_describe_state;
        __int128 v16 = 0uLL;
      }

      uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 1112LL);
      if (v14 % 3 == 2) {
        int v21 = &quic_cid_describe_cid_buf2;
      }
      else {
        int v21 = &quic_cid_describe_cid_buf3;
      }
      if (v14 % 3) {
        uint64_t v22 = v21;
      }
      else {
        uint64_t v22 = &quic_cid_describe_cid_buf1;
      }
      quic_cid_describe_unsigned int state = v14 + 1;
      else {
        uint64_t v23 = *(unsigned __int8 *)(v20 + 17);
      }
      _OWORD *v22 = v16;
      v22[1] = v16;
      *(_OWORD *)((char *)v22 + 25) = v16;
      if ((_DWORD)v23)
      {
        int v24 = (unsigned __int8 *)(v20 + 18);
        do
        {
          int v25 = *v24++;
          snprintf((char *)v22, 0x29uLL, "%s%02x", (const char *)v22, v25);
          --v23;
        }

        while (v23);
      }

      *(_DWORD *)uint64_t v9 = 136447490;
      *(void *)(v9 + 4) = "quic_conn_set_metadata_handlers_block_invoke_2";
      *(_WORD *)(v9 + 12) = 2082;
      *(void *)(v9 + 14) = v46;
      *(_WORD *)(v9 + 22) = 2082;
      *(void *)(v9 + 24) = v13;
      *(_WORD *)(v9 + 32) = 2082;
      *(void *)(v9 + 34) = v22;
      *(_WORD *)(v9 + 42) = 2048;
      *(void *)(v9 + 44) = v3;
      *(_WORD *)(v9 + 52) = 2048;
      unint64_t v3 = 0x1000000000000000LL;
      *(void *)(v9 + 54) = 0x1000000000000000LL;
      qlog_internal(16, (uint64_t)v8, 1019LL);
      char v5 = qlog_nwlog_enabled;
      if (qlog_debug_enabled) {
        goto LABEL_42;
      }
LABEL_40:
      if ((v5 & 1) == 0 && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO)) {
        goto LABEL_69;
      }
      goto LABEL_42;
    }

    unint64_t v3 = 0x1000000000000000LL;
  }

  if (!v4) {
    goto LABEL_40;
  }
LABEL_42:
  if (*(void *)(*(void *)(a1 + 40) + 1112LL))
  {
    uint64_t v26 = _os_log_pack_size();
    int v27 = (char *)&v45 - ((MEMORY[0x1895F8858](v26, v26) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v28 = _os_log_pack_fill();
    uint64_t v29 = *(void *)(a1 + 40);
    int v47 = (uint64_t *)(v29 + 976);
    uint64_t v30 = *(void *)(v29 + 1112);
    if (quic_cid_describe_state % 3 == 2) {
      int v31 = &quic_cid_describe_cid_buf2;
    }
    else {
      int v31 = &quic_cid_describe_cid_buf3;
    }
    if (quic_cid_describe_state % 3) {
      int v32 = v31;
    }
    else {
      int v32 = &quic_cid_describe_cid_buf1;
    }
    int v33 = ++quic_cid_describe_state;
    unsigned int v34 = *(unsigned __int8 *)(v30 + 38);
    __int128 v35 = 0uLL;
    *(_OWORD *)((char *)v32 + 25) = 0u;
    if (v34 >= 0x14) {
      uint64_t v36 = 20LL;
    }
    else {
      uint64_t v36 = v34;
    }
    *int v32 = 0uLL;
    v32[1] = 0uLL;
    if ((_DWORD)v36)
    {
      int v37 = (unsigned __int8 *)(v30 + 39);
      do
      {
        int v38 = *v37++;
        snprintf((char *)v32, 0x29uLL, "%s%02x", (const char *)v32, v38);
        --v36;
      }

      while (v36);
      int v33 = quic_cid_describe_state;
      __int128 v35 = 0uLL;
    }

    uint64_t v39 = *(void *)(*(void *)(a1 + 40) + 1112LL);
    if (v33 % 3 == 2) {
      uint64_t v40 = &quic_cid_describe_cid_buf2;
    }
    else {
      uint64_t v40 = &quic_cid_describe_cid_buf3;
    }
    if (v33 % 3) {
      uint64_t v41 = v40;
    }
    else {
      uint64_t v41 = &quic_cid_describe_cid_buf1;
    }
    quic_cid_describe_unsigned int state = v33 + 1;
    else {
      uint64_t v42 = *(unsigned __int8 *)(v39 + 17);
    }
    _OWORD *v41 = v35;
    v41[1] = v35;
    *(_OWORD *)((char *)v41 + 25) = v35;
    if ((_DWORD)v42)
    {
      uint64_t v43 = (unsigned __int8 *)(v39 + 18);
      do
      {
        int v44 = *v43++;
        snprintf((char *)v41, 0x29uLL, "%s%02x", (const char *)v41, v44);
        --v42;
      }

      while (v42);
    }

    *(_DWORD *)uint64_t v28 = 136447234;
    *(void *)(v28 + 4) = "quic_conn_set_metadata_handlers_block_invoke";
    *(_WORD *)(v28 + 12) = 2082;
    *(void *)(v28 + 14) = v47;
    *(_WORD *)(v28 + 22) = 2082;
    *(void *)(v28 + 24) = v32;
    *(_WORD *)(v28 + 32) = 2082;
    *(void *)(v28 + 34) = v41;
    *(_WORD *)(v28 + 42) = 2048;
    *(void *)(v28 + 44) = v3;
    qlog_internal(1, (uint64_t)v27, 1023LL);
  }

void __quic_conn_set_metadata_handlers_block_invoke_2_29(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  unint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v2 <= *(void *)(v3 + 672)) {
    unint64_t v4 = *(void *)(v3 + 672);
  }
  else {
    unint64_t v4 = *(void *)(a1 + 32);
  }
  int v5 = qlog_debug_enabled;
  char v6 = qlog_nwlog_enabled;
  if (v2 >= 0x1000000000000001LL)
  {
    if (qlog_debug_enabled) {
      char v7 = 1;
    }
    else {
      char v7 = qlog_nwlog_enabled;
    }
    if ((v7 & 1) == 0 && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
    {
      char v6 = 0;
      unint64_t v4 = 0x1000000000000000LL;
      goto LABEL_40;
    }

    if (*(void *)(v3 + 1112))
    {
      uint64_t v8 = _os_log_pack_size();
      __int128 v49 = &v47;
      uint64_t v9 = (char *)&v47 - ((MEMORY[0x1895F8858](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v10 = _os_log_pack_fill();
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v48 = v11 + 976;
      uint64_t v12 = *(void *)(v11 + 1112);
      if (quic_cid_describe_state % 3 == 2) {
        __int128 v13 = &quic_cid_describe_cid_buf2;
      }
      else {
        __int128 v13 = &quic_cid_describe_cid_buf3;
      }
      if (quic_cid_describe_state % 3) {
        int v14 = v13;
      }
      else {
        int v14 = &quic_cid_describe_cid_buf1;
      }
      int v15 = ++quic_cid_describe_state;
      unsigned int v16 = *(unsigned __int8 *)(v12 + 38);
      __int128 v17 = 0uLL;
      *(_OWORD *)((char *)v14 + 25) = 0u;
      if (v16 >= 0x14) {
        uint64_t v18 = 20LL;
      }
      else {
        uint64_t v18 = v16;
      }
      _OWORD *v14 = 0uLL;
      v14[1] = 0uLL;
      if ((_DWORD)v18)
      {
        int v19 = (unsigned __int8 *)(v12 + 39);
        do
        {
          int v20 = *v19++;
          snprintf((char *)v14, 0x29uLL, "%s%02x", (const char *)v14, v20);
          --v18;
        }

        while (v18);
        int v15 = quic_cid_describe_state;
        __int128 v17 = 0uLL;
      }

      uint64_t v21 = *(void *)(*(void *)(a1 + 40) + 1112LL);
      if (v15 % 3 == 2) {
        uint64_t v22 = &quic_cid_describe_cid_buf2;
      }
      else {
        uint64_t v22 = &quic_cid_describe_cid_buf3;
      }
      if (v15 % 3) {
        uint64_t v23 = v22;
      }
      else {
        uint64_t v23 = &quic_cid_describe_cid_buf1;
      }
      quic_cid_describe_unsigned int state = v15 + 1;
      else {
        uint64_t v24 = *(unsigned __int8 *)(v21 + 17);
      }
      *uint64_t v23 = v17;
      v23[1] = v17;
      *(_OWORD *)((char *)v23 + 25) = v17;
      if ((_DWORD)v24)
      {
        int v25 = (unsigned __int8 *)(v21 + 18);
        do
        {
          int v26 = *v25++;
          snprintf((char *)v23, 0x29uLL, "%s%02x", (const char *)v23, v26);
          --v24;
        }

        while (v24);
      }

      uint64_t v27 = *(void *)(a1 + 32);
      *(_DWORD *)uint64_t v10 = 136447490;
      *(void *)(v10 + 4) = "quic_conn_set_metadata_handlers_block_invoke_2";
      *(_WORD *)(v10 + 12) = 2082;
      *(void *)(v10 + 14) = v48;
      *(_WORD *)(v10 + 22) = 2082;
      *(void *)(v10 + 24) = v14;
      *(_WORD *)(v10 + 32) = 2082;
      *(void *)(v10 + 34) = v23;
      *(_WORD *)(v10 + 42) = 2048;
      *(void *)(v10 + 44) = v27;
      *(_WORD *)(v10 + 52) = 2048;
      unint64_t v4 = 0x1000000000000000LL;
      *(void *)(v10 + 54) = 0x1000000000000000LL;
      qlog_internal(16, (uint64_t)v9, 1001LL);
      char v6 = qlog_nwlog_enabled;
      if (qlog_debug_enabled) {
        goto LABEL_42;
      }
LABEL_40:
      if ((v6 & 1) == 0 && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO)) {
        goto LABEL_69;
      }
      goto LABEL_42;
    }

    unint64_t v4 = 0x1000000000000000LL;
  }

  if (!v5) {
    goto LABEL_40;
  }
LABEL_42:
  if (*(void *)(*(void *)(a1 + 40) + 1112LL))
  {
    uint64_t v28 = _os_log_pack_size();
    uint64_t v29 = (char *)&v47 - ((MEMORY[0x1895F8858](v28, v28) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v30 = _os_log_pack_fill();
    uint64_t v31 = *(void *)(a1 + 40);
    __int128 v49 = (uint64_t *)(v31 + 976);
    uint64_t v32 = *(void *)(v31 + 1112);
    if (quic_cid_describe_state % 3 == 2) {
      int v33 = &quic_cid_describe_cid_buf2;
    }
    else {
      int v33 = &quic_cid_describe_cid_buf3;
    }
    if (quic_cid_describe_state % 3) {
      unsigned int v34 = v33;
    }
    else {
      unsigned int v34 = &quic_cid_describe_cid_buf1;
    }
    int v35 = ++quic_cid_describe_state;
    unsigned int v36 = *(unsigned __int8 *)(v32 + 38);
    __int128 v37 = 0uLL;
    *(_OWORD *)((char *)v34 + 25) = 0u;
    if (v36 >= 0x14) {
      uint64_t v38 = 20LL;
    }
    else {
      uint64_t v38 = v36;
    }
    *unsigned int v34 = 0uLL;
    v34[1] = 0uLL;
    if ((_DWORD)v38)
    {
      uint64_t v39 = (unsigned __int8 *)(v32 + 39);
      do
      {
        int v40 = *v39++;
        snprintf((char *)v34, 0x29uLL, "%s%02x", (const char *)v34, v40);
        --v38;
      }

      while (v38);
      int v35 = quic_cid_describe_state;
      __int128 v37 = 0uLL;
    }

    uint64_t v41 = *(void *)(*(void *)(a1 + 40) + 1112LL);
    if (v35 % 3 == 2) {
      uint64_t v42 = &quic_cid_describe_cid_buf2;
    }
    else {
      uint64_t v42 = &quic_cid_describe_cid_buf3;
    }
    if (v35 % 3) {
      uint64_t v43 = v42;
    }
    else {
      uint64_t v43 = &quic_cid_describe_cid_buf1;
    }
    quic_cid_describe_unsigned int state = v35 + 1;
    else {
      uint64_t v44 = *(unsigned __int8 *)(v41 + 17);
    }
    *uint64_t v43 = v37;
    v43[1] = v37;
    *(_OWORD *)((char *)v43 + 25) = v37;
    if ((_DWORD)v44)
    {
      uint64_t v45 = (unsigned __int8 *)(v41 + 18);
      do
      {
        int v46 = *v45++;
        snprintf((char *)v43, 0x29uLL, "%s%02x", (const char *)v43, v46);
        --v44;
      }

      while (v44);
    }

    *(_DWORD *)uint64_t v30 = 136447234;
    *(void *)(v30 + 4) = "quic_conn_set_metadata_handlers_block_invoke";
    *(_WORD *)(v30 + 12) = 2082;
    *(void *)(v30 + 14) = v49;
    *(_WORD *)(v30 + 22) = 2082;
    *(void *)(v30 + 24) = v34;
    *(_WORD *)(v30 + 32) = 2082;
    *(void *)(v30 + 34) = v43;
    *(_WORD *)(v30 + 42) = 2048;
    *(void *)(v30 + 44) = v4;
    qlog_internal(1, (uint64_t)v29, 1005LL);
  }

void __quic_conn_set_metadata_handlers_block_invoke_2_23(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  uint64_t v1 = *(void *)(a1 + 32);
  if ((*(_BYTE *)(v1 + 1380) & 0x80) == 0)
  {
    uint64_t v3 = MEMORY[0x1895F87A8];
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 0x40000000LL;
    void v12[2] = __quic_conn_set_metadata_handlers_block_invoke_3_24;
    v12[3] = &__block_descriptor_tmp_25_3941;
    uint64_t v4 = *(void *)(a1 + 40);
    v12[4] = v1;
    v12[5] = v4;
    uint64_t v13 = -1LL;
    uint64_t flow_for_key = nw_protocol_instance_get_flow_for_key();
    if (*(_BYTE *)(v1 + 477) == 9)
    {
      uint64_t v13 = v3;
      uint64_t v14 = 0x40000000LL;
      int v15 = __quic_enumerate_open_data_streams_block_invoke;
      unsigned int v16 = &unk_18A117490;
      __int128 v17 = v12;
      uint64_t v18 = flow_for_key;
      nw_protocol_instance_enumerate_flows();
    }

    char v6 = *(void **)(a1 + 32);
    uint64_t path = quic_conn_select_next_path(v6, (uint64_t)&__block_literal_global_98);
    if ((quic_conn_send_internal((uint64_t)v6, path, 0LL) & 1) == 0
      && (qlog_debug_enabled
       || (qlog_nwlog_enabled & 1) != 0
       || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG)))
    {
      uint64_t v8 = _os_log_pack_size();
      uint64_t v9 = (char *)&v12[-1] - ((MEMORY[0x1895F8858](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v10 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v10 = 136446210;
      *(void *)(v10 + 4) = "quic_conn_set_metadata_handlers_block_invoke";
      qlog_internal(2, (uint64_t)v9, 988LL);
    }
  }

uint64_t __quic_conn_set_metadata_handlers_block_invoke_3_24(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  v13[1] = *MEMORY[0x1895F89C0];
  unint64_t v3 = *a3;
  if ((*a3 & 2) != 0)
  {
    if ((*(_BYTE *)(*(void *)(a1 + 32) + 1380LL) & 1) != 0)
    {
      if ((v3 & 1) != 0) {
        return 1LL;
      }
    }

    else if ((v3 & 1) == 0)
    {
      return 1LL;
    }

    unint64_t v6 = *(void *)(a1 + 40);
    if (v6 > a3[6])
    {
      a3[6] = v6;
      if (__quic_signpost_is_enabled__quic_signposts_once_3883[0] != -1) {
        dispatch_once(__quic_signpost_is_enabled__quic_signposts_once_3883, &__block_literal_global_192);
      }
      if (qlog_debug_enabled
        || (qlog_nwlog_enabled & 1) != 0
        || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v7 = _os_log_pack_size();
        uint64_t v8 = (char *)v13 - ((MEMORY[0x1895F8858](v7, v7) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v9 = _os_log_pack_fill();
        unint64_t v10 = *a3;
        uint64_t v11 = *(void *)(a1 + 40);
        *(_DWORD *)uint64_t v9 = 136446722;
        *(void *)(v9 + 4) = "quic_conn_set_metadata_handlers_block_invoke_3";
        *(_WORD *)(v9 + 12) = 2048;
        *(void *)(v9 + 14) = v10;
        *(_WORD *)(v9 + 22) = 2048;
        *(void *)(v9 + 24) = v11;
        qlog_internal(2, (uint64_t)v8, 979LL);
      }

      quic_frame_alloc_MAX_STREAM_DATA(*(void *)(*(void *)(a1 + 32) + 560LL), *a3, a3[6]);
    }
  }

  return 1LL;
}

void __quic_conn_set_metadata_handlers_block_invoke_2_17(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  uint64_t v1 = *(void *)(a1 + 32);
  if ((*(_BYTE *)(v1 + 1380) & 0x80) == 0)
  {
    uint64_t v3 = MEMORY[0x1895F87A8];
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 0x40000000LL;
    void v12[2] = __quic_conn_set_metadata_handlers_block_invoke_3_18;
    v12[3] = &__block_descriptor_tmp_19;
    uint64_t v4 = *(void *)(a1 + 40);
    v12[4] = v1;
    v12[5] = v4;
    uint64_t v13 = -1LL;
    uint64_t flow_for_key = nw_protocol_instance_get_flow_for_key();
    if (*(_BYTE *)(v1 + 477) == 9)
    {
      uint64_t v13 = v3;
      uint64_t v14 = 0x40000000LL;
      int v15 = __quic_enumerate_open_data_streams_block_invoke;
      unsigned int v16 = &unk_18A117490;
      __int128 v17 = v12;
      uint64_t v18 = flow_for_key;
      nw_protocol_instance_enumerate_flows();
    }

    unint64_t v6 = *(void **)(a1 + 32);
    uint64_t path = quic_conn_select_next_path(v6, (uint64_t)&__block_literal_global_98);
    if ((quic_conn_send_internal((uint64_t)v6, path, 0LL) & 1) == 0
      && (qlog_debug_enabled
       || (qlog_nwlog_enabled & 1) != 0
       || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG)))
    {
      uint64_t v8 = _os_log_pack_size();
      uint64_t v9 = (char *)&v12[-1] - ((MEMORY[0x1895F8858](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v10 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v10 = 136446210;
      *(void *)(v10 + 4) = "quic_conn_set_metadata_handlers_block_invoke";
      qlog_internal(2, (uint64_t)v9, 952LL);
    }
  }

uint64_t __quic_conn_set_metadata_handlers_block_invoke_3_18(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  v13[1] = *MEMORY[0x1895F89C0];
  unint64_t v3 = *a3;
  if ((*a3 & 2) == 0)
  {
    if ((*(_BYTE *)(*(void *)(a1 + 32) + 1380LL) & 1) != 0)
    {
      if ((v3 & 1) != 0) {
        return 1LL;
      }
    }

    else if ((v3 & 1) == 0)
    {
      return 1LL;
    }

    unint64_t v6 = *(void *)(a1 + 40);
    if (v6 > a3[6])
    {
      a3[6] = v6;
      if (__quic_signpost_is_enabled__quic_signposts_once_3883[0] != -1) {
        dispatch_once(__quic_signpost_is_enabled__quic_signposts_once_3883, &__block_literal_global_192);
      }
      if (qlog_debug_enabled
        || (qlog_nwlog_enabled & 1) != 0
        || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v7 = _os_log_pack_size();
        uint64_t v8 = (char *)v13 - ((MEMORY[0x1895F8858](v7, v7) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v9 = _os_log_pack_fill();
        unint64_t v10 = *a3;
        uint64_t v11 = *(void *)(a1 + 40);
        *(_DWORD *)uint64_t v9 = 136446722;
        *(void *)(v9 + 4) = "quic_conn_set_metadata_handlers_block_invoke_3";
        *(_WORD *)(v9 + 12) = 2048;
        *(void *)(v9 + 14) = v10;
        *(_WORD *)(v9 + 22) = 2048;
        *(void *)(v9 + 24) = v11;
        qlog_internal(2, (uint64_t)v8, 943LL);
      }

      quic_frame_alloc_MAX_STREAM_DATA(*(void *)(*(void *)(a1 + 32) + 560LL), *a3, a3[6]);
    }
  }

  return 1LL;
}

void __quic_conn_set_metadata_handlers_block_invoke_2_11(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  uint64_t v1 = *(void *)(a1 + 32);
  if ((*(_BYTE *)(v1 + 1380) & 0x80) == 0)
  {
    uint64_t v3 = MEMORY[0x1895F87A8];
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 0x40000000LL;
    void v12[2] = __quic_conn_set_metadata_handlers_block_invoke_3;
    v12[3] = &__block_descriptor_tmp_13_3948;
    uint64_t v4 = *(void *)(a1 + 40);
    v12[4] = v1;
    v12[5] = v4;
    uint64_t v13 = -1LL;
    uint64_t flow_for_key = nw_protocol_instance_get_flow_for_key();
    if (*(_BYTE *)(v1 + 477) == 9)
    {
      uint64_t v13 = v3;
      uint64_t v14 = 0x40000000LL;
      int v15 = __quic_enumerate_open_data_streams_block_invoke;
      unsigned int v16 = &unk_18A117490;
      __int128 v17 = v12;
      uint64_t v18 = flow_for_key;
      nw_protocol_instance_enumerate_flows();
    }

    unint64_t v6 = *(void **)(a1 + 32);
    uint64_t path = quic_conn_select_next_path(v6, (uint64_t)&__block_literal_global_98);
    if ((quic_conn_send_internal((uint64_t)v6, path, 0LL) & 1) == 0
      && (qlog_debug_enabled
       || (qlog_nwlog_enabled & 1) != 0
       || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG)))
    {
      uint64_t v8 = _os_log_pack_size();
      uint64_t v9 = (char *)&v12[-1] - ((MEMORY[0x1895F8858](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v10 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v10 = 136446210;
      *(void *)(v10 + 4) = "quic_conn_set_metadata_handlers_block_invoke";
      qlog_internal(2, (uint64_t)v9, 916LL);
    }
  }

uint64_t __quic_conn_set_metadata_handlers_block_invoke_3(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  v14[1] = *MEMORY[0x1895F89C0];
  unint64_t v3 = *a3;
  if ((*a3 & 2) == 0)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if ((*(_BYTE *)(v6 + 1380) & 1) != 0)
    {
      if ((v3 & 1) == 0) {
        return 1LL;
      }
    }

    else if ((v3 & 1) != 0)
    {
      return 1LL;
    }

    unint64_t v7 = *(void *)(a1 + 40);
    if (v7 > a3[6])
    {
      a3[6] = v7;
      if (qlog_debug_enabled
        || (qlog_nwlog_enabled & 1) != 0
        || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v8 = _os_log_pack_size();
        uint64_t v9 = (char *)v14 - ((MEMORY[0x1895F8858](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v10 = _os_log_pack_fill();
        unint64_t v11 = *a3;
        uint64_t v12 = *(void *)(a1 + 40);
        *(_DWORD *)uint64_t v10 = 136446722;
        *(void *)(v10 + 4) = "quic_conn_set_metadata_handlers_block_invoke_3";
        *(_WORD *)(v10 + 12) = 2048;
        *(void *)(v10 + 14) = v11;
        *(_WORD *)(v10 + 22) = 2048;
        *(void *)(v10 + 24) = v12;
        qlog_internal(2, (uint64_t)v9, 907LL);
        unint64_t v7 = a3[6];
        uint64_t v6 = *(void *)(a1 + 32);
        unint64_t v3 = *a3;
      }

      quic_frame_alloc_MAX_STREAM_DATA(*(void *)(v6 + 560), v3, v7);
    }
  }

  return 1LL;
}

void __quic_conn_set_metadata_handlers_block_invoke_2(uint64_t a1)
{
  v13[1] = *MEMORY[0x1895F89C0];
  uint64_t v1 = *(void *)(a1 + 32);
  if ((*(_BYTE *)(v1 + 1380) & 0x80) == 0)
  {
    unint64_t v3 = *(void *)(a1 + 40);
    if (v3 > *(void *)(v1 + 856))
    {
      *(void *)(v1 + 856) = v3;
      if (__quic_signpost_is_enabled__quic_signposts_once_3883[0] != -1) {
        dispatch_once(__quic_signpost_is_enabled__quic_signposts_once_3883, &__block_literal_global_192);
      }
      if (qlog_debug_enabled
        || (qlog_nwlog_enabled & 1) != 0
        || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v4 = _os_log_pack_size();
        int v5 = (char *)v13 - ((MEMORY[0x1895F8858](v4, v4) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v6 = _os_log_pack_fill();
        uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 856LL);
        *(_DWORD *)uint64_t v6 = 136446466;
        *(void *)(v6 + 4) = "quic_conn_set_metadata_handlers_block_invoke_2";
        *(_WORD *)(v6 + 12) = 2048;
        *(void *)(v6 + 14) = v7;
        qlog_internal(2, (uint64_t)v5, 878LL);
      }

      quic_frame_alloc_MAX_DATA(*(void *)(*(void *)(a1 + 32) + 560LL), *(void *)(*(void *)(a1 + 32) + 856LL));
      uint64_t v8 = *(void **)(a1 + 32);
      uint64_t path = quic_conn_select_next_path(v8, (uint64_t)&__block_literal_global_98);
      if ((quic_conn_send_internal((uint64_t)v8, path, 0LL) & 1) == 0
        && (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG)))
      {
        uint64_t v10 = _os_log_pack_size();
        unint64_t v11 = (char *)v13 - ((MEMORY[0x1895F8858](v10, v10) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v12 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v12 = 136446210;
        *(void *)(v12 + 4) = "quic_conn_set_metadata_handlers_block_invoke";
        qlog_internal(2, (uint64_t)v11, 882LL);
      }
    }
  }

size_t quic_conn_read_preferences()
{
  uint64_t v152 = *MEMORY[0x1895F89C0];
  uint64_t v79 = 0LL;
  uint64_t v80 = 0LL;
  uint64_t v78 = 0LL;
  Boolean v77 = 0;
  int v82 = "enable_debug";
  int v83 = 1;
  v84[0] = &qlog_debug_enabled;
  v84[1] = "disable_cubic";
  int v85 = 1;
  uint64_t v86 = &quic_disable_cubic;
  uint64_t v87 = "force_ledbat";
  int v88 = 1;
  unint64_t v89 = &quic_force_ledbat;
  unint64_t v90 = "disable_cached_rtt";
  int v91 = 1;
  unint64_t v92 = &quic_disable_cached_rtt;
  uint64_t v93 = "adaptive_time_thresh";
  int v94 = 1;
  int v95 = &quic_adaptive_time_thresh;
  int v96 = "adaptive_packet_thresh";
  int v97 = 1;
  int v98 = &quic_adaptive_packet_thresh;
  int v99 = "max_packet_reorder_thresh";
  int v100 = 2;
  int v101 = &quic_max_packet_reorder_thresh;
  int v102 = "quiclog_directory";
  int v103 = 3;
  int v104 = quiclog_directory;
  int v105 = "ack_default_packet_threshold";
  int v106 = 2;
  uint64_t v107 = &quic_ack_default_packet_threshold;
  unint64_t v108 = "initial_stream_rcv_space";
  int v109 = 2;
  char v110 = (char *)&v80 + 4;
  char v111 = "initial_conn_rcv_space";
  int v112 = 2;
  uint64_t v113 = &v80;
  uint64_t v114 = "max_concurrent_streams";
  int v115 = 2;
  int v116 = (char *)&v79 + 4;
  int v117 = "stream_max_rcv_window";
  int v118 = 2;
  char v119 = &v79;
  uint64_t v120 = "enable_ack_freq";
  int v121 = 1;
  uint64_t v122 = &quic_enable_ack_freq;
  uint64_t v123 = "pace_packets";
  int v124 = 1;
  uint64_t v125 = &quic_pace_packets;
  uint64_t v126 = "disable_kernel_pacing";
  int v127 = 1;
  uint64_t v128 = &quic_disable_kernel_pacing;
  uint64_t v129 = "initial_max_data";
  int v130 = 2;
  unint64_t v131 = (char *)&v78 + 4;
  uint64_t v132 = "initial_max_stream_data_bidi_local";
  int v133 = 2;
  uint64_t v134 = &v78;
  char v135 = "enable_ack_compression";
  int v136 = 1;
  v137 = &quic_ack_compression_enabled;
  v138 = "migration_version";
  int v139 = 2;
  uint64_t v140 = &quic_migration_version;
  uint64_t v141 = "enable_multipath";
  int v142 = 1;
  v143 = &quic_enable_multipath;
  uint64_t v144 = "migration_pto_threshold";
  int v145 = 2;
  uint64_t v146 = &quic_migration_pto_threshold;
  v147 = "migration_keepalive_threshold";
  int v148 = 2;
  uint64_t v149 = &quic_migration_keepalive_threshold;
  *((void *)&v0 + 1) = 0LL;
  __int128 v150 = 0u;
  uint64_t v151 = 0LL;
  uint64_t v1 = "enable_debug";
  if (!"enable_debug") {
    goto LABEL_53;
  }
  uint64_t v2 = 0LL;
  unsigned int v3 = 1;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  *(void *)&__int128 v0 = 136446722LL;
  __int128 v76 = v0;
  uint64_t v4 = &v82;
  do
  {
    snprintf(v81, 0x80uLL, "quic_%s", v1);
    if (network_config_setting_exists())
    {
      int v12 = (int)(&v82)[3 * v2 + 1];
      switch(v12)
      {
        case 3:
          network_config_get_string_setting();
          if (qlog_debug_enabled
            || (qlog_nwlog_enabled & 1) != 0
            || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))
          {
            uint64_t v5 = _os_log_pack_size();
            uint64_t v6 = (char *)&v74 - ((MEMORY[0x1895F8858](v5, v5) + 15) & 0xFFFFFFFFFFFFFFF0LL);
            uint64_t v7 = _os_log_pack_fill();
            uint64_t v8 = *v4;
            uint64_t v9 = v84[3 * v2];
            *(_DWORD *)uint64_t v7 = v76;
            *(void *)(v7 + 4) = "quic_conn_read_preferences";
            *(_WORD *)(v7 + 12) = 2082;
            *(void *)(v7 + 14) = v8;
            *(_WORD *)(v7 + 22) = 2082;
            *(void *)(v7 + 24) = v9;
            uint64_t v10 = (uint64_t)v6;
            uint64_t v11 = 567LL;
LABEL_4:
            qlog_internal(1, v10, v11);
          }

          break;
        case 2:
          int int64_setting = network_config_get_int64_setting();
          uint64_t v23 = &(&v82)[3 * v2];
          int v25 = (char *)v23[2];
          uint64_t v24 = (int **)(v23 + 2);
          *(_DWORD *)int v25 = int64_setting;
          if (qlog_debug_enabled
            || (qlog_nwlog_enabled & 1) != 0
            || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))
          {
            uint64_t v26 = _os_log_pack_size();
            uint64_t v27 = (char *)&v74 - ((MEMORY[0x1895F8858](v26, v26) + 15) & 0xFFFFFFFFFFFFFFF0LL);
            uint64_t v28 = _os_log_pack_fill();
            uint64_t v29 = *v4;
            int v30 = **v24;
            *(_DWORD *)uint64_t v28 = v76;
            *(void *)(v28 + 4) = "quic_conn_read_preferences";
            *(_WORD *)(v28 + 12) = 2082;
            *(void *)(v28 + 14) = v29;
            *(_WORD *)(v28 + 22) = 1024;
            *(_DWORD *)(v28 + 24) = v30;
            uint64_t v10 = (uint64_t)v27;
            uint64_t v11 = 561LL;
            goto LABEL_4;
          }

          break;
        case 1:
          char BOOL_setting = network_config_get_BOOL_setting();
          uint64_t v14 = &(&v82)[3 * v2];
          unsigned int v16 = (char *)v14[2];
          int v15 = (unsigned __int8 **)(v14 + 2);
          char *v16 = BOOL_setting;
          if (qlog_debug_enabled
            || (qlog_nwlog_enabled & 1) != 0
            || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))
          {
            uint64_t v17 = _os_log_pack_size();
            uint64_t v18 = (char *)&v74 - ((MEMORY[0x1895F8858](v17, v17) + 15) & 0xFFFFFFFFFFFFFFF0LL);
            uint64_t v19 = _os_log_pack_fill();
            int v20 = *v4;
            int v21 = **v15;
            *(_DWORD *)uint64_t v19 = v76;
            *(void *)(v19 + 4) = "quic_conn_read_preferences";
            *(_WORD *)(v19 + 12) = 2082;
            *(void *)(v19 + 14) = v20;
            *(_WORD *)(v19 + 22) = 1024;
            *(_DWORD *)(v19 + 24) = v21;
            uint64_t v10 = (uint64_t)v18;
            uint64_t v11 = 555LL;
            goto LABEL_4;
          }

          break;
      }
    }

    uint64_t v2 = v3;
    uint64_t v4 = &(&v82)[3 * v3];
    uint64_t v1 = *v4;
    ++v3;
  }

  while (*v4);
  uint64_t v31 = v82;
  if (v82)
  {
    uint64_t v32 = 0LL;
    int v33 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    unsigned int v34 = 1;
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    int v35 = &v82;
    do
    {
      uint64_t v41 = CFStringCreateWithCString(v33, v31, 0x600u);
      uint64_t v42 = v41;
      int v43 = (int)(&v82)[3 * v32 + 1];
      switch(v43)
      {
        case 3:
          char v64 = (const __CFString *)CFPreferencesCopyAppValue(v41, @"com.apple.network.quic");
          if (v42) {
            CFRelease(v42);
          }
          if (v64)
          {
            CFTypeID v65 = CFGetTypeID(v64);
            if (v65 == CFStringGetTypeID())
            {
              uint64_t v66 = &(&v82)[3 * v32];
              uint64_t v68 = (char *)v66[2];
              uint64_t v67 = (uint64_t *)(v66 + 2);
              CFStringGetCString(v64, v68, 1024LL, 0x600u);
              if (qlog_debug_enabled
                || (qlog_nwlog_enabled & 1) != 0
                || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))
              {
                uint64_t v36 = _os_log_pack_size();
                __int128 v37 = (char *)&v74 - ((MEMORY[0x1895F8858](v36, v36) + 15) & 0xFFFFFFFFFFFFFFF0LL);
                uint64_t v38 = _os_log_pack_fill();
                uint64_t v39 = *v35;
                uint64_t v40 = *v67;
                *(_DWORD *)uint64_t v38 = v76;
                *(void *)(v38 + 4) = "quic_conn_read_preferences";
                *(_WORD *)(v38 + 12) = 2082;
                *(void *)(v38 + 14) = v39;
                *(_WORD *)(v38 + 22) = 2082;
                *(void *)(v38 + 24) = v40;
                qlog_internal(1, (uint64_t)v37, 614LL);
              }
            }

            CFRelease(v64);
          }

          goto LABEL_26;
        case 2:
          int AppIntegerValue = CFPreferencesGetAppIntegerValue(v41, @"com.apple.network.quic", &v77);
          if (v42) {
            CFRelease(v42);
          }
          if (!v77) {
            goto LABEL_26;
          }
          uint64_t v56 = &(&v82)[3 * v32];
          uint64_t v58 = (char *)v56[2];
          int v57 = (int **)(v56 + 2);
          *(_DWORD *)uint64_t v58 = AppIntegerValue;
          if (!qlog_debug_enabled
            && (qlog_nwlog_enabled & 1) == 0
            && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))
          {
            goto LABEL_26;
          }

          uint64_t v59 = _os_log_pack_size();
          uint64_t v60 = (char *)&v74 - ((MEMORY[0x1895F8858](v59, v59) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          uint64_t v61 = _os_log_pack_fill();
          int v62 = *v35;
          int v63 = **v57;
          *(_DWORD *)uint64_t v61 = v76;
          *(void *)(v61 + 4) = "quic_conn_read_preferences";
          *(_WORD *)(v61 + 12) = 2082;
          *(void *)(v61 + 14) = v62;
          *(_WORD *)(v61 + 22) = 1024;
          *(_DWORD *)(v61 + 24) = v63;
          uint64_t v53 = (uint64_t)v60;
          uint64_t v54 = 598LL;
          break;
        case 1:
          int AppBooleanValue = CFPreferencesGetAppBooleanValue(v41, @"com.apple.network.quic", &v77);
          if (v42) {
            CFRelease(v42);
          }
          if (!v77) {
            goto LABEL_26;
          }
          uint64_t v45 = &(&v82)[3 * v32];
          uint64_t v47 = (BOOL *)v45[2];
          int v46 = (unsigned __int8 **)(v45 + 2);
          BOOL *v47 = AppBooleanValue != 0;
          if (!qlog_debug_enabled
            && (qlog_nwlog_enabled & 1) == 0
            && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))
          {
            goto LABEL_26;
          }

          uint64_t v48 = _os_log_pack_size();
          __int128 v49 = (char *)&v74 - ((MEMORY[0x1895F8858](v48, v48) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          uint64_t v50 = _os_log_pack_fill();
          uint64_t v51 = *v35;
          int v52 = **v46;
          *(_DWORD *)uint64_t v50 = v76;
          *(void *)(v50 + 4) = "quic_conn_read_preferences";
          *(_WORD *)(v50 + 12) = 2082;
          *(void *)(v50 + 14) = v51;
          *(_WORD *)(v50 + 22) = 1024;
          *(_DWORD *)(v50 + 24) = v52;
          uint64_t v53 = (uint64_t)v49;
          uint64_t v54 = 588LL;
          break;
        default:
          goto LABEL_26;
      }

      qlog_internal(1, v53, v54);
LABEL_26:
      uint64_t v32 = v34;
      int v35 = &(&v82)[3 * v34];
      uint64_t v31 = *v35;
      ++v34;
    }

    while (*v35);
  }

uint64_t quic_conn_destroy(uint64_t a1)
{
  v8[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if ((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v1 = _os_log_pack_size();
      uint64_t v2 = (char *)v8 - ((MEMORY[0x1895F8858](v1, v1) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v3 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v3 = 136446210;
      *(void *)(v3 + 4) = "quic_conn_destroy";
      qlog_internal(2, (uint64_t)v2, 675LL);
    }

    return nw_protocol_instance_access_state();
  }

  else if ((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1 {
         || (uint64_t result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT), (_DWORD)result))
  }
  {
    uint64_t v5 = _os_log_pack_size();
    uint64_t v6 = (char *)v8 - ((MEMORY[0x1895F8858](v5, v5) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v7 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v7 = 136446210;
    *(void *)(v7 + 4) = "quic_conn_destroy";
    qlog_internal(17, (uint64_t)v6, 673LL);
    return 0LL;
  }

  return result;
}

uint64_t __quic_conn_destroy_block_invoke(uint64_t a1, void **a2)
{
  uint64_t v3 = a2[119];
  if (v3) {
    quic_recovery_reset(v3);
  }
  quic_timer_stop((uint64_t)a2[72]);
  uint64_t v4 = a2[70];
  if (v4)
  {
    quic_packet_builder_destroy(v4);
    a2[70] = 0LL;
  }

  for (i = a2[170]; i; i = a2[170])
    _quic_path_destroy((uint64_t)(a2 + 170), a2, i);
  if (*a2)
  {
    nw_release(*a2);
    *a2 = 0LL;
  }

  return 1LL;
}

void *quic_conn_alloc_globals()
{
  uint64_t result = calloc(1uLL, 0x48uLL);
  if (result)
  {
    *uint64_t result = 0LL;
    result[1] = result;
    result[3] = 0LL;
    result[4] = result + 3;
    result[6] = 0LL;
    result[7] = result + 6;
  }

  else
  {
    int v1 = qlog_abort_internal("%s strict_calloc(%zu, %zu) failed", "strict_calloc", 1uLL, 0x48uLL);
    return (void *)quic_conn_dealloc_globals(v1, v2);
  }

  return result;
}

void quic_conn_dealloc_globals(int a1, void *a2)
{
  for (i = (void *)*a2; *a2; i = (void *)*a2)
  {
    uint64_t v7 = i[12];
    uint64_t v8 = (void *)i[13];
    if (v7)
    {
      *(void *)(v7 + 104) = v8;
      uint64_t v8 = (void *)i[13];
    }

    else
    {
      a2[1] = v8;
    }

    *uint64_t v8 = v7;
    free(i);
  }

  *((_DWORD *)a2 + 4) = 0;
  while (1)
  {
    uint64_t v4 = (void *)a2[3];
    if (!v4) {
      break;
    }
    uint64_t v5 = v4[21];
    uint64_t v6 = (void *)v4[22];
    if (v5)
    {
      *(void *)(v5 + 176) = v6;
      uint64_t v6 = (void *)v4[22];
    }

    else
    {
      a2[4] = v6;
    }

    *uint64_t v6 = v5;
    free(v4);
  }

  *((_DWORD *)a2 + 10) = 0;
  while (1)
  {
    uint64_t v9 = (void *)a2[6];
    if (!v9) {
      break;
    }
    uint64_t v10 = v9[5];
    uint64_t v11 = (void *)v9[6];
    if (v10)
    {
      *(void *)(v10 + 48) = v11;
      uint64_t v11 = (void *)v9[6];
    }

    else
    {
      a2[7] = v11;
    }

    void *v11 = v10;
    free(v9);
  }

  free(a2);
}

uint64_t quic_conn_copy_metadata(uint64_t a1, uint64_t a2)
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return 0LL;
    }

    uint64_t v6 = _os_log_pack_size();
    uint64_t v7 = (char *)&v18 - ((MEMORY[0x1895F8858](v6, v6) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136446210;
    *(void *)(v8 + 4) = "quic_conn_copy_metadata";
    uint64_t v9 = (uint64_t)v7;
    uint64_t v10 = 1138LL;
    goto LABEL_21;
  }

  if (*MEMORY[0x189608EC8] == a2)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return 0LL;
    }

    uint64_t v11 = _os_log_pack_size();
    int v12 = (char *)&v18 - ((MEMORY[0x1895F8858](v11, v11) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v13 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v13 = 136446210;
    *(void *)(v13 + 4) = "quic_conn_copy_metadata";
    uint64_t v9 = (uint64_t)v12;
    uint64_t v10 = 1139LL;
LABEL_21:
    qlog_internal(17, v9, v10);
    return 0LL;
  }

  uint64_t v38 = 0LL;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x2000000000LL;
  uint64_t v41 = 0LL;
  if (*MEMORY[0x189608EB8] != a2)
  {
    if (*MEMORY[0x189608ED0] != a2)
    {
      uint64_t v20 = MEMORY[0x1895F87A8];
      uint64_t v21 = 0x40000000LL;
      uint64_t v22 = __quic_conn_copy_metadata_block_invoke_2;
      uint64_t v23 = &unk_18A117AA0;
      uint64_t v24 = &v38;
      uint64_t v25 = a1;
      nw_protocol_instance_access_flow_state();
      goto LABEL_10;
    }

    uint64_t v2 = nw_protocol_copy_quic_stream_definition();
    if (v2)
    {
      uint64_t v3 = (void *)v2;
      v39[3] = nw_protocol_metadata_create_singleton();
      nw_release(v3);
      uint64_t v26 = MEMORY[0x1895F87A8];
      uint64_t v27 = 0x40000000LL;
      uint64_t v28 = __quic_conn_copy_metadata_block_invoke_77;
      uint64_t v29 = &unk_18A117A50;
      int v30 = &v38;
      goto LABEL_8;
    }

    __nwlog_obj();
    *(void *)&__int128 v14 = 136446210LL;
    __int128 v18 = v14;
    *(_DWORD *)buf = 136446210;
    int v43 = "quic_conn_copy_metadata";
    os_log_type_t v32 = OS_LOG_TYPE_ERROR;
    char v31 = 0;
    uint64_t v19 = (void *)_os_log_send_and_compose_impl();
    if (__nwlog_fault())
    {
      if (v32 == OS_LOG_TYPE_FAULT)
      {
        int v15 = (os_log_s *)__nwlog_obj();
        os_log_type_t v16 = v32;
        if (os_log_type_enabled(v15, v32))
        {
          *(_DWORD *)buf = v18;
          int v43 = "quic_conn_copy_metadata";
          uint64_t v17 = "%{public}s called with null definition";
LABEL_29:
          _os_log_impl(&dword_187B3B000, v15, v16, v17, buf, 0xCu);
        }
      }

      else
      {
        int v15 = (os_log_s *)__nwlog_obj();
        os_log_type_t v16 = v32;
        if (os_log_type_enabled(v15, v32))
        {
          *(_DWORD *)buf = v18;
          int v43 = "quic_conn_copy_metadata";
          uint64_t v17 = "%{public}s called with null definition, backtrace limit exceeded";
          goto LABEL_29;
        }
      }
    }

    if (v19) {
      free(v19);
    }
    uint64_t v4 = 0LL;
    goto LABEL_11;
  }

  uint64_t v33 = MEMORY[0x1895F87A8];
  uint64_t v34 = 0x40000000LL;
  int v35 = __quic_conn_copy_metadata_block_invoke;
  uint64_t v36 = &unk_18A117A28;
  __int128 v37 = &v38;
LABEL_8:
  nw_protocol_instance_access_state();
LABEL_10:
  uint64_t v4 = v39[3];
LABEL_11:
  _Block_object_dispose(&v38, 8);
  return v4;
}

uint64_t __quic_conn_copy_metadata_block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = nw_retain(*(void **)(a2 + 8));
  return 1LL;
}

uint64_t __quic_conn_copy_metadata_block_invoke_77()
{
  return 1LL;
}

uint64_t __quic_conn_copy_metadata_block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = nw_retain(*(void **)(a2 + 16));
  return 1LL;
}

uint64_t __quic_conn_copy_metadata_block_invoke_3()
{
  return 1LL;
}

uint64_t quic_conn_foreach_path(uint64_t a1, uint64_t a2)
{
  v6[1] = *MEMORY[0x1895F89C0];
  if (a1) {
    return quic_path_foreach((uint64_t *)(a1 + 1360), a2);
  }
  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    uint64_t v3 = _os_log_pack_size();
    uint64_t v4 = (char *)v6 - ((MEMORY[0x1895F8858](v3, v3) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v5 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v5 = 136446210;
    *(void *)(v5 + 4) = "quic_conn_foreach_path";
    qlog_internal(17, (uint64_t)v4, 5650LL);
  }

  return 0LL;
}

uint64_t quic_conn_get_min_mss_path(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v15 = 0x2000000000LL;
    v9[0] = MEMORY[0x1895F87A8];
    uint64_t v10 = __quic_conn_get_min_mss_path_block_invoke;
    uint64_t v11 = &unk_18A117B40;
    uint64_t v13 = 0LL;
    __int128 v14 = &v13;
    uint64_t v16 = 0LL;
    v9[1] = 0x40000000LL;
    int v12 = &v13;
    uint64_t v1 = *(void *)(a1 + 1360);
    do
    {
      if (!v1) {
        break;
      }
      uint64_t v2 = *(void *)(v1 + 312);
      char v3 = ((uint64_t (*)(void *))v10)(v9);
      uint64_t v1 = v2;
    }

    while ((v3 & 1) != 0);
    uint64_t v4 = v14[3];
    _Block_object_dispose(&v13, 8);
  }

  else
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      uint64_t v6 = _os_log_pack_size();
      uint64_t v7 = (char *)v9 - ((MEMORY[0x1895F8858](v6, v6) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v8 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v8 = 136446210;
      *(void *)(v8 + 4) = "quic_conn_get_min_mss_path";
      qlog_internal(17, (uint64_t)v7, 1342LL);
    }

    return 0LL;
  }

  return v4;
}

uint64_t quic_conn_get_mss_from_interface(uint64_t *a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *a1;
  if (!*a1)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      uint64_t v15 = _os_log_pack_size();
      uint64_t v16 = (char *)&v20[-1] - ((MEMORY[0x1895F8858](v15, v15) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v17 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v17 = 136446210;
      *(void *)(v17 + 4) = "quic_conn_get_mss_from_interface";
      qlog_internal(17, (uint64_t)v16, 1290LL);
      return 1200LL;
    }

    return 1200LL;
  }

  uint64_t v5 = nw_protocol_instance_copy_interface_for_path();
  if (!v5)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      uint64_t v11 = _os_log_pack_size();
      int v12 = (char *)&v20[-1] - ((MEMORY[0x1895F8858](v11, v11) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v13 = _os_log_pack_fill();
      uint64_t v14 = *a2;
      *(_DWORD *)uint64_t v13 = 136446466;
      *(void *)(v13 + 4) = "quic_conn_get_mss_from_interface";
      *(_WORD *)(v13 + 12) = 2048;
      *(void *)(v13 + 14) = v14;
      qlog_internal(17, (uint64_t)v12, 1298LL);
      return 1200LL;
    }

    return 1200LL;
  }

  uint64_t v6 = (void *)v5;
  uint64_t v29 = 0x2000000000LL;
  __int16 v30 = *((_WORD *)a1 + 298);
  v20[0] = MEMORY[0x1895F87A8];
  uint64_t v21 = (uint64_t (*)(void *))__quic_conn_get_mss_from_interface_block_invoke;
  uint64_t v22 = &unk_18A117B18;
  uint64_t v27 = 0LL;
  uint64_t v28 = &v27;
  v20[1] = 0x40000000LL;
  uint64_t v25 = v2;
  uint64_t v26 = v5;
  uint64_t v23 = &v27;
  uint64_t v24 = a2;
  uint64_t v7 = a1[170];
  do
  {
    if (!v7) {
      break;
    }
    uint64_t v8 = *(void *)(v7 + 312);
    char v9 = v21(v20);
    uint64_t v7 = v8;
  }

  while ((v9 & 1) != 0);
  nw_release(v6);
  uint64_t v10 = *((unsigned __int16 *)v28 + 12);
  _Block_object_dispose(&v27, 8);
  return v10;
}

BOOL __quic_conn_get_mss_from_interface_block_invoke(void *a1, uint64_t *a2)
{
  v21[1] = *MEMORY[0x1895F89C0];
  uint64_t v4 = (void *)nw_protocol_instance_copy_interface_for_path();
  if (v4)
  {
    if (v4 != (void *)a1[7])
    {
      nw_release(v4);
      return 1LL;
    }

    *(_WORD *)(*(void *)(a1[4] + 8LL) + 24LL) = *((_WORD *)a2 + 213);
    nw_release(v4);
    uint64_t v10 = *(void *)(a1[4] + 8LL);
    if (*(_WORD *)(v10 + 24))
    {
      if ((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1
        || (BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG)))
      {
        uint64_t v11 = _os_log_pack_size();
        int v12 = (char *)v21 - ((MEMORY[0x1895F8858](v11, v11) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v13 = _os_log_pack_fill();
        uint64_t v14 = (uint64_t *)a1[5];
        int v15 = *(unsigned __int16 *)(*(void *)(a1[4] + 8LL) + 24LL);
        uint64_t v16 = *v14;
        uint64_t v17 = *a2;
        *(_DWORD *)uint64_t v13 = 136447490;
        *(void *)(v13 + 4) = "quic_conn_get_mss_from_interface_block_invoke";
        *(_WORD *)(v13 + 12) = 1024;
        *(_DWORD *)(v13 + 14) = v15;
        *(_WORD *)(v13 + 18) = 2048;
        *(void *)(v13 + 20) = v14;
        *(_WORD *)(v13 + 28) = 2048;
        *(void *)(v13 + 30) = v16;
        *(_WORD *)(v13 + 38) = 2048;
        *(void *)(v13 + 40) = a2;
        *(_WORD *)(v13 + 48) = 2048;
        *(void *)(v13 + 50) = v17;
        qlog_internal(2, (uint64_t)v12, 1327LL);
        return 0LL;
      }
    }

    else
    {
      if ((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1
        || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
      {
        uint64_t v18 = _os_log_pack_size();
        uint64_t v19 = (char *)v21 - ((MEMORY[0x1895F8858](v18, v18) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v20 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v20 = 136446210;
        *(void *)(v20 + 4) = "quic_conn_get_mss_from_interface_block_invoke";
        qlog_internal(17, (uint64_t)v19, 1320LL);
        uint64_t v10 = *(void *)(a1[4] + 8LL);
      }

      BOOL result = 0LL;
      *(_WORD *)(v10 + 24) = 1200;
    }
  }

  else
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return 1LL;
    }

    uint64_t v6 = _os_log_pack_size();
    uint64_t v7 = (char *)v21 - ((MEMORY[0x1895F8858](v6, v6) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v8 = _os_log_pack_fill();
    uint64_t v9 = *a2;
    *(_DWORD *)uint64_t v8 = 136446466;
    *(void *)(v8 + 4) = "quic_conn_get_mss_from_interface_block_invoke";
    *(_WORD *)(v8 + 12) = 2048;
    *(void *)(v8 + 14) = v9;
    qlog_internal(17, (uint64_t)v7, 1312LL);
    return 1LL;
  }

  return result;
}

void quic_conn_set_application_error(uint64_t a1)
{
  v4[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    nw_quic_connection_set_application_error_internal();
    nw_quic_connection_set_application_error_reason();
  }

  else if (qlog_debug_enabled {
         || (qlog_nwlog_enabled & 1) != 0
  }
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    uint64_t v1 = _os_log_pack_size();
    uint64_t v2 = (char *)v4 - ((MEMORY[0x1895F8858](v1, v1) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v3 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v3 = 136446210;
    *(void *)(v3 + 4) = "quic_conn_set_application_error";
    qlog_internal(17, (uint64_t)v2, 1363LL);
  }

uint64_t quic_conn_is_user_pacing(uint64_t a1, uint64_t a2)
{
  v6[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if ((*(_BYTE *)(a1 + 1384) & 2) == 0) {
      return quic_conn_is_pacing(a1, a2);
    }
  }

  else if (qlog_debug_enabled {
         || (qlog_nwlog_enabled & 1) != 0
  }
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    uint64_t v3 = _os_log_pack_size();
    uint64_t v4 = (char *)v6 - ((MEMORY[0x1895F8858](v3, v3) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v5 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v5 = 136446210;
    *(void *)(v5 + 4) = "quic_conn_is_user_pacing";
    qlog_internal(17, (uint64_t)v4, 1402LL);
  }

  return 0LL;
}

uint64_t quic_conn_scid_len(uint64_t a1)
{
  v11[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v1 = *(void *)(a1 + 1112);
    if (v1) {
      return *(unsigned __int8 *)(v1 + 38);
    }
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || (uint64_t result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT), (_DWORD)result))
    {
      uint64_t v8 = _os_log_pack_size();
      uint64_t v9 = (char *)v11 - ((MEMORY[0x1895F8858](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v10 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v10 = 136446210;
      *(void *)(v10 + 4) = "quic_conn_scid_len";
      uint64_t v6 = (uint64_t)v9;
      uint64_t v7 = 1419LL;
      goto LABEL_13;
    }
  }

  else if (qlog_debug_enabled {
         || (qlog_nwlog_enabled & 1) != 0
  }
         || (uint64_t result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT), (_DWORD)result))
  {
    uint64_t v3 = _os_log_pack_size();
    uint64_t v4 = (char *)v11 - ((MEMORY[0x1895F8858](v3, v3) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v5 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v5 = 136446210;
    *(void *)(v5 + 4) = "quic_conn_scid_len";
    uint64_t v6 = (uint64_t)v4;
    uint64_t v7 = 1418LL;
LABEL_13:
    qlog_internal(17, v6, v7);
    return 0LL;
  }

  return result;
}

uint64_t quic_conn_get_scid_seq(uint64_t a1, _BYTE *a2)
{
  uint64_t result = quic_cid_array_find_by_cid(*(unsigned __int8 **)(a1 + 376), a2);
  if (result) {
    return *(void *)(result + 40);
  }
  return result;
}

uint64_t quic_conn_recompute_mss( uint64_t a1, _WORD *a2, int a3, unsigned int a4, int a5, int a6, int a7, int a8)
{
  int v40 = a3;
  uint64_t v41 = *MEMORY[0x1895F89C0];
  unsigned int v9 = (unsigned __int16)a2[213];
  if (v9 == (unsigned __int16)a2[212])
  {
    if ((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1
      || (uint64_t v16 = (os_log_s *)qlog_log, os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG)))
    {
      uint64_t v17 = _os_log_pack_size();
      uint64_t v18 = &v39[-((MEMORY[0x1895F8858](v17, v17) + 15) & 0xFFFFFFFFFFFFFFF0LL)];
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v19 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v19 = 136447746;
      *(void *)(v19 + 4) = "quic_conn_recompute_mss";
      *(_WORD *)(v19 + 12) = 1024;
      *(_DWORD *)(v19 + 14) = v40;
      *(_WORD *)(v19 + 18) = 1024;
      *(_DWORD *)(v19 + 20) = a4;
      *(_WORD *)(v19 + 24) = 1024;
      *(_DWORD *)(v19 + 26) = a5;
      *(_WORD *)(v19 + 30) = 1024;
      *(_DWORD *)(v19 + 32) = a6;
      *(_WORD *)(v19 + 36) = 1024;
      *(_DWORD *)(v19 + 38) = a7;
      *(_WORD *)(v19 + 42) = 1024;
      *(_DWORD *)(v19 + 44) = a8;
      qlog_internal(2, (uint64_t)v18, 1452LL);
      int v20 = qlog_debug_enabled;
      char v21 = qlog_nwlog_enabled;
      if (a5) {
        int v22 = 48;
      }
      else {
        int v22 = 28;
      }
      unsigned int v9 = 9216 - v22;
      if (9216 - v22 < a4) {
        a4 = 9216 - v22;
      }
      uint64_t v23 = a2 + 214;
      a2[214] = a4;
      if (v20 || (v21 & 1) != 0) {
        goto LABEL_19;
      }
      uint64_t v16 = (os_log_s *)qlog_log;
    }

    else
    {
      if (a5) {
        int v22 = 48;
      }
      else {
        int v22 = 28;
      }
      unsigned int v9 = 9216 - v22;
      if (9216 - v22 < a4) {
        a4 = 9216 - v22;
      }
      uint64_t v23 = a2 + 214;
      a2[214] = a4;
    }

    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
LABEL_20:
      if (a4 < *(unsigned __int16 *)(a1 + 596))
      {
        if (qlog_debug_enabled
          || (qlog_nwlog_enabled & 1) != 0
          || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v28 = _os_log_pack_size();
          uint64_t v29 = &v39[-((MEMORY[0x1895F8858](v28, v28) + 15) & 0xFFFFFFFFFFFFFFF0LL)];
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          uint64_t v30 = _os_log_pack_fill();
          int v31 = *v23;
          int v32 = *(unsigned __int16 *)(a1 + 596);
          *(_DWORD *)uint64_t v30 = 136446722;
          *(void *)(v30 + 4) = "quic_conn_recompute_mss";
          *(_WORD *)(v30 + 12) = 1024;
          *(_DWORD *)(v30 + 14) = v31;
          *(_WORD *)(v30 + 18) = 1024;
          *(_DWORD *)(v30 + 20) = v32;
          qlog_internal(2, (uint64_t)v29, 1461LL);
          a4 = *v23;
        }

        a2[212] = a4;
      }

      if (!a8 || (a7 & 1) != 0 || (a6 & 1) != 0)
      {
        if (a7)
        {
          if (v9 >= a4) {
            LOWORD(v9) = a4;
          }
        }

        else
        {
          unsigned int v33 = (unsigned __int16)a2[213];
          if (v33 >= a4) {
            LOWORD(v33) = a4;
          }
          __int16 v34 = v40 - v22;
          if (a6) {
            LOWORD(v9) = v34;
          }
          else {
            LOWORD(v9) = v33;
          }
        }
      }

      else if (1280 - v22 >= a4)
      {
        LOWORD(v9) = a4;
      }

      else
      {
        LOWORD(v9) = 1280 - v22;
      }

      return (unsigned __int16)v9;
    }

void quic_conn_setup_pmtud(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  LODWORD(v126) = a4;
  uint64_t v138 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v4 = a2;
    if (!a2)
    {
      if (qlog_debug_enabled
        || (qlog_nwlog_enabled & 1) != 0
        || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
      {
        uint64_t v101 = _os_log_pack_size();
        int v102 = (char *)&v117 - ((MEMORY[0x1895F8858](v101, v101) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v103 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v103 = 136446210;
        *(void *)(v103 + 4) = "quic_conn_setup_pmtud";
        int v95 = 17;
        uint64_t v96 = (uint64_t)v102;
        uint64_t v97 = 1489LL;
        goto LABEL_176;
      }

      return;
    }

    if (*MEMORY[0x189608EC8] == a3)
    {
      if (qlog_debug_enabled
        || (qlog_nwlog_enabled & 1) != 0
        || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
      {
        uint64_t v104 = _os_log_pack_size();
        int v105 = (char *)&v117 - ((MEMORY[0x1895F8858](v104, v104) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v106 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v106 = 136446210;
        *(void *)(v106 + 4) = "quic_conn_setup_pmtud";
        int v95 = 17;
        uint64_t v96 = (uint64_t)v105;
        uint64_t v97 = 1490LL;
        goto LABEL_176;
      }

      return;
    }

    if (!*(void *)a1 || (uint64_t v6 = nw_protocol_instance_copy_path()) == 0)
    {
      if ((qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
        && *(void *)(a1 + 1112))
      {
        uint64_t v123 = v4;
        uint64_t v9 = _os_log_pack_size();
        uint64_t v10 = (char *)&v117 - ((MEMORY[0x1895F8858](v9, v9) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v11 = _os_log_pack_fill();
        uint64_t v125 = a1 + 976;
        int v12 = *(unsigned __int8 **)(a1 + 1112);
        if (quic_cid_describe_state % 3 == 2) {
          uint64_t v13 = &quic_cid_describe_cid_buf2;
        }
        else {
          uint64_t v13 = &quic_cid_describe_cid_buf3;
        }
        if (quic_cid_describe_state % 3) {
          uint64_t v14 = v13;
        }
        else {
          uint64_t v14 = &quic_cid_describe_cid_buf1;
        }
        int v15 = ++quic_cid_describe_state;
        unsigned int v16 = v12[38];
        __int128 v17 = 0uLL;
        *(_OWORD *)((char *)v14 + 25) = 0u;
        if (v16 >= 0x14) {
          uint64_t v18 = 20LL;
        }
        else {
          uint64_t v18 = v16;
        }
        _OWORD *v14 = 0uLL;
        v14[1] = 0uLL;
        if ((_DWORD)v18)
        {
          uint64_t v19 = v12 + 39;
          do
          {
            int v20 = *v19++;
            snprintf((char *)v14, 0x29uLL, "%s%02x", (const char *)v14, v20);
            --v18;
          }

          while (v18);
          int v12 = *(unsigned __int8 **)(a1 + 1112);
          int v15 = quic_cid_describe_state;
          __int128 v17 = 0uLL;
        }

        if (v15 % 3 == 2) {
          char v21 = &quic_cid_describe_cid_buf2;
        }
        else {
          char v21 = &quic_cid_describe_cid_buf3;
        }
        if (v15 % 3) {
          int v22 = v21;
        }
        else {
          int v22 = &quic_cid_describe_cid_buf1;
        }
        quic_cid_describe_unsigned int state = v15 + 1;
        if (v12[17] >= 0x14u) {
          uint64_t v23 = 20LL;
        }
        else {
          uint64_t v23 = v12[17];
        }
        _OWORD *v22 = v17;
        v22[1] = v17;
        *(_OWORD *)((char *)v22 + 25) = v17;
        if ((_DWORD)v23)
        {
          uint64_t v24 = v12 + 18;
          do
          {
            int v25 = *v24++;
            snprintf((char *)v22, 0x29uLL, "%s%02x", (const char *)v22, v25);
            --v23;
          }

          while (v23);
        }

        *(_DWORD *)uint64_t v11 = 136446978;
        *(void *)(v11 + 4) = "quic_conn_setup_pmtud";
        *(_WORD *)(v11 + 12) = 2082;
        *(void *)(v11 + 14) = v125;
        *(_WORD *)(v11 + 22) = 2082;
        *(void *)(v11 + 24) = v14;
        *(_WORD *)(v11 + 32) = 2082;
        *(void *)(v11 + 34) = v22;
        qlog_internal(16, (uint64_t)v10, 1499LL);
        LODWORD(v14) = 1280;
        BOOL v26 = 1;
        int is_direct = 0;
        LODWORD(v125) = 0;
        uint64_t v4 = v123;
      }

      else
      {
        int is_direct = 0;
        LODWORD(v125) = 0;
        LODWORD(v14) = 1280;
        BOOL v26 = 1;
      }

LABEL_92:
          LODWORD(v124) = v38;
          int v57 = v37 & (v126 ^ 1);
          unsigned __int16 v58 = quic_tp_get(*(_BYTE **)(a1 + 544), 3LL);
          unsigned __int16 v59 = quic_conn_recompute_mss(a1, (_WORD *)v4, (unsigned __int16)v14, v58, v125, is_direct, v26, v57);
          if ((v37 & 1) == 0 && v34 != 3)
          {
            maximum_message_size_t size = nw_protocol_instance_get_maximum_message_size();
            if (maximum_message_size >= 0x4B0u) {
              unsigned __int16 v59 = maximum_message_size <= *(unsigned __int16 *)(v4 + 428)
            }
                  ? maximum_message_size
                  : *(_WORD *)(v4 + 428);
            else {
              unsigned __int16 v59 = 1200;
            }
            if ((qlog_debug_enabled
               || (qlog_nwlog_enabled & 1) != 0
               || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))
              && *(void *)(a1 + 1112))
            {
              LODWORD(v121) = v26;
              int v122 = (int)v14;
              uint64_t v123 = v4;
              uint64_t v61 = _os_log_pack_size();
              uint64_t v120 = &v117;
              uint64_t v62 = MEMORY[0x1895F8858](v61, v61);
              _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
              uint64_t v119 = (uint64_t)&v117 - ((v62 + 15) & 0xFFFFFFFFFFFFFFF0LL);
              uint64_t v63 = _os_log_pack_fill();
              uint64_t v118 = a1 + 976;
              char v64 = *(unsigned __int8 **)(a1 + 1112);
              if (quic_cid_describe_state % 3 == 2) {
                CFTypeID v65 = &quic_cid_describe_cid_buf2;
              }
              else {
                CFTypeID v65 = &quic_cid_describe_cid_buf3;
              }
              if (quic_cid_describe_state % 3) {
                uint64_t v14 = v65;
              }
              else {
                uint64_t v14 = &quic_cid_describe_cid_buf1;
              }
              int v66 = ++quic_cid_describe_state;
              unsigned int v67 = v64[38];
              __int128 v68 = 0uLL;
              *(_OWORD *)((char *)v14 + 25) = 0u;
              if (v67 >= 0x14) {
                uint64_t v69 = 20LL;
              }
              else {
                uint64_t v69 = v67;
              }
              _OWORD *v14 = 0uLL;
              v14[1] = 0uLL;
              if ((_DWORD)v69)
              {
                size_t v70 = v64 + 39;
                do
                {
                  int v71 = *v70++;
                  snprintf((char *)v14, 0x29uLL, "%s%02x", (const char *)v14, v71);
                  --v69;
                }

                while (v69);
                char v64 = *(unsigned __int8 **)(a1 + 1112);
                int v66 = quic_cid_describe_state;
                __int128 v68 = 0uLL;
              }

              if (v66 % 3 == 2) {
                uint64_t v72 = &quic_cid_describe_cid_buf2;
              }
              else {
                uint64_t v72 = &quic_cid_describe_cid_buf3;
              }
              if (v66 % 3) {
                int v73 = v72;
              }
              else {
                int v73 = &quic_cid_describe_cid_buf1;
              }
              quic_cid_describe_unsigned int state = v66 + 1;
              if (v64[17] >= 0x14u) {
                uint64_t v74 = 20LL;
              }
              else {
                uint64_t v74 = v64[17];
              }
              _OWORD *v73 = v68;
              v73[1] = v68;
              *(_OWORD *)((char *)v73 + 25) = v68;
              if ((_DWORD)v74)
              {
                uint64_t v75 = v64 + 18;
                do
                {
                  int v76 = *v75++;
                  snprintf((char *)v73, 0x29uLL, "%s%02x", (const char *)v73, v76);
                  --v74;
                }

                while (v74);
              }

              *(_DWORD *)uint64_t v63 = 136447234;
              *(void *)(v63 + 4) = "quic_conn_setup_pmtud";
              *(_WORD *)(v63 + 12) = 2082;
              *(void *)(v63 + 14) = v118;
              *(_WORD *)(v63 + 22) = 2082;
              *(void *)(v63 + 24) = v14;
              *(_WORD *)(v63 + 32) = 2082;
              *(void *)(v63 + 34) = v73;
              *(_WORD *)(v63 + 42) = 1024;
              *(_DWORD *)(v63 + 44) = v59;
              qlog_internal(1, v119, 1586LL);
              uint64_t v4 = v123;
              LOWORD(v14) = v122;
              LOBYTE(v26) = (_BYTE)v121;
            }
          }

          quic_conn_set_mss(a1, v4, v59);
          if (!v26)
          {
            unsigned __int16 v77 = (unsigned __int16)v14;
            if ((_DWORD)v125) {
              int v78 = 48;
            }
            else {
              int v78 = 28;
            }
            unsigned int v79 = v78 + v58;
            if (v79 >= v77) {
              unsigned int v79 = v77;
            }
            if (v79 >= 0x2400) {
              unsigned __int16 v80 = 9216;
            }
            else {
              unsigned __int16 v80 = v79;
            }
            uint64_t pn = quic_protector_get_pn(*(void *)(a1 + 568), 3u, *(void *)(v4 + 328));
            if ((_DWORD)v126)
            {
              int v82 = *(unsigned __int16 *)(v4 + 426);
              uint64_t v134 = 0LL;
              char v135 = &v134;
              uint64_t v136 = 0x2000000000LL;
              uint64_t v137 = 0LL;
              if ((*(_BYTE *)(v4 + 431) & 1) == 0)
              {
                LODWORD(v125) = v82;
                uint64_t v126 = &v117;
                int v83 = (void *)nw_protocol_instance_copy_interface_for_path();
                v127[0] = MEMORY[0x1895F87A8];
                uint64_t v128 = (uint64_t (*)(void *))__quic_pmtud_create_block_invoke;
                uint64_t v129 = &unk_18A116B18;
                v127[1] = 0x40000000LL;
                uint64_t v132 = a1;
                int v133 = v83;
                int v130 = &v134;
                uint64_t v131 = v4;
                uint64_t v84 = *(void *)(a1 + 1360);
                do
                {
                  if (!v84) {
                    break;
                  }
                  uint64_t v85 = *(void *)(v84 + 312);
                  char v86 = v128(v127);
                  uint64_t v84 = v85;
                }

                while ((v86 & 1) != 0);
                LOWORD(v82) = v125;
                if (v83) {
                  nw_release(v83);
                }
              }

              uint64_t v87 = v135[3];
              if (v87)
              {
                ++*(_WORD *)(v87 + 88);
                BOOL v88 = 1;
              }

              else
              {
                uint64_t v87 = _quic_pmtud_create(a1, v4, v80, (unsigned __int16)(v82 + v78), v78, pn, v37, (int)v124);
                BOOL v88 = v87 == 0;
              }

              _Block_object_dispose(&v134, 8);
              *(void *)(v4 + 400) = v87;
              char v90 = qlog_nwlog_enabled;
              if (qlog_datapath_enabled) {
                int v91 = 1;
              }
              else {
                int v91 = qlog_nwlog_enabled;
              }
              if (v88)
              {
                if (v91)
                {
                  if (qlog_debug_enabled) {
                    char v90 = 1;
                  }
                  if ((v90 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
                  {
                    uint64_t v92 = _os_log_pack_size();
                    uint64_t v93 = (char *)&v117 - ((MEMORY[0x1895F8858](v92, v92) + 15) & 0xFFFFFFFFFFFFFFF0LL);
                    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
                    uint64_t v94 = _os_log_pack_fill();
                    *(_DWORD *)uint64_t v94 = 136446466;
                    *(void *)(v94 + 4) = "quic_conn_setup_pmtud";
                    *(_WORD *)(v94 + 12) = 2048;
                    *(void *)(v94 + 14) = v4;
                    int v95 = 2;
                    uint64_t v96 = (uint64_t)v93;
                    uint64_t v97 = 1617LL;
LABEL_176:
                    qlog_internal(v95, v96, v97);
                    return;
                  }
                }
              }

              else if (v91)
              {
                if (qlog_debug_enabled) {
                  char v90 = 1;
                }
                if ((v90 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
                {
                  uint64_t v114 = _os_log_pack_size();
                  int v115 = (char *)&v117 - ((MEMORY[0x1895F8858](v114, v114) + 15) & 0xFFFFFFFFFFFFFFF0LL);
                  _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
                  uint64_t v116 = _os_log_pack_fill();
                  *(_DWORD *)uint64_t v116 = 136446466;
                  *(void *)(v116 + 4) = "quic_conn_setup_pmtud";
                  *(_WORD *)(v116 + 12) = 2048;
                  *(void *)(v116 + 14) = v4;
                  int v95 = 2;
                  uint64_t v96 = (uint64_t)v115;
                  uint64_t v97 = 1614LL;
                  goto LABEL_176;
                }
              }
            }

            else
            {
              uint64_t v89 = *(void *)(v4 + 400);
              if (v89) {
                quic_pmtud_restart(v89, v80, (unsigned __int16)(*(_WORD *)(v4 + 426) + v78), v78, pn, v37);
              }
            }
          }

          return;
        }

        if (level == 3) {
          int pmtud = nw_quic_connection_get_pmtud();
        }
        else {
          int pmtud = nw_quic_connection_get_pmtud_for_non_transport();
        }
        int v35 = pmtud;
        int pmtud_ignore_cost = nw_quic_connection_get_pmtud_ignore_cost();
      }

      nw_release(v31);
      int v37 = v35;
      LODWORD(v38) = pmtud_ignore_cost;
      goto LABEL_92;
    }

    uint64_t v7 = (nw_path *)v6;
    if (*(void *)(v4 + 8)) {
      int mtu = nw_interface_get_mtu();
    }
    else {
      int mtu = nw_path_get_mtu();
    }
    LODWORD(v14) = mtu;
    int v28 = (unsigned __int16)mtu;
    if ((unsigned __int16)mtu >= 0x2401u)
    {
      if (!qlog_debug_enabled
        && (qlog_nwlog_enabled & 1) == 0
        && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(v14) = 9216;
        goto LABEL_41;
      }

      uint64_t v107 = _os_log_pack_size();
      unint64_t v108 = (char *)&v117 - ((MEMORY[0x1895F8858](v107, v107) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v109 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v109 = 136446466;
      *(void *)(v109 + 4) = "quic_conn_setup_pmtud";
      *(_WORD *)(v109 + 12) = 1024;
      *(_DWORD *)(v109 + 14) = v28;
      qlog_internal(2, (uint64_t)v108, 1510LL);
      int v110 = 9216;
    }

    else
    {
      if ((unsigned __int16)mtu > 0x4FFu)
      {
LABEL_41:
        uint64_t v29 = (nw_endpoint *)nw_path_copy_endpoint();
        if (v29)
        {
          uint64_t v30 = v29;
          LODWORD(v125) = nw_endpoint_get_type(v29) == nw_endpoint_type_address
                       && nw_endpoint_get_address(v30)->sa_family == 30;
          nw_release(v30);
        }

        else
        {
          LODWORD(v125) = 0;
        }

        BOOL v26 = nw_path_uses_interface_type(v7, nw_interface_type_loopback);
        int is_direct = nw_path_is_direct();
        nw_release(v7);
        goto LABEL_49;
      }

      if (!qlog_debug_enabled
        && (qlog_nwlog_enabled & 1) == 0
        && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(v14) = 1280;
        goto LABEL_41;
      }

      uint64_t v111 = _os_log_pack_size();
      int v112 = (char *)&v117 - ((MEMORY[0x1895F8858](v111, v111) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v113 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v113 = 136446466;
      *(void *)(v113 + 4) = "quic_conn_setup_pmtud";
      *(_WORD *)(v113 + 12) = 1024;
      *(_DWORD *)(v113 + 14) = v28;
      qlog_internal(2, (uint64_t)v112, 1515LL);
      int v110 = 1280;
    }

    LODWORD(v14) = v110;
    goto LABEL_41;
  }

  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    uint64_t v98 = _os_log_pack_size();
    int v99 = (char *)&v117 - ((MEMORY[0x1895F8858](v98, v98) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v100 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v100 = 136446210;
    *(void *)(v100 + 4) = "quic_conn_setup_pmtud";
    int v95 = 17;
    uint64_t v96 = (uint64_t)v99;
    uint64_t v97 = 1488LL;
    goto LABEL_176;
  }

void quic_conn_save_token(void *a1, const void *a2, unsigned int a3)
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }

    uint64_t v26 = _os_log_pack_size();
    int v27 = (char *)&v37 - ((MEMORY[0x1895F8858](v26, v26) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v28 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v28 = 136446210;
    *(void *)(v28 + 4) = "quic_conn_save_token";
    uint64_t v29 = (uint64_t)v27;
    uint64_t v30 = 1680LL;
LABEL_51:
    qlog_internal(17, v29, v30);
    return;
  }

  if (!*a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }

    uint64_t v31 = _os_log_pack_size();
    uint64_t v32 = (char *)&v37 - ((MEMORY[0x1895F8858](v31, v31) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v33 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v33 = 136446210;
    *(void *)(v33 + 4) = "quic_conn_save_token";
    uint64_t v29 = (uint64_t)v32;
    uint64_t v30 = 1681LL;
    goto LABEL_51;
  }

  if (!a2)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }

    uint64_t v34 = _os_log_pack_size();
    int v35 = (char *)&v37 - ((MEMORY[0x1895F8858](v34, v34) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v36 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v36 = 136446210;
    *(void *)(v36 + 4) = "quic_conn_save_token";
    uint64_t v29 = (uint64_t)v35;
    uint64_t v30 = 1682LL;
    goto LABEL_51;
  }

  uint64_t v6 = nw_protocol_instance_copy_association();
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    if ((qlog_debug_enabled
       || (qlog_nwlog_enabled & 1) != 0
       || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))
      && a1[139])
    {
      uint64_t v8 = _os_log_pack_size();
      uint64_t v39 = &v37;
      uint64_t v9 = (char *)&v37 - ((MEMORY[0x1895F8858](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v10 = _os_log_pack_fill();
      uint64_t v38 = a1 + 122;
      uint64_t v11 = (unsigned __int8 *)a1[139];
      if (quic_cid_describe_state % 3 == 2) {
        int v12 = &quic_cid_describe_cid_buf2;
      }
      else {
        int v12 = &quic_cid_describe_cid_buf3;
      }
      if (quic_cid_describe_state % 3) {
        uint64_t v13 = v12;
      }
      else {
        uint64_t v13 = &quic_cid_describe_cid_buf1;
      }
      int v14 = ++quic_cid_describe_state;
      unsigned int v15 = v11[38];
      __int128 v16 = 0uLL;
      *(_OWORD *)((char *)v13 + 25) = 0u;
      if (v15 >= 0x14) {
        uint64_t v17 = 20LL;
      }
      else {
        uint64_t v17 = v15;
      }
      *uint64_t v13 = 0uLL;
      v13[1] = 0uLL;
      if ((_DWORD)v17)
      {
        uint64_t v18 = v11 + 39;
        do
        {
          int v19 = *v18++;
          snprintf((char *)v13, 0x29uLL, "%s%02x", (const char *)v13, v19);
          --v17;
        }

        while (v17);
        uint64_t v11 = (unsigned __int8 *)a1[139];
        int v14 = quic_cid_describe_state;
        __int128 v16 = 0uLL;
      }

      if (v14 % 3 == 2) {
        int v20 = &quic_cid_describe_cid_buf2;
      }
      else {
        int v20 = &quic_cid_describe_cid_buf3;
      }
      if (v14 % 3) {
        char v21 = v20;
      }
      else {
        char v21 = &quic_cid_describe_cid_buf1;
      }
      quic_cid_describe_unsigned int state = v14 + 1;
      if (v11[17] >= 0x14u) {
        uint64_t v22 = 20LL;
      }
      else {
        uint64_t v22 = v11[17];
      }
      *char v21 = v16;
      v21[1] = v16;
      *(_OWORD *)((char *)v21 + 25) = v16;
      if ((_DWORD)v22)
      {
        uint64_t v23 = v11 + 18;
        do
        {
          int v24 = *v23++;
          snprintf((char *)v21, 0x29uLL, "%s%02x", (const char *)v21, v24);
          --v22;
        }

        while (v22);
      }

      *(_DWORD *)uint64_t v10 = 136447234;
      *(void *)(v10 + 4) = "quic_conn_save_token";
      *(_WORD *)(v10 + 12) = 2082;
      *(void *)(v10 + 14) = v38;
      *(_WORD *)(v10 + 22) = 2082;
      *(void *)(v10 + 24) = v13;
      *(_WORD *)(v10 + 32) = 2082;
      *(void *)(v10 + 34) = v21;
      *(_WORD *)(v10 + 42) = 1024;
      *(_DWORD *)(v10 + 44) = a3;
      qlog_internal(1, (uint64_t)v9, 1692LL);
    }

    dispatch_data_t v25 = dispatch_data_create(a2, a3, 0LL, 0LL);
    nw_quic_save_token_on_queue();
    if (v25) {
      dispatch_release(v25);
    }
    nw_release(v7);
  }

void quic_conn_set_posix_error(uint64_t a1)
{
  v6[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v2 = *(void **)(a1 + 1104);
    if (v2)
    {
      nw_release(v2);
      *(void *)(a1 + 1104) = 0LL;
    }

    *(void *)(a1 + 1104) = nw_error_create_posix_error();
  }

  else if (qlog_debug_enabled {
         || (qlog_nwlog_enabled & 1) != 0
  }
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    uint64_t v3 = _os_log_pack_size();
    uint64_t v4 = (char *)v6 - ((MEMORY[0x1895F8858](v3, v3) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v5 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v5 = 136446210;
    *(void *)(v5 + 4) = "quic_conn_set_posix_error";
    qlog_internal(17, (uint64_t)v4, 1734LL);
  }

void quic_conn_handle_outbound(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }

    uint64_t v14 = _os_log_pack_size();
    unsigned int v15 = (char *)v29 - ((MEMORY[0x1895F8858](v14, v14) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136446210;
    *(void *)(v16 + 4) = "quic_conn_handle_outbound";
    uint64_t v17 = (uint64_t)v15;
    uint64_t v18 = 2547LL;
LABEL_23:
    qlog_internal(17, v17, v18);
    return;
  }

  if (*MEMORY[0x189608EC8] == a2)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }

    uint64_t v19 = _os_log_pack_size();
    int v20 = (char *)v29 - ((MEMORY[0x1895F8858](v19, v19) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v21 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v21 = 136446210;
    *(void *)(v21 + 4) = "quic_conn_handle_outbound";
    uint64_t v17 = (uint64_t)v20;
    uint64_t v18 = 2548LL;
    goto LABEL_23;
  }

  char v8 = qlog_nwlog_enabled;
  if (a3)
  {
    if (qlog_datapath_enabled) {
      int v13 = 1;
    }
    else {
      int v13 = qlog_nwlog_enabled;
    }
    if (v13 == 1)
    {
      if (qlog_debug_enabled) {
        char v8 = 1;
      }
      if ((v8 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v25 = _os_log_pack_size();
        uint64_t v26 = (char *)v29 - ((MEMORY[0x1895F8858](v25, v25) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v27 = _os_log_pack_fill();
        uint64_t size = nw_protocol_data_get_size();
        *(_DWORD *)uint64_t v27 = 136447234;
        *(void *)(v27 + 4) = "quic_conn_handle_outbound";
        *(_WORD *)(v27 + 12) = 2048;
        *(void *)(v27 + 14) = a2;
        *(_WORD *)(v27 + 22) = 2048;
        *(void *)(v27 + 24) = size;
        *(_WORD *)(v27 + 32) = 1024;
        *(_DWORD *)(v27 + 34) = a5;
        *(_WORD *)(v27 + 38) = 1024;
        *(_DWORD *)(v27 + 40) = a6;
        qlog_internal(2, (uint64_t)v26, 2555LL);
      }
    }

    v29[0] = MEMORY[0x1895F87A8];
    v29[1] = 0x40000000LL;
    v29[2] = __quic_conn_handle_outbound_block_invoke;
    v29[3] = &__block_descriptor_tmp_100;
    void v29[4] = a1;
    v29[5] = a2;
    v29[6] = a3;
    v29[7] = a4;
    char v30 = a5;
    char v31 = a6;
    nw_protocol_instance_access_state();
    return;
  }

  if (qlog_debug_enabled) {
    char v8 = 1;
  }
  if ((v8 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    uint64_t v22 = _os_log_pack_size();
    uint64_t v23 = (char *)v29 - ((MEMORY[0x1895F8858](v22, v22) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v24 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v24 = 136446210;
    *(void *)(v24 + 4) = "quic_conn_handle_outbound";
    uint64_t v17 = (uint64_t)v23;
    uint64_t v18 = 2549LL;
    goto LABEL_23;
  }

uint64_t __quic_conn_handle_outbound_block_invoke()
{
  return 1LL;
}

uint64_t __quic_conn_handle_outbound_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return 1LL;
}

void quic_conn_handle_outbound_inner( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, int a7)
{
  uint64_t v60 = *MEMORY[0x1895F89C0];
  if (__quic_signpost_is_enabled__quic_signposts_once_3883[0] != -1) {
    dispatch_once(__quic_signpost_is_enabled__quic_signposts_once_3883, &__block_literal_global_192);
  }
  if (__quic_signpost_is_enabled__quic_signposts_enabled_3884 && kdebug_is_enabled())
  {
    kdebug_trace();
    int v14 = a7;
    if (!a5) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

  int v14 = a7;
  if (a5) {
LABEL_6:
  }
    int v14 = nw_protocol_metadata_is_quic_connection() & a6 | a7;
LABEL_7:
  if ((*(_BYTE *)(a2 + 353) & 0x10) == 0)
  {
    uint64_t v15 = *(void *)a2;
    if ((*(void *)a2 & 2) == 0)
    {
      if ((*(_BYTE *)(a1 + 1380) & 1) != 0)
      {
        if ((v15 & 1) == 0) {
          goto LABEL_21;
        }
      }

      else if ((v15 & 1) != 0)
      {
        goto LABEL_21;
      }

      if (a5 && *(_BYTE *)(a2 + 250) == 1 && nw_protocol_metadata_supports_replies())
      {
        quic_stream_reset_metadata_handlers(*(void *)(a2 + 16));
        uint64_t v16 = *(void **)(a2 + 16);
        if (v16)
        {
          nw_release(v16);
          *(void *)(a2 + 16) = 0LL;
        }

        uint64_t reply = nw_protocol_metadata_create_reply();
        *(void *)(a2 + 16) = reply;
        char v18 = qlog_nwlog_enabled;
        if (qlog_datapath_enabled || qlog_nwlog_enabled)
        {
          if (qlog_debug_enabled) {
            char v18 = 1;
          }
          if ((v18 & 1) != 0
            || (uint64_t v53 = (uint64_t *)reply,
                BOOL v46 = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG),
                uint64_t reply = (uint64_t)v53,
                v46))
          {
            uint64_t v47 = _os_log_pack_size();
            uint64_t v53 = &v51;
            uint64_t v52 = (uint64_t)&v51 - ((MEMORY[0x1895F8858](v47, v47) + 15) & 0xFFFFFFFFFFFFFFF0LL);
            _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
            uint64_t v48 = _os_log_pack_fill();
            uint64_t v49 = *(void *)a2;
            uint64_t v50 = *(void *)(a2 + 16);
            *(_DWORD *)uint64_t v48 = 136446978;
            *(void *)(v48 + 4) = "quic_conn_handle_outbound_inner";
            *(_WORD *)(v48 + 12) = 2048;
            *(void *)(v48 + 14) = v49;
            *(_WORD *)(v48 + 22) = 2048;
            *(void *)(v48 + 24) = v50;
            *(_WORD *)(v48 + 32) = 2048;
            *(void *)(v48 + 34) = a5;
            qlog_internal(2, v52, 2516LL);
            uint64_t reply = *(void *)(a2 + 16);
          }
        }

        quic_stream_setup_metadata_handlers(a1, a2, reply);
      }
    }
  }

void quic_conn_process_outbound(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, int a6)
{
  uint64_t v54 = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }

    uint64_t v39 = _os_log_pack_size();
    uint64_t v40 = (char *)&v51 - ((MEMORY[0x1895F8858](v39, v39) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v41 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v41 = 136446210;
    *(void *)(v41 + 4) = "quic_conn_process_outbound";
    uint64_t v32 = (uint64_t)v40;
    uint64_t v33 = 2441LL;
LABEL_46:
    qlog_internal(17, v32, v33);
    return;
  }

  if (*MEMORY[0x189608EC8] == a2)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }

    uint64_t v42 = _os_log_pack_size();
    uint64_t v43 = (char *)&v51 - ((MEMORY[0x1895F8858](v42, v42) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v44 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v44 = 136446210;
    *(void *)(v44 + 4) = "quic_conn_process_outbound";
    uint64_t v32 = (uint64_t)v43;
    uint64_t v33 = 2442LL;
    goto LABEL_46;
  }

  if (!a3)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }

    uint64_t v45 = _os_log_pack_size();
    BOOL v46 = (char *)&v51 - ((MEMORY[0x1895F8858](v45, v45) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v47 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v47 = 136446210;
    *(void *)(v47 + 4) = "quic_conn_process_outbound";
    uint64_t v32 = (uint64_t)v46;
    uint64_t v33 = 2443LL;
    goto LABEL_46;
  }

  if (!a4)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }

    uint64_t v48 = _os_log_pack_size();
    uint64_t v49 = (char *)&v51 - ((MEMORY[0x1895F8858](v48, v48) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v50 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v50 = 136446210;
    *(void *)(v50 + 4) = "quic_conn_process_outbound";
    uint64_t v32 = (uint64_t)v49;
    uint64_t v33 = 2444LL;
    goto LABEL_46;
  }

  if ((*(_BYTE *)(a1 + 1380) & 1) == 0 && *(_BYTE *)(a1 + 477) == 1) {
    quic_fsm_conn_change(a1, 6u);
  }
  if ((unint64_t)nw_protocol_data_get_size() >> 32)
  {
    if ((qlog_debug_enabled
       || (qlog_nwlog_enabled & 1) != 0
       || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
      && *(void *)(a1 + 1112))
    {
      uint64_t v12 = _os_log_pack_size();
      uint64_t v53 = &v51;
      int v13 = (char *)&v51 - ((MEMORY[0x1895F8858](v12, v12) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v14 = _os_log_pack_fill();
      uint64_t v52 = a1 + 976;
      uint64_t v15 = *(unsigned __int8 **)(a1 + 1112);
      if (quic_cid_describe_state % 3 == 2) {
        uint64_t v16 = &quic_cid_describe_cid_buf2;
      }
      else {
        uint64_t v16 = &quic_cid_describe_cid_buf3;
      }
      if (quic_cid_describe_state % 3) {
        uint64_t v17 = v16;
      }
      else {
        uint64_t v17 = &quic_cid_describe_cid_buf1;
      }
      int v18 = ++quic_cid_describe_state;
      unsigned int v19 = v15[38];
      __int128 v20 = 0uLL;
      *(_OWORD *)((char *)v17 + 25) = 0u;
      if (v19 >= 0x14) {
        uint64_t v21 = 20LL;
      }
      else {
        uint64_t v21 = v19;
      }
      *uint64_t v17 = 0uLL;
      v17[1] = 0uLL;
      if ((_DWORD)v21)
      {
        int v22 = v15 + 39;
        do
        {
          int v23 = *v22++;
          snprintf((char *)v17, 0x29uLL, "%s%02x", (const char *)v17, v23);
          --v21;
        }

        while (v21);
        uint64_t v15 = *(unsigned __int8 **)(a1 + 1112);
        int v18 = quic_cid_describe_state;
        __int128 v20 = 0uLL;
      }

      if (v18 % 3 == 2) {
        uint64_t v24 = &quic_cid_describe_cid_buf2;
      }
      else {
        uint64_t v24 = &quic_cid_describe_cid_buf3;
      }
      if (v18 % 3) {
        uint64_t v25 = v24;
      }
      else {
        uint64_t v25 = &quic_cid_describe_cid_buf1;
      }
      quic_cid_describe_unsigned int state = v18 + 1;
      if (v15[17] >= 0x14u) {
        uint64_t v26 = 20LL;
      }
      else {
        uint64_t v26 = v15[17];
      }
      *uint64_t v25 = v20;
      v25[1] = v20;
      *(_OWORD *)((char *)v25 + 25) = v20;
      if ((_DWORD)v26)
      {
        uint64_t v27 = v15 + 18;
        do
        {
          int v28 = *v27++;
          snprintf((char *)v25, 0x29uLL, "%s%02x", (const char *)v25, v28);
          --v26;
        }

        while (v26);
      }

      *(_DWORD *)uint64_t v14 = 136446978;
      *(void *)(v14 + 4) = "quic_conn_process_outbound";
      *(_WORD *)(v14 + 12) = 2082;
      *(void *)(v14 + 14) = v52;
      *(_WORD *)(v14 + 22) = 2082;
      *(void *)(v14 + 24) = v17;
      *(_WORD *)(v14 + 32) = 2082;
      *(void *)(v14 + 34) = v25;
      qlog_internal(16, (uint64_t)v13, 2452LL);
    }

    return;
  }

  if (*(void *)a3 == -1LL)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }

    uint64_t v29 = _os_log_pack_size();
    unsigned int v30 = (char *)&v51 - ((MEMORY[0x1895F8858](v29, v29) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v31 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v31 = 136446210;
    *(void *)(v31 + 4) = "quic_conn_process_outbound";
    uint64_t v32 = (uint64_t)v30;
    uint64_t v33 = 2456LL;
    goto LABEL_46;
  }

  if ((*(_BYTE *)(a3 + 353) & 0x10) != 0)
  {
    if (*(unsigned __int16 *)(a3 + 248) >= a5)
    {
      quic_frame_alloc_DATAGRAM( *(void *)(a1 + 560),  (unsigned __int16)a5,  *(void *)a3,  (*(void *)(a1 + 1380) >> 30) & 1,  *(void *)(a3 + 240),  a4,  0);
      uint64_t path = quic_conn_select_next_path((void *)a1, (uint64_t)&__block_literal_global_98);
      quic_conn_send_internal(a1, path, 0LL);
    }

    else if (qlog_debug_enabled {
           || (qlog_nwlog_enabled & 1) != 0
    }
           || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v34 = _os_log_pack_size();
      int v35 = (char *)&v51 - ((MEMORY[0x1895F8858](v34, v34) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v36 = _os_log_pack_fill();
      int v37 = *(unsigned __int16 *)(a3 + 248);
      *(_DWORD *)uint64_t v36 = 136446722;
      *(void *)(v36 + 4) = "quic_conn_process_outbound";
      *(_WORD *)(v36 + 12) = 2048;
      *(void *)(v36 + 14) = a5;
      *(_WORD *)(v36 + 22) = 1024;
      *(_DWORD *)(v36 + 24) = v37;
      qlog_internal(2, (uint64_t)v35, 2465LL);
    }
  }

  else
  {
    quic_add_stream_data(a1, a2, a3, a4, a5, a6);
  }

BOOL __quic_conn_handle_stop_block_invoke(uint64_t a1, uint64_t a2)
{
  return quic_conn_handle_stop_inner(a2, *(void *)(a1 + 32), *(_DWORD *)(a1 + 40));
}

BOOL quic_conn_handle_stop_inner(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v54 = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return 0LL;
    }

    uint64_t v39 = _os_log_pack_size();
    uint64_t v40 = (char *)v47 - ((MEMORY[0x1895F8858](v39, v39) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v41 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v41 = 136446210;
    *(void *)(v41 + 4) = "quic_conn_handle_stop_inner";
    uint64_t v42 = (uint64_t)v40;
    uint64_t v43 = 4010LL;
    goto LABEL_71;
  }

  if (*MEMORY[0x189608EC8] == a2)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return 0LL;
    }

    uint64_t v44 = _os_log_pack_size();
    uint64_t v45 = (char *)v47 - ((MEMORY[0x1895F8858](v44, v44) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v46 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v46 = 136446210;
    *(void *)(v46 + 4) = "quic_conn_handle_stop_inner";
    uint64_t v42 = (uint64_t)v45;
    uint64_t v43 = 4011LL;
LABEL_71:
    qlog_internal(17, v42, v43);
    return 0LL;
  }

  BOOL v7 = *MEMORY[0x189608EB8] == a2 || *MEMORY[0x189608ED0] == a2;
  if (v7)
  {
    if ((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = _os_log_pack_size();
      uint64_t v9 = (char *)v47 - ((MEMORY[0x1895F8858](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v10 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v10 = 136446466;
      *(void *)(v10 + 4) = "quic_conn_handle_stop_inner";
      *(_WORD *)(v10 + 12) = 1024;
      *(_DWORD *)(v10 + 14) = a3;
      uint64_t v11 = (uint64_t)v9;
      uint64_t v12 = 4014LL;
LABEL_16:
      qlog_internal(2, v11, v12);
    }
  }

  else if ((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1 {
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
  }
  {
    uint64_t v13 = _os_log_pack_size();
    uint64_t v14 = (char *)v47 - ((MEMORY[0x1895F8858](v13, v13) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v15 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v15 = 136446722;
    *(void *)(v15 + 4) = "quic_conn_handle_stop_inner";
    *(_WORD *)(v15 + 12) = 2048;
    *(void *)(v15 + 14) = a2;
    *(_WORD *)(v15 + 22) = 1024;
    *(_DWORD *)(v15 + 24) = a3;
    uint64_t v11 = (uint64_t)v14;
    uint64_t v12 = 4017LL;
    goto LABEL_16;
  }

  uint64_t stats_region = nw_protocol_instance_get_stats_region();
  uint64_t v17 = &g_quic_stats;
  if (stats_region) {
    uint64_t v17 = (void *)stats_region;
  }
  *(void *)(a1 + 1312) = v17;
  uint64_t stats = nw_protocol_instance_get_stats();
  *(void *)(a1 + 1304) = stats;
  if (stats)
  {
    *(void *)(stats + 16) = *(void *)(a1 + 1144);
    uint64_t v19 = *(void *)(a1 + 1304);
    if (v19)
    {
      *(void *)(v19 + 24) = *(void *)(a1 + 1152);
      uint64_t v20 = *(void *)(a1 + 1304);
      if (v20)
      {
        *(void *)(v20 + 32) = *(void *)(a1 + 1160);
        uint64_t v21 = *(void *)(a1 + 1304);
        if (v21)
        {
          *(void *)(v21 + 40) = *(void *)(a1 + 1168);
          uint64_t v22 = *(void *)(a1 + 1304);
          if (v22)
          {
            *(_DWORD *)(v22 + 48) = *(_DWORD *)(a1 + 1176);
            uint64_t v23 = *(void *)(a1 + 1304);
            if (v23)
            {
              *(_DWORD *)(v23 + 52) = *(_DWORD *)(a1 + 1180);
              uint64_t v24 = *(void *)(a1 + 1304);
              if (v24)
              {
                *(_DWORD *)(v24 + 56) = *(_DWORD *)(a1 + 1188);
                uint64_t v25 = *(void *)(a1 + 1304);
                if (v25)
                {
                  *(_DWORD *)(v25 + 60) = *(_DWORD *)(a1 + 1192);
                  uint64_t v26 = *(void *)(a1 + 1304);
                  if (v26)
                  {
                    *(_DWORD *)(v26 + 60) = *(unsigned __int8 *)(a1 + 477) == 9;
                    uint64_t v27 = *(void *)(a1 + 1304);
                    if (v27) {
                      *(_DWORD *)(v27 + 124) = *(unsigned __int8 *)(a1 + 477);
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

  uint64_t v28 = *(void *)(a1 + 1112);
  if (v28 && quic_rtt_has_initial_measurement(*(void *)(v28 + 272)))
  {
    uint64_t v29 = *(void *)(a1 + 1304);
    if (!v29) {
      goto LABEL_38;
    }
    *(_DWORD *)(*(void *)(a1 + 1304) + 68LL) = (unint64_t)((4
                                                                   * (quic_rtt_get_min_rtt(*(void *)(*(void *)(a1 + 1112) + 272LL)) & 0x7FFFFFFFFFFFFFFuLL)
                                                                   * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4;
    uint64_t v29 = *(void *)(a1 + 1304);
    if (!v29) {
      goto LABEL_38;
    }
    *(_DWORD *)(*(void *)(a1 + 1304) + 72LL) = (unint64_t)((4
                                                                   * (quic_rtt_get_smoothed_rtt(*(void *)(*(void *)(a1 + 1112) + 272LL)) & 0x7FFFFFFFFFFFFFFuLL)
                                                                   * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4;
    uint64_t v29 = *(void *)(a1 + 1304);
    if (!v29) {
      goto LABEL_38;
    }
    *(_DWORD *)(*(void *)(a1 + 1304) + 76LL) = (unint64_t)((2
                                                                   * (quic_rtt_get_rtt_variance(*(void *)(*(void *)(a1 + 1112) + 272LL)) & 0xFFFFFFFFFFFFFFFuLL)
                                                                   * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4;
  }

  uint64_t v29 = *(void *)(a1 + 1304);
  if (v29)
  {
    *(_OWORD *)(v29 + 128) = *(_OWORD *)(a1 + 1288);
    uint64_t v29 = *(void *)(a1 + 1304);
  }

void quic_conn_handle_stop_read(uint64_t a1, uint64_t a2)
{
  v5[5] = *MEMORY[0x1895F89C0];
  if (*MEMORY[0x189608EC8] == a2)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      uint64_t v2 = _os_log_pack_size();
      uint64_t v3 = (char *)v5 - ((MEMORY[0x1895F8858](v2, v2) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v4 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v4 = 136446210;
      *(void *)(v4 + 4) = "quic_conn_handle_stop_read";
      qlog_internal(17, (uint64_t)v3, 3973LL);
    }
  }

  else
  {
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 0x40000000LL;
    void v5[2] = __quic_conn_handle_stop_read_block_invoke;
    v5[3] = &__block_descriptor_tmp_228;
    v5[4] = a1;
    nw_protocol_instance_access_flow_state();
  }

uint64_t quic_conn_handle_stop_write(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (*MEMORY[0x189608EC8] == a2)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      uint64_t v4 = _os_log_pack_size();
      uint64_t v5 = (char *)v7 - ((MEMORY[0x1895F8858](v4, v4) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v6 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v6 = 136446210;
      *(void *)(v6 + 4) = "quic_conn_handle_stop_write";
      qlog_internal(17, (uint64_t)v5, 3922LL);
      return 1LL;
    }

    else
    {
      return 1LL;
    }
  }

  else
  {
    uint64_t v8 = 0LL;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x2000000000LL;
    char v11 = 1;
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 0x40000000LL;
    void v7[2] = __quic_conn_handle_stop_write_block_invoke;
    v7[3] = &unk_18A1183A8;
    v7[5] = a1;
    v7[6] = a2;
    v7[4] = &v8;
    nw_protocol_instance_access_flow_state();
    BOOL v2 = *((_BYTE *)v9 + 24) != 0;
    _Block_object_dispose(&v8, 8);
  }

  return v2;
}

uint64_t __quic_conn_handle_stop_inner_block_invoke(uint64_t a1, uint64_t *a2)
{
  v13[1] = *MEMORY[0x1895F89C0];
  if (*a2 == -1) {
    return 1LL;
  }
  int v3 = *(_DWORD *)(a1 + 48);
  switch(v3)
  {
    case 1:
      unsigned int v5 = *((_DWORD *)a2 + 88);
      *((_DWORD *)a2 + 88) = v5 | 0x100;
      int v4 = (v5 >> 7) & 1;
      break;
    case 2:
      unsigned int v6 = *((_DWORD *)a2 + 88);
      *((_DWORD *)a2 + 88) = v6 & 0xFFFFFF7F | (*(unsigned __int8 *)(a1 + 52) << 7);
      int v4 = (v6 >> 8) & 1;
      if (!*(_BYTE *)(a1 + 52)) {
        LOBYTE(v4) = 0;
      }
      break;
    case 3:
      int v4 = *((_DWORD *)a2 + 88) | 0x100;
      *((_DWORD *)a2 + 88) = v4;
      *((_DWORD *)a2 + 88) = v4 & 0xFFFFFF7F | (*(unsigned __int8 *)(a1 + 52) << 7);
      LOBYTE(v4) = *(_BYTE *)(a1 + 52);
      break;
    default:
      goto LABEL_10;
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v4;
LABEL_10:
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    char v7 = qlog_nwlog_enabled;
    if (qlog_datapath_enabled || qlog_nwlog_enabled)
    {
      if (qlog_debug_enabled) {
        char v7 = 1;
      }
      if ((v7 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v9 = _os_log_pack_size();
        uint64_t v10 = (char *)v13 - ((MEMORY[0x1895F8858](v9, v9) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v11 = _os_log_pack_fill();
        uint64_t v12 = *a2;
        *(_DWORD *)uint64_t v11 = 136446466;
        *(void *)(v11 + 4) = "quic_conn_handle_stop_inner_block_invoke";
        *(_WORD *)(v11 + 12) = 2048;
        *(void *)(v11 + 14) = v12;
        qlog_internal(2, (uint64_t)v10, 4068LL);
      }
    }

    nw_protocol_instance_clear_flow_for_key();
    *((_DWORD *)a2 + 88) |= 0x40u;
  }

  return 1LL;
}

uint64_t __quic_conn_handle_stop_write_block_invoke(void *a1, uint64_t a2)
{
  v14[5] = *MEMORY[0x1895F89C0];
  int v2 = *(_DWORD *)(a2 + 352);
  if ((v2 & 0x1000) != 0) {
    return 1LL;
  }
  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = _os_log_pack_size();
    unsigned int v6 = (char *)v14 - ((MEMORY[0x1895F8858](v5, v5) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v7 = _os_log_pack_fill();
    uint64_t v8 = *(void *)a2;
    *(_DWORD *)uint64_t v7 = 136446466;
    *(void *)(v7 + 4) = "quic_conn_handle_stop_write_block_invoke";
    *(_WORD *)(v7 + 12) = 2048;
    *(void *)(v7 + 14) = v8;
    qlog_internal(2, (uint64_t)v6, 3934LL);
    int v2 = *(_DWORD *)(a2 + 352);
  }

  if ((v2 & 0x20) != 0) {
    quic_stream_unmark_pending(a1[5], (uint64_t *)a2);
  }
  int v9 = *(unsigned __int8 *)(a2 + 250);
  if (v9 == 1)
  {
LABEL_12:
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 0x40000000LL;
    void v14[2] = __quic_stream_empty_pending_data_block_invoke;
    v14[3] = &__block_descriptor_tmp_5_3441;
    v14[4] = a2;
    nw_frame_array_foreach();
    quic_stream_send_reset_stream(a2, a1[5]);
    *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) = 0;
    goto LABEL_14;
  }

  if (v9 != 2) {
    goto LABEL_14;
  }
  if (*(void *)(a2 + 232))
  {
    if ((*(_BYTE *)(a2 + 352) & 8) != 0) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }

  quic_send_stream_fin((void *)a1[5], a1[6], a2);
LABEL_14:
  if ((nw_frame_array_is_empty() & 1) == 0)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = _os_log_pack_size();
      uint64_t v11 = (char *)v14 - ((MEMORY[0x1895F8858](v10, v10) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v12 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v12 = 136446210;
      *(void *)(v12 + 4) = "quic_conn_handle_stop_write_block_invoke";
      qlog_internal(2, (uint64_t)v11, 3958LL);
    }

    *(_DWORD *)(a2 + 352) |= 4u;
    *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) = 0;
  }

  return 1LL;
}

uint64_t __quic_conn_handle_stop_read_block_invoke(uint64_t a1, uint64_t a2)
{
  v12[1] = *MEMORY[0x1895F89C0];
  int v2 = *(_DWORD *)(a2 + 352);
  if ((v2 & 0x1000) == 0)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = _os_log_pack_size();
      unsigned int v6 = (char *)v12 - ((MEMORY[0x1895F8858](v5, v5) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v7 = _os_log_pack_fill();
      uint64_t v8 = *(void *)a2;
      *(_DWORD *)uint64_t v7 = 136446466;
      *(void *)(v7 + 4) = "quic_conn_handle_stop_read_block_invoke";
      *(_WORD *)(v7 + 12) = 2048;
      *(void *)(v7 + 14) = v8;
      qlog_internal(2, (uint64_t)v6, 3983LL);
      int v2 = *(_DWORD *)(a2 + 352);
    }

    if ((v2 & 0x20) != 0) {
      quic_stream_unmark_pending(*(void *)(a1 + 32), (uint64_t *)a2);
    }
    if (*(_BYTE *)(a2 + 251) == 1)
    {
      quic_stream_send_stop_sending((unint64_t *)a2, *(void *)(a1 + 32));
      *(_DWORD *)(a2 + 352) |= 0x10u;
      uint64_t offset = quic_reassq_last_offset(*(void *)(a2 + 256));
      if (offset) {
        uint64_t v10 = offset + 1;
      }
      else {
        uint64_t v10 = 0LL;
      }
      quic_stream_zombie_create(*(void **)(a1 + 32), *(void *)a2, v10, *(void *)(a2 + 48));
    }
  }

  return 1LL;
}

void quic_conn_outbound_stopping(uint64_t a1, uint64_t a2)
{
  v17[7] = *MEMORY[0x1895F89C0];
  char v2 = qlog_nwlog_enabled;
  if (a1)
  {
    if (*MEMORY[0x189608EC8] != a2)
    {
      if (qlog_datapath_enabled) {
        int v5 = 1;
      }
      else {
        int v5 = qlog_nwlog_enabled;
      }
      if (v5 == 1)
      {
        if (qlog_debug_enabled) {
          char v2 = 1;
        }
        if ((v2 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v14 = _os_log_pack_size();
          uint64_t v15 = (char *)v17 - ((MEMORY[0x1895F8858](v14, v14) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          uint64_t v16 = _os_log_pack_fill();
          *(_DWORD *)uint64_t v16 = 136446466;
          *(void *)(v16 + 4) = "quic_conn_outbound_stopping";
          *(_WORD *)(v16 + 12) = 2048;
          *(void *)(v16 + 14) = a2;
          qlog_internal(2, (uint64_t)v15, 2580LL);
        }
      }

      v17[1] = MEMORY[0x1895F87A8];
      void v17[2] = 0x40000000LL;
      v17[3] = __quic_conn_outbound_stopping_block_invoke;
      v17[4] = &__block_descriptor_tmp_102;
      v17[5] = a1;
      v17[6] = a2;
      nw_protocol_instance_access_state();
      return;
    }

    if (qlog_debug_enabled) {
      char v2 = 1;
    }
    if ((v2 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      uint64_t v11 = _os_log_pack_size();
      uint64_t v12 = (char *)v17 - ((MEMORY[0x1895F8858](v11, v11) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v13 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v13 = 136446210;
      *(void *)(v13 + 4) = "quic_conn_outbound_stopping";
      uint64_t v9 = (uint64_t)v12;
      uint64_t v10 = 2578LL;
      goto LABEL_19;
    }
  }

  else
  {
    if (qlog_debug_enabled) {
      char v2 = 1;
    }
    if ((v2 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      uint64_t v6 = _os_log_pack_size();
      uint64_t v7 = (char *)v17 - ((MEMORY[0x1895F8858](v6, v6) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v8 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v8 = 136446210;
      *(void *)(v8 + 4) = "quic_conn_outbound_stopping";
      uint64_t v9 = (uint64_t)v7;
      uint64_t v10 = 2577LL;
LABEL_19:
      qlog_internal(17, v9, v10);
    }
  }

uint64_t __quic_conn_outbound_stopping_block_invoke()
{
  return 1LL;
}

uint64_t __quic_conn_outbound_stopping_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return 1LL;
}

void quic_conn_outbound_data_pending(uint64_t a1, int a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  char v2 = qlog_nwlog_enabled;
  if (a1)
  {
    if (qlog_datapath_enabled) {
      int v4 = 1;
    }
    else {
      int v4 = qlog_nwlog_enabled;
    }
    if (v4 == 1)
    {
      if (qlog_debug_enabled) {
        char v2 = 1;
      }
      if ((v2 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v8 = _os_log_pack_size();
        uint64_t v9 = (char *)v11 - ((MEMORY[0x1895F8858](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v10 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v10 = 136446466;
        *(void *)(v10 + 4) = "quic_conn_outbound_data_pending";
        *(_WORD *)(v10 + 12) = 1024;
        *(_DWORD *)(v10 + 14) = a2;
        qlog_internal(2, (uint64_t)v9, 2602LL);
      }
    }

    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 0x40000000LL;
    void v11[2] = __quic_conn_outbound_data_pending_block_invoke;
    v11[3] = &__block_descriptor_tmp_103;
    char v12 = a2;
    nw_protocol_instance_access_state();
  }

  else
  {
    if (qlog_debug_enabled) {
      char v2 = 1;
    }
    if ((v2 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      uint64_t v5 = _os_log_pack_size();
      uint64_t v6 = (char *)v11 - ((MEMORY[0x1895F8858](v5, v5) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v7 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v7 = 136446210;
      *(void *)(v7 + 4) = "quic_conn_outbound_data_pending";
      qlog_internal(17, (uint64_t)v6, 2599LL);
    }
  }

uint64_t __quic_conn_outbound_data_pending_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)((char *)a2 + 1380);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 32);
  if (((v2 >> 8) & 1) != (_DWORD)v3)
  {
    *(void *)((char *)a2 + 1380) = v2 & 0xFFFFFFFFFFFFFEFFLL | (v3 << 8);
    if (!*(_BYTE *)(a1 + 32))
    {
      uint64_t path = quic_conn_select_next_path(a2, (uint64_t)&__block_literal_global_98);
      quic_conn_send_internal((uint64_t)a2, path, 0LL);
    }
  }

  return 1LL;
}

void quic_conn_inbound_starting(uint64_t a1)
{
  v4[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    nw_protocol_instance_access_state();
  }

  else if (qlog_debug_enabled {
         || (qlog_nwlog_enabled & 1) != 0
  }
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    uint64_t v1 = _os_log_pack_size();
    uint64_t v2 = (char *)v4 - ((MEMORY[0x1895F8858](v1, v1) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v3 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v3 = 136446210;
    *(void *)(v3 + 4) = "quic_conn_inbound_starting";
    qlog_internal(17, (uint64_t)v2, 2869LL);
  }

uint64_t __quic_conn_inbound_starting_block_invoke(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x1895F89C0];
  if (__quic_signpost_is_enabled__quic_signposts_once_3883[0] != -1) {
    dispatch_once(__quic_signpost_is_enabled__quic_signposts_once_3883, &__block_literal_global_192);
  }
  *(void *)((char *)a2 + 1380) &= ~0x1000000uLL;
  if (a2[168]
    && (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0
                           || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT)))
  {
    uint64_t v4 = _os_log_pack_size();
    uint64_t v5 = (char *)v10 - ((MEMORY[0x1895F8858](v4, v4) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v6 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v6 = 136446210;
    *(void *)(v6 + 4) = "quic_conn_inbound_starting_block_invoke";
    qlog_internal(17, (uint64_t)v5, 2878LL);
  }

  if (a2[166]
    && (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0
                           || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT)))
  {
    uint64_t v7 = _os_log_pack_size();
    uint64_t v8 = (char *)v10 - ((MEMORY[0x1895F8858](v7, v7) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v9 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v9 = 136446210;
    *(void *)(v9 + 4) = "quic_conn_inbound_starting_block_invoke";
    qlog_internal(17, (uint64_t)v8, 2881LL);
  }

  return 1LL;
}

void quic_conn_process_inbound( uint64_t a1, uint64_t a2, uint64_t a3, char *a4, unint64_t a5, int a6, __n128 a7)
{
  int v139 = a6;
  uint64_t v145 = a3;
  v147[30] = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }

    uint64_t v111 = _os_log_pack_size();
    int v112 = (char *)&v130 - ((MEMORY[0x1895F8858](v111, v111) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v113 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v113 = 136446210;
    *(void *)(v113 + 4) = "quic_conn_process_inbound";
    int v15 = 17;
    uint64_t v16 = (uint64_t)v112;
    uint64_t v17 = 3319LL;
LABEL_11:
    qlog_internal(v15, v16, v17);
    return;
  }

  uint64_t v7 = a4;
  if (!a4)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }

    uint64_t v114 = _os_log_pack_size();
    int v115 = (char *)&v130 - ((MEMORY[0x1895F8858](v114, v114) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v116 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v116 = 136446210;
    *(void *)(v116 + 4) = "quic_conn_process_inbound";
    int v15 = 17;
    uint64_t v16 = (uint64_t)v115;
    uint64_t v17 = 3320LL;
    goto LABEL_11;
  }

  uint64_t v8 = (_OWORD *)a5;
  if (!a5)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }

    uint64_t v117 = _os_log_pack_size();
    uint64_t v118 = (char *)&v130 - ((MEMORY[0x1895F8858](v117, v117) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v119 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v119 = 136446210;
    *(void *)(v119 + 4) = "quic_conn_process_inbound";
    int v15 = 17;
    uint64_t v16 = (uint64_t)v118;
    uint64_t v17 = 3321LL;
    goto LABEL_11;
  }

  uint64_t v9 = a2;
  uint64_t v11 = *(void *)(a1 + 1312);
  if (v11) {
    *(void *)(v11 + 192) += a5;
  }
  if (*(_BYTE *)(a1 + 477) == 11)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
    {
      return;
    }

    uint64_t v12 = _os_log_pack_size();
    uint64_t v13 = (char *)&v130 - ((MEMORY[0x1895F8858](v12, v12) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 136446466;
    *(void *)(v14 + 4) = "quic_conn_process_inbound";
    *(_WORD *)(v14 + 12) = 2048;
    *(void *)(v14 + 14) = v8;
    int v15 = 2;
    uint64_t v16 = (uint64_t)v13;
    uint64_t v17 = 3329LL;
    goto LABEL_11;
  }

  if (a5 >= 0x10000)
  {
    if ((qlog_debug_enabled
       || (qlog_nwlog_enabled & 1) != 0
       || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))
      && *(void *)(a1 + 1112))
    {
      uint64_t v120 = _os_log_pack_size();
      int v121 = (char *)&v130 - ((MEMORY[0x1895F8858](v120, v120) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v122 = _os_log_pack_fill();
      uint64_t v123 = quic_cid_describe((unsigned __int8 *)(*(void *)(a1 + 1112) + 38LL));
      int v124 = quic_cid_describe((unsigned __int8 *)(*(void *)(a1 + 1112) + 17LL));
      *(_DWORD *)uint64_t v122 = 136447234;
      *(void *)(v122 + 4) = "quic_conn_process_inbound";
      *(_WORD *)(v122 + 12) = 2082;
      *(void *)(v122 + 14) = a1 + 976;
      *(_WORD *)(v122 + 22) = 2082;
      *(void *)(v122 + 24) = v123;
      *(_WORD *)(v122 + 32) = 2082;
      *(void *)(v122 + 34) = v124;
      *(_WORD *)(v122 + 42) = 2048;
      *(void *)(v122 + 44) = v8;
      qlog_internal(1, (uint64_t)v121, 3333LL);
    }

    return;
  }

  uint64_t v146 = a1;
  int v18 = *(void **)(a1 + 1112);
  uint64_t v135 = a2;
  uint64_t v138 = (_OWORD *)a5;
  if (v18)
  {
    if (*v18 != a2)
    {
      int v19 = qlog_datapath_enabled;
      int v20 = qlog_nwlog_enabled;
      if (qlog_datapath_enabled || qlog_nwlog_enabled)
      {
        if (a2)
        {
          uint64_t v125 = (nw_interface *)nw_protocol_instance_copy_interface_for_path();
          int v19 = qlog_datapath_enabled;
          int v20 = qlog_nwlog_enabled;
        }

        else
        {
          uint64_t v125 = 0LL;
        }

        if (v19 || v20)
        {
          if (qlog_debug_enabled) {
            LOBYTE(v20) = 1;
          }
          if ((v20 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v126 = _os_log_pack_size();
            int v127 = (char *)&v130 - ((MEMORY[0x1895F8858](v126, v126) + 15) & 0xFFFFFFFFFFFFFFF0LL);
            _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
            uint64_t v128 = _os_log_pack_fill();
            name = nw_interface_get_name(v125);
            *(_DWORD *)uint64_t v128 = 136446722;
            *(void *)(v128 + 4) = "quic_conn_process_inbound";
            *(_WORD *)(v128 + 12) = 2048;
            *(void *)(v128 + 14) = v135;
            *(_WORD *)(v128 + 22) = 2082;
            *(void *)(v128 + 24) = name;
            qlog_internal(2, (uint64_t)v127, 3348LL);
          }
        }

        uint64_t v9 = v135;
        uint64_t v8 = v138;
        if (v125) {
          nw_release(v125);
        }
      }
    }
  }

  uint64_t v21 = v146;
  uint64_t v22 = *(void *)(v146 + 1360);
  uint64_t v136 = *MEMORY[0x189608EC0];
  if (v136 == v9)
  {
    if (v22)
    {
      while ((*(_WORD *)(v22 + 431) & 1) == 0)
      {
        uint64_t v22 = *(void *)(v22 + 312);
        if (!v22) {
          goto LABEL_26;
        }
      }

      goto LABEL_59;
    }
  }

  else
  {
    if (v22)
    {
      while (*(void *)v22 != v9)
      {
        uint64_t v22 = *(void *)(v22 + 312);
        if (!v22)
        {
LABEL_26:
          if (v136 == v9) {
            goto LABEL_58;
          }
          goto LABEL_27;
        }
      }

      goto LABEL_59;
    }

LABEL_58:
  uint64_t v22 = *(void *)(v146 + 1112);
LABEL_59:
  int v137 = 0;
  int v142 = (_BYTE *)(v146 + 1380);
  if ((*(_BYTE *)(v146 + 1380) & 1) != 0)
  {
    BOOL v42 = v136 == v9;
    int v43 = v139;
    if (!v42)
    {
      if (v22 == *(void *)(v146 + 1112) || quic_path_is_validated(v22))
      {
        int v137 = 0;
      }

      else
      {
        quic_migration_trigger_validation(*(void *)(v21 + 1120), v22);
        int v137 = 1;
      }
    }
  }

  else
  {
    int v43 = v139;
  }

  if ((*v142 & 1) != 0 && !*(void *)(v21 + 568))
  {
    memset(v147, 0, 240);
    if (!quic_packet_parser_prelude(v21, v7, (unsigned __int16)v8, (uint64_t)v147)
      || !quic_conn_pre_decryption(v21, v22, (uint64_t)v147))
    {
      return;
    }
  }

  int v144 = 0;
  v143 = (char *)v8 + (void)v7;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v132 = v21 + 976;
  a7.n128_u64[0] = 136446978LL;
  __n128 v130 = a7;
  uint64_t v44 = "%s%02x";
  unsigned __int16 v45 = (unsigned __int16)v8;
  while (1)
  {
    uint64_t v46 = v44;
    LOWORD(v147[0]) = 0;
    uint64_t v47 = quic_packet_parser(v21, v22, (unsigned __int8 *)v7, v45, v43, v147);
    int v48 = v47;
    if (!LOWORD(v147[0])) {
      break;
    }
    if (LOWORD(v147[0]) > v45)
    {
      if (qlog_debug_enabled
        || (qlog_nwlog_enabled & 1) != 0
        || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
      {
        uint64_t v104 = _os_log_pack_size();
        int v105 = (char *)&v130 - ((MEMORY[0x1895F8858](v104, v104) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v106 = _os_log_pack_fill();
        int v107 = LOWORD(v147[0]);
        *(_DWORD *)uint64_t v106 = 136446722;
        *(void *)(v106 + 4) = "quic_conn_process_inbound";
        *(_WORD *)(v106 + 12) = 1024;
        *(_DWORD *)(v106 + 14) = v107;
        *(_WORD *)(v106 + 18) = 1024;
        *(_DWORD *)(v106 + 20) = v45;
        qlog_internal(17, (uint64_t)v105, 3407LL);
      }

      goto LABEL_191;
    }

    v7 += LOWORD(v147[0]);
    if (v7 > v143)
    {
      if (qlog_debug_enabled
        || (qlog_nwlog_enabled & 1) != 0
        || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
      {
        uint64_t v108 = _os_log_pack_size();
        uint64_t v109 = (char *)&v130 - ((MEMORY[0x1895F8858](v108, v108) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v110 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v110 = 136446210;
        *(void *)(v110 + 4) = "quic_conn_process_inbound";
        uint64_t v102 = (uint64_t)v109;
        uint64_t v103 = 3414LL;
        goto LABEL_190;
      }

      goto LABEL_191;
    }

    v45 -= LOWORD(v147[0]);
    if (v47)
    {
      uint64_t v49 = *(void *)(v21 + 1128);
      if (v49) {
        quic_shorthand_process_packet(v49, (uint64_t)v48, 0);
      }
      uint64_t v50 = *(void **)(v21 + 1136);
      if (v50)
      {
        int v51 = v144;
        if ((v144 & 1) != 0) {
          int v52 = v144;
        }
        else {
          int v52 = 1;
        }
        if (v45) {
          int v51 = v52;
        }
        int v144 = v51;
        uint64_t v53 = v51 & 1;
        id v54 = v50;
        [v54 packetReceived:v48 isCoalesced:v53];
      }

      uint64_t v55 = mach_continuous_time();
      if (timebase_info_once != -1) {
        dispatch_once(&timebase_info_once, &__block_literal_global_397);
      }
      uint64_t v21 = v146;
      unint64_t v56 = timebase_info_info * v55 / dword_18C4D003C / 0x3E8;
      quic_path_update_bdp(v22, (unsigned __int16)v8, v56);
      int v57 = *((_DWORD *)v48 + 58);
      if ((v57 & 0x100) != 0)
      {
        quic_conn_process_vn(v21, v22, (uint64_t)v48);
LABEL_70:
        _quic_packet_destroy(v48);
        uint64_t v44 = v46;
        goto LABEL_71;
      }

      if ((v57 & 0x400) != 0)
      {
        quic_conn_failed_decryption(v21, (uint64_t)v48);
        goto LABEL_70;
      }

      BOOL v58 = quic_ecn_process_ip_codepoint( *(void *)(v21 + 968),  v21,  v22,  *((unsigned __int8 *)v48 + 83),  *((_DWORD *)v48 + 26));
      if (((_BYTE)v48[29] & 1) != 0)
      {
        if ((~**v48 & 0x30) == 0)
        {
          quic_conn_process_retry(v21, v22, (uint64_t)v48);
          goto LABEL_70;
        }

        LODWORD(v141) = v58;
      }

      else
      {
        LODWORD(v141) = v58;
      }

      unint64_t v140 = v56;
      int v59 = (uint64_t *)v48[19];
      if (v59)
      {
        int v60 = 0;
        char v61 = 0;
        do
        {
          else {
            unint64_t v62 = *v59 - 12237272;
          }
          BOOL v63 = quic_frame_is_type_index_valid(v62, *v59) && ((uint64_t)quic_frames[6 * v62 + 5] & 1) == 0;
          v61 |= v63;
          BOOL v65 = ((0xD000001u >> *v59) & 1) == 0 || (unint64_t)*v59 > 0x1B;
          v60 |= v65;
          uint64_t v21 = v146;
          int v59 = (uint64_t *)v59[12];
        }

        while (v59);
        if (v137) {
LABEL_112:
        }
          quic_conn_send_internal(v21, v22, 0LL);
      }

      else
      {
        char v61 = 0;
        int v60 = 0;
        if (v137) {
          goto LABEL_112;
        }
      }

      LOWORD(v8) = (_WORD)v138;
      if ((*v142 & 1) == 0 || ((v60 ^ 1) & 1) != 0 || v136 == v135 || v22 == *(void *)(v21 + 1112))
      {
LABEL_119:
        int v66 = *(char **)(v21 + 960);
        if ((v61 & 1) == 0) {
          goto LABEL_128;
        }
      }

      else
      {
        if (quic_path_is_validated(v22))
        {
          quic_conn_migrate_to_path(v21, v22, 0);
          goto LABEL_119;
        }

        quic_path_set_migration_pending(v22);
        int v66 = *(char **)(v21 + 960);
        if ((v61 & 1) == 0)
        {
LABEL_128:
          quic_ack_update_largest_pn(v66, (uint64_t)v48);
          int v43 = v139;
          unint64_t v68 = v140;
LABEL_129:
          _quic_packet_destroy(v48);
          if (*(void *)(v21 + 1072)) {
            goto LABEL_177;
          }
          uint64_t v44 = v46;
          if ((~*(_DWORD *)v142 & 0x80001) == 0)
          {
            if ((qlog_debug_enabled
               || (qlog_nwlog_enabled & 1) != 0
               || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))
              && *(void *)(v21 + 1112))
            {
              uint64_t v69 = _os_log_pack_size();
              uint64_t v134 = (char *)&v130 - ((MEMORY[0x1895F8858](v69, v69) + 15) & 0xFFFFFFFFFFFFFFF0LL);
              int v133 = (_DWORD *)_os_log_pack_fill();
              size_t v70 = *(unsigned __int8 **)(v21 + 1112);
              int v71 = &quic_cid_describe_cid_buf3;
              if (quic_cid_describe_state % 3 == 2) {
                int v71 = &quic_cid_describe_cid_buf2;
              }
              if (quic_cid_describe_state % 3) {
                uint64_t v72 = v71;
              }
              else {
                uint64_t v72 = &quic_cid_describe_cid_buf1;
              }
              int v73 = ++quic_cid_describe_state;
              unsigned int v74 = v70[38];
              *(_OWORD *)((char *)v72 + 25) = 0u;
              if (v74 >= 0x14) {
                uint64_t v75 = 20LL;
              }
              else {
                uint64_t v75 = v74;
              }
              *uint64_t v72 = 0uLL;
              v72[1] = 0uLL;
              uint64_t v141 = &v130;
              if ((_DWORD)v75)
              {
                int v76 = v70 + 39;
                do
                {
                  unsigned int v77 = *v76++;
                  snprintf((char *)v72, 0x29uLL, v46, v72, v77);
                  --v75;
                }

                while (v75);
                size_t v70 = *(unsigned __int8 **)(v146 + 1112);
                int v73 = quic_cid_describe_state;
              }

              int v78 = &quic_cid_describe_cid_buf3;
              if (v73 % 3 == 2) {
                int v78 = &quic_cid_describe_cid_buf2;
              }
              if (v73 % 3) {
                uint64_t v8 = v78;
              }
              else {
                uint64_t v8 = &quic_cid_describe_cid_buf1;
              }
              quic_cid_describe_unsigned int state = v73 + 1;
              if (v70[17] >= 0x14u) {
                uint64_t v79 = 20LL;
              }
              else {
                uint64_t v79 = v70[17];
              }
              *uint64_t v8 = 0u;
              v8[1] = 0u;
              *(_OWORD *)((char *)v8 + 25) = 0u;
              if ((_DWORD)v79)
              {
                unsigned __int16 v80 = v70 + 18;
                do
                {
                  unsigned int v81 = *v80++;
                  snprintf((char *)v8, 0x29uLL, v46, v8, v81);
                  --v79;
                }

                while (v79);
              }

              int v83 = v133;
              uint64_t v82 = (uint64_t)v134;
              _DWORD *v133 = v130.n128_u32[0];
              *(void *)(v83 + 1) = "quic_conn_process_inbound";
              *((_WORD *)v83 + 6) = 2082;
              *(void *)((char *)v83 + 14) = v132;
              *((_WORD *)v83 + 11) = 2082;
              *((void *)v83 + 3) = v72;
              *((_WORD *)v83 + 16) = 2082;
              *(void *)((char *)v83 + 34) = v8;
              qlog_internal(1, v82, 3556LL);
              unint64_t v68 = v140;
              LOWORD(v8) = (_WORD)v138;
              int v43 = v139;
              uint64_t v44 = v46;
              uint64_t v21 = v146;
            }

            nw_protocol_instance_set_current_path();
            *(void *)v142 &= ~0x80000uLL;
          }

          *(void *)(v21 + 632) = v68;
          goto LABEL_71;
        }
      }

      quic_ack_increment_unacked_packet_count((uint64_t)v66);
      int v67 = quic_conn_process_reordering(v21, (uint64_t)v48);
      unint64_t v68 = v140;
      if ((v141 | v67) == 1)
      {
        quic_ack_aggressively(*(void *)(v21 + 960));
        int v43 = v139;
      }

      else
      {
        int v43 = v139;
      }

      quic_ack_update_largest_pn(*(char **)(v21 + 960), (uint64_t)v48);
      quic_ack_update_largest_ack_eliciting_pn(*(char **)(v21 + 960), (uint64_t)v48);
      goto LABEL_129;
    }

    uint64_t v44 = v46;
    if (*(_BYTE *)(v21 + 477) == 9)
    {
      if (((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
        && *(void *)(v21 + 1112))
      {
        uint64_t v84 = _os_log_pack_size();
        uint64_t v85 = (char *)&v130 - ((MEMORY[0x1895F8858](v84, v84) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        uint64_t v86 = v21;
        uint64_t v87 = _os_log_pack_fill();
        BOOL v88 = quic_cid_describe((unsigned __int8 *)(*(void *)(v86 + 1112) + 38LL));
        uint64_t v89 = quic_cid_describe((unsigned __int8 *)(*(void *)(v86 + 1112) + 17LL));
        *(_DWORD *)uint64_t v87 = v130.n128_u32[0];
        *(void *)(v87 + 4) = "quic_conn_process_inbound";
        *(_WORD *)(v87 + 12) = 2082;
        *(void *)(v87 + 14) = v132;
        *(_WORD *)(v87 + 22) = 2082;
        *(void *)(v87 + 24) = v88;
        *(_WORD *)(v87 + 32) = 2082;
        *(void *)(v87 + 34) = v89;
        int v90 = 16;
        uint64_t v91 = (uint64_t)v85;
        uint64_t v92 = 3420LL;
LABEL_170:
        qlog_internal(v90, v91, v92);
        LOWORD(v8) = (_WORD)v138;
        int v43 = v139;
        uint64_t v21 = v146;
      }
    }

    else if (((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1 {
            || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))
    }
           && *(void *)(v21 + 1112))
    {
      uint64_t v93 = _os_log_pack_size();
      uint64_t v94 = (char *)&v130 - ((MEMORY[0x1895F8858](v93, v93) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v95 = v21;
      uint64_t v96 = _os_log_pack_fill();
      uint64_t v97 = quic_cid_describe((unsigned __int8 *)(*(void *)(v95 + 1112) + 38LL));
      uint64_t v98 = quic_cid_describe((unsigned __int8 *)(*(void *)(v95 + 1112) + 17LL));
      *(_DWORD *)uint64_t v96 = v130.n128_u32[0];
      *(void *)(v96 + 4) = "quic_conn_process_inbound";
      *(_WORD *)(v96 + 12) = 2082;
      *(void *)(v96 + 14) = v132;
      *(_WORD *)(v96 + 22) = 2082;
      *(void *)(v96 + 24) = v97;
      *(_WORD *)(v96 + 32) = 2082;
      *(void *)(v96 + 34) = v98;
      int v90 = 1;
      uint64_t v91 = (uint64_t)v94;
      uint64_t v92 = 3424LL;
      goto LABEL_170;
    }

    if (*(void *)(v21 + 1072))
    {
LABEL_177:
      quic_conn_close(v21);
      return;
    }

LABEL_191:
  if (v48) {
    _quic_packet_destroy(v48);
  }
}

BOOL quic_conn_pre_decryption(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  if (a3)
  {
    uint64_t v4 = (_DWORD *)(a1 + 1380);
    uint64_t v5 = *(void *)(a1 + 1380);
    if ((v5 & 1) == 0) {
      return 1LL;
    }
    if ((*(_BYTE *)(a3 + 232) & 1) == 0) {
      return 1LL;
    }
    if ((**(_BYTE **)a3 & 0x30) != 0) {
      return 1LL;
    }
    int v7 = *(unsigned __int8 *)(a1 + 477);
    unsigned int v9 = *(_DWORD *)(a3 + 108);
    if (v9 == *(_DWORD *)(a1 + 1376))
    {
      if ((v5 & 0x4000) != 0 && v7 != 3)
      {
        *(_BYTE *)(a2 + 38) = 8;
        arc4random_buf((void *)(a2 + 39), 8uLL);
        *(_BYTE *)(a1 + 392) = *(_BYTE *)(a2 + 38);
        int v10 = *(_DWORD *)(a2 + 55);
        *(_OWORD *)(a1 + 393) = *(_OWORD *)(a2 + 39);
        *(_DWORD *)(a1 + 409) = v10;
        *(_WORD *)(a1 + 598) = 128;
        uint64_t v11 = malloc(0x80uLL);
        if (!v11) {
          qlog_abort_internal("%s strict_malloc(%zu) failed", "strict_malloc", 0x80uLL);
        }
        *(void *)(a1 + 1088) = v11;
        arc4random_buf(v11, 0x80uLL);
        quic_conn_send_retry(a1, a2, a3);
        if (qlog_debug_enabled
          || (qlog_nwlog_enabled & 1) != 0
          || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEFAULT))
        {
          if (*(void *)(a1 + 1112))
          {
            uint64_t v12 = _os_log_pack_size();
            uint64_t v13 = (char *)v29 - ((MEMORY[0x1895F8858](v12, v12) + 15) & 0xFFFFFFFFFFFFFFF0LL);
            _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
            uint64_t v14 = _os_log_pack_fill();
            int v15 = quic_cid_describe((unsigned __int8 *)(*(void *)(a1 + 1112) + 38LL));
            uint64_t v16 = quic_cid_describe((unsigned __int8 *)(*(void *)(a1 + 1112) + 17LL));
            uint64_t v17 = quic_cid_describe((unsigned __int8 *)(a3 + 40));
            *(_DWORD *)uint64_t v14 = 136447234;
            *(void *)(v14 + 4) = "quic_conn_pre_decryption";
            *(_WORD *)(v14 + 12) = 2082;
            *(void *)(v14 + 14) = a1 + 976;
            *(_WORD *)(v14 + 22) = 2082;
            *(void *)(v14 + 24) = v15;
            *(_WORD *)(v14 + 32) = 2082;
            *(void *)(v14 + 34) = v16;
            *(_WORD *)(v14 + 42) = 2082;
            *(void *)(v14 + 44) = v17;
            qlog_internal(0, (uint64_t)v13, 2929LL);
          }
        }

        char v19 = *(_BYTE *)(a3 + 40);
        uint64_t v18 = a3 + 40;
        *(_BYTE *)(a1 + 434) = v19;
        int v20 = *(_DWORD *)(v18 + 17);
        *(_OWORD *)(a1 + 435) = *(_OWORD *)(v18 + 1);
        *(_DWORD *)(a1 + 451) = v20;
        quic_path_set_scid(a2, v18, a1);
        quic_fsm_conn_change(a1, 3u);
        quic_crypto_tls_start(*(void *)a1, *(void *)(a1 + 368), *v4 & 1);
        return 0LL;
      }

      quic_fsm_conn_change(a1, 4u);
      *(_BYTE *)(a1 + 600) = 2;
      quic_protector_create_server((unsigned __int8 *)(a3 + 40));
      *(void *)(a1 + 568) = v25;
      return 1LL;
    }

    *(_DWORD *)(a1 + 520) = v9;
    quic_packet_builder_set_version(*(void *)(a1 + 560), v9);
    unsigned int v22 = *(_DWORD *)(a1 + 1376);
    *(_DWORD *)(a1 + 524) = v22;
    quic_packet_builder_set_version(*(void *)(a1 + 560), v22);
    v31[0] = *(_DWORD *)(a1 + 1376);
    v31[1] = 438975050;
    __int16 v23 = quic_cid_len((unsigned __int8 *)(a3 + 40));
    __int16 v24 = quic_cid_len((unsigned __int8 *)(a3 + 61));
    v29[0] = MEMORY[0x1895F87A8];
    v29[1] = 0x40000000LL;
    v29[2] = __quic_conn_send_vn_block_invoke;
    v29[3] = &__block_descriptor_tmp_211;
    void v29[4] = a1;
    v29[5] = a3;
    v29[6] = v31;
    __int16 v30 = v23 + v24 + 15;
    nw_protocol_request_outbound_data();
    if (*(_BYTE *)(a1 + 477) != 2) {
      quic_fsm_conn_change(a1, 2u);
    }
    return 0LL;
  }

  else if (qlog_debug_enabled {
         || (qlog_nwlog_enabled & 1) != 0
  }
         || (BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT)))
  {
    uint64_t v26 = _os_log_pack_size();
    uint64_t v27 = (char *)v29 - ((MEMORY[0x1895F8858](v26, v26) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v28 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v28 = 136446210;
    *(void *)(v28 + 4) = "quic_conn_pre_decryption";
    qlog_internal(17, (uint64_t)v27, 2893LL);
    return 0LL;
  }

  return result;
}

void quic_conn_process_vn(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v167 = *MEMORY[0x1895F89C0];
  if (!a2)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      uint64_t v161 = _os_log_pack_size();
      v162 = (char *)&v164 - ((MEMORY[0x1895F8858](v161, v161) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v163 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v163 = 136446210;
      *(void *)(v163 + 4) = "quic_conn_process_vn";
      qlog_internal(17, (uint64_t)v162, 2623LL);
    }

    return;
  }

  uint64_t v4 = (void *)(a1 + 1380);
  uint64_t v5 = *(void *)(a1 + 1380);
  if ((v5 & 1) != 0)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR)
      || !*(void *)(a1 + 1112))
    {
      return;
    }

    uint64_t v33 = _os_log_pack_size();
    uint64_t v165 = &v164;
    uint64_t v34 = (char *)&v164 - ((MEMORY[0x1895F8858](v33, v33) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v35 = _os_log_pack_fill();
    uint64_t v164 = (char *)(a1 + 976);
    int v36 = *(unsigned __int8 **)(a1 + 1112);
    if (quic_cid_describe_state % 3 == 2) {
      BOOL v37 = &quic_cid_describe_cid_buf2;
    }
    else {
      BOOL v37 = &quic_cid_describe_cid_buf3;
    }
    if (quic_cid_describe_state % 3) {
      uint64_t v38 = v37;
    }
    else {
      uint64_t v38 = &quic_cid_describe_cid_buf1;
    }
    int v39 = ++quic_cid_describe_state;
    unsigned int v40 = v36[38];
    __int128 v41 = 0uLL;
    *(_OWORD *)((char *)v38 + 25) = 0u;
    if (v40 >= 0x14) {
      uint64_t v42 = 20LL;
    }
    else {
      uint64_t v42 = v40;
    }
    _OWORD *v38 = 0uLL;
    v38[1] = 0uLL;
    if ((_DWORD)v42)
    {
      uint64_t v43 = a1;
      uint64_t v44 = v36 + 39;
      do
      {
        int v45 = *v44++;
        snprintf((char *)v38, 0x29uLL, "%s%02x", (const char *)v38, v45);
        --v42;
      }

      while (v42);
      int v36 = *(unsigned __int8 **)(v43 + 1112);
      int v39 = quic_cid_describe_state;
      __int128 v41 = 0uLL;
    }

    if (v39 % 3 == 2) {
      uint64_t v46 = &quic_cid_describe_cid_buf2;
    }
    else {
      uint64_t v46 = &quic_cid_describe_cid_buf3;
    }
    if (v39 % 3) {
      uint64_t v47 = v46;
    }
    else {
      uint64_t v47 = &quic_cid_describe_cid_buf1;
    }
    quic_cid_describe_unsigned int state = v39 + 1;
    if (v36[17] >= 0x14u) {
      uint64_t v48 = 20LL;
    }
    else {
      uint64_t v48 = v36[17];
    }
    _OWORD *v47 = v41;
    v47[1] = v41;
    *(_OWORD *)((char *)v47 + 25) = v41;
    if ((_DWORD)v48)
    {
      uint64_t v49 = v36 + 18;
      do
      {
        int v50 = *v49++;
        snprintf((char *)v47, 0x29uLL, "%s%02x", (const char *)v47, v50);
        --v48;
      }

      while (v48);
    }

    *(_DWORD *)uint64_t v35 = 136446978;
    *(void *)(v35 + 4) = "quic_conn_process_vn";
    *(_WORD *)(v35 + 12) = 2082;
    *(void *)(v35 + 14) = v164;
    *(_WORD *)(v35 + 22) = 2082;
    *(void *)(v35 + 24) = v38;
    *(_WORD *)(v35 + 32) = 2082;
    *(void *)(v35 + 34) = v47;
    uint64_t v51 = (uint64_t)v34;
    uint64_t v52 = 2627LL;
LABEL_211:
    qlog_internal(16, v51, v52);
    return;
  }

  if ((v5 & 0x10) != 0)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR)
      || !*(void *)(a1 + 1112))
    {
      return;
    }

    uint64_t v53 = _os_log_pack_size();
    uint64_t v165 = &v164;
    id v54 = (char *)&v164 - ((MEMORY[0x1895F8858](v53, v53) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v55 = _os_log_pack_fill();
    uint64_t v164 = (char *)(a1 + 976);
    unint64_t v56 = *(unsigned __int8 **)(a1 + 1112);
    if (quic_cid_describe_state % 3 == 2) {
      int v57 = &quic_cid_describe_cid_buf2;
    }
    else {
      int v57 = &quic_cid_describe_cid_buf3;
    }
    if (quic_cid_describe_state % 3) {
      BOOL v58 = v57;
    }
    else {
      BOOL v58 = &quic_cid_describe_cid_buf1;
    }
    int v59 = ++quic_cid_describe_state;
    unsigned int v60 = v56[38];
    __int128 v61 = 0uLL;
    *(_OWORD *)((char *)v58 + 25) = 0u;
    if (v60 >= 0x14) {
      uint64_t v62 = 20LL;
    }
    else {
      uint64_t v62 = v60;
    }
    *BOOL v58 = 0uLL;
    v58[1] = 0uLL;
    if ((_DWORD)v62)
    {
      uint64_t v63 = a1;
      char v64 = v56 + 39;
      do
      {
        int v65 = *v64++;
        snprintf((char *)v58, 0x29uLL, "%s%02x", (const char *)v58, v65);
        --v62;
      }

      while (v62);
      unint64_t v56 = *(unsigned __int8 **)(v63 + 1112);
      int v59 = quic_cid_describe_state;
      __int128 v61 = 0uLL;
    }

    if (v59 % 3 == 2) {
      int v66 = &quic_cid_describe_cid_buf2;
    }
    else {
      int v66 = &quic_cid_describe_cid_buf3;
    }
    if (v59 % 3) {
      int v67 = v66;
    }
    else {
      int v67 = &quic_cid_describe_cid_buf1;
    }
    quic_cid_describe_unsigned int state = v59 + 1;
    if (v56[17] >= 0x14u) {
      uint64_t v68 = 20LL;
    }
    else {
      uint64_t v68 = v56[17];
    }
    _OWORD *v67 = v61;
    v67[1] = v61;
    *(_OWORD *)((char *)v67 + 25) = v61;
    if ((_DWORD)v68)
    {
      uint64_t v69 = v56 + 18;
      do
      {
        int v70 = *v69++;
        snprintf((char *)v67, 0x29uLL, "%s%02x", (const char *)v67, v70);
        --v68;
      }

      while (v68);
    }

    *(_DWORD *)uint64_t v55 = 136446978;
    *(void *)(v55 + 4) = "quic_conn_process_vn";
    *(_WORD *)(v55 + 12) = 2082;
    *(void *)(v55 + 14) = v164;
    *(_WORD *)(v55 + 22) = 2082;
    *(void *)(v55 + 24) = v58;
    *(_WORD *)(v55 + 32) = 2082;
    *(void *)(v55 + 34) = v67;
    uint64_t v51 = (uint64_t)v54;
    uint64_t v52 = 2635LL;
    goto LABEL_211;
  }

  unint64_t v8 = *(unsigned __int8 *)(a3 + 40);
  if (v8 >= 0x14 ? 20 : *(unsigned __int8 *)(a3 + 40))
  {
    if (v8 >= 0x14) {
      unint64_t v8 = 20LL;
    }
    unint64_t v10 = v8 - 1;
    uint64_t v11 = (unsigned __int8 *)(a2 + 39);
    uint64_t v12 = (unsigned __int8 *)(a3 + 41);
    do
    {
      int v14 = *v12++;
      int v13 = v14;
      int v16 = *v11++;
      int v15 = v16;
      BOOL v17 = v10-- != 0;
      char v18 = v17;
    }

    while (v13 == v15 && (v18 & 1) != 0);
    if (v13 != v15)
    {
LABEL_248:
      if (!qlog_debug_enabled
        && (qlog_nwlog_enabled & 1) == 0
        && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR)
        || !*(void *)(a1 + 1112))
      {
        return;
      }

      uint64_t v71 = _os_log_pack_size();
      uint64_t v165 = &v164;
      uint64_t v72 = MEMORY[0x1895F8858](v71, v71);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v164 = (char *)&v164 - ((v72 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v73 = _os_log_pack_fill();
      unsigned int v74 = *(unsigned __int8 **)(a1 + 1112);
      if (quic_cid_describe_state % 3 == 2) {
        uint64_t v75 = &quic_cid_describe_cid_buf2;
      }
      else {
        uint64_t v75 = &quic_cid_describe_cid_buf3;
      }
      if (quic_cid_describe_state % 3) {
        int v76 = v75;
      }
      else {
        int v76 = &quic_cid_describe_cid_buf1;
      }
      int v77 = ++quic_cid_describe_state;
      unsigned int v78 = v74[38];
      __int128 v79 = 0uLL;
      *(_OWORD *)((char *)v76 + 25) = 0u;
      if (v78 >= 0x14) {
        uint64_t v80 = 20LL;
      }
      else {
        uint64_t v80 = v78;
      }
      *int v76 = 0uLL;
      v76[1] = 0uLL;
      if ((_DWORD)v80)
      {
        unsigned int v81 = v74 + 39;
        do
        {
          int v82 = *v81++;
          snprintf((char *)v76, 0x29uLL, "%s%02x", (const char *)v76, v82);
          --v80;
        }

        while (v80);
        unsigned int v74 = *(unsigned __int8 **)(a1 + 1112);
        int v77 = quic_cid_describe_state;
        __int128 v79 = 0uLL;
      }

      if (v77 % 3 == 2) {
        int v83 = &quic_cid_describe_cid_buf2;
      }
      else {
        int v83 = &quic_cid_describe_cid_buf3;
      }
      if (v77 % 3) {
        uint64_t v84 = v83;
      }
      else {
        uint64_t v84 = &quic_cid_describe_cid_buf1;
      }
      int v85 = v77 + 1;
      quic_cid_describe_unsigned int state = v85;
      if (v74[17] >= 0x14u) {
        uint64_t v86 = 20LL;
      }
      else {
        uint64_t v86 = v74[17];
      }
      *uint64_t v84 = v79;
      v84[1] = v79;
      *(_OWORD *)((char *)v84 + 25) = v79;
      if ((_DWORD)v86)
      {
        uint64_t v87 = v74 + 18;
        do
        {
          int v88 = *v87++;
          snprintf((char *)v84, 0x29uLL, "%s%02x", (const char *)v84, v88);
          --v86;
        }

        while (v86);
        int v85 = quic_cid_describe_state;
      }

      uint64_t v89 = a1 + 976;
      if (v85 % 3 == 2) {
        int v90 = &quic_cid_describe_cid_buf2;
      }
      else {
        int v90 = &quic_cid_describe_cid_buf3;
      }
      if (v85 % 3) {
        uint64_t v91 = v90;
      }
      else {
        uint64_t v91 = &quic_cid_describe_cid_buf1;
      }
      int v92 = v85 + 1;
      quic_cid_describe_unsigned int state = v85 + 1;
      unsigned int v93 = *(unsigned __int8 *)(a3 + 40);
      __int128 v94 = 0uLL;
      *(_OWORD *)((char *)v91 + 25) = 0u;
      if (v93 >= 0x14) {
        uint64_t v95 = 20LL;
      }
      else {
        uint64_t v95 = v93;
      }
      _OWORD *v91 = 0uLL;
      v91[1] = 0uLL;
      if ((_DWORD)v95)
      {
        uint64_t v96 = v89;
        uint64_t v97 = (unsigned __int8 *)(a3 + 41);
        do
        {
          int v98 = *v97++;
          snprintf((char *)v91, 0x29uLL, "%s%02x", (const char *)v91, v98);
          --v95;
        }

        while (v95);
        int v92 = quic_cid_describe_state;
        uint64_t v89 = v96;
        __int128 v94 = 0uLL;
      }

      if (v92 % 3 == 2) {
        uint64_t v99 = &quic_cid_describe_cid_buf2;
      }
      else {
        uint64_t v99 = &quic_cid_describe_cid_buf3;
      }
      if (v92 % 3) {
        uint64_t v100 = v99;
      }
      else {
        uint64_t v100 = &quic_cid_describe_cid_buf1;
      }
      quic_cid_describe_unsigned int state = v92 + 1;
      unsigned int v101 = *(unsigned __int8 *)(a2 + 38);
      *(_OWORD *)((char *)v100 + 25) = v94;
      if (v101 >= 0x14) {
        uint64_t v102 = 20LL;
      }
      else {
        uint64_t v102 = v101;
      }
      *uint64_t v100 = v94;
      v100[1] = v94;
      if ((_DWORD)v102)
      {
        uint64_t v103 = (unsigned __int8 *)(a2 + 39);
        do
        {
          int v104 = *v103++;
          snprintf((char *)v100, 0x29uLL, "%s%02x", (const char *)v100, v104);
          --v102;
        }

        while (v102);
      }

      *(_DWORD *)uint64_t v73 = 136447490;
      *(void *)(v73 + 4) = "quic_conn_process_vn";
      *(_WORD *)(v73 + 12) = 2082;
      *(void *)(v73 + 14) = v89;
      *(_WORD *)(v73 + 22) = 2082;
      *(void *)(v73 + 24) = v76;
      *(_WORD *)(v73 + 32) = 2082;
      *(void *)(v73 + 34) = v84;
      *(_WORD *)(v73 + 42) = 2082;
      *(void *)(v73 + 44) = v91;
      *(_WORD *)(v73 + 52) = 2082;
      *(void *)(v73 + 54) = v100;
      uint64_t v51 = (uint64_t)v164;
      uint64_t v52 = 2648LL;
      goto LABEL_211;
    }
  }

  unint64_t v19 = *(unsigned __int8 *)(a3 + 61);
  if (v19 >= 0x14 ? 20 : *(unsigned __int8 *)(a3 + 61))
  {
    if (v19 >= 0x14) {
      unint64_t v19 = 20LL;
    }
    unint64_t v21 = v19 - 1;
    unsigned int v22 = (unsigned __int8 *)(a2 + 18);
    __int16 v23 = (unsigned __int8 *)(a3 + 62);
    do
    {
      int v25 = *v23++;
      int v24 = v25;
      int v27 = *v22++;
      int v26 = v27;
      BOOL v17 = v21-- != 0;
      char v28 = v17;
    }

    while (v24 == v26 && (v28 & 1) != 0);
    if (v24 != v26)
    {
LABEL_249:
      if (!qlog_debug_enabled
        && (qlog_nwlog_enabled & 1) == 0
        && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR)
        || !*(void *)(a1 + 1112))
      {
        return;
      }

      uint64_t v105 = _os_log_pack_size();
      uint64_t v165 = &v164;
      uint64_t v106 = MEMORY[0x1895F8858](v105, v105);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v164 = (char *)&v164 - ((v106 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v107 = _os_log_pack_fill();
      uint64_t v108 = *(unsigned __int8 **)(a1 + 1112);
      if (quic_cid_describe_state % 3 == 2) {
        uint64_t v109 = &quic_cid_describe_cid_buf2;
      }
      else {
        uint64_t v109 = &quic_cid_describe_cid_buf3;
      }
      if (quic_cid_describe_state % 3) {
        uint64_t v110 = v109;
      }
      else {
        uint64_t v110 = &quic_cid_describe_cid_buf1;
      }
      int v111 = ++quic_cid_describe_state;
      unsigned int v112 = v108[38];
      __int128 v113 = 0uLL;
      *(_OWORD *)((char *)v110 + 25) = 0u;
      if (v112 >= 0x14) {
        uint64_t v114 = 20LL;
      }
      else {
        uint64_t v114 = v112;
      }
      *uint64_t v110 = 0uLL;
      v110[1] = 0uLL;
      if ((_DWORD)v114)
      {
        int v115 = v108 + 39;
        do
        {
          int v116 = *v115++;
          snprintf((char *)v110, 0x29uLL, "%s%02x", (const char *)v110, v116);
          --v114;
        }

        while (v114);
        uint64_t v108 = *(unsigned __int8 **)(a1 + 1112);
        int v111 = quic_cid_describe_state;
        __int128 v113 = 0uLL;
      }

      if (v111 % 3 == 2) {
        uint64_t v117 = &quic_cid_describe_cid_buf2;
      }
      else {
        uint64_t v117 = &quic_cid_describe_cid_buf3;
      }
      if (v111 % 3) {
        uint64_t v118 = v117;
      }
      else {
        uint64_t v118 = &quic_cid_describe_cid_buf1;
      }
      int v119 = v111 + 1;
      quic_cid_describe_unsigned int state = v119;
      if (v108[17] >= 0x14u) {
        uint64_t v120 = 20LL;
      }
      else {
        uint64_t v120 = v108[17];
      }
      *uint64_t v118 = v113;
      v118[1] = v113;
      *(_OWORD *)((char *)v118 + 25) = v113;
      if ((_DWORD)v120)
      {
        int v121 = v108 + 18;
        do
        {
          int v122 = *v121++;
          snprintf((char *)v118, 0x29uLL, "%s%02x", (const char *)v118, v122);
          --v120;
        }

        while (v120);
        int v119 = quic_cid_describe_state;
      }

      uint64_t v123 = a1 + 976;
      if (v119 % 3 == 2) {
        int v124 = &quic_cid_describe_cid_buf2;
      }
      else {
        int v124 = &quic_cid_describe_cid_buf3;
      }
      if (v119 % 3) {
        uint64_t v125 = v124;
      }
      else {
        uint64_t v125 = &quic_cid_describe_cid_buf1;
      }
      int v126 = v119 + 1;
      quic_cid_describe_unsigned int state = v119 + 1;
      else {
        uint64_t v127 = *(unsigned __int8 *)(a3 + 61);
      }
      __int128 v128 = 0uLL;
      _OWORD *v125 = 0u;
      v125[1] = 0u;
      *(_OWORD *)((char *)v125 + 25) = 0u;
      if ((_DWORD)v127)
      {
        uint64_t v129 = v123;
        __n128 v130 = (unsigned __int8 *)(a3 + 62);
        do
        {
          int v131 = *v130++;
          snprintf((char *)v125, 0x29uLL, "%s%02x", (const char *)v125, v131);
          --v127;
        }

        while (v127);
        int v126 = quic_cid_describe_state;
        uint64_t v123 = v129;
        __int128 v128 = 0uLL;
      }

      if (v126 % 3 == 2) {
        uint64_t v132 = &quic_cid_describe_cid_buf2;
      }
      else {
        uint64_t v132 = &quic_cid_describe_cid_buf3;
      }
      if (v126 % 3) {
        int v133 = v132;
      }
      else {
        int v133 = &quic_cid_describe_cid_buf1;
      }
      quic_cid_describe_unsigned int state = v126 + 1;
      else {
        uint64_t v134 = *(unsigned __int8 *)(a2 + 17);
      }
      _OWORD *v133 = v128;
      v133[1] = v128;
      *(_OWORD *)((char *)v133 + 25) = v128;
      if ((_DWORD)v134)
      {
        uint64_t v135 = (unsigned __int8 *)(a2 + 18);
        do
        {
          int v136 = *v135++;
          snprintf((char *)v133, 0x29uLL, "%s%02x", (const char *)v133, v136);
          --v134;
        }

        while (v134);
      }

      *(_DWORD *)uint64_t v107 = 136447490;
      *(void *)(v107 + 4) = "quic_conn_process_vn";
      *(_WORD *)(v107 + 12) = 2082;
      *(void *)(v107 + 14) = v123;
      *(_WORD *)(v107 + 22) = 2082;
      *(void *)(v107 + 24) = v110;
      *(_WORD *)(v107 + 32) = 2082;
      *(void *)(v107 + 34) = v118;
      *(_WORD *)(v107 + 42) = 2082;
      *(void *)(v107 + 44) = v125;
      *(_WORD *)(v107 + 52) = 2082;
      *(void *)(v107 + 54) = v133;
      uint64_t v51 = (uint64_t)v164;
      uint64_t v52 = 2655LL;
      goto LABEL_211;
    }
  }

  if (!*(_WORD *)(a3 + 94))
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR)
      || !*(void *)(a1 + 1112))
    {
      return;
    }

    uint64_t v137 = _os_log_pack_size();
    uint64_t v138 = (char *)&v164 - ((MEMORY[0x1895F8858](v137, v137) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v139 = _os_log_pack_fill();
    unint64_t v140 = quic_cid_describe((unsigned __int8 *)(*(void *)(a1 + 1112) + 38LL));
    uint64_t v141 = quic_cid_describe((unsigned __int8 *)(*(void *)(a1 + 1112) + 17LL));
    *(_DWORD *)uint64_t v139 = 136446978;
    *(void *)(v139 + 4) = "quic_conn_process_vn";
    *(_WORD *)(v139 + 12) = 2082;
    *(void *)(v139 + 14) = a1 + 976;
    *(_WORD *)(v139 + 22) = 2082;
    *(void *)(v139 + 24) = v140;
    *(_WORD *)(v139 + 32) = 2082;
    *(void *)(v139 + 34) = v141;
    uint64_t v51 = (uint64_t)v138;
    uint64_t v52 = 2659LL;
    goto LABEL_211;
  }

  if (*(_BYTE *)(a1 + 477) != 6)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR)
      || !*(void *)(a1 + 1112))
    {
      return;
    }

    uint64_t v142 = _os_log_pack_size();
    v143 = (char *)&v164 - ((MEMORY[0x1895F8858](v142, v142) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v144 = _os_log_pack_fill();
    uint64_t v145 = quic_cid_describe((unsigned __int8 *)(*(void *)(a1 + 1112) + 38LL));
    uint64_t v146 = quic_cid_describe((unsigned __int8 *)(*(void *)(a1 + 1112) + 17LL));
    int v147 = *(unsigned __int8 *)(a1 + 477);
    *(_DWORD *)uint64_t v144 = 136447234;
    *(void *)(v144 + 4) = "quic_conn_process_vn";
    *(_WORD *)(v144 + 12) = 2082;
    *(void *)(v144 + 14) = a1 + 976;
    *(_WORD *)(v144 + 22) = 2082;
    *(void *)(v144 + 24) = v145;
    *(_WORD *)(v144 + 32) = 2082;
    *(void *)(v144 + 34) = v146;
    *(_WORD *)(v144 + 42) = 1024;
    *(_DWORD *)(v144 + 44) = v147;
    uint64_t v51 = (uint64_t)v143;
    uint64_t v52 = 2663LL;
    goto LABEL_211;
  }

  unsigned __int16 v29 = 0;
  unsigned __int8 v30 = 0;
  while (1)
  {
    unsigned int v31 = *(_DWORD *)(*(void *)(a3 + 96) + 4LL * v30);
    unsigned int v32 = bswap32(v31);
    if (v32 == *(_DWORD *)(a1 + 520)) {
      break;
    }
    if (v31 == 0x1000000)
    {
      unsigned int v32 = 1;
LABEL_224:
      quic_fsm_conn_change(a1, 5u);
      *v4 |= 0x10uLL;
      if (*(unsigned __int16 *)(a3 + 94) == v29)
      {
        if (qlog_debug_enabled
          || (qlog_nwlog_enabled & 1) != 0
          || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
        {
          if (*(void *)(a1 + 1112))
          {
            uint64_t v148 = _os_log_pack_size();
            uint64_t v149 = (char *)&v164 - ((MEMORY[0x1895F8858](v148, v148) + 15) & 0xFFFFFFFFFFFFFFF0LL);
            _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
            uint64_t v150 = _os_log_pack_fill();
            uint64_t v151 = quic_cid_describe((unsigned __int8 *)(*(void *)(a1 + 1112) + 38LL));
            uint64_t v152 = quic_cid_describe((unsigned __int8 *)(*(void *)(a1 + 1112) + 17LL));
            *(_DWORD *)uint64_t v150 = 136446978;
            *(void *)(v150 + 4) = "quic_conn_process_vn";
            *(_WORD *)(v150 + 12) = 2082;
            *(void *)(v150 + 14) = a1 + 976;
            *(_WORD *)(v150 + 22) = 2082;
            *(void *)(v150 + 24) = v151;
            *(_WORD *)(v150 + 32) = 2082;
            *(void *)(v150 + 34) = v152;
            qlog_internal(16, (uint64_t)v149, 2690LL);
          }
        }

        *(void *)(a1 + 1072) = 1LL;
      }

      else
      {
        quic_path_assign_dcid(a2, a3 + 61, a1);
        *(_DWORD *)(a1 + 524) = v32;
        quic_packet_builder_set_version(*(void *)(a1 + 560), v32);
        quic_recovery_reset_pn_space(*(void **)(a1 + 952), 1u);
        quic_recovery_reset_pn_space(*(void **)(a1 + 952), 2u);
        quic_cc_reset(*(void *)(a2 + 360));
        uint64_t v153 = *(void *)(a2 + 392);
        if (v153) {
          quic_pacer_reset(v153);
        }
        if ((qlog_debug_enabled
           || (qlog_nwlog_enabled & 1) != 0
           || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))
          && *(void *)(a1 + 1112))
        {
          uint64_t v154 = _os_log_pack_size();
          uint64_t v155 = (char *)&v164 - ((MEMORY[0x1895F8858](v154, v154) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          uint64_t v156 = _os_log_pack_fill();
          v157 = quic_cid_describe((unsigned __int8 *)(*(void *)(a1 + 1112) + 38LL));
          v158 = quic_cid_describe((unsigned __int8 *)(*(void *)(a1 + 1112) + 17LL));
          if (v32 == 1)
          {
            uint64_t v159 = "v1";
          }

          else
          {
            uint64_t v159 = quic_version_describe_buffer;
            snprintf(quic_version_describe_buffer, 0x10uLL, "v %x", v32);
          }

          *(_DWORD *)uint64_t v156 = 136447234;
          *(void *)(v156 + 4) = "quic_conn_process_vn";
          *(_WORD *)(v156 + 12) = 2082;
          *(void *)(v156 + 14) = a1 + 976;
          *(_WORD *)(v156 + 22) = 2082;
          *(void *)(v156 + 24) = v157;
          *(_WORD *)(v156 + 32) = 2082;
          *(void *)(v156 + 34) = v158;
          *(_WORD *)(v156 + 42) = 2082;
          *(void *)(v156 + 44) = v159;
          qlog_internal(1, (uint64_t)v155, 2705LL);
        }

        uint64_t v166 = -1LL;
        uint64_t flow_for_key = nw_protocol_instance_get_flow_for_key();
        quic_crypto_tls_start(*(void *)a1, flow_for_key, *(_DWORD *)v4 & 1);
        quic_fsm_conn_change(a1, 6u);
      }

      return;
    }

    unsigned __int16 v29 = ++v30;
  }

void quic_conn_failed_decryption(uint64_t a1, uint64_t a2)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  if (*(_BYTE *)(a2 + 87) == 16)
  {
    uint64_t v2 = *(int8x16_t **)(a2 + 16);
    if (*v2 != 0LL)
    {
      if (quic_cid_array_find_by_srt(*(unsigned __int8 **)(a1 + 384), v2))
      {
        if ((qlog_debug_enabled
           || (qlog_nwlog_enabled & 1) != 0
           || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEFAULT))
          && *(void *)(a1 + 1112))
        {
          uint64_t v4 = _os_log_pack_size();
          int v24 = &v22;
          uint64_t v5 = (char *)&v22 - ((MEMORY[0x1895F8858](v4, v4) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          uint64_t v6 = _os_log_pack_fill();
          uint64_t v23 = a1 + 976;
          int v7 = *(unsigned __int8 **)(a1 + 1112);
          if (quic_cid_describe_state % 3 == 2) {
            unint64_t v8 = &quic_cid_describe_cid_buf2;
          }
          else {
            unint64_t v8 = &quic_cid_describe_cid_buf3;
          }
          if (quic_cid_describe_state % 3) {
            unsigned int v9 = v8;
          }
          else {
            unsigned int v9 = &quic_cid_describe_cid_buf1;
          }
          int v10 = ++quic_cid_describe_state;
          unsigned int v11 = v7[38];
          __int128 v12 = 0uLL;
          *(_OWORD *)((char *)v9 + 25) = 0u;
          if (v11 >= 0x14) {
            uint64_t v13 = 20LL;
          }
          else {
            uint64_t v13 = v11;
          }
          *unsigned int v9 = 0uLL;
          v9[1] = 0uLL;
          if ((_DWORD)v13)
          {
            int v14 = v7 + 39;
            do
            {
              int v15 = *v14++;
              snprintf((char *)v9, 0x29uLL, "%s%02x", (const char *)v9, v15);
              --v13;
            }

            while (v13);
            int v7 = *(unsigned __int8 **)(a1 + 1112);
            int v10 = quic_cid_describe_state;
            __int128 v12 = 0uLL;
          }

          if (v10 % 3 == 2) {
            int v16 = &quic_cid_describe_cid_buf2;
          }
          else {
            int v16 = &quic_cid_describe_cid_buf3;
          }
          if (v10 % 3) {
            BOOL v17 = v16;
          }
          else {
            BOOL v17 = &quic_cid_describe_cid_buf1;
          }
          quic_cid_describe_unsigned int state = v10 + 1;
          if (v7[17] >= 0x14u) {
            uint64_t v18 = 20LL;
          }
          else {
            uint64_t v18 = v7[17];
          }
          *BOOL v17 = v12;
          v17[1] = v12;
          *(_OWORD *)((char *)v17 + 25) = v12;
          if ((_DWORD)v18)
          {
            unint64_t v19 = v7 + 18;
            do
            {
              int v20 = *v19++;
              snprintf((char *)v17, 0x29uLL, "%s%02x", (const char *)v17, v20);
              --v18;
            }

            while (v18);
          }

          *(_DWORD *)uint64_t v6 = 136446978;
          *(void *)(v6 + 4) = "quic_conn_failed_decryption";
          *(_WORD *)(v6 + 12) = 2082;
          *(void *)(v6 + 14) = v23;
          *(_WORD *)(v6 + 22) = 2082;
          *(void *)(v6 + 24) = v9;
          *(_WORD *)(v6 + 32) = 2082;
          *(void *)(v6 + 34) = v17;
          qlog_internal(0, (uint64_t)v5, 2958LL);
        }

        unint64_t v21 = *(void **)(a1 + 1104);
        if (v21)
        {
          nw_release(v21);
          *(void *)(a1 + 1104) = 0LL;
        }

        *(void *)(a1 + 1104) = nw_error_create_posix_error();
        quic_conn_drain(a1);
      }
    }
  }

void quic_conn_process_retry(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v129[2] = *(void **)MEMORY[0x1895F89C0];
  if (a2)
  {
    uint64_t v4 = (void *)(a1 + 1380);
    uint64_t v5 = *(void *)(a1 + 1380);
    if ((v5 & 1) != 0)
    {
      if (!qlog_debug_enabled
        && (qlog_nwlog_enabled & 1) == 0
        && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR)
        || !*(void *)(a1 + 1112))
      {
        return;
      }

      uint64_t v26 = _os_log_pack_size();
      __int128 v128 = &v126;
      int v27 = (char *)&v126 - ((MEMORY[0x1895F8858](v26, v26) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v28 = _os_log_pack_fill();
      uint64_t v127 = a1 + 976;
      unsigned __int16 v29 = *(unsigned __int8 **)(a1 + 1112);
      if (quic_cid_describe_state % 3 == 2) {
        unsigned __int8 v30 = &quic_cid_describe_cid_buf2;
      }
      else {
        unsigned __int8 v30 = &quic_cid_describe_cid_buf3;
      }
      if (quic_cid_describe_state % 3) {
        unsigned int v31 = v30;
      }
      else {
        unsigned int v31 = &quic_cid_describe_cid_buf1;
      }
      int v32 = ++quic_cid_describe_state;
      unsigned int v33 = v29[38];
      __int128 v34 = 0uLL;
      *(_OWORD *)((char *)v31 + 25) = 0u;
      if (v33 >= 0x14) {
        uint64_t v35 = 20LL;
      }
      else {
        uint64_t v35 = v33;
      }
      _OWORD *v31 = 0uLL;
      v31[1] = 0uLL;
      if ((_DWORD)v35)
      {
        int v36 = v29 + 39;
        do
        {
          int v37 = *v36++;
          snprintf((char *)v31, 0x29uLL, "%s%02x", (const char *)v31, v37);
          --v35;
        }

        while (v35);
        unsigned __int16 v29 = *(unsigned __int8 **)(a1 + 1112);
        int v32 = quic_cid_describe_state;
        __int128 v34 = 0uLL;
      }

      if (v32 % 3 == 2) {
        uint64_t v38 = &quic_cid_describe_cid_buf2;
      }
      else {
        uint64_t v38 = &quic_cid_describe_cid_buf3;
      }
      if (v32 % 3) {
        int v39 = v38;
      }
      else {
        int v39 = &quic_cid_describe_cid_buf1;
      }
      quic_cid_describe_unsigned int state = v32 + 1;
      if (v29[17] >= 0x14u) {
        uint64_t v40 = 20LL;
      }
      else {
        uint64_t v40 = v29[17];
      }
      *int v39 = v34;
      v39[1] = v34;
      *(_OWORD *)((char *)v39 + 25) = v34;
      if ((_DWORD)v40)
      {
        __int128 v41 = v29 + 18;
        do
        {
          int v42 = *v41++;
          snprintf((char *)v39, 0x29uLL, "%s%02x", (const char *)v39, v42);
          --v40;
        }

        while (v40);
      }

      *(_DWORD *)uint64_t v28 = 136446978;
      *(void *)(v28 + 4) = "quic_conn_process_retry";
      *(_WORD *)(v28 + 12) = 2082;
      *(void *)(v28 + 14) = v127;
      *(_WORD *)(v28 + 22) = 2082;
      *(void *)(v28 + 24) = v31;
      *(_WORD *)(v28 + 32) = 2082;
      *(void *)(v28 + 34) = v39;
      uint64_t v43 = (uint64_t)v27;
      uint64_t v44 = 2756LL;
    }

    else
    {
      unsigned int v7 = *(unsigned __int16 *)(a3 + 94);
      if (*(_WORD *)(a3 + 94))
      {
        if (v7 >= 0x3E9)
        {
          if ((qlog_debug_enabled
             || (qlog_nwlog_enabled & 1) != 0
             || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
            && *(void *)(a1 + 1112))
          {
            uint64_t v8 = _os_log_pack_size();
            unsigned int v9 = (char *)&v126 - ((MEMORY[0x1895F8858](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0LL);
            _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
            uint64_t v10 = _os_log_pack_fill();
            __int128 v128 = (uint64_t *)(a1 + 976);
            unsigned int v11 = *(unsigned __int8 **)(a1 + 1112);
            if (quic_cid_describe_state % 3 == 2) {
              __int128 v12 = &quic_cid_describe_cid_buf2;
            }
            else {
              __int128 v12 = &quic_cid_describe_cid_buf3;
            }
            if (quic_cid_describe_state % 3) {
              uint64_t v13 = v12;
            }
            else {
              uint64_t v13 = &quic_cid_describe_cid_buf1;
            }
            int v14 = ++quic_cid_describe_state;
            unsigned int v15 = v11[38];
            __int128 v16 = 0uLL;
            *(_OWORD *)((char *)v13 + 25) = 0u;
            if (v15 >= 0x14) {
              uint64_t v17 = 20LL;
            }
            else {
              uint64_t v17 = v15;
            }
            *uint64_t v13 = 0uLL;
            v13[1] = 0uLL;
            if ((_DWORD)v17)
            {
              uint64_t v18 = v11 + 39;
              do
              {
                int v19 = *v18++;
                snprintf((char *)v13, 0x29uLL, "%s%02x", (const char *)v13, v19);
                --v17;
              }

              while (v17);
              unsigned int v11 = *(unsigned __int8 **)(a1 + 1112);
              int v14 = quic_cid_describe_state;
              __int128 v16 = 0uLL;
            }

            if (v14 % 3 == 2) {
              int v20 = &quic_cid_describe_cid_buf2;
            }
            else {
              int v20 = &quic_cid_describe_cid_buf3;
            }
            if (v14 % 3) {
              unint64_t v21 = v20;
            }
            else {
              unint64_t v21 = &quic_cid_describe_cid_buf1;
            }
            quic_cid_describe_unsigned int state = v14 + 1;
            if (v11[17] >= 0x14u) {
              uint64_t v22 = 20LL;
            }
            else {
              uint64_t v22 = v11[17];
            }
            *unint64_t v21 = v16;
            v21[1] = v16;
            *(_OWORD *)((char *)v21 + 25) = v16;
            if ((_DWORD)v22)
            {
              uint64_t v23 = v11 + 18;
              do
              {
                int v24 = *v23++;
                snprintf((char *)v21, 0x29uLL, "%s%02x", (const char *)v21, v24);
                --v22;
              }

              while (v22);
            }

            int v25 = *(unsigned __int16 *)(a3 + 94);
            *(_DWORD *)uint64_t v10 = 136447234;
            *(void *)(v10 + 4) = "quic_conn_process_retry";
            *(_WORD *)(v10 + 12) = 2082;
            *(void *)(v10 + 14) = v128;
            *(_WORD *)(v10 + 22) = 2082;
            *(void *)(v10 + 24) = v13;
            *(_WORD *)(v10 + 32) = 2082;
            *(void *)(v10 + 34) = v21;
            *(_WORD *)(v10 + 42) = 1024;
            *(_DWORD *)(v10 + 44) = v25;
            qlog_internal(16, (uint64_t)v9, 2767LL);
          }

          return;
        }

        if (*(_BYTE *)(a1 + 477) == 6)
        {
          if ((v5 & 0x20) != 0)
          {
            if (!qlog_debug_enabled
              && (qlog_nwlog_enabled & 1) == 0
              && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR)
              || !*(void *)(a1 + 1112))
            {
              return;
            }

            uint64_t v105 = _os_log_pack_size();
            uint64_t v106 = (char *)&v126 - ((MEMORY[0x1895F8858](v105, v105) + 15) & 0xFFFFFFFFFFFFFFF0LL);
            _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
            uint64_t v107 = _os_log_pack_fill();
            uint64_t v108 = quic_cid_describe((unsigned __int8 *)(*(void *)(a1 + 1112) + 38LL));
            uint64_t v109 = quic_cid_describe((unsigned __int8 *)(*(void *)(a1 + 1112) + 17LL));
            *(_DWORD *)uint64_t v107 = 136446978;
            *(void *)(v107 + 4) = "quic_conn_process_retry";
            *(_WORD *)(v107 + 12) = 2082;
            *(void *)(v107 + 14) = a1 + 976;
            *(_WORD *)(v107 + 22) = 2082;
            *(void *)(v107 + 24) = v108;
            *(_WORD *)(v107 + 32) = 2082;
            *(void *)(v107 + 34) = v109;
            uint64_t v43 = (uint64_t)v106;
            uint64_t v44 = 2780LL;
          }

          else
          {
            uint64_t v63 = *(int **)a3;
            v129[0] = 0LL;
            char v64 = (unsigned __int8 *)(a3 + 40);
            size_t v65 = quic_crypto_build_pseudo_retry( (unsigned __int8 *)(a2 + 17),  v63,  (unsigned __int8 *)(a3 + 40),  (unsigned __int8 *)(a3 + 61),  *(const void **)(a3 + 96),  v7,  v129);
            if (quic_protector_open_retry((uint64_t)v129[0], v65, *(void *)(a3 + 16)))
            {
              if (v129[0])
              {
                free(v129[0]);
                v129[0] = 0LL;
              }

              int v66 = (unsigned __int8 *)(a2 + 38);
              unint64_t v67 = *v64;
              if (v67 >= 0x14) {
                unint64_t v67 = 20LL;
              }
              unint64_t v69 = v67 - 1;
              int v70 = (unsigned __int8 *)(a2 + 39);
              uint64_t v71 = (unsigned __int8 *)(a3 + 41);
              do
              {
                int v73 = *v71++;
                int v72 = v73;
                int v75 = *v70++;
                int v74 = v75;
                BOOL v77 = v69-- != 0;
              }

              while (v72 == v74 && v77);
              if (v72 == v74)
              {
LABEL_114:
                quic_fsm_conn_change(a1, 7u);
                *v4 |= 0x20uLL;
                *(_BYTE *)(a1 + 392) = *(_BYTE *)(a3 + 61);
                int v78 = *(_DWORD *)(a3 + 78);
                *(_OWORD *)(a1 + 393) = *(_OWORD *)(a3 + 62);
                *(_DWORD *)(a1 + 409) = v78;
                quic_path_assign_dcid(a2, a3 + 61, a1);
                quic_packet_builder_set_initial_token( *(void *)(a1 + 560),  *(unsigned __int16 *)(a3 + 94),  *(const void **)(a3 + 96));
                quic_recovery_reset_pn_space(*(void **)(a1 + 952), 1u);
                quic_recovery_reset_pn_space(*(void **)(a1 + 952), 2u);
                quic_cc_reset(*(void *)(a2 + 360));
                uint64_t v79 = *(void *)(a2 + 392);
                if (v79) {
                  quic_pacer_reset(v79);
                }
                if ((qlog_debug_enabled
                   || (qlog_nwlog_enabled & 1) != 0
                   || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))
                  && *(void *)(a1 + 1112))
                {
                  uint64_t v80 = _os_log_pack_size();
                  unsigned int v81 = (char *)&v126 - ((MEMORY[0x1895F8858](v80, v80) + 15) & 0xFFFFFFFFFFFFFFF0LL);
                  _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
                  uint64_t v82 = _os_log_pack_fill();
                  int v83 = quic_cid_describe((unsigned __int8 *)(*(void *)(a1 + 1112) + 38LL));
                  uint64_t v84 = quic_cid_describe((unsigned __int8 *)(*(void *)(a1 + 1112) + 17LL));
                  int v85 = *(unsigned __int16 *)(a3 + 94);
                  *(_DWORD *)uint64_t v82 = 136447234;
                  *(void *)(v82 + 4) = "quic_conn_process_retry";
                  *(_WORD *)(v82 + 12) = 2082;
                  *(void *)(v82 + 14) = a1 + 976;
                  *(_WORD *)(v82 + 22) = 2082;
                  *(void *)(v82 + 24) = v83;
                  *(_WORD *)(v82 + 32) = 2082;
                  *(void *)(v82 + 34) = v84;
                  *(_WORD *)(v82 + 42) = 1024;
                  *(_DWORD *)(v82 + 44) = v85;
                  qlog_internal(1, (uint64_t)v81, 2820LL);
                }

                v129[1] = (void *)-1LL;
                uint64_t flow_for_key = nw_protocol_instance_get_flow_for_key();
                nw_protocol_instance_access_flow_state();
                quic_crypto_tls_start(*(void *)a1, flow_for_key, *(_DWORD *)v4 & 1);
                quic_fsm_conn_change(a1, 6u);
              }

              else
              {
LABEL_175:
                if ((qlog_debug_enabled
                   || (qlog_nwlog_enabled & 1) != 0
                   || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
                  && *(void *)(a1 + 1112))
                {
                  uint64_t v115 = _os_log_pack_size();
                  int v116 = (char *)&v126 - ((MEMORY[0x1895F8858](v115, v115) + 15) & 0xFFFFFFFFFFFFFFF0LL);
                  _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
                  uint64_t v117 = _os_log_pack_fill();
                  uint64_t v118 = a1 + 976;
                  int v119 = quic_cid_describe((unsigned __int8 *)(*(void *)(a1 + 1112) + 38LL));
                  uint64_t v120 = quic_cid_describe((unsigned __int8 *)(*(void *)(a1 + 1112) + 17LL));
                  int v121 = quic_cid_describe(v64);
                  int v122 = quic_cid_describe(v66);
                  *(_DWORD *)uint64_t v117 = 136447490;
                  *(void *)(v117 + 4) = "quic_conn_process_retry";
                  *(_WORD *)(v117 + 12) = 2082;
                  *(void *)(v117 + 14) = v118;
                  *(_WORD *)(v117 + 22) = 2082;
                  *(void *)(v117 + 24) = v119;
                  *(_WORD *)(v117 + 32) = 2082;
                  *(void *)(v117 + 34) = v120;
                  *(_WORD *)(v117 + 42) = 2082;
                  *(void *)(v117 + 44) = v121;
                  *(_WORD *)(v117 + 52) = 2082;
                  *(void *)(v117 + 54) = v122;
                  qlog_internal(16, (uint64_t)v116, 2798LL);
                }
              }

              return;
            }

            if (!qlog_debug_enabled
              && (qlog_nwlog_enabled & 1) == 0
              && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR)
              || !*(void *)(a1 + 1112))
            {
              return;
            }

            uint64_t v110 = _os_log_pack_size();
            int v111 = (char *)&v126 - ((MEMORY[0x1895F8858](v110, v110) + 15) & 0xFFFFFFFFFFFFFFF0LL);
            _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
            uint64_t v112 = _os_log_pack_fill();
            __int128 v113 = quic_cid_describe((unsigned __int8 *)(*(void *)(a1 + 1112) + 38LL));
            uint64_t v114 = quic_cid_describe((unsigned __int8 *)(*(void *)(a1 + 1112) + 17LL));
            *(_DWORD *)uint64_t v112 = 136446978;
            *(void *)(v112 + 4) = "quic_conn_process_retry";
            *(_WORD *)(v112 + 12) = 2082;
            *(void *)(v112 + 14) = a1 + 976;
            *(_WORD *)(v112 + 22) = 2082;
            *(void *)(v112 + 24) = v113;
            *(_WORD *)(v112 + 32) = 2082;
            *(void *)(v112 + 34) = v114;
            uint64_t v43 = (uint64_t)v111;
            uint64_t v44 = 2790LL;
          }
        }

        else
        {
          if (!qlog_debug_enabled
            && (qlog_nwlog_enabled & 1) == 0
            && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR)
            || !*(void *)(a1 + 1112))
          {
            return;
          }

          uint64_t v87 = _os_log_pack_size();
          __int128 v128 = &v126;
          int v88 = (char *)&v126 - ((MEMORY[0x1895F8858](v87, v87) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          uint64_t v89 = _os_log_pack_fill();
          uint64_t v127 = a1 + 976;
          int v90 = *(unsigned __int8 **)(a1 + 1112);
          if (quic_cid_describe_state % 3 == 2) {
            uint64_t v91 = &quic_cid_describe_cid_buf2;
          }
          else {
            uint64_t v91 = &quic_cid_describe_cid_buf3;
          }
          if (quic_cid_describe_state % 3) {
            int v92 = v91;
          }
          else {
            int v92 = &quic_cid_describe_cid_buf1;
          }
          int v93 = ++quic_cid_describe_state;
          unsigned int v94 = v90[38];
          __int128 v95 = 0uLL;
          *(_OWORD *)((char *)v92 + 25) = 0u;
          if (v94 >= 0x14) {
            uint64_t v96 = 20LL;
          }
          else {
            uint64_t v96 = v94;
          }
          *int v92 = 0uLL;
          v92[1] = 0uLL;
          if ((_DWORD)v96)
          {
            uint64_t v97 = v90 + 39;
            do
            {
              int v98 = *v97++;
              snprintf((char *)v92, 0x29uLL, "%s%02x", (const char *)v92, v98);
              --v96;
            }

            while (v96);
            int v90 = *(unsigned __int8 **)(a1 + 1112);
            int v93 = quic_cid_describe_state;
            __int128 v95 = 0uLL;
          }

          if (v93 % 3 == 2) {
            uint64_t v99 = &quic_cid_describe_cid_buf2;
          }
          else {
            uint64_t v99 = &quic_cid_describe_cid_buf3;
          }
          if (v93 % 3) {
            uint64_t v100 = v99;
          }
          else {
            uint64_t v100 = &quic_cid_describe_cid_buf1;
          }
          quic_cid_describe_unsigned int state = v93 + 1;
          if (v90[17] >= 0x14u) {
            uint64_t v101 = 20LL;
          }
          else {
            uint64_t v101 = v90[17];
          }
          *uint64_t v100 = v95;
          v100[1] = v95;
          *(_OWORD *)((char *)v100 + 25) = v95;
          if ((_DWORD)v101)
          {
            uint64_t v102 = v90 + 18;
            do
            {
              int v103 = *v102++;
              snprintf((char *)v100, 0x29uLL, "%s%02x", (const char *)v100, v103);
              --v101;
            }

            while (v101);
          }

          int v104 = *(unsigned __int8 *)(a1 + 477);
          *(_DWORD *)uint64_t v89 = 136447234;
          *(void *)(v89 + 4) = "quic_conn_process_retry";
          *(_WORD *)(v89 + 12) = 2082;
          *(void *)(v89 + 14) = v127;
          *(_WORD *)(v89 + 22) = 2082;
          *(void *)(v89 + 24) = v92;
          *(_WORD *)(v89 + 32) = 2082;
          *(void *)(v89 + 34) = v100;
          *(_WORD *)(v89 + 42) = 1024;
          *(_DWORD *)(v89 + 44) = v104;
          uint64_t v43 = (uint64_t)v88;
          uint64_t v44 = 2771LL;
        }
      }

      else
      {
        if (!qlog_debug_enabled
          && (qlog_nwlog_enabled & 1) == 0
          && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR)
          || !*(void *)(a1 + 1112))
        {
          return;
        }

        uint64_t v45 = _os_log_pack_size();
        __int128 v128 = &v126;
        uint64_t v46 = (char *)&v126 - ((MEMORY[0x1895F8858](v45, v45) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v47 = _os_log_pack_fill();
        uint64_t v127 = a1 + 976;
        uint64_t v48 = *(unsigned __int8 **)(a1 + 1112);
        if (quic_cid_describe_state % 3 == 2) {
          uint64_t v49 = &quic_cid_describe_cid_buf2;
        }
        else {
          uint64_t v49 = &quic_cid_describe_cid_buf3;
        }
        if (quic_cid_describe_state % 3) {
          int v50 = v49;
        }
        else {
          int v50 = &quic_cid_describe_cid_buf1;
        }
        int v51 = ++quic_cid_describe_state;
        unsigned int v52 = v48[38];
        __int128 v53 = 0uLL;
        *(_OWORD *)((char *)v50 + 25) = 0u;
        if (v52 >= 0x14) {
          uint64_t v54 = 20LL;
        }
        else {
          uint64_t v54 = v52;
        }
        _OWORD *v50 = 0uLL;
        v50[1] = 0uLL;
        if ((_DWORD)v54)
        {
          uint64_t v55 = v48 + 39;
          do
          {
            int v56 = *v55++;
            snprintf((char *)v50, 0x29uLL, "%s%02x", (const char *)v50, v56);
            --v54;
          }

          while (v54);
          uint64_t v48 = *(unsigned __int8 **)(a1 + 1112);
          int v51 = quic_cid_describe_state;
          __int128 v53 = 0uLL;
        }

        if (v51 % 3 == 2) {
          int v57 = &quic_cid_describe_cid_buf2;
        }
        else {
          int v57 = &quic_cid_describe_cid_buf3;
        }
        if (v51 % 3) {
          BOOL v58 = v57;
        }
        else {
          BOOL v58 = &quic_cid_describe_cid_buf1;
        }
        quic_cid_describe_unsigned int state = v51 + 1;
        if (v48[17] >= 0x14u) {
          uint64_t v59 = 20LL;
        }
        else {
          uint64_t v59 = v48[17];
        }
        *BOOL v58 = v53;
        v58[1] = v53;
        *(_OWORD *)((char *)v58 + 25) = v53;
        if ((_DWORD)v59)
        {
          unsigned int v60 = v48 + 18;
          do
          {
            int v61 = *v60++;
            snprintf((char *)v58, 0x29uLL, "%s%02x", (const char *)v58, v61);
            --v59;
          }

          while (v59);
        }

        *(_DWORD *)uint64_t v47 = 136446978;
        *(void *)(v47 + 4) = "quic_conn_process_retry";
        *(_WORD *)(v47 + 12) = 2082;
        *(void *)(v47 + 14) = v127;
        *(_WORD *)(v47 + 22) = 2082;
        *(void *)(v47 + 24) = v50;
        *(_WORD *)(v47 + 32) = 2082;
        *(void *)(v47 + 34) = v58;
        uint64_t v43 = (uint64_t)v46;
        uint64_t v44 = 2761LL;
      }
    }

    qlog_internal(16, v43, v44);
    return;
  }

  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    uint64_t v123 = _os_log_pack_size();
    int v124 = (char *)&v126 - ((MEMORY[0x1895F8858](v123, v123) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v125 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v125 = 136446210;
    *(void *)(v125 + 4) = "quic_conn_process_retry";
    qlog_internal(17, (uint64_t)v124, 2750LL);
  }

BOOL quic_conn_process_sh(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  LODWORD(v6) = *(unsigned __int8 *)(a2 + 82);
  if ((_DWORD)v6 != *(unsigned __int8 *)(a1 + 600))
  {
    if ((qlog_debug_enabled
       || (qlog_nwlog_enabled & 1) != 0
       || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEFAULT))
      && *(void *)(a1 + 1112))
    {
      uint64_t v7 = _os_log_pack_size();
      uint64_t v44 = &v42;
      uint64_t v6 = (char *)&v42 - ((MEMORY[0x1895F8858](v7, v7) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v8 = _os_log_pack_fill();
      unsigned int v9 = *(unsigned __int8 **)(a1 + 1112);
      if (quic_cid_describe_state % 3 == 2) {
        uint64_t v10 = &quic_cid_describe_cid_buf2;
      }
      else {
        uint64_t v10 = &quic_cid_describe_cid_buf3;
      }
      if (quic_cid_describe_state % 3) {
        unsigned int v11 = v10;
      }
      else {
        unsigned int v11 = &quic_cid_describe_cid_buf1;
      }
      int v12 = ++quic_cid_describe_state;
      unsigned int v13 = v9[38];
      __int128 v14 = 0uLL;
      *(_OWORD *)((char *)v11 + 25) = 0u;
      if (v13 >= 0x14) {
        uint64_t v15 = 20LL;
      }
      else {
        uint64_t v15 = v13;
      }
      _OWORD *v11 = 0uLL;
      v11[1] = 0uLL;
      if ((_DWORD)v15)
      {
        __int128 v16 = v9 + 39;
        do
        {
          int v17 = *v16++;
          snprintf((char *)v11, 0x29uLL, "%s%02x", (const char *)v11, v17);
          --v15;
        }

        while (v15);
        unsigned int v9 = *(unsigned __int8 **)(a1 + 1112);
        int v12 = quic_cid_describe_state;
        __int128 v14 = 0uLL;
      }

      uint64_t v43 = a1 + 976;
      if (v12 % 3 == 2) {
        uint64_t v18 = &quic_cid_describe_cid_buf2;
      }
      else {
        uint64_t v18 = &quic_cid_describe_cid_buf3;
      }
      if (v12 % 3) {
        int v19 = v18;
      }
      else {
        int v19 = &quic_cid_describe_cid_buf1;
      }
      quic_cid_describe_unsigned int state = v12 + 1;
      if (v9[17] >= 0x14u) {
        uint64_t v20 = 20LL;
      }
      else {
        uint64_t v20 = v9[17];
      }
      _OWORD *v19 = v14;
      v19[1] = v14;
      *(_OWORD *)((char *)v19 + 25) = v14;
      if ((_DWORD)v20)
      {
        unint64_t v21 = v9 + 18;
        do
        {
          int v22 = *v21++;
          snprintf((char *)v19, 0x29uLL, "%s%02x", (const char *)v19, v22);
          --v20;
        }

        while (v20);
      }

      else {
        uint64_t v23 = off_18A1184D8[(*(_BYTE *)(a2 + 82) - 1)];
      }
      *(_DWORD *)uint64_t v8 = 136447234;
      *(void *)(v8 + 4) = "quic_conn_process_sh";
      *(_WORD *)(v8 + 12) = 2082;
      *(void *)(v8 + 14) = v43;
      *(_WORD *)(v8 + 22) = 2082;
      *(void *)(v8 + 24) = v11;
      *(_WORD *)(v8 + 32) = 2082;
      *(void *)(v8 + 34) = v19;
      *(_WORD *)(v8 + 42) = 2082;
      *(void *)(v8 + 44) = v23;
      qlog_internal(0, (uint64_t)v6, 3241LL);
      LOBYTE(v6) = *(_BYTE *)(a2 + 82);
    }

    *(_BYTE *)(a1 + 600) = (_BYTE)v6;
  }

  quic_ack_append(*(char **)(a1 + 960), *(unsigned __int8 *)(a2 + 83), *(void *)(a2 + 224), *(void *)(a2 + 112));
  uint64_t v24 = *(void *)(a1 + 1312);
  if (v24) {
    ++*(void *)(v24 + 184);
  }
  ++*(void *)(a1 + 1144);
  *(void *)(a1 + 1152) += *(unsigned __int16 *)(a2 + 90);
  unint64_t v25 = *(unsigned __int8 *)(a2 + 40);
  if ((_DWORD)v25 == *(unsigned __int8 *)(a3 + 38))
  {
    if (v25 >= 0x14) {
      unint64_t v25 = 20LL;
    }
    unint64_t v27 = v25 - 1;
    uint64_t v28 = (unsigned __int8 *)(a3 + 39);
    unsigned __int16 v29 = (unsigned __int8 *)(a2 + 41);
    do
    {
      int v31 = *v29++;
      int v30 = v31;
      int v33 = *v28++;
      int v32 = v33;
      BOOL v35 = v27-- != 0;
    }

    while (v30 == v32 && v35);
    if (v30 == v32) {
      goto LABEL_53;
    }
  }

  BOOL result = quic_conn_unknown_dcid(a1, a3, (unsigned __int8 *)(a2 + 40));
  if (result)
  {
LABEL_53:
    largest_uint64_t pn = quic_ack_get_largest_pn(*(char **)(a1 + 960), 3, *(void *)(a2 + 224));
    uint64_t v38 = *(void *)(a1 + 1380);
    if ((v38 & 0x40) != 0 && *(void *)(a2 + 112) > largest_pn)
    {
      unsigned int v39 = *(_DWORD *)(a2 + 232);
      uint64_t v40 = (_WORD *)(a3 + 431);
      if ((v38 & 1) != 0) {
        int v41 = *v40 & 0xFFDF | (32 * ((v39 >> 11) & 1));
      }
      else {
        int v41 = (*v40 & 0xFFDF | (32 * ((v39 >> 11) & 1))) ^ 0x20;
      }
      _WORD *v40 = v41;
    }

    return 1LL;
  }

  return result;
}

uint64_t quic_conn_process_lh(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v99 = *MEMORY[0x1895F89C0];
  uint64_t v5 = *(_BYTE **)a3;
  switch(*(_BYTE *)(a1 + 477))
  {
    case 0:
    case 0xC:
      if (qlog_debug_enabled
        || (qlog_nwlog_enabled & 1) != 0
        || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
      {
        uint64_t v7 = _os_log_pack_size();
        uint64_t v8 = (char *)&v96 - ((MEMORY[0x1895F8858](v7, v7) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v9 = _os_log_pack_fill();
        int v10 = *(unsigned __int8 *)(a1 + 477);
        *(_DWORD *)uint64_t v9 = 136446466;
        *(void *)(v9 + 4) = "quic_conn_process_lh";
        *(_WORD *)(v9 + 12) = 1024;
        *(_DWORD *)(v9 + 14) = v10;
        qlog_internal(17, (uint64_t)v8, 3138LL);
      }

      goto LABEL_130;
    case 1:
      if ((*(_BYTE *)(a1 + 1380) & 1) == 0)
      {
        if (qlog_debug_enabled
          || (qlog_nwlog_enabled & 1) != 0
          || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
        {
          uint64_t v11 = _os_log_pack_size();
          int v12 = (char *)&v96 - ((MEMORY[0x1895F8858](v11, v11) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          uint64_t v13 = _os_log_pack_fill();
          *(_DWORD *)uint64_t v13 = 136446210;
          *(void *)(v13 + 4) = "quic_conn_process_lh";
          qlog_internal(17, (uint64_t)v12, 3024LL);
        }

        goto LABEL_11;
      }

      if ((*v5 & 0x30) == 0)
      {
        unsigned int v88 = *(_DWORD *)(a3 + 108);
        *(_DWORD *)(a1 + 524) = v88;
        quic_packet_builder_set_version(*(void *)(a1 + 560), v88);
        quic_fsm_conn_change(a1, 4u);
        *(_BYTE *)(a1 + 600) = 2;
        goto LABEL_130;
      }

      if (!qlog_debug_enabled
        && (qlog_nwlog_enabled & 1) == 0
        && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR)
        || !*(void *)(a1 + 1112))
      {
        goto LABEL_115;
      }

      uint64_t v58 = _os_log_pack_size();
      uint64_t v97 = &v96;
      uint64_t v59 = (char *)&v96 - ((MEMORY[0x1895F8858](v58, v58) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v60 = _os_log_pack_fill();
      uint64_t v96 = a1 + 976;
      int v61 = *(unsigned __int8 **)(a1 + 1112);
      if (quic_cid_describe_state % 3 == 2) {
        uint64_t v62 = &quic_cid_describe_cid_buf2;
      }
      else {
        uint64_t v62 = &quic_cid_describe_cid_buf3;
      }
      if (quic_cid_describe_state % 3) {
        uint64_t v63 = v62;
      }
      else {
        uint64_t v63 = &quic_cid_describe_cid_buf1;
      }
      int v64 = ++quic_cid_describe_state;
      unsigned int v65 = v61[38];
      __int128 v66 = 0uLL;
      *(_OWORD *)((char *)v63 + 25) = 0u;
      if (v65 >= 0x14) {
        uint64_t v67 = 20LL;
      }
      else {
        uint64_t v67 = v65;
      }
      *uint64_t v63 = 0uLL;
      v63[1] = 0uLL;
      if ((_DWORD)v67)
      {
        uint64_t v68 = v61 + 39;
        do
        {
          int v69 = *v68++;
          snprintf((char *)v63, 0x29uLL, "%s%02x", (const char *)v63, v69);
          --v67;
        }

        while (v67);
        int v61 = *(unsigned __int8 **)(a1 + 1112);
        int v64 = quic_cid_describe_state;
        __int128 v66 = 0uLL;
      }

      if (v64 % 3 == 2) {
        int v70 = &quic_cid_describe_cid_buf2;
      }
      else {
        int v70 = &quic_cid_describe_cid_buf3;
      }
      if (v64 % 3) {
        uint64_t v71 = v70;
      }
      else {
        uint64_t v71 = &quic_cid_describe_cid_buf1;
      }
      quic_cid_describe_unsigned int state = v64 + 1;
      if (v61[17] >= 0x14u) {
        uint64_t v72 = 20LL;
      }
      else {
        uint64_t v72 = v61[17];
      }
      *uint64_t v71 = v66;
      v71[1] = v66;
      *(_OWORD *)((char *)v71 + 25) = v66;
      if ((_DWORD)v72)
      {
        int v73 = v61 + 18;
        do
        {
          int v74 = *v73++;
          snprintf((char *)v71, 0x29uLL, "%s%02x", (const char *)v71, v74);
          --v72;
        }

        while (v72);
      }

      *(_DWORD *)uint64_t v60 = 136446978;
      *(void *)(v60 + 4) = "quic_conn_process_lh";
      *(_WORD *)(v60 + 12) = 2082;
      *(void *)(v60 + 14) = v96;
      *(_WORD *)(v60 + 22) = 2082;
      *(void *)(v60 + 24) = v63;
      *(_WORD *)(v60 + 32) = 2082;
      *(void *)(v60 + 34) = v71;
      uint64_t v32 = (uint64_t)v59;
      uint64_t v33 = 3030LL;
      goto LABEL_114;
    case 2:
      if ((*v5 & 0x30) != 0)
      {
        if ((qlog_debug_enabled
           || (qlog_nwlog_enabled & 1) != 0
           || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
          && *(void *)(a1 + 1112))
        {
          uint64_t v15 = _os_log_pack_size();
          uint64_t v97 = &v96;
          __int128 v16 = (char *)&v96 - ((MEMORY[0x1895F8858](v15, v15) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          uint64_t v17 = _os_log_pack_fill();
          uint64_t v96 = a1 + 976;
          uint64_t v18 = *(unsigned __int8 **)(a1 + 1112);
          if (quic_cid_describe_state % 3 == 2) {
            int v19 = &quic_cid_describe_cid_buf2;
          }
          else {
            int v19 = &quic_cid_describe_cid_buf3;
          }
          if (quic_cid_describe_state % 3) {
            uint64_t v20 = v19;
          }
          else {
            uint64_t v20 = &quic_cid_describe_cid_buf1;
          }
          int v21 = ++quic_cid_describe_state;
          unsigned int v22 = v18[38];
          __int128 v23 = 0uLL;
          *(_OWORD *)((char *)v20 + 25) = 0u;
          if (v22 >= 0x14) {
            uint64_t v24 = 20LL;
          }
          else {
            uint64_t v24 = v22;
          }
          *uint64_t v20 = 0uLL;
          v20[1] = 0uLL;
          if ((_DWORD)v24)
          {
            unint64_t v25 = v18 + 39;
            do
            {
              int v26 = *v25++;
              snprintf((char *)v20, 0x29uLL, "%s%02x", (const char *)v20, v26);
              --v24;
            }

            while (v24);
            uint64_t v18 = *(unsigned __int8 **)(a1 + 1112);
            int v21 = quic_cid_describe_state;
            __int128 v23 = 0uLL;
          }

          if (v21 % 3 == 2) {
            unint64_t v27 = &quic_cid_describe_cid_buf2;
          }
          else {
            unint64_t v27 = &quic_cid_describe_cid_buf3;
          }
          if (v21 % 3) {
            uint64_t v28 = v27;
          }
          else {
            uint64_t v28 = &quic_cid_describe_cid_buf1;
          }
          quic_cid_describe_unsigned int state = v21 + 1;
          if (v18[17] >= 0x14u) {
            uint64_t v29 = 20LL;
          }
          else {
            uint64_t v29 = v18[17];
          }
          _OWORD *v28 = v23;
          v28[1] = v23;
          *(_OWORD *)((char *)v28 + 25) = v23;
          if ((_DWORD)v29)
          {
            int v30 = v18 + 18;
            do
            {
              int v31 = *v30++;
              snprintf((char *)v28, 0x29uLL, "%s%02x", (const char *)v28, v31);
              --v29;
            }

            while (v29);
          }

          *(_DWORD *)uint64_t v17 = 136446978;
          *(void *)(v17 + 4) = "quic_conn_process_lh";
          *(_WORD *)(v17 + 12) = 2082;
          *(void *)(v17 + 14) = v96;
          *(_WORD *)(v17 + 22) = 2082;
          *(void *)(v17 + 24) = v20;
          *(_WORD *)(v17 + 32) = 2082;
          *(void *)(v17 + 34) = v28;
          uint64_t v32 = (uint64_t)v16;
          uint64_t v33 = 3073LL;
LABEL_114:
          qlog_internal(16, v32, v33);
        }

        goto LABEL_115;
      }

      unsigned int v75 = *(_DWORD *)(a3 + 108);
      if (v75 == *(_DWORD *)(a1 + 1376))
      {
        *(_DWORD *)(a1 + 524) = v75;
        quic_packet_builder_set_version(*(void *)(a1 + 560), v75);
        quic_fsm_conn_change(a1, 4u);
        *(_BYTE *)(a1 + 600) = 2;
        if ((qlog_debug_enabled
           || (qlog_nwlog_enabled & 1) != 0
           || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEFAULT))
          && *(void *)(a1 + 1112))
        {
          uint64_t v76 = _os_log_pack_size();
          uint64_t v97 = &v96;
          BOOL v77 = (char *)&v96 - ((MEMORY[0x1895F8858](v76, v76) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          uint64_t v78 = _os_log_pack_fill();
          uint64_t v79 = quic_cid_describe((unsigned __int8 *)(*(void *)(a1 + 1112) + 38LL));
          uint64_t v80 = quic_cid_describe((unsigned __int8 *)(*(void *)(a1 + 1112) + 17LL));
          unsigned int v81 = quic_cid_describe((unsigned __int8 *)(a3 + 40));
          *(_DWORD *)uint64_t v78 = 136447234;
          *(void *)(v78 + 4) = "quic_conn_process_lh";
          *(_WORD *)(v78 + 12) = 2082;
          *(void *)(v78 + 14) = a1 + 976;
          *(_WORD *)(v78 + 22) = 2082;
          *(void *)(v78 + 24) = v79;
          *(_WORD *)(v78 + 32) = 2082;
          *(void *)(v78 + 34) = v80;
          *(_WORD *)(v78 + 42) = 2082;
          *(void *)(v78 + 44) = v81;
          qlog_internal(0, (uint64_t)v77, 3085LL);
        }

        quic_path_set_scid(a2, a3 + 40, a1);
        if ((qlog_debug_enabled
           || (qlog_nwlog_enabled & 1) != 0
           || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEFAULT))
          && *(void *)(a1 + 1112))
        {
          uint64_t v82 = _os_log_pack_size();
          uint64_t v97 = &v96;
          int v83 = (char *)&v96 - ((MEMORY[0x1895F8858](v82, v82) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          uint64_t v84 = _os_log_pack_fill();
          int v85 = quic_cid_describe((unsigned __int8 *)(*(void *)(a1 + 1112) + 38LL));
          uint64_t v86 = quic_cid_describe((unsigned __int8 *)(*(void *)(a1 + 1112) + 17LL));
          uint64_t v87 = quic_cid_describe((unsigned __int8 *)(a3 + 61));
          *(_DWORD *)uint64_t v84 = 136447234;
          *(void *)(v84 + 4) = "quic_conn_process_lh";
          *(_WORD *)(v84 + 12) = 2082;
          *(void *)(v84 + 14) = a1 + 976;
          *(_WORD *)(v84 + 22) = 2082;
          *(void *)(v84 + 24) = v85;
          *(_WORD *)(v84 + 32) = 2082;
          *(void *)(v84 + 34) = v86;
          *(_WORD *)(v84 + 42) = 2082;
          *(void *)(v84 + 44) = v87;
          qlog_internal(0, (uint64_t)v83, 3088LL);
        }

        quic_path_assign_dcid(a2, a3 + 61, a1);
        quic_protector_derive_initial_secrets(*(void *)(a1 + 568), (unsigned __int8 *)(a3 + 40));
        goto LABEL_130;
      }

      if ((qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
        && *(void *)(a1 + 1112))
      {
        uint64_t v91 = _os_log_pack_size();
        int v92 = (char *)&v96 - ((MEMORY[0x1895F8858](v91, v91) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v93 = _os_log_pack_fill();
        unsigned int v94 = quic_cid_describe((unsigned __int8 *)(*(void *)(a1 + 1112) + 38LL));
        __int128 v95 = quic_cid_describe((unsigned __int8 *)(*(void *)(a1 + 1112) + 17LL));
        *(_DWORD *)uint64_t v93 = 136446978;
        *(void *)(v93 + 4) = "quic_conn_process_lh";
        *(_WORD *)(v93 + 12) = 2082;
        *(void *)(v93 + 14) = a1 + 976;
        *(_WORD *)(v93 + 22) = 2082;
        *(void *)(v93 + 24) = v94;
        *(_WORD *)(v93 + 32) = 2082;
        *(void *)(v93 + 34) = v95;
        qlog_internal(16, (uint64_t)v92, 3095LL);
      }

LABEL_115:
        uint64_t result = 0LL;
        *(void *)(a1 + 1072) = 10LL;
      }

      else
      {
        quic_fsm_conn_change(a1, 8u);
        *(_BYTE *)(a1 + 600) = 2;
        quic_path_assign_dcid(a2, a3 + 61, a1);
LABEL_130:
        uint64_t v89 = *(void *)(a1 + 1380);
        if ((v89 & 0x800) == 0 && (*v5 & 0x30) == 0x20)
        {
          *(void *)(a1 + 1380) = v89 | 0x800;
          if ((v89 & 0x401) == 1) {
            quic_conn_discard_initial_keys(a1);
          }
        }

        quic_ack_append( *(char **)(a1 + 960),  *(unsigned __int8 *)(a3 + 83),  *(void *)(a3 + 224),  *(void *)(a3 + 112));
        uint64_t v90 = *(void *)(a1 + 1312);
        if (v90) {
          ++*(void *)(v90 + 184);
        }
        ++*(void *)(a1 + 1144);
        *(void *)(a1 + 1152) += *(unsigned __int16 *)(a3 + 90);
        uint64_t result = 1LL;
      }

      break;
    default:
      goto LABEL_130;
  }

  return result;
}

uint64_t quic_conn_process_frame(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  v42[1] = *MEMORY[0x1895F89C0];
  int v10 = *(unsigned __int8 *)(a2 + 82);
  if (v10 == 3)
  {
    unint64_t v11 = *a3;
    if ((unint64_t)*a3 <= 0x1E && ((1LL << *a3) & 0x4A0000C4) != 0)
    {
      if ((qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
        && *(void *)(a1 + 1112))
      {
        uint64_t v13 = _os_log_pack_size();
        __int128 v14 = (char *)v42 - ((MEMORY[0x1895F8858](v13, v13) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v15 = _os_log_pack_fill();
        v42[0] = a1 + 976;
        __int128 v16 = *(unsigned __int8 **)(a1 + 1112);
        if (quic_cid_describe_state % 3 == 2) {
          uint64_t v17 = &quic_cid_describe_cid_buf2;
        }
        else {
          uint64_t v17 = &quic_cid_describe_cid_buf3;
        }
        if (quic_cid_describe_state % 3) {
          uint64_t v18 = v17;
        }
        else {
          uint64_t v18 = &quic_cid_describe_cid_buf1;
        }
        int v19 = ++quic_cid_describe_state;
        unsigned int v20 = v16[38];
        __int128 v21 = 0uLL;
        *(_OWORD *)((char *)v18 + 25) = 0u;
        if (v20 >= 0x14) {
          uint64_t v22 = 20LL;
        }
        else {
          uint64_t v22 = v20;
        }
        *uint64_t v18 = 0uLL;
        v18[1] = 0uLL;
        if ((_DWORD)v22)
        {
          __int128 v23 = v16 + 39;
          do
          {
            int v24 = *v23++;
            snprintf((char *)v18, 0x29uLL, "%s%02x", (const char *)v18, v24);
            --v22;
          }

          while (v22);
          __int128 v16 = *(unsigned __int8 **)(a1 + 1112);
          int v19 = quic_cid_describe_state;
          __int128 v21 = 0uLL;
        }

        if (v19 % 3 == 2) {
          unint64_t v25 = &quic_cid_describe_cid_buf2;
        }
        else {
          unint64_t v25 = &quic_cid_describe_cid_buf3;
        }
        if (v19 % 3) {
          int v26 = v25;
        }
        else {
          int v26 = &quic_cid_describe_cid_buf1;
        }
        quic_cid_describe_unsigned int state = v19 + 1;
        if (v16[17] >= 0x14u) {
          uint64_t v27 = 20LL;
        }
        else {
          uint64_t v27 = v16[17];
        }
        _OWORD *v26 = v21;
        v26[1] = v21;
        *(_OWORD *)((char *)v26 + 25) = v21;
        if ((_DWORD)v27)
        {
          uint64_t v28 = v16 + 18;
          do
          {
            int v29 = *v28++;
            snprintf((char *)v26, 0x29uLL, "%s%02x", (const char *)v26, v29);
            --v27;
          }

          while (v27);
        }

        int v30 = quic_frame_type_describe(*a3);
        *(_DWORD *)uint64_t v15 = 136447234;
        *(void *)(v15 + 4) = "quic_conn_process_frame";
        *(_WORD *)(v15 + 12) = 2082;
        *(void *)(v15 + 14) = v42[0];
        *(_WORD *)(v15 + 22) = 2082;
        *(void *)(v15 + 24) = v18;
        *(_WORD *)(v15 + 32) = 2082;
        *(void *)(v15 + 34) = v26;
        *(_WORD *)(v15 + 42) = 2082;
        *(void *)(v15 + 44) = v30;
        qlog_internal(16, (uint64_t)v14, 3283LL);
        unint64_t v11 = *a3;
      }

      uint64_t result = 0LL;
      *(void *)(a1 + 1072) = 10LL;
      *(void *)(a1 + 1064) = v11;
      uint64_t v32 = "invalid frame type in 0-RTT";
LABEL_37:
      *(void *)(a1 + 1080) = v32;
      return result;
    }
  }

  else
  {
    unint64_t v11 = *a3;
    if ((v10 - 1) <= 1 && (v11 > 0x1C || ((1LL << v11) & 0x1000004F) == 0))
    {
      if ((qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
        && *(void *)(a1 + 1112))
      {
        uint64_t v36 = _os_log_pack_size();
        int v37 = (char *)v42 - ((MEMORY[0x1895F8858](v36, v36) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v38 = _os_log_pack_fill();
        uint64_t v39 = quic_cid_describe((unsigned __int8 *)(*(void *)(a1 + 1112) + 38LL));
        uint64_t v40 = quic_cid_describe((unsigned __int8 *)(*(void *)(a1 + 1112) + 17LL));
        int v41 = quic_frame_type_describe(*a3);
        *(_DWORD *)uint64_t v38 = 136447234;
        *(void *)(v38 + 4) = "quic_conn_process_frame";
        *(_WORD *)(v38 + 12) = 2082;
        *(void *)(v38 + 14) = a1 + 976;
        *(_WORD *)(v38 + 22) = 2082;
        *(void *)(v38 + 24) = v39;
        *(_WORD *)(v38 + 32) = 2082;
        *(void *)(v38 + 34) = v40;
        *(_WORD *)(v38 + 42) = 2082;
        *(void *)(v38 + 44) = v41;
        qlog_internal(16, (uint64_t)v37, 3295LL);
        unint64_t v11 = *a3;
      }

      uint64_t result = 0LL;
      *(void *)(a1 + 1072) = 10LL;
      *(void *)(a1 + 1064) = v11;
      uint64_t v32 = "invalid frame type during the handshake";
      goto LABEL_37;
    }
  }

  if (v11 <= 0xBAB9FF) {
    unint64_t v34 = v11;
  }
  else {
    unint64_t v34 = v11 - 12237272;
  }
  else {
    unint64_t v35 = *a3 - 12237272;
  }
  uint64_t result = quic_frame_is_type_index_valid(v35, *a3);
  if ((_DWORD)result)
  {
    *(void *)(a1 + 1064) = *a3;
    uint64_t result = ((uint64_t (*)(uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t))quic_frames[6 * v35 + 1])( a3,  a2,  a1,  a4,  a5);
    if (!*(void *)(a1 + 1072)) {
      *(void *)(a1 + 1064) = 0LL;
    }
  }

  return result;
}

void quic_conn_migrate_to_path(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v93 = *MEMORY[0x1895F89C0];
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 1112);
    uint64_t v7 = (unsigned __int8 *)(a2 + 17);
    __int16 v8 = *(_WORD *)(a2 + 431);
    if (*(_BYTE *)(a2 + 17)) {
      BOOL v9 = (v8 & 0x800) == 0;
    }
    else {
      BOOL v9 = 0;
    }
    if (!v9)
    {
LABEL_9:
      *(void *)(a1 + 1112) = a2;
      *((_WORD *)v7 + 207) = *(_BYTE *)(a1 + 1381) & 0x20 | *((_WORD *)v7 + 207) & 0xFFDF;
      quic_conn_set_mss(a1, a2, *(unsigned __int16 *)(a1 + 596));
      uint64_t v11 = *(void *)(a2 + 392);
      if (v11) {
        quic_pacer_reset(v11);
      }
      int v12 = (void *)(a1 + 1380);
      quic_recovery_reset_timer(*(void *)(a1 + 952));
      quic_conn_setup_pmtud(a1, a2, *MEMORY[0x189608EB8], 0);
      uint64_t v13 = &unk_18C6EB000;
      __int128 v14 = &unk_18C6EB000;
      if ((v8 & 0x100) != 0)
      {
        if (((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1
           || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEFAULT))
          && *(void *)(a1 + 1112))
        {
          int v91 = a3;
          uint64_t v34 = _os_log_pack_size();
          uint64_t v90 = &v88;
          unint64_t v35 = (char *)&v88 - ((MEMORY[0x1895F8858](v34, v34) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          uint64_t v36 = _os_log_pack_fill();
          uint64_t v89 = a1 + 976;
          int v37 = *(unsigned __int8 **)(a1 + 1112);
          if (quic_cid_describe_state % 3 == 2) {
            uint64_t v38 = &quic_cid_describe_cid_buf2;
          }
          else {
            uint64_t v38 = &quic_cid_describe_cid_buf3;
          }
          if (quic_cid_describe_state % 3) {
            uint64_t v39 = v38;
          }
          else {
            uint64_t v39 = &quic_cid_describe_cid_buf1;
          }
          int v40 = ++quic_cid_describe_state;
          unsigned int v41 = v37[38];
          __int128 v42 = 0uLL;
          *(_OWORD *)((char *)v39 + 25) = 0u;
          if (v41 >= 0x14) {
            uint64_t v43 = 20LL;
          }
          else {
            uint64_t v43 = v41;
          }
          *uint64_t v39 = 0uLL;
          v39[1] = 0uLL;
          int v92 = (uint64_t *)v6;
          if ((_DWORD)v43)
          {
            uint64_t v44 = v37 + 39;
            do
            {
              int v45 = *v44++;
              snprintf((char *)v39, 0x29uLL, "%s%02x", (const char *)v39, v45);
              --v43;
            }

            while (v43);
            int v37 = *(unsigned __int8 **)(a1 + 1112);
            int v40 = quic_cid_describe_state;
            __int128 v42 = 0uLL;
          }

          if (v40 % 3 == 2) {
            int v46 = &quic_cid_describe_cid_buf2;
          }
          else {
            int v46 = &quic_cid_describe_cid_buf3;
          }
          if (v40 % 3) {
            unsigned int v47 = v46;
          }
          else {
            unsigned int v47 = &quic_cid_describe_cid_buf1;
          }
          quic_cid_describe_unsigned int state = v40 + 1;
          if (v37[17] >= 0x14u) {
            uint64_t v48 = 20LL;
          }
          else {
            uint64_t v48 = v37[17];
          }
          _OWORD *v47 = v42;
          v47[1] = v42;
          *(_OWORD *)((char *)v47 + 25) = v42;
          if ((_DWORD)v48)
          {
            uint64_t v49 = v37 + 18;
            do
            {
              int v50 = *v49++;
              snprintf((char *)v47, 0x29uLL, "%s%02x", (const char *)v47, v50);
              --v48;
            }

            while (v48);
          }

          uint64_t v51 = *(void *)a2;
          *(_DWORD *)uint64_t v36 = 136447490;
          *(void *)(v36 + 4) = "quic_conn_migrate_to_path";
          *(_WORD *)(v36 + 12) = 2082;
          *(void *)(v36 + 14) = v89;
          *(_WORD *)(v36 + 22) = 2082;
          *(void *)(v36 + 24) = v39;
          *(_WORD *)(v36 + 32) = 2082;
          *(void *)(v36 + 34) = v47;
          *(_WORD *)(v36 + 42) = 2082;
          *(void *)(v36 + 44) = a2 + 280;
          *(_WORD *)(v36 + 52) = 2048;
          *(void *)(v36 + 54) = v51;
          qlog_internal(0, (uint64_t)v35, 5065LL);
          uint64_t v6 = (uint64_t)v92;
          a3 = v91;
          uint64_t v13 = &unk_18C6EB000;
          __int128 v14 = &unk_18C6EB000;
        }

        if (quic_path_is_initial(v6)) {
          quic_path_fsm_change(v6, 1u);
        }
      }

      else if (((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1 {
              || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEFAULT))
      }
             && *(void *)(a1 + 1112))
      {
        int v91 = a3;
        int v92 = (uint64_t *)v6;
        uint64_t v15 = _os_log_pack_size();
        uint64_t v90 = &v88;
        __int128 v16 = (char *)&v88 - ((MEMORY[0x1895F8858](v15, v15) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v17 = _os_log_pack_fill();
        uint64_t v89 = a1 + 976;
        uint64_t v18 = *(unsigned __int8 **)(a1 + 1112);
        if (quic_cid_describe_state % 3 == 2) {
          int v19 = &quic_cid_describe_cid_buf2;
        }
        else {
          int v19 = &quic_cid_describe_cid_buf3;
        }
        if (quic_cid_describe_state % 3) {
          unsigned int v20 = v19;
        }
        else {
          unsigned int v20 = &quic_cid_describe_cid_buf1;
        }
        int v21 = ++quic_cid_describe_state;
        unsigned int v22 = v18[38];
        __int128 v23 = 0uLL;
        *(_OWORD *)((char *)v20 + 25) = 0u;
        if (v22 >= 0x14) {
          uint64_t v24 = 20LL;
        }
        else {
          uint64_t v24 = v22;
        }
        *unsigned int v20 = 0uLL;
        v20[1] = 0uLL;
        if ((_DWORD)v24)
        {
          unint64_t v25 = v18 + 39;
          do
          {
            int v26 = *v25++;
            snprintf((char *)v20, 0x29uLL, "%s%02x", (const char *)v20, v26);
            --v24;
          }

          while (v24);
          uint64_t v18 = *(unsigned __int8 **)(a1 + 1112);
          int v21 = quic_cid_describe_state;
          __int128 v23 = 0uLL;
        }

        if (v21 % 3 == 2) {
          uint64_t v27 = &quic_cid_describe_cid_buf2;
        }
        else {
          uint64_t v27 = &quic_cid_describe_cid_buf3;
        }
        if (v21 % 3) {
          uint64_t v28 = v27;
        }
        else {
          uint64_t v28 = &quic_cid_describe_cid_buf1;
        }
        quic_cid_describe_unsigned int state = v21 + 1;
        if (v18[17] >= 0x14u) {
          uint64_t v29 = 20LL;
        }
        else {
          uint64_t v29 = v18[17];
        }
        _OWORD *v28 = v23;
        v28[1] = v23;
        *(_OWORD *)((char *)v28 + 25) = v23;
        if ((_DWORD)v29)
        {
          int v30 = v18 + 18;
          do
          {
            int v31 = *v30++;
            snprintf((char *)v28, 0x29uLL, "%s%02x", (const char *)v28, v31);
            --v29;
          }

          while (v29);
        }

        uint64_t v6 = (uint64_t)v92;
        uint64_t v32 = *v92;
        uint64_t v33 = *(void *)a2;
        *(_DWORD *)uint64_t v17 = 136448002;
        *(void *)(v17 + 4) = "quic_conn_migrate_to_path";
        *(_WORD *)(v17 + 12) = 2082;
        *(void *)(v17 + 14) = v89;
        *(_WORD *)(v17 + 22) = 2082;
        *(void *)(v17 + 24) = v20;
        *(_WORD *)(v17 + 32) = 2082;
        *(void *)(v17 + 34) = v28;
        *(_WORD *)(v17 + 42) = 2082;
        *(void *)(v17 + 44) = v6 + 280;
        *(_WORD *)(v17 + 52) = 2048;
        *(void *)(v17 + 54) = v32;
        *(_WORD *)(v17 + 62) = 2082;
        *(void *)(v17 + 64) = a2 + 280;
        *(_WORD *)(v17 + 72) = 2048;
        *(void *)(v17 + 74) = v33;
        qlog_internal(0, (uint64_t)v16, 5082LL);
        a3 = v91;
        uint64_t v13 = (_BYTE *)&unk_18C6EB000;
        __int128 v14 = (_BYTE *)&unk_18C6EB000;
      }

      nw_protocol_instance_set_current_path();
      *v12 &= ~0x80000uLL;
      quic_ecn_reset(*(void *)(a1 + 968), a2);
      uint64_t stats_region = nw_protocol_instance_get_stats_region();
      __int128 v53 = &g_quic_stats;
      if (stats_region) {
        __int128 v53 = (void *)stats_region;
      }
      *(void *)(a1 + 1312) = v53;
      uint64_t stats = nw_protocol_instance_get_stats();
      *(void *)(a1 + 1304) = stats;
      if (stats)
      {
        *(void *)(stats + 16) = *(void *)(a1 + 1144);
        uint64_t v55 = *(void *)(a1 + 1304);
        if (v55)
        {
          *(void *)(v55 + 24) = *(void *)(a1 + 1152);
          uint64_t v56 = *(void *)(a1 + 1304);
          if (v56)
          {
            *(void *)(v56 + 32) = *(void *)(a1 + 1160);
            uint64_t v57 = *(void *)(a1 + 1304);
            if (v57)
            {
              *(void *)(v57 + 40) = *(void *)(a1 + 1168);
              uint64_t v58 = *(void *)(a1 + 1304);
              if (v58)
              {
                *(_DWORD *)(v58 + 48) = *(_DWORD *)(a1 + 1176);
                uint64_t v59 = *(void *)(a1 + 1304);
                if (v59)
                {
                  *(_DWORD *)(v59 + 52) = *(_DWORD *)(a1 + 1180);
                  uint64_t v60 = *(void *)(a1 + 1304);
                  if (v60)
                  {
                    *(_DWORD *)(v60 + 56) = *(_DWORD *)(a1 + 1188);
                    uint64_t v61 = *(void *)(a1 + 1304);
                    if (v61)
                    {
                      *(_DWORD *)(v61 + 60) = *(_DWORD *)(a1 + 1192);
                      uint64_t v62 = *(void *)(a1 + 1304);
                      if (v62)
                      {
                        *(_DWORD *)(v62 + 60) = *(unsigned __int8 *)(a1 + 477) == 9;
                        uint64_t v63 = *(void *)(a1 + 1304);
                        if (v63) {
                          *(_DWORD *)(v63 + 124) = *(unsigned __int8 *)(a1 + 477);
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

      uint64_t v64 = *(void *)(a1 + 1112);
      if (v64 && quic_rtt_has_initial_measurement(*(void *)(v64 + 272)))
      {
        uint64_t v65 = *(void *)(a1 + 1304);
        if (!v65) {
          goto LABEL_93;
        }
        *(_DWORD *)(*(void *)(a1 + 1304) + 68LL) = (unint64_t)((4
                                                                       * (quic_rtt_get_min_rtt(*(void *)(*(void *)(a1 + 1112) + 272LL)) & 0x7FFFFFFFFFFFFFFuLL)
                                                                       * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4;
        uint64_t v65 = *(void *)(a1 + 1304);
        if (!v65) {
          goto LABEL_93;
        }
        *(_DWORD *)(*(void *)(a1 + 1304) + 72LL) = (unint64_t)((4
                                                                       * (quic_rtt_get_smoothed_rtt(*(void *)(*(void *)(a1 + 1112) + 272LL)) & 0x7FFFFFFFFFFFFFFuLL)
                                                                       * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4;
        uint64_t v65 = *(void *)(a1 + 1304);
        if (!v65) {
          goto LABEL_93;
        }
        *(_DWORD *)(*(void *)(a1 + 1304) + 76LL) = (unint64_t)((2
                                                                       * (quic_rtt_get_rtt_variance(*(void *)(*(void *)(a1 + 1112) + 272LL)) & 0xFFFFFFFFFFFFFFFuLL)
                                                                       * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4;
      }

      uint64_t v65 = *(void *)(a1 + 1304);
      if (v65)
      {
        *(_OWORD *)(v65 + 128) = *(_OWORD *)(a1 + 1288);
        uint64_t v65 = *(void *)(a1 + 1304);
      }

LABEL_93:
      if ((*(_BYTE *)(a1 + 1381) & 2) != 0)
      {
        if (v65)
        {
          unsigned int v66 = *(_DWORD *)(v65 + 116) | 1;
          goto LABEL_98;
        }
      }

      else if (v65)
      {
        unsigned int v66 = *(_DWORD *)(v65 + 116) & 0xFFFFFFFE;
LABEL_98:
        *(_DWORD *)(v65 + 116) = v66;
        uint64_t v67 = *(void *)(a1 + 1304);
        if (v67)
        {
          *(_BYTE *)(v67 + 144) |= (*(_DWORD *)v12 & 0x200000) != 0;
          uint64_t v68 = *(void *)(a1 + 1304);
          if (v68)
          {
            *(_BYTE *)(v68 + 144) |= (*(_DWORD *)v12 >> 22) & 2;
            uint64_t v69 = *(void *)(a1 + 1304);
            if (v69) {
              *(_BYTE *)(v69 + 144) |= (*(_DWORD *)v12 >> 19) & 8;
            }
          }
        }
      }

      if (a3) {
        nw_protocol_instance_assert_fallback_agent();
      }
      else {
        nw_protocol_instance_unassert_fallback_agent();
      }
      ++*(_DWORD *)(a1 + 1244);
      if ((*(_BYTE *)v12 & 1) == 0)
      {
        uint64_t v70 = *(void *)(a1 + 560);
        uint64_t frame_pool = quic_packet_builder_get_frame_pool(v70);
        uint64_t v72 = quic_frame_create(frame_pool, 1LL);
        *((_WORD *)v72 + 4) = 1;
        *((_BYTE *)v72 + 120) &= 0xF9u;
        quic_packet_builder_append_for_pn_space(v70, (uint64_t)v72, 3u);
        uint64_t path = quic_conn_select_next_path((void *)a1, (uint64_t)&__block_literal_global_98);
        quic_conn_send_internal(a1, path, 0LL);
      }

      if ((*(_WORD *)(v6 + 431) & 0x80) != 0)
      {
        if (v13[368] || (v14[369] & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v74 = _os_log_pack_size();
          unsigned int v75 = (char *)&v88 - ((MEMORY[0x1895F8858](v74, v74) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          uint64_t v76 = _os_log_pack_fill();
          *(_DWORD *)uint64_t v76 = 136446466;
          *(void *)(v76 + 4) = "quic_conn_migrate_to_path";
          *(_WORD *)(v76 + 12) = 2048;
          *(void *)(v76 + 14) = v6;
          qlog_internal(2, (uint64_t)v75, 5102LL);
        }

        _quic_path_destroy(a1 + 1360, (void *)a1, (void *)v6);
      }

      return;
    }

    int v10 = (_BYTE *)quic_cid_array_find_by_cid(*(unsigned __int8 **)(a1 + 384), (_BYTE *)(a2 + 17));
    if (v10)
    {
      *(_BYTE *)(a1 + 476) = *v10;
      goto LABEL_9;
    }

    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      uint64_t v77 = _os_log_pack_size();
      uint64_t v78 = (char *)&v88 - ((MEMORY[0x1895F8858](v77, v77) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v79 = _os_log_pack_fill();
      uint64_t v80 = &quic_cid_describe_cid_buf3;
      if (quic_cid_describe_state % 3 == 2) {
        uint64_t v80 = &quic_cid_describe_cid_buf2;
      }
      if (quic_cid_describe_state % 3) {
        unsigned int v81 = v80;
      }
      else {
        unsigned int v81 = &quic_cid_describe_cid_buf1;
      }
      ++quic_cid_describe_state;
      if (*v7 >= 0x14u) {
        uint64_t v82 = 20LL;
      }
      else {
        uint64_t v82 = *v7;
      }
      _OWORD *v81 = 0u;
      v81[1] = 0u;
      *(_OWORD *)((char *)v81 + 25) = 0u;
      if ((_DWORD)v82)
      {
        int v83 = (unsigned __int8 *)(a2 + 18);
        do
        {
          int v84 = *v83++;
          snprintf((char *)v81, 0x29uLL, "%s%02x", (const char *)v81, v84);
          --v82;
        }

        while (v82);
      }

      *(_DWORD *)uint64_t v79 = 136446466;
      *(void *)(v79 + 4) = "quic_conn_migrate_to_path";
      *(_WORD *)(v79 + 12) = 2082;
      *(void *)(v79 + 14) = v81;
      qlog_internal(17, (uint64_t)v78, 5040LL);
    }
  }

  else if (qlog_debug_enabled {
         || (qlog_nwlog_enabled & 1) != 0
  }
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    uint64_t v85 = _os_log_pack_size();
    uint64_t v86 = (char *)&v88 - ((MEMORY[0x1895F8858](v85, v85) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v87 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v87 = 136446210;
    *(void *)(v87 + 4) = "quic_conn_migrate_to_path";
    qlog_internal(17, (uint64_t)v86, 5029LL);
  }

uint64_t quic_conn_process_reordering(uint64_t a1, uint64_t a2)
{
  v17[1] = *MEMORY[0x1895F89C0];
  if (quic_conn_scid_len(a1)
    && (uint64_t v4 = quic_cid_array_find_by_cid(*(unsigned __int8 **)(a1 + 376), (_BYTE *)(a2 + 40))) != 0)
  {
    uint64_t v5 = *(void *)(v4 + 40);
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  largest_ack_eliciting_uint64_t pn = quic_ack_get_largest_ack_eliciting_pn( *(char **)(a1 + 960),  *(unsigned __int8 *)(a2 + 83),  v5);
  if (quic_ack_should_ignore_order(*(void *)(a1 + 960))) {
    return 0LL;
  }
  unint64_t v7 = *(void *)(a2 + 112);
  if (!v7) {
    return 0LL;
  }
  if (largest_ack_eliciting_pn <= v7)
  {
    if (largest_ack_eliciting_pn < v7)
    {
      uint64_t result = quic_ack_packets_missing_between( *(char **)(a1 + 960),  *(unsigned __int8 *)(a2 + 83),  v5,  largest_ack_eliciting_pn,  v7);
      if (!(_DWORD)result) {
        return result;
      }
      goto LABEL_8;
    }

    return 0LL;
  }

BOOL quic_conn_unknown_dcid(uint64_t a1, uint64_t a2, unsigned __int8 *a3)
{
  uint64_t v3 = a3;
  uint64_t v132 = *MEMORY[0x1895F89C0];
  uint64_t v6 = quic_cid_array_find_by_cid(*(unsigned __int8 **)(a1 + 376), a3);
  uint64_t v7 = v6;
  if (!v6)
  {
    if ((qlog_debug_enabled
       || (qlog_nwlog_enabled & 1) != 0
       || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
      && *(void *)(a1 + 1112))
    {
      uint64_t v129 = v3;
      uint64_t v130 = a2;
      uint64_t v131 = 0LL;
      uint64_t v19 = _os_log_pack_size();
      __int128 v128 = &v125;
      unsigned int v20 = (char *)&v125 - ((MEMORY[0x1895F8858](v19, v19) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v21 = _os_log_pack_fill();
      unsigned int v22 = *(unsigned __int8 **)(a1 + 1112);
      __int128 v23 = &quic_cid_describe_cid_buf3;
      if (quic_cid_describe_state % 3 == 2) {
        __int128 v23 = &quic_cid_describe_cid_buf2;
      }
      if (quic_cid_describe_state % 3) {
        uint64_t v24 = v23;
      }
      else {
        uint64_t v24 = &quic_cid_describe_cid_buf1;
      }
      int v25 = ++quic_cid_describe_state;
      unsigned int v26 = v22[38];
      __int128 v27 = 0uLL;
      *(_OWORD *)((char *)v24 + 25) = 0u;
      if (v26 >= 0x14) {
        uint64_t v28 = 20LL;
      }
      else {
        uint64_t v28 = v26;
      }
      *uint64_t v24 = 0uLL;
      v24[1] = 0uLL;
      if ((_DWORD)v28)
      {
        uint64_t v29 = v22 + 39;
        do
        {
          int v30 = *v29++;
          snprintf((char *)v24, 0x29uLL, "%s%02x", (const char *)v24, v30);
          --v28;
        }

        while (v28);
        unsigned int v22 = *(unsigned __int8 **)(a1 + 1112);
        int v25 = quic_cid_describe_state;
        __int128 v27 = 0uLL;
      }

      uint64_t v31 = a1 + 976;
      uint64_t v32 = &quic_cid_describe_cid_buf3;
      if (v25 % 3 == 2) {
        uint64_t v32 = &quic_cid_describe_cid_buf2;
      }
      if (v25 % 3) {
        uint64_t v33 = v32;
      }
      else {
        uint64_t v33 = &quic_cid_describe_cid_buf1;
      }
      quic_cid_describe_unsigned int state = v25 + 1;
      if (v22[17] >= 0x14u) {
        uint64_t v34 = 20LL;
      }
      else {
        uint64_t v34 = v22[17];
      }
      _OWORD *v33 = v27;
      v33[1] = v27;
      *(_OWORD *)((char *)v33 + 25) = v27;
      if ((_DWORD)v34)
      {
        unint64_t v35 = v22 + 18;
        do
        {
          int v36 = *v35++;
          snprintf((char *)v33, 0x29uLL, "%s%02x", (const char *)v33, v36);
          --v34;
        }

        while (v34);
      }

      int v37 = quic_cid_describe(v129);
      uint64_t v38 = &quic_cid_describe_cid_buf3;
      if (quic_cid_describe_state % 3 == 2) {
        uint64_t v38 = &quic_cid_describe_cid_buf2;
      }
      if (quic_cid_describe_state % 3) {
        uint64_t v39 = v38;
      }
      else {
        uint64_t v39 = &quic_cid_describe_cid_buf1;
      }
      ++quic_cid_describe_state;
      uint64_t v40 = v130;
      unsigned int v41 = *(unsigned __int8 *)(v130 + 38);
      *(_OWORD *)((char *)v39 + 25) = 0u;
      if (v41 >= 0x14) {
        uint64_t v42 = 20LL;
      }
      else {
        uint64_t v42 = v41;
      }
      *uint64_t v39 = 0uLL;
      v39[1] = 0uLL;
      if ((_DWORD)v42)
      {
        uint64_t v43 = (unsigned __int8 *)(v40 + 39);
        do
        {
          int v44 = *v43++;
          snprintf((char *)v39, 0x29uLL, "%s%02x", (const char *)v39, v44);
          --v42;
        }

        while (v42);
      }

      *(_DWORD *)uint64_t v21 = 136447490;
      *(void *)(v21 + 4) = "quic_conn_unknown_dcid";
      *(_WORD *)(v21 + 12) = 2082;
      *(void *)(v21 + 14) = v31;
      *(_WORD *)(v21 + 22) = 2082;
      *(void *)(v21 + 24) = v24;
      *(_WORD *)(v21 + 32) = 2082;
      *(void *)(v21 + 34) = v33;
      *(_WORD *)(v21 + 42) = 2082;
      *(void *)(v21 + 44) = v37;
      *(_WORD *)(v21 + 52) = 2082;
      *(void *)(v21 + 54) = v39;
      qlog_internal(16, (uint64_t)v20, 3176LL);
      uint64_t v7 = v131;
    }

    return v7 != 0;
  }

  int v8 = qlog_debug_enabled;
  char v9 = qlog_nwlog_enabled;
  if ((*(_BYTE *)(v6 + 38) & 1) != 0) {
    goto LABEL_83;
  }
  if (qlog_debug_enabled) {
    char v10 = 1;
  }
  else {
    char v10 = qlog_nwlog_enabled;
  }
  if ((v10 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = _os_log_pack_size();
    int v12 = (char *)&v125 - ((MEMORY[0x1895F8858](v11, v11) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v13 = _os_log_pack_fill();
    uint64_t v14 = *(void *)(v7 + 40);
    uint64_t v15 = *(void *)(a1 + 496);
    uint64_t v16 = quic_tp_get(*(_BYTE **)(a1 + 544), 14LL);
    *(_DWORD *)uint64_t v13 = 136446978;
    *(void *)(v13 + 4) = "quic_conn_unknown_dcid";
    *(_WORD *)(v13 + 12) = 2048;
    *(void *)(v13 + 14) = v14;
    *(_WORD *)(v13 + 22) = 2048;
    *(void *)(v13 + 24) = v15;
    *(_WORD *)(v13 + 32) = 2048;
    *(void *)(v13 + 34) = v16;
    qlog_internal(2, (uint64_t)v12, 3192LL);
  }

  unint64_t v17 = quic_tp_get(*(_BYTE **)(a1 + 544), 14LL);
  int v8 = qlog_debug_enabled;
  char v9 = qlog_nwlog_enabled;
  if (*(void *)(a1 + 496) < v17)
  {
    int v18 = 1;
    goto LABEL_84;
  }

  if (qlog_debug_enabled) {
    char v45 = 1;
  }
  else {
    char v45 = qlog_nwlog_enabled;
  }
  if ((v45 & 1) == 0 && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))
  {
    char v9 = 0;
    int v8 = 0;
    goto LABEL_83;
  }

  if (!*(void *)(a1 + 1112))
  {
LABEL_83:
    int v18 = 0;
    goto LABEL_84;
  }

  uint64_t v129 = v3;
  uint64_t v130 = a2;
  uint64_t v131 = v7;
  uint64_t v46 = _os_log_pack_size();
  unsigned int v47 = (char *)&v125 - ((MEMORY[0x1895F8858](v46, v46) + 15) & 0xFFFFFFFFFFFFFFF0LL);
  _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v48 = _os_log_pack_fill();
  __int128 v128 = (uint64_t *)(a1 + 976);
  uint64_t v49 = *(unsigned __int8 **)(a1 + 1112);
  if (quic_cid_describe_state % 3 == 2) {
    int v50 = &quic_cid_describe_cid_buf2;
  }
  else {
    int v50 = &quic_cid_describe_cid_buf3;
  }
  if (quic_cid_describe_state % 3) {
    uint64_t v51 = v50;
  }
  else {
    uint64_t v51 = &quic_cid_describe_cid_buf1;
  }
  int v52 = ++quic_cid_describe_state;
  unsigned int v53 = v49[38];
  __int128 v54 = 0uLL;
  *(_OWORD *)((char *)v51 + 25) = 0u;
  if (v53 >= 0x14) {
    uint64_t v55 = 20LL;
  }
  else {
    uint64_t v55 = v53;
  }
  *uint64_t v51 = 0uLL;
  v51[1] = 0uLL;
  if ((_DWORD)v55)
  {
    uint64_t v56 = v49 + 39;
    do
    {
      int v57 = *v56++;
      snprintf((char *)v51, 0x29uLL, "%s%02x", (const char *)v51, v57);
      --v55;
    }

    while (v55);
    uint64_t v49 = *(unsigned __int8 **)(a1 + 1112);
    int v52 = quic_cid_describe_state;
    __int128 v54 = 0uLL;
  }

  if (v52 % 3 == 2) {
    uint64_t v58 = &quic_cid_describe_cid_buf2;
  }
  else {
    uint64_t v58 = &quic_cid_describe_cid_buf3;
  }
  if (v52 % 3) {
    uint64_t v59 = v58;
  }
  else {
    uint64_t v59 = &quic_cid_describe_cid_buf1;
  }
  quic_cid_describe_unsigned int state = v52 + 1;
  if (v49[17] >= 0x14u) {
    uint64_t v60 = 20LL;
  }
  else {
    uint64_t v60 = v49[17];
  }
  _OWORD *v59 = v54;
  v59[1] = v54;
  *(_OWORD *)((char *)v59 + 25) = v54;
  if ((_DWORD)v60)
  {
    uint64_t v61 = v49 + 18;
    do
    {
      int v62 = *v61++;
      snprintf((char *)v59, 0x29uLL, "%s%02x", (const char *)v59, v62);
      --v60;
    }

    while (v60);
  }

  *(_DWORD *)uint64_t v48 = 136446978;
  *(void *)(v48 + 4) = "quic_conn_unknown_dcid";
  *(_WORD *)(v48 + 12) = 2082;
  *(void *)(v48 + 14) = v128;
  *(_WORD *)(v48 + 22) = 2082;
  *(void *)(v48 + 24) = v51;
  *(_WORD *)(v48 + 32) = 2082;
  *(void *)(v48 + 34) = v59;
  qlog_internal(1, (uint64_t)v47, 3200LL);
  int v18 = 0;
  int v8 = qlog_debug_enabled;
  char v9 = qlog_nwlog_enabled;
  a2 = v130;
  uint64_t v7 = v131;
  uint64_t v3 = v129;
LABEL_84:
  *(_BYTE *)(v7 + 38) |= 1u;
  *(_OWORD *)(a1 + 1288) = *(_OWORD *)(v7 + 22);
  __int16 v63 = *(_WORD *)(a2 + 431);
  if ((v8 || (v9 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEFAULT)) && *(void *)(a1 + 1112))
  {
    LODWORD(v128) = v18;
    uint64_t v129 = v3;
    uint64_t v130 = a2;
    uint64_t v131 = v7;
    uint64_t v64 = _os_log_pack_size();
    uint64_t v127 = (char *)&v125;
    uint64_t v65 = (char *)&v125 - ((MEMORY[0x1895F8858](v64, v64) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v66 = _os_log_pack_fill();
    uint64_t v126 = a1 + 976;
    uint64_t v67 = *(unsigned __int8 **)(a1 + 1112);
    if (quic_cid_describe_state % 3 == 2) {
      uint64_t v68 = &quic_cid_describe_cid_buf2;
    }
    else {
      uint64_t v68 = &quic_cid_describe_cid_buf3;
    }
    if (quic_cid_describe_state % 3) {
      uint64_t v69 = v68;
    }
    else {
      uint64_t v69 = &quic_cid_describe_cid_buf1;
    }
    int v70 = ++quic_cid_describe_state;
    unsigned int v71 = v67[38];
    __int128 v72 = 0uLL;
    *(_OWORD *)((char *)v69 + 25) = 0u;
    if (v71 >= 0x14) {
      uint64_t v73 = 20LL;
    }
    else {
      uint64_t v73 = v71;
    }
    *uint64_t v69 = 0uLL;
    v69[1] = 0uLL;
    if ((_DWORD)v73)
    {
      uint64_t v74 = v67 + 39;
      do
      {
        int v75 = *v74++;
        snprintf((char *)v69, 0x29uLL, "%s%02x", (const char *)v69, v75);
        --v73;
      }

      while (v73);
      uint64_t v67 = *(unsigned __int8 **)(a1 + 1112);
      int v70 = quic_cid_describe_state;
      __int128 v72 = 0uLL;
    }

    if (v70 % 3 == 2) {
      uint64_t v76 = &quic_cid_describe_cid_buf2;
    }
    else {
      uint64_t v76 = &quic_cid_describe_cid_buf3;
    }
    if (v70 % 3) {
      uint64_t v77 = v76;
    }
    else {
      uint64_t v77 = &quic_cid_describe_cid_buf1;
    }
    quic_cid_describe_unsigned int state = v70 + 1;
    if (v67[17] >= 0x14u) {
      uint64_t v78 = 20LL;
    }
    else {
      uint64_t v78 = v67[17];
    }
    _OWORD *v77 = v72;
    v77[1] = v72;
    *(_OWORD *)((char *)v77 + 25) = v72;
    if ((_DWORD)v78)
    {
      uint64_t v79 = v67 + 18;
      do
      {
        int v80 = *v79++;
        snprintf((char *)v77, 0x29uLL, "%s%02x", (const char *)v77, v80);
        --v78;
      }

      while (v78);
    }

    uint64_t v3 = v129;
    unsigned int v81 = quic_cid_describe(v129);
    *(_DWORD *)uint64_t v66 = 136447234;
    *(void *)(v66 + 4) = "quic_conn_unknown_dcid";
    *(_WORD *)(v66 + 12) = 2082;
    *(void *)(v66 + 14) = v126;
    *(_WORD *)(v66 + 22) = 2082;
    *(void *)(v66 + 24) = v69;
    *(_WORD *)(v66 + 32) = 2082;
    *(void *)(v66 + 34) = v77;
    *(_WORD *)(v66 + 42) = 2082;
    *(void *)(v66 + 44) = v81;
    qlog_internal(0, (uint64_t)v65, 3215LL);
    a2 = v130;
    uint64_t v7 = v131;
    int v18 = (int)v128;
  }

  quic_path_set_scid(a2, (uint64_t)v3, a1);
  if ((v63 & 0x40) != 0)
  {
    if (quic_conn_allocate_dcid(a1, a2))
    {
      if (!((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1)
        && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEFAULT)
        || !*(void *)(a1 + 1112))
      {
        goto LABEL_188;
      }

      LODWORD(v128) = v18;
      uint64_t v130 = a2;
      uint64_t v131 = v7;
      uint64_t v82 = _os_log_pack_size();
      uint64_t v129 = (unsigned __int8 *)&v125;
      int v83 = (char *)&v125 - ((MEMORY[0x1895F8858](v82, v82) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v84 = _os_log_pack_fill();
      uint64_t v85 = *(unsigned __int8 **)(a1 + 1112);
      if (quic_cid_describe_state % 3 == 2) {
        uint64_t v86 = &quic_cid_describe_cid_buf2;
      }
      else {
        uint64_t v86 = &quic_cid_describe_cid_buf3;
      }
      if (quic_cid_describe_state % 3) {
        uint64_t v87 = v86;
      }
      else {
        uint64_t v87 = &quic_cid_describe_cid_buf1;
      }
      int v88 = ++quic_cid_describe_state;
      unsigned int v89 = v85[38];
      __int128 v90 = 0uLL;
      *(_OWORD *)((char *)v87 + 25) = 0u;
      if (v89 >= 0x14) {
        uint64_t v91 = 20LL;
      }
      else {
        uint64_t v91 = v89;
      }
      _OWORD *v87 = 0uLL;
      v87[1] = 0uLL;
      if ((_DWORD)v91)
      {
        int v92 = v85 + 39;
        do
        {
          int v93 = *v92++;
          snprintf((char *)v87, 0x29uLL, "%s%02x", (const char *)v87, v93);
          --v91;
        }

        while (v91);
        uint64_t v85 = *(unsigned __int8 **)(a1 + 1112);
        int v88 = quic_cid_describe_state;
        __int128 v90 = 0uLL;
      }

      uint64_t v94 = a1 + 976;
      if (v88 % 3 == 2) {
        __int128 v95 = &quic_cid_describe_cid_buf2;
      }
      else {
        __int128 v95 = &quic_cid_describe_cid_buf3;
      }
      if (v88 % 3) {
        uint64_t v96 = v95;
      }
      else {
        uint64_t v96 = &quic_cid_describe_cid_buf1;
      }
      int v97 = v88 + 1;
      quic_cid_describe_unsigned int state = v97;
      if (v85[17] >= 0x14u) {
        uint64_t v98 = 20LL;
      }
      else {
        uint64_t v98 = v85[17];
      }
      _OWORD *v96 = v90;
      v96[1] = v90;
      *(_OWORD *)((char *)v96 + 25) = v90;
      if ((_DWORD)v98)
      {
        uint64_t v126 = a1 + 976;
        uint64_t v127 = v83;
        uint64_t v99 = v85 + 18;
        do
        {
          int v100 = *v99++;
          snprintf((char *)v96, 0x29uLL, "%s%02x", (const char *)v96, v100);
          --v98;
        }

        while (v98);
        int v97 = quic_cid_describe_state;
        uint64_t v94 = v126;
        int v83 = v127;
      }

      if (v97 % 3 == 2) {
        uint64_t v101 = &quic_cid_describe_cid_buf2;
      }
      else {
        uint64_t v101 = &quic_cid_describe_cid_buf3;
      }
      if (v97 % 3) {
        uint64_t v102 = v101;
      }
      else {
        uint64_t v102 = &quic_cid_describe_cid_buf1;
      }
      quic_cid_describe_unsigned int state = v97 + 1;
      uint64_t v103 = v130;
      else {
        uint64_t v104 = *(unsigned __int8 *)(v130 + 17);
      }
      *uint64_t v102 = 0u;
      v102[1] = 0u;
      *(_OWORD *)((char *)v102 + 25) = 0u;
      if ((_DWORD)v104)
      {
        uint64_t v105 = (unsigned __int8 *)(v103 + 18);
        do
        {
          int v106 = *v105++;
          snprintf((char *)v102, 0x29uLL, "%s%02x", (const char *)v102, v106);
          --v104;
        }

        while (v104);
      }

      *(_DWORD *)uint64_t v84 = 136447234;
      *(void *)(v84 + 4) = "quic_conn_unknown_dcid";
      *(_WORD *)(v84 + 12) = 2082;
      *(void *)(v84 + 14) = v94;
      *(_WORD *)(v84 + 22) = 2082;
      *(void *)(v84 + 24) = v87;
      *(_WORD *)(v84 + 32) = 2082;
      *(void *)(v84 + 34) = v96;
      *(_WORD *)(v84 + 42) = 2082;
      *(void *)(v84 + 44) = v102;
      qlog_internal(0, (uint64_t)v83, 3222LL);
    }

    else
    {
      if (!((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1)
        && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR)
        || !*(void *)(a1 + 1112))
      {
        goto LABEL_188;
      }

      LODWORD(v128) = v18;
      uint64_t v131 = v7;
      uint64_t v107 = _os_log_pack_size();
      uint64_t v108 = (char *)&v125 - ((MEMORY[0x1895F8858](v107, v107) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v109 = _os_log_pack_fill();
      uint64_t v130 = a1 + 976;
      uint64_t v110 = *(unsigned __int8 **)(a1 + 1112);
      if (quic_cid_describe_state % 3 == 2) {
        int v111 = &quic_cid_describe_cid_buf2;
      }
      else {
        int v111 = &quic_cid_describe_cid_buf3;
      }
      if (quic_cid_describe_state % 3) {
        uint64_t v112 = v111;
      }
      else {
        uint64_t v112 = &quic_cid_describe_cid_buf1;
      }
      int v113 = ++quic_cid_describe_state;
      unsigned int v114 = v110[38];
      __int128 v115 = 0uLL;
      *(_OWORD *)((char *)v112 + 25) = 0u;
      if (v114 >= 0x14) {
        uint64_t v116 = 20LL;
      }
      else {
        uint64_t v116 = v114;
      }
      *uint64_t v112 = 0uLL;
      v112[1] = 0uLL;
      if ((_DWORD)v116)
      {
        uint64_t v117 = v110 + 39;
        do
        {
          int v118 = *v117++;
          snprintf((char *)v112, 0x29uLL, "%s%02x", (const char *)v112, v118);
          --v116;
        }

        while (v116);
        uint64_t v110 = *(unsigned __int8 **)(a1 + 1112);
        int v113 = quic_cid_describe_state;
        __int128 v115 = 0uLL;
      }

      if (v113 % 3 == 2) {
        int v119 = &quic_cid_describe_cid_buf2;
      }
      else {
        int v119 = &quic_cid_describe_cid_buf3;
      }
      if (v113 % 3) {
        uint64_t v120 = v119;
      }
      else {
        uint64_t v120 = &quic_cid_describe_cid_buf1;
      }
      quic_cid_describe_unsigned int state = v113 + 1;
      if (v110[17] >= 0x14u) {
        uint64_t v121 = 20LL;
      }
      else {
        uint64_t v121 = v110[17];
      }
      *uint64_t v120 = v115;
      v120[1] = v115;
      *(_OWORD *)((char *)v120 + 25) = v115;
      if ((_DWORD)v121)
      {
        int v122 = v110 + 18;
        do
        {
          int v123 = *v122++;
          snprintf((char *)v120, 0x29uLL, "%s%02x", (const char *)v120, v123);
          --v121;
        }

        while (v121);
      }

      *(_DWORD *)uint64_t v109 = 136446978;
      *(void *)(v109 + 4) = "quic_conn_unknown_dcid";
      *(_WORD *)(v109 + 12) = 2082;
      *(void *)(v109 + 14) = v130;
      *(_WORD *)(v109 + 22) = 2082;
      *(void *)(v109 + 24) = v112;
      *(_WORD *)(v109 + 32) = 2082;
      *(void *)(v109 + 34) = v120;
      qlog_internal(16, (uint64_t)v108, 3224LL);
    }

    uint64_t v7 = v131;
    int v18 = (int)v128;
LABEL_188:
    if (v18) {
      quic_conn_annouce_new_cids(a1, 1u);
    }
  }

  return v7 != 0;
}

uint64_t quic_conn_allocate_dcid(uint64_t a1, uint64_t a2)
{
  v8[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t result = quic_cid_array_find_next_cid(*(unsigned __int8 **)(a1 + 384), *(unsigned __int8 *)(a1 + 476));
    if (result)
    {
      *(_BYTE *)(result + 38) |= 1u;
      *(_BYTE *)(a1 + 476) = *(_BYTE *)result;
      quic_path_assign_dcid(a2, result + 1, a1);
      return 1LL;
    }
  }

  else if (qlog_debug_enabled {
         || (qlog_nwlog_enabled & 1) != 0
  }
         || (uint64_t result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT), (_DWORD)result))
  {
    uint64_t v5 = _os_log_pack_size();
    uint64_t v6 = (char *)v8 - ((MEMORY[0x1895F8858](v5, v5) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v7 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v7 = 136446210;
    *(void *)(v7 + 4) = "quic_conn_allocate_dcid";
    qlog_internal(17, (uint64_t)v6, 4434LL);
    return 0LL;
  }

  return result;
}

void quic_conn_annouce_new_cids(uint64_t a1, unsigned int a2)
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  unint64_t v4 = quic_tp_get(*(_BYTE **)(a1 + 544), 14LL);
  unint64_t v5 = *(void *)(a1 + 496);
  BOOL v6 = v4 >= v5;
  unint64_t v7 = v4 - v5;
  if (!v6) {
    unint64_t v7 = 0LL;
  }
  if (v7 >= a2) {
    unint64_t v8 = a2;
  }
  else {
    unint64_t v8 = v7;
  }
  if (v8 && quic_conn_scid_len(a1))
  {
    unint64_t v9 = v8;
    do
    {
      quic_conn_generate_dcid(a1);
      --v9;
    }

    while (v9);
    if ((qlog_debug_enabled
       || (qlog_nwlog_enabled & 1) != 0
       || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))
      && *(void *)(a1 + 1112))
    {
      uint64_t v10 = _os_log_pack_size();
      uint64_t v33 = &v31;
      uint64_t v11 = (char *)&v31 - ((MEMORY[0x1895F8858](v10, v10) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v12 = _os_log_pack_fill();
      uint64_t v32 = a1 + 976;
      uint64_t v13 = *(unsigned __int8 **)(a1 + 1112);
      if (quic_cid_describe_state % 3 == 2) {
        uint64_t v14 = &quic_cid_describe_cid_buf2;
      }
      else {
        uint64_t v14 = &quic_cid_describe_cid_buf3;
      }
      if (quic_cid_describe_state % 3) {
        uint64_t v15 = v14;
      }
      else {
        uint64_t v15 = &quic_cid_describe_cid_buf1;
      }
      int v16 = ++quic_cid_describe_state;
      unsigned int v17 = v13[38];
      __int128 v18 = 0uLL;
      *(_OWORD *)((char *)v15 + 25) = 0u;
      if (v17 >= 0x14) {
        uint64_t v19 = 20LL;
      }
      else {
        uint64_t v19 = v17;
      }
      *uint64_t v15 = 0uLL;
      v15[1] = 0uLL;
      if ((_DWORD)v19)
      {
        unsigned int v20 = v13 + 39;
        do
        {
          int v21 = *v20++;
          snprintf((char *)v15, 0x29uLL, "%s%02x", (const char *)v15, v21);
          --v19;
        }

        while (v19);
        uint64_t v13 = *(unsigned __int8 **)(a1 + 1112);
        int v16 = quic_cid_describe_state;
        __int128 v18 = 0uLL;
      }

      if (v16 % 3 == 2) {
        unsigned int v22 = &quic_cid_describe_cid_buf2;
      }
      else {
        unsigned int v22 = &quic_cid_describe_cid_buf3;
      }
      if (v16 % 3) {
        __int128 v23 = v22;
      }
      else {
        __int128 v23 = &quic_cid_describe_cid_buf1;
      }
      quic_cid_describe_unsigned int state = v16 + 1;
      if (v13[17] >= 0x14u) {
        uint64_t v24 = 20LL;
      }
      else {
        uint64_t v24 = v13[17];
      }
      *__int128 v23 = v18;
      v23[1] = v18;
      *(_OWORD *)((char *)v23 + 25) = v18;
      if ((_DWORD)v24)
      {
        int v25 = v13 + 18;
        do
        {
          int v26 = *v25++;
          snprintf((char *)v23, 0x29uLL, "%s%02x", (const char *)v23, v26);
          --v24;
        }

        while (v24);
      }

      *(_DWORD *)uint64_t v12 = 136447234;
      *(void *)(v12 + 4) = "quic_conn_annouce_new_cids";
      *(_WORD *)(v12 + 12) = 2082;
      *(void *)(v12 + 14) = v32;
      *(_WORD *)(v12 + 22) = 2082;
      *(void *)(v12 + 24) = v15;
      *(_WORD *)(v12 + 32) = 2082;
      *(void *)(v12 + 34) = v23;
      *(_WORD *)(v12 + 42) = 2048;
      *(void *)(v12 + 44) = v8;
      qlog_internal(1, (uint64_t)v11, 4265LL);
    }

    uint64_t path = quic_conn_select_next_path((void *)a1, (uint64_t)&__block_literal_global_98);
    if ((quic_conn_send_internal(a1, path, 0LL) & 1) == 0
      && (qlog_debug_enabled
       || (qlog_nwlog_enabled & 1) != 0
       || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG)))
    {
      uint64_t v28 = _os_log_pack_size();
      uint64_t v29 = (char *)&v31 - ((MEMORY[0x1895F8858](v28, v28) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v30 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v30 = 136446210;
      *(void *)(v30 + 4) = "quic_conn_annouce_new_cids";
      qlog_internal(2, (uint64_t)v29, 4268LL);
    }
  }

void quic_conn_generate_dcid(uint64_t a1)
{
  v33[2] = *MEMORY[0x1895F89C0];
  uint64_t buffer = 0LL;
  v33[0] = 0LL;
  *(void *)((char *)v33 + 5) = 0LL;
  __int128 __buf = 0uLL;
  unsigned int v2 = quic_conn_scid_len(a1);
  if (v2)
  {
    quic_cid_create(v2, &buffer);
    dispatch_data_t v3 = dispatch_data_create(&buffer, 0x15uLL, 0LL, 0LL);
    nw_protocol_instance_notify_connection_id_changed();
    if (!v3) {
      qlog_abort_internal("%s data is NULL", "quic_conn_notify_connection_id_change");
    }
    dispatch_release(v3);
    arc4random_buf(&__buf, 0x10uLL);
    quic_frame_alloc_NEW_CONNECTION_ID( *(void *)(a1 + 560),  0LL,  *(void *)(a1 + 480),  (unsigned __int8 *)&buffer,  &__buf);
    quic_cid_array_insert(*(unsigned __int8 **)(a1 + 376), *(void *)(a1 + 480), (uint64_t)&buffer, &__buf);
    uint64_t v4 = *(void *)(a1 + 496);
    BOOL v5 = __CFADD__(v4, 1LL);
    uint64_t v6 = v4 + 1;
    uint64_t v7 = v5;
    uint64_t v8 = v7 << 63 >> 63;
    *(void *)(a1 + 496) = v6;
    int v9 = qlog_debug_enabled;
    char v10 = qlog_nwlog_enabled;
    if (v8 != v7 || v8 < 0)
    {
      if (qlog_debug_enabled) {
        char v10 = 1;
      }
      if ((v10 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
      {
        uint64_t v11 = _os_log_pack_size();
        uint64_t v12 = (char *)&__buf - ((MEMORY[0x1895F8858](v11, v11) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v13 = _os_log_pack_fill();
        uint64_t v14 = *(void *)(a1 + 496);
        *(_DWORD *)uint64_t v13 = 136447234;
        *(void *)(v13 + 4) = "quic_conn_generate_dcid";
        *(_WORD *)(v13 + 12) = 2082;
        *(void *)(v13 + 14) = "conn->num_active_local_cid";
        *(_WORD *)(v13 + 22) = 2048;
        *(void *)(v13 + 24) = v14 - 1;
        *(_WORD *)(v13 + 32) = 2048;
        *(void *)(v13 + 34) = 1LL;
        *(_WORD *)(v13 + 42) = 2048;
        *(void *)(v13 + 44) = v14;
        qlog_internal(17, (uint64_t)v12, 4237LL);
        int v9 = qlog_debug_enabled;
        char v10 = qlog_nwlog_enabled;
      }

      else
      {
        char v10 = 0;
        int v9 = 0;
      }

      *(void *)(a1 + 496) = -1LL;
    }

    if (v9 || (v10 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v18 = _os_log_pack_size();
      uint64_t v19 = (char *)&__buf - ((MEMORY[0x1895F8858](v18, v18) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v20 = _os_log_pack_fill();
      uint64_t v21 = *(void *)(a1 + 480);
      uint64_t v22 = *(void *)(a1 + 496);
      *(_DWORD *)uint64_t v20 = 136446722;
      *(void *)(v20 + 4) = "quic_conn_generate_dcid";
      *(_WORD *)(v20 + 12) = 2048;
      *(void *)(v20 + 14) = v21;
      *(_WORD *)(v20 + 22) = 2048;
      *(void *)(v20 + 24) = v22;
      qlog_internal(2, (uint64_t)v19, 4240LL);
    }

    uint64_t v23 = *(void *)(a1 + 480);
    uint64_t v24 = v23 + 1;
    uint64_t v25 = v23 == -1;
    uint64_t v26 = v25 << 63 >> 63;
    *(void *)(a1 + 480) = v24;
    if (v26 != v25 || v26 < 0)
    {
      if (qlog_debug_enabled
        || (qlog_nwlog_enabled & 1) != 0
        || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
      {
        uint64_t v27 = _os_log_pack_size();
        uint64_t v28 = (char *)&__buf - ((MEMORY[0x1895F8858](v27, v27) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v29 = _os_log_pack_fill();
        uint64_t v30 = *(void *)(a1 + 480);
        *(_DWORD *)uint64_t v29 = 136447234;
        *(void *)(v29 + 4) = "quic_conn_generate_dcid";
        *(_WORD *)(v29 + 12) = 2082;
        *(void *)(v29 + 14) = "conn->lcid_next_seq_num";
        *(_WORD *)(v29 + 22) = 2048;
        *(void *)(v29 + 24) = v30 - 1;
        *(_WORD *)(v29 + 32) = 2048;
        *(void *)(v29 + 34) = 1LL;
        *(_WORD *)(v29 + 42) = 2048;
        *(void *)(v29 + 44) = v30;
        qlog_internal(17, (uint64_t)v28, 4241LL);
      }

      *(void *)(a1 + 480) = -1LL;
    }
  }

  else if (qlog_debug_enabled {
         || (qlog_nwlog_enabled & 1) != 0
  }
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = _os_log_pack_size();
    int v16 = (char *)&__buf - ((MEMORY[0x1895F8858](v15, v15) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v17 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v17 = 136446210;
    *(void *)(v17 + 4) = "quic_conn_generate_dcid";
    qlog_internal(2, (uint64_t)v16, 4222LL);
  }

uint64_t __quic_conn_process_retry_block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 32) = 0LL;
  *(void *)(a2 + 208) = 0LL;
  return 1LL;
}

uint64_t __quic_conn_send_vn_block_invoke()
{
  return nw_protocol_data_access_buffer();
}

uint64_t quic_conn_send_retry(uint64_t a1, uint64_t a2, uint64_t a3)
{
  dispatch_data_t v3 = (unsigned __int8 *)(a3 + 61);
  quic_cid_len((unsigned __int8 *)(a2 + 17));
  quic_cid_len(v3);
  return nw_protocol_request_outbound_data();
}

uint64_t __quic_conn_send_retry_block_invoke()
{
  return nw_protocol_data_access_buffer();
}

void __quic_conn_send_retry_block_invoke_2(uint64_t a1, char *a2, unsigned __int16 a3)
{
}

void __quic_conn_send_vn_block_invoke_2(uint64_t a1, char *a2, unsigned __int16 a3)
{
}

uint64_t quic_conn_lookup_nw_path(uint64_t a1, uint64_t a2)
{
  v6[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if (*MEMORY[0x189608EC0] == a2)
    {
      for (uint64_t result = *(void *)(a1 + 1360); result; uint64_t result = *(void *)(result + 312))
      {
        if ((*(_WORD *)(result + 431) & 1) != 0) {
          break;
        }
      }
    }

    else
    {
      for (uint64_t result = *(void *)(a1 + 1360); result; uint64_t result = *(void *)(result + 312))
      {
        if (*(void *)result == a2) {
          break;
        }
      }
    }
  }

  else
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      uint64_t v3 = _os_log_pack_size();
      uint64_t v4 = (char *)v6 - ((MEMORY[0x1895F8858](v3, v3) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v5 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v5 = 136446210;
      *(void *)(v5 + 4) = "quic_conn_lookup_nw_path";
      qlog_internal(17, (uint64_t)v4, 5625LL);
    }

    return 0LL;
  }

  return result;
}

void quic_conn_handle_inbound(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v11[7] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if (a3)
    {
      v11[1] = MEMORY[0x1895F87A8];
      void v11[2] = 0x40000000LL;
      v11[3] = __quic_conn_handle_inbound_block_invoke;
      void v11[4] = &__block_descriptor_tmp_108;
      v11[5] = a3;
      v11[6] = a2;
      nw_protocol_instance_access_state();
      return;
    }

    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      uint64_t v8 = _os_log_pack_size();
      int v9 = (char *)v11 - ((MEMORY[0x1895F8858](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v10 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v10 = 136446210;
      *(void *)(v10 + 4) = "quic_conn_handle_inbound";
      uint64_t v6 = (uint64_t)v9;
      uint64_t v7 = 3576LL;
      goto LABEL_13;
    }
  }

  else if (qlog_debug_enabled {
         || (qlog_nwlog_enabled & 1) != 0
  }
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    uint64_t v3 = _os_log_pack_size();
    uint64_t v4 = (char *)v11 - ((MEMORY[0x1895F8858](v3, v3) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v5 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v5 = 136446210;
    *(void *)(v5 + 4) = "quic_conn_handle_inbound";
    uint64_t v6 = (uint64_t)v4;
    uint64_t v7 = 3575LL;
LABEL_13:
    qlog_internal(17, v6, v7);
  }

uint64_t __quic_conn_handle_inbound_block_invoke()
{
  if (__quic_signpost_is_enabled__quic_signposts_once_3883[0] != -1) {
    dispatch_once(__quic_signpost_is_enabled__quic_signposts_once_3883, &__block_literal_global_192);
  }
  nw_protocol_data_access_buffer();
  return 1LL;
}

void __quic_conn_handle_inbound_block_invoke_2(void *a1, char *a2, unint64_t a3)
{
  uint64_t v5 = a1[4];
  uint64_t v6 = a1[5];
  uint64_t v7 = a1[6];
  int ecn_flag = nw_protocol_data_get_ecn_flag();
  quic_conn_process_inbound(v5, v6, v7, a2, a3, ecn_flag, v9);
}

void quic_conn_inbound_stopping(uint64_t a1)
{
  v4[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    nw_protocol_instance_access_state();
  }

  else if (qlog_debug_enabled {
         || (qlog_nwlog_enabled & 1) != 0
  }
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    uint64_t v1 = _os_log_pack_size();
    unsigned int v2 = (char *)v4 - ((MEMORY[0x1895F8858](v1, v1) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v3 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v3 = 136446210;
    *(void *)(v3 + 4) = "quic_conn_inbound_stopping";
    qlog_internal(17, (uint64_t)v2, 3690LL);
  }

uint64_t __quic_conn_inbound_stopping_block_invoke(uint64_t a1, uint64_t a2)
{
  if (__quic_signpost_is_enabled__quic_signposts_once_3883[0] != -1) {
    dispatch_once(__quic_signpost_is_enabled__quic_signposts_once_3883, &__block_literal_global_192);
  }
  uint64_t stats_region = nw_protocol_instance_get_stats_region();
  uint64_t v4 = &g_quic_stats;
  if (stats_region) {
    uint64_t v4 = (void *)stats_region;
  }
  *(void *)(a2 + 1312) = v4;
  uint64_t stats = nw_protocol_instance_get_stats();
  *(void *)(a2 + 1304) = stats;
  if (stats)
  {
    *(void *)(stats + 16) = *(void *)(a2 + 1144);
    uint64_t v6 = *(void *)(a2 + 1304);
    if (v6)
    {
      *(void *)(v6 + 24) = *(void *)(a2 + 1152);
      uint64_t v7 = *(void *)(a2 + 1304);
      if (v7)
      {
        *(void *)(v7 + 32) = *(void *)(a2 + 1160);
        uint64_t v8 = *(void *)(a2 + 1304);
        if (v8)
        {
          *(void *)(v8 + 40) = *(void *)(a2 + 1168);
          uint64_t v9 = *(void *)(a2 + 1304);
          if (v9)
          {
            *(_DWORD *)(v9 + 48) = *(_DWORD *)(a2 + 1176);
            uint64_t v10 = *(void *)(a2 + 1304);
            if (v10)
            {
              *(_DWORD *)(v10 + 52) = *(_DWORD *)(a2 + 1180);
              uint64_t v11 = *(void *)(a2 + 1304);
              if (v11)
              {
                *(_DWORD *)(v11 + 56) = *(_DWORD *)(a2 + 1188);
                uint64_t v12 = *(void *)(a2 + 1304);
                if (v12)
                {
                  *(_DWORD *)(v12 + 60) = *(_DWORD *)(a2 + 1192);
                  uint64_t v13 = *(void *)(a2 + 1304);
                  if (v13)
                  {
                    *(_DWORD *)(v13 + 60) = *(unsigned __int8 *)(a2 + 477) == 9;
                    uint64_t v14 = *(void *)(a2 + 1304);
                    if (v14) {
                      *(_DWORD *)(v14 + 124) = *(unsigned __int8 *)(a2 + 477);
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

  uint64_t v15 = *(void *)(a2 + 1112);
  if (v15 && quic_rtt_has_initial_measurement(*(void *)(v15 + 272)))
  {
    uint64_t v16 = *(void *)(a2 + 1304);
    if (!v16) {
      goto LABEL_27;
    }
    *(_DWORD *)(*(void *)(a2 + 1304) + 68LL) = (unint64_t)((4
                                                                   * (quic_rtt_get_min_rtt(*(void *)(*(void *)(a2 + 1112) + 272LL)) & 0x7FFFFFFFFFFFFFFuLL)
                                                                   * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4;
    uint64_t v16 = *(void *)(a2 + 1304);
    if (!v16) {
      goto LABEL_27;
    }
    *(_DWORD *)(*(void *)(a2 + 1304) + 72LL) = (unint64_t)((4
                                                                   * (quic_rtt_get_smoothed_rtt(*(void *)(*(void *)(a2 + 1112) + 272LL)) & 0x7FFFFFFFFFFFFFFuLL)
                                                                   * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4;
    uint64_t v16 = *(void *)(a2 + 1304);
    if (!v16) {
      goto LABEL_27;
    }
    *(_DWORD *)(*(void *)(a2 + 1304) + 76LL) = (unint64_t)((2
                                                                   * (quic_rtt_get_rtt_variance(*(void *)(*(void *)(a2 + 1112) + 272LL)) & 0xFFFFFFFFFFFFFFFuLL)
                                                                   * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4;
  }

  uint64_t v16 = *(void *)(a2 + 1304);
  if (v16)
  {
    *(_OWORD *)(v16 + 128) = *(_OWORD *)(a2 + 1288);
    uint64_t v16 = *(void *)(a2 + 1304);
  }

LABEL_36:
  if ((*(_BYTE *)(a2 + 1383) & 1) != 0)
  {
    uint64_t v22 = MEMORY[0x1895F87A8];
    v34[0] = MEMORY[0x1895F87A8];
    v34[1] = 0x40000000LL;
    void v34[2] = __quic_conn_inbound_stopping_block_invoke_2;
    v34[3] = &__block_descriptor_tmp_111;
    v34[4] = a2;
    uint64_t v35 = -1LL;
    uint64_t flow_for_key = nw_protocol_instance_get_flow_for_key();
    if (*(_BYTE *)(a2 + 477) == 9)
    {
      uint64_t v35 = v22;
      uint64_t v36 = 0x40000000LL;
      int v37 = __quic_enumerate_open_data_streams_block_invoke;
      uint64_t v38 = &unk_18A117490;
      uint64_t v39 = v34;
      uint64_t v40 = flow_for_key;
      nw_protocol_instance_enumerate_flows();
    }

    while (1)
    {
      uint64_t v27 = *(void *)(a2 + 1344);
      if (!v27) {
        break;
      }
      uint64_t v28 = *(void *)(v27 + 320);
      uint64_t v29 = *(void **)(v27 + 328);
      if (v28)
      {
        *(void *)(v28 + 328) = v29;
        uint64_t v29 = *(void **)(v27 + 328);
      }

      else
      {
        *(void *)(a2 + 1352) = v29;
      }

      void *v29 = v28;
      *(void *)(v27 + 320) = 0LL;
      *(void *)(v27 + 328) = 0LL;
      *(_DWORD *)(v27 + 352) &= ~0x400u;
    }

    *(void *)v17 &= ~0x1000000uLL;
  }

  else
  {
    while (1)
    {
      uint64_t v24 = *(void *)(a2 + 1344);
      if (!v24) {
        break;
      }
      quic_conn_inbound_stopping_service_stream((uint64_t *)a2, *(void *)(v24 + 24), *(uint64_t **)(a2 + 1344));
      uint64_t v25 = *(void *)(v24 + 320);
      uint64_t v26 = *(void **)(v24 + 328);
      if (v25)
      {
        *(void *)(v25 + 328) = v26;
        uint64_t v26 = *(void **)(v24 + 328);
      }

      else
      {
        *(void *)(a2 + 1352) = v26;
      }

      void *v26 = v25;
      *(void *)(v24 + 320) = 0LL;
      *(void *)(v24 + 328) = 0LL;
      *(_DWORD *)(v24 + 352) &= ~0x400u;
    }
  }

  while (1)
  {
    uint64_t v30 = *(void *)(a2 + 1328);
    if (!v30) {
      break;
    }
    uint64_t v31 = *(void *)(v30 + 304);
    uint64_t v32 = *(void **)(v30 + 312);
    if (v31)
    {
      *(void *)(v31 + 312) = v32;
      uint64_t v32 = *(void **)(v30 + 312);
    }

    else
    {
      *(void *)(a2 + 1336) = v32;
    }

    *uint64_t v32 = v31;
    *(void *)(v30 + 304) = 0LL;
    *(void *)(v30 + 312) = 0LL;
    *(_DWORD *)(v30 + 352) &= ~0x200u;
    quic_conn_stream_dequeue((void **)a2, *(void *)(v30 + 24), v30);
  }

  quic_recovery_destroy_deferred(*(void *)(a2 + 952));
  return 1LL;
}

uint64_t __quic_conn_inbound_stopping_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return 1LL;
}

void quic_conn_inbound_stopping_service_stream(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  v17[1] = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }

    uint64_t v6 = _os_log_pack_size();
    uint64_t v7 = (char *)v17 - ((MEMORY[0x1895F8858](v6, v6) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136446210;
    *(void *)(v8 + 4) = "quic_conn_inbound_stopping_service_stream";
    uint64_t v9 = (uint64_t)v7;
    uint64_t v10 = 3678LL;
LABEL_17:
    qlog_internal(17, v9, v10);
    return;
  }

  if (*MEMORY[0x189608EC8] == a2)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }

    uint64_t v11 = _os_log_pack_size();
    uint64_t v12 = (char *)v17 - ((MEMORY[0x1895F8858](v11, v11) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v13 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v13 = 136446210;
    *(void *)(v13 + 4) = "quic_conn_inbound_stopping_service_stream";
    uint64_t v9 = (uint64_t)v12;
    uint64_t v10 = 3679LL;
    goto LABEL_17;
  }

  if (a3)
  {
    quic_fc_service_pending_send_data((uint64_t)a1, a2, (uint64_t)a3);
    quic_update_sndhiwat((uint64_t)a1, a3);
    quic_fc_update_send_limit(*a1, a2, a3);
    return;
  }

  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    uint64_t v14 = _os_log_pack_size();
    uint64_t v15 = (char *)v17 - ((MEMORY[0x1895F8858](v14, v14) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136446210;
    *(void *)(v16 + 4) = "quic_conn_inbound_stopping_service_stream";
    uint64_t v9 = (uint64_t)v15;
    uint64_t v10 = 3680LL;
    goto LABEL_17;
  }

void quic_conn_stream_dequeue(void **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }

    uint64_t v11 = _os_log_pack_size();
    uint64_t v12 = (char *)v19 - ((MEMORY[0x1895F8858](v11, v11) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v13 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v13 = 136446210;
    *(void *)(v13 + 4) = "quic_conn_stream_dequeue";
    uint64_t v14 = (uint64_t)v12;
    uint64_t v15 = 3595LL;
LABEL_23:
    qlog_internal(17, v14, v15);
    return;
  }

  if (*MEMORY[0x189608EC8] == a2)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }

    uint64_t v16 = _os_log_pack_size();
    uint64_t v17 = (char *)v19 - ((MEMORY[0x1895F8858](v16, v16) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v18 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v18 = 136446210;
    *(void *)(v18 + 4) = "quic_conn_stream_dequeue";
    uint64_t v14 = (uint64_t)v17;
    uint64_t v15 = 3596LL;
    goto LABEL_23;
  }

  v20[0] = 0LL;
  v20[1] = v20;
  void v20[2] = 0x2000000000LL;
  char v21 = 0;
  uint64_t v6 = quic_reassq_available(*(void *)(a3 + 256));
  if (v6
    || (uint64_t v10 = *(void *)(a3 + 112), v10 == quic_reassq_fin_offset(*(void *)(a3 + 256))) && *(_BYTE *)(a3 + 251) != 5)
  {
    uint64_t v7 = *a1;
    nw_retain(*a1);
    uint64_t v8 = MEMORY[0x1895F87A8];
    v19[7] = MEMORY[0x1895F87A8];
    v19[8] = 0x40000000LL;
    v19[9] = __quic_conn_stream_dequeue_block_invoke;
    v19[10] = &__block_descriptor_tmp_221;
    v19[11] = v7;
    v19[12] = a2;
    v19[13] = a1;
    v19[14] = v6;
    inbound_data = (void *)nw_protocol_create_inbound_data();
    v19[0] = v8;
    v19[1] = 0x40000000LL;
    void v19[2] = __quic_conn_stream_dequeue_block_invoke_3;
    v19[3] = &unk_18A118318;
    v19[5] = a3;
    v19[6] = a1;
    v19[4] = v20;
    nw_protocol_data_access_buffer();
    if (__quic_signpost_is_enabled__quic_signposts_once_3883[0] != -1) {
      dispatch_once(__quic_signpost_is_enabled__quic_signposts_once_3883, &__block_literal_global_192);
    }
    nw_protocol_instance_add_inbound();
    if (inbound_data) {
      nw_release(inbound_data);
    }
  }

  _Block_object_dispose(v20, 8);
}

void __quic_conn_stream_dequeue_block_invoke(uint64_t a1)
{
}

void __quic_conn_stream_dequeue_block_invoke_3(uint64_t a1, char *a2, uint64_t a3)
{
  uint64_t v3 = a2;
  uint64_t v24 = *MEMORY[0x1895F89C0];
  uint64_t v5 = &a2[a3];
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  __int128 v21 = 0x8220202uLL;
  while (quic_reassq_dequeue(*(int64x2_t **)(*(void *)(a1 + 40) + 256LL), **(void **)(a1 + 40), (uint64_t)&v22))
  {
    uint64_t v11 = DWORD2(v23);
    uint64_t v12 = &v3[DWORD2(v23)];
    if (v12 > v5)
    {
      if ((qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
        && *(void *)(*(void *)(a1 + 48) + 1112LL))
      {
        uint64_t v14 = _os_log_pack_size();
        uint64_t v15 = (char *)&v21 - ((MEMORY[0x1895F8858](v14, v14) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v16 = _os_log_pack_fill();
        uint64_t v17 = *(void *)(a1 + 48);
        uint64_t v18 = v17 + 976;
        uint64_t v19 = quic_cid_describe((unsigned __int8 *)(*(void *)(v17 + 1112) + 38LL));
        uint64_t v20 = quic_cid_describe((unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 1112LL) + 17LL));
        *(_DWORD *)uint64_t v16 = 136446978;
        *(void *)(v16 + 4) = "quic_conn_stream_dequeue_block_invoke_3";
        *(_WORD *)(v16 + 12) = 2082;
        *(void *)(v16 + 14) = v18;
        *(_WORD *)(v16 + 22) = 2082;
        *(void *)(v16 + 24) = v19;
        *(_WORD *)(v16 + 32) = 2082;
        *(void *)(v16 + 34) = v20;
        qlog_internal(16, (uint64_t)v15, 3638LL);
      }

      return;
    }

    memcpy(v3, (const void *)v22, DWORD2(v23));
    uint64_t v10 = *(void *)(a1 + 40);
    if (BYTE12(v23) && *(_BYTE *)(v10 + 251) != 5)
    {
      char v13 = qlog_nwlog_enabled;
      if (qlog_datapath_enabled || qlog_nwlog_enabled)
      {
        if (qlog_debug_enabled) {
          char v13 = 1;
        }
        if ((v13 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v6 = _os_log_pack_size();
          uint64_t v7 = (char *)&v21 - ((MEMORY[0x1895F8858](v6, v6) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          uint64_t v8 = _os_log_pack_fill();
          uint64_t v9 = **(void **)(a1 + 40);
          *(_DWORD *)uint64_t v8 = v21;
          *(void *)(v8 + 4) = "quic_conn_stream_dequeue_block_invoke";
          *(_WORD *)(v8 + 12) = 2048;
          *(void *)(v8 + 14) = v9;
          qlog_internal(2, (uint64_t)v7, 3656LL);
          uint64_t v10 = *(void *)(a1 + 40);
        }
      }

      quic_fsm_recv_stream_change((_BYTE *)(v10 + 251), 5u);
      *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
      uint64_t v11 = DWORD2(v23);
      uint64_t v10 = *(void *)(a1 + 40);
    }

    *(void *)(v10 + 112) += v11;
    _quic_reassq_free_dequeue_item((uint64_t)&v22);
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    uint64_t v3 = v12;
  }

uint64_t __quic_conn_stream_dequeue_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return 1LL;
}

BOOL quic_conn_handle_start(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if (*MEMORY[0x189608EC8] != a2)
    {
      v12[0] = MEMORY[0x1895F87A8];
      v12[1] = 0x40000000LL;
      void v12[2] = __quic_conn_handle_start_block_invoke;
      v12[3] = &__block_descriptor_tmp_112;
      v12[4] = a1;
      v12[5] = a2;
      char v13 = a3;
      nw_protocol_instance_access_state();
      return 1LL;
    }

    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || (BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT)))
    {
      uint64_t v9 = _os_log_pack_size();
      uint64_t v10 = (char *)v12 - ((MEMORY[0x1895F8858](v9, v9) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v11 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v11 = 136446210;
      *(void *)(v11 + 4) = "quic_conn_handle_start";
      uint64_t v7 = (uint64_t)v10;
      uint64_t v8 = 3907LL;
      goto LABEL_13;
    }
  }

  else if (qlog_debug_enabled {
         || (qlog_nwlog_enabled & 1) != 0
  }
         || (BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT)))
  {
    uint64_t v4 = _os_log_pack_size();
    uint64_t v5 = (char *)v12 - ((MEMORY[0x1895F8858](v4, v4) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v6 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v6 = 136446210;
    *(void *)(v6 + 4) = "quic_conn_handle_start";
    uint64_t v7 = (uint64_t)v5;
    uint64_t v8 = 3906LL;
LABEL_13:
    qlog_internal(17, v7, v8);
    return 0LL;
  }

  return result;
}

uint64_t __quic_conn_handle_start_block_invoke(uint64_t a1, uint64_t a2)
{
  return 1LL;
}

void quic_conn_handle_start_inner(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  uint64_t v109 = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }

    uint64_t v88 = _os_log_pack_size();
    unsigned int v89 = (char *)&v97 - ((MEMORY[0x1895F8858](v88, v88) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v90 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v90 = 136446210;
    *(void *)(v90 + 4) = "quic_conn_handle_start_inner";
    uint64_t v91 = (uint64_t)v89;
    uint64_t v92 = 3766LL;
LABEL_146:
    qlog_internal(17, v91, v92);
    return;
  }

  if (!a2)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }

    uint64_t v93 = _os_log_pack_size();
    uint64_t v94 = (char *)&v97 - ((MEMORY[0x1895F8858](v93, v93) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v95 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v95 = 136446210;
    *(void *)(v95 + 4) = "quic_conn_handle_start_inner";
    uint64_t v91 = (uint64_t)v94;
    uint64_t v92 = 3767LL;
    goto LABEL_146;
  }

  uint64_t v108 = -1LL;
  uint64_t flow_for_key = nw_protocol_instance_get_flow_for_key();
  uint64_t v9 = flow_for_key;
  if (*MEMORY[0x189608ED0] == a3)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = _os_log_pack_size();
      uint64_t v11 = (char *)&v97 - ((MEMORY[0x1895F8858](v10, v10) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v12 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v12 = 136446210;
      *(void *)(v12 + 4) = "quic_conn_handle_start_inner";
      qlog_internal(2, (uint64_t)v11, 3773LL);
    }
  }

  else if (flow_for_key != a3)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = _os_log_pack_size();
      uint64_t v14 = (char *)&v97 - ((MEMORY[0x1895F8858](v13, v13) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v15 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v15 = 136446722;
      *(void *)(v15 + 4) = "quic_conn_handle_start_inner";
      *(_WORD *)(v15 + 12) = 2048;
      *(void *)(v15 + 14) = a3;
      *(_WORD *)(v15 + 22) = 2048;
      *(void *)(v15 + 24) = v9;
      qlog_internal(2, (uint64_t)v14, 3776LL);
    }

    uint64_t v102 = MEMORY[0x1895F87A8];
    uint64_t v103 = 0x40000000LL;
    uint64_t v104 = __quic_conn_handle_start_inner_block_invoke;
    uint64_t v105 = &__block_descriptor_tmp_224;
    uint64_t v106 = a2;
    uint64_t v107 = a3;
    nw_protocol_instance_access_flow_state();
  }

  uint64_t stats_region = nw_protocol_instance_get_stats_region();
  uint64_t v17 = &g_quic_stats;
  if (stats_region) {
    uint64_t v17 = (void *)stats_region;
  }
  *(void *)(a2 + 1312) = v17;
  uint64_t stats = nw_protocol_instance_get_stats();
  *(void *)(a2 + 1304) = stats;
  if (stats)
  {
    *(void *)(stats + 16) = *(void *)(a2 + 1144);
    uint64_t v19 = *(void *)(a2 + 1304);
    if (v19)
    {
      *(void *)(v19 + 24) = *(void *)(a2 + 1152);
      uint64_t v20 = *(void *)(a2 + 1304);
      if (v20)
      {
        *(void *)(v20 + 32) = *(void *)(a2 + 1160);
        uint64_t v21 = *(void *)(a2 + 1304);
        if (v21)
        {
          *(void *)(v21 + 40) = *(void *)(a2 + 1168);
          uint64_t v22 = *(void *)(a2 + 1304);
          if (v22)
          {
            *(_DWORD *)(v22 + 48) = *(_DWORD *)(a2 + 1176);
            uint64_t v23 = *(void *)(a2 + 1304);
            if (v23)
            {
              *(_DWORD *)(v23 + 52) = *(_DWORD *)(a2 + 1180);
              uint64_t v24 = *(void *)(a2 + 1304);
              if (v24)
              {
                *(_DWORD *)(v24 + 56) = *(_DWORD *)(a2 + 1188);
                uint64_t v25 = *(void *)(a2 + 1304);
                if (v25)
                {
                  *(_DWORD *)(v25 + 60) = *(_DWORD *)(a2 + 1192);
                  uint64_t v26 = *(void *)(a2 + 1304);
                  if (v26)
                  {
                    *(_DWORD *)(v26 + 60) = *(unsigned __int8 *)(a2 + 477) == 9;
                    uint64_t v27 = *(void *)(a2 + 1304);
                    if (v27) {
                      *(_DWORD *)(v27 + 124) = *(unsigned __int8 *)(a2 + 477);
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

  uint64_t v28 = *(void *)(a2 + 1112);
  if (v28 && quic_rtt_has_initial_measurement(*(void *)(v28 + 272)))
  {
    uint64_t v29 = *(void *)(a2 + 1304);
    if (!v29) {
      goto LABEL_35;
    }
    *(_DWORD *)(*(void *)(a2 + 1304) + 68LL) = (unint64_t)((4
                                                                   * (quic_rtt_get_min_rtt(*(void *)(*(void *)(a2 + 1112) + 272LL)) & 0x7FFFFFFFFFFFFFFuLL)
                                                                   * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4;
    uint64_t v29 = *(void *)(a2 + 1304);
    if (!v29) {
      goto LABEL_35;
    }
    *(_DWORD *)(*(void *)(a2 + 1304) + 72LL) = (unint64_t)((4
                                                                   * (quic_rtt_get_smoothed_rtt(*(void *)(*(void *)(a2 + 1112) + 272LL)) & 0x7FFFFFFFFFFFFFFuLL)
                                                                   * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4;
    uint64_t v29 = *(void *)(a2 + 1304);
    if (!v29) {
      goto LABEL_35;
    }
    *(_DWORD *)(*(void *)(a2 + 1304) + 76LL) = (unint64_t)((2
                                                                   * (quic_rtt_get_rtt_variance(*(void *)(*(void *)(a2 + 1112) + 272LL)) & 0xFFFFFFFFFFFFFFFuLL)
                                                                   * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4;
  }

  uint64_t v29 = *(void *)(a2 + 1304);
  if (v29)
  {
    *(_OWORD *)(v29 + 128) = *(_OWORD *)(a2 + 1288);
    uint64_t v29 = *(void *)(a2 + 1304);
  }

uint64_t __quic_conn_handle_start_inner_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v3 + 477) == 9 && !*(_BYTE *)(a2 + 250) && !*(_BYTE *)(a2 + 251)) {
    quic_stream_send_create(v3, *(void *)(a1 + 40), a2);
  }
  return 1LL;
}

void quic_conn_idle_timeout_configure(uint64_t a1)
{
  v6[5] = *MEMORY[0x1895F89C0];
  if (*(_BYTE *)(a1 + 585))
  {
    quic_conn_idle_timeout_fired(a1, *(unsigned __int8 ***)(a1 + 576), *(unsigned __int8 *)(a1 + 585));
  }

  else
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v2 = _os_log_pack_size();
      uint64_t v3 = (char *)v6 - ((MEMORY[0x1895F8858](v2, v2) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v4 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v4 = 136446210;
      *(void *)(v4 + 4) = "quic_conn_idle_timeout_configure";
      qlog_internal(2, (uint64_t)v3, 4900LL);
    }

    uint64_t v5 = *(void *)(a1 + 576);
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 0x40000000LL;
    void v6[2] = __quic_conn_idle_timeout_configure_block_invoke;
    v6[3] = &__block_descriptor_tmp_128;
    v6[4] = a1;
    *(_BYTE *)(a1 + 585) = quic_timer_insert(v5, (uint64_t)"idle", 30000000LL, v6);
  }

void __quic_conn_idle_timeout_configure_block_invoke(uint64_t a1, unsigned __int8 **a2, int a3)
{
}

void quic_conn_idle_timeout_fired(uint64_t a1, unsigned __int8 **a2, int a3)
{
  uint64_t v53 = *MEMORY[0x1895F89C0];
  if (*(_BYTE *)(a1 + 477) != 9)
  {
    uint64_t v10 = 30000LL;
    goto LABEL_17;
  }

  unint64_t v6 = quic_tp_get(*(_BYTE **)(a1 + 552), 1LL);
  unint64_t v7 = quic_tp_get(*(_BYTE **)(a1 + 544), 1LL);
  if (v6 >= v7) {
    unint64_t v8 = v7;
  }
  else {
    unint64_t v8 = v6;
  }
  if (v7) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9) {
    uint64_t v10 = v7 + v6;
  }
  else {
    uint64_t v10 = v8;
  }
  if (v10)
  {
LABEL_17:
    if (*(void *)(a1 + 632) <= *(void *)(a1 + 648)) {
      unint64_t v14 = *(void *)(a1 + 648);
    }
    else {
      unint64_t v14 = *(void *)(a1 + 632);
    }
    uint64_t v15 = mach_continuous_time();
    uint64_t v52 = a2;
    if (timebase_info_once != -1) {
      dispatch_once(&timebase_info_once, &__block_literal_global_397);
    }
    unint64_t v16 = timebase_info_info * v15 / dword_18C4D003C / 0x3E8;
    unint64_t v51 = v10;
    unint64_t v17 = 1000 * v10;
    if (v16 >= v14) {
      unint64_t v18 = v16 - v14;
    }
    else {
      unint64_t v18 = 0LL;
    }
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v19 = _os_log_pack_size();
      uint64_t v20 = (char *)v49 - ((MEMORY[0x1895F8858](v19, v19) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v21 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v21 = 136447234;
      *(void *)(v21 + 4) = "quic_conn_idle_timeout_fired";
      *(_WORD *)(v21 + 12) = 2048;
      *(void *)(v21 + 14) = v16;
      *(_WORD *)(v21 + 22) = 2048;
      *(void *)(v21 + 24) = v14;
      *(_WORD *)(v21 + 32) = 2048;
      *(void *)(v21 + 34) = v18;
      *(_WORD *)(v21 + 42) = 2048;
      *(void *)(v21 + 44) = v17;
      qlog_internal(2, (uint64_t)v20, 4883LL);
      if (v17 > v18)
      {
        if ((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1) {
          goto LABEL_35;
        }
        goto LABEL_34;
      }

      if ((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1)
      {
LABEL_37:
        if (*(void *)(a1 + 1112))
        {
          uint64_t v26 = _os_log_pack_size();
          uint64_t v52 = (unsigned __int8 **)v49;
          uint64_t v27 = (char *)v49 - ((MEMORY[0x1895F8858](v26, v26) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          v49[1] = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          uint64_t v28 = _os_log_pack_fill();
          uint64_t v50 = a1 + 976;
          uint64_t v29 = *(unsigned __int8 **)(a1 + 1112);
          if (quic_cid_describe_state % 3 == 2) {
            uint64_t v30 = &quic_cid_describe_cid_buf2;
          }
          else {
            uint64_t v30 = &quic_cid_describe_cid_buf3;
          }
          if (quic_cid_describe_state % 3) {
            unsigned int v31 = v30;
          }
          else {
            unsigned int v31 = &quic_cid_describe_cid_buf1;
          }
          int v32 = ++quic_cid_describe_state;
          unsigned int v33 = v29[38];
          __int128 v34 = 0uLL;
          *(_OWORD *)((char *)v31 + 25) = 0u;
          if (v33 >= 0x14) {
            uint64_t v35 = 20LL;
          }
          else {
            uint64_t v35 = v33;
          }
          _OWORD *v31 = 0uLL;
          v31[1] = 0uLL;
          if ((_DWORD)v35)
          {
            uint64_t v36 = v29 + 39;
            do
            {
              int v37 = *v36++;
              snprintf((char *)v31, 0x29uLL, "%s%02x", (const char *)v31, v37);
              --v35;
            }

            while (v35);
            uint64_t v29 = *(unsigned __int8 **)(a1 + 1112);
            int v32 = quic_cid_describe_state;
            __int128 v34 = 0uLL;
          }

          if (v32 % 3 == 2) {
            uint64_t v38 = &quic_cid_describe_cid_buf2;
          }
          else {
            uint64_t v38 = &quic_cid_describe_cid_buf3;
          }
          if (v32 % 3) {
            uint64_t v39 = v38;
          }
          else {
            uint64_t v39 = &quic_cid_describe_cid_buf1;
          }
          quic_cid_describe_unsigned int state = v32 + 1;
          if (v29[17] >= 0x14u) {
            uint64_t v40 = 20LL;
          }
          else {
            uint64_t v40 = v29[17];
          }
          *uint64_t v39 = v34;
          v39[1] = v34;
          *(_OWORD *)((char *)v39 + 25) = v34;
          if ((_DWORD)v40)
          {
            uint64_t v41 = v29 + 18;
            do
            {
              int v42 = *v41++;
              snprintf((char *)v39, 0x29uLL, "%s%02x", (const char *)v39, v42);
              --v40;
            }

            while (v40);
          }

          uint64_t v43 = v50;
          unint64_t v44 = v51 >> 3;
          *(void *)(v28 + 4) = "quic_conn_idle_timeout_fired";
          *(_DWORD *)uint64_t v28 = 136447234;
          *(_WORD *)(v28 + 12) = 2082;
          *(void *)(v28 + 14) = v43;
          *(_WORD *)(v28 + 22) = 2082;
          *(void *)(v28 + 24) = v31;
          *(_WORD *)(v28 + 32) = 2082;
          *(void *)(v28 + 34) = v39;
          *(_WORD *)(v28 + 42) = 2048;
          *(void *)(v28 + 44) = (unint64_t)((v44 * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4;
          qlog_internal(1, (uint64_t)v27, 4886LL);
          if (!a1)
          {
            if (qlog_debug_enabled
              || (qlog_nwlog_enabled & 1) != 0
              || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
            {
              uint64_t v46 = _os_log_pack_size();
              unsigned int v47 = (char *)v49 - ((MEMORY[0x1895F8858](v46, v46) + 15) & 0xFFFFFFFFFFFFFFF0LL);
              uint64_t v48 = _os_log_pack_fill();
              *(_DWORD *)uint64_t v48 = 136446210;
              *(void *)(v48 + 4) = "quic_conn_set_posix_error";
              qlog_internal(17, (uint64_t)v47, 1734LL);
            }

            goto LABEL_67;
          }

          char v45 = *(void **)(a1 + 1104);
          if (!v45)
          {
LABEL_66:
            *(void *)(a1 + 1104) = nw_error_create_posix_error();
LABEL_67:
            quic_conn_drain(a1);
            return;
          }

LABEL_65:
          nw_release(v45);
          *(void *)(a1 + 1104) = 0LL;
          goto LABEL_66;
        }

uint64_t quic_conn_handle_stop()
{
  return nw_protocol_instance_access_state();
}

uint64_t quic_conn_traffic_mgmt()
{
  return nw_protocol_instance_access_state();
}

uint64_t __quic_conn_traffic_mgmt_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v59 = *MEMORY[0x1895F89C0];
  int v2 = *(unsigned __int8 *)(a1 + 32);
  if (((*(_DWORD *)(a2 + 1380) >> 9) & 1) == v2) {
    return 1LL;
  }
  uint64_t v6 = a2 + 1380;
  if (!qlog_debug_enabled
    && (qlog_nwlog_enabled & 1) == 0
    && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO)
    || !*(void *)(a2 + 1112))
  {
    goto LABEL_36;
  }

  uint64_t v7 = _os_log_pack_size();
  uint64_t v52 = v50;
  unint64_t v8 = (char *)v50 - ((MEMORY[0x1895F8858](v7, v7) + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v50[1] = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v9 = _os_log_pack_fill();
  uint64_t v51 = a2 + 976;
  uint64_t v10 = *(unsigned __int8 **)(a2 + 1112);
  if (quic_cid_describe_state % 3 == 2) {
    uint64_t v11 = &quic_cid_describe_cid_buf2;
  }
  else {
    uint64_t v11 = &quic_cid_describe_cid_buf3;
  }
  if (quic_cid_describe_state % 3) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = &quic_cid_describe_cid_buf1;
  }
  int v13 = ++quic_cid_describe_state;
  unsigned int v14 = v10[38];
  __int128 v15 = 0uLL;
  *(_OWORD *)((char *)v12 + 25) = 0u;
  if (v14 >= 0x14) {
    uint64_t v16 = 20LL;
  }
  else {
    uint64_t v16 = v14;
  }
  _OWORD *v12 = 0uLL;
  v12[1] = 0uLL;
  if ((_DWORD)v16)
  {
    unint64_t v17 = v10 + 39;
    do
    {
      int v18 = *v17++;
      snprintf((char *)v12, 0x29uLL, "%s%02x", (const char *)v12, v18);
      --v16;
    }

    while (v16);
    uint64_t v10 = *(unsigned __int8 **)(a2 + 1112);
    int v13 = quic_cid_describe_state;
    __int128 v15 = 0uLL;
  }

  if (v13 % 3 == 2) {
    uint64_t v19 = &quic_cid_describe_cid_buf2;
  }
  else {
    uint64_t v19 = &quic_cid_describe_cid_buf3;
  }
  if (v13 % 3) {
    uint64_t v20 = v19;
  }
  else {
    uint64_t v20 = &quic_cid_describe_cid_buf1;
  }
  quic_cid_describe_unsigned int state = v13 + 1;
  if (v10[17] >= 0x14u) {
    uint64_t v21 = 20LL;
  }
  else {
    uint64_t v21 = v10[17];
  }
  *uint64_t v20 = v15;
  v20[1] = v15;
  *(_OWORD *)((char *)v20 + 25) = v15;
  if ((_DWORD)v21)
  {
    uint64_t v22 = v10 + 18;
    do
    {
      int v23 = *v22++;
      snprintf((char *)v20, 0x29uLL, "%s%02x", (const char *)v20, v23);
      --v21;
    }

    while (v21);
  }

  int v24 = *(unsigned __int8 *)(a1 + 32);
  uint64_t v25 = "background";
  *(void *)(v9 + 4) = "quic_conn_traffic_mgmt_block_invoke";
  *(_DWORD *)uint64_t v9 = 136447234;
  *(_WORD *)(v9 + 12) = 2082;
  if (!v24) {
    uint64_t v25 = "foreground";
  }
  *(void *)(v9 + 14) = v51;
  *(_WORD *)(v9 + 22) = 2082;
  *(void *)(v9 + 24) = v12;
  *(_WORD *)(v9 + 32) = 2082;
  *(void *)(v9 + 34) = v20;
  *(_WORD *)(v9 + 42) = 2082;
  *(void *)(v9 + 44) = v25;
  qlog_internal(1, (uint64_t)v8, 4152LL);
  if (a2)
  {
    int v2 = *(unsigned __int8 *)(a1 + 32);
LABEL_36:
    v53[0] = MEMORY[0x1895F87A8];
    v53[1] = 0x40000000LL;
    void v53[2] = __quic_conn_set_priority_block_invoke;
    v53[3] = &__block_descriptor_tmp_230;
    char v54 = v2;
    v53[4] = a2;
    v55[0] = MEMORY[0x1895F87A8];
    v55[1] = 0x40000000LL;
    uint64_t v56 = __quic_conn_foreach_validated_path_block_invoke;
    int v57 = &unk_18A118098;
    uint64_t v58 = v53;
    uint64_t v26 = *(void *)(a2 + 1360);
    do
    {
      if (!v26) {
        break;
      }
      uint64_t v27 = *(void *)(v26 + 312);
      char v28 = ((uint64_t (*)(void *))v56)(v55);
      uint64_t v26 = v27;
    }

    while ((v28 & 1) != 0);
    *(void *)uint64_t v6 = *(void *)v6 & 0xFFFFFFFFFFFFFDFFLL | ((unint64_t)(v2 != 0) << 9);
    goto LABEL_40;
  }

  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    uint64_t v47 = _os_log_pack_size();
    uint64_t v48 = (char *)v50 - ((MEMORY[0x1895F8858](v47, v47) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v49 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v49 = 136446210;
    *(void *)(v49 + 4) = "quic_conn_set_priority";
    qlog_internal(17, (uint64_t)v48, 4100LL);
  }

uint64_t __quic_conn_set_priority_block_invoke(uint64_t a1, void *a2)
{
  v15[1] = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(_BYTE *)(a1 + 40))
  {
    uint64_t bg_cc = quic_path_get_or_create_bg_cc((uint64_t)a2, *(void *)(v4 + 1136));
    quic_cc_switch_cc(bg_cc);
    a2[45] = bg_cc;
    quic_ecn_set_disable_ect(*(void *)(*(void *)(a1 + 32) + 968LL), 1);
    uint64_t v6 = (uint64_t)a2;
    int v7 = 1;
    goto LABEL_9;
  }

  if ((*(_BYTE *)(v4 + 1383) & 2) == 0 || (uint64_t v8 = a2[48]) == 0)
  {
    quic_cc_switch_cc(a2[46]);
    uint64_t v9 = a2[46];
    goto LABEL_8;
  }

  if (a2[49])
  {
    quic_cc_switch_cc(v8);
    uint64_t v9 = a2[48];
LABEL_8:
    a2[45] = v9;
    quic_ecn_set_disable_ect(*(void *)(*(void *)(a1 + 32) + 968LL), 0);
    uint64_t v6 = (uint64_t)a2;
    int v7 = 0;
LABEL_9:
    quic_ecn_path_set_disable_ect(v6, v7);
    uint64_t v10 = a2[49];
    if (v10) {
      quic_pacer_reset(v10);
    }
    return 1LL;
  }

  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    uint64_t v12 = _os_log_pack_size();
    int v13 = (char *)v15 - ((MEMORY[0x1895F8858](v12, v12) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 136446210;
    *(void *)(v14 + 4) = "quic_conn_set_priority_block_invoke";
    qlog_internal(17, (uint64_t)v13, 4118LL);
  }

  return 1LL;
}

uint64_t __quic_conn_foreach_validated_path_block_invoke(uint64_t a1, uint64_t a2)
{
  if (quic_path_is_validated(a2)) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
  else {
    return 1LL;
  }
}

void quic_conn_new_dcid(uint64_t a1, uint64_t a2, const void *a3, _OWORD *a4)
{
  v14[1] = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }

    uint64_t v6 = _os_log_pack_size();
    int v7 = (char *)v14 - ((MEMORY[0x1895F8858](v6, v6) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136446210;
    *(void *)(v8 + 4) = "quic_conn_new_dcid";
    uint64_t v9 = (uint64_t)v7;
    uint64_t v10 = 4277LL;
LABEL_13:
    qlog_internal(17, v9, v10);
    return;
  }

  if (!a3)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }

    uint64_t v11 = _os_log_pack_size();
    uint64_t v12 = (char *)v14 - ((MEMORY[0x1895F8858](v11, v11) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v13 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v13 = 136446210;
    *(void *)(v13 + 4) = "quic_conn_new_dcid";
    uint64_t v9 = (uint64_t)v12;
    uint64_t v10 = 4278LL;
    goto LABEL_13;
  }

  quic_cid_array_insert(*(unsigned __int8 **)(a1 + 384), a2, (uint64_t)a3, a4);
  dispatch_data_t v5 = dispatch_data_create(a3, 0x15uLL, 0LL, 0LL);
  nw_protocol_instance_notify_connection_id_changed();
  if (!v5) {
    qlog_abort_internal("%s data is NULL", "quic_conn_notify_connection_id_change");
  }
  dispatch_release(v5);
}

void quic_conn_new_scid(uint64_t a1, const void *a2)
{
  v7[1] = *MEMORY[0x1895F89C0];
  if (a2)
  {
    quic_cid_array_insert(*(unsigned __int8 **)(a1 + 376), 0LL, (uint64_t)a2, 0LL);
    dispatch_data_t v3 = dispatch_data_create(a2, 0x15uLL, 0LL, 0LL);
    nw_protocol_instance_notify_connection_id_changed();
    if (!v3) {
      qlog_abort_internal("%s data is NULL", "quic_conn_notify_connection_id_change");
    }
    dispatch_release(v3);
  }

  else if (qlog_debug_enabled {
         || (qlog_nwlog_enabled & 1) != 0
  }
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    uint64_t v4 = _os_log_pack_size();
    dispatch_data_t v5 = (char *)v7 - ((MEMORY[0x1895F8858](v4, v4) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v6 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v6 = 136446210;
    *(void *)(v6 + 4) = "quic_conn_new_scid";
    qlog_internal(17, (uint64_t)v5, 4315LL);
  }

void quic_conn_retire_dcid_by_seq(uint64_t a1, uint64_t a2)
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v4 = quic_cid_array_find_by_seq_num(*(unsigned __int8 **)(a1 + 384), a2);
    if (v4)
    {
      uint64_t v5 = v4;
      if ((qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))
        && *(void *)(a1 + 1112))
      {
        uint64_t v6 = _os_log_pack_size();
        unsigned int v31 = &v29;
        int v7 = (char *)&v29 - ((MEMORY[0x1895F8858](v6, v6) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v8 = _os_log_pack_fill();
        uint64_t v30 = a1 + 976;
        uint64_t v9 = *(unsigned __int8 **)(a1 + 1112);
        if (quic_cid_describe_state % 3 == 2) {
          uint64_t v10 = &quic_cid_describe_cid_buf2;
        }
        else {
          uint64_t v10 = &quic_cid_describe_cid_buf3;
        }
        if (quic_cid_describe_state % 3) {
          uint64_t v11 = v10;
        }
        else {
          uint64_t v11 = &quic_cid_describe_cid_buf1;
        }
        int v12 = ++quic_cid_describe_state;
        unsigned int v13 = v9[38];
        __int128 v14 = 0uLL;
        *(_OWORD *)((char *)v11 + 25) = 0u;
        if (v13 >= 0x14) {
          uint64_t v15 = 20LL;
        }
        else {
          uint64_t v15 = v13;
        }
        _OWORD *v11 = 0uLL;
        v11[1] = 0uLL;
        if ((_DWORD)v15)
        {
          uint64_t v16 = v9 + 39;
          do
          {
            int v17 = *v16++;
            snprintf((char *)v11, 0x29uLL, "%s%02x", (const char *)v11, v17);
            --v15;
          }

          while (v15);
          uint64_t v9 = *(unsigned __int8 **)(a1 + 1112);
          int v12 = quic_cid_describe_state;
          __int128 v14 = 0uLL;
        }

        if (v12 % 3 == 2) {
          int v18 = &quic_cid_describe_cid_buf2;
        }
        else {
          int v18 = &quic_cid_describe_cid_buf3;
        }
        if (v12 % 3) {
          uint64_t v19 = v18;
        }
        else {
          uint64_t v19 = &quic_cid_describe_cid_buf1;
        }
        quic_cid_describe_unsigned int state = v12 + 1;
        if (v9[17] >= 0x14u) {
          uint64_t v20 = 20LL;
        }
        else {
          uint64_t v20 = v9[17];
        }
        _OWORD *v19 = v14;
        v19[1] = v14;
        *(_OWORD *)((char *)v19 + 25) = v14;
        if ((_DWORD)v20)
        {
          uint64_t v21 = v9 + 18;
          do
          {
            int v22 = *v21++;
            snprintf((char *)v19, 0x29uLL, "%s%02x", (const char *)v19, v22);
            --v20;
          }

          while (v20);
        }

        *(_DWORD *)uint64_t v8 = 136447234;
        *(void *)(v8 + 4) = "quic_conn_retire_dcid_by_seq";
        *(_WORD *)(v8 + 12) = 2082;
        *(void *)(v8 + 14) = v30;
        *(_WORD *)(v8 + 22) = 2082;
        *(void *)(v8 + 24) = v11;
        *(_WORD *)(v8 + 32) = 2082;
        *(void *)(v8 + 34) = v19;
        *(_WORD *)(v8 + 42) = 2048;
        *(void *)(v8 + 44) = a2;
        qlog_internal(1, (uint64_t)v7, 4347LL);
      }

      int v23 = (const void *)(v5 + 1);
      uint64_t v24 = *(void *)(v5 + 40);
      dispatch_data_t v25 = dispatch_data_create(v23, 0x15uLL, 0LL, 0LL);
      nw_protocol_instance_notify_connection_id_changed();
      if (!v25) {
        qlog_abort_internal("%s data is NULL", "quic_conn_notify_connection_id_change");
      }
      dispatch_release(v25);
      quic_migration_retire_dcid(*(void *)(a1 + 1120), (uint64_t)v23);
      quic_protector_destroy_mp_space(*(void *)(a1 + 568), v24);
      quic_cid_array_remove_by_seq_num(*(unsigned __int8 **)(a1 + 384), v24);
    }
  }

  else if (qlog_debug_enabled {
         || (qlog_nwlog_enabled & 1) != 0
  }
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    uint64_t v26 = _os_log_pack_size();
    uint64_t v27 = (char *)&v29 - ((MEMORY[0x1895F8858](v26, v26) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v28 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v28 = 136446210;
    *(void *)(v28 + 4) = "quic_conn_retire_dcid_by_seq";
    qlog_internal(17, (uint64_t)v27, 4340LL);
  }

uint64_t quic_conn_retire_dcid(uint64_t a1, _BYTE *a2)
{
  v23[1] = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return -1LL;
    }

    uint64_t v14 = _os_log_pack_size();
    uint64_t v15 = (char *)v23 - ((MEMORY[0x1895F8858](v14, v14) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136446210;
    *(void *)(v16 + 4) = "quic_conn_retire_dcid";
    uint64_t v17 = (uint64_t)v15;
    uint64_t v18 = 4368LL;
    goto LABEL_28;
  }

  if (!a2)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return -1LL;
    }

    uint64_t v19 = _os_log_pack_size();
    uint64_t v20 = (char *)v23 - ((MEMORY[0x1895F8858](v19, v19) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v21 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v21 = 136446210;
    *(void *)(v21 + 4) = "quic_conn_retire_dcid";
    uint64_t v17 = (uint64_t)v20;
    uint64_t v18 = 4369LL;
LABEL_28:
    qlog_internal(17, v17, v18);
    return -1LL;
  }

  uint64_t v4 = quic_cid_array_find_by_cid(*(unsigned __int8 **)(a1 + 384), a2);
  if (v4)
  {
    uint64_t v5 = *(void *)(v4 + 40);
    quic_conn_retire_dcid_by_seq(a1, v5);
    return v5;
  }

  if (!qlog_debug_enabled
    && (qlog_nwlog_enabled & 1) == 0
    && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    return -1LL;
  }

  uint64_t v6 = _os_log_pack_size();
  int v7 = (char *)v23 - ((MEMORY[0x1895F8858](v6, v6) + 15) & 0xFFFFFFFFFFFFFFF0LL);
  _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v8 = _os_log_pack_fill();
  uint64_t v9 = &quic_cid_describe_cid_buf3;
  if (quic_cid_describe_state % 3 == 2) {
    uint64_t v9 = &quic_cid_describe_cid_buf2;
  }
  if (quic_cid_describe_state % 3) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = &quic_cid_describe_cid_buf1;
  }
  ++quic_cid_describe_state;
  else {
    uint64_t v11 = *a2;
  }
  _OWORD *v10 = 0u;
  v10[1] = 0u;
  *(_OWORD *)((char *)v10 + 25) = 0u;
  if ((_DWORD)v11)
  {
    int v12 = a2 + 1;
    do
    {
      int v13 = *v12++;
      snprintf((char *)v10, 0x29uLL, "%s%02x", (const char *)v10, v13);
      --v11;
    }

    while (v11);
  }

  *(_DWORD *)uint64_t v8 = 136446466;
  *(void *)(v8 + 4) = "quic_conn_retire_dcid";
  *(_WORD *)(v8 + 12) = 2082;
  *(void *)(v8 + 14) = v10;
  qlog_internal(17, (uint64_t)v7, 4377LL);
  return -1LL;
}

void quic_conn_retire_scid_by_seq(uint64_t a1, uint64_t a2)
{
  uint64_t v72 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v4 = quic_cid_array_find_by_seq_num(*(unsigned __int8 **)(a1 + 376), a2);
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = &unk_18C6EB000;
      int v7 = &unk_18C6EB000;
      if ((qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))
        && *(void *)(a1 + 1112))
      {
        uint64_t v8 = _os_log_pack_size();
        unsigned int v71 = &v69;
        uint64_t v9 = (char *)&v69 - ((MEMORY[0x1895F8858](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v10 = _os_log_pack_fill();
        uint64_t v70 = a1 + 976;
        uint64_t v11 = *(unsigned __int8 **)(a1 + 1112);
        if (quic_cid_describe_state % 3 == 2) {
          int v12 = &quic_cid_describe_cid_buf2;
        }
        else {
          int v12 = &quic_cid_describe_cid_buf3;
        }
        if (quic_cid_describe_state % 3) {
          int v13 = v12;
        }
        else {
          int v13 = &quic_cid_describe_cid_buf1;
        }
        int v14 = ++quic_cid_describe_state;
        unsigned int v15 = v11[38];
        __int128 v16 = 0uLL;
        *(_OWORD *)((char *)v13 + 25) = 0u;
        if (v15 >= 0x14) {
          uint64_t v17 = 20LL;
        }
        else {
          uint64_t v17 = v15;
        }
        *int v13 = 0uLL;
        v13[1] = 0uLL;
        if ((_DWORD)v17)
        {
          uint64_t v18 = v11 + 39;
          do
          {
            int v19 = *v18++;
            snprintf((char *)v13, 0x29uLL, "%s%02x", (const char *)v13, v19);
            --v17;
          }

          while (v17);
          uint64_t v11 = *(unsigned __int8 **)(a1 + 1112);
          int v14 = quic_cid_describe_state;
          __int128 v16 = 0uLL;
        }

        if (v14 % 3 == 2) {
          uint64_t v20 = &quic_cid_describe_cid_buf2;
        }
        else {
          uint64_t v20 = &quic_cid_describe_cid_buf3;
        }
        if (v14 % 3) {
          uint64_t v21 = v20;
        }
        else {
          uint64_t v21 = &quic_cid_describe_cid_buf1;
        }
        quic_cid_describe_unsigned int state = v14 + 1;
        if (v11[17] >= 0x14u) {
          uint64_t v22 = 20LL;
        }
        else {
          uint64_t v22 = v11[17];
        }
        *uint64_t v21 = v16;
        v21[1] = v16;
        *(_OWORD *)((char *)v21 + 25) = v16;
        if ((_DWORD)v22)
        {
          int v23 = v11 + 18;
          do
          {
            int v24 = *v23++;
            snprintf((char *)v21, 0x29uLL, "%s%02x", (const char *)v21, v24);
            --v22;
          }

          while (v22);
        }

        *(_DWORD *)uint64_t v10 = 136447234;
        *(void *)(v10 + 4) = "quic_conn_retire_scid_by_seq";
        *(_WORD *)(v10 + 12) = 2082;
        *(void *)(v10 + 14) = v70;
        *(_WORD *)(v10 + 22) = 2082;
        *(void *)(v10 + 24) = v13;
        *(_WORD *)(v10 + 32) = 2082;
        *(void *)(v10 + 34) = v21;
        *(_WORD *)(v10 + 42) = 2048;
        *(void *)(v10 + 44) = a2;
        qlog_internal(1, (uint64_t)v9, 4397LL);
        int v7 = &unk_18C6EB000;
        uint64_t v6 = &unk_18C6EB000;
      }

      dispatch_data_t v25 = (const void *)(v5 + 1);
      dispatch_data_t v26 = dispatch_data_create(v25, 0x15uLL, 0LL, 0LL);
      nw_protocol_instance_notify_connection_id_changed();
      if (!v26) {
        qlog_abort_internal("%s data is NULL", "quic_conn_notify_connection_id_change");
      }
      dispatch_release(v26);
      quic_migration_retire_scid(*(void *)(a1 + 1120), (uint64_t)v25);
      quic_ack_destroy_multipath_pn_space(*(void *)(a1 + 960), a2);
      quic_cid_array_remove_by_seq_num(*(unsigned __int8 **)(a1 + 376), a2);
      uint64_t v27 = *(void *)(a1 + 496);
      if (v27)
      {
        *(void *)(a1 + 496) = v27 - 1;
        if ((qlog_debug_enabled
           || (qlog_nwlog_enabled & 1) != 0
           || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))
          && *(void *)(a1 + 1112))
        {
          uint64_t v28 = _os_log_pack_size();
          uint64_t v29 = (char *)&v69 - ((MEMORY[0x1895F8858](v28, v28) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          uint64_t v30 = _os_log_pack_fill();
          unsigned int v71 = (uint64_t *)(a1 + 976);
          unsigned int v31 = *(unsigned __int8 **)(a1 + 1112);
          if (quic_cid_describe_state % 3 == 2) {
            uint64_t v32 = &quic_cid_describe_cid_buf2;
          }
          else {
            uint64_t v32 = &quic_cid_describe_cid_buf3;
          }
          if (quic_cid_describe_state % 3) {
            uint64_t v33 = v32;
          }
          else {
            uint64_t v33 = &quic_cid_describe_cid_buf1;
          }
          int v34 = ++quic_cid_describe_state;
          unsigned int v35 = v31[38];
          __int128 v36 = 0uLL;
          *(_OWORD *)((char *)v33 + 25) = 0u;
          if (v35 >= 0x14) {
            uint64_t v37 = 20LL;
          }
          else {
            uint64_t v37 = v35;
          }
          _OWORD *v33 = 0uLL;
          v33[1] = 0uLL;
          if ((_DWORD)v37)
          {
            uint64_t v38 = v31 + 39;
            do
            {
              int v39 = *v38++;
              snprintf((char *)v33, 0x29uLL, "%s%02x", (const char *)v33, v39);
              --v37;
            }

            while (v37);
            unsigned int v31 = *(unsigned __int8 **)(a1 + 1112);
            int v34 = quic_cid_describe_state;
            __int128 v36 = 0uLL;
          }

          if (v34 % 3 == 2) {
            uint64_t v40 = &quic_cid_describe_cid_buf2;
          }
          else {
            uint64_t v40 = &quic_cid_describe_cid_buf3;
          }
          if (v34 % 3) {
            uint64_t v41 = v40;
          }
          else {
            uint64_t v41 = &quic_cid_describe_cid_buf1;
          }
          quic_cid_describe_unsigned int state = v34 + 1;
          if (v31[17] >= 0x14u) {
            uint64_t v42 = 20LL;
          }
          else {
            uint64_t v42 = v31[17];
          }
          _OWORD *v41 = v36;
          v41[1] = v36;
          *(_OWORD *)((char *)v41 + 25) = v36;
          if ((_DWORD)v42)
          {
            unsigned int v43 = v31 + 18;
            do
            {
              int v44 = *v43++;
              snprintf((char *)v41, 0x29uLL, "%s%02x", (const char *)v41, v44);
              --v42;
            }

            while (v42);
          }

          uint64_t v45 = *(void *)(a1 + 496);
          *(_DWORD *)uint64_t v30 = 136447234;
          *(void *)(v30 + 4) = "quic_conn_retire_scid_by_seq";
          *(_WORD *)(v30 + 12) = 2082;
          *(void *)(v30 + 14) = v71;
          *(_WORD *)(v30 + 22) = 2082;
          *(void *)(v30 + 24) = v33;
          *(_WORD *)(v30 + 32) = 2082;
          *(void *)(v30 + 34) = v41;
          *(_WORD *)(v30 + 42) = 2048;
          *(void *)(v30 + 44) = v45;
          qlog_internal(1, (uint64_t)v29, 4416LL);
          int v7 = (_BYTE *)&unk_18C6EB000;
          uint64_t v6 = (_BYTE *)&unk_18C6EB000;
        }
      }

      else if (qlog_debug_enabled {
             || (qlog_nwlog_enabled & 1) != 0
      }
             || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v46 = _os_log_pack_size();
        uint64_t v47 = (char *)&v69 - ((MEMORY[0x1895F8858](v46, v46) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v48 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v48 = 136446210;
        *(void *)(v48 + 4) = "quic_conn_retire_scid_by_seq";
        qlog_internal(2, (uint64_t)v47, 4419LL);
      }

      if (*(void *)(a1 + 496) < (unint64_t)quic_tp_get(*(_BYTE **)(a1 + 544), 14LL))
      {
        if ((v6[368] || (v7[369] & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))
          && *(void *)(a1 + 1112))
        {
          uint64_t v49 = _os_log_pack_size();
          unsigned int v71 = &v69;
          uint64_t v50 = (char *)&v69 - ((MEMORY[0x1895F8858](v49, v49) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          uint64_t v51 = _os_log_pack_fill();
          uint64_t v70 = a1 + 976;
          uint64_t v52 = *(unsigned __int8 **)(a1 + 1112);
          if (quic_cid_describe_state % 3 == 2) {
            uint64_t v53 = &quic_cid_describe_cid_buf2;
          }
          else {
            uint64_t v53 = &quic_cid_describe_cid_buf3;
          }
          if (quic_cid_describe_state % 3) {
            char v54 = v53;
          }
          else {
            char v54 = &quic_cid_describe_cid_buf1;
          }
          int v55 = ++quic_cid_describe_state;
          unsigned int v56 = v52[38];
          __int128 v57 = 0uLL;
          *(_OWORD *)((char *)v54 + 25) = 0u;
          if (v56 >= 0x14) {
            uint64_t v58 = 20LL;
          }
          else {
            uint64_t v58 = v56;
          }
          *char v54 = 0uLL;
          v54[1] = 0uLL;
          if ((_DWORD)v58)
          {
            uint64_t v59 = v52 + 39;
            do
            {
              int v60 = *v59++;
              snprintf((char *)v54, 0x29uLL, "%s%02x", (const char *)v54, v60);
              --v58;
            }

            while (v58);
            uint64_t v52 = *(unsigned __int8 **)(a1 + 1112);
            int v55 = quic_cid_describe_state;
            __int128 v57 = 0uLL;
          }

          if (v55 % 3 == 2) {
            uint64_t v61 = &quic_cid_describe_cid_buf2;
          }
          else {
            uint64_t v61 = &quic_cid_describe_cid_buf3;
          }
          if (v55 % 3) {
            int v62 = v61;
          }
          else {
            int v62 = &quic_cid_describe_cid_buf1;
          }
          quic_cid_describe_unsigned int state = v55 + 1;
          if (v52[17] >= 0x14u) {
            uint64_t v63 = 20LL;
          }
          else {
            uint64_t v63 = v52[17];
          }
          _OWORD *v62 = v57;
          v62[1] = v57;
          *(_OWORD *)((char *)v62 + 25) = v57;
          if ((_DWORD)v63)
          {
            uint64_t v64 = v52 + 18;
            do
            {
              int v65 = *v64++;
              snprintf((char *)v62, 0x29uLL, "%s%02x", (const char *)v62, v65);
              --v63;
            }

            while (v63);
          }

          *(_DWORD *)uint64_t v51 = 136446978;
          *(void *)(v51 + 4) = "quic_conn_retire_scid_by_seq";
          *(_WORD *)(v51 + 12) = 2082;
          *(void *)(v51 + 14) = v70;
          *(_WORD *)(v51 + 22) = 2082;
          *(void *)(v51 + 24) = v54;
          *(_WORD *)(v51 + 32) = 2082;
          *(void *)(v51 + 34) = v62;
          qlog_internal(1, (uint64_t)v50, 4425LL);
        }

        quic_conn_annouce_new_cids(a1, 1u);
      }
    }
  }

  else if (qlog_debug_enabled {
         || (qlog_nwlog_enabled & 1) != 0
  }
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    uint64_t v66 = _os_log_pack_size();
    __int128 v67 = (char *)&v69 - ((MEMORY[0x1895F8858](v66, v66) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v68 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v68 = 136446210;
    *(void *)(v68 + 4) = "quic_conn_retire_scid_by_seq";
    qlog_internal(17, (uint64_t)v67, 4390LL);
  }

uint64_t quic_conn_allocate_preferred_address_dcid(uint64_t a1, uint64_t a2)
{
  v9[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t result = quic_cid_array_find_by_seq_num(*(unsigned __int8 **)(a1 + 384), 1LL);
    if (!result) {
      return result;
    }
    uint64_t v5 = result;
    if ((*(_BYTE *)(result + 38) & 5) == 4)
    {
      quic_path_assign_dcid(a2, result + 1, a1);
      *(_BYTE *)(v5 + 38) |= 1u;
      return 1LL;
    }

    return 0LL;
  }

  if (qlog_debug_enabled
    || (qlog_nwlog_enabled & 1) != 0
    || (uint64_t result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT), (_DWORD)result))
  {
    uint64_t v6 = _os_log_pack_size();
    int v7 = (char *)v9 - ((MEMORY[0x1895F8858](v6, v6) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136446210;
    *(void *)(v8 + 4) = "quic_conn_allocate_preferred_address_dcid";
    qlog_internal(17, (uint64_t)v7, 4453LL);
    return 0LL;
  }

  return result;
}

void quic_conn_keepalive_acked(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    LODWORD(v2) = (unsigned __int16)(*(_WORD *)(a1 + 592))-- - 1;
    int v3 = qlog_debug_enabled;
    char v4 = qlog_nwlog_enabled;
    if (v2 >= 0x10000)
    {
      if (qlog_debug_enabled) {
        char v4 = 1;
      }
      if ((v4 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
      {
        uint64_t v5 = _os_log_pack_size();
        uint64_t v6 = (char *)&v29 - ((MEMORY[0x1895F8858](v5, v5) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v7 = _os_log_pack_fill();
        uint64_t v8 = *(unsigned __int16 *)(a1 + 592);
        *(_DWORD *)uint64_t v7 = 136447234;
        *(void *)(v7 + 4) = "quic_conn_keepalive_acked";
        *(_WORD *)(v7 + 12) = 2082;
        *(void *)(v7 + 14) = "conn->unacked_keepalive_count";
        *(_WORD *)(v7 + 22) = 2048;
        *(void *)(v7 + 24) = v8 + 1;
        *(_WORD *)(v7 + 32) = 2048;
        *(void *)(v7 + 34) = 1LL;
        *(_WORD *)(v7 + 42) = 2048;
        *(void *)(v7 + 44) = v8;
        qlog_internal(17, (uint64_t)v6, 4699LL);
        int v3 = qlog_debug_enabled;
        char v4 = qlog_nwlog_enabled;
      }

      else
      {
        char v4 = 0;
        int v3 = 0;
      }

      LOWORD(v2) = 0;
      *(_WORD *)(a1 + 592) = 0;
    }

    if ((v3 || (v4 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO)) && *(void *)(a1 + 1112))
    {
      uint64_t v9 = _os_log_pack_size();
      unsigned int v31 = &v29;
      int v2 = (char *)&v29 - ((MEMORY[0x1895F8858](v9, v9) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v10 = _os_log_pack_fill();
      uint64_t v30 = a1 + 976;
      uint64_t v11 = *(unsigned __int8 **)(a1 + 1112);
      if (quic_cid_describe_state % 3 == 2) {
        int v12 = &quic_cid_describe_cid_buf2;
      }
      else {
        int v12 = &quic_cid_describe_cid_buf3;
      }
      if (quic_cid_describe_state % 3) {
        int v13 = v12;
      }
      else {
        int v13 = &quic_cid_describe_cid_buf1;
      }
      int v14 = ++quic_cid_describe_state;
      unsigned int v15 = v11[38];
      __int128 v16 = 0uLL;
      *(_OWORD *)((char *)v13 + 25) = 0u;
      if (v15 >= 0x14) {
        uint64_t v17 = 20LL;
      }
      else {
        uint64_t v17 = v15;
      }
      *int v13 = 0uLL;
      v13[1] = 0uLL;
      if ((_DWORD)v17)
      {
        uint64_t v18 = v11 + 39;
        do
        {
          int v19 = *v18++;
          snprintf((char *)v13, 0x29uLL, "%s%02x", (const char *)v13, v19);
          --v17;
        }

        while (v17);
        uint64_t v11 = *(unsigned __int8 **)(a1 + 1112);
        int v14 = quic_cid_describe_state;
        __int128 v16 = 0uLL;
      }

      if (v14 % 3 == 2) {
        uint64_t v20 = &quic_cid_describe_cid_buf2;
      }
      else {
        uint64_t v20 = &quic_cid_describe_cid_buf3;
      }
      if (v14 % 3) {
        uint64_t v21 = v20;
      }
      else {
        uint64_t v21 = &quic_cid_describe_cid_buf1;
      }
      quic_cid_describe_unsigned int state = v14 + 1;
      if (v11[17] >= 0x14u) {
        uint64_t v22 = 20LL;
      }
      else {
        uint64_t v22 = v11[17];
      }
      *uint64_t v21 = v16;
      v21[1] = v16;
      *(_OWORD *)((char *)v21 + 25) = v16;
      if ((_DWORD)v22)
      {
        int v23 = v11 + 18;
        do
        {
          int v24 = *v23++;
          snprintf((char *)v21, 0x29uLL, "%s%02x", (const char *)v21, v24);
          --v22;
        }

        while (v22);
      }

      int v25 = *(unsigned __int16 *)(a1 + 592);
      *(_DWORD *)uint64_t v10 = 136447234;
      *(void *)(v10 + 4) = "quic_conn_keepalive_acked";
      *(_WORD *)(v10 + 12) = 2082;
      *(void *)(v10 + 14) = v30;
      *(_WORD *)(v10 + 22) = 2082;
      *(void *)(v10 + 24) = v13;
      *(_WORD *)(v10 + 32) = 2082;
      *(void *)(v10 + 34) = v21;
      *(_WORD *)(v10 + 42) = 1024;
      *(_DWORD *)(v10 + 44) = v25;
      qlog_internal(1, (uint64_t)v2, 4703LL);
      LOWORD(v2) = *(_WORD *)(a1 + 592);
    }

    ++*(_DWORD *)(a1 + 1220);
    quic_migration_keepalive_loss_event(*(void *)(a1 + 1120), a1, *(void *)(a1 + 1112), (unsigned __int16)v2);
  }

  else if (qlog_debug_enabled {
         || (qlog_nwlog_enabled & 1) != 0
  }
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    uint64_t v26 = _os_log_pack_size();
    uint64_t v27 = (char *)&v29 - ((MEMORY[0x1895F8858](v26, v26) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v28 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v28 = 136446210;
    *(void *)(v28 + 4) = "quic_conn_keepalive_acked";
    qlog_internal(17, (uint64_t)v27, 4697LL);
  }

void quic_conn_probe_connectivity(uint64_t a1, char a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 0x40000000LL;
    void v5[2] = __quic_conn_probe_connectivity_block_invoke;
    v5[3] = &__block_descriptor_tmp_129;
    char v6 = a2;
    nw_protocol_instance_access_state();
  }

  else if (qlog_debug_enabled {
         || (qlog_nwlog_enabled & 1) != 0
  }
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    uint64_t v2 = _os_log_pack_size();
    int v3 = (char *)v5 - ((MEMORY[0x1895F8858](v2, v2) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v4 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v4 = 136446210;
    *(void *)(v4 + 4) = "quic_conn_probe_connectivity";
    qlog_internal(17, (uint64_t)v3, 4947LL);
  }

uint64_t __quic_conn_probe_connectivity_block_invoke(uint64_t a1, uint64_t a2)
{
  return 1LL;
}

void quic_conn_probe_connectivity_internal(uint64_t a1, int a2)
{
  v79[1] = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      uint64_t v76 = _os_log_pack_size();
      uint64_t v77 = (char *)v79 - ((MEMORY[0x1895F8858](v76, v76) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v78 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v78 = 136446210;
      *(void *)(v78 + 4) = "quic_conn_probe_connectivity_internal";
      qlog_internal(17, (uint64_t)v77, 4919LL);
    }

    return;
  }

  uint64_t v4 = a1 + 1380;
  uint64_t v5 = *(void *)(a1 + 1380);
  if (((v5 & 0x200000) == 0) != a2)
  {
    if (((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1 || os_log_type_enabled( (os_log_t)qlog_log,  OS_LOG_TYPE_INFO))
      && *(void *)(a1 + 1112))
    {
      uint64_t v6 = _os_log_pack_size();
      uint64_t v7 = (char *)v79 - ((MEMORY[0x1895F8858](v6, v6) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v8 = _os_log_pack_fill();
      v79[0] = a1 + 976;
      uint64_t v9 = *(unsigned __int8 **)(a1 + 1112);
      if (quic_cid_describe_state % 3 == 2) {
        uint64_t v10 = &quic_cid_describe_cid_buf2;
      }
      else {
        uint64_t v10 = &quic_cid_describe_cid_buf3;
      }
      if (quic_cid_describe_state % 3) {
        uint64_t v11 = v10;
      }
      else {
        uint64_t v11 = &quic_cid_describe_cid_buf1;
      }
      int v12 = ++quic_cid_describe_state;
      unsigned int v13 = v9[38];
      __int128 v14 = 0uLL;
      *(_OWORD *)((char *)v11 + 25) = 0u;
      if (v13 >= 0x14) {
        uint64_t v15 = 20LL;
      }
      else {
        uint64_t v15 = v13;
      }
      _OWORD *v11 = 0uLL;
      v11[1] = 0uLL;
      if ((_DWORD)v15)
      {
        __int128 v16 = v9 + 39;
        do
        {
          int v17 = *v16++;
          snprintf((char *)v11, 0x29uLL, "%s%02x", (const char *)v11, v17);
          --v15;
        }

        while (v15);
        uint64_t v9 = *(unsigned __int8 **)(a1 + 1112);
        int v12 = quic_cid_describe_state;
        __int128 v14 = 0uLL;
      }

      if (v12 % 3 == 2) {
        uint64_t v18 = &quic_cid_describe_cid_buf2;
      }
      else {
        uint64_t v18 = &quic_cid_describe_cid_buf3;
      }
      if (v12 % 3) {
        int v19 = v18;
      }
      else {
        int v19 = &quic_cid_describe_cid_buf1;
      }
      quic_cid_describe_unsigned int state = v12 + 1;
      if (v9[17] >= 0x14u) {
        uint64_t v20 = 20LL;
      }
      else {
        uint64_t v20 = v9[17];
      }
      _OWORD *v19 = v14;
      v19[1] = v14;
      *(_OWORD *)((char *)v19 + 25) = v14;
      if ((_DWORD)v20)
      {
        uint64_t v21 = v9 + 18;
        do
        {
          int v22 = *v21++;
          snprintf((char *)v19, 0x29uLL, "%s%02x", (const char *)v19, v22);
          --v20;
        }

        while (v20);
      }

      *(_DWORD *)uint64_t v8 = 136447234;
      *(void *)(v8 + 4) = "quic_conn_probe_connectivity_internal";
      *(_WORD *)(v8 + 12) = 2082;
      *(void *)(v8 + 14) = v79[0];
      *(_WORD *)(v8 + 22) = 2082;
      *(void *)(v8 + 24) = v11;
      *(_WORD *)(v8 + 32) = 2082;
      *(void *)(v8 + 34) = v19;
      *(_WORD *)(v8 + 42) = 1024;
      *(_DWORD *)(v8 + 44) = a2;
      qlog_internal(1, (uint64_t)v7, 4923LL);
    }

    return;
  }

  if (a2)
  {
    if (((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1 || os_log_type_enabled( (os_log_t)qlog_log,  OS_LOG_TYPE_INFO))
      && *(void *)(a1 + 1112))
    {
      uint64_t v23 = _os_log_pack_size();
      int v24 = (char *)v79 - ((MEMORY[0x1895F8858](v23, v23) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v25 = _os_log_pack_fill();
      v79[0] = a1 + 976;
      uint64_t v26 = *(unsigned __int8 **)(a1 + 1112);
      if (quic_cid_describe_state % 3 == 2) {
        uint64_t v27 = &quic_cid_describe_cid_buf2;
      }
      else {
        uint64_t v27 = &quic_cid_describe_cid_buf3;
      }
      if (quic_cid_describe_state % 3) {
        uint64_t v28 = v27;
      }
      else {
        uint64_t v28 = &quic_cid_describe_cid_buf1;
      }
      int v29 = ++quic_cid_describe_state;
      unsigned int v30 = v26[38];
      __int128 v31 = 0uLL;
      *(_OWORD *)((char *)v28 + 25) = 0u;
      if (v30 >= 0x14) {
        uint64_t v32 = 20LL;
      }
      else {
        uint64_t v32 = v30;
      }
      _OWORD *v28 = 0uLL;
      v28[1] = 0uLL;
      if ((_DWORD)v32)
      {
        uint64_t v33 = v26 + 39;
        do
        {
          int v34 = *v33++;
          snprintf((char *)v28, 0x29uLL, "%s%02x", (const char *)v28, v34);
          --v32;
        }

        while (v32);
        uint64_t v26 = *(unsigned __int8 **)(a1 + 1112);
        int v29 = quic_cid_describe_state;
        __int128 v31 = 0uLL;
      }

      if (v29 % 3 == 2) {
        unsigned int v35 = &quic_cid_describe_cid_buf2;
      }
      else {
        unsigned int v35 = &quic_cid_describe_cid_buf3;
      }
      if (v29 % 3) {
        __int128 v36 = v35;
      }
      else {
        __int128 v36 = &quic_cid_describe_cid_buf1;
      }
      quic_cid_describe_unsigned int state = v29 + 1;
      if (v26[17] >= 0x14u) {
        uint64_t v37 = 20LL;
      }
      else {
        uint64_t v37 = v26[17];
      }
      *__int128 v36 = v31;
      v36[1] = v31;
      *(_OWORD *)((char *)v36 + 25) = v31;
      if ((_DWORD)v37)
      {
        uint64_t v38 = v26 + 18;
        do
        {
          int v39 = *v38++;
          snprintf((char *)v36, 0x29uLL, "%s%02x", (const char *)v36, v39);
          --v37;
        }

        while (v37);
      }

      *(_DWORD *)uint64_t v25 = 136446978;
      *(void *)(v25 + 4) = "quic_conn_probe_connectivity_internal";
      *(_WORD *)(v25 + 12) = 2082;
      *(void *)(v25 + 14) = v79[0];
      *(_WORD *)(v25 + 22) = 2082;
      *(void *)(v25 + 24) = v28;
      *(_WORD *)(v25 + 32) = 2082;
      *(void *)(v25 + 34) = v36;
      qlog_internal(1, (uint64_t)v24, 4927LL);
      uint64_t v5 = *(void *)v4;
    }

    *(void *)uint64_t v4 = v5 | 0x200000;
    *(void *)(a1 + 624) = *(void *)(a1 + 616);
    LOWORD(v40) = 1;
  }

  else
  {
    if (((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1 || os_log_type_enabled( (os_log_t)qlog_log,  OS_LOG_TYPE_INFO))
      && *(void *)(a1 + 1112))
    {
      uint64_t v41 = _os_log_pack_size();
      uint64_t v42 = (char *)v79 - ((MEMORY[0x1895F8858](v41, v41) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v43 = _os_log_pack_fill();
      v79[0] = a1 + 976;
      int v44 = *(unsigned __int8 **)(a1 + 1112);
      if (quic_cid_describe_state % 3 == 2) {
        uint64_t v45 = &quic_cid_describe_cid_buf2;
      }
      else {
        uint64_t v45 = &quic_cid_describe_cid_buf3;
      }
      if (quic_cid_describe_state % 3) {
        uint64_t v46 = v45;
      }
      else {
        uint64_t v46 = &quic_cid_describe_cid_buf1;
      }
      int v47 = ++quic_cid_describe_state;
      unsigned int v48 = v44[38];
      __int128 v49 = 0uLL;
      *(_OWORD *)((char *)v46 + 25) = 0u;
      if (v48 >= 0x14) {
        uint64_t v50 = 20LL;
      }
      else {
        uint64_t v50 = v48;
      }
      *uint64_t v46 = 0uLL;
      v46[1] = 0uLL;
      if ((_DWORD)v50)
      {
        uint64_t v51 = v44 + 39;
        do
        {
          int v52 = *v51++;
          snprintf((char *)v46, 0x29uLL, "%s%02x", (const char *)v46, v52);
          --v50;
        }

        while (v50);
        int v44 = *(unsigned __int8 **)(a1 + 1112);
        int v47 = quic_cid_describe_state;
        __int128 v49 = 0uLL;
      }

      if (v47 % 3 == 2) {
        uint64_t v53 = &quic_cid_describe_cid_buf2;
      }
      else {
        uint64_t v53 = &quic_cid_describe_cid_buf3;
      }
      if (v47 % 3) {
        char v54 = v53;
      }
      else {
        char v54 = &quic_cid_describe_cid_buf1;
      }
      quic_cid_describe_unsigned int state = v47 + 1;
      if (v44[17] >= 0x14u) {
        uint64_t v55 = 20LL;
      }
      else {
        uint64_t v55 = v44[17];
      }
      *char v54 = v49;
      v54[1] = v49;
      *(_OWORD *)((char *)v54 + 25) = v49;
      if ((_DWORD)v55)
      {
        unsigned int v56 = v44 + 18;
        do
        {
          int v57 = *v56++;
          snprintf((char *)v54, 0x29uLL, "%s%02x", (const char *)v54, v57);
          --v55;
        }

        while (v55);
      }

      *(_DWORD *)uint64_t v43 = 136446978;
      *(void *)(v43 + 4) = "quic_conn_probe_connectivity_internal";
      *(_WORD *)(v43 + 12) = 2082;
      *(void *)(v43 + 14) = v79[0];
      *(_WORD *)(v43 + 22) = 2082;
      *(void *)(v43 + 24) = v46;
      *(_WORD *)(v43 + 32) = 2082;
      *(void *)(v43 + 34) = v54;
      qlog_internal(1, (uint64_t)v42, 4932LL);
      uint64_t v5 = *(void *)v4;
    }

    *(void *)uint64_t v4 = v5 & 0xFFFFFFFFFF1FFFFFLL;
    unint64_t v40 = *(void *)(a1 + 624) / 0xF4240uLL;
  }

  quic_conn_keepalive_configure(a1, (unsigned __int16)v40);
  uint64_t stats_region = nw_protocol_instance_get_stats_region();
  uint64_t v59 = &g_quic_stats;
  if (stats_region) {
    uint64_t v59 = (void *)stats_region;
  }
  *(void *)(a1 + 1312) = v59;
  uint64_t stats = nw_protocol_instance_get_stats();
  *(void *)(a1 + 1304) = stats;
  if (stats)
  {
    *(void *)(stats + 16) = *(void *)(a1 + 1144);
    uint64_t v61 = *(void *)(a1 + 1304);
    if (v61)
    {
      *(void *)(v61 + 24) = *(void *)(a1 + 1152);
      uint64_t v62 = *(void *)(a1 + 1304);
      if (v62)
      {
        *(void *)(v62 + 32) = *(void *)(a1 + 1160);
        uint64_t v63 = *(void *)(a1 + 1304);
        if (v63)
        {
          *(void *)(v63 + 40) = *(void *)(a1 + 1168);
          uint64_t v64 = *(void *)(a1 + 1304);
          if (v64)
          {
            *(_DWORD *)(v64 + 48) = *(_DWORD *)(a1 + 1176);
            uint64_t v65 = *(void *)(a1 + 1304);
            if (v65)
            {
              *(_DWORD *)(v65 + 52) = *(_DWORD *)(a1 + 1180);
              uint64_t v66 = *(void *)(a1 + 1304);
              if (v66)
              {
                *(_DWORD *)(v66 + 56) = *(_DWORD *)(a1 + 1188);
                uint64_t v67 = *(void *)(a1 + 1304);
                if (v67)
                {
                  *(_DWORD *)(v67 + 60) = *(_DWORD *)(a1 + 1192);
                  uint64_t v68 = *(void *)(a1 + 1304);
                  if (v68)
                  {
                    *(_DWORD *)(v68 + 60) = *(unsigned __int8 *)(a1 + 477) == 9;
                    uint64_t v69 = *(void *)(a1 + 1304);
                    if (v69) {
                      *(_DWORD *)(v69 + 124) = *(unsigned __int8 *)(a1 + 477);
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

  uint64_t v70 = *(void *)(a1 + 1112);
  if (!v70 || !quic_rtt_has_initial_measurement(*(void *)(v70 + 272))) {
    goto LABEL_112;
  }
  uint64_t v71 = *(void *)(a1 + 1304);
  if (v71)
  {
    *(_DWORD *)(*(void *)(a1 + 1304) + 68LL) = (unint64_t)((4
                                                                   * (quic_rtt_get_min_rtt(*(void *)(*(void *)(a1 + 1112) + 272LL)) & 0x7FFFFFFFFFFFFFFuLL)
                                                                   * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4;
    uint64_t v71 = *(void *)(a1 + 1304);
    if (v71)
    {
      *(_DWORD *)(*(void *)(a1 + 1304) + 72LL) = (unint64_t)((4
                                                                     * (quic_rtt_get_smoothed_rtt(*(void *)(*(void *)(a1 + 1112) + 272LL)) & 0x7FFFFFFFFFFFFFFuLL)
                                                                     * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4;
      uint64_t v71 = *(void *)(a1 + 1304);
      if (v71)
      {
        *(_DWORD *)(*(void *)(a1 + 1304) + 76LL) = (unint64_t)((2
                                                                       * (quic_rtt_get_rtt_variance(*(void *)(*(void *)(a1 + 1112) + 272LL)) & 0xFFFFFFFFFFFFFFFuLL)
                                                                       * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4;
LABEL_112:
        uint64_t v71 = *(void *)(a1 + 1304);
        if (v71)
        {
          *(_OWORD *)(v71 + 128) = *(_OWORD *)(a1 + 1288);
          uint64_t v71 = *(void *)(a1 + 1304);
        }
      }
    }
  }

  if ((*(_BYTE *)(v4 + 1) & 2) != 0)
  {
    if (!v71) {
      return;
    }
    unsigned int v72 = *(_DWORD *)(v71 + 116) | 1;
  }

  else
  {
    if (!v71) {
      return;
    }
    unsigned int v72 = *(_DWORD *)(v71 + 116) & 0xFFFFFFFE;
  }

  *(_DWORD *)(v71 + 116) = v72;
  uint64_t v73 = *(void *)(a1 + 1304);
  if (v73)
  {
    *(_BYTE *)(v73 + 144) |= (*(_DWORD *)v4 & 0x200000) != 0;
    uint64_t v74 = *(void *)(a1 + 1304);
    if (v74)
    {
      *(_BYTE *)(v74 + 144) |= (*(_DWORD *)v4 >> 22) & 2;
      uint64_t v75 = *(void *)(a1 + 1304);
      if (v75) {
        *(_BYTE *)(v75 + 144) |= (*(_DWORD *)v4 >> 19) & 8;
      }
    }
  }

void quic_conn_confirm_handshake(uint64_t a1)
{
  v21[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if ((*(_BYTE *)(a1 + 1383) & 4) == 0)
    {
      if (*(unsigned __int8 *)(a1 + 477) > 8u)
      {
        uint64_t v7 = (uint64_t *)(a1 + 1380);
        quic_conn_discard_keys(a1, 2u);
        uint64_t v8 = *v7;
        if ((*v7 & 1) != 0)
        {
          uint64_t v9 = *(void *)(a1 + 560);
          uint64_t frame_pool = quic_packet_builder_get_frame_pool(v9);
          uint64_t v11 = quic_frame_create(frame_pool, 30LL);
          *((_WORD *)v11 + 4) = 1;
          quic_packet_builder_append_for_pn_space(v9, (uint64_t)v11, 3u);
          uint64_t path = quic_conn_select_next_path((void *)a1, (uint64_t)&__block_literal_global_98);
          quic_conn_send_internal(a1, path, 0LL);
          uint64_t v8 = *v7;
        }

        *uint64_t v7 = v8 | 0x4000000;
        if (qlog_debug_enabled
          || (qlog_nwlog_enabled & 1) != 0
          || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v14 = _os_log_pack_size();
          uint64_t v15 = (char *)v21 - ((MEMORY[0x1895F8858](v14, v14) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          uint64_t v16 = _os_log_pack_fill();
          *(_DWORD *)uint64_t v16 = 136446210;
          *(void *)(v16 + 4) = "quic_conn_confirm_handshake";
          qlog_internal(2, (uint64_t)v15, 5016LL);
        }

        uint64_t v17 = *(void *)(a1 + 1120);
        if (v17) {
          quic_migration_handshake_confirmed(v17, v13);
        }
      }

      else if (qlog_debug_enabled {
             || (qlog_nwlog_enabled & 1) != 0
      }
             || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
      {
        uint64_t v2 = _os_log_pack_size();
        int v3 = (char *)v21 - ((MEMORY[0x1895F8858](v2, v2) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v4 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v4 = 136446210;
        *(void *)(v4 + 4) = "quic_conn_confirm_handshake";
        uint64_t v5 = (uint64_t)v3;
        uint64_t v6 = 5007LL;
LABEL_8:
        qlog_internal(17, v5, v6);
      }
    }
  }

  else if (qlog_debug_enabled {
         || (qlog_nwlog_enabled & 1) != 0
  }
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    uint64_t v18 = _os_log_pack_size();
    int v19 = (char *)v21 - ((MEMORY[0x1895F8858](v18, v18) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v20 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v20 = 136446210;
    *(void *)(v20 + 4) = "quic_conn_confirm_handshake";
    uint64_t v5 = (uint64_t)v19;
    uint64_t v6 = 5001LL;
    goto LABEL_8;
  }

uint64_t quic_conn_max_message_size()
{
  return nw_protocol_instance_access_state();
}

uint64_t __quic_conn_max_message_size_block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(unsigned __int8 *)(a2 + 477) <= 9u && nw_protocol_instance_get_level() != 3)
  {
    uint64_t v4 = *(void *)(a2 + 544);
    if (v4)
    {
      uint64_t v5 = 248LL;
      if ((*(_BYTE *)(v4 + 312) & 1) == 0) {
        uint64_t v5 = 240LL;
      }
      LOWORD(v4) = *(_WORD *)(v4 + v5);
    }

    v11[0] = MEMORY[0x1895F87A8];
    int v12 = __quic_conn_max_message_size_block_invoke_2;
    __n128 v13 = &__block_descriptor_tmp_133;
    v11[1] = 0x40000000LL;
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v14 = a2;
    uint64_t v15 = v6;
    __int16 v16 = v4;
    uint64_t v7 = *(void *)(a2 + 1360);
    do
    {
      if (!v7) {
        break;
      }
      uint64_t v8 = *(void *)(v7 + 312);
      char v9 = ((uint64_t (*)(void *))v12)(v11);
      uint64_t v7 = v8;
    }

    while ((v9 & 1) != 0);
  }

  return 1LL;
}

uint64_t __quic_conn_max_message_size_block_invoke_2(uint64_t a1, uint64_t a2)
{
  maximum_message_unint64_t size = nw_protocol_instance_get_maximum_message_size();
  if (maximum_message_size)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (*(_BYTE *)(v5 + 477) == 6)
    {
      if (maximum_message_size >= 0x4B0u && maximum_message_size <= *(unsigned __int16 *)(a2 + 424))
      {
        *(_WORD *)(a2 + 424) = maximum_message_size;
        quic_conn_set_mss(v5, a2, maximum_message_size);
        nw_retain(*(void **)(a1 + 40));
        nw_protocol_instance_async();
      }
    }

    else
    {
      unsigned int v7 = *(unsigned __int16 *)(a1 + 48);
      if (maximum_message_size <= v7 || v7 == 0) {
        unsigned __int16 v9 = maximum_message_size;
      }
      else {
        unsigned __int16 v9 = *(_WORD *)(a1 + 48);
      }
      quic_conn_set_mss(*(void *)(a1 + 32), a2, v9);
    }
  }

  return 1LL;
}

void __quic_conn_max_message_size_block_invoke_3(uint64_t a1)
{
}

uint64_t __quic_conn_max_message_size_block_invoke_4(uint64_t a1, uint64_t a2)
{
  v25[1] = *MEMORY[0x1895F89C0];
  if (*(unsigned __int8 *)(a2 + 477) < 0xAu)
  {
    if (((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1 || os_log_type_enabled( (os_log_t)qlog_log,  OS_LOG_TYPE_INFO))
      && *(void *)(a2 + 1112))
    {
      uint64_t v7 = _os_log_pack_size();
      uint64_t v8 = (char *)v25 - ((MEMORY[0x1895F8858](v7, v7) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v9 = _os_log_pack_fill();
      v25[0] = a2 + 976;
      uint64_t v10 = *(unsigned __int8 **)(a2 + 1112);
      if (quic_cid_describe_state % 3 == 2) {
        uint64_t v11 = &quic_cid_describe_cid_buf2;
      }
      else {
        uint64_t v11 = &quic_cid_describe_cid_buf3;
      }
      if (quic_cid_describe_state % 3) {
        int v12 = v11;
      }
      else {
        int v12 = &quic_cid_describe_cid_buf1;
      }
      int v13 = ++quic_cid_describe_state;
      unsigned int v14 = v10[38];
      __int128 v15 = 0uLL;
      *(_OWORD *)((char *)v12 + 25) = 0u;
      if (v14 >= 0x14) {
        uint64_t v16 = 20LL;
      }
      else {
        uint64_t v16 = v14;
      }
      _OWORD *v12 = 0uLL;
      v12[1] = 0uLL;
      if ((_DWORD)v16)
      {
        uint64_t v17 = v10 + 39;
        do
        {
          int v18 = *v17++;
          snprintf((char *)v12, 0x29uLL, "%s%02x", (const char *)v12, v18);
          --v16;
        }

        while (v16);
        uint64_t v10 = *(unsigned __int8 **)(a2 + 1112);
        int v13 = quic_cid_describe_state;
        __int128 v15 = 0uLL;
      }

      if (v13 % 3 == 2) {
        int v19 = &quic_cid_describe_cid_buf2;
      }
      else {
        int v19 = &quic_cid_describe_cid_buf3;
      }
      if (v13 % 3) {
        uint64_t v20 = v19;
      }
      else {
        uint64_t v20 = &quic_cid_describe_cid_buf1;
      }
      quic_cid_describe_unsigned int state = v13 + 1;
      if (v10[17] >= 0x14u) {
        uint64_t v21 = 20LL;
      }
      else {
        uint64_t v21 = v10[17];
      }
      *uint64_t v20 = v15;
      v20[1] = v15;
      *(_OWORD *)((char *)v20 + 25) = v15;
      if ((_DWORD)v21)
      {
        int v22 = v10 + 18;
        do
        {
          int v23 = *v22++;
          snprintf((char *)v20, 0x29uLL, "%s%02x", (const char *)v20, v23);
          --v21;
        }

        while (v21);
      }

      *(_DWORD *)uint64_t v9 = 136446978;
      *(void *)(v9 + 4) = "quic_conn_max_message_size_block_invoke";
      *(_WORD *)(v9 + 12) = 2082;
      *(void *)(v9 + 14) = v25[0];
      *(_WORD *)(v9 + 22) = 2082;
      *(void *)(v9 + 24) = v12;
      *(_WORD *)(v9 + 32) = 2082;
      *(void *)(v9 + 34) = v20;
      qlog_internal(1, (uint64_t)v8, 5197LL);
    }

    quic_recovery_pto(*(void *)(a2 + 952), *(void *)(a1 + 32));
  }

  else if ((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1 {
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
  }
  {
    uint64_t v2 = _os_log_pack_size();
    int v3 = (char *)v25 - ((MEMORY[0x1895F8858](v2, v2) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v4 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v4 = 136446210;
    *(void *)(v4 + 4) = "quic_conn_max_message_size_block_invoke_4";
    qlog_internal(2, (uint64_t)v3, 5192LL);
  }

  return 1LL;
}

void quic_conn_link_advisory(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if ((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = _os_log_pack_size();
      uint64_t v7 = (char *)v13 - ((MEMORY[0x1895F8858](v6, v6) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v8 = _os_log_pack_fill();
      uint64_t v9 = "admissable";
      if (a3) {
        uint64_t v9 = "flow controlled";
      }
      *(_DWORD *)uint64_t v8 = 136446466;
      *(void *)(v8 + 4) = "quic_conn_link_advisory";
      *(_WORD *)(v8 + 12) = 2082;
      *(void *)(v8 + 14) = v9;
      qlog_internal(2, (uint64_t)v7, 5228LL);
    }

    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 0x40000000LL;
    void v13[2] = __quic_conn_link_advisory_block_invoke;
    v13[3] = &__block_descriptor_tmp_139;
    char v14 = a3;
    v13[4] = a2;
    v13[5] = a1;
    nw_protocol_instance_access_state();
  }

  else if ((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1 {
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  }
  {
    uint64_t v10 = _os_log_pack_size();
    uint64_t v11 = (char *)v13 - ((MEMORY[0x1895F8858](v10, v10) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v12 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v12 = 136446210;
    *(void *)(v12 + 4) = "quic_conn_link_advisory";
    qlog_internal(17, (uint64_t)v11, 5224LL);
  }

uint64_t __quic_conn_link_advisory_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v67 = *MEMORY[0x1895F89C0];
  uint64_t v4 = quic_conn_lookup_nw_path(a2, *(void *)(a1 + 32));
  if (!v4)
  {
    if (*(void *)(a1 + 32) != *MEMORY[0x189608EC0])
    {
      if (qlog_debug_enabled
        || (qlog_nwlog_enabled & 1) != 0
        || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
      {
        uint64_t v47 = _os_log_pack_size();
        unsigned int v48 = (char *)&v58 - ((MEMORY[0x1895F8858](v47, v47) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v49 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v49 = 136446210;
        *(void *)(v49 + 4) = "quic_conn_link_advisory_block_invoke";
        qlog_internal(17, (uint64_t)v48, 5238LL);
      }

      return 1LL;
    }

    uint64_t v4 = *(void *)(a2 + 1112);
  }

  BOOL is_flow_controlled = quic_path_is_flow_controlled(v4);
  quic_path_link_advisory(v4, *(unsigned __int8 *)(a1 + 48));
  BOOL v6 = quic_path_is_flow_controlled(v4);
  if (!is_flow_controlled)
  {
    if (v6)
    {
      if (__quic_signpost_is_enabled__quic_signposts_once_3883[0] != -1) {
        dispatch_once(__quic_signpost_is_enabled__quic_signposts_once_3883, &__block_literal_global_192);
      }
      if (*(_BYTE *)(a2 + 477) == 9 && *(void *)(a2 + 896))
      {
        unint64_t v45 = *(unsigned __int8 *)(a2 + 600);
        if (v45 >= 6) {
          char v46 = 0;
        }
        else {
          char v46 = 0x30303020100uLL >> (8 * v45);
        }
        quic_recovery_get_largest_acked_sent_time(*(void *)(a2 + 952), v46 & 3, v4);
        quic_cc_link_flow_controlled(*(void *)(v4 + 360));
      }
    }

    return 1LL;
  }

  if (v6) {
    return 1LL;
  }
  if (__quic_signpost_is_enabled__quic_signposts_once_3883[0] != -1) {
    dispatch_once(__quic_signpost_is_enabled__quic_signposts_once_3883, &__block_literal_global_192);
  }
  if (*(_BYTE *)(a2 + 477) == 9)
  {
    quic_ack_immediately(*(void *)(a2 + 960));
    if (!quic_packet_builder_has_ack_eliciting_frame(*(void *)(a2 + 560), 3u))
    {
      uint64_t v7 = *(void *)(a2 + 560);
      uint64_t frame_pool = quic_packet_builder_get_frame_pool(v7);
      uint64_t v9 = quic_frame_create(frame_pool, 1LL);
      *((_WORD *)v9 + 4) = 1;
      *((_BYTE *)v9 + 120) &= 0xF9u;
      quic_packet_builder_append_for_pn_space(v7, (uint64_t)v9, 3u);
    }
  }

  uint64_t path = quic_conn_select_next_path((void *)a2, (uint64_t)&__block_literal_global_98);
  if ((quic_conn_send_internal(a2, path, 0LL) & 1) == 0
    && (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0
                           || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
    && *(void *)(a2 + 1112))
  {
    uint64_t v11 = _os_log_pack_size();
    uint64_t v12 = (char *)&v58 - ((MEMORY[0x1895F8858](v11, v11) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v13 = _os_log_pack_fill();
    uint64_t v59 = a2 + 976;
    char v14 = *(unsigned __int8 **)(a2 + 1112);
    if (quic_cid_describe_state % 3 == 2) {
      uint64_t v15 = &quic_cid_describe_cid_buf2;
    }
    else {
      uint64_t v15 = &quic_cid_describe_cid_buf3;
    }
    if (quic_cid_describe_state % 3) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = &quic_cid_describe_cid_buf1;
    }
    int v17 = ++quic_cid_describe_state;
    unsigned int v18 = v14[38];
    __int128 v19 = 0uLL;
    *(_OWORD *)((char *)v16 + 25) = 0u;
    if (v18 >= 0x14) {
      uint64_t v20 = 20LL;
    }
    else {
      uint64_t v20 = v18;
    }
    _OWORD *v16 = 0uLL;
    v16[1] = 0uLL;
    if ((_DWORD)v20)
    {
      uint64_t v21 = v14 + 39;
      do
      {
        int v22 = *v21++;
        snprintf((char *)v16, 0x29uLL, "%s%02x", (const char *)v16, v22);
        --v20;
      }

      while (v20);
      char v14 = *(unsigned __int8 **)(a2 + 1112);
      int v17 = quic_cid_describe_state;
      __int128 v19 = 0uLL;
    }

    if (v17 % 3 == 2) {
      int v23 = &quic_cid_describe_cid_buf2;
    }
    else {
      int v23 = &quic_cid_describe_cid_buf3;
    }
    if (v17 % 3) {
      int v24 = v23;
    }
    else {
      int v24 = &quic_cid_describe_cid_buf1;
    }
    quic_cid_describe_unsigned int state = v17 + 1;
    if (v14[17] >= 0x14u) {
      uint64_t v25 = 20LL;
    }
    else {
      uint64_t v25 = v14[17];
    }
    *int v24 = v19;
    v24[1] = v19;
    *(_OWORD *)((char *)v24 + 25) = v19;
    if ((_DWORD)v25)
    {
      uint64_t v26 = v14 + 18;
      do
      {
        int v27 = *v26++;
        snprintf((char *)v24, 0x29uLL, "%s%02x", (const char *)v24, v27);
        --v25;
      }

      while (v25);
    }

    *(_DWORD *)uint64_t v13 = 136446978;
    *(void *)(v13 + 4) = "quic_conn_link_advisory_block_invoke";
    *(_WORD *)(v13 + 12) = 2082;
    *(void *)(v13 + 14) = v59;
    *(_WORD *)(v13 + 22) = 2082;
    *(void *)(v13 + 24) = v16;
    *(_WORD *)(v13 + 32) = 2082;
    *(void *)(v13 + 34) = v24;
    qlog_internal(16, (uint64_t)v12, 5285LL);
  }

  uint64_t v28 = MEMORY[0x1895F87A8];
  v60[0] = MEMORY[0x1895F87A8];
  v60[1] = 0x40000000LL;
  v60[2] = __quic_conn_link_advisory_block_invoke_137;
  v60[3] = &__block_descriptor_tmp_138;
  v60[4] = a2;
  if (a2)
  {
    uint64_t v61 = -1LL;
    uint64_t flow_for_key = nw_protocol_instance_get_flow_for_key();
    if (*(_BYTE *)(a2 + 477) == 9)
    {
      uint64_t v61 = v28;
      uint64_t v62 = 0x40000000LL;
      uint64_t v63 = __quic_enumerate_open_data_streams_block_invoke;
      uint64_t v64 = &unk_18A117490;
      uint64_t v65 = v60;
      uint64_t v66 = flow_for_key;
      nw_protocol_instance_enumerate_flows();
    }
  }

  else if (qlog_debug_enabled {
         || (qlog_nwlog_enabled & 1) != 0
  }
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    uint64_t v55 = _os_log_pack_size();
    unsigned int v56 = (char *)&v58 - ((MEMORY[0x1895F8858](v55, v55) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v57 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v57 = 136446210;
    *(void *)(v57 + 4) = "quic_enumerate_open_data_streams";
    qlog_internal(17, (uint64_t)v56, 676LL);
  }

  nw_protocol_implementation_finalize_pending_frames();
  uint64_t stats_region = nw_protocol_instance_get_stats_region();
  __int128 v31 = &g_quic_stats;
  if (stats_region) {
    __int128 v31 = (void *)stats_region;
  }
  *(void *)(a2 + 1312) = v31;
  uint64_t stats = nw_protocol_instance_get_stats();
  *(void *)(a2 + 1304) = stats;
  if (stats)
  {
    *(void *)(stats + 16) = *(void *)(a2 + 1144);
    uint64_t v33 = *(void *)(a2 + 1304);
    if (v33)
    {
      *(void *)(v33 + 24) = *(void *)(a2 + 1152);
      uint64_t v34 = *(void *)(a2 + 1304);
      if (v34)
      {
        *(void *)(v34 + 32) = *(void *)(a2 + 1160);
        uint64_t v35 = *(void *)(a2 + 1304);
        if (v35)
        {
          *(void *)(v35 + 40) = *(void *)(a2 + 1168);
          uint64_t v36 = *(void *)(a2 + 1304);
          if (v36)
          {
            *(_DWORD *)(v36 + 48) = *(_DWORD *)(a2 + 1176);
            uint64_t v37 = *(void *)(a2 + 1304);
            if (v37)
            {
              *(_DWORD *)(v37 + 52) = *(_DWORD *)(a2 + 1180);
              uint64_t v38 = *(void *)(a2 + 1304);
              if (v38)
              {
                *(_DWORD *)(v38 + 56) = *(_DWORD *)(a2 + 1188);
                uint64_t v39 = *(void *)(a2 + 1304);
                if (v39)
                {
                  *(_DWORD *)(v39 + 60) = *(_DWORD *)(a2 + 1192);
                  uint64_t v40 = *(void *)(a2 + 1304);
                  if (v40)
                  {
                    *(_DWORD *)(v40 + 60) = *(unsigned __int8 *)(a2 + 477) == 9;
                    uint64_t v41 = *(void *)(a2 + 1304);
                    if (v41) {
                      *(_DWORD *)(v41 + 124) = *(unsigned __int8 *)(a2 + 477);
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

  uint64_t v42 = *(void *)(a2 + 1112);
  if (!v42 || !quic_rtt_has_initial_measurement(*(void *)(v42 + 272))) {
    goto LABEL_67;
  }
  uint64_t v43 = *(void *)(a2 + 1304);
  if (v43)
  {
    *(_DWORD *)(*(void *)(a2 + 1304) + 68LL) = (unint64_t)((4
                                                                   * (quic_rtt_get_min_rtt(*(void *)(*(void *)(a2 + 1112) + 272LL)) & 0x7FFFFFFFFFFFFFFuLL)
                                                                   * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4;
    uint64_t v43 = *(void *)(a2 + 1304);
    if (v43)
    {
      *(_DWORD *)(*(void *)(a2 + 1304) + 72LL) = (unint64_t)((4
                                                                     * (quic_rtt_get_smoothed_rtt(*(void *)(*(void *)(a2 + 1112) + 272LL)) & 0x7FFFFFFFFFFFFFFuLL)
                                                                     * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4;
      uint64_t v43 = *(void *)(a2 + 1304);
      if (v43)
      {
        *(_DWORD *)(*(void *)(a2 + 1304) + 76LL) = (unint64_t)((2
                                                                       * (quic_rtt_get_rtt_variance(*(void *)(*(void *)(a2 + 1112) + 272LL)) & 0xFFFFFFFFFFFFFFFuLL)
                                                                       * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4;
LABEL_67:
        uint64_t v43 = *(void *)(a2 + 1304);
        if (v43)
        {
          *(_OWORD *)(v43 + 128) = *(_OWORD *)(a2 + 1288);
          uint64_t v43 = *(void *)(a2 + 1304);
        }
      }
    }
  }

  if ((*(_BYTE *)(a2 + 1381) & 2) != 0)
  {
    if (!v43) {
      return 1LL;
    }
    unsigned int v44 = *(_DWORD *)(v43 + 116) | 1;
  }

  else
  {
    if (!v43) {
      return 1LL;
    }
    unsigned int v44 = *(_DWORD *)(v43 + 116) & 0xFFFFFFFE;
  }

  *(_DWORD *)(v43 + 116) = v44;
  uint64_t v50 = *(void *)(a2 + 1304);
  if (v50)
  {
    uint64_t v51 = (_DWORD *)(a2 + 1380);
    *(_BYTE *)(v50 + 144) |= (*(_DWORD *)(a2 + 1380) & 0x200000) != 0;
    uint64_t v52 = *(void *)(a2 + 1304);
    if (v52)
    {
      *(_BYTE *)(v52 + 144) |= (*v51 >> 22) & 2;
      uint64_t v53 = *(void *)(a2 + 1304);
      if (v53) {
        *(_BYTE *)(v53 + 144) |= (*v51 >> 19) & 8;
      }
    }
  }

  return 1LL;
}

uint64_t __quic_conn_link_advisory_block_invoke_137(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return 1LL;
}

void quic_conn_link_congestion_update(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v11[7] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if (a3)
    {
      v11[1] = MEMORY[0x1895F87A8];
      void v11[2] = 0x40000000LL;
      v11[3] = __quic_conn_link_congestion_update_block_invoke;
      void v11[4] = &__block_descriptor_tmp_140;
      v11[5] = a2;
      v11[6] = a3;
      nw_protocol_instance_access_state();
      return;
    }

    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      uint64_t v8 = _os_log_pack_size();
      uint64_t v9 = (char *)v11 - ((MEMORY[0x1895F8858](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v10 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v10 = 136446210;
      *(void *)(v10 + 4) = "quic_conn_link_congestion_update";
      uint64_t v6 = (uint64_t)v9;
      uint64_t v7 = 5311LL;
      goto LABEL_13;
    }
  }

  else if (qlog_debug_enabled {
         || (qlog_nwlog_enabled & 1) != 0
  }
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    uint64_t v3 = _os_log_pack_size();
    uint64_t v4 = (char *)v11 - ((MEMORY[0x1895F8858](v3, v3) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v5 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v5 = 136446210;
    *(void *)(v5 + 4) = "quic_conn_link_congestion_update";
    uint64_t v6 = (uint64_t)v4;
    uint64_t v7 = 5310LL;
LABEL_13:
    qlog_internal(17, v6, v7);
  }

uint64_t __quic_conn_link_congestion_update_block_invoke(uint64_t a1, uint64_t a2)
{
  v9[1] = *MEMORY[0x1895F89C0];
  uint64_t v4 = quic_conn_lookup_nw_path(a2, *(void *)(a1 + 32));
  if (v4) {
    goto LABEL_4;
  }
  if (*(void *)(a1 + 32) == *MEMORY[0x189608EC0])
  {
    uint64_t v4 = *(void *)(a2 + 1112);
LABEL_4:
    quic_cc_process_link_congestion_info(*(void *)(v4 + 360));
    return 1LL;
  }

  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    uint64_t v6 = _os_log_pack_size();
    uint64_t v7 = (char *)v9 - ((MEMORY[0x1895F8858](v6, v6) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136446210;
    *(void *)(v8 + 4) = "quic_conn_link_congestion_update_block_invoke";
    qlog_internal(17, (uint64_t)v7, 5322LL);
  }

  return 1LL;
}

uint64_t quic_conn_copy_establishment_report(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t v2 = nw_protocol_copy_quic_connection_definition();
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2000000000LL;
  uint64_t v13 = 0LL;
  if (a1)
  {
    uint64_t v3 = (void *)v2;
    v9[1] = MEMORY[0x1895F87A8];
    void v9[2] = 0x40000000LL;
    v9[3] = __quic_conn_copy_establishment_report_block_invoke;
    v9[4] = &unk_18A117FB0;
    v9[5] = &v10;
    v9[6] = v2;
    nw_protocol_instance_access_state();
    if (v3) {
      nw_release(v3);
    }
    uint64_t v4 = v11[3];
  }

  else
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      uint64_t v6 = _os_log_pack_size();
      uint64_t v7 = (char *)v9 - ((MEMORY[0x1895F8858](v6, v6) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v8 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v8 = 136446210;
      *(void *)(v8 + 4) = "quic_conn_copy_establishment_report";
      qlog_internal(17, (uint64_t)v7, 5342LL);
    }

    uint64_t v4 = 0LL;
  }

  _Block_object_dispose(&v10, 8);
  return v4;
}

uint64_t __quic_conn_copy_establishment_report_block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(unsigned __int8 *)(a2 + 477) >= 9u)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = nw_protocol_establishment_report_create();
    quic_ecn_get_state(*(void *)(*(void *)(a2 + 1112) + 416LL));
    nw_protocol_establishment_report_set_client_accurate_ecn_state();
    nw_protocol_establishment_report_set_l4s_enabled();
  }

  return 1LL;
}

uint64_t quic_conn_copy_data_transfer_snapshot(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = 0LL;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2000000000LL;
  uint64_t v7 = a2;
  nw_protocol_instance_access_state();
  uint64_t v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __quic_conn_copy_data_transfer_snapshot_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  if (v4) {
    goto LABEL_4;
  }
  uint64_t v5 = calloc(1uLL, 0xB8uLL);
  if (v5)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v5;
    **(void **)(a1 + 40) = 184LL;
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
LABEL_4:
    uint64_t v6 = *(void *)(a2 + 1112);
    *(void *)(v4 + 56) = *(unsigned int *)(a2 + 1176);
    *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) + 64LL) = *(unsigned int *)(a2 + 1180);
    *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) + 80LL) = *(unsigned int *)(a2 + 1188);
    *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) + 88LL) = *(void *)(a2 + 1248);
    *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) + 96LL) = *(void *)(a2 + 1256);
    *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) + 104LL) = *(void *)(a2 + 1264);
    *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) + 112LL) = *(void *)(a2 + 1272);
    *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) + 128LL) = quic_rtt_get_min_rtt(*(void *)(v6 + 272))
                                                                                     / 0x3E8uLL;
    *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) + 120LL) = quic_rtt_get_smoothed_rtt(*(void *)(v6 + 272))
                                                                                     / 0x3E8uLL;
    uint64_t v7 = *(void *)(v6 + 272);
    *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) + 136LL) = *(void *)(v7 + 8) / 0x3E8uLL;
    *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) + 144LL) = quic_rtt_get_rtt_variance(v7)
                                                                                     / 0x3E8uLL;
    quic_cc_fillout_data_transfer_snapshot(*(void *)(v6 + 360));
    return 1LL;
  }

  uint64_t v9 = qlog_abort_internal("%s strict_calloc(%zu, %zu) failed", "strict_calloc", 1uLL, 0xB8uLL);
  return quic_conn_copy_info(v9);
}

uint64_t quic_conn_copy_info()
{
  uint64_t v2 = 0LL;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2000000000LL;
  uint64_t v5 = 0LL;
  nw_protocol_instance_access_state();
  uint64_t v0 = v3[3];
  _Block_object_dispose(&v2, 8);
  return v0;
}

uint64_t __quic_conn_copy_info_block_invoke(uint64_t a1, uint64_t a2)
{
  v32[5] = *MEMORY[0x1895F89C0];
  if (*(_BYTE *)(a2 + 477) == 9)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = nw_quic_info_allocate();
    if ((quic_migration_is_disabled(*(void *)(a2 + 1120)) & 1) == 0)
    {
      uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
      *(_DWORD *)(v4 + 12) |= 2u;
      if (quic_migration_multipath_ready(*(void *)(a2 + 1120)))
      {
        uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
        *(_DWORD *)(v5 + 12) |= 1u;
      }

      int v6 = quic_migration_count_in_state(*(void *)(a2 + 1120), 5);
      int v7 = quic_migration_count_in_state(*(void *)(a2 + 1120), 7) + v6;
      *(_DWORD *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) + 8LL) = v7
                                                                                     + quic_migration_count_in_state( *(void *)(a2 + 1120),  8);
    }

    if (quic_cid_array_is_empty(*(unsigned __int8 **)(a2 + 376)))
    {
      char v8 = qlog_nwlog_enabled;
      if (qlog_datapath_enabled || qlog_nwlog_enabled)
      {
        if (qlog_debug_enabled) {
          char v8 = 1;
        }
        if ((v8 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v9 = _os_log_pack_size();
          uint64_t v10 = (char *)v31 - ((MEMORY[0x1895F8858](v9, v9) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          uint64_t v11 = _os_log_pack_fill();
          *(_DWORD *)uint64_t v11 = 136446210;
          *(void *)(v11 + 4) = "quic_conn_copy_info_block_invoke";
          qlog_internal(2, (uint64_t)v10, 5482LL);
        }
      }
    }

    else
    {
      int v29 = *(unsigned __int8 **)(a2 + 376);
      v32[0] = MEMORY[0x1895F87A8];
      v32[1] = 0x40000000LL;
      void v32[2] = __quic_conn_copy_info_block_invoke_143;
      v32[3] = &unk_18A118000;
      v32[4] = *(void *)(a1 + 32);
      quic_cid_array_apply(v29, (uint64_t)v32);
    }
  }

  else if ((qlog_debug_enabled {
          || (qlog_nwlog_enabled & 1) != 0
  }
          || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
         && *(void *)(a2 + 1112))
  {
    uint64_t v12 = _os_log_pack_size();
    v31[1] = v31;
    uint64_t v13 = (char *)v31 - ((MEMORY[0x1895F8858](v12, v12) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v14 = _os_log_pack_fill();
    v31[0] = a2 + 976;
    uint64_t v15 = *(unsigned __int8 **)(a2 + 1112);
    if (quic_cid_describe_state % 3 == 2) {
      uint64_t v16 = &quic_cid_describe_cid_buf2;
    }
    else {
      uint64_t v16 = &quic_cid_describe_cid_buf3;
    }
    if (quic_cid_describe_state % 3) {
      int v17 = v16;
    }
    else {
      int v17 = &quic_cid_describe_cid_buf1;
    }
    int v18 = ++quic_cid_describe_state;
    unsigned int v19 = v15[38];
    __int128 v20 = 0uLL;
    *(_OWORD *)((char *)v17 + 25) = 0u;
    if (v19 >= 0x14) {
      uint64_t v21 = 20LL;
    }
    else {
      uint64_t v21 = v19;
    }
    *int v17 = 0uLL;
    v17[1] = 0uLL;
    if ((_DWORD)v21)
    {
      int v22 = v15 + 39;
      do
      {
        int v23 = *v22++;
        snprintf((char *)v17, 0x29uLL, "%s%02x", (const char *)v17, v23);
        --v21;
      }

      while (v21);
      uint64_t v15 = *(unsigned __int8 **)(a2 + 1112);
      int v18 = quic_cid_describe_state;
      __int128 v20 = 0uLL;
    }

    if (v18 % 3 == 2) {
      int v24 = &quic_cid_describe_cid_buf2;
    }
    else {
      int v24 = &quic_cid_describe_cid_buf3;
    }
    if (v18 % 3) {
      uint64_t v25 = v24;
    }
    else {
      uint64_t v25 = &quic_cid_describe_cid_buf1;
    }
    quic_cid_describe_unsigned int state = v18 + 1;
    if (v15[17] >= 0x14u) {
      uint64_t v26 = 20LL;
    }
    else {
      uint64_t v26 = v15[17];
    }
    *uint64_t v25 = v20;
    v25[1] = v20;
    *(_OWORD *)((char *)v25 + 25) = v20;
    if ((_DWORD)v26)
    {
      int v27 = v15 + 18;
      do
      {
        int v28 = *v27++;
        snprintf((char *)v25, 0x29uLL, "%s%02x", (const char *)v25, v28);
        --v26;
      }

      while (v26);
    }

    *(_DWORD *)uint64_t v14 = 136446978;
    *(void *)(v14 + 4) = "quic_conn_copy_info_block_invoke";
    *(_WORD *)(v14 + 12) = 2082;
    *(void *)(v14 + 14) = v31[0];
    *(_WORD *)(v14 + 22) = 2082;
    *(void *)(v14 + 24) = v17;
    *(_WORD *)(v14 + 32) = 2082;
    *(void *)(v14 + 34) = v25;
    qlog_internal(16, (uint64_t)v13, 5467LL);
  }

  return 1LL;
}

uint64_t __quic_conn_copy_info_block_invoke_143(uint64_t a1, unsigned __int8 *a2)
{
  dispatch_data_t v2 = quic_cid_to_dispatch_data(a2);
  nw_array_append();
  if (v2) {
    dispatch_release(v2);
  }
  return 1LL;
}

void quic_conn_handle_error(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v12[7] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if (a4)
    {
      v12[1] = MEMORY[0x1895F87A8];
      void v12[2] = 0x40000000LL;
      v12[3] = __quic_conn_handle_error_block_invoke;
      v12[4] = &__block_descriptor_tmp_147;
      v12[5] = a4;
      void v12[6] = a3;
      nw_protocol_instance_access_state();
      return;
    }

    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      uint64_t v9 = _os_log_pack_size();
      uint64_t v10 = (char *)v12 - ((MEMORY[0x1895F8858](v9, v9) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v11 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v11 = 136446210;
      *(void *)(v11 + 4) = "quic_conn_handle_error";
      uint64_t v7 = (uint64_t)v10;
      uint64_t v8 = 5589LL;
      goto LABEL_13;
    }
  }

  else if (qlog_debug_enabled {
         || (qlog_nwlog_enabled & 1) != 0
  }
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    uint64_t v4 = _os_log_pack_size();
    uint64_t v5 = (char *)v12 - ((MEMORY[0x1895F8858](v4, v4) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v6 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v6 = 136446210;
    *(void *)(v6 + 4) = "quic_conn_handle_error";
    uint64_t v7 = (uint64_t)v5;
    uint64_t v8 = 5588LL;
LABEL_13:
    qlog_internal(17, v7, v8);
  }

uint64_t __quic_conn_handle_error_block_invoke(uint64_t a1, uint64_t a2)
{
  return 1LL;
}

void quic_conn_handle_error_inner(uint64_t a1, nw_error_t error, uint64_t a3)
{
  uint64_t v89 = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }

    uint64_t v77 = _os_log_pack_size();
    uint64_t v78 = (char *)&v80 - ((MEMORY[0x1895F8858](v77, v77) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v79 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v79 = 136446210;
    *(void *)(v79 + 4) = "quic_conn_handle_error_inner";
    uint64_t v28 = (uint64_t)v78;
    uint64_t v29 = 5520LL;
LABEL_28:
    qlog_internal(17, v28, v29);
    return;
  }

  nw_error_domain_t error_domain = nw_error_get_error_domain(error);
  int error_code = nw_error_get_error_code(error);
  if (error_domain != nw_error_domain_posix)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }

    uint64_t v25 = _os_log_pack_size();
    uint64_t v26 = (char *)&v80 - ((MEMORY[0x1895F8858](v25, v25) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v27 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v27 = 136446466;
    *(void *)(v27 + 4) = "quic_conn_handle_error_inner";
    *(_WORD *)(v27 + 12) = 1024;
    *(_DWORD *)(v27 + 14) = error_domain;
    uint64_t v28 = (uint64_t)v26;
    uint64_t v29 = 5526LL;
    goto LABEL_28;
  }

  int v8 = error_code;
  uint64_t v9 = (void *)MEMORY[0x189608EC0];
  uint64_t stats_region = nw_protocol_instance_get_stats_region();
  uint64_t v11 = &g_quic_stats;
  if (stats_region) {
    uint64_t v11 = (void *)stats_region;
  }
  *(void *)(a1 + 1312) = v11;
  uint64_t stats = nw_protocol_instance_get_stats();
  *(void *)(a1 + 1304) = stats;
  if (stats)
  {
    *(void *)(stats + 16) = *(void *)(a1 + 1144);
    uint64_t v13 = *(void *)(a1 + 1304);
    if (v13)
    {
      *(void *)(v13 + 24) = *(void *)(a1 + 1152);
      uint64_t v14 = *(void *)(a1 + 1304);
      if (v14)
      {
        *(void *)(v14 + 32) = *(void *)(a1 + 1160);
        uint64_t v15 = *(void *)(a1 + 1304);
        if (v15)
        {
          *(void *)(v15 + 40) = *(void *)(a1 + 1168);
          uint64_t v16 = *(void *)(a1 + 1304);
          if (v16)
          {
            *(_DWORD *)(v16 + 48) = *(_DWORD *)(a1 + 1176);
            uint64_t v17 = *(void *)(a1 + 1304);
            if (v17)
            {
              *(_DWORD *)(v17 + 52) = *(_DWORD *)(a1 + 1180);
              uint64_t v18 = *(void *)(a1 + 1304);
              if (v18)
              {
                *(_DWORD *)(v18 + 56) = *(_DWORD *)(a1 + 1188);
                uint64_t v19 = *(void *)(a1 + 1304);
                if (v19)
                {
                  *(_DWORD *)(v19 + 60) = *(_DWORD *)(a1 + 1192);
                  uint64_t v20 = *(void *)(a1 + 1304);
                  if (v20)
                  {
                    *(_DWORD *)(v20 + 60) = *(unsigned __int8 *)(a1 + 477) == 9;
                    uint64_t v21 = *(void *)(a1 + 1304);
                    if (v21) {
                      *(_DWORD *)(v21 + 124) = *(unsigned __int8 *)(a1 + 477);
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

  uint64_t v22 = *(void *)(a1 + 1112);
  if (v22 && quic_rtt_has_initial_measurement(*(void *)(v22 + 272)))
  {
    if (!*(void *)(a1 + 1304)) {
      goto LABEL_29;
    }
    *(_DWORD *)(*(void *)(a1 + 1304) + 68LL) = (unint64_t)((4
                                                                   * (quic_rtt_get_min_rtt(*(void *)(*(void *)(a1 + 1112) + 272LL)) & 0x7FFFFFFFFFFFFFFuLL)
                                                                   * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4;
    if (!*(void *)(a1 + 1304)) {
      goto LABEL_29;
    }
    *(_DWORD *)(*(void *)(a1 + 1304) + 72LL) = (unint64_t)((4
                                                                   * (quic_rtt_get_smoothed_rtt(*(void *)(*(void *)(a1 + 1112) + 272LL)) & 0x7FFFFFFFFFFFFFFuLL)
                                                                   * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4;
    if (!*(void *)(a1 + 1304)) {
      goto LABEL_29;
    }
    *(_DWORD *)(*(void *)(a1 + 1304) + 76LL) = (unint64_t)((2
                                                                   * (quic_rtt_get_rtt_variance(*(void *)(*(void *)(a1 + 1112) + 272LL)) & 0xFFFFFFFFFFFFFFFuLL)
                                                                   * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4;
  }

  uint64_t v23 = *(void *)(a1 + 1304);
  if (v23)
  {
    *(_OWORD *)(v23 + 128) = *(_OWORD *)(a1 + 1288);
    uint64_t v24 = *(void *)(a1 + 1304);
    goto LABEL_30;
  }

void __quic_conn_drain_connection_async_block_invoke(uint64_t a1)
{
}

uint64_t __quic_conn_drain_connection_async_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return 1LL;
}

void quic_conn_send_fc_credit(uint64_t a1)
{
  v12[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if (*(unsigned __int8 *)(a1 + 477) <= 9u && quic_prepare_max_data((void *)a1))
    {
      quic_frame_alloc_MAX_DATA(*(void *)(a1 + 560), *(void *)(a1 + 856));
      uint64_t path = quic_conn_select_next_path((void *)a1, (uint64_t)&__block_literal_global_98);
      if ((quic_conn_send_internal(a1, path, 0LL) & 1) == 0
        && (qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG)))
      {
        uint64_t v3 = _os_log_pack_size();
        uint64_t v4 = (char *)v12 - ((MEMORY[0x1895F8858](v3, v3) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v5 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v5 = 136446210;
        *(void *)(v5 + 4) = "quic_conn_send_fc_credit";
        int v6 = 2;
        uint64_t v7 = (uint64_t)v4;
        uint64_t v8 = 5618LL;
LABEL_9:
        qlog_internal(v6, v7, v8);
      }
    }
  }

  else if (qlog_debug_enabled {
         || (qlog_nwlog_enabled & 1) != 0
  }
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    uint64_t v9 = _os_log_pack_size();
    uint64_t v10 = (char *)v12 - ((MEMORY[0x1895F8858](v9, v9) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 136446210;
    *(void *)(v11 + 4) = "quic_conn_send_fc_credit";
    int v6 = 17;
    uint64_t v7 = (uint64_t)v10;
    uint64_t v8 = 5603LL;
    goto LABEL_9;
  }

uint64_t quic_conn_lookup_path_by_dcid_seq(uint64_t a1, uint64_t a2)
{
  v6[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if (a2)
    {
      for (uint64_t result = *(void *)(a1 + 1360); result; uint64_t result = *(void *)(result + 312))
      {
        if (*(void *)(result + 328) == a2) {
          break;
        }
      }
    }

    else
    {
      for (uint64_t result = *(void *)(a1 + 1360); result; uint64_t result = *(void *)(result + 312))
      {
        if ((*(_WORD *)(result + 431) & 1) != 0) {
          break;
        }
      }
    }
  }

  else
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      uint64_t v3 = _os_log_pack_size();
      uint64_t v4 = (char *)v6 - ((MEMORY[0x1895F8858](v3, v3) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v5 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v5 = 136446210;
      *(void *)(v5 + 4) = "quic_conn_lookup_path_by_dcid_seq";
      qlog_internal(17, (uint64_t)v4, 5641LL);
    }

    return 0LL;
  }

  return result;
}

uint64_t __quic_conn_foreach_sendable_path_block_invoke(uint64_t a1, uint64_t a2)
{
  if (quic_migration_sendable_path(*(void *)(*(void *)(a1 + 40) + 1120LL), *(void *)(a1 + 40), a2)) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
  else {
    return 1LL;
  }
}

void quic_conn_foreach_validated_path(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 0x40000000LL;
    uint64_t v9 = __quic_conn_foreach_validated_path_block_invoke;
    uint64_t v10 = &unk_18A118098;
    uint64_t v11 = a2;
    uint64_t v2 = *(void *)(a1 + 1360);
    do
    {
      if (!v2) {
        break;
      }
      uint64_t v3 = *(void *)(v2 + 312);
      char v4 = ((uint64_t (*)(void *))v9)(v8);
      uint64_t v2 = v3;
    }

    while ((v4 & 1) != 0);
  }

  else if (qlog_debug_enabled {
         || (qlog_nwlog_enabled & 1) != 0
  }
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    uint64_t v5 = _os_log_pack_size();
    int v6 = (char *)v8 - ((MEMORY[0x1895F8858](v5, v5) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v7 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v7 = 136446210;
    *(void *)(v7 + 4) = "quic_conn_foreach_validated_path";
    qlog_internal(17, (uint64_t)v6, 5674LL);
  }

void quic_conn_destroy_path(void *a1, uint64_t a2)
{
  v18[1] = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }

    uint64_t v10 = _os_log_pack_size();
    uint64_t v11 = (char *)v18 - ((MEMORY[0x1895F8858](v10, v10) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v12 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v12 = 136446210;
    *(void *)(v12 + 4) = "quic_conn_destroy_path";
    uint64_t v13 = (uint64_t)v11;
    uint64_t v14 = 5706LL;
LABEL_24:
    qlog_internal(17, v13, v14);
    return;
  }

  if (!a2)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }

    uint64_t v15 = _os_log_pack_size();
    uint64_t v16 = (char *)v18 - ((MEMORY[0x1895F8858](v15, v15) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v17 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v17 = 136446210;
    *(void *)(v17 + 4) = "quic_conn_destroy_path";
    uint64_t v13 = (uint64_t)v16;
    uint64_t v14 = 5707LL;
    goto LABEL_24;
  }

  if (a1[139] == a2 && (quic_conn_change_current_path(a1, a2) & 1) == 0)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = _os_log_pack_size();
      uint64_t v8 = (char *)v18 - ((MEMORY[0x1895F8858](v7, v7) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v9 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v9 = 136446466;
      *(void *)(v9 + 4) = "quic_conn_destroy_path";
      *(_WORD *)(v9 + 12) = 2048;
      *(void *)(v9 + 14) = a2;
      qlog_internal(2, (uint64_t)v8, 5714LL);
    }

    *(_WORD *)(a2 + 431) |= 0x80u;
  }

  else
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v4 = _os_log_pack_size();
      uint64_t v5 = (char *)v18 - ((MEMORY[0x1895F8858](v4, v4) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v6 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v6 = 136446466;
      *(void *)(v6 + 4) = "quic_conn_destroy_path";
      *(_WORD *)(v6 + 12) = 2048;
      *(void *)(v6 + 14) = a2;
      qlog_internal(2, (uint64_t)v5, 5719LL);
    }

    _quic_path_destroy((uint64_t)(a1 + 170), a1, (void *)a2);
  }

uint64_t quic_conn_change_current_path(void *a1, uint64_t a2)
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  uint64_t v3 = a1[170];
  if (v3)
  {
    uint64_t v4 = 0LL;
    do
    {
      if (v3 != a2)
      {
        unsigned int v5 = *(unsigned __int8 *)(v3 + 16);
        if (v5 == 8)
        {
          quic_migration_evaluate_primary(a1[140], v3);
          quic_migration_migrate(a1[140], (uint64_t)a1, v3, 0);
          return 1LL;
        }

        if (v5 > 3) {
          uint64_t v4 = v3;
        }
      }

      uint64_t v3 = *(void *)(v3 + 312);
    }

    while (v3);
    if (v4) {
      return 0LL;
    }
  }

  if ((qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0
                           || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
    && a1[139])
  {
    uint64_t v6 = _os_log_pack_size();
    uint64_t v26 = &v24;
    uint64_t v7 = (char *)&v24 - ((MEMORY[0x1895F8858](v6, v6) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v8 = _os_log_pack_fill();
    uint64_t v25 = a1 + 122;
    uint64_t v9 = (unsigned __int8 *)a1[139];
    if (quic_cid_describe_state % 3 == 2) {
      uint64_t v10 = &quic_cid_describe_cid_buf2;
    }
    else {
      uint64_t v10 = &quic_cid_describe_cid_buf3;
    }
    if (quic_cid_describe_state % 3) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = &quic_cid_describe_cid_buf1;
    }
    int v12 = ++quic_cid_describe_state;
    unsigned int v13 = v9[38];
    __int128 v14 = 0uLL;
    *(_OWORD *)((char *)v11 + 25) = 0u;
    if (v13 >= 0x14) {
      uint64_t v15 = 20LL;
    }
    else {
      uint64_t v15 = v13;
    }
    _OWORD *v11 = 0uLL;
    v11[1] = 0uLL;
    if ((_DWORD)v15)
    {
      uint64_t v16 = v9 + 39;
      do
      {
        int v17 = *v16++;
        snprintf((char *)v11, 0x29uLL, "%s%02x", (const char *)v11, v17);
        --v15;
      }

      while (v15);
      uint64_t v9 = (unsigned __int8 *)a1[139];
      int v12 = quic_cid_describe_state;
      __int128 v14 = 0uLL;
    }

    if (v12 % 3 == 2) {
      uint64_t v18 = &quic_cid_describe_cid_buf2;
    }
    else {
      uint64_t v18 = &quic_cid_describe_cid_buf3;
    }
    if (v12 % 3) {
      uint64_t v19 = v18;
    }
    else {
      uint64_t v19 = &quic_cid_describe_cid_buf1;
    }
    quic_cid_describe_unsigned int state = v12 + 1;
    if (v9[17] >= 0x14u) {
      uint64_t v20 = 20LL;
    }
    else {
      uint64_t v20 = v9[17];
    }
    _OWORD *v19 = v14;
    v19[1] = v14;
    *(_OWORD *)((char *)v19 + 25) = v14;
    if ((_DWORD)v20)
    {
      uint64_t v21 = v9 + 18;
      do
      {
        int v22 = *v21++;
        snprintf((char *)v19, 0x29uLL, "%s%02x", (const char *)v19, v22);
        --v20;
      }

      while (v20);
    }

    *(_DWORD *)uint64_t v8 = 136446978;
    *(void *)(v8 + 4) = "quic_conn_change_current_path";
    *(_WORD *)(v8 + 12) = 2082;
    *(void *)(v8 + 14) = v25;
    *(_WORD *)(v8 + 22) = 2082;
    *(void *)(v8 + 24) = v11;
    *(_WORD *)(v8 + 32) = 2082;
    *(void *)(v8 + 34) = v19;
    qlog_internal(16, (uint64_t)v7, 5784LL);
  }

  if (a1[70]) {
    quic_conn_close((uint64_t)a1);
  }
  return 0LL;
}

uint64_t quic_conn_unset_current_path(uint64_t a1)
{
  v7[1] = *MEMORY[0x1895F89C0];
  uint64_t v1 = *(void *)(a1 + 1112);
  if (v1)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v3 = _os_log_pack_size();
      uint64_t v4 = (char *)v7 - ((MEMORY[0x1895F8858](v3, v3) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v5 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v5 = 136446466;
      *(void *)(v5 + 4) = "quic_conn_unset_current_path";
      *(_WORD *)(v5 + 12) = 2048;
      *(void *)(v5 + 14) = v1;
      qlog_internal(2, (uint64_t)v4, 5740LL);
    }

    *(void *)(a1 + 1112) = 0LL;
  }

  return v1;
}

BOOL quic_conn_ensure_has_current_path(void *a1)
{
  v5[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if (a1[139]) {
      return 1LL;
    }
    a1[133] = 6LL;
    a1[134] = 16LL;
    a1[135] = "missing connection path";
    quic_conn_close((uint64_t)a1);
    return 0LL;
  }

  if (qlog_debug_enabled
    || (qlog_nwlog_enabled & 1) != 0
    || (BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT)))
  {
    uint64_t v2 = _os_log_pack_size();
    uint64_t v3 = (char *)v5 - ((MEMORY[0x1895F8858](v2, v2) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v4 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v4 = 136446210;
    *(void *)(v4 + 4) = "quic_conn_ensure_has_current_path";
    qlog_internal(17, (uint64_t)v3, 5827LL);
    return 0LL;
  }

  return result;
}

uint64_t quic_packet_builder_get_frame_pool(uint64_t a1)
{
  v5[1] = *MEMORY[0x1895F89C0];
  if (a1) {
    return *(void *)a1;
  }
  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    uint64_t v2 = _os_log_pack_size();
    uint64_t v3 = (char *)v5 - ((MEMORY[0x1895F8858](v2, v2) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v4 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v4 = 136446210;
    *(void *)(v4 + 4) = "quic_packet_builder_get_frame_pool";
    qlog_internal(17, (uint64_t)v3, 92LL);
  }

  return 0LL;
}

void quic_packet_builder_prepend_for_pn_space(uint64_t a1, uint64_t a2, unsigned int a3)
{
  v21[1] = *MEMORY[0x1895F89C0];
  char v3 = qlog_nwlog_enabled;
  if (a3)
  {
    if (qlog_datapath_enabled) {
      int v7 = 1;
    }
    else {
      int v7 = qlog_nwlog_enabled;
    }
    if (v7 == 1)
    {
      if (qlog_debug_enabled) {
        char v3 = 1;
      }
      if ((v3 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v16 = _os_log_pack_size();
        int v17 = (char *)v21 - ((MEMORY[0x1895F8858](v16, v16) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v18 = _os_log_pack_fill();
        uint64_t v19 = quic_frame_type_describe(*(void *)a2);
        int v20 = *(unsigned __int16 *)(a2 + 8);
        *(_DWORD *)uint64_t v18 = 136446722;
        *(void *)(v18 + 4) = "quic_packet_builder_prepend_for_pn_space";
        *(_WORD *)(v18 + 12) = 2082;
        *(void *)(v18 + 14) = v19;
        *(_WORD *)(v18 + 22) = 1024;
        *(_DWORD *)(v18 + 24) = v20;
        qlog_internal(2, (uint64_t)v17, 106LL);
      }
    }

    uint64_t v8 = a1 + 16LL * a3;
    uint64_t v10 = *(void *)(v8 + 16);
    uint64_t v9 = (void *)(v8 + 16);
    *(void *)(a2 + 96) = v10;
    uint64_t v11 = (void *)(v10 + 104);
    if (v10) {
      int v12 = v11;
    }
    else {
      int v12 = v9 + 1;
    }
    void *v12 = a2 + 96;
    *uint64_t v9 = a2;
    *(void *)(a2 + 104) = v9;
  }

  else
  {
    if (qlog_debug_enabled) {
      char v3 = 1;
    }
    if ((v3 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      uint64_t v13 = _os_log_pack_size();
      __int128 v14 = (char *)v21 - ((MEMORY[0x1895F8858](v13, v13) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v15 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v15 = 136446210;
      *(void *)(v15 + 4) = "quic_packet_builder_prepend_for_pn_space";
      qlog_internal(17, (uint64_t)v14, 103LL);
    }
  }

void quic_packet_builder_append_for_pn_space(uint64_t a1, uint64_t a2, unsigned int a3)
{
  v8[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    *(void *)(a2 + 96) = 0LL;
    uint64_t v3 = a1 + 16LL * a3;
    uint64_t v4 = *(void **)(v3 + 24);
    *(void *)(a2 + 104) = v4;
    *uint64_t v4 = a2;
    *(void *)(v3 + 24) = a2 + 96;
  }

  else if (qlog_debug_enabled {
         || (qlog_nwlog_enabled & 1) != 0
  }
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    uint64_t v5 = _os_log_pack_size();
    uint64_t v6 = (char *)v8 - ((MEMORY[0x1895F8858](v5, v5) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v7 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v7 = 136446210;
    *(void *)(v7 + 4) = "quic_packet_builder_append_for_pn_space";
    qlog_internal(17, (uint64_t)v6, 117LL);
  }

void *quic_packet_builder_find_for_pn_space(uint64_t a1, uint64_t a2, unsigned int a3)
{
  v12[1] = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return 0LL;
    }

    uint64_t v4 = _os_log_pack_size();
    uint64_t v5 = (char *)v12 - ((MEMORY[0x1895F8858](v4, v4) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v6 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v6 = 136446210;
    *(void *)(v6 + 4) = "quic_packet_builder_find_for_pn_space";
    uint64_t v7 = (uint64_t)v5;
    uint64_t v8 = 175LL;
    goto LABEL_15;
  }

  if (!a3)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return 0LL;
    }

    uint64_t v9 = _os_log_pack_size();
    uint64_t v10 = (char *)v12 - ((MEMORY[0x1895F8858](v9, v9) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 136446210;
    *(void *)(v11 + 4) = "quic_packet_builder_find_for_pn_space";
    uint64_t v7 = (uint64_t)v10;
    uint64_t v8 = 176LL;
LABEL_15:
    qlog_internal(17, v7, v8);
    return 0LL;
  }

  for (BOOL result = *(void **)(a1 + 16LL * a3 + 16); result; BOOL result = (void *)result[12])
  {
    if (*result == a2) {
      break;
    }
  }

  return result;
}

BOOL __quic_packet_builder_find_ack_mp_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 24);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v2 == v3) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a2;
  }
  return v2 != v3;
}

void quic_packet_builder_destroy(void *a1)
{
  v20[1] = *MEMORY[0x1895F89C0];
  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v2 = _os_log_pack_size();
    uint64_t v3 = (char *)v20 - ((MEMORY[0x1895F8858](v2, v2) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v4 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v4 = 136446210;
    *(void *)(v4 + 4) = "quic_packet_builder_destroy";
    qlog_internal(2, (uint64_t)v3, 272LL);
  }

  for (uint64_t i = a1[4]; i; uint64_t i = *(void *)(i + 96))
  {
    if (*(void *)i == 8LL) {
      *(_BYTE *)(i + 16) |= 4u;
    }
  }

  for (uint64_t j = a1[6]; j; uint64_t j = *(void *)(j + 96))
  {
    if (*(void *)j == 8LL) {
      *(_BYTE *)(j + 16) |= 4u;
    }
  }

  uint64_t v7 = a1[8];
  if (!v7) {
    goto LABEL_19;
  }
  do
  {
    if (*(void *)v7 == 8LL) {
      *(_BYTE *)(v7 + 16) |= 4u;
    }
    uint64_t v7 = *(void *)(v7 + 96);
  }

  while (v7);
  if (!a1)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      uint64_t v9 = _os_log_pack_size();
      uint64_t v10 = (char *)v20 - ((MEMORY[0x1895F8858](v9, v9) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v11 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v11 = 136446210;
      *(void *)(v11 + 4) = "quic_packet_builder_flush_for_pn_space";
      qlog_internal(17, (uint64_t)v10, 498LL);
      char v12 = qlog_nwlog_enabled;
    }

    else
    {
      char v12 = 0;
    }

    if (qlog_debug_enabled || (v12 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      uint64_t v13 = _os_log_pack_size();
      __int128 v14 = (char *)v20 - ((MEMORY[0x1895F8858](v13, v13) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v15 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v15 = 136446210;
      *(void *)(v15 + 4) = "quic_packet_builder_flush_for_pn_space";
      qlog_internal(17, (uint64_t)v14, 498LL);
      char v16 = qlog_nwlog_enabled;
    }

    else
    {
      char v16 = 0;
    }

    if (qlog_debug_enabled || (v16 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      uint64_t v17 = _os_log_pack_size();
      uint64_t v18 = (char *)v20 - ((MEMORY[0x1895F8858](v17, v17) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v19 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v19 = 136446210;
      *(void *)(v19 + 4) = "quic_packet_builder_flush_for_pn_space";
      qlog_internal(17, (uint64_t)v18, 498LL);
    }
  }

  else
  {
LABEL_19:
    quic_frame_list_flush((uint64_t)(a1 + 4));
    quic_frame_list_flush((uint64_t)(a1 + 6));
    quic_frame_list_flush((uint64_t)(a1 + 8));
  }

  uint64_t v8 = (void *)a1[11];
  if (v8) {
    free(v8);
  }
  free(a1);
}

void quic_packet_builder_flush_for_pn_space(uint64_t a1, unsigned int a2)
{
  v10[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if (a2)
    {
      quic_frame_list_flush(a1 + 16LL * a2 + 16);
      return;
    }

    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      uint64_t v7 = _os_log_pack_size();
      uint64_t v8 = (char *)v10 - ((MEMORY[0x1895F8858](v7, v7) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v9 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v9 = 136446210;
      *(void *)(v9 + 4) = "quic_packet_builder_flush_for_pn_space";
      uint64_t v5 = (uint64_t)v8;
      uint64_t v6 = 499LL;
      goto LABEL_12;
    }
  }

  else if (qlog_debug_enabled {
         || (qlog_nwlog_enabled & 1) != 0
  }
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    uint64_t v2 = _os_log_pack_size();
    uint64_t v3 = (char *)v10 - ((MEMORY[0x1895F8858](v2, v2) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v4 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v4 = 136446210;
    *(void *)(v4 + 4) = "quic_packet_builder_flush_for_pn_space";
    uint64_t v5 = (uint64_t)v3;
    uint64_t v6 = 498LL;
LABEL_12:
    qlog_internal(17, v5, v6);
  }

void quic_packet_builder_set_version(uint64_t a1, unsigned int a2)
{
  v10[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if (a2)
    {
      *(_DWORD *)(a1 + 80) = bswap32(a2);
      return;
    }

    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      uint64_t v7 = _os_log_pack_size();
      uint64_t v8 = (char *)v10 - ((MEMORY[0x1895F8858](v7, v7) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v9 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v9 = 136446210;
      *(void *)(v9 + 4) = "quic_packet_builder_set_version";
      uint64_t v5 = (uint64_t)v8;
      uint64_t v6 = 294LL;
      goto LABEL_13;
    }
  }

  else if (qlog_debug_enabled {
         || (qlog_nwlog_enabled & 1) != 0
  }
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    uint64_t v2 = _os_log_pack_size();
    uint64_t v3 = (char *)v10 - ((MEMORY[0x1895F8858](v2, v2) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v4 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v4 = 136446210;
    *(void *)(v4 + 4) = "quic_packet_builder_set_version";
    uint64_t v5 = (uint64_t)v3;
    uint64_t v6 = 293LL;
LABEL_13:
    qlog_internal(17, v5, v6);
  }

void quic_packet_builder_set_initial_token(uint64_t a1, size_t __size, const void *a3)
{
  v11[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    unsigned int v4 = __size;
    uint64_t v6 = *(void **)(a1 + 88);
    if (v6)
    {
      free(v6);
      *(void *)(a1 + 88) = 0LL;
    }

    *(_WORD *)(a1 + 84) = v4;
    if (v4)
    {
      uint64_t v7 = malloc(v4);
      if (!v7) {
        qlog_abort_internal("%s strict_malloc(%zu) failed", "strict_malloc", v4);
      }
      *(void *)(a1 + 88) = v7;
      memcpy(v7, a3, v4);
    }
  }

  else if (qlog_debug_enabled {
         || (qlog_nwlog_enabled & 1) != 0
  }
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    uint64_t v8 = _os_log_pack_size();
    uint64_t v9 = (char *)v11 - ((MEMORY[0x1895F8858](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v10 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v10 = 136446210;
    *(void *)(v10 + 4) = "quic_packet_builder_set_initial_token";
    qlog_internal(17, (uint64_t)v9, 303LL);
  }

BOOL quic_packet_builder_has_frames(uint64_t a1, unsigned int a2)
{
  v11[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if (a2) {
      return *(void *)(a1 + 16LL * a2 + 16) != 0LL;
    }
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || (BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT)))
    {
      uint64_t v8 = _os_log_pack_size();
      uint64_t v9 = (char *)v11 - ((MEMORY[0x1895F8858](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v10 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v10 = 136446210;
      *(void *)(v10 + 4) = "quic_packet_builder_has_frames";
      uint64_t v6 = (uint64_t)v9;
      uint64_t v7 = 323LL;
      goto LABEL_13;
    }
  }

  else if (qlog_debug_enabled {
         || (qlog_nwlog_enabled & 1) != 0
  }
         || (BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT)))
  {
    uint64_t v3 = _os_log_pack_size();
    unsigned int v4 = (char *)v11 - ((MEMORY[0x1895F8858](v3, v3) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v5 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v5 = 136446210;
    *(void *)(v5 + 4) = "quic_packet_builder_has_frames";
    uint64_t v6 = (uint64_t)v4;
    uint64_t v7 = 322LL;
LABEL_13:
    qlog_internal(17, v6, v7);
    return 0LL;
  }

  return result;
}

BOOL quic_packet_builder_has_ack_eliciting_frame(uint64_t a1, unsigned int a2)
{
  v13[1] = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    if (!qlog_debug_enabled && (qlog_nwlog_enabled & 1) == 0)
    {
      BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT);
      if (!result) {
        return result;
      }
    }

    uint64_t v5 = _os_log_pack_size();
    uint64_t v6 = (char *)v13 - ((MEMORY[0x1895F8858](v5, v5) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v7 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v7 = 136446210;
    *(void *)(v7 + 4) = "quic_packet_builder_has_ack_eliciting_frame";
    uint64_t v8 = (uint64_t)v6;
    uint64_t v9 = 337LL;
    goto LABEL_20;
  }

  if (!a2)
  {
    if (!qlog_debug_enabled && (qlog_nwlog_enabled & 1) == 0)
    {
      BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT);
      if (!result) {
        return result;
      }
    }

    uint64_t v10 = _os_log_pack_size();
    uint64_t v11 = (char *)v13 - ((MEMORY[0x1895F8858](v10, v10) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v12 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v12 = 136446210;
    *(void *)(v12 + 4) = "quic_packet_builder_has_ack_eliciting_frame";
    uint64_t v8 = (uint64_t)v11;
    uint64_t v9 = 338LL;
LABEL_20:
    qlog_internal(17, v8, v9);
    return 0LL;
  }

  uint64_t v2 = *(uint64_t **)(a1 + 16LL * a2 + 16);
  if (!v2) {
    return 0LL;
  }
  while (1)
  {
    unint64_t v3 = (unint64_t)*v2 <= 0xBAB9FF ? *v2 : *v2 - 12237272;
    uint64_t v2 = (uint64_t *)v2[12];
    if (!v2) {
      return 0LL;
    }
  }

  return 1LL;
}

uint64_t quic_packet_builder_calculate_size( uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t *a6, unsigned int a7)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  tag_unint64_t size = quic_protector_get_tag_size(a2, a3);
  if (a7 <= tag_size)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || (uint64_t result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT), (_DWORD)result))
    {
      uint64_t v16 = _os_log_pack_size();
      uint64_t v17 = (char *)&v19 - ((MEMORY[0x1895F8858](v16, v16) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v18 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v18 = 136446210;
      *(void *)(v18 + 4) = "quic_packet_builder_calculate_size";
      qlog_internal(17, (uint64_t)v17, 446LL);
      return 0LL;
    }
  }

  else
  {
    LODWORD(result) = _quic_packet_builder_calculate_size( a1,  a2,  a3,  a4,  a5,  a6,  (unsigned __int16)(a7 - tag_size),  1,  (char *)&v19 + 7);
    if (HIBYTE(v19)) {
      return result;
    }
    else {
      return 0LL;
    }
  }

  return result;
}

uint64_t _quic_packet_builder_calculate_size( uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t *a6, unsigned int a7, char a8, char *a9)
{
  uint64_t v71 = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return 0;
    }

    uint64_t v54 = _os_log_pack_size();
    uint64_t v55 = (char *)v68 - ((MEMORY[0x1895F8858](v54, v54) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v56 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v56 = 136446210;
    *(void *)(v56 + 4) = "_quic_packet_builder_calculate_size";
    uint64_t v57 = (uint64_t)v55;
    uint64_t v58 = 354LL;
    goto LABEL_101;
  }

  if (!a2)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return 0;
    }

    uint64_t v59 = _os_log_pack_size();
    uint64_t v60 = (char *)v68 - ((MEMORY[0x1895F8858](v59, v59) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v61 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v61 = 136446210;
    *(void *)(v61 + 4) = "_quic_packet_builder_calculate_size";
    uint64_t v57 = (uint64_t)v60;
    uint64_t v58 = 355LL;
    goto LABEL_101;
  }

  if (!a3)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return 0;
    }

    uint64_t v62 = _os_log_pack_size();
    uint64_t v63 = (char *)v68 - ((MEMORY[0x1895F8858](v62, v62) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v64 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v64 = 136446210;
    *(void *)(v64 + 4) = "_quic_packet_builder_calculate_size";
    uint64_t v57 = (uint64_t)v63;
    uint64_t v58 = 356LL;
    goto LABEL_101;
  }

  if (!a4)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return 0;
    }

    uint64_t v65 = _os_log_pack_size();
    __int128 v66 = (char *)v68 - ((MEMORY[0x1895F8858](v65, v65) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v67 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v67 = 136446210;
    *(void *)(v67 + 4) = "_quic_packet_builder_calculate_size";
    uint64_t v57 = (uint64_t)v66;
    uint64_t v58 = 357LL;
LABEL_101:
    qlog_internal(17, v57, v58);
    return 0;
  }

  uint64_t v70 = a9;
  unsigned __int8 v15 = a3 - 6;
  if (a3 >= 6) {
    unsigned __int8 v16 = 0;
  }
  else {
    unsigned __int8 v16 = 0x30303020100uLL >> (8 * a3);
  }
  BOOL v17 = (a3 & 0x3F) == 1 && a3 < 6;
  uint64_t pn = quic_protector_get_pn(a2, v16 & 3, *(void *)(a4 + 328));
  if (a5 == -1) {
    uint64_t v19 = 0LL;
  }
  else {
    uint64_t v19 = a5;
  }
  unint64_t v20 = 2 * (pn - v19);
  unsigned int v21 = pn & 0xFFFFFF;
  if (v20 >> 24) {
    unsigned int v21 = pn;
  }
  if (v20 >> 16) {
    unsigned int v22 = v21;
  }
  else {
    unsigned int v22 = (unsigned __int16)pn;
  }
  if (v20 <= 0xFF) {
    unsigned int v23 = pn;
  }
  else {
    unsigned int v23 = v22;
  }
  unsigned int v24 = (39 - __clz(v23)) >> 3;
  if (!v23) {
    LOBYTE(v24) = 1;
  }
  __int16 v25 = *(unsigned __int8 *)(a4 + 17);
  if (v15 > 0xFDu)
  {
    unsigned __int16 v26 = v25 + (v24 + 1);
  }

  else
  {
    unsigned __int16 v26 = v25 + (v24 + 9) + *(unsigned __int8 *)(a4 + 38);
    if (v17)
    {
      unint64_t v27 = *(unsigned __int16 *)(a1 + 84);
      if (*(_WORD *)(a1 + 84)) {
        __int16 v28 = byte_187C047FC[(73 - __clz(v27)) >> 3];
      }
      else {
        __int16 v28 = 1;
      }
      v26 += v27 + v28;
    }
  }

  if (a6) {
    uint64_t v29 = a6;
  }
  else {
    uint64_t v29 = (uint64_t *)(a1 + 16LL * v16 + 16);
  }
  uint64_t v30 = *v29;
  if (!*v29)
  {
    char v33 = 0;
    LOWORD(v32) = 0;
    uint64_t v34 = v70;
    goto LABEL_80;
  }

  if ((a8 & 1) != 0)
  {
    uint64_t v31 = *(void *)(v30 + 96);
    if (!*(void *)v30 && *(__int16 *)(v30 + 18) == -1)
    {
      LOWORD(v32) = a7 - v26;
      LOBYTE(v17) = 1;
      goto LABEL_60;
    }

    int v32 = *(unsigned __int16 *)(v30 + 8);
    if (v26 + v32 > a7)
    {
      LOWORD(v32) = 0;
      goto LABEL_60;
    }

    if (v31)
    {
      uint64_t v34 = v70;
      do
      {
        uint64_t v39 = *(void *)(v31 + 96);
        if (!*(void *)v31 && *(__int16 *)(v31 + 18) == -1)
        {
          LOWORD(v32) = a7 - v26;
          char v33 = 1;
          goto LABEL_80;
        }

        int v40 = *(unsigned __int16 *)(v31 + 8);
        LOWORD(v32) = v40 + v32;
        uint64_t v31 = v39;
      }

      while (v39);
      char v33 = 1;
      if (!v17) {
        goto LABEL_77;
      }
      goto LABEL_80;
    }
  }

  else
  {
    LOWORD(v32) = 0;
    char v35 = 0;
    uint64_t v36 = *v29;
    do
    {
      while (1)
      {
        uint64_t v37 = *(void *)(v36 + 96);
        LOBYTE(v17) = 1;
        uint64_t v36 = *(void *)(v36 + 96);
        if (!v37) {
          goto LABEL_47;
        }
      }

      int v38 = *(unsigned __int16 *)(v36 + 8);
      LOWORD(v32) = v38 + v32;
      char v35 = 1;
      uint64_t v36 = v37;
    }

    while (v37);
LABEL_47:
    if ((v35 & 1) == 0)
    {
LABEL_60:
      if (qlog_debug_enabled
        || (qlog_nwlog_enabled & 1) != 0
        || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
      {
        uint64_t v42 = _os_log_pack_size();
        unsigned int v43 = (char *)v68 - ((MEMORY[0x1895F8858](v42, v42) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v44 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v44 = 136446210;
        *(void *)(v44 + 4) = "_quic_packet_builder_calculate_size";
        qlog_internal(16, (uint64_t)v43, 409LL);
        uint64_t v30 = *v29;
        if (!*v29) {
          goto LABEL_76;
        }
        unsigned __int8 v45 = qlog_nwlog_enabled;
      }

      else
      {
        unsigned __int8 v45 = 0;
      }

      int v46 = qlog_datapath_enabled;
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      *(void *)&__int128 v41 = 136446722LL;
      do
      {
        uint64_t v47 = v30;
        uint64_t v30 = *(void *)(v30 + 96);
        if (v46 || v45)
        {
          __int128 v69 = v41;
          if (qlog_debug_enabled | v45 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v48 = _os_log_pack_size();
            v68[1] = (uint64_t)v68;
            v68[0] = (uint64_t)v68 - ((MEMORY[0x1895F8858](v48, v48) + 15) & 0xFFFFFFFFFFFFFFF0LL);
            uint64_t v49 = _os_log_pack_fill();
            uint64_t v50 = quic_frame_type_describe(*(void *)v47);
            int v51 = *(unsigned __int16 *)(v47 + 8);
            *(_DWORD *)uint64_t v49 = v69;
            *(void *)(v49 + 4) = "_quic_packet_builder_calculate_size";
            *(_WORD *)(v49 + 12) = 2080;
            *(void *)(v49 + 14) = v50;
            *(_WORD *)(v49 + 22) = 1024;
            *(_DWORD *)(v49 + 24) = v51;
            qlog_internal(2, v68[0], 414LL);
            __int128 v41 = v69;
            int v46 = qlog_datapath_enabled;
            unsigned __int8 v45 = qlog_nwlog_enabled;
          }

          else
          {
            unsigned __int8 v45 = 0;
            __int128 v41 = v69;
          }
        }

        else
        {
          unsigned __int8 v45 = 0;
          int v46 = 0;
        }
      }

      while (v30);
LABEL_76:
      char v33 = 0;
      uint64_t v34 = v70;
      if (!v17) {
        goto LABEL_77;
      }
      goto LABEL_80;
    }
  }

  char v33 = 1;
  uint64_t v34 = v70;
  if (!v17)
  {
LABEL_77:
    if ((_WORD)v32 && (unsigned __int16)v32 <= 2u)
    {
      quic_frame_alloc_PADDING(a1, (__int16)(3 - v32), v16, 0, 0LL);
      LOWORD(v32) = 3;
    }
  }

uint64_t quic_packet_builder_remaining_length( uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5, int a6)
{
  v26[1] = *MEMORY[0x1895F89C0];
  if (a3 >= 4) {
    unsigned __int8 v11 = 0;
  }
  else {
    unsigned __int8 v11 = 0x4020100u >> (8 * a3);
  }
  tag_unint64_t size = quic_protector_get_tag_size(a2, v11 & 7);
  unsigned __int16 v13 = a6 - tag_size;
  if (((a6 - tag_size) & 0xFFFF0000) != 0)
  {
    unsigned int v14 = tag_size;
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      uint64_t v15 = _os_log_pack_size();
      unsigned __int8 v16 = (char *)v26 - ((MEMORY[0x1895F8858](v15, v15) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v17 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v17 = 136447234;
      *(void *)(v17 + 4) = "quic_packet_builder_remaining_length";
      *(_WORD *)(v17 + 12) = 2082;
      *(void *)(v17 + 14) = "mss";
      *(_WORD *)(v17 + 22) = 2048;
      *(void *)(v17 + 24) = v13 + (unint64_t)v14;
      *(_WORD *)(v17 + 32) = 2048;
      *(void *)(v17 + 34) = v14;
      *(_WORD *)(v17 + 42) = 2048;
      *(void *)(v17 + 44) = v13;
      qlog_internal(17, (uint64_t)v16, 480LL);
    }

    unsigned __int16 v13 = 0;
  }

  unsigned int v18 = _quic_packet_builder_calculate_size(a1, a2, v11, a4, a5, 0LL, v13, 0, 0LL);
  unsigned int v19 = v13 - 3;
  if (v19 >= 0x10000)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      uint64_t v20 = _os_log_pack_size();
      unsigned int v21 = (char *)v26 - ((MEMORY[0x1895F8858](v20, v20) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v22 = _os_log_pack_fill();
      uint64_t v23 = (unsigned __int16)(v13 - 3);
      *(_DWORD *)uint64_t v22 = 136447234;
      *(void *)(v22 + 4) = "quic_packet_builder_remaining_length";
      *(_WORD *)(v22 + 12) = 2082;
      *(void *)(v22 + 14) = "mss";
      *(_WORD *)(v22 + 22) = 2048;
      *(void *)(v22 + 24) = v23 + 3;
      *(_WORD *)(v22 + 32) = 2048;
      *(void *)(v22 + 34) = 3LL;
      *(_WORD *)(v22 + 42) = 2048;
      *(void *)(v22 + 44) = v23;
      qlog_internal(17, (uint64_t)v21, 486LL);
    }

    unsigned int v19 = 0;
  }

  unsigned __int16 v24 = v19 - v18;
  if (v19 < v18) {
    return 0;
  }
  return v24;
}

uint64_t quic_packet_builder_rough_size(uint64_t a1, unsigned int a2)
{
  v7[1] = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      uint64_t v4 = _os_log_pack_size();
      uint64_t v5 = (char *)v7 - ((MEMORY[0x1895F8858](v4, v4) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v6 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v6 = 136446210;
      *(void *)(v6 + 4) = "quic_packet_builder_rough_size";
      qlog_internal(17, (uint64_t)v5, 545LL);
    }

    return 0LL;
  }

  uint64_t v2 = *(void *)(a1 + 16LL * a2 + 16);
  if (!v2) {
    return 0LL;
  }
  LODWORD(result) = 0;
  do
  {
    uint64_t result = result + *(unsigned __int16 *)(v2 + 8);
    uint64_t v2 = *(void *)(v2 + 96);
  }

  while (v2);
  return result;
}

void quic_packet_builder_assemble_version_negotiation( uint64_t a1, char *__buf, unsigned int a3, unsigned __int8 *a4, unsigned __int8 *a5, unsigned int *a6)
{
  uint64_t v55 = *MEMORY[0x1895F89C0];
  __int16 v51 = a3;
  if (a1)
  {
    if (__buf)
    {
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            if (a6)
            {
              unsigned __int8 v53 = *a5;
              unsigned __int8 __src = *a4;
              if (__src + v53 + 15 <= a3)
              {
                arc4random_buf(__buf, 1uLL);
                *__buf |= 0xC0u;
                *(_DWORD *)(__buf + 1) = 0;
                unsigned __int8 v16 = quic_safe_append(__buf + 5, &v51, &__src, 1uLL);
                if (__src)
                {
                  quic_cid_write(a4, v16, __src);
                  uint64_t v17 = __src;
                }

                else
                {
                  uint64_t v17 = 0LL;
                }

                unsigned int v18 = quic_safe_append(&v16[v17], &v51, &v53, 1uLL);
                if (v53)
                {
                  quic_cid_write(a5, v18, v53);
                  uint64_t v19 = v53;
                }

                else
                {
                  uint64_t v19 = 0LL;
                }

                uint64_t v20 = &v18[v19];
                if (qlog_datapath_enabled || qlog_nwlog_enabled)
                {
                  uint64_t v42 = quic_cid_describe(a4);
                  unsigned int v43 = quic_cid_describe(a5);
                  snprintf(__str, 0x80uLL, ">> VN<dcid %s, scid %s", v42, v43);
                }

                unsigned int v21 = *a6;
                unsigned int v50 = bswap32(*a6);
                if (qlog_datapath_enabled || qlog_nwlog_enabled)
                {
                  if (v21 == 1)
                  {
                    uint64_t v44 = "v1";
                  }

                  else
                  {
                    uint64_t v44 = quic_version_describe_buffer;
                    snprintf(quic_version_describe_buffer, 0x10uLL, "v %x", v21);
                  }

                  snprintf(__str, 0x80uLL, "%s, %s", __str, v44);
                }

                uint64_t v22 = quic_safe_append(v20, &v51, &v50, 4uLL);
                unsigned int v23 = a6[1];
                unsigned int v50 = bswap32(v23);
                if (qlog_datapath_enabled || qlog_nwlog_enabled)
                {
                  if (v23 == 1)
                  {
                    unsigned __int8 v45 = "v1";
                  }

                  else
                  {
                    unsigned __int8 v45 = quic_version_describe_buffer;
                    snprintf(quic_version_describe_buffer, 0x10uLL, "v %x", v23);
                  }

                  snprintf(__str, 0x80uLL, "%s, %s", __str, v45);
                }

                quic_safe_append(v22, &v51, &v50, 4uLL);
                if (qlog_datapath_enabled || qlog_nwlog_enabled)
                {
                  snprintf(__str, 0x80uLL, "%s>", __str);
                  char v46 = qlog_nwlog_enabled;
                  if (qlog_datapath_enabled || qlog_nwlog_enabled)
                  {
                    if (qlog_debug_enabled) {
                      char v46 = 1;
                    }
                    if ((v46 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
                    {
                      uint64_t v47 = _os_log_pack_size();
                      uint64_t v48 = (char *)&v50 - ((MEMORY[0x1895F8858](v47, v47) + 15) & 0xFFFFFFFFFFFFFFF0LL);
                      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
                      uint64_t v49 = _os_log_pack_fill();
                      *(_DWORD *)uint64_t v49 = 136446466;
                      *(void *)(v49 + 4) = "quic_packet_builder_assemble_version_negotiation";
                      *(_WORD *)(v49 + 12) = 2082;
                      *(void *)(v49 + 14) = __str;
                      int v13 = 2;
                      uint64_t v14 = (uint64_t)v48;
                      uint64_t v15 = 629LL;
                      goto LABEL_12;
                    }
                  }
                }
              }

              else if (qlog_debug_enabled {
                     || (qlog_nwlog_enabled & 1) != 0
              }
                     || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
              {
                uint64_t v10 = _os_log_pack_size();
                unsigned __int8 v11 = (char *)&v50 - ((MEMORY[0x1895F8858](v10, v10) + 15) & 0xFFFFFFFFFFFFFFF0LL);
                _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
                uint64_t v12 = _os_log_pack_fill();
                *(_DWORD *)uint64_t v12 = 136446210;
                *(void *)(v12 + 4) = "quic_packet_builder_assemble_version_negotiation";
                int v13 = 17;
                uint64_t v14 = (uint64_t)v11;
                uint64_t v15 = 594LL;
LABEL_12:
                qlog_internal(v13, v14, v15);
              }
            }

            else if (qlog_debug_enabled {
                   || (qlog_nwlog_enabled & 1) != 0
            }
                   || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
            {
              uint64_t v39 = _os_log_pack_size();
              int v40 = (char *)&v50 - ((MEMORY[0x1895F8858](v39, v39) + 15) & 0xFFFFFFFFFFFFFFF0LL);
              _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
              uint64_t v41 = _os_log_pack_fill();
              *(_DWORD *)uint64_t v41 = 136446210;
              *(void *)(v41 + 4) = "quic_packet_builder_assemble_version_negotiation";
              int v13 = 17;
              uint64_t v14 = (uint64_t)v40;
              uint64_t v15 = 585LL;
              goto LABEL_12;
            }
          }

          else if (qlog_debug_enabled {
                 || (qlog_nwlog_enabled & 1) != 0
          }
                 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
          {
            uint64_t v36 = _os_log_pack_size();
            uint64_t v37 = (char *)&v50 - ((MEMORY[0x1895F8858](v36, v36) + 15) & 0xFFFFFFFFFFFFFFF0LL);
            _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
            uint64_t v38 = _os_log_pack_fill();
            *(_DWORD *)uint64_t v38 = 136446210;
            *(void *)(v38 + 4) = "quic_packet_builder_assemble_version_negotiation";
            int v13 = 17;
            uint64_t v14 = (uint64_t)v37;
            uint64_t v15 = 584LL;
            goto LABEL_12;
          }
        }

        else if (qlog_debug_enabled {
               || (qlog_nwlog_enabled & 1) != 0
        }
               || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
        {
          uint64_t v33 = _os_log_pack_size();
          uint64_t v34 = (char *)&v50 - ((MEMORY[0x1895F8858](v33, v33) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          uint64_t v35 = _os_log_pack_fill();
          *(_DWORD *)uint64_t v35 = 136446210;
          *(void *)(v35 + 4) = "quic_packet_builder_assemble_version_negotiation";
          int v13 = 17;
          uint64_t v14 = (uint64_t)v34;
          uint64_t v15 = 583LL;
          goto LABEL_12;
        }
      }

      else if (qlog_debug_enabled {
             || (qlog_nwlog_enabled & 1) != 0
      }
             || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
      {
        uint64_t v30 = _os_log_pack_size();
        uint64_t v31 = (char *)&v50 - ((MEMORY[0x1895F8858](v30, v30) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v32 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v32 = 136446210;
        *(void *)(v32 + 4) = "quic_packet_builder_assemble_version_negotiation";
        int v13 = 17;
        uint64_t v14 = (uint64_t)v31;
        uint64_t v15 = 582LL;
        goto LABEL_12;
      }
    }

    else if (qlog_debug_enabled {
           || (qlog_nwlog_enabled & 1) != 0
    }
           || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      uint64_t v27 = _os_log_pack_size();
      __int16 v28 = (char *)&v50 - ((MEMORY[0x1895F8858](v27, v27) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v29 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v29 = 136446210;
      *(void *)(v29 + 4) = "quic_packet_builder_assemble_version_negotiation";
      int v13 = 17;
      uint64_t v14 = (uint64_t)v28;
      uint64_t v15 = 581LL;
      goto LABEL_12;
    }
  }

  else if (qlog_debug_enabled {
         || (qlog_nwlog_enabled & 1) != 0
  }
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    uint64_t v24 = _os_log_pack_size();
    __int16 v25 = (char *)&v50 - ((MEMORY[0x1895F8858](v24, v24) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v26 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v26 = 136446210;
    *(void *)(v26 + 4) = "quic_packet_builder_assemble_version_negotiation";
    int v13 = 17;
    uint64_t v14 = (uint64_t)v25;
    uint64_t v15 = 580LL;
    goto LABEL_12;
  }

void quic_packet_builder_assemble_retry( uint64_t a1, char *a2, unsigned int a3, unsigned int a4, unsigned __int8 *a5, unsigned __int8 *a6, unsigned __int8 *a7, size_t a8, void *a9)
{
  uint64_t v70 = *MEMORY[0x1895F89C0];
  memset(__src, 0, 5);
  __int16 v63 = a3;
  __dst[0] = 0LL;
  __dst[1] = 0LL;
  int v69 = 0;
  v67[0] = 0LL;
  v67[1] = 0LL;
  uint64_t v62 = 0LL;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (a5)
        {
          if (a6)
          {
            if (a7)
            {
              if ((_DWORD)a8)
              {
                if (a9)
                {
                  unsigned __int8 v65 = *a6;
                  unsigned __int8 v64 = *a5;
                  if (a3 >= (unsigned __int16)(a8 + v65 + v64 + 23))
                  {
                    LOBYTE(__src[0]) = arc4random() | 0xF0;
                    *(int *)((char *)__src + 1) = bswap32(a4);
                    size_t v21 = quic_crypto_build_pseudo_retry(a7, __src, a5, a6, a9, a8, &v62);
                    uint64_t v22 = quic_safe_append(a2, &v63, __src, 5uLL);
                    unsigned int v23 = quic_safe_append(v22, &v63, &v64, 1uLL);
                    if (v64)
                    {
                      quic_cid_write(a5, __dst, v64);
                      unsigned int v23 = quic_safe_append(v23, &v63, __dst, v64);
                    }

                    uint64_t v24 = quic_safe_append(v23, &v63, &v65, 1uLL);
                    if (v65)
                    {
                      quic_cid_write(a6, __dst, v65);
                      uint64_t v24 = quic_safe_append(v24, &v63, __dst, v65);
                    }

                    __int16 v25 = quic_safe_append(v24, &v63, a9, a8);
                    if (!quic_protector_seal_retry((uint64_t)v62, v21, (uint64_t)v67)
                      && (qlog_debug_enabled
                       || (qlog_nwlog_enabled & 1) != 0
                       || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT)))
                    {
                      uint64_t v26 = _os_log_pack_size();
                      uint64_t v27 = (char *)&v61 - ((MEMORY[0x1895F8858](v26, v26) + 15) & 0xFFFFFFFFFFFFFFF0LL);
                      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
                      uint64_t v28 = _os_log_pack_fill();
                      *(_DWORD *)uint64_t v28 = 136446210;
                      *(void *)(v28 + 4) = "quic_packet_builder_assemble_retry";
                      qlog_internal(17, (uint64_t)v27, 704LL);
                    }

                    if (v62)
                    {
                      free(v62);
                      uint64_t v62 = 0LL;
                    }

                    quic_safe_append(v25, &v63, v67, 0x10uLL);
                    char v29 = qlog_nwlog_enabled;
                    if (qlog_datapath_enabled || qlog_nwlog_enabled)
                    {
                      if (qlog_debug_enabled) {
                        char v29 = 1;
                      }
                      if ((v29 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
                      {
                        uint64_t v54 = _os_log_pack_size();
                        uint64_t v55 = (char *)&v61 - ((MEMORY[0x1895F8858](v54, v54) + 15) & 0xFFFFFFFFFFFFFFF0LL);
                        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
                        uint64_t v56 = _os_log_pack_fill();
                        if (a4 == 1)
                        {
                          uint64_t v57 = "v1";
                        }

                        else
                        {
                          uint64_t v57 = quic_version_describe_buffer;
                          snprintf(quic_version_describe_buffer, 0x10uLL, "v %x", a4);
                        }

                        uint64_t v58 = quic_cid_describe(a5);
                        uint64_t v59 = quic_cid_describe(a6);
                        uint64_t v60 = quic_cid_describe(a7);
                        *(_DWORD *)uint64_t v56 = 136447490;
                        *(void *)(v56 + 4) = "quic_packet_builder_assemble_retry";
                        *(_WORD *)(v56 + 12) = 2082;
                        *(void *)(v56 + 14) = v57;
                        *(_WORD *)(v56 + 22) = 2082;
                        *(void *)(v56 + 24) = v58;
                        *(_WORD *)(v56 + 32) = 2082;
                        *(void *)(v56 + 34) = v59;
                        *(_WORD *)(v56 + 42) = 1024;
                        *(_DWORD *)(v56 + 44) = a8;
                        *(_WORD *)(v56 + 48) = 2082;
                        *(void *)(v56 + 50) = v60;
                        int v17 = 2;
                        uint64_t v18 = (uint64_t)v55;
                        uint64_t v19 = 713LL;
                        goto LABEL_14;
                      }
                    }
                  }

                  else if (qlog_debug_enabled {
                         || (qlog_nwlog_enabled & 1) != 0
                  }
                         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
                  {
                    uint64_t v14 = _os_log_pack_size();
                    uint64_t v15 = (char *)&v61 - ((MEMORY[0x1895F8858](v14, v14) + 15) & 0xFFFFFFFFFFFFFFF0LL);
                    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
                    uint64_t v16 = _os_log_pack_fill();
                    *(_DWORD *)uint64_t v16 = 136446210;
                    *(void *)(v16 + 4) = "quic_packet_builder_assemble_retry";
                    int v17 = 17;
                    uint64_t v18 = (uint64_t)v15;
                    uint64_t v19 = 675LL;
LABEL_14:
                    qlog_internal(v17, v18, v19);
                  }
                }

                else if (qlog_debug_enabled {
                       || (qlog_nwlog_enabled & 1) != 0
                }
                       || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
                {
                  uint64_t v51 = _os_log_pack_size();
                  int v52 = (char *)&v61 - ((MEMORY[0x1895F8858](v51, v51) + 15) & 0xFFFFFFFFFFFFFFF0LL);
                  _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
                  uint64_t v53 = _os_log_pack_fill();
                  *(_DWORD *)uint64_t v53 = 136446210;
                  *(void *)(v53 + 4) = "quic_packet_builder_assemble_retry";
                  int v17 = 17;
                  uint64_t v18 = (uint64_t)v52;
                  uint64_t v19 = 669LL;
                  goto LABEL_14;
                }
              }

              else if (qlog_debug_enabled {
                     || (qlog_nwlog_enabled & 1) != 0
              }
                     || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
              {
                uint64_t v48 = _os_log_pack_size();
                uint64_t v49 = (char *)&v61 - ((MEMORY[0x1895F8858](v48, v48) + 15) & 0xFFFFFFFFFFFFFFF0LL);
                _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
                uint64_t v50 = _os_log_pack_fill();
                *(_DWORD *)uint64_t v50 = 136446210;
                *(void *)(v50 + 4) = "quic_packet_builder_assemble_retry";
                int v17 = 17;
                uint64_t v18 = (uint64_t)v49;
                uint64_t v19 = 668LL;
                goto LABEL_14;
              }
            }

            else if (qlog_debug_enabled {
                   || (qlog_nwlog_enabled & 1) != 0
            }
                   || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
            {
              uint64_t v45 = _os_log_pack_size();
              char v46 = (char *)&v61 - ((MEMORY[0x1895F8858](v45, v45) + 15) & 0xFFFFFFFFFFFFFFF0LL);
              _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
              uint64_t v47 = _os_log_pack_fill();
              *(_DWORD *)uint64_t v47 = 136446210;
              *(void *)(v47 + 4) = "quic_packet_builder_assemble_retry";
              int v17 = 17;
              uint64_t v18 = (uint64_t)v46;
              uint64_t v19 = 667LL;
              goto LABEL_14;
            }
          }

          else if (qlog_debug_enabled {
                 || (qlog_nwlog_enabled & 1) != 0
          }
                 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
          {
            uint64_t v42 = _os_log_pack_size();
            unsigned int v43 = (char *)&v61 - ((MEMORY[0x1895F8858](v42, v42) + 15) & 0xFFFFFFFFFFFFFFF0LL);
            _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
            uint64_t v44 = _os_log_pack_fill();
            *(_DWORD *)uint64_t v44 = 136446210;
            *(void *)(v44 + 4) = "quic_packet_builder_assemble_retry";
            int v17 = 17;
            uint64_t v18 = (uint64_t)v43;
            uint64_t v19 = 666LL;
            goto LABEL_14;
          }
        }

        else if (qlog_debug_enabled {
               || (qlog_nwlog_enabled & 1) != 0
        }
               || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
        {
          uint64_t v39 = _os_log_pack_size();
          int v40 = (char *)&v61 - ((MEMORY[0x1895F8858](v39, v39) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          uint64_t v41 = _os_log_pack_fill();
          *(_DWORD *)uint64_t v41 = 136446210;
          *(void *)(v41 + 4) = "quic_packet_builder_assemble_retry";
          int v17 = 17;
          uint64_t v18 = (uint64_t)v40;
          uint64_t v19 = 665LL;
          goto LABEL_14;
        }
      }

      else if (qlog_debug_enabled {
             || (qlog_nwlog_enabled & 1) != 0
      }
             || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
      {
        uint64_t v36 = _os_log_pack_size();
        uint64_t v37 = (char *)&v61 - ((MEMORY[0x1895F8858](v36, v36) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v38 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v38 = 136446210;
        *(void *)(v38 + 4) = "quic_packet_builder_assemble_retry";
        int v17 = 17;
        uint64_t v18 = (uint64_t)v37;
        uint64_t v19 = 664LL;
        goto LABEL_14;
      }
    }

    else if (qlog_debug_enabled {
           || (qlog_nwlog_enabled & 1) != 0
    }
           || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      uint64_t v33 = _os_log_pack_size();
      uint64_t v34 = (char *)&v61 - ((MEMORY[0x1895F8858](v33, v33) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v35 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v35 = 136446210;
      *(void *)(v35 + 4) = "quic_packet_builder_assemble_retry";
      int v17 = 17;
      uint64_t v18 = (uint64_t)v34;
      uint64_t v19 = 663LL;
      goto LABEL_14;
    }
  }

  else if (qlog_debug_enabled {
         || (qlog_nwlog_enabled & 1) != 0
  }
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    uint64_t v30 = _os_log_pack_size();
    uint64_t v31 = (char *)&v61 - ((MEMORY[0x1895F8858](v30, v30) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v32 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v32 = 136446210;
    *(void *)(v32 + 4) = "quic_packet_builder_assemble_retry";
    int v17 = 17;
    uint64_t v18 = (uint64_t)v31;
    uint64_t v19 = 662LL;
    goto LABEL_14;
  }

BOOL _quic_packet_builder_assemble( uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t *a6, char *a7, unsigned int a8, unsigned __int8 a9, uint64_t a10)
{
  uint64_t v196 = *MEMORY[0x1895F89C0];
  uint64_t v194 = a7;
  uint64_t v185 = a2;
  if (!a2)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || (BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT)))
    {
      uint64_t v107 = _os_log_pack_size();
      uint64_t v108 = (char *)&v174 - ((MEMORY[0x1895F8858](v107, v107) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v109 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v109 = 136446210;
      *(void *)(v109 + 4) = "_quic_packet_builder_assemble";
      int v38 = 17;
      uint64_t v39 = (uint64_t)v108;
      uint64_t v40 = 728LL;
      goto LABEL_171;
    }

    return result;
  }

  if (!a1)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || (BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT)))
    {
      uint64_t v110 = _os_log_pack_size();
      int v111 = (char *)&v174 - ((MEMORY[0x1895F8858](v110, v110) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v112 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v112 = 136446210;
      *(void *)(v112 + 4) = "_quic_packet_builder_assemble";
      int v38 = 17;
      uint64_t v39 = (uint64_t)v111;
      uint64_t v40 = 729LL;
      goto LABEL_171;
    }

    return result;
  }

  unsigned __int8 v11 = a7;
  if (!a7)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || (BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT)))
    {
      uint64_t v113 = _os_log_pack_size();
      unsigned int v114 = (char *)&v174 - ((MEMORY[0x1895F8858](v113, v113) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v115 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v115 = 136446210;
      *(void *)(v115 + 4) = "_quic_packet_builder_assemble";
      int v38 = 17;
      uint64_t v39 = (uint64_t)v114;
      uint64_t v40 = 730LL;
      goto LABEL_171;
    }

    return result;
  }

  if (!a8)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || (BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT)))
    {
      uint64_t v116 = _os_log_pack_size();
      uint64_t v117 = (char *)&v174 - ((MEMORY[0x1895F8858](v116, v116) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v118 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v118 = 136446210;
      *(void *)(v118 + 4) = "_quic_packet_builder_assemble";
      int v38 = 17;
      uint64_t v39 = (uint64_t)v117;
      uint64_t v40 = 731LL;
      goto LABEL_171;
    }

    return result;
  }

  unsigned int v180 = a9;
  if (!a9)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || (BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT)))
    {
      uint64_t v119 = _os_log_pack_size();
      uint64_t v120 = (char *)&v174 - ((MEMORY[0x1895F8858](v119, v119) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v121 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v121 = 136446210;
      *(void *)(v121 + 4) = "_quic_packet_builder_assemble";
      int v38 = 17;
      uint64_t v39 = (uint64_t)v120;
      uint64_t v40 = 732LL;
      goto LABEL_171;
    }

    return result;
  }

  unint64_t v12 = a4;
  if (!a4)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || (BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT)))
    {
      uint64_t v122 = _os_log_pack_size();
      int v123 = (char *)&v174 - ((MEMORY[0x1895F8858](v122, v122) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v124 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v124 = 136446210;
      *(void *)(v124 + 4) = "_quic_packet_builder_assemble";
      int v38 = 17;
      uint64_t v39 = (uint64_t)v123;
      uint64_t v40 = 734LL;
      goto LABEL_171;
    }

    return result;
  }

  uint64_t v13 = a3;
  unsigned __int16 v193 = a8;
  int v181 = a3 - 6;
  else {
    unint64_t v14 = (0x30303020100uLL >> (8 * a3));
  }
  if (!*(_DWORD *)(a1 + 80))
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || (BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT)))
    {
      uint64_t v125 = _os_log_pack_size();
      uint64_t v126 = (char *)&v174 - ((MEMORY[0x1895F8858](v125, v125) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v127 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v127 = 136446210;
      *(void *)(v127 + 4) = "_quic_packet_builder_assemble";
      int v38 = 17;
      uint64_t v39 = (uint64_t)v126;
      uint64_t v40 = 747LL;
      goto LABEL_171;
    }

    return result;
  }

  uint64_t v15 = (uint64_t *)(a1 + 16LL * v14 + 16);
  if (a6) {
    uint64_t v15 = a6;
  }
  v183 = v15;
  if (!*v15)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || (BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR)))
    {
      uint64_t v128 = _os_log_pack_size();
      uint64_t v129 = (char *)&v174 - ((MEMORY[0x1895F8858](v128, v128) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v130 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v130 = 136446210;
      *(void *)(v130 + 4) = "_quic_packet_builder_assemble";
      int v38 = 16;
      uint64_t v39 = (uint64_t)v129;
      uint64_t v40 = 758LL;
      goto LABEL_171;
    }

    return result;
  }

  unsigned int v182 = a8;
  else {
    uint64_t v17 = -1LL;
  }
  unsigned int v18 = v181;
  *(void *)(a10 + 224) = v17;
  uint64_t pn = quic_protector_get_pn(*(void *)(v185 + 568), v14, v17);
  *(void *)(a10 + 112) = pn;
  *(_BYTE *)(a10 + 83) = v14;
  *(_BYTE *)(a10 + 82) = v13;
  unint64_t v184 = v14;
  if (v18 > 0xFD)
  {
    *(_DWORD *)(a10 + 232) &= ~1u;
    if ((_DWORD)v13 == 4) {
      char v21 = 64;
    }
    else {
      char v21 = 68;
    }
    char v22 = *(_BYTE *)(v12 + 431) & 0x20;
    if (a5 == -1) {
      goto LABEL_217;
    }
    goto LABEL_26;
  }

  unsigned int v192 = 0;
  *(_DWORD *)(a10 + 232) |= 1u;
  unsigned __int8 __src = -64;
  if ((_DWORD)v13 != 1)
  {
    if ((_DWORD)v13 == 3)
    {
      char v20 = -48;
    }

    else
    {
      if ((_DWORD)v13 != 2)
      {
        if (qlog_debug_enabled
          || (qlog_nwlog_enabled & 1) != 0
          || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
        {
          uint64_t v35 = _os_log_pack_size();
          uint64_t v36 = (char *)&v174 - ((MEMORY[0x1895F8858](v35, v35) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          uint64_t v37 = _os_log_pack_fill();
          *(_DWORD *)uint64_t v37 = 136446466;
          *(void *)(v37 + 4) = "_quic_packet_builder_assemble";
          *(_WORD *)(v37 + 12) = 1024;
          *(_DWORD *)(v37 + 14) = v13;
          int v38 = 17;
          uint64_t v39 = (uint64_t)v36;
          uint64_t v40 = 802LL;
          goto LABEL_171;
        }

        return 0LL;
      }

      char v20 = -32;
    }

    unsigned __int8 __src = v20;
  }

  unsigned int v192 = *(_DWORD *)(a1 + 80);
  if (v182 <= 5)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
    {
      return 0LL;
    }

    uint64_t v149 = _os_log_pack_size();
    uint64_t v150 = (char *)&v174 - ((MEMORY[0x1895F8858](v149, v149) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v151 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v151 = 136446210;
    *(void *)(v151 + 4) = "_quic_packet_builder_assemble";
    int v38 = 16;
    uint64_t v39 = (uint64_t)v150;
    uint64_t v40 = 807LL;
LABEL_171:
    qlog_internal(v38, v39, v40);
    return 0LL;
  }

  *(void *)a10 = v11;
  uint64_t v194 = quic_safe_append(v11, &v193, &__src, 5uLL);
  uint64_t v27 = (unsigned __int8 *)(v12 + 17);
  unsigned __int8 v189 = *(_BYTE *)(v12 + 17);
  uint64_t v28 = quic_safe_append(v194, &v193, &v189, 1uLL);
  uint64_t v194 = v28;
  if (!v189) {
    goto LABEL_36;
  }
  quic_cid_write((unsigned __int8 *)(v12 + 17), __dst, 0x14uLL);
  if (v193 <= v189)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
    {
      return 0LL;
    }

    uint64_t v162 = _os_log_pack_size();
    uint64_t v163 = (char *)&v174 - ((MEMORY[0x1895F8858](v162, v162) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v164 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v164 = 136446210;
    *(void *)(v164 + 4) = "_quic_packet_builder_assemble";
    int v38 = 16;
    uint64_t v39 = (uint64_t)v163;
    uint64_t v40 = 818LL;
    goto LABEL_171;
  }

  uint64_t v28 = quic_safe_append(v194, &v193, __dst, v189);
  uint64_t v194 = v28;
LABEL_36:
  unsigned __int8 v29 = *(_BYTE *)(v12 + 38);
  v12 += 38LL;
  unsigned __int8 v190 = v29;
  uint64_t v30 = quic_safe_append(v28, &v193, &v190, 1uLL);
  uint64_t v194 = v30;
  if (!v190) {
    goto LABEL_39;
  }
  quic_cid_write((unsigned __int8 *)v12, __dst, 0x14uLL);
  if (v193 <= v190)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
    {
      return 0LL;
    }

    uint64_t v165 = _os_log_pack_size();
    uint64_t v166 = (char *)&v174 - ((MEMORY[0x1895F8858](v165, v165) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v167 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v167 = 136446210;
    *(void *)(v167 + 4) = "_quic_packet_builder_assemble";
    int v38 = 16;
    uint64_t v39 = (uint64_t)v166;
    uint64_t v40 = 829LL;
    goto LABEL_171;
  }

  uint64_t v30 = quic_safe_append(v194, &v193, __dst, v190);
  uint64_t v194 = v30;
LABEL_39:
  if ((__src & 0x30) != 0)
  {
    v177 = v30;
    char v31 = 0;
  }

  else
  {
    uint64_t v32 = v13;
    unint64_t v33 = *(unsigned __int16 *)(a1 + 84);
    if (*(_WORD *)(a1 + 84))
    {
      size_t v34 = byte_187C047FC[(73 - __clz(v33)) >> 3];
      if ((_DWORD)v34 != 1)
      {
        if ((_DWORD)v34 == 4)
        {
          unint64_t v33 = bswap32(v33 | 0x80000000);
        }

        else if ((_DWORD)v34 == 2)
        {
          unint64_t v33 = __rev16(v33 | 0x4000);
        }

        else
        {
          unint64_t v33 = bswap64(v33 | 0xC000000000000000LL);
        }
      }
    }

    else
    {
      size_t v34 = 1LL;
    }

    unint64_t v188 = v33;
    uint64_t v49 = quic_safe_append(v30, &v193, &v188, v34);
    uint64_t v194 = v49;
    if (*(_WORD *)(a1 + 84))
    {
      v177 = quic_safe_append(v49, &v193, *(void **)(a1 + 88), *(unsigned __int16 *)(a1 + 84));
      uint64_t v194 = v177;
      char v50 = *(_BYTE *)(a1 + 84);
    }

    else
    {
      v177 = v49;
      char v50 = 0;
    }

    char v31 = v34 + v50;
    uint64_t v13 = v32;
  }

  if (v193 <= 2u)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
    {
      return 0LL;
    }

    uint64_t v152 = _os_log_pack_size();
    uint64_t v153 = (char *)&v174 - ((MEMORY[0x1895F8858](v152, v152) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v154 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v154 = 136446210;
    *(void *)(v154 + 4) = "_quic_packet_builder_assemble";
    int v38 = 16;
    uint64_t v39 = (uint64_t)v153;
    uint64_t v40 = 849LL;
    goto LABEL_171;
  }

  int v176 = v180 + v193 - 2;
  __int16 v187 = bswap32(v176 | 0x4000) >> 16;
  uint64_t v51 = quic_safe_append(v177, &v193, &v187, 2uLL);
  uint64_t v194 = v51;
  uint64_t v52 = *(void *)(a10 + 112);
  unsigned int v53 = (39 - __clz(v52)) >> 3;
  if (!(_DWORD)v52) {
    LOBYTE(v53) = 1;
  }
  *(_BYTE *)(a10 + 85) = v53;
  *(void *)(a10 + 24) = v51;
  unsigned int v186 = v52;
  switch(v53)
  {
    case 4u:
      unsigned int v54 = bswap32(v52);
      goto LABEL_85;
    case 3u:
      unsigned int v186 = v52 & 0xFF00 | (v52 << 16) | BYTE2(v52);
      break;
    case 2u:
      unsigned int v54 = bswap32(v52) >> 16;
LABEL_85:
      unsigned int v186 = v54;
      break;
  }

  uint64_t v55 = quic_safe_append(v51, &v193, &v186, v53);
  uint64_t v194 = v55;
  char v56 = *(_BYTE *)(a10 + 85);
  unsigned __int8 v57 = __src & 0xFC | (v56 - 1) & 3;
  unsigned __int8 __src = v57;
  *(_BYTE *)(a10 + 84) = v31 + v189 + v190 + v56 + 9;
  *(void *)(a10 + 8) = v55;
  char v58 = qlog_nwlog_enabled;
  if (qlog_datapath_enabled || qlog_nwlog_enabled)
  {
    if (qlog_debug_enabled) {
      char v58 = 1;
    }
    if ((v58 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v155 = _os_log_pack_size();
      uint64_t v179 = (char *)&v174;
      uint64_t v156 = MEMORY[0x1895F8858](v155, v155);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v178 = (uint64_t)&v174 - ((v156 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v157 = _os_log_pack_fill();
      uint64_t v175 = off_18A118568[((unint64_t)__src >> 4) & 3];
      if (v192 == 0x1000000)
      {
        unint64_t v14 = (unint64_t)"v1";
      }

      else
      {
        unint64_t v14 = (unint64_t)quic_version_describe_buffer;
        snprintf(quic_version_describe_buffer, 0x10uLL, "v %x", bswap32(v192));
      }

      v168 = quic_cid_describe(v27);
      uint64_t v169 = quic_cid_describe((unsigned __int8 *)v12);
      uint64_t v170 = *(void *)(a10 + 112);
      *(_DWORD *)uint64_t v157 = 136447490;
      *(void *)(v157 + 4) = "_quic_packet_builder_assemble";
      *(_WORD *)(v157 + 12) = 2082;
      *(void *)(v157 + 14) = v175;
      *(_WORD *)(v157 + 22) = 2082;
      *(void *)(v157 + 24) = v14;
      *(_WORD *)(v157 + 32) = 2082;
      *(void *)(v157 + 34) = v168;
      *(_WORD *)(v157 + 42) = 2082;
      *(void *)(v157 + 44) = v169;
      *(_WORD *)(v157 + 52) = 2048;
      *(void *)(v157 + 54) = v170;
      qlog_internal(2, v178, 885LL);
      unsigned __int8 v57 = __src;
      LOBYTE(v14) = v184;
    }
  }

  if ((v57 & 0x30) == 0)
  {
    if (*(_WORD *)(a1 + 84))
    {
      char v59 = qlog_nwlog_enabled;
      if (qlog_datapath_enabled || qlog_nwlog_enabled)
      {
        if (qlog_debug_enabled) {
          char v59 = 1;
        }
        if ((v59 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v171 = _os_log_pack_size();
          unint64_t v12 = (unint64_t)&v174 - ((MEMORY[0x1895F8858](v171, v171) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          uint64_t v172 = _os_log_pack_fill();
          int v173 = *(unsigned __int16 *)(a1 + 84);
          *(_DWORD *)uint64_t v172 = 136446466;
          *(void *)(v172 + 4) = "_quic_packet_builder_assemble";
          *(_WORD *)(v172 + 12) = 1024;
          *(_DWORD *)(v172 + 14) = v173;
          qlog_internal(2, v12, 888LL);
        }
      }
    }
  }

  uint64_t v178 = v13;
  unsigned int v25 = v182;
  while (2)
  {
    unint64_t v60 = 0LL;
    uint64_t v13 = 0LL;
    uint64_t v61 = 0LL;
    uint64_t v179 = &v11[v25];
    uint64_t v62 = *v183;
    while (1)
    {
      if (!v62) {
        goto LABEL_152;
      }
      unint64_t v12 = v62 + 96;
      uint64_t v63 = *(void *)(v62 + 96);
      unsigned int v64 = *(unsigned __int16 *)(v62 + 8);
      if (*(void *)v62) {
        BOOL v65 = 0;
      }
      else {
        BOOL v65 = v64 == 0;
      }
      int v66 = !v65;
      uint64_t v67 = 3LL;
      if (!v65) {
        uint64_t v67 = *(unsigned __int16 *)(v62 + 8);
      }
      v60 += v67;
      if (v60 <= 2 && v63 == 0)
      {
        if (qlog_debug_enabled
          || (qlog_nwlog_enabled & 1) != 0
          || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
        {
          uint64_t v104 = _os_log_pack_size();
          uint64_t v105 = (char *)&v174 - ((MEMORY[0x1895F8858](v104, v104) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          uint64_t v106 = _os_log_pack_fill();
          *(_DWORD *)uint64_t v106 = 136446210;
          *(void *)(v106 + 4) = "_quic_packet_builder_assemble";
          int v84 = 17;
          uint64_t v85 = (uint64_t)v105;
          uint64_t v86 = 963LL;
          goto LABEL_151;
        }

        goto LABEL_152;
      }

      int v69 = v64 > v193 ? v66 : 0;
      if (v69 == 1) {
        break;
      }
      if ((quic_frame_write(v62, v185, v14, (uint64_t)&v194, (uint64_t)&v193) & 1) == 0)
      {
        if (qlog_debug_enabled
          || (qlog_nwlog_enabled & 1) != 0
          || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
        {
          uint64_t v87 = _os_log_pack_size();
          uint64_t v88 = (char *)&v174 - ((MEMORY[0x1895F8858](v87, v87) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          uint64_t v89 = _os_log_pack_fill();
          *(_DWORD *)uint64_t v89 = 136446210;
          *(void *)(v89 + 4) = "_quic_packet_builder_assemble";
          int v84 = 16;
          uint64_t v85 = (uint64_t)v88;
          uint64_t v86 = 975LL;
          goto LABEL_151;
        }

        goto LABEL_152;
      }

      uint64_t v70 = *(void *)(v62 + 96);
      uint64_t v71 = *(void **)(v62 + 104);
      if (v70)
      {
        *(void *)(v70 + 104) = v71;
        uint64_t v71 = *(void **)(v62 + 104);
      }

      else
      {
        v183[1] = (uint64_t)v71;
      }

      *uint64_t v71 = v70;
      unsigned __int8 v72 = *(_BYTE *)(v62 + 120);
      unint64_t v73 = *(void *)v62;
      BOOL v75 = *(void *)v62 == 3LL || (*(void *)v62 & 0xFFFFFFFFFFFFFFFELL) == 12237312;
      char v76 = v73 == 2 || v75;
      *(void *)(v62 + 96) = 0LL;
      *(void *)(v62 + 104) = 0LL;
      uint64_t v77 = *(uint64_t **)(a10 + 160);
      *(void *)(v62 + 104) = v77;
      uint64_t *v77 = v62;
      *(void *)(a10 + 160) = v12;
      if (v73 <= 0xBAB9FF) {
        unint64_t v12 = v73;
      }
      else {
        unint64_t v12 = v73 - 12237272;
      }
      if ((v76 & 1) == 0)
      {
        int v78 = *(_DWORD *)(a10 + 232);
        if ((*(void *)v62 & 0xFFFFFFFFFFFFFFFELL) == 0x1C) {
          goto LABEL_137;
        }
        *(_DWORD *)(a10 + 232) = v78 | 4;
      }

      if (*(void *)v62 != 8LL)
      {
        int v78 = *(_DWORD *)(a10 + 232);
LABEL_137:
        *(_DWORD *)(a10 + 232) = v78 & 0xFFFFFFF7;
      }

      if ((v76 & 1) == 0) {
        *(_DWORD *)(a10 + 232) &= ~0x2000u;
      }
      uint64_t v13 = (v72 | v13) & 1;
      ++v61;
      uint64_t v62 = v63;
      LOBYTE(v14) = v184;
      if (!v193) {
        goto LABEL_152;
      }
    }

    char v79 = qlog_nwlog_enabled;
    if (qlog_datapath_enabled || qlog_nwlog_enabled)
    {
      if (qlog_debug_enabled) {
        char v79 = 1;
      }
      if ((v79 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v80 = _os_log_pack_size();
        unint64_t v12 = (unint64_t)&v174 - ((MEMORY[0x1895F8858](v80, v80) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v81 = _os_log_pack_fill();
        uint64_t v82 = quic_frame_type_describe(*(void *)v62);
        int v83 = *(unsigned __int16 *)(v62 + 8);
        *(_DWORD *)uint64_t v81 = 136446722;
        *(void *)(v81 + 4) = "_quic_packet_builder_assemble";
        *(_WORD *)(v81 + 12) = 2082;
        *(void *)(v81 + 14) = v82;
        *(_WORD *)(v81 + 22) = 1024;
        *(_DWORD *)(v81 + 24) = v83;
        int v84 = 2;
        uint64_t v85 = v12;
        uint64_t v86 = 970LL;
LABEL_151:
        qlog_internal(v84, v85, v86);
      }
    }

LABEL_152:
    __int16 v90 = v182;
    if ((v13 & 1) != 0)
    {
      uint64_t v91 = *(void *)(v185 + 1312);
      if (v91) {
        ++*(void *)(v91 + 152);
      }
      uint64_t v92 = v185;
      ++*(_DWORD *)(v185 + 1184);
      *(_DWORD *)(v92 + 1188) += *(unsigned __int16 *)(a10 + 90);
    }

    if (!v61)
    {
      if (qlog_debug_enabled
        || (qlog_nwlog_enabled & 1) != 0
        || (BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR)))
      {
        uint64_t v101 = _os_log_pack_size();
        uint64_t v102 = (char *)&v174 - ((MEMORY[0x1895F8858](v101, v101) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v103 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v103 = 136446210;
        *(void *)(v103 + 4) = "_quic_packet_builder_assemble";
        int v38 = 16;
        uint64_t v39 = (uint64_t)v102;
        uint64_t v40 = 994LL;
        goto LABEL_171;
      }

      return result;
    }

    unsigned __int8 v11 = (char *)v180;
    int v93 = v178;
    if (v181 <= 0xFDu)
    {
      if (v193)
      {
        v176 -= v193;
        *(_WORD *)v177 = bswap32(v176 | 0x4000) >> 16;
      }

      char v94 = qlog_nwlog_enabled;
      if (qlog_datapath_enabled || qlog_nwlog_enabled)
      {
        if (qlog_debug_enabled) {
          char v94 = 1;
        }
        if ((v94 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v158 = _os_log_pack_size();
          uint64_t v159 = (char *)&v174 - ((MEMORY[0x1895F8858](v158, v158) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          uint64_t v160 = _os_log_pack_fill();
          int v161 = (unsigned __int16)v176;
          *(_DWORD *)uint64_t v160 = 136446466;
          *(void *)(v160 + 4) = "_quic_packet_builder_assemble";
          *(_WORD *)(v160 + 12) = 1024;
          *(_DWORD *)(v160 + 14) = v161;
          qlog_internal(2, (uint64_t)v159, 1016LL);
          __int16 v90 = v182;
        }
      }
    }

    unsigned __int16 v95 = v90 - v193;
    *(_WORD *)(a10 + 90) = v90 - v193;
    int v96 = *(unsigned __int8 *)(a10 + 84);
    *(_WORD *)(a10 + 88) = v95 - v96;
    uint64_t v97 = (char *)(*(void *)(a10 + 8) + (unsigned __int16)(v95 - v96));
    uint64_t v98 = v179;
    if (v97 > v179)
    {
      qlog_abort_internal("%s payload extends past the end of the packet", "_quic_packet_builder_assemble");
      goto LABEL_211;
    }

    if ((unsigned __int16)(v95 - v96) <= 2u)
    {
LABEL_211:
      if (qlog_debug_enabled
        || (qlog_nwlog_enabled & 1) != 0
        || (BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT)))
      {
        uint64_t v131 = _os_log_pack_size();
        uint64_t v132 = (char *)&v174 - ((MEMORY[0x1895F8858](v131, v131) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v133 = _os_log_pack_fill();
        int v134 = *(unsigned __int16 *)(a10 + 88);
        *(_DWORD *)uint64_t v133 = 136446466;
        *(void *)(v133 + 4) = "_quic_packet_builder_assemble";
        *(_WORD *)(v133 + 12) = 1024;
        *(_DWORD *)(v133 + 14) = v134;
        int v38 = 17;
        uint64_t v39 = (uint64_t)v132;
        uint64_t v40 = 1029LL;
        goto LABEL_171;
      }

      return result;
    }

    *(void *)(a10 + 16) = v97;
    *(_BYTE *)(a10 + 87) = (_BYTE)v11;
    if (v97 == v98)
    {
      uint64_t v99 = *(void *)(a10 + 24);
      *(void *)(a10 + 32) = v99 + 4;
      *(_BYTE *)(a10 + 86) = 16;
    }

    else
    {
      qlog_abort_internal( "%s tag is not at the end of the buffer %p != %p (key_state %d, total_len %u, header_len %u, payload_len %u, pn % llu,  pn_len %u, frame_count %llu)",  "_quic_packet_builder_assemble",  v97,  v98,  v93,  v95,  v96,  (unsigned __int16)(v95 - v96),  *(void *)(a10 + 112),  *(unsigned __int8 *)(a10 + 85),  v61);
    }

    uint64_t pn = qlog_abort_internal("%s sample buffer extends past the end of the packet", "_quic_packet_builder_assemble");
LABEL_217:
    a5 = 0LL;
LABEL_26:
    char v23 = v22 | v21;
    unint64_t v24 = 2 * (pn - a5);
    unsigned int v25 = v182;
    if (v24 > 0xFF)
    {
      if (v24 >> 16)
      {
        if (v24 >> 24) {
          unsigned int v26 = pn;
        }
        else {
          unsigned int v26 = pn & 0xFFFFFF;
        }
      }

      else
      {
        unsigned int v26 = (unsigned __int16)pn;
      }
    }

    else
    {
      unsigned int v26 = pn;
    }

    LODWORD(v188) = v26;
    unsigned int v41 = (39 - __clz(v26)) >> 3;
    if (v26) {
      char v42 = v41;
    }
    else {
      char v42 = 1;
    }
    *(_BYTE *)(a10 + 85) = v42;
    unsigned __int8 __src = (v42 - 1) & 3 | v23;
    if (v25 <= 1)
    {
      if (qlog_debug_enabled
        || (qlog_nwlog_enabled & 1) != 0
        || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
      {
        uint64_t v135 = _os_log_pack_size();
        int v136 = (char *)&v174 - ((MEMORY[0x1895F8858](v135, v135) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v137 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v137 = 136446210;
        *(void *)(v137 + 4) = "_quic_packet_builder_assemble";
        int v38 = 16;
        uint64_t v39 = (uint64_t)v136;
        uint64_t v40 = 904LL;
        goto LABEL_171;
      }
    }

    else
    {
      *(void *)a10 = v11;
      unsigned int v43 = quic_safe_append(v11, &v193, &__src, 1uLL);
      uint64_t v194 = v43;
      unsigned int v45 = *(unsigned __int8 *)(v12 + 17);
      v12 += 17LL;
      size_t v44 = v45;
      if (v193 > v45)
      {
        if ((_DWORD)v44)
        {
          quic_cid_write((unsigned __int8 *)v12, __dst, 0x14uLL);
          unsigned int v43 = quic_safe_append(v194, &v193, __dst, v44);
          uint64_t v194 = v43;
        }

        *(void *)(a10 + 24) = v43;
        size_t v46 = *(unsigned __int8 *)(a10 + 85);
        *(_BYTE *)(a10 + 84) = v44 + v46 + 1;
        switch((_DWORD)v46)
        {
          case 4:
            unsigned int v47 = bswap32(v188);
LABEL_65:
            LODWORD(v188) = v47;
            break;
          case 3:
            LODWORD(v188) = v188 & 0xFF00 | (v188 << 16) | BYTE2(v188);
            break;
          case 2:
            unsigned int v47 = bswap32((unsigned __int16)v188) >> 16;
            goto LABEL_65;
        }

        uint64_t v194 = quic_safe_append(v43, &v193, &v188, v46);
        *(void *)(a10 + 8) = v194;
        char v48 = qlog_nwlog_enabled;
        if (qlog_datapath_enabled || qlog_nwlog_enabled)
        {
          if (qlog_debug_enabled) {
            char v48 = 1;
          }
          if ((v48 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v141 = _os_log_pack_size();
            uint64_t v142 = (char *)&v174 - ((MEMORY[0x1895F8858](v141, v141) + 15) & 0xFFFFFFFFFFFFFFF0LL);
            _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
            uint64_t v143 = _os_log_pack_fill();
            int v144 = (__src >> 2) & 1;
            int v145 = (__src >> 5) & 1;
            uint64_t v146 = quic_cid_describe((unsigned __int8 *)v12);
            uint64_t v147 = *(void *)(a10 + 112);
            int v148 = (__src & 3) + 1;
            *(_DWORD *)uint64_t v143 = 136447490;
            *(void *)(v143 + 4) = "_quic_packet_builder_assemble";
            *(_WORD *)(v143 + 12) = 1024;
            *(_DWORD *)(v143 + 14) = v144;
            *(_WORD *)(v143 + 18) = 1024;
            *(_DWORD *)(v143 + 20) = v145;
            *(_WORD *)(v143 + 24) = 2082;
            *(void *)(v143 + 26) = v146;
            *(_WORD *)(v143 + 34) = 2048;
            *(void *)(v143 + 36) = v147;
            *(_WORD *)(v143 + 44) = 1024;
            *(_DWORD *)(v143 + 46) = v148;
            qlog_internal(2, (uint64_t)v142, 939LL);
            unsigned int v25 = v182;
          }
        }

        v177 = 0LL;
        uint64_t v178 = v13;
        int v176 = 0;
        continue;
      }

      if (qlog_debug_enabled
        || (qlog_nwlog_enabled & 1) != 0
        || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
      {
        uint64_t v138 = _os_log_pack_size();
        uint64_t v139 = (char *)&v174 - ((MEMORY[0x1895F8858](v138, v138) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v140 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v140 = 136446210;
        *(void *)(v140 + 4) = "_quic_packet_builder_assemble";
        int v38 = 16;
        uint64_t v39 = (uint64_t)v139;
        uint64_t v40 = 912LL;
        goto LABEL_171;
      }
    }

    return 0LL;
  }

uint64_t quic_packet_builder_split_frames(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  v27[1] = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      uint64_t v23 = _os_log_pack_size();
      unint64_t v24 = (char *)v27 - ((MEMORY[0x1895F8858](v23, v23) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v25 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v25 = 136446210;
      *(void *)(v25 + 4) = "quic_packet_builder_split_frames";
      qlog_internal(17, (uint64_t)v24, 1224LL);
    }

    goto LABEL_25;
  }

  uint64_t pn = quic_protector_get_pn(*(void *)(a2 + 568), 3u, *(void *)(a3 + 328));
  if (a4 == -1) {
    uint64_t v11 = 0LL;
  }
  else {
    uint64_t v11 = a4;
  }
  unint64_t v12 = 2 * (pn - v11);
  unsigned int v13 = pn & 0xFFFFFF;
  if (v12 >> 24) {
    unsigned int v13 = pn;
  }
  if (v12 >> 16) {
    unsigned int v14 = v13;
  }
  else {
    unsigned int v14 = (unsigned __int16)pn;
  }
  if (v12 <= 0xFF) {
    unsigned int v15 = pn;
  }
  else {
    unsigned int v15 = v14;
  }
  int v16 = *(unsigned __int8 *)(a3 + 17);
  tag_unint64_t size = quic_protector_get_tag_size(*(void *)(a2 + 568), 4u);
  uint64_t v18 = *(void *)(a1 + 64);
  if (!v18)
  {
LABEL_25:
    char v19 = 0;
    return v19 & 1;
  }

  char v19 = 0;
  unsigned int v20 = (39 - __clz(v15)) >> 3;
  if (!v15) {
    unsigned int v20 = 1;
  }
  int v21 = v16 + tag_size + v20 + 1;
  do
  {
    uint64_t v22 = v18;
    uint64_t v18 = *(void *)(v18 + 96);
    if (*(void *)v22 == 8LL && v21 + *(unsigned __int16 *)(v22 + 8) > a5)
    {
      quic_packet_builder_split_stream_frame(a1, a2, (void *)v22, a5 >> 1, v22);
      char v19 = 1;
    }
  }

  while (v18);
  return v19 & 1;
}

void quic_packet_builder_split_stream_frame(uint64_t a1, uint64_t a2, void *a3, unsigned int a4, uint64_t a5)
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  if (a4)
  {
    uint64_t v25 = a1;
    nw_frame_array_init();
    nw_frame_array_append_array();
    unsigned int v9 = *((unsigned __int16 *)a3 + 20);
    if (*((_WORD *)a3 + 20))
    {
      int v10 = 0;
      do
      {
        unint64_t v11 = a3[4] - (unsigned __int16)v9 + a3[5];
        if (a4 >= (unsigned __int16)v9)
        {
          uint64_t stream_frame = quic_stream_create_stream_frame( *(void *)(a2 + 560),  a3[3],  v11,  (unsigned __int16)v9,  (uint64_t)v26,  a3[2] & 1);
          unsigned int v13 = v9;
        }

        else
        {
          nw_frame_array_init();
          v36[0] = 0LL;
          v36[1] = v36;
          int v37 = 0;
          unint64_t v36[2] = 0x2000000000LL;
          uint64_t v27 = MEMORY[0x1895F87A8];
          uint64_t v28 = 0x40000000LL;
          unsigned __int8 v29 = __quic_packet_builder_split_frame_inner_block_invoke;
          uint64_t v30 = &unk_18A1184B8;
          char v31 = v36;
          uint64_t v32 = v26;
          __int16 v35 = a4;
          unint64_t v33 = v38;
          uint64_t v34 = a2;
          nw_frame_array_foreach();
          uint64_t stream_frame = quic_stream_create_stream_frame(*(void *)(a2 + 560), a3[3], v11, a4, (uint64_t)v38, 0);
          _Block_object_dispose(v36, 8);
          unsigned int v13 = a4;
        }

        quic_packet_builder_insert_frame(*(void *)(a2 + 560), a5, stream_frame);
        if (!v10) {
          int v10 = *(unsigned __int16 *)(stream_frame + 8);
        }
        v9 -= v13;
        a5 = stream_frame;
      }

      while ((_WORD)v9);
    }

    uint64_t v14 = a3[12];
    unsigned int v15 = (void *)a3[13];
    int v16 = a3 + 12;
    if (v14)
    {
      *(void *)(v14 + 104) = v15;
      unsigned int v15 = (void *)a3[13];
    }

    else
    {
      *(void *)(v25 + 72) = v15;
    }

    *unsigned int v15 = v14;
    void *v16 = 0LL;
    a3[13] = 0LL;
    if (*a3 <= 0xBAB9FFuLL) {
      unint64_t v17 = *a3;
    }
    else {
      unint64_t v17 = *a3 - 12237272LL;
    }
    if (quic_frame_is_type_index_valid(v17, *a3))
    {
      uint64_t v18 = quic_frames[6 * v17 + 4];
      if (v18) {
        ((void (*)(void *))v18)(a3);
      }
      uint64_t v19 = a3[14];
      if (v19 && *(_DWORD *)(v19 + 16) < 0x1000u)
      {
        *((_OWORD *)a3 + 6) = 0u;
        *((_OWORD *)a3 + 7) = 0u;
        *((_OWORD *)a3 + 4) = 0u;
        *((_OWORD *)a3 + 5) = 0u;
        *((_OWORD *)a3 + 2) = 0u;
        *((_OWORD *)a3 + 3) = 0u;
        *(_OWORD *)a3 = 0u;
        *((_OWORD *)a3 + 1) = 0u;
        a3[14] = v19;
        unsigned int v20 = *(void **)(v19 + 8);
        a3[13] = v20;
        *unsigned int v20 = a3;
        uint64_t v21 = a3[14];
        *(void *)(v21 + 8) = v16;
        ++*(_DWORD *)(v21 + 16);
      }

      else
      {
        free(a3);
      }
    }
  }

  else if (qlog_debug_enabled {
         || (qlog_nwlog_enabled & 1) != 0
  }
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    uint64_t v22 = _os_log_pack_size();
    uint64_t v23 = &v26[-((MEMORY[0x1895F8858](v22, v22) + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v24 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v24 = 136446210;
    *(void *)(v24 + 4) = "quic_packet_builder_split_stream_frame";
    qlog_internal(17, (uint64_t)v23, 1199LL);
  }

uint64_t __quic_packet_builder_split_frame_inner_block_invoke(uint64_t a1)
{
  int size = nw_protocol_data_get_size();
  if (size)
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8LL);
    int v4 = *(_DWORD *)(v3 + 24);
    unsigned int v5 = *(unsigned __int16 *)(a1 + 64);
    if (v4 + size <= v5)
    {
      *(_DWORD *)(v3 + 24) = v4 + size;
      uint64_t v8 = 1LL;
      nw_frame_array_remove();
      nw_frame_array_append();
    }

    else
    {
      int v6 = v5 - v4;
      uint64_t v7 = (void *)nw_protocol_data_copy_outbound_subdata();
      nw_frame_array_remove();
      nw_frame_claim();
      nw_frame_array_append();
      nw_frame_array_prepend();
      if (v7) {
        nw_release(v7);
      }
      uint64_t v8 = 0LL;
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) += v6;
    }
  }

  else
  {
    uint64_t v8 = 1LL;
    nw_frame_array_remove();
  }

  return v8;
}

void quic_packet_builder_insert_frame(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v10[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v4 = *(void *)(a2 + 96);
    uint64_t v3 = (void *)(a2 + 96);
    *(void *)(a3 + 96) = v4;
    unsigned int v5 = (void *)(v4 + 104);
    if (v4) {
      int v6 = v5;
    }
    else {
      int v6 = (void *)(a1 + 72);
    }
    *int v6 = a3 + 96;
    void *v3 = a3;
    *(void *)(a3 + 104) = v3;
  }

  else if (qlog_debug_enabled {
         || (qlog_nwlog_enabled & 1) != 0
  }
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    uint64_t v7 = _os_log_pack_size();
    uint64_t v8 = (char *)v10 - ((MEMORY[0x1895F8858](v7, v7) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v9 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v9 = 136446210;
    *(void *)(v9 + 4) = "quic_packet_builder_insert_frame";
    qlog_internal(17, (uint64_t)v8, 134LL);
  }

unsigned __int8 **quic_packet_parser( uint64_t a1, uint64_t a2, unsigned __int8 *a3, unsigned int a4, int a5, uint64_t *a6)
{
  v23[1] = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      uint64_t v17 = _os_log_pack_size();
      uint64_t v18 = (char *)v23 - ((MEMORY[0x1895F8858](v17, v17) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v19 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v19 = 136446210;
      *(void *)(v19 + 4) = "quic_packet_parser";
      qlog_internal(17, (uint64_t)v18, 625LL);
    }

    return 0LL;
  }

  unint64_t v12 = (unsigned __int8 **)quic_packet_create(*(void *)(a1 + 1320) + 24LL);
  if (!quic_packet_parser_inner(a1, a2, v12, a3, a4, a5, a6))
  {
    *(_WORD *)a6 = a4;
LABEL_10:
    _quic_packet_destroy(v12);
    return 0LL;
  }

  uint64_t v13 = *(unsigned __int16 *)a6;
  int v14 = a4 - v13;
  if (a4 < v13)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      uint64_t v20 = _os_log_pack_size();
      uint64_t v21 = (char *)v23 - ((MEMORY[0x1895F8858](v20, v20) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v22 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v22 = 136446210;
      *(void *)(v22 + 4) = "quic_packet_parser";
      qlog_internal(17, (uint64_t)v21, 636LL);
    }

    goto LABEL_10;
  }

  if ((_WORD)a4 != (_WORD)v13)
  {
    unsigned int v15 = &a3[v13];
    do
    {
      if (*v15) {
        break;
      }
      ++v15;
      LODWORD(v13) = v13 + 1;
      *(_WORD *)a6 = v13;
      --v14;
    }

    while ((_WORD)v14);
  }

  return v12;
}

BOOL quic_packet_parser_inner( uint64_t a1, uint64_t a2, unsigned __int8 **a3, unsigned __int8 *a4, unsigned int a5, int a6, uint64_t *a7)
{
  v268[1] = *(_DWORD **)MEMORY[0x1895F89C0];
  if (!a2)
  {
    if (!qlog_debug_enabled && (qlog_nwlog_enabled & 1) == 0)
    {
      BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT);
      if (!result) {
        return result;
      }
    }

    uint64_t v138 = _os_log_pack_size();
    uint64_t v139 = (char *)&v262 - ((MEMORY[0x1895F8858](v138, v138) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v140 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v140 = 136446210;
    *(void *)(v140 + 4) = "quic_packet_parser_inner";
    uint64_t v141 = (uint64_t)v139;
    uint64_t v142 = 228LL;
LABEL_223:
    qlog_internal(17, v141, v142);
    return 0LL;
  }

  if (!a4)
  {
    if (!qlog_debug_enabled && (qlog_nwlog_enabled & 1) == 0)
    {
      BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT);
      if (!result) {
        return result;
      }
    }

    uint64_t v143 = _os_log_pack_size();
    int v144 = (char *)&v262 - ((MEMORY[0x1895F8858](v143, v143) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v145 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v145 = 136446210;
    *(void *)(v145 + 4) = "quic_packet_parser_inner";
    uint64_t v141 = (uint64_t)v144;
    uint64_t v142 = 229LL;
    goto LABEL_223;
  }

  if (!a5)
  {
    if (!qlog_debug_enabled && (qlog_nwlog_enabled & 1) == 0)
    {
      BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT);
      if (!result) {
        return result;
      }
    }

    uint64_t v146 = _os_log_pack_size();
    uint64_t v147 = (char *)&v262 - ((MEMORY[0x1895F8858](v146, v146) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v148 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v148 = 136446210;
    *(void *)(v148 + 4) = "quic_packet_parser_inner";
    uint64_t v141 = (uint64_t)v147;
    uint64_t v142 = 230LL;
    goto LABEL_223;
  }

  if (!a7)
  {
    if (!qlog_debug_enabled && (qlog_nwlog_enabled & 1) == 0)
    {
      BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT);
      if (!result) {
        return result;
      }
    }

    uint64_t v149 = _os_log_pack_size();
    uint64_t v150 = (char *)&v262 - ((MEMORY[0x1895F8858](v149, v149) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v151 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v151 = 136446210;
    *(void *)(v151 + 4) = "quic_packet_parser_inner";
    uint64_t v141 = (uint64_t)v150;
    uint64_t v142 = 231LL;
    goto LABEL_223;
  }

  unsigned int v11 = *a4;
  uint64_t v266 = 0LL;
  if (a5 <= 0x14)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || (BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR)))
    {
      if (!*(void *)(a1 + 1112)) {
        return 0LL;
      }
      uint64_t v152 = _os_log_pack_size();
      uint64_t v153 = (char *)&v262 - ((MEMORY[0x1895F8858](v152, v152) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v154 = _os_log_pack_fill();
      uint64_t v155 = quic_cid_describe((unsigned __int8 *)(*(void *)(a1 + 1112) + 38LL));
      uint64_t v156 = quic_cid_describe((unsigned __int8 *)(*(void *)(a1 + 1112) + 17LL));
      *(_DWORD *)uint64_t v154 = 136447234;
      *(void *)(v154 + 4) = "quic_packet_parser_inner";
      *(_WORD *)(v154 + 12) = 2082;
      *(void *)(v154 + 14) = a1 + 976;
      *(_WORD *)(v154 + 22) = 2082;
      *(void *)(v154 + 24) = v155;
      *(_WORD *)(v154 + 32) = 2082;
      *(void *)(v154 + 34) = v156;
      *(_WORD *)(v154 + 42) = 1024;
      *(_DWORD *)(v154 + 44) = a5;
      uint64_t v54 = (uint64_t)v153;
      uint64_t v55 = 243LL;
      goto LABEL_204;
    }

    return result;
  }

  uint64_t v264 = a1;
  *((_WORD *)a3 + 41) = 0;
  *((_DWORD *)a3 + 26) = a6;
  *(_WORD *)a7 = 0;
  char v14 = qlog_nwlog_enabled;
  if (qlog_datapath_enabled || qlog_nwlog_enabled)
  {
    if (qlog_debug_enabled) {
      char v14 = 1;
    }
    if ((v14 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v157 = _os_log_pack_size();
      uint64_t v158 = (char *)&v262 - ((MEMORY[0x1895F8858](v157, v157) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v159 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v159 = 136446466;
      *(void *)(v159 + 4) = "quic_packet_parser_inner";
      *(_WORD *)(v159 + 12) = 1024;
      *(_DWORD *)(v159 + 14) = a5;
      qlog_internal(2, (uint64_t)v158, 250LL);
    }
  }

  *a3 = a4;
  unsigned int v15 = (_DWORD)a3[29] & 0xFFFFFFFE | (v11 >> 7);
  *((_DWORD *)a3 + 58) = v15;
  unsigned int v16 = *a4;
  v263 = a7;
  if ((v11 & 0x80) != 0)
  {
    unsigned int v26 = *(_DWORD *)(a4 + 1);
    *((_DWORD *)a3 + 27) = bswap32(v26);
    uint64_t v27 = a4[5];
    if (v27 >= 0x15)
    {
      if (qlog_debug_enabled
        || (qlog_nwlog_enabled & 1) != 0
        || (BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR)))
      {
        uint64_t v179 = v264;
        if (!*(void *)(v264 + 1112)) {
          return 0LL;
        }
        uint64_t v180 = _os_log_pack_size();
        int v181 = (char *)&v262 - ((MEMORY[0x1895F8858](v180, v180) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v182 = _os_log_pack_fill();
        v183 = quic_cid_describe((unsigned __int8 *)(*(void *)(v179 + 1112) + 38LL));
        unint64_t v184 = quic_cid_describe((unsigned __int8 *)(*(void *)(v179 + 1112) + 17LL));
        *(_DWORD *)uint64_t v182 = 136447234;
        *(void *)(v182 + 4) = "quic_packet_parser_inner";
        *(_WORD *)(v182 + 12) = 2082;
        *(void *)(v182 + 14) = v179 + 976;
        *(_WORD *)(v182 + 22) = 2082;
        *(void *)(v182 + 24) = v183;
        *(_WORD *)(v182 + 32) = 2082;
        *(void *)(v182 + 34) = v184;
        *(_WORD *)(v182 + 42) = 1024;
        *(_DWORD *)(v182 + 44) = v27;
        uint64_t v54 = (uint64_t)v181;
        uint64_t v55 = 260LL;
        goto LABEL_204;
      }

      return result;
    }

    unsigned int v28 = a5 - 6;
    unsigned __int8 v29 = a4 + 6;
    if (a4[5])
    {
      if (v27 > (unsigned __int16)v28)
      {
        if (qlog_debug_enabled
          || (qlog_nwlog_enabled & 1) != 0
          || (BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR)))
        {
          uint64_t v197 = v264;
          if (!*(void *)(v264 + 1112)) {
            return 0LL;
          }
          uint64_t v198 = _os_log_pack_size();
          uint64_t v199 = (char *)&v262 - ((MEMORY[0x1895F8858](v198, v198) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          uint64_t v200 = _os_log_pack_fill();
          uint64_t v201 = quic_cid_describe((unsigned __int8 *)(*(void *)(v197 + 1112) + 38LL));
          v202 = quic_cid_describe((unsigned __int8 *)(*(void *)(v197 + 1112) + 17LL));
          *(_DWORD *)uint64_t v200 = 136446978;
          *(void *)(v200 + 4) = "quic_packet_parser_inner";
          *(_WORD *)(v200 + 12) = 2082;
          *(void *)(v200 + 14) = v197 + 976;
          *(_WORD *)(v200 + 22) = 2082;
          *(void *)(v200 + 24) = v201;
          *(_WORD *)(v200 + 32) = 2082;
          *(void *)(v200 + 34) = v202;
          uint64_t v54 = (uint64_t)v199;
          uint64_t v55 = 267LL;
          goto LABEL_204;
        }

        return result;
      }

      v28 -= v27;
      quic_cid_read(a4 + 6, a4[5], (_BYTE *)a3 + 40);
      if (!(_WORD)v28)
      {
        if (qlog_debug_enabled
          || (qlog_nwlog_enabled & 1) != 0
          || (BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR)))
        {
          uint64_t v185 = v264;
          if (!*(void *)(v264 + 1112)) {
            return 0LL;
          }
          uint64_t v186 = _os_log_pack_size();
          __int16 v187 = (char *)&v262 - ((MEMORY[0x1895F8858](v186, v186) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          uint64_t v188 = _os_log_pack_fill();
          unsigned __int8 v189 = quic_cid_describe((unsigned __int8 *)(*(void *)(v185 + 1112) + 38LL));
          unsigned __int8 v190 = quic_cid_describe((unsigned __int8 *)(*(void *)(v185 + 1112) + 17LL));
          *(_DWORD *)uint64_t v188 = 136446978;
          *(void *)(v188 + 4) = "quic_packet_parser_inner";
          *(_WORD *)(v188 + 12) = 2082;
          *(void *)(v188 + 14) = v185 + 976;
          *(_WORD *)(v188 + 22) = 2082;
          *(void *)(v188 + 24) = v189;
          *(_WORD *)(v188 + 32) = 2082;
          *(void *)(v188 + 34) = v190;
          uint64_t v54 = (uint64_t)v187;
          uint64_t v55 = 271LL;
          goto LABEL_204;
        }

        return result;
      }

      v29 += v27;
    }

    unsigned int v32 = *v29;
    uint64_t v30 = v29 + 1;
    uint64_t v31 = v32;
    unsigned int v33 = v28 - 1;
    unsigned __int16 v267 = v33;
    v268[0] = v30;
    if (v32 >= 0x15)
    {
      if (qlog_debug_enabled
        || (qlog_nwlog_enabled & 1) != 0
        || (BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR)))
      {
        uint64_t v191 = v264;
        if (!*(void *)(v264 + 1112)) {
          return 0LL;
        }
        uint64_t v192 = _os_log_pack_size();
        unsigned __int16 v193 = (char *)&v262 - ((MEMORY[0x1895F8858](v192, v192) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v194 = _os_log_pack_fill();
        uint64_t v195 = quic_cid_describe((unsigned __int8 *)(*(void *)(v191 + 1112) + 38LL));
        uint64_t v196 = quic_cid_describe((unsigned __int8 *)(*(void *)(v191 + 1112) + 17LL));
        *(_DWORD *)uint64_t v194 = 136447234;
        *(void *)(v194 + 4) = "quic_packet_parser_inner";
        *(_WORD *)(v194 + 12) = 2082;
        *(void *)(v194 + 14) = v191 + 976;
        *(_WORD *)(v194 + 22) = 2082;
        *(void *)(v194 + 24) = v195;
        *(_WORD *)(v194 + 32) = 2082;
        *(void *)(v194 + 34) = v196;
        *(_WORD *)(v194 + 42) = 1024;
        *(_DWORD *)(v194 + 44) = v31;
        uint64_t v54 = (uint64_t)v193;
        uint64_t v55 = 273LL;
        goto LABEL_204;
      }

      return result;
    }

    if ((_DWORD)v31)
    {
      if (v31 > (unsigned __int16)v33)
      {
        if (qlog_debug_enabled
          || (qlog_nwlog_enabled & 1) != 0
          || (BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR)))
        {
          uint64_t v203 = v264;
          if (!*(void *)(v264 + 1112)) {
            return 0LL;
          }
          uint64_t v204 = _os_log_pack_size();
          uint64_t v205 = (char *)&v262 - ((MEMORY[0x1895F8858](v204, v204) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          uint64_t v206 = _os_log_pack_fill();
          v207 = quic_cid_describe((unsigned __int8 *)(*(void *)(v203 + 1112) + 38LL));
          v208 = quic_cid_describe((unsigned __int8 *)(*(void *)(v203 + 1112) + 17LL));
          *(_DWORD *)uint64_t v206 = 136446978;
          *(void *)(v206 + 4) = "quic_packet_parser_inner";
          *(_WORD *)(v206 + 12) = 2082;
          *(void *)(v206 + 14) = v203 + 976;
          *(_WORD *)(v206 + 22) = 2082;
          *(void *)(v206 + 24) = v207;
          *(_WORD *)(v206 + 32) = 2082;
          *(void *)(v206 + 34) = v208;
          uint64_t v54 = (uint64_t)v205;
          uint64_t v55 = 280LL;
          goto LABEL_204;
        }

        return result;
      }

      v33 -= v31;
      unsigned __int16 v267 = v33;
      v268[0] = (_DWORD *)((char *)v30 + v31);
      quic_cid_read(v30, v31, (_BYTE *)a3 + 61);
      uint64_t v30 = (_DWORD *)((char *)v30 + v31);
    }

    char v34 = v27 + v31 + 7;
    *((_BYTE *)a3 + 84) = v34;
    if (v26)
    {
      unint64_t v265 = 0LL;
      if ((v16 & 0x40) != 0) {
        __asm { BR              X10 }
      }

      if (qlog_debug_enabled
        || (qlog_nwlog_enabled & 1) != 0
        || (BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR)))
      {
        uint64_t v209 = v264;
        if (!*(void *)(v264 + 1112)) {
          return 0LL;
        }
        uint64_t v210 = _os_log_pack_size();
        v211 = (char *)&v262 - ((MEMORY[0x1895F8858](v210, v210) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v212 = _os_log_pack_fill();
        v213 = quic_cid_describe((unsigned __int8 *)(*(void *)(v209 + 1112) + 38LL));
        v214 = quic_cid_describe((unsigned __int8 *)(*(void *)(v209 + 1112) + 17LL));
        *(_DWORD *)uint64_t v212 = 136446978;
        *(void *)(v212 + 4) = "quic_packet_parser_inner";
        *(_WORD *)(v212 + 12) = 2082;
        *(void *)(v212 + 14) = v209 + 976;
        *(_WORD *)(v212 + 22) = 2082;
        *(void *)(v212 + 24) = v213;
        *(_WORD *)(v212 + 32) = 2082;
        *(void *)(v212 + 34) = v214;
        uint64_t v54 = (uint64_t)v211;
        uint64_t v55 = 322LL;
        goto LABEL_204;
      }

      return result;
    }

    *((_DWORD *)a3 + 58) |= 0x100u;
    if (!(_WORD)v33 || (v33 & 3) != 0)
    {
      uint64_t v56 = v264;
      if (!qlog_debug_enabled && (qlog_nwlog_enabled & 1) == 0)
      {
        BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR);
        if (!result) {
          return result;
        }
      }

      if (*(void *)(v56 + 1112))
      {
        uint64_t v57 = _os_log_pack_size();
        v263 = &v262;
        char v58 = (char *)&v262 - ((MEMORY[0x1895F8858](v57, v57) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v59 = _os_log_pack_fill();
        uint64_t v262 = v56 + 976;
        unint64_t v60 = *(unsigned __int8 **)(v56 + 1112);
        if (quic_cid_describe_state % 3 == 2) {
          uint64_t v61 = &quic_cid_describe_cid_buf2;
        }
        else {
          uint64_t v61 = &quic_cid_describe_cid_buf3;
        }
        if (quic_cid_describe_state % 3) {
          uint64_t v62 = v61;
        }
        else {
          uint64_t v62 = &quic_cid_describe_cid_buf1;
        }
        int v63 = ++quic_cid_describe_state;
        unsigned int v64 = v60[38];
        __int128 v65 = 0uLL;
        *(_OWORD *)((char *)v62 + 25) = 0u;
        if (v64 >= 0x14) {
          uint64_t v66 = 20LL;
        }
        else {
          uint64_t v66 = v64;
        }
        _OWORD *v62 = 0uLL;
        v62[1] = 0uLL;
        if ((_DWORD)v66)
        {
          uint64_t v67 = v60 + 39;
          do
          {
            int v68 = *v67++;
            snprintf((char *)v62, 0x29uLL, "%s%02x", (const char *)v62, v68);
            --v66;
          }

          while (v66);
          unint64_t v60 = *(unsigned __int8 **)(v264 + 1112);
          int v63 = quic_cid_describe_state;
          __int128 v65 = 0uLL;
        }

        if (v63 % 3 == 2) {
          int v69 = &quic_cid_describe_cid_buf2;
        }
        else {
          int v69 = &quic_cid_describe_cid_buf3;
        }
        if (v63 % 3) {
          uint64_t v70 = v69;
        }
        else {
          uint64_t v70 = &quic_cid_describe_cid_buf1;
        }
        quic_cid_describe_unsigned int state = v63 + 1;
        if (v60[17] >= 0x14u) {
          uint64_t v71 = 20LL;
        }
        else {
          uint64_t v71 = v60[17];
        }
        _OWORD *v70 = v65;
        v70[1] = v65;
        *(_OWORD *)((char *)v70 + 25) = v65;
        if ((_DWORD)v71)
        {
          unsigned __int8 v72 = v60 + 18;
          do
          {
            int v73 = *v72++;
            snprintf((char *)v70, 0x29uLL, "%s%02x", (const char *)v70, v73);
            --v71;
          }

          while (v71);
        }

        *(_DWORD *)uint64_t v59 = 136447234;
        *(void *)(v59 + 4) = "quic_packet_parser_inner";
        *(_WORD *)(v59 + 12) = 2082;
        *(void *)(v59 + 14) = v262;
        *(_WORD *)(v59 + 22) = 2082;
        *(void *)(v59 + 24) = v62;
        *(_WORD *)(v59 + 32) = 2082;
        *(void *)(v59 + 34) = v70;
        *(_WORD *)(v59 + 42) = 1024;
        *(_DWORD *)(v59 + 44) = v33 & 3;
        uint64_t v54 = (uint64_t)v58;
        uint64_t v55 = 291LL;
        goto LABEL_204;
      }
    }

    else
    {
      unsigned int v47 = (v33 >> 2);
      *((_WORD *)a3 + 47) = v47;
      uint64_t v48 = v264;
      if (v47 < 0x11)
      {
        int v132 = 4 * v47;
        if (4 * v47 > (unsigned __int16)v33)
        {
          if (qlog_debug_enabled
            || (qlog_nwlog_enabled & 1) != 0
            || (BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR)))
          {
            if (!*(void *)(v264 + 1112)) {
              return 0LL;
            }
            uint64_t v256 = _os_log_pack_size();
            v257 = (char *)&v262 - ((MEMORY[0x1895F8858](v256, v256) + 15) & 0xFFFFFFFFFFFFFFF0LL);
            _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
            uint64_t v258 = _os_log_pack_fill();
            uint64_t v259 = v264;
            v260 = quic_cid_describe((unsigned __int8 *)(*(void *)(v264 + 1112) + 38LL));
            v261 = quic_cid_describe((unsigned __int8 *)(*(void *)(v259 + 1112) + 17LL));
            *(_DWORD *)uint64_t v258 = 136446978;
            *(void *)(v258 + 4) = "quic_packet_parser_inner";
            *(_WORD *)(v258 + 12) = 2082;
            *(void *)(v258 + 14) = v259 + 976;
            *(_WORD *)(v258 + 22) = 2082;
            *(void *)(v258 + 24) = v260;
            *(_WORD *)(v258 + 32) = 2082;
            *(void *)(v258 + 34) = v261;
            uint64_t v54 = (uint64_t)v257;
            uint64_t v55 = 303LL;
            goto LABEL_204;
          }

          return result;
        }

        a3[12] = (unsigned __int8 *)v30;
        *((_BYTE *)a3 + 84) = (v33 & 0xFC) + v34;
        quic_packet_parser_describe_header(a3);
        if (v132 == (unsigned __int16)v33)
        {
          *(_WORD *)v263 = a5;
          return 1LL;
        }

        if (!qlog_debug_enabled && (qlog_nwlog_enabled & 1) == 0)
        {
          BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR);
          if (!result) {
            return result;
          }
        }

        if (*(void *)(v48 + 1112))
        {
          uint64_t v133 = _os_log_pack_size();
          int v134 = (char *)&v262 - ((MEMORY[0x1895F8858](v133, v133) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          uint64_t v135 = _os_log_pack_fill();
          int v136 = quic_cid_describe((unsigned __int8 *)(*(void *)(v48 + 1112) + 38LL));
          uint64_t v137 = quic_cid_describe((unsigned __int8 *)(*(void *)(v48 + 1112) + 17LL));
          *(_DWORD *)uint64_t v135 = 136446978;
          *(void *)(v135 + 4) = "quic_packet_parser_inner";
          *(_WORD *)(v135 + 12) = 2082;
          *(void *)(v135 + 14) = v48 + 976;
          *(_WORD *)(v135 + 22) = 2082;
          *(void *)(v135 + 24) = v136;
          *(_WORD *)(v135 + 32) = 2082;
          *(void *)(v135 + 34) = v137;
          uint64_t v54 = (uint64_t)v134;
          uint64_t v55 = 314LL;
          goto LABEL_204;
        }
      }

      else
      {
        if (!qlog_debug_enabled && (qlog_nwlog_enabled & 1) == 0)
        {
          BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR);
          if (!result) {
            return result;
          }
        }

        if (*(void *)(v48 + 1112))
        {
          uint64_t v49 = _os_log_pack_size();
          char v50 = (char *)&v262 - ((MEMORY[0x1895F8858](v49, v49) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          uint64_t v51 = _os_log_pack_fill();
          uint64_t v52 = quic_cid_describe((unsigned __int8 *)(*(void *)(v48 + 1112) + 38LL));
          unsigned int v53 = quic_cid_describe((unsigned __int8 *)(*(void *)(v48 + 1112) + 17LL));
          *(_DWORD *)uint64_t v51 = 136446978;
          *(void *)(v51 + 4) = "quic_packet_parser_inner";
          *(_WORD *)(v51 + 12) = 2082;
          *(void *)(v51 + 14) = v48 + 976;
          *(_WORD *)(v51 + 22) = 2082;
          *(void *)(v51 + 24) = v52;
          *(_WORD *)(v51 + 32) = 2082;
          *(void *)(v51 + 34) = v53;
          uint64_t v54 = (uint64_t)v50;
          uint64_t v55 = 296LL;
          goto LABEL_204;
        }
      }
    }

    return 0LL;
  }

  unsigned __int16 v17 = a5 - 1;
  unsigned __int16 v267 = a5 - 1;
  uint64_t v18 = (unsigned __int16 *)(a4 + 1);
  v268[0] = v18;
  if ((v16 & 0x40) == 0)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || (BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR)))
    {
      uint64_t v160 = v264;
      if (!*(void *)(v264 + 1112)) {
        return 0LL;
      }
      uint64_t v161 = _os_log_pack_size();
      uint64_t v162 = (char *)&v262 - ((MEMORY[0x1895F8858](v161, v161) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v163 = _os_log_pack_fill();
      uint64_t v164 = quic_cid_describe((unsigned __int8 *)(*(void *)(v160 + 1112) + 38LL));
      uint64_t v165 = quic_cid_describe((unsigned __int8 *)(*(void *)(v160 + 1112) + 17LL));
      *(_DWORD *)uint64_t v163 = 136446978;
      *(void *)(v163 + 4) = "quic_packet_parser_inner";
      *(_WORD *)(v163 + 12) = 2082;
      *(void *)(v163 + 14) = v160 + 976;
      *(_WORD *)(v163 + 22) = 2082;
      *(void *)(v163 + 24) = v164;
      *(_WORD *)(v163 + 32) = 2082;
      *(void *)(v163 + 34) = v165;
      uint64_t v54 = (uint64_t)v162;
      uint64_t v55 = 398LL;
      goto LABEL_204;
    }

    return result;
  }

  *((_WORD *)a3 + 41) = 772;
  char v19 = 1;
  *((_BYTE *)a3 + 84) = 1;
  *((_DWORD *)a3 + 58) = v15 & 0xFFFFF7FF | (((v16 >> 5) & 1) << 11);
  uint64_t v20 = v264;
  uint64_t v21 = *(void *)(v264 + 1112);
  uint64_t v22 = *(unsigned __int8 *)(v21 + 38);
  if (!*(_BYTE *)(v21 + 38)) {
    goto LABEL_13;
  }
  if (v22 > v17)
  {
    if (!qlog_debug_enabled && (qlog_nwlog_enabled & 1) == 0)
    {
      BOOL v166 = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR);
      BOOL result = 0LL;
      if (!v21 || !v166) {
        return result;
      }
    }

    uint64_t v167 = _os_log_pack_size();
    v168 = (char *)&v262 - ((MEMORY[0x1895F8858](v167, v167) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v169 = _os_log_pack_fill();
    uint64_t v170 = quic_cid_describe((unsigned __int8 *)(*(void *)(v20 + 1112) + 38LL));
    uint64_t v171 = quic_cid_describe((unsigned __int8 *)(*(void *)(v20 + 1112) + 17LL));
    *(_DWORD *)uint64_t v169 = 136446978;
    *(void *)(v169 + 4) = "quic_packet_parser_inner";
    *(_WORD *)(v169 + 12) = 2082;
    *(void *)(v169 + 14) = v20 + 976;
    *(_WORD *)(v169 + 22) = 2082;
    *(void *)(v169 + 24) = v170;
    *(_WORD *)(v169 + 32) = 2082;
    *(void *)(v169 + 34) = v171;
    uint64_t v54 = (uint64_t)v168;
    uint64_t v55 = 416LL;
LABEL_204:
    qlog_internal(16, v54, v55);
    return 0LL;
  }

  v17 -= v22;
  unsigned __int16 v267 = v17;
  v268[0] = (_DWORD *)((char *)v18 + v22);
  quic_cid_read(v18, v22, (_BYTE *)a3 + 40);
  char v19 = *((_BYTE *)a3 + 84);
  uint64_t v18 = (unsigned __int16 *)((char *)v18 + v22);
LABEL_13:
  *((_BYTE *)a3 + 84) = v19 + v22;
  *(unsigned __int8 **)((char *)a3 + 69) = 0LL;
  *(unsigned __int8 **)((char *)a3 + 61) = 0LL;
  *(unsigned __int8 **)((char *)a3 + 74) = 0LL;
  a3[3] = (unsigned __int8 *)v18;
  a3[4] = (unsigned __int8 *)(v18 + 2);
  *((_BYTE *)a3 + 86) = 16;
  BOOL v23 = quic_migration_multipath_ready(*(void *)(v20 + 1120));
  int v24 = *((unsigned __int8 *)a3 + 83);
  if (v23 && v24 == 3)
  {
    uint64_t scid_seq = quic_conn_get_scid_seq(v20, (_BYTE *)a3 + 40);
    a3[28] = (unsigned __int8 *)scid_seq;
    int v24 = *((unsigned __int8 *)a3 + 83);
  }

  else
  {
    uint64_t scid_seq = (uint64_t)a3[28];
  }

  largest_uint64_t pn = quic_ack_get_largest_pn(*(char **)(v20 + 960), v24, scid_seq);
  tag_int size = quic_protector_get_tag_size(*(void *)(v20 + 568), *((unsigned __int8 *)a3 + 82));
  BOOL result = quic_packet_parser_open_header(v20, (uint64_t)a3, v17, a6);
  if (result)
  {
    int v38 = *((_DWORD *)a3 + 58);
    unsigned int v39 = **a3;
    if ((v38 & 1) != 0)
    {
      unsigned int v40 = v39 >> 2;
    }

    else
    {
      unsigned int v40 = v39 >> 3;
      if ((v39 & 4) != 0) {
        char v41 = 5;
      }
      else {
        char v41 = 4;
      }
      *((_BYTE *)a3 + 82) = v41;
      *((_BYTE *)a3 + 83) = 3;
    }

    __int16 v42 = *((unsigned __int8 *)a3 + 85);
    switch(*((_BYTE *)a3 + 85))
    {
      case 1:
        if (v17)
        {
          char v44 = *(_BYTE *)v18;
          unsigned int v43 = (_DWORD *)((char *)v18 + 1);
          *((_BYTE *)a3 + 112) = v44;
          unsigned __int16 v45 = v17 - 1;
          v268[0] = v43;
          unint64_t v46 = (unint64_t)a3[14];
          goto LABEL_113;
        }

        if (qlog_debug_enabled
          || (qlog_nwlog_enabled & 1) != 0
          || (BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR)))
        {
          if (!*(void *)(v264 + 1112)) {
            return 0LL;
          }
          uint64_t v226 = _os_log_pack_size();
          v227 = (char *)&v262 - ((MEMORY[0x1895F8858](v226, v226) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          uint64_t v228 = _os_log_pack_fill();
          uint64_t v229 = v264;
          v230 = quic_cid_describe((unsigned __int8 *)(*(void *)(v264 + 1112) + 38LL));
          v231 = quic_cid_describe((unsigned __int8 *)(*(void *)(v229 + 1112) + 17LL));
          *(_DWORD *)uint64_t v228 = 136446978;
          *(void *)(v228 + 4) = "quic_packet_parser_inner";
          *(_WORD *)(v228 + 12) = 2082;
          *(void *)(v228 + 14) = v229 + 976;
          *(_WORD *)(v228 + 22) = 2082;
          *(void *)(v228 + 24) = v230;
          *(_WORD *)(v228 + 32) = 2082;
          *(void *)(v228 + 34) = v231;
          uint64_t v54 = (uint64_t)v227;
          uint64_t v55 = 477LL;
          goto LABEL_204;
        }

        return result;
      case 2:
        if (v17 > 1u)
        {
          unsigned int v91 = *v18;
          unsigned int v43 = v18 + 1;
          unint64_t v46 = __rev16(v91);
          unsigned __int16 v45 = v17 - 2;
          v268[0] = v43;
          goto LABEL_113;
        }

        if (qlog_debug_enabled
          || (qlog_nwlog_enabled & 1) != 0
          || (BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR)))
        {
          if (!*(void *)(v264 + 1112)) {
            return 0LL;
          }
          uint64_t v232 = _os_log_pack_size();
          v233 = (char *)&v262 - ((MEMORY[0x1895F8858](v232, v232) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          uint64_t v234 = _os_log_pack_fill();
          uint64_t v235 = v264;
          v236 = quic_cid_describe((unsigned __int8 *)(*(void *)(v264 + 1112) + 38LL));
          v237 = quic_cid_describe((unsigned __int8 *)(*(void *)(v235 + 1112) + 17LL));
          *(_DWORD *)uint64_t v234 = 136446978;
          *(void *)(v234 + 4) = "quic_packet_parser_inner";
          *(_WORD *)(v234 + 12) = 2082;
          *(void *)(v234 + 14) = v235 + 976;
          *(_WORD *)(v234 + 22) = 2082;
          *(void *)(v234 + 24) = v236;
          *(_WORD *)(v234 + 32) = 2082;
          *(void *)(v234 + 34) = v237;
          uint64_t v54 = (uint64_t)v233;
          uint64_t v55 = 481LL;
          goto LABEL_204;
        }

        return result;
      case 3:
        if (v17 > 2u)
        {
          unint64_t v46 = ((unint64_t)*(unsigned __int8 *)v18 << 16) | ((unint64_t)*((unsigned __int8 *)v18 + 1) << 8) | *((unsigned __int8 *)v18 + 2);
          unsigned __int16 v45 = v17 - 3;
          unsigned int v43 = (_DWORD *)((char *)v18 + 3);
          v268[0] = v43;
          goto LABEL_113;
        }

        if (qlog_debug_enabled
          || (qlog_nwlog_enabled & 1) != 0
          || (BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR)))
        {
          if (!*(void *)(v264 + 1112)) {
            return 0LL;
          }
          uint64_t v238 = _os_log_pack_size();
          v239 = (char *)&v262 - ((MEMORY[0x1895F8858](v238, v238) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          uint64_t v240 = _os_log_pack_fill();
          uint64_t v241 = v264;
          v242 = quic_cid_describe((unsigned __int8 *)(*(void *)(v264 + 1112) + 38LL));
          v243 = quic_cid_describe((unsigned __int8 *)(*(void *)(v241 + 1112) + 17LL));
          *(_DWORD *)uint64_t v240 = 136446978;
          *(void *)(v240 + 4) = "quic_packet_parser_inner";
          *(_WORD *)(v240 + 12) = 2082;
          *(void *)(v240 + 14) = v241 + 976;
          *(_WORD *)(v240 + 22) = 2082;
          *(void *)(v240 + 24) = v242;
          *(_WORD *)(v240 + 32) = 2082;
          *(void *)(v240 + 34) = v243;
          uint64_t v54 = (uint64_t)v239;
          uint64_t v55 = 485LL;
          goto LABEL_204;
        }

        return result;
      case 4:
        if (v17 <= 3u)
        {
          if (!qlog_debug_enabled && (qlog_nwlog_enabled & 1) == 0)
          {
            BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR);
            if (!result) {
              return result;
            }
          }

          if (!*(void *)(v264 + 1112)) {
            return 0LL;
          }
          uint64_t v244 = _os_log_pack_size();
          v245 = (char *)&v262 - ((MEMORY[0x1895F8858](v244, v244) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          uint64_t v246 = _os_log_pack_fill();
          uint64_t v247 = v264;
          v248 = quic_cid_describe((unsigned __int8 *)(*(void *)(v264 + 1112) + 38LL));
          v249 = quic_cid_describe((unsigned __int8 *)(*(void *)(v247 + 1112) + 17LL));
          *(_DWORD *)uint64_t v246 = 136446978;
          *(void *)(v246 + 4) = "quic_packet_parser_inner";
          *(_WORD *)(v246 + 12) = 2082;
          *(void *)(v246 + 14) = v247 + 976;
          *(_WORD *)(v246 + 22) = 2082;
          *(void *)(v246 + 24) = v248;
          *(_WORD *)(v246 + 32) = 2082;
          *(void *)(v246 + 34) = v249;
          uint64_t v54 = (uint64_t)v245;
          uint64_t v55 = 489LL;
          goto LABEL_204;
        }

        unint64_t v46 = (*(unsigned __int8 *)v18 << 24) | ((unint64_t)*((unsigned __int8 *)v18 + 1) << 16) | ((unint64_t)*((unsigned __int8 *)v18 + 2) << 8) | *((unsigned __int8 *)v18 + 3);
        unsigned __int16 v45 = v17 - 4;
        unsigned __int16 v267 = v45;
        v268[0] = v18 + 2;
        unsigned int v43 = v18 + 2;
LABEL_113:
        uint64_t v92 = v263;
        unsigned __int8 v93 = *((_BYTE *)a3 + 84) + v42;
        *((_BYTE *)a3 + 84) = v93;
        a3[1] = (unsigned __int8 *)v43;
        unint64_t v94 = 1LL << (8 * v42);
        unint64_t v95 = largest_pn + (v94 >> 1);
        unint64_t v96 = v46 + (v95 & -(uint64_t)v94);
        unint64_t v97 = v95 + 1;
        if (v96 <= v94 || v96 <= v97) {
          unint64_t v94 = 0LL;
        }
        a3[14] = (unsigned __int8 *)(v96 - v94);
        if ((v38 & 1) != 0)
        {
          int v105 = v45;
          if (v45 > (unsigned __int16)(v266 - v42))
          {
            unsigned __int16 v106 = v266 - v42 - tag_size;
            goto LABEL_129;
          }

          if (v45 < tag_size)
          {
            if (!qlog_debug_enabled && (qlog_nwlog_enabled & 1) == 0)
            {
              BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR);
              if (!result) {
                return result;
              }
            }

            if (!*(void *)(v264 + 1112)) {
              return 0LL;
            }
            uint64_t v250 = _os_log_pack_size();
            v251 = (char *)&v262 - ((MEMORY[0x1895F8858](v250, v250) + 15) & 0xFFFFFFFFFFFFFFF0LL);
            _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
            uint64_t v252 = _os_log_pack_fill();
            uint64_t v253 = v264;
            v254 = quic_cid_describe((unsigned __int8 *)(*(void *)(v264 + 1112) + 38LL));
            v255 = quic_cid_describe((unsigned __int8 *)(*(void *)(v253 + 1112) + 17LL));
            *(_DWORD *)uint64_t v252 = 136447490;
            *(void *)(v252 + 4) = "quic_packet_parser_inner";
            *(_WORD *)(v252 + 12) = 2082;
            *(void *)(v252 + 14) = v253 + 976;
            *(_WORD *)(v252 + 22) = 2082;
            *(void *)(v252 + 24) = v254;
            *(_WORD *)(v252 + 32) = 2082;
            *(void *)(v252 + 34) = v255;
            *(_WORD *)(v252 + 42) = 1024;
            *(_DWORD *)(v252 + 44) = v105;
            *(_WORD *)(v252 + 48) = 1024;
            *(_DWORD *)(v252 + 50) = tag_size;
            uint64_t v54 = (uint64_t)v251;
            uint64_t v55 = 521LL;
            goto LABEL_204;
          }
        }

        else if (tag_size > v45)
        {
          if (!qlog_debug_enabled && (qlog_nwlog_enabled & 1) == 0)
          {
            BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR);
            if (!result) {
              return result;
            }
          }

          if (!*(void *)(v264 + 1112)) {
            return 0LL;
          }
          uint64_t v99 = _os_log_pack_size();
          int v100 = (char *)&v262 - ((MEMORY[0x1895F8858](v99, v99) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          uint64_t v101 = _os_log_pack_fill();
          uint64_t v102 = v264;
          uint64_t v103 = quic_cid_describe((unsigned __int8 *)(*(void *)(v264 + 1112) + 38LL));
          uint64_t v104 = quic_cid_describe((unsigned __int8 *)(*(void *)(v102 + 1112) + 17LL));
          *(_DWORD *)uint64_t v101 = 136447490;
          *(void *)(v101 + 4) = "quic_packet_parser_inner";
          *(_WORD *)(v101 + 12) = 2082;
          *(void *)(v101 + 14) = v102 + 976;
          *(_WORD *)(v101 + 22) = 2082;
          *(void *)(v101 + 24) = v103;
          *(_WORD *)(v101 + 32) = 2082;
          *(void *)(v101 + 34) = v104;
          *(_WORD *)(v101 + 42) = 1024;
          *(_DWORD *)(v101 + 44) = v45;
          *(_WORD *)(v101 + 48) = 1024;
          *(_DWORD *)(v101 + 50) = tag_size;
          uint64_t v54 = (uint64_t)v100;
          uint64_t v55 = 529LL;
          goto LABEL_204;
        }

        unsigned __int16 v106 = v45 - tag_size;
LABEL_129:
        unsigned __int16 v267 = v106;
        *((_WORD *)a3 + 44) = v106;
        a3[2] = (unsigned __int8 *)v43 + v106;
        *((_BYTE *)a3 + 87) = tag_size;
        __int16 v107 = v106 + v93;
        *((_WORD *)a3 + 45) = v107;
        *(_WORD *)uint64_t v92 = v107 + tag_size;
        if (!quic_packet_parser_open(v20, (uint64_t)a3))
        {
          *((_DWORD *)a3 + 58) |= 0x400u;
          return 1LL;
        }

        if (!((unint64_t)a3[14] >> 62))
        {
          if ((v40 & 3) != 0)
          {
            if ((qlog_debug_enabled
               || (qlog_nwlog_enabled & 1) != 0
               || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
              && *(void *)(v20 + 1112))
            {
              uint64_t v221 = _os_log_pack_size();
              v222 = (char *)&v262 - ((MEMORY[0x1895F8858](v221, v221) + 15) & 0xFFFFFFFFFFFFFFF0LL);
              _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
              uint64_t v223 = _os_log_pack_fill();
              v224 = quic_cid_describe((unsigned __int8 *)(*(void *)(v20 + 1112) + 38LL));
              v225 = quic_cid_describe((unsigned __int8 *)(*(void *)(v20 + 1112) + 17LL));
              *(_DWORD *)uint64_t v223 = 136447234;
              *(void *)(v223 + 4) = "quic_packet_parser_inner";
              *(_WORD *)(v223 + 12) = 2082;
              *(void *)(v223 + 14) = v20 + 976;
              *(_WORD *)(v223 + 22) = 2082;
              *(void *)(v223 + 24) = v224;
              *(_WORD *)(v223 + 32) = 2082;
              *(void *)(v223 + 34) = v225;
              *(_WORD *)(v223 + 42) = 2082;
              *(void *)(v223 + 44) = "reserved bits are not zero";
              qlog_internal(16, (uint64_t)v222, 558LL);
            }

            BOOL result = 0LL;
            *(void *)(v20 + 1072) = 10LL;
            *(void *)(v20 + 1080) = "reserved bits are not zero";
            return result;
          }

          quic_packet_parser_describe_header(a3);
          if (!v106)
          {
            if (!qlog_debug_enabled
              && (qlog_nwlog_enabled & 1) == 0
              && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR)
              || !*(void *)(v20 + 1112))
            {
              return 1LL;
            }

            uint64_t v115 = _os_log_pack_size();
            v263 = &v262;
            uint64_t v116 = (char *)&v262 - ((MEMORY[0x1895F8858](v115, v115) + 15) & 0xFFFFFFFFFFFFFFF0LL);
            _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
            uint64_t v117 = _os_log_pack_fill();
            uint64_t v262 = v20 + 976;
            uint64_t v118 = *(unsigned __int8 **)(v20 + 1112);
            if (quic_cid_describe_state % 3 == 2) {
              uint64_t v119 = &quic_cid_describe_cid_buf2;
            }
            else {
              uint64_t v119 = &quic_cid_describe_cid_buf3;
            }
            if (quic_cid_describe_state % 3) {
              uint64_t v120 = v119;
            }
            else {
              uint64_t v120 = &quic_cid_describe_cid_buf1;
            }
            int v121 = ++quic_cid_describe_state;
            unsigned int v122 = v118[38];
            __int128 v123 = 0uLL;
            *(_OWORD *)((char *)v120 + 25) = 0u;
            if (v122 >= 0x14) {
              uint64_t v124 = 20LL;
            }
            else {
              uint64_t v124 = v122;
            }
            *uint64_t v120 = 0uLL;
            v120[1] = 0uLL;
            if ((_DWORD)v124)
            {
              uint64_t v125 = v118 + 39;
              do
              {
                int v126 = *v125++;
                snprintf((char *)v120, 0x29uLL, "%s%02x", (const char *)v120, v126);
                --v124;
              }

              while (v124);
              uint64_t v118 = *(unsigned __int8 **)(v264 + 1112);
              int v121 = quic_cid_describe_state;
              __int128 v123 = 0uLL;
            }

            if (v121 % 3 == 2) {
              uint64_t v127 = &quic_cid_describe_cid_buf2;
            }
            else {
              uint64_t v127 = &quic_cid_describe_cid_buf3;
            }
            if (v121 % 3) {
              uint64_t v128 = v127;
            }
            else {
              uint64_t v128 = &quic_cid_describe_cid_buf1;
            }
            quic_cid_describe_unsigned int state = v121 + 1;
            if (v118[17] >= 0x14u) {
              uint64_t v129 = 20LL;
            }
            else {
              uint64_t v129 = v118[17];
            }
            *uint64_t v128 = v123;
            v128[1] = v123;
            *(_OWORD *)((char *)v128 + 25) = v123;
            if ((_DWORD)v129)
            {
              uint64_t v130 = v118 + 18;
              do
              {
                int v131 = *v130++;
                snprintf((char *)v128, 0x29uLL, "%s%02x", (const char *)v128, v131);
                --v129;
              }

              while (v129);
            }

            *(_DWORD *)uint64_t v117 = 136446978;
            *(void *)(v117 + 4) = "quic_packet_parser_inner";
            *(_WORD *)(v117 + 12) = 2082;
            *(void *)(v117 + 14) = v262;
            *(_WORD *)(v117 + 22) = 2082;
            *(void *)(v117 + 24) = v120;
            *(_WORD *)(v117 + 32) = 2082;
            *(void *)(v117 + 34) = v128;
            qlog_internal(16, (uint64_t)v116, 565LL);
            return 1LL;
          }

          while (1)
          {
            unsigned int v108 = quic_vle_decode(v268[0], v106, &v265);
            v268[0] = (_DWORD *)((char *)v268[0] + v108);
            v267 -= v108;
            BOOL v110 = v265 - 12237317 > 1 && v265 >> 1 != 6118656 || v108 == 4;
            if (!v110
              || (v265 != 172 ? (v111 = v265 == 175) : (v111 = 1), v111 ? (BOOL v112 = v108 == 2) : (BOOL v112 = 1), !v112))
            {
LABEL_194:
              *(void *)(v20 + 1072) = 10LL;
              *(void *)(v20 + 1080) = "invalid frame type encoding";
              return 0LL;
            }

            if ((v265 - 12237312 > 6 || ((1LL << v265) & 0x63) == 0) && v265 != 172 && v265 != 175)
            {
              if (v108 != 1) {
                goto LABEL_194;
              }
              if (v265 >= 0x1F)
              {
                if ((uint64_t)v265 > 12237311)
                {
                  if (v265 - 12237312 > 6 || ((1LL << v265) & 0x63) == 0)
                  {
LABEL_244:
                    if ((qlog_debug_enabled
                       || (qlog_nwlog_enabled & 1) != 0
                       || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
                      && *(void *)(v20 + 1112))
                    {
                      uint64_t v172 = _os_log_pack_size();
                      int v173 = (char *)&v262 - ((MEMORY[0x1895F8858](v172, v172) + 15) & 0xFFFFFFFFFFFFFFF0LL);
                      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
                      uint64_t v174 = _os_log_pack_fill();
                      uint64_t v175 = quic_cid_describe((unsigned __int8 *)(*(void *)(v20 + 1112) + 38LL));
                      int v176 = quic_cid_describe((unsigned __int8 *)(*(void *)(v20 + 1112) + 17LL));
                      unint64_t v177 = v265;
                      uint64_t v178 = a3[14];
                      *(_DWORD *)uint64_t v174 = 136447490;
                      *(void *)(v174 + 4) = "quic_packet_parser_inner";
                      *(_WORD *)(v174 + 12) = 2082;
                      *(void *)(v174 + 14) = v20 + 976;
                      *(_WORD *)(v174 + 22) = 2082;
                      *(void *)(v174 + 24) = v175;
                      *(_WORD *)(v174 + 32) = 2082;
                      *(void *)(v174 + 34) = v176;
                      *(_WORD *)(v174 + 42) = 2048;
                      *(void *)(v174 + 44) = v177;
                      *(_WORD *)(v174 + 52) = 2048;
                      *(void *)(v174 + 54) = v178;
                      uint64_t v54 = (uint64_t)v173;
                      uint64_t v55 = 603LL;
                      goto LABEL_204;
                    }

                    return 0LL;
                  }
                }

                else if (v265 - 48 >= 2)
                {
                  goto LABEL_244;
                }
              }
            }

            uint64_t v113 = quic_frame_create(*(void *)(v20 + 1320), v265);
            v113[12] = 0LL;
            unsigned int v114 = (unint64_t **)a3[20];
            v113[13] = (unint64_t)v114;
            char *v114 = v113;
            a3[20] = (unsigned __int8 *)(v113 + 12);
            if ((quic_frame_parse( v113,  (void *)v20,  (uint64_t)(a3 + 5),  *((unsigned __int8 *)a3 + 83),  (uint64_t)v268,  (uint64_t)&v267) & 1) == 0) {
              return 0LL;
            }
            unsigned __int16 v106 = v267;
            BOOL result = 1LL;
            if (!v267) {
              return result;
            }
          }
        }

        if (!qlog_debug_enabled && (qlog_nwlog_enabled & 1) == 0)
        {
          BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR);
          if (!result) {
            return result;
          }
        }

        if (!*(void *)(v264 + 1112)) {
          return 0LL;
        }
        uint64_t v215 = _os_log_pack_size();
        v216 = (char *)&v262 - ((MEMORY[0x1895F8858](v215, v215) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v217 = _os_log_pack_fill();
        uint64_t v218 = v264;
        v219 = quic_cid_describe((unsigned __int8 *)(*(void *)(v264 + 1112) + 38LL));
        v220 = quic_cid_describe((unsigned __int8 *)(*(void *)(v218 + 1112) + 17LL));
        *(_DWORD *)uint64_t v217 = 136446978;
        *(void *)(v217 + 4) = "quic_packet_parser_inner";
        *(_WORD *)(v217 + 12) = 2082;
        *(void *)(v217 + 14) = v218 + 976;
        *(_WORD *)(v217 + 22) = 2082;
        *(void *)(v217 + 24) = v219;
        *(_WORD *)(v217 + 32) = 2082;
        *(void *)(v217 + 34) = v220;
        uint64_t v54 = (uint64_t)v216;
        uint64_t v55 = 550LL;
        break;
      default:
        if (!qlog_debug_enabled && (qlog_nwlog_enabled & 1) == 0)
        {
          BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR);
          if (!result) {
            return result;
          }
        }

        if (!*(void *)(v20 + 1112)) {
          return 0LL;
        }
        uint64_t v74 = _os_log_pack_size();
        v263 = &v262;
        BOOL v75 = (char *)&v262 - ((MEMORY[0x1895F8858](v74, v74) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v76 = _os_log_pack_fill();
        uint64_t v262 = v20 + 976;
        uint64_t v77 = *(unsigned __int8 **)(v20 + 1112);
        if (quic_cid_describe_state % 3 == 2) {
          int v78 = &quic_cid_describe_cid_buf2;
        }
        else {
          int v78 = &quic_cid_describe_cid_buf3;
        }
        if (quic_cid_describe_state % 3) {
          char v79 = v78;
        }
        else {
          char v79 = &quic_cid_describe_cid_buf1;
        }
        int v80 = ++quic_cid_describe_state;
        unsigned int v81 = v77[38];
        __int128 v82 = 0uLL;
        *(_OWORD *)((char *)v79 + 25) = 0u;
        if (v81 >= 0x14) {
          uint64_t v83 = 20LL;
        }
        else {
          uint64_t v83 = v81;
        }
        *char v79 = 0uLL;
        v79[1] = 0uLL;
        if ((_DWORD)v83)
        {
          int v84 = v77 + 39;
          do
          {
            int v85 = *v84++;
            snprintf((char *)v79, 0x29uLL, "%s%02x", (const char *)v79, v85);
            --v83;
          }

          while (v83);
          uint64_t v77 = *(unsigned __int8 **)(v264 + 1112);
          int v80 = quic_cid_describe_state;
          __int128 v82 = 0uLL;
        }

        if (v80 % 3 == 2) {
          uint64_t v86 = &quic_cid_describe_cid_buf2;
        }
        else {
          uint64_t v86 = &quic_cid_describe_cid_buf3;
        }
        if (v80 % 3) {
          uint64_t v87 = v86;
        }
        else {
          uint64_t v87 = &quic_cid_describe_cid_buf1;
        }
        quic_cid_describe_unsigned int state = v80 + 1;
        if (v77[17] >= 0x14u) {
          uint64_t v88 = 20LL;
        }
        else {
          uint64_t v88 = v77[17];
        }
        _OWORD *v87 = v82;
        v87[1] = v82;
        *(_OWORD *)((char *)v87 + 25) = v82;
        if ((_DWORD)v88)
        {
          uint64_t v89 = v77 + 18;
          do
          {
            int v90 = *v89++;
            snprintf((char *)v87, 0x29uLL, "%s%02x", (const char *)v87, v90);
            --v88;
          }

          while (v88);
        }

        *(_DWORD *)uint64_t v76 = 136446978;
        *(void *)(v76 + 4) = "quic_packet_parser_inner";
        *(_WORD *)(v76 + 12) = 2082;
        *(void *)(v76 + 14) = v262;
        *(_WORD *)(v76 + 22) = 2082;
        *(void *)(v76 + 24) = v79;
        *(_WORD *)(v76 + 32) = 2082;
        *(void *)(v76 + 34) = v87;
        uint64_t v54 = (uint64_t)v75;
        uint64_t v55 = 493LL;
        goto LABEL_204;
    }

    goto LABEL_204;
  }

  return result;
}

void quic_packet_parser_describe_header(unsigned __int8 **a1)
{
  uint64_t v49 = *MEMORY[0x1895F89C0];
  int v1 = qlog_datapath_enabled;
  int v2 = qlog_nwlog_enabled;
  if (qlog_datapath_enabled) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = qlog_nwlog_enabled == 0;
  }
  if (v3) {
    return;
  }
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v42 = 0u;
  int v5 = *((_DWORD *)a1 + 58);
  if ((v5 & 0x100) != 0)
  {
    if (*((_WORD *)a1 + 47))
    {
      if (*(_DWORD *)a1[12] == 1)
      {
        unsigned __int16 v17 = "v1";
      }

      else
      {
        unsigned __int16 v17 = quic_version_describe_buffer;
        snprintf(quic_version_describe_buffer, 0x10uLL, "v %x", *(_DWORD *)a1[12]);
      }

      snprintf(__str, 0x80uLL, "%s%s%s", "", __str, v17);
      if (*((unsigned __int16 *)a1 + 47) >= 2u)
      {
        unint64_t v23 = 1LL;
        do
        {
          int v24 = "v1";
          if (*(_DWORD *)&a1[12][4 * v23] != 1)
          {
            snprintf(quic_version_describe_buffer, 0x10uLL, "v %x", *(_DWORD *)&a1[12][4 * v23]);
            int v24 = quic_version_describe_buffer;
          }

          snprintf(__str, 0x80uLL, "%s%s%s", ", ", __str, v24);
          ++v23;
        }

        while (v23 < *((unsigned __int16 *)a1 + 47));
      }

      int v1 = qlog_datapath_enabled;
      LOBYTE(v2) = qlog_nwlog_enabled;
    }

    if (v1 || (v2 & 1) != 0)
    {
      if (qlog_debug_enabled) {
        LOBYTE(v2) = 1;
      }
      if ((v2 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v25 = _os_log_pack_size();
        unsigned int v26 = (char *)v40 - ((MEMORY[0x1895F8858](v25, v25) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v27 = _os_log_pack_fill();
        unsigned int v28 = quic_cid_describe((unsigned __int8 *)a1 + 40);
        unsigned __int8 v29 = quic_cid_describe((unsigned __int8 *)a1 + 61);
        *(_DWORD *)uint64_t v27 = 136446978;
        *(void *)(v27 + 4) = "quic_packet_parser_describe_header";
        *(_WORD *)(v27 + 12) = 2082;
        *(void *)(v27 + 14) = v28;
        *(_WORD *)(v27 + 22) = 2082;
        *(void *)(v27 + 24) = v29;
        *(_WORD *)(v27 + 32) = 2082;
        *(void *)(v27 + 34) = __str;
        uint64_t v15 = (uint64_t)v26;
        uint64_t v16 = 186LL;
        goto LABEL_14;
      }
    }
  }

  else
  {
    int v6 = *a1;
    if ((v5 & 1) != 0)
    {
      int v18 = (*v6 >> 4) & 3;
      if (v18)
      {
        if (v18 == 3)
        {
          if (qlog_debug_enabled) {
            LOBYTE(v2) = 1;
          }
          if ((v2 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v19 = _os_log_pack_size();
            uint64_t v20 = (char *)v40 - ((MEMORY[0x1895F8858](v19, v19) + 15) & 0xFFFFFFFFFFFFFFF0LL);
            _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
            uint64_t v21 = _os_log_pack_fill();
            if (*((_DWORD *)a1 + 27) == 1)
            {
              uint64_t v22 = "v1";
            }

            else
            {
              uint64_t v22 = quic_version_describe_buffer;
              snprintf(quic_version_describe_buffer, 0x10uLL, "v %x", *((_DWORD *)a1 + 27));
            }

            __int16 v35 = quic_cid_describe((unsigned __int8 *)a1 + 40);
            uint64_t v36 = quic_cid_describe((unsigned __int8 *)a1 + 61);
            int v37 = *((unsigned __int16 *)a1 + 47);
            *(_DWORD *)uint64_t v21 = 136447234;
            *(void *)(v21 + 4) = "quic_packet_parser_describe_header";
            *(_WORD *)(v21 + 12) = 2082;
            *(void *)(v21 + 14) = v22;
            *(_WORD *)(v21 + 22) = 2082;
            *(void *)(v21 + 24) = v35;
            *(_WORD *)(v21 + 32) = 2082;
            *(void *)(v21 + 34) = v36;
            *(_WORD *)(v21 + 42) = 1024;
            *(_DWORD *)(v21 + 44) = v37;
            qlog_internal(2, (uint64_t)v20, 197LL);
          }

          return;
        }
      }

      else
      {
        snprintf(__str, 0x80uLL, "token len %hu, ", *((unsigned __int16 *)a1 + 47));
        int v1 = qlog_datapath_enabled;
        int v2 = qlog_nwlog_enabled;
      }

      if (v1 || v2)
      {
        if (qlog_debug_enabled) {
          LOBYTE(v2) = 1;
        }
        if ((v2 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v30 = _os_log_pack_size();
          v40[1] = v40;
          uint64_t v31 = (char *)v40 - ((MEMORY[0x1895F8858](v30, v30) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          uint64_t v32 = _os_log_pack_fill();
          unsigned int v33 = off_18A118568[((unint64_t)*v6 >> 4) & 3];
          if (*((_DWORD *)a1 + 27) == 1)
          {
            char v34 = "v1";
          }

          else
          {
            char v34 = quic_version_describe_buffer;
            snprintf(quic_version_describe_buffer, 0x10uLL, "v %x", *((_DWORD *)a1 + 27));
          }

          int v38 = quic_cid_describe((unsigned __int8 *)a1 + 40);
          unsigned int v39 = quic_cid_describe((unsigned __int8 *)a1 + 61);
          __os_log_helper_1_2_8_8_34_8_34_8_34_8_34_8_34_4_0_8_32_8_0( v32,  (uint64_t)v33,  (uint64_t)v34,  (uint64_t)v38,  (uint64_t)v39,  *((unsigned __int16 *)a1 + 44),  (uint64_t)__str,  (uint64_t)a1[14]);
          qlog_internal(2, (uint64_t)v31, 210LL);
        }
      }
    }

    else
    {
      if (qlog_debug_enabled) {
        LOBYTE(v2) = 1;
      }
      if ((v2 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v7 = _os_log_pack_size();
        uint64_t v8 = (char *)v40 - ((MEMORY[0x1895F8858](v7, v7) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v9 = _os_log_pack_fill();
        unsigned int v10 = *v6;
        int v11 = (v10 >> 2) & 1;
        int v12 = (v10 >> 5) & 1;
        uint64_t v13 = quic_cid_describe((unsigned __int8 *)a1 + 40);
        char v14 = a1[14];
        *(_DWORD *)uint64_t v9 = 136447234;
        *(void *)(v9 + 4) = "quic_packet_parser_describe_header";
        *(_WORD *)(v9 + 12) = 1024;
        *(_DWORD *)(v9 + 14) = v11;
        *(_WORD *)(v9 + 18) = 1024;
        *(_DWORD *)(v9 + 20) = v12;
        *(_WORD *)(v9 + 24) = 2082;
        *(void *)(v9 + 26) = v13;
        *(_WORD *)(v9 + 34) = 2048;
        *(void *)(v9 + 36) = v14;
        uint64_t v15 = (uint64_t)v8;
        uint64_t v16 = 218LL;
LABEL_14:
        qlog_internal(2, v15, v16);
      }
    }
  }

BOOL quic_packet_parser_open_header(uint64_t a1, uint64_t a2, unsigned int a3, int a4)
{
  v40[1] = *MEMORY[0x1895F89C0];
  if (*(_BYTE *)(a1 + 477) == 2) {
    quic_protector_derive_initial_secrets(*(void *)(a1 + 568), (unsigned __int8 *)(a2 + 40));
  }
  uint64_t v8 = *(void *)(a1 + 568);
  if (v8)
  {
    BOOL v9 = quic_protector_open_key_ready(v8, *(unsigned __int8 *)(a2 + 82));
    uint64_t v10 = *(unsigned __int8 *)(a2 + 82);
    if (v9 && (v10 < 4 || *(unsigned __int8 *)(a1 + 477) > 8u))
    {
      if (quic_protector_open_header(*(void *)(a1 + 568), a2, a3)) {
        return 1LL;
      }
      uint64_t v21 = *(void *)(a1 + 1280);
      BOOL v22 = __CFADD__(v21, 1LL);
      uint64_t v23 = v21 + 1;
      uint64_t v24 = v22;
      uint64_t v25 = v24 << 63 >> 63;
      *(void *)(a1 + 1280) = v23;
      int v26 = qlog_debug_enabled;
      char v27 = qlog_nwlog_enabled;
      if (v25 != v24 || v25 < 0)
      {
        if (qlog_debug_enabled) {
          char v27 = 1;
        }
        if ((v27 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
        {
          uint64_t v28 = _os_log_pack_size();
          unsigned __int8 v29 = (char *)v40 - ((MEMORY[0x1895F8858](v28, v28) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          uint64_t v30 = _os_log_pack_fill();
          uint64_t v31 = *(void *)(a1 + 1280);
          *(_DWORD *)uint64_t v30 = 136447234;
          *(void *)(v30 + 4) = "quic_packet_parser_open_header";
          *(_WORD *)(v30 + 12) = 2082;
          *(void *)(v30 + 14) = "conn->statistics.decryption_failures";
          *(_WORD *)(v30 + 22) = 2048;
          *(void *)(v30 + 24) = v31 - 1;
          *(_WORD *)(v30 + 32) = 2048;
          *(void *)(v30 + 34) = 1LL;
          *(_WORD *)(v30 + 42) = 2048;
          *(void *)(v30 + 44) = v31;
          qlog_internal(17, (uint64_t)v29, 129LL);
          int v26 = qlog_debug_enabled;
          char v27 = qlog_nwlog_enabled;
        }

        else
        {
          char v27 = 0;
          int v26 = 0;
        }

        *(void *)(a1 + 1280) = -1LL;
      }

      if (v26 || (v27 & 1) != 0 || (BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG)))
      {
        uint64_t v34 = _os_log_pack_size();
        __int16 v35 = (char *)v40 - ((MEMORY[0x1895F8858](v34, v34) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v36 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v36 = 136446210;
        *(void *)(v36 + 4) = "quic_packet_parser_open_header";
        uint64_t v15 = (uint64_t)v35;
        uint64_t v16 = 130LL;
        goto LABEL_40;
      }
    }

    else
    {
      if ((v10 | 2) != 3)
      {
        if (qlog_debug_enabled
          || (qlog_nwlog_enabled & 1) != 0
          || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v17 = _os_log_pack_size();
          int v18 = (char *)v40 - ((MEMORY[0x1895F8858](v17, v17) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          uint64_t v19 = _os_log_pack_fill();
          else {
            uint64_t v20 = off_18A1184D8[(*(_BYTE *)(a2 + 82) - 1)];
          }
          uint64_t v32 = "connected";
          unsigned int v33 = *(unsigned __int8 *)(a1 + 477);
          *(void *)(v19 + 4) = "quic_packet_parser_open_header";
          *(_DWORD *)uint64_t v19 = 136446722;
          *(_WORD *)(v19 + 12) = 2082;
          if (v33 < 9) {
            uint64_t v32 = "not connected";
          }
          *(void *)(v19 + 14) = v20;
          *(_WORD *)(v19 + 22) = 2082;
          *(void *)(v19 + 24) = v32;
          qlog_internal(2, (uint64_t)v18, 118LL);
          uint64_t v10 = *(unsigned __int8 *)(a2 + 82);
        }

        quic_crypto_queue_append( *(void *)(a1 + 32),  v10,  *(const void **)a2,  (unsigned __int16)(*(unsigned __int8 *)(a2 + 84) + (_WORD)a3),  a4);
        return 0LL;
      }

      if (qlog_debug_enabled
        || (qlog_nwlog_enabled & 1) != 0
        || (BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG)))
      {
        uint64_t v12 = _os_log_pack_size();
        uint64_t v13 = (char *)v40 - ((MEMORY[0x1895F8858](v12, v12) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v14 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v14 = 136446210;
        *(void *)(v14 + 4) = "quic_packet_parser_open_header";
        uint64_t v15 = (uint64_t)v13;
        uint64_t v16 = 109LL;
LABEL_40:
        qlog_internal(2, v15, v16);
        return 0LL;
      }
    }
  }

  else if (qlog_debug_enabled {
         || (qlog_nwlog_enabled & 1) != 0
  }
         || (BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG)))
  {
    uint64_t v37 = _os_log_pack_size();
    int v38 = (char *)v40 - ((MEMORY[0x1895F8858](v37, v37) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v39 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v39 = 136446210;
    *(void *)(v39 + 4) = "quic_packet_parser_open_header";
    uint64_t v15 = (uint64_t)v38;
    uint64_t v16 = 100LL;
    goto LABEL_40;
  }

  return result;
}

BOOL quic_packet_parser_open(uint64_t a1, uint64_t a2)
{
  v21[1] = *MEMORY[0x1895F89C0];
  unsigned int v4 = *(unsigned __int8 *)(a1 + 600);
  if (v4 >= 4)
  {
    unsigned int v5 = *(unsigned __int8 *)(a2 + 82);
    if (v5 >= 4 && v4 != v5)
    {
      if (qlog_debug_enabled
        || (qlog_nwlog_enabled & 1) != 0
        || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v17 = _os_log_pack_size();
        int v18 = (char *)v21 - ((MEMORY[0x1895F8858](v17, v17) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v19 = _os_log_pack_fill();
        else {
          uint64_t v20 = off_18A1184D8[(*(_BYTE *)(a2 + 82) - 1)];
        }
        *(_DWORD *)uint64_t v19 = 136446466;
        *(void *)(v19 + 4) = "quic_packet_parser_open";
        *(_WORD *)(v19 + 12) = 2082;
        *(void *)(v19 + 14) = v20;
        qlog_internal(2, (uint64_t)v18, 144LL);
        unsigned int v4 = *(unsigned __int8 *)(a1 + 600);
      }

      quic_protector_traffic_update(*(unsigned __int8 **)(a1 + 568), v4);
    }
  }

  BOOL v7 = quic_protector_open(*(void *)(a1 + 568), a2);
  if (!v7)
  {
    uint64_t v8 = *(void *)(a1 + 1280);
    uint64_t v9 = v8 + 1;
    uint64_t v10 = v8 == -1;
    uint64_t v11 = v10 << 63 >> 63;
    *(void *)(a1 + 1280) = v9;
    if (v11 != v10 || v11 < 0)
    {
      if (qlog_debug_enabled
        || (qlog_nwlog_enabled & 1) != 0
        || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
      {
        uint64_t v12 = _os_log_pack_size();
        uint64_t v13 = (char *)v21 - ((MEMORY[0x1895F8858](v12, v12) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v14 = _os_log_pack_fill();
        uint64_t v15 = *(void *)(a1 + 1280);
        *(_DWORD *)uint64_t v14 = 136447234;
        *(void *)(v14 + 4) = "quic_packet_parser_open";
        *(_WORD *)(v14 + 12) = 2082;
        *(void *)(v14 + 14) = "conn->statistics.decryption_failures";
        *(_WORD *)(v14 + 22) = 2048;
        *(void *)(v14 + 24) = v15 - 1;
        *(_WORD *)(v14 + 32) = 2048;
        *(void *)(v14 + 34) = 1LL;
        *(_WORD *)(v14 + 42) = 2048;
        *(void *)(v14 + 44) = v15;
        qlog_internal(17, (uint64_t)v13, 158LL);
      }

      *(void *)(a1 + 1280) = -1LL;
    }
  }

  return v7;
}

double __os_log_helper_1_2_8_8_34_8_34_8_34_8_34_8_34_4_0_8_32_8_0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8)
{
  *(void *)&double result = 136448002LL;
  *(_DWORD *)a1 = 136448002;
  *(void *)(a1 + 4) = "quic_packet_parser_describe_header";
  *(_WORD *)(a1 + 12) = 2082;
  *(void *)(a1 + 14) = a2;
  *(_WORD *)(a1 + 22) = 2082;
  *(void *)(a1 + 24) = a3;
  *(_WORD *)(a1 + 32) = 2082;
  *(void *)(a1 + 34) = a4;
  *(_WORD *)(a1 + 42) = 2082;
  *(void *)(a1 + 44) = a5;
  *(_WORD *)(a1 + 52) = 1024;
  *(_DWORD *)(a1 + 54) = a6;
  *(_WORD *)(a1 + 58) = 2080;
  *(void *)(a1 + 60) = a7;
  *(_WORD *)(a1 + 68) = 2048;
  *(void *)(a1 + 70) = a8;
  return result;
}

BOOL quic_packet_parser_prelude(uint64_t a1, char *a2, unsigned int a3, uint64_t a4)
{
  v45[1] = *MEMORY[0x1895F89C0];
  if (!a4)
  {
    if (qlog_debug_enabled
      || (qlog_nwlog_enabled & 1) != 0
      || (BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT)))
    {
      uint64_t v15 = _os_log_pack_size();
      uint64_t v16 = (char *)v45 - ((MEMORY[0x1895F8858](v15, v15) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v17 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v17 = 136446210;
      *(void *)(v17 + 4) = "quic_packet_parser_prelude";
      qlog_internal(17, (uint64_t)v16, 663LL);
      return 0LL;
    }

    return result;
  }

  *(_OWORD *)(a4 + 208) = 0u;
  *(_OWORD *)(a4 + 224) = 0u;
  *(_OWORD *)(a4 + 176) = 0u;
  *(_OWORD *)(a4 + 192) = 0u;
  *(_OWORD *)(a4 + 144) = 0u;
  *(_OWORD *)(a4 + 160) = 0u;
  *(_OWORD *)(a4 + 112) = 0u;
  *(_OWORD *)(a4 + 128) = 0u;
  *(_OWORD *)(a4 + 80) = 0u;
  *(_OWORD *)(a4 + 96) = 0u;
  *(_OWORD *)(a4 + 48) = 0u;
  *(_OWORD *)(a4 + 64) = 0u;
  *(_OWORD *)(a4 + 16) = 0u;
  *(_OWORD *)(a4 + 32) = 0u;
  *(_OWORD *)a4 = 0u;
  unsigned int v5 = *a2;
  *(_DWORD *)(a4 + 232) = (v5 >> 7) & 1;
  *(void *)a4 = a2;
  if ((v5 & 0x80000000) == 0) {
    return 1LL;
  }
  if (a3 <= 4)
  {
    if (!qlog_debug_enabled && (qlog_nwlog_enabled & 1) == 0)
    {
      BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR);
      if (!result) {
        return result;
      }
    }

    if (!*(void *)(a1 + 1112)) {
      return 0LL;
    }
    uint64_t v18 = _os_log_pack_size();
    uint64_t v19 = (char *)v45 - ((MEMORY[0x1895F8858](v18, v18) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v20 = _os_log_pack_fill();
    uint64_t v21 = quic_cid_describe((unsigned __int8 *)(*(void *)(a1 + 1112) + 38LL));
    BOOL v22 = quic_cid_describe((unsigned __int8 *)(*(void *)(a1 + 1112) + 17LL));
    *(_DWORD *)uint64_t v20 = 136446978;
    *(void *)(v20 + 4) = "quic_packet_parser_prelude";
    *(_WORD *)(v20 + 12) = 2082;
    *(void *)(v20 + 14) = a1 + 976;
    *(_WORD *)(v20 + 22) = 2082;
    *(void *)(v20 + 24) = v21;
    *(_WORD *)(v20 + 32) = 2082;
    *(void *)(v20 + 34) = v22;
    uint64_t v23 = (uint64_t)v19;
    uint64_t v24 = 673LL;
LABEL_43:
    qlog_internal(16, v23, v24);
    return 0LL;
  }

  *(_DWORD *)(a4 + 108) = bswap32(*(_DWORD *)(a2 + 1));
  if (a3 == 5)
  {
    if (!qlog_debug_enabled && (qlog_nwlog_enabled & 1) == 0)
    {
      BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR);
      if (!result) {
        return result;
      }
    }

    if (!*(void *)(a1 + 1112)) {
      return 0LL;
    }
    uint64_t v25 = _os_log_pack_size();
    int v26 = (char *)v45 - ((MEMORY[0x1895F8858](v25, v25) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v27 = _os_log_pack_fill();
    uint64_t v28 = quic_cid_describe((unsigned __int8 *)(*(void *)(a1 + 1112) + 38LL));
    unsigned __int8 v29 = quic_cid_describe((unsigned __int8 *)(*(void *)(a1 + 1112) + 17LL));
    *(_DWORD *)uint64_t v27 = 136446978;
    *(void *)(v27 + 4) = "quic_packet_parser_prelude";
    *(_WORD *)(v27 + 12) = 2082;
    *(void *)(v27 + 14) = a1 + 976;
    *(_WORD *)(v27 + 22) = 2082;
    *(void *)(v27 + 24) = v28;
    *(_WORD *)(v27 + 32) = 2082;
    *(void *)(v27 + 34) = v29;
    uint64_t v23 = (uint64_t)v26;
    uint64_t v24 = 675LL;
    goto LABEL_43;
  }

  unsigned int v7 = a2[5];
  unsigned __int16 v8 = a3 - 6;
  uint64_t v9 = (unsigned __int8 *)(a2 + 6);
  if (!a2[5]) {
    goto LABEL_8;
  }
  if (v7 > v8)
  {
    if (!qlog_debug_enabled && (qlog_nwlog_enabled & 1) == 0)
    {
      BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR);
      if (!result) {
        return result;
      }
    }

    if (!*(void *)(a1 + 1112)) {
      return 0LL;
    }
    uint64_t v35 = _os_log_pack_size();
    uint64_t v36 = (char *)v45 - ((MEMORY[0x1895F8858](v35, v35) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v37 = _os_log_pack_fill();
    int v38 = quic_cid_describe((unsigned __int8 *)(*(void *)(a1 + 1112) + 38LL));
    uint64_t v39 = quic_cid_describe((unsigned __int8 *)(*(void *)(a1 + 1112) + 17LL));
    *(_DWORD *)uint64_t v37 = 136446978;
    *(void *)(v37 + 4) = "quic_packet_parser_prelude";
    *(_WORD *)(v37 + 12) = 2082;
    *(void *)(v37 + 14) = a1 + 976;
    *(_WORD *)(v37 + 22) = 2082;
    *(void *)(v37 + 24) = v38;
    *(_WORD *)(v37 + 32) = 2082;
    *(void *)(v37 + 34) = v39;
    uint64_t v23 = (uint64_t)v36;
    uint64_t v24 = 678LL;
    goto LABEL_43;
  }

  v8 -= v7;
  uint64_t v10 = &v9[a2[5]];
  quic_cid_read(v9, a2[5], (_BYTE *)(a4 + 40));
  uint64_t v9 = v10;
LABEL_8:
  if (!v8)
  {
    if (!qlog_debug_enabled && (qlog_nwlog_enabled & 1) == 0)
    {
      BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR);
      if (!result) {
        return result;
      }
    }

    if (!*(void *)(a1 + 1112)) {
      return 0LL;
    }
    uint64_t v30 = _os_log_pack_size();
    uint64_t v31 = (char *)v45 - ((MEMORY[0x1895F8858](v30, v30) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v32 = _os_log_pack_fill();
    unsigned int v33 = quic_cid_describe((unsigned __int8 *)(*(void *)(a1 + 1112) + 38LL));
    uint64_t v34 = quic_cid_describe((unsigned __int8 *)(*(void *)(a1 + 1112) + 17LL));
    *(_DWORD *)uint64_t v32 = 136446978;
    *(void *)(v32 + 4) = "quic_packet_parser_prelude";
    *(_WORD *)(v32 + 12) = 2082;
    *(void *)(v32 + 14) = a1 + 976;
    *(_WORD *)(v32 + 22) = 2082;
    *(void *)(v32 + 24) = v33;
    *(_WORD *)(v32 + 32) = 2082;
    *(void *)(v32 + 34) = v34;
    uint64_t v23 = (uint64_t)v31;
    uint64_t v24 = 681LL;
    goto LABEL_43;
  }

  unsigned int v13 = *v9;
  uint64_t v11 = v9 + 1;
  unsigned int v12 = v13;
  if (!v13) {
    return 1LL;
  }
  if (v12 <= (unsigned __int16)(v8 - 1))
  {
    quic_cid_read(v11, v12, (_BYTE *)(a4 + 61));
    return 1LL;
  }

  if (qlog_debug_enabled
    || (qlog_nwlog_enabled & 1) != 0
    || (BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR)))
  {
    if (*(void *)(a1 + 1112))
    {
      uint64_t v40 = _os_log_pack_size();
      char v41 = (char *)v45 - ((MEMORY[0x1895F8858](v40, v40) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v42 = _os_log_pack_fill();
      __int128 v43 = quic_cid_describe((unsigned __int8 *)(*(void *)(a1 + 1112) + 38LL));
      __int128 v44 = quic_cid_describe((unsigned __int8 *)(*(void *)(a1 + 1112) + 17LL));
      *(_DWORD *)uint64_t v42 = 136446978;
      *(void *)(v42 + 4) = "quic_packet_parser_prelude";
      *(_WORD *)(v42 + 12) = 2082;
      *(void *)(v42 + 14) = a1 + 976;
      *(_WORD *)(v42 + 22) = 2082;
      *(void *)(v42 + 24) = v43;
      *(_WORD *)(v42 + 32) = 2082;
      *(void *)(v42 + 34) = v44;
      uint64_t v23 = (uint64_t)v41;
      uint64_t v24 = 684LL;
      goto LABEL_43;
    }

    return 0LL;
  }

  return result;
}

void __quic_init_block_invoke()
{
  if (qlog_init_once != -1) {
    dispatch_once(&qlog_init_once, &__block_literal_global_1608);
  }
}

uint64_t quic_vle_decode(_DWORD *a1, unsigned int a2, void *a3)
{
  v27[1] = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    if (!qlog_debug_enabled && (qlog_nwlog_enabled & 1) == 0)
    {
      uint64_t result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT);
      if (!(_DWORD)result) {
        return result;
      }
    }

    uint64_t v6 = _os_log_pack_size();
    unsigned int v7 = (char *)v27 - ((MEMORY[0x1895F8858](v6, v6) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136446210;
    *(void *)(v8 + 4) = "quic_vle_decode";
    int v9 = 17;
    uint64_t v10 = (uint64_t)v7;
    uint64_t v11 = 70LL;
    goto LABEL_27;
  }

  if (!a2)
  {
    if (!qlog_debug_enabled && (qlog_nwlog_enabled & 1) == 0)
    {
      uint64_t result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT);
      if (!(_DWORD)result) {
        return result;
      }
    }

    uint64_t v12 = _os_log_pack_size();
    unsigned int v13 = (char *)v27 - ((MEMORY[0x1895F8858](v12, v12) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 136446210;
    *(void *)(v14 + 4) = "quic_vle_decode";
    int v9 = 17;
    uint64_t v10 = (uint64_t)v13;
    uint64_t v11 = 71LL;
    goto LABEL_27;
  }

  if (!a3)
  {
    if (!qlog_debug_enabled && (qlog_nwlog_enabled & 1) == 0)
    {
      uint64_t result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT);
      if (!(_DWORD)result) {
        return result;
      }
    }

    uint64_t v15 = _os_log_pack_size();
    uint64_t v16 = (char *)v27 - ((MEMORY[0x1895F8858](v15, v15) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v17 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v17 = 136446210;
    *(void *)(v17 + 4) = "quic_vle_decode";
    int v9 = 17;
    uint64_t v10 = (uint64_t)v16;
    uint64_t v11 = 72LL;
    goto LABEL_27;
  }

  uint64_t v3 = *(unsigned __int8 *)a1;
  unsigned int v4 = v3 >> 6;
  if (v3 >> 6 == 2)
  {
    if (a2 > 3)
    {
      *a3 = bswap32(*a1 & 0xFFFFFF7F);
      return 4LL;
    }

    if (!qlog_debug_enabled && (qlog_nwlog_enabled & 1) == 0)
    {
      uint64_t result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR);
      if (!(_DWORD)result) {
        return result;
      }
    }

    uint64_t v18 = _os_log_pack_size();
    uint64_t v19 = (char *)v27 - ((MEMORY[0x1895F8858](v18, v18) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v20 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v20 = 136446210;
    *(void *)(v20 + 4) = "quic_vle_decode";
    int v9 = 16;
    uint64_t v10 = (uint64_t)v19;
    uint64_t v11 = 95LL;
    goto LABEL_27;
  }

  if (v4 == 1)
  {
    if (a2 > 1)
    {
      *a3 = bswap32(*(_WORD *)a1 & 0xFFBF) >> 16;
      return 2LL;
    }

    if (!qlog_debug_enabled && (qlog_nwlog_enabled & 1) == 0)
    {
      uint64_t result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR);
      if (!(_DWORD)result) {
        return result;
      }
    }

    uint64_t v21 = _os_log_pack_size();
    BOOL v22 = (char *)v27 - ((MEMORY[0x1895F8858](v21, v21) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v23 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v23 = 136446210;
    *(void *)(v23 + 4) = "quic_vle_decode";
    int v9 = 16;
    uint64_t v10 = (uint64_t)v22;
    uint64_t v11 = 87LL;
LABEL_27:
    qlog_internal(v9, v10, v11);
    return 0LL;
  }

  if (!v4)
  {
    *a3 = v3;
    return 1LL;
  }

  if (a2 > 7)
  {
    *a3 = bswap64(*(void *)a1 & 0xFFFFFFFFFFFFFF3FLL);
    return 8LL;
  }

  if (qlog_debug_enabled
    || (qlog_nwlog_enabled & 1) != 0
    || (uint64_t result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR), (_DWORD)result))
  {
    uint64_t v24 = _os_log_pack_size();
    uint64_t v25 = (char *)v27 - ((MEMORY[0x1895F8858](v24, v24) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v26 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v26 = 136446210;
    *(void *)(v26 + 4) = "quic_vle_decode";
    int v9 = 16;
    uint64_t v10 = (uint64_t)v25;
    uint64_t v11 = 103LL;
    goto LABEL_27;
  }

  return result;
}

const char *quic_close_code_describe(uint64_t a1)
{
  int v1 = "NO_ERROR";
  switch(a1)
  {
    case 0LL:
      return v1;
    case 1LL:
      int v1 = "INTERNAL_ERROR";
      break;
    case 2LL:
      int v1 = "SERVER_BUSY";
      break;
    case 3LL:
      int v1 = "FLOW_CONTROL_ERROR";
      break;
    case 4LL:
      int v1 = "STREAM_LIMIT_ERROR";
      break;
    case 5LL:
      int v1 = "STREAM_STATE_ERROR";
      break;
    case 6LL:
      int v1 = "FINAL_SIZE_ERROR";
      break;
    case 7LL:
      int v1 = "FRAME_ENCODING_ERROR";
      break;
    case 8LL:
      int v1 = "TRANSPORT_PARAMETER_ERROR";
      break;
    case 9LL:
      int v1 = "CONNECTION_ID_LIMIT_ERROR";
      break;
    case 10LL:
      int v1 = "PROTOCOL_VIOLATION";
      break;
    case 11LL:
      int v1 = "INVALID_TOKEN";
      break;
    case 12LL:
      int v1 = "APPLICATION_ERROR";
      break;
    case 13LL:
      int v1 = "CRYPTO_BUFFER_EXCEEDED";
      break;
    case 14LL:
    case 15LL:
      goto LABEL_6;
    case 16LL:
      int v1 = "NO_VIABLE_PATH";
      break;
    default:
      if (a1 == 256)
      {
        int v1 = "CRYPTO_ERROR";
      }

      else if (a1 == 47617)
      {
        int v1 = "MP_PROTOCOL_VIOLATION";
      }

      else
      {
LABEL_6:
        int v1 = quic_close_code_describe_buffer;
        snprintf(quic_close_code_describe_buffer, 0x10uLL, "0x%llx", a1);
      }

      break;
  }

  return v1;
}

const char *quic_frame_type_describe(uint64_t a1)
{
  uint64_t result = "PADDING";
  switch(a1)
  {
    case 0LL:
      return result;
    case 1LL:
      uint64_t result = "PING";
      break;
    case 2LL:
      uint64_t result = "ACK";
      break;
    case 3LL:
      uint64_t result = "ACK_ECN";
      break;
    case 4LL:
      uint64_t result = "RESET_STREAM";
      break;
    case 5LL:
      uint64_t result = "STOP_SENDING";
      break;
    case 6LL:
      uint64_t result = "CRYPTO";
      break;
    case 7LL:
      uint64_t result = "NEW_TOKEN";
      break;
    case 8LL:
    case 9LL:
    case 10LL:
    case 11LL:
    case 12LL:
    case 13LL:
    case 14LL:
    case 15LL:
    case 31LL:
    case 32LL:
    case 33LL:
    case 34LL:
    case 35LL:
    case 36LL:
    case 37LL:
    case 38LL:
    case 39LL:
    case 40LL:
    case 41LL:
    case 42LL:
    case 43LL:
    case 44LL:
    case 45LL:
    case 46LL:
    case 47LL:
    case 50LL:
    case 51LL:
    case 52LL:
    case 53LL:
    case 54LL:
    case 55LL:
    case 56LL:
    case 57LL:
    case 58LL:
    case 59LL:
    case 60LL:
    case 61LL:
    case 62LL:
    case 63LL:
    case 64LL:
    case 65LL:
    case 66LL:
    case 67LL:
    case 68LL:
    case 69LL:
    case 70LL:
    case 71LL:
    case 72LL:
    case 73LL:
    case 74LL:
    case 75LL:
    case 76LL:
    case 77LL:
    case 78LL:
    case 79LL:
    case 80LL:
    case 81LL:
    case 82LL:
    case 83LL:
    case 84LL:
    case 85LL:
    case 86LL:
    case 87LL:
    case 88LL:
    case 89LL:
    case 90LL:
    case 91LL:
    case 92LL:
    case 93LL:
    case 94LL:
    case 95LL:
    case 96LL:
    case 97LL:
    case 98LL:
    case 99LL:
    case 100LL:
    case 101LL:
    case 102LL:
    case 103LL:
    case 104LL:
    case 105LL:
    case 106LL:
    case 107LL:
    case 108LL:
    case 109LL:
    case 110LL:
    case 111LL:
    case 112LL:
    case 113LL:
    case 114LL:
    case 115LL:
    case 116LL:
    case 117LL:
    case 118LL:
    case 119LL:
    case 120LL:
    case 121LL:
    case 122LL:
    case 123LL:
    case 124LL:
    case 125LL:
    case 126LL:
    case 127LL:
    case 128LL:
    case 129LL:
    case 130LL:
    case 131LL:
    case 132LL:
    case 133LL:
    case 134LL:
    case 135LL:
    case 136LL:
    case 137LL:
    case 138LL:
    case 139LL:
    case 140LL:
    case 141LL:
    case 142LL:
    case 143LL:
    case 144LL:
    case 145LL:
    case 146LL:
    case 147LL:
    case 148LL:
    case 149LL:
    case 150LL:
    case 151LL:
    case 152LL:
    case 153LL:
    case 154LL:
    case 155LL:
    case 156LL:
    case 157LL:
    case 158LL:
    case 159LL:
    case 160LL:
    case 161LL:
    case 162LL:
    case 163LL:
    case 164LL:
    case 165LL:
    case 166LL:
    case 167LL:
    case 168LL:
    case 169LL:
    case 170LL:
    case 171LL:
    case 173LL:
    case 174LL:
LABEL_30:
      if ((a1 & 0xFFFFFFFFFFFFFFF8LL) == 8) {
        uint64_t result = "STREAM";
      }
      else {
        uint64_t result = "???";
      }
      break;
    case 16LL:
      uint64_t result = "MAX_DATA";
      break;
    case 17LL:
      uint64_t result = "MAX_STREAM_DATA";
      break;
    case 18LL:
      uint64_t result = "MAX_STREAMS_BIDI";
      break;
    case 19LL:
      uint64_t result = "MAX_STREAMS_UNI";
      break;
    case 20LL:
      uint64_t result = "DATA_BLOCKED";
      break;
    case 21LL:
      uint64_t result = "STREAM_DATA_BLOCKED";
      break;
    case 22LL:
      uint64_t result = "STREAMS_BLOCKED_BIDI";
      break;
    case 23LL:
      uint64_t result = "STREAMS_BLOCKED_UNI";
      break;
    case 24LL:
      uint64_t result = "NEW_CONNECTION_ID";
      break;
    case 25LL:
      uint64_t result = "RETIRE_CONNECTION_ID";
      break;
    case 26LL:
      uint64_t result = "PATH_CHALLENGE";
      break;
    case 27LL:
      uint64_t result = "PATH_RESPONSE";
      break;
    case 28LL:
      uint64_t result = "CONNECTION_CLOSE";
      break;
    case 29LL:
      uint64_t result = "APPLICATION_CLOSE";
      break;
    case 30LL:
      uint64_t result = "HANDSHAKE_DONE";
      break;
    case 48LL:
    case 49LL:
      uint64_t result = "DATAGRAM";
      break;
    case 172LL:
      uint64_t result = "IMMEDIATE_ACK";
      break;
    case 175LL:
      uint64_t result = "ACK_FREQUENCY";
      break;
    default:
      switch(a1)
      {
        case 12237312LL:
          uint64_t result = "ACK_MP";
          break;
        case 12237313LL:
          uint64_t result = "ACK_MP_ECN";
          break;
        case 12237317LL:
          uint64_t result = "PATH_ABANDON";
          break;
        case 12237318LL:
          uint64_t result = "PATH_STATUS";
          break;
        default:
          goto LABEL_30;
      }

      break;
  }

  return result;
}

uint64_t quic_dispatch_data_copyout(dispatch_data_s *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2000000000LL;
  uint64_t v18 = 0LL;
  v14[0] = 0LL;
  v14[1] = v14;
  void v14[2] = 0x2000000000LL;
  v14[3] = a2;
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      goto LABEL_14;
    }

    uint64_t v5 = _os_log_pack_size();
    uint64_t v6 = (char *)applier - ((MEMORY[0x1895F8858](v5, v5) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v7 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v7 = 136446210;
    *(void *)(v7 + 4) = "quic_dispatch_data_copyout";
    uint64_t v8 = (uint64_t)v6;
    uint64_t v9 = 239LL;
    goto LABEL_13;
  }

  if (!a2)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      goto LABEL_14;
    }

    uint64_t v10 = _os_log_pack_size();
    uint64_t v11 = (char *)applier - ((MEMORY[0x1895F8858](v10, v10) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v12 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v12 = 136446210;
    *(void *)(v12 + 4) = "quic_dispatch_data_copyout";
    uint64_t v8 = (uint64_t)v11;
    uint64_t v9 = 240LL;
LABEL_13:
    qlog_internal(17, v8, v9);
LABEL_14:
    uint64_t v3 = 0LL;
    goto LABEL_4;
  }

  applier[0] = MEMORY[0x1895F87A8];
  applier[1] = 0x40000000LL;
  applier[2] = __quic_dispatch_data_copyout_block_invoke;
  applier[3] = &unk_18A118548;
  applier[4] = &v15;
  applier[5] = v14;
  applier[6] = a3;
  dispatch_data_apply(a1, applier);
  uint64_t v3 = v16[3];
LABEL_4:
  _Block_object_dispose(v14, 8);
  _Block_object_dispose(&v15, 8);
  return v3;
}

BOOL __quic_dispatch_data_copyout_block_invoke(void *a1, int a2, int a3, void *__src, size_t a5)
{
  unint64_t v5 = a1[6];
  unint64_t v6 = *(void *)(*(void *)(a1[4] + 8LL) + 24LL);
  if (v5 - v6 >= a5) {
    size_t v7 = a5;
  }
  else {
    size_t v7 = v5 - v6;
  }
  if (v7)
  {
    memcpy((void *)(*(void *)(*(void *)(a1[5] + 8LL) + 24LL) + v6), __src, v7);
    *(void *)(*(void *)(a1[4] + 8LL) + 24LL) += v7;
    unint64_t v6 = *(void *)(*(void *)(a1[4] + 8LL) + 24LL);
    unint64_t v5 = a1[6];
  }

  return v6 < v5;
}

uint64_t quic_memory_size()
{
  v4[1] = *MEMORY[0x1895F89C0];
  v4[0] = 8LL;
  uint64_t result = quic_memory_size_memsize;
  if (!quic_memory_size_memsize)
  {
    if (sysctlbyname("hw.memsize", &quic_memory_size_memsize, v4, 0LL, 0LL) < 0)
    {
      if (qlog_debug_enabled
        || (qlog_nwlog_enabled & 1) != 0
        || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
      {
        uint64_t v1 = _os_log_pack_size();
        int v2 = (char *)v4 - ((MEMORY[0x1895F8858](v1, v1) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v3 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v3 = 136446210;
        *(void *)(v3 + 4) = "quic_memory_size";
        qlog_internal(16, (uint64_t)v2, 267LL);
      }

      uint64_t result = 0LL;
      quic_memory_size_memint size = 0LL;
    }

    else
    {
      return quic_memory_size_memsize;
    }
  }

  return result;
}

double quic_rtt_init(uint64_t a1)
{
  v6[1] = *MEMORY[0x1895F89C0];
  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v2 = _os_log_pack_size();
    uint64_t v3 = (char *)v6 - ((MEMORY[0x1895F8858](v2, v2) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v4 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v4 = 136446466;
    *(void *)(v4 + 4) = "quic_rtt_init";
    *(_WORD *)(v4 + 12) = 2048;
    *(void *)(v4 + 14) = a1;
    qlog_internal(2, (uint64_t)v3, 61LL);
  }

  *(void *)a1 = 333000LL;
  *(void *)(a1 + 32) = 0xFFFFFFFFLL;
  memset_pattern16((void *)(a1 + 40), &unk_187C04310, 0x50uLL);
  *(_OWORD *)(a1 + 16) = xmmword_187C042D0;
  *(void *)&double result = 0xFFFFFFFFLL;
  *(_OWORD *)(a1 + 128) = xmmword_187C042E0;
  *(_BYTE *)(a1 + 161) &= ~1u;
  return result;
}

void _quic_rtt_destroy(void *a1)
{
  v5[1] = *MEMORY[0x1895F89C0];
  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v2 = _os_log_pack_size();
    uint64_t v3 = (char *)v5 - ((MEMORY[0x1895F8858](v2, v2) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v4 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v4 = 136446466;
    *(void *)(v4 + 4) = "_quic_rtt_destroy";
    *(_WORD *)(v4 + 12) = 2048;
    *(void *)(v4 + 14) = a1;
    qlog_internal(2, (uint64_t)v3, 94LL);
  }

  free(a1);
}

void quic_rtt_setup_cached_rtt(uint64_t a1, uint64_t a2)
{
  v17[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if (a2)
    {
      uint64_t v4 = (unsigned int *)(a1 + 148);
      unint64_t v5 = (unsigned int *)(a1 + 144);
      unint64_t v6 = (_DWORD *)(a1 + 152);
      nw_path_get_rtt_values();
      if ((*(_BYTE *)(a1 + 156) & 4) != 0)
      {
        unsigned int v7 = *v5;
        if (*v5)
        {
          if (v7 >= *v4)
          {
            LODWORD(v2) = *v6;
            if (qlog_debug_enabled
              || (qlog_nwlog_enabled & 1) != 0
              || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))
            {
              uint64_t v8 = _os_log_pack_size();
              uint64_t v9 = (char *)v17 - ((MEMORY[0x1895F8858](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0LL);
              _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
              uint64_t v10 = _os_log_pack_fill();
              *(_DWORD *)uint64_t v10 = 136446722;
              *(void *)(v10 + 4) = "quic_rtt_setup_cached_rtt";
              *(_WORD *)(v10 + 12) = 2048;
              *(double *)(v10 + 14) = (double)v7 * 0.03125;
              *(_WORD *)(v10 + 22) = 2048;
              *(double *)(v10 + 24) = (double)v2 * 0.0625;
              int v11 = 1;
              uint64_t v12 = (uint64_t)v9;
              uint64_t v13 = 116LL;
LABEL_10:
              qlog_internal(v11, v12, v13);
            }
          }
        }
      }
    }
  }

  else if (qlog_debug_enabled {
         || (qlog_nwlog_enabled & 1) != 0
  }
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    uint64_t v14 = _os_log_pack_size();
    uint64_t v15 = (char *)v17 - ((MEMORY[0x1895F8858](v14, v14) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136446210;
    *(void *)(v16 + 4) = "quic_rtt_setup_cached_rtt";
    int v11 = 17;
    uint64_t v12 = (uint64_t)v15;
    uint64_t v13 = 101LL;
    goto LABEL_10;
  }

void quic_rtt_process_new_sample( uint64x2_t *a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  v57[1] = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }

    uint64_t v31 = _os_log_pack_size();
    uint64_t v32 = (char *)v57 - ((MEMORY[0x1895F8858](v31, v31) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v33 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v33 = 136446210;
    *(void *)(v33 + 4) = "quic_rtt_process_new_sample";
    uint64_t v29 = (uint64_t)v32;
    uint64_t v30 = 165LL;
LABEL_49:
    qlog_internal(17, v29, v30);
    return;
  }

  unint64_t v7 = quic_time_delta(a2, a3);
  unint64_t v8 = v7;
  a1->i64[0] = v7;
  if ((a1[10].i8[1] & 1) == 0)
  {
    a1[1].i64[0] = v7;
    a1[1].i64[1] = v7 >> 1;
    a1[2].i64[0] = v7;
    update_base_rtt((uint64_t)a1, v7, a3);
    a1->i64[1] = a1->i64[0];
    a1[10].i8[1] |= 1u;
    char v9 = qlog_nwlog_enabled;
    if (qlog_datapath_enabled || qlog_nwlog_enabled)
    {
      if (qlog_debug_enabled) {
        char v9 = 1;
      }
      if ((v9 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v34 = _os_log_pack_size();
        uint64_t v35 = (char *)v57 - ((MEMORY[0x1895F8858](v34, v34) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v36 = _os_log_pack_fill();
        double v37 = (double)a1[1].u64[0] * 0.001;
        double v38 = (double)a1[1].u64[1] * 0.001;
        *(_DWORD *)uint64_t v36 = 136446722;
        *(void *)(v36 + 4) = "quic_rtt_process_new_sample";
        *(_WORD *)(v36 + 12) = 2048;
        *(double *)(v36 + 14) = v37;
        *(_WORD *)(v36 + 22) = 2048;
        *(double *)(v36 + 24) = v38;
        qlog_internal(2, (uint64_t)v35, 180LL);
      }
    }

    if (__quic_signpost_is_enabled__quic_signposts_once_4712[0] != -1) {
      dispatch_once(__quic_signpost_is_enabled__quic_signposts_once_4712, &__block_literal_global_4713);
    }
    return;
  }

  if (v7 < a1[2].i64[0])
  {
    char v10 = qlog_nwlog_enabled;
    if (qlog_datapath_enabled || qlog_nwlog_enabled)
    {
      if (qlog_debug_enabled) {
        char v10 = 1;
      }
      if ((v10 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v48 = _os_log_pack_size();
        uint64_t v49 = (char *)v57 - ((MEMORY[0x1895F8858](v48, v48) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v50 = _os_log_pack_fill();
        double v51 = (double)a1->u64[0] * 0.001;
        double v52 = (double)a1[2].u64[0] * 0.001;
        *(_DWORD *)uint64_t v50 = 136446722;
        *(void *)(v50 + 4) = "quic_rtt_process_new_sample";
        *(_WORD *)(v50 + 12) = 2048;
        *(double *)(v50 + 14) = v51;
        *(_WORD *)(v50 + 22) = 2048;
        *(double *)(v50 + 24) = v52;
        qlog_internal(2, (uint64_t)v49, 189LL);
        unint64_t v8 = a1->i64[0];
      }
    }

    a1[2].i64[0] = v8;
    if (__quic_signpost_is_enabled__quic_signposts_once_4712[0] == -1)
    {
      if (!__quic_signpost_is_enabled__quic_signposts_enabled_4714) {
        goto LABEL_17;
      }
    }

    else
    {
      dispatch_once(__quic_signpost_is_enabled__quic_signposts_once_4712, &__block_literal_global_4713);
      if (!__quic_signpost_is_enabled__quic_signposts_enabled_4714) {
        goto LABEL_17;
      }
    }
  }

uint64_t update_base_rtt(uint64_t result, unint64_t a2, unint64_t a3)
{
  if ((*(_BYTE *)(result + 161) & 1) == 0)
  {
    *(_BYTE *)(result + 160) = 0;
    *(void *)(result + 40) = a2;
    *(void *)(result + 120) = a3;
    *(void *)(result + 128) = a2;
    return result;
  }

  unint64_t v3 = *(void *)(result + 120);
  BOOL v4 = a3 >= v3;
  unint64_t v5 = a3 - v3;
  if (v5 != 0 && v4 && v5 > 0x3938700)
  {
    int v6 = *(unsigned __int8 *)(result + 160);
    unsigned __int16 v7 = v6 + v5 / 0x3938700;
    unsigned int v8 = v6 + 1;
    if (v6 + 1 < v7)
    {
      unsigned int v9 = v7 + ~v6;
      if (v9 >= 2)
      {
        unsigned int v10 = v9 & 0xFFFFFFFE;
        unsigned int v11 = v6 + 2;
        unsigned int v12 = v8;
        unsigned int v13 = v9 & 0xFFFFFFFE;
        do
        {
          *(void *)(result + 40 + 8LL * (v12 % 0xA)) = 0xFFFFFFFFLL;
          *(void *)(result + 40 + 8LL * (v11 % 0xA)) = 0xFFFFFFFFLL;
          v12 += 2;
          v11 += 2;
          v13 -= 2;
        }

        while (v13);
        if (v9 == v10) {
          goto LABEL_15;
        }
        v8 += v10;
      }

      unint64_t v14 = v8;
      uint64_t v15 = result + 8LL * v8;
      unsigned int v16 = v8 - v7;
      uint64_t v17 = v15 + 40;
      do
      {
        *(void *)(v17 - 80 * (v14 / 0xA)) = 0xFFFFFFFFLL;
        v17 += 8LL;
        ++v14;
        BOOL v4 = __CFADD__(v16++, 1);
      }

      while (!v4);
    }

uint64_t ____quic_signpost_is_enabled_block_invoke_4724()
{
  uint64_t result = nw_settings_get_signposts_enabled();
  __quic_signpost_is_enabled__quic_signposts_enabled_4714 = result;
  return result;
}

void quic_rtt_set_remote_max_ack_delay(uint64_t a1, unint64_t a2)
{
  v10[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if ((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1
      || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v4 = _os_log_pack_size();
      unint64_t v5 = (char *)v10 - ((MEMORY[0x1895F8858](v4, v4) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v6 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v6 = 136446466;
      *(void *)(v6 + 4) = "quic_rtt_set_remote_max_ack_delay";
      *(_WORD *)(v6 + 12) = 2048;
      *(double *)(v6 + 14) = (double)a2 * 0.001;
      qlog_internal(2, (uint64_t)v5, 245LL);
    }

    *(void *)(a1 + 136) = a2;
  }

  else if ((qlog_debug_enabled != 0) | qlog_nwlog_enabled & 1 {
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  }
  {
    uint64_t v7 = _os_log_pack_size();
    unsigned int v8 = (char *)v10 - ((MEMORY[0x1895F8858](v7, v7) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v9 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v9 = 136446210;
    *(void *)(v9 + 4) = "quic_rtt_set_remote_max_ack_delay";
    qlog_internal(17, (uint64_t)v8, 242LL);
  }

uint64_t quic_rtt_get_remote_max_ack_delay(uint64_t a1)
{
  v5[1] = *MEMORY[0x1895F89C0];
  if (a1) {
    return *(void *)(a1 + 136);
  }
  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    uint64_t v2 = _os_log_pack_size();
    unint64_t v3 = (char *)v5 - ((MEMORY[0x1895F8858](v2, v2) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v4 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v4 = 136446210;
    *(void *)(v4 + 4) = "quic_rtt_get_remote_max_ack_delay";
    qlog_internal(17, (uint64_t)v3, 252LL);
  }

  return 0LL;
}

uint64_t quic_rtt_get_smoothed_rtt(uint64_t a1)
{
  v4[1] = *MEMORY[0x1895F89C0];
  if (a1) {
    return *(void *)(a1 + 16);
  }
  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    _os_log_pack_size();
    uint64_t v2 = (char *)v4 - ((MEMORY[0x1895F8858]() + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v3 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v3 = 136446210;
    *(void *)(v3 + 4) = "quic_rtt_get_smoothed_rtt";
    qlog_internal(17, (uint64_t)v2, 260LL);
  }

  return 0LL;
}

uint64_t quic_rtt_get_rtt_variance(uint64_t a1)
{
  v4[1] = *MEMORY[0x1895F89C0];
  if (a1) {
    return *(void *)(a1 + 24);
  }
  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    _os_log_pack_size();
    uint64_t v2 = (char *)v4 - ((MEMORY[0x1895F8858]() + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v3 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v3 = 136446210;
    *(void *)(v3 + 4) = "quic_rtt_get_rtt_variance";
    qlog_internal(17, (uint64_t)v2, 268LL);
  }

  return 0LL;
}

uint64_t quic_rtt_get_min_rtt(uint64_t a1)
{
  v4[1] = *MEMORY[0x1895F89C0];
  if (a1) {
    return *(void *)(a1 + 32);
  }
  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    _os_log_pack_size();
    uint64_t v2 = (char *)v4 - ((MEMORY[0x1895F8858]() + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v3 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v3 = 136446210;
    *(void *)(v3 + 4) = "quic_rtt_get_min_rtt";
    qlog_internal(17, (uint64_t)v2, 276LL);
  }

  return 0LL;
}

void quic_rtt_set_min_rtt(uint64_t a1, uint64_t a2)
{
  v5[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    *(void *)(a1 + 32) = a2;
  }

  else if (qlog_debug_enabled {
         || (qlog_nwlog_enabled & 1) != 0
  }
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    uint64_t v2 = _os_log_pack_size();
    uint64_t v3 = (char *)v5 - ((MEMORY[0x1895F8858](v2, v2) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v4 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v4 = 136446210;
    *(void *)(v4 + 4) = "quic_rtt_set_min_rtt";
    qlog_internal(17, (uint64_t)v3, 284LL);
  }

uint64_t quic_rtt_get_latest_rtt(uint64_t a1)
{
  v5[1] = *MEMORY[0x1895F89C0];
  if (a1) {
    return *(void *)a1;
  }
  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    uint64_t v2 = _os_log_pack_size();
    uint64_t v3 = (char *)v5 - ((MEMORY[0x1895F8858](v2, v2) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v4 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v4 = 136446210;
    *(void *)(v4 + 4) = "quic_rtt_get_latest_rtt";
    qlog_internal(17, (uint64_t)v3, 292LL);
  }

  return 0LL;
}

void quic_rtt_get_initial_rtt(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if (a2) {
      *a2 = 333000LL;
    }
    if (a3) {
      *a3 = 166500LL;
    }
    if (!quic_disable_cached_rtt && (*(_BYTE *)(a1 + 156) & 4) != 0)
    {
      uint64_t v3 = *(unsigned int *)(a1 + 144);
      if ((_DWORD)v3)
      {
        if (v3 >= *(_DWORD *)(a1 + 148))
        {
          else {
            unint64_t v4 = 333000LL;
          }
          if (a2)
          {
            *a2 = v4;
            char v5 = qlog_nwlog_enabled;
            if (qlog_datapath_enabled || qlog_nwlog_enabled)
            {
              if (qlog_debug_enabled) {
                char v5 = 1;
              }
              uint64_t v31 = a3;
              uint64_t v32 = a1;
              if ((v5 & 1) != 0
                || (unint64_t v30 = a2,
                    BOOL v14 = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG),
                    a2 = v30,
                    a3 = v31,
                    BOOL v15 = v14,
                    a1 = v32,
                    v15))
              {
                unsigned int v16 = a2;
                uint64_t v17 = _os_log_pack_size();
                unint64_t v18 = v4;
                int8x16_t v19 = (char *)&v30 - ((MEMORY[0x1895F8858](v17, v17) + 15) & 0xFFFFFFFFFFFFFFF0LL);
                _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
                uint64_t v20 = _os_log_pack_fill();
                double v21 = (double)*v16 * 0.001;
                *(_DWORD *)uint64_t v20 = 136446466;
                *(void *)(v20 + 4) = "quic_rtt_get_initial_rtt";
                *(_WORD *)(v20 + 12) = 2048;
                *(double *)(v20 + 14) = v21;
                uint64_t v22 = (uint64_t)v19;
                unint64_t v4 = v18;
                qlog_internal(2, v22, 330LL);
                a3 = v31;
                a1 = v32;
              }
            }
          }

          if (a3)
          {
            uint64_t v6 = *(unsigned int *)(a1 + 152);
            if ((_DWORD)v6)
            {
              if (v4 < 0x514C8)
              {
                *a3 = 62 * v6;
                char v7 = qlog_nwlog_enabled;
                if (qlog_datapath_enabled || qlog_nwlog_enabled)
                {
                  if (qlog_debug_enabled) {
                    char v7 = 1;
                  }
                  if ((v7 & 1) != 0
                    || (unint64_t v23 = a3, v24 = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG), a3 = v23, v24))
                  {
                    int8x8_t v25 = a3;
                    uint64_t v26 = _os_log_pack_size();
                    int8x8_t v27 = (char *)&v30 - ((MEMORY[0x1895F8858](v26, v26) + 15) & 0xFFFFFFFFFFFFFFF0LL);
                    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
                    uint64_t v28 = _os_log_pack_fill();
                    double v29 = (double)*v25 * 0.001;
                    *(_DWORD *)uint64_t v28 = 136446466;
                    *(void *)(v28 + 4) = "quic_rtt_get_initial_rtt";
                    *(_WORD *)(v28 + 12) = 2048;
                    *(double *)(v28 + 14) = v29;
                    int v11 = 2;
                    uint64_t v12 = (uint64_t)v27;
                    uint64_t v13 = 337LL;
                    goto LABEL_26;
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  else if (qlog_debug_enabled {
         || (qlog_nwlog_enabled & 1) != 0
  }
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    uint64_t v8 = _os_log_pack_size();
    uint64_t v9 = (char *)&v30 - ((MEMORY[0x1895F8858](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v10 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v10 = 136446210;
    *(void *)(v10 + 4) = "quic_rtt_get_initial_rtt";
    int v11 = 17;
    uint64_t v12 = (uint64_t)v9;
    uint64_t v13 = 306LL;
LABEL_26:
    qlog_internal(v11, v12, v13);
  }

BOOL quic_rtt_has_initial_measurement(uint64_t a1)
{
  v4[1] = *MEMORY[0x1895F89C0];
  if (a1) {
    return *(_BYTE *)(a1 + 161) & 1;
  }
  if (qlog_debug_enabled
    || (qlog_nwlog_enabled & 1) != 0
    || (BOOL result = os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT)))
  {
    _os_log_pack_size();
    uint64_t v2 = (char *)v4 - ((MEMORY[0x1895F8858]() + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v3 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v3 = 136446210;
    *(void *)(v3 + 4) = "quic_rtt_has_initial_measurement";
    qlog_internal(17, (uint64_t)v2, 351LL);
    return 0LL;
  }

  return result;
}

void quic_shorthand_process_packet(uint64_t a1, uint64_t a2, int a3)
{
  __int16 v19 = 0;
  int v5 = *(_DWORD *)(a2 + 232);
  if ((v5 & 0x200) != 0)
  {
    char v6 = 6;
  }

  else if ((v5 & 0x100) != 0)
  {
    char v6 = 0;
  }

  else
  {
    char v6 = *(_BYTE *)(a2 + 82);
  }

  char v20 = v6;
  unint64_t v7 = *(void *)(a2 + 112) & 0x3FFFFFFFFFFFFFFFLL | ((unint64_t)(v5 & 1) << 62);
  unint64_t v8 = 0x8000000000000000LL;
  if (!a3) {
    unint64_t v8 = 0LL;
  }
  unint64_t v21 = v7 | v8;
  uint64_t v9 = mach_continuous_time();
  if (timebase_info_once != -1) {
    dispatch_once(&timebase_info_once, &__block_literal_global_397);
  }
  unsigned int v10 = (timebase_info_info * v9 / dword_18C4D003C / 0x3E8) / 0x3E8;
  if (*(_DWORD *)a1) {
    __int16 v19 = nw_log_ms_to_delta();
  }
  if ((*(_BYTE *)(a1 + 18896) & 1) == 0) {
    *(_DWORD *)a1 = v10;
  }
  nw_log_ring_append();
  uint64_t v11 = *(void *)(a2 + 152);
  if (v11)
  {
    uint64_t v12 = MEMORY[0x1895F87A8];
    while (2)
    {
      __int128 v18 = 0u;
      memset(&v17[5], 0, 32);
      v17[5] = *(void *)v11;
      switch(v17[5])
      {
        case 0LL:
          LOWORD(v17[6]) = *(_WORD *)(v11 + 18);
          goto LABEL_29;
        case 1LL:
          goto LABEL_22;
        case 2LL:
        case 3LL:
          goto LABEL_20;
        case 4LL:
          *(_OWORD *)&v17[6] = *(_OWORD *)(v11 + 16);
          void v17[8] = *(void *)(v11 + 32);
          goto LABEL_29;
        case 5LL:
          v17[7] = *(void *)(v11 + 24);
LABEL_28:
          v17[6] = *(void *)(v11 + 16);
          goto LABEL_29;
        case 6LL:
          *(_OWORD *)&v17[6] = *(_OWORD *)(v11 + 24);
          goto LABEL_29;
        default:
          if ((unint64_t)(v17[5] - 12237312LL) >= 2)
          {
LABEL_22:
            if ((unint64_t)(v17[5] - 8LL) > 6)
            {
              switch(v17[5])
              {
                case 0x10LL:
                case 0x12LL:
                case 0x13LL:
                case 0x14LL:
                case 0x16LL:
                case 0x17LL:
                case 0x19LL:
                  goto LABEL_28;
                case 0x11LL:
                case 0x15LL:
                case 0x18LL:
                case 0x1CLL:
                case 0x1DLL:
                  *(_OWORD *)&v17[6] = *(_OWORD *)(v11 + 16);
                  break;
                case 0x1ALL:
                case 0x1BLL:
                case 0x1ELL:
                case 0x1FLL:
                case 0x20LL:
                case 0x21LL:
                case 0x22LL:
                case 0x23LL:
                case 0x24LL:
                case 0x25LL:
                case 0x26LL:
                case 0x27LL:
                case 0x28LL:
                case 0x29LL:
                case 0x2ALL:
                case 0x2BLL:
                case 0x2CLL:
                case 0x2DLL:
                case 0x2ELL:
                case 0x2FLL:
                  break;
                case 0x30LL:
                case 0x31LL:
                  uint64_t v15 = *(void *)(v11 + 40);
                  v17[6] = *(void *)(v11 + 24);
                  v17[7] = v15;
                  break;
                default:
                  if (v17[5] == 175LL)
                  {
                    *(_OWORD *)&v17[6] = *(_OWORD *)(v11 + 16);
                    uint64_t v16 = *(void *)(v11 + 40) & 1LL;
                    void v17[8] = *(void *)(v11 + 32);
                    *(void *)&__int128 v18 = v16;
                  }

                  break;
              }
            }

            else
            {
              uint64_t v13 = *(void *)(v11 + 24);
              *(_OWORD *)&v17[7] = *(_OWORD *)(v11 + 32);
              unint64_t v14 = v13 & 0x7FFFFFFFFFFFFFFFLL | ((unint64_t)*(unsigned __int8 *)(v11 + 16) << 63);
              v17[5] = 8LL;
              v17[6] = v14;
            }
          }

          else
          {
LABEL_20:
            v17[6] = *(void *)(v11 + 32);
            *(_OWORD *)&v17[7] = *(_OWORD *)(v11 + 48);
            *(void *)&__int128 v18 = *(void *)(v11 + 64);
            if (v17[5] >> 1 == 6118656LL) {
              *((void *)&v18 + 1) = *(void *)(v11 + 24);
            }
          }

uint64_t __quic_shorthand_process_packet_block_invoke()
{
  return 1LL;
}

void quic_shorthand_describe_entry(int a1, uint64_t a2, uint64_t a3, char *a4, size_t a5)
{
  v28[1] = *MEMORY[0x1895F89C0];
  if (!a2)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }

    uint64_t v17 = _os_log_pack_size();
    __int128 v18 = (char *)v28 - ((MEMORY[0x1895F8858](v17, v17) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v19 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v19 = 136446210;
    *(void *)(v19 + 4) = "quic_shorthand_describe_entry";
    uint64_t v20 = (uint64_t)v18;
    uint64_t v21 = 534LL;
LABEL_65:
    qlog_internal(17, v20, v21);
    return;
  }

  if (!a4)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }

    uint64_t v22 = _os_log_pack_size();
    unint64_t v23 = (char *)v28 - ((MEMORY[0x1895F8858](v22, v22) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v24 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v24 = 136446210;
    *(void *)(v24 + 4) = "quic_shorthand_describe_entry";
    uint64_t v20 = (uint64_t)v23;
    uint64_t v21 = 535LL;
    goto LABEL_65;
  }

  if (!a5)
  {
    if (!qlog_debug_enabled
      && (qlog_nwlog_enabled & 1) == 0
      && !os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
    {
      return;
    }

    uint64_t v25 = _os_log_pack_size();
    uint64_t v26 = (char *)v28 - ((MEMORY[0x1895F8858](v25, v25) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v27 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v27 = 136446210;
    *(void *)(v27 + 4) = "quic_shorthand_describe_entry";
    uint64_t v20 = (uint64_t)v26;
    uint64_t v21 = 536LL;
    goto LABEL_65;
  }

  bzero(a4, a5);
  if (a1 == 1)
  {
    switch(a3)
    {
      case 48LL:
        if (a5 >= 3)
        {
          *(_WORD *)a4 = 2313;
          size_t v13 = a5 - 2;
          if (v13 >= 3)
          {
            *((_WORD *)a4 + 1) = 63;
            uint64_t v14 = *(void *)a2;
            if (*(uint64_t *)a2 > 12237311)
            {
              if ((unint64_t)(v14 - 12237312) < 2)
              {
                snprintf(a4 + 2, v13, "ACK_MP[space_id=%llu, largest=%llu]");
              }

              else if (v14 == 12237317)
              {
                snprintf(a4 + 2, v13, "PATH_ABANDON[id_type=%llu, id=%llu, code=%llu]");
              }

              else if (v14 == 12237318)
              {
                snprintf(a4 + 2, v13, "PATH_STATUS[id_type=%llu, id=%llu, seq=%llu val=%llu]");
              }
            }

            else
            {
              switch(v14)
              {
                case 0LL:
                  snprintf(a4 + 2, v13, "PADDING[%d]");
                  break;
                case 1LL:
                case 7LL:
                case 26LL:
                case 27LL:
                case 30LL:
                case 172LL:
                  quic_frame_type_describe(v14);
                  snprintf(a4 + 2, v13, "%s");
                  break;
                case 2LL:
                case 3LL:
                  snprintf(a4 + 2, v13, "ACK[%llu]");
                  break;
                case 4LL:
                  snprintf(a4 + 2, v13, "RESET_STREAM[id=%llu, code=%llu, fs=%llu]");
                  break;
                case 5LL:
                  snprintf(a4 + 2, v13, "STOP_SENDING[%llu, code=%llu]");
                  break;
                case 6LL:
                  snprintf(a4 + 2, v13, "CRYPTO[%llu;%llu]");
                  break;
                case 16LL:
                  snprintf(a4 + 2, v13, "MAX_DATA[%llu]");
                  break;
                case 17LL:
                  snprintf(a4 + 2, v13, "MAX_STREAM_DATA[id=%llu, %llu]");
                  break;
                case 18LL:
                  snprintf(a4 + 2, v13, "MAX_STREAMS_BIDI[%llu]");
                  break;
                case 19LL:
                  snprintf(a4 + 2, v13, "MAX_STREAMS_UNI[%llu]");
                  break;
                case 20LL:
                  snprintf(a4 + 2, v13, "DATA_BLOCKED[%llu]");
                  break;
                case 21LL:
                  snprintf(a4 + 2, v13, "STREAM_DATA_BLOCKED[id=%llu, %llu]");
                  break;
                case 22LL:
                  snprintf(a4 + 2, v13, "STREAMS_BLOCKED_BIDI[%llu]");
                  break;
                case 23LL:
                  snprintf(a4 + 2, v13, "STREAMS_BLOCKED_UNI[%llu]");
                  break;
                case 24LL:
                  snprintf(a4 + 2, v13, "NEW_CONNECTION_ID[seq=%llu, retire=%llu]");
                  break;
                case 25LL:
                  snprintf(a4 + 2, v13, "RETIRE_CONNECTION_ID[%llu]");
                  break;
                case 28LL:
                case 29LL:
                  quic_frame_type_describe(v14);
                  snprintf(a4 + 2, v13, "%s[code=%llu, type=%llu]");
                  break;
                case 48LL:
                case 49LL:
                  snprintf(a4 + 2, v13, "D%llu[%llu]");
                  break;
                case 175LL:
                  snprintf(a4 + 2, v13, "ACK_FREQUENCY[seq=%llu, threshold=%llu, delay=%llu, ignore_order=%llu]");
                  break;
                default:
                  break;
              }
            }
          }
        }

        break;
      case 16LL:
        snprintf(a4, a5, "\t\t\t(%llu, %llu)");
        break;
      case 11LL:
        else {
          unsigned int v10 = "rcv";
        }
        unsigned int v11 = nw_log_delta_to_ms();
        uint64_t v12 = *(void *)(a2 + 3);
        if ((v12 & 0x4000000000000000LL) != 0)
        {
          unint64_t v15 = *(unsigned __int8 *)(a2 + 2);
          if (v15 > 6) {
            uint64_t v16 = "???";
          }
          else {
            uint64_t v16 = (&off_18A1185E8)[v15];
          }
          snprintf(a4, a5, "%s %4u.%.03us LH<%s, %llu>", v10, v11 / 0x3E8, v11 % 0x3E8, v16, v12 & 0x3FFFFFFFFFFFFFFFLL);
        }

        else
        {
          snprintf(a4, a5, "%s %4u.%.03us SH<%llu>");
        }

        break;
      default:
        snprintf(a4, a5, "<invalid entry length %zu>");
        break;
    }
  }

  else
  {
    snprintf(a4, a5, "<invalid version %u>");
  }

uint64_t CCCryptorChaCha20()
{
  return MEMORY[0x1895F8098]();
}

uint64_t CCCryptorChaCha20Poly1305OneshotDecrypt()
{
  return MEMORY[0x1895F80A0]();
}

uint64_t CCCryptorChaCha20Poly1305OneshotEncrypt()
{
  return MEMORY[0x1895F80A8]();
}

CCCryptorStatus CCCryptorCreate( CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, CCCryptorRef *cryptorRef)
{
  return MEMORY[0x1895F80B0](*(void *)&op, *(void *)&alg, *(void *)&options, key, keyLength, iv, cryptorRef);
}

CCCryptorStatus CCCryptorCreateWithMode( CCOperation op, CCMode mode, CCAlgorithm alg, CCPadding padding, const void *iv, const void *key, size_t keyLength, const void *tweak, size_t tweakLength, int numRounds, CCModeOptions options, CCCryptorRef *cryptorRef)
{
  return MEMORY[0x1895F80B8]( *(void *)&op,  *(void *)&mode,  *(void *)&alg,  *(void *)&padding,  iv,  key,  keyLength,  tweak);
}

uint64_t CCCryptorGCMAddAAD()
{
  return MEMORY[0x1895F80D0]();
}

uint64_t CCCryptorGCMDecrypt()
{
  return MEMORY[0x1895F80D8]();
}

uint64_t CCCryptorGCMEncrypt()
{
  return MEMORY[0x1895F80E0]();
}

uint64_t CCCryptorGCMFinalize()
{
  return MEMORY[0x1895F80E8]();
}

uint64_t CCCryptorGCMOneshotDecrypt()
{
  return MEMORY[0x1895F80F0]();
}

uint64_t CCCryptorGCMOneshotEncrypt()
{
  return MEMORY[0x1895F80F8]();
}

uint64_t CCCryptorGCMReset()
{
  return MEMORY[0x1895F8100]();
}

uint64_t CCCryptorGCMSetIV()
{
  return MEMORY[0x1895F8108]();
}

CCCryptorStatus CCCryptorRelease(CCCryptorRef cryptorRef)
{
  return MEMORY[0x1895F8120](cryptorRef);
}

CCCryptorStatus CCCryptorReset(CCCryptorRef cryptorRef, const void *iv)
{
  return MEMORY[0x1895F8128](cryptorRef, iv);
}

CCCryptorStatus CCCryptorUpdate( CCCryptorRef cryptorRef, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x1895F8130](cryptorRef, dataIn, dataInLength, dataOut, dataOutAvailable, dataOutMoved);
}

uint64_t CCHKDFExpand()
{
  return MEMORY[0x1895F8198]();
}

uint64_t CCHKDFExtract()
{
  return MEMORY[0x1895F81A0]();
}

void CCHmacFinal(CCHmacContext *ctx, void *macOut)
{
}

void CCHmacInit(CCHmacContext *ctx, CCHmacAlgorithm algorithm, const void *key, size_t keyLength)
{
}

void CCHmacUpdate(CCHmacContext *ctx, const void *data, size_t dataLength)
{
}

uint64_t CCKDFParametersCreateHkdf()
{
  return MEMORY[0x1895F81E8]();
}

uint64_t CCKDFParametersDestroy()
{
  return MEMORY[0x1895F81F0]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x189602D30](cf);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x189602F68](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue( CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x189602F98](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue( CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x189602FA0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x189603468](alloc, cStr, *(void *)&encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1896034F8](theString, buffer, bufferSize, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x189603590]();
}

void NSLog(NSString *format, ...)
{
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1895F8720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1895F8918](*(void *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1895F8930]();
}

uint64_t __nw_create_backtrace_string()
{
  return MEMORY[0x189608E40]();
}

uint64_t __nwlog_fault()
{
  return MEMORY[0x189608E50]();
}

uint64_t __nwlog_handle_composed()
{
  return MEMORY[0x189608E58]();
}

uint64_t __nwlog_is_datapath_logging_enabled()
{
  return MEMORY[0x189608E60]();
}

uint64_t __nwlog_obj()
{
  return MEMORY[0x189608E68]();
}

uint64_t __nwlog_override_fd()
{
  return MEMORY[0x189608E70]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_pack_fill()
{
  return MEMORY[0x1895F8DD0]();
}

uint64_t _os_log_pack_size()
{
  return MEMORY[0x1895F8DD8]();
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1895F8DE0]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1895F94C0]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1895F94D8](*(void *)&__upper_bound);
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x1895F95D0](a1, *(void *)&a2);
}

char **__cdecl backtrace_symbols(void *const *a1, int a2)
{
  return (char **)MEMORY[0x1895F95E0](a1, *(void *)&a2);
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

double cbrt(double a1)
{
  return result;
}

uint64_t cc_clear()
{
  return MEMORY[0x1895F9748]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

BOOL dispatch_data_apply(dispatch_data_t data, dispatch_data_applier_t applier)
{
  return MEMORY[0x1895FABE8](data, applier);
}

dispatch_data_t dispatch_data_create( const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1895FABF8](buffer, size, queue, destructor);
}

dispatch_data_t dispatch_data_create_map(dispatch_data_t data, const void **buffer_ptr, size_t *size_ptr)
{
  return (dispatch_data_t)MEMORY[0x1895FAC10](data, buffer_ptr, size_ptr);
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x1895FAC28](data);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(uint64_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1895FADF0](value);
}

uint64_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1895FAE00](dsema);
}

uint64_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1895FAE08](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1895FAEE8](when, delta);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1895FB360](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1895FB370](*(void *)&a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1895FB4C8](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1895FB538](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1895FB628]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1895FB638]();
}

char *__cdecl index(const char *a1, int a2)
{
  return (char *)MEMORY[0x1895FB810](a1, *(void *)&a2);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x1895FB838](*(void *)&a1, a2, a3, *(void *)&a4);
}

int isatty(int a1)
{
  return MEMORY[0x1895FB868](*(void *)&a1);
}

uint64_t kdebug_is_enabled()
{
  return MEMORY[0x1895FB8B0]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1895FB8C0]();
}

double log2(double a1)
{
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1895FBA98]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1895FBAB0]();
}

uint64_t mach_get_times()
{
  return MEMORY[0x1895FBAC8]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1895FBBF8](info);
}

kern_return_t mach_wait_until(uint64_t deadline)
{
  return MEMORY[0x1895FBC68](deadline);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1895FBE48](__b, *(void *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

uint64_t network_config_get_BOOL_setting()
{
  return MEMORY[0x189608F68]();
}

uint64_t network_config_get_int64_setting()
{
  return MEMORY[0x189608F70]();
}

uint64_t network_config_get_quic_l4s_enabled()
{
  return MEMORY[0x189608F78]();
}

uint64_t network_config_get_string_setting()
{
  return MEMORY[0x189608F80]();
}

uint64_t network_config_setting_exists()
{
  return MEMORY[0x189608FA0]();
}

uint64_t nw_array_append()
{
  return MEMORY[0x189609060]();
}

void nw_connection_cancel(nw_connection_t connection)
{
}

uint64_t nw_connection_copy_protocol_metadata_on_queue()
{
  return MEMORY[0x1896091A0]();
}

void nw_connection_force_cancel(nw_connection_t connection)
{
}

uint64_t nw_connection_get_id()
{
  return MEMORY[0x189609200]();
}

void nw_connection_set_queue(nw_connection_t connection, dispatch_queue_t queue)
{
}

void nw_connection_set_state_changed_handler( nw_connection_t connection, nw_connection_state_changed_handler_t handler)
{
}

void nw_connection_start(nw_connection_t connection)
{
}

uint64_t nw_connection_state_to_string()
{
  return MEMORY[0x189609350]();
}

nw_endpoint_t nw_endpoint_create_address(const sockaddr *address)
{
  return (nw_endpoint_t)MEMORY[0x189609510](address);
}

const sockaddr *__cdecl nw_endpoint_get_address(nw_endpoint_t endpoint)
{
  return (const sockaddr *)MEMORY[0x189609538](endpoint);
}

uint64_t nw_endpoint_get_address_family()
{
  return MEMORY[0x189609540]();
}

uint64_t nw_endpoint_get_logging_description()
{
  return MEMORY[0x189609560]();
}

nw_endpoint_type_t nw_endpoint_get_type(nw_endpoint_t endpoint)
{
  return MEMORY[0x189609580](endpoint);
}

uint64_t nw_endpoint_is_equal()
{
  return MEMORY[0x189609588]();
}

uint64_t nw_error_create_posix_error()
{
  return MEMORY[0x1896095A0]();
}

int nw_error_get_error_code(nw_error_t error)
{
  return MEMORY[0x1896095A8](error);
}

nw_error_domain_t nw_error_get_error_domain(nw_error_t error)
{
  return MEMORY[0x1896095B0](error);
}

uint64_t nw_frame_array_append()
{
  return MEMORY[0x189609610]();
}

uint64_t nw_frame_array_append_array()
{
  return MEMORY[0x189609618]();
}

uint64_t nw_frame_array_first()
{
  return MEMORY[0x189609620]();
}

uint64_t nw_frame_array_foreach()
{
  return MEMORY[0x189609630]();
}

uint64_t nw_frame_array_init()
{
  return MEMORY[0x189609638]();
}

uint64_t nw_frame_array_is_empty()
{
  return MEMORY[0x189609650]();
}

uint64_t nw_frame_array_prepend()
{
  return MEMORY[0x189609670]();
}

uint64_t nw_frame_array_remove()
{
  return MEMORY[0x189609680]();
}

uint64_t nw_frame_check_validity()
{
  return MEMORY[0x189609698]();
}

uint64_t nw_frame_claim()
{
  return MEMORY[0x1896096A8]();
}

uint64_t nw_frame_create()
{
  return MEMORY[0x1896096C0]();
}

uint64_t nw_frame_finalize()
{
  return MEMORY[0x1896096D0]();
}

uint64_t nw_frame_get_buffer()
{
  return MEMORY[0x1896096E0]();
}

uint64_t nw_frame_get_external_data()
{
  return MEMORY[0x1896096F0]();
}

uint64_t nw_frame_reset()
{
  return MEMORY[0x189609710]();
}

uint64_t nw_frame_set_external_data()
{
  return MEMORY[0x189609728]();
}

uint64_t nw_frame_unclaimed_bytes()
{
  return MEMORY[0x189609750]();
}

uint64_t nw_frame_unclaimed_length()
{
  return MEMORY[0x189609760]();
}

uint64_t nw_frame_uses_external_data()
{
  return MEMORY[0x189609768]();
}

uint32_t nw_interface_get_index(nw_interface_t interface)
{
  return MEMORY[0x189609800](interface);
}

uint64_t nw_interface_get_mtu()
{
  return MEMORY[0x189609808]();
}

const char *__cdecl nw_interface_get_name(nw_interface_t interface)
{
  return (const char *)MEMORY[0x189609818](interface);
}

uint64_t nw_link_get_local_congestion_info()
{
  return MEMORY[0x189609898]();
}

uint64_t nw_log_delta_to_ms()
{
  return MEMORY[0x189609900]();
}

uint64_t nw_log_ms_to_delta()
{
  return MEMORY[0x189609908]();
}

uint64_t nw_log_ring_append()
{
  return MEMORY[0x189609910]();
}

uint64_t nw_log_ring_copyout()
{
  return MEMORY[0x189609918]();
}

uint64_t nw_parameters_copy_context()
{
  return MEMORY[0x189609998]();
}

nw_protocol_stack_t nw_parameters_copy_default_protocol_stack(nw_parameters_t parameters)
{
  return (nw_protocol_stack_t)MEMORY[0x1896099A0](parameters);
}

uint64_t nw_parameters_set_server_mode()
{
  return MEMORY[0x189609C68]();
}

uint64_t nw_path_copy_endpoint()
{
  return MEMORY[0x189609CF8]();
}

uint64_t nw_path_get_mtu()
{
  return MEMORY[0x189609E38]();
}

uint64_t nw_path_get_rtt_values()
{
  return MEMORY[0x189609E58]();
}

uint64_t nw_path_is_direct()
{
  return MEMORY[0x189609EA0]();
}

BOOL nw_path_uses_interface_type(nw_path_t path, nw_interface_type_t interface_type)
{
  return MEMORY[0x189609F10](path, *(void *)&interface_type);
}

uint64_t nw_protocol_copy_qpod_definition()
{
  return MEMORY[0x189609FF0]();
}

uint64_t nw_protocol_copy_quic_connection_definition()
{
  return MEMORY[0x189609FF8]();
}

uint64_t nw_protocol_copy_quic_stream_definition()
{
  return MEMORY[0x18960A008]();
}

uint64_t nw_protocol_copy_swift_tls_definition()
{
  return MEMORY[0x18960A010]();
}

nw_protocol_definition_t nw_protocol_copy_tls_definition(void)
{
  return (nw_protocol_definition_t)MEMORY[0x18960A020]();
}

uint64_t nw_protocol_create_inbound_data()
{
  return MEMORY[0x18960A040]();
}

uint64_t nw_protocol_data_access_buffer()
{
  return MEMORY[0x18960A048]();
}

uint64_t nw_protocol_data_copy_outbound_subdata()
{
  return MEMORY[0x18960A050]();
}

uint64_t nw_protocol_data_get_ecn_flag()
{
  return MEMORY[0x18960A058]();
}

uint64_t nw_protocol_data_get_size()
{
  return MEMORY[0x18960A060]();
}

uint64_t nw_protocol_data_set_compression_generation_count()
{
  return MEMORY[0x18960A068]();
}

uint64_t nw_protocol_data_set_ecn_flag()
{
  return MEMORY[0x18960A070]();
}

uint64_t nw_protocol_data_trim()
{
  return MEMORY[0x18960A078]();
}

uint64_t nw_protocol_definition_set_copy_data_transfer_snapshot()
{
  return MEMORY[0x18960A098]();
}

uint64_t nw_protocol_definition_set_copy_establishment_report()
{
  return MEMORY[0x18960A0A0]();
}

uint64_t nw_protocol_definition_set_copy_metadata()
{
  return MEMORY[0x18960A0A8]();
}

uint64_t nw_protocol_definition_set_copy_quic_info()
{
  return MEMORY[0x18960A0B0]();
}

uint64_t nw_protocol_definition_set_custom_flow_map_key_size()
{
  return MEMORY[0x18960A0B8]();
}

uint64_t nw_protocol_definition_set_destroy()
{
  return MEMORY[0x18960A0C0]();
}

uint64_t nw_protocol_definition_set_fallback_changed_handler()
{
  return MEMORY[0x18960A0C8]();
}

uint64_t nw_protocol_definition_set_flow_state_allocator()
{
  return MEMORY[0x18960A0D0]();
}

uint64_t nw_protocol_definition_set_globals_allocator()
{
  return MEMORY[0x18960A0D8]();
}

uint64_t nw_protocol_definition_set_handle_error()
{
  return MEMORY[0x18960A0E0]();
}

uint64_t nw_protocol_definition_set_handle_inbound()
{
  return MEMORY[0x18960A0E8]();
}

uint64_t nw_protocol_definition_set_handle_outbound()
{
  return MEMORY[0x18960A0F0]();
}

uint64_t nw_protocol_definition_set_inbound_events()
{
  return MEMORY[0x18960A0F8]();
}

uint64_t nw_protocol_definition_set_initialize()
{
  return MEMORY[0x18960A100]();
}

uint64_t nw_protocol_definition_set_instance_state_allocator()
{
  return MEMORY[0x18960A108]();
}

uint64_t nw_protocol_definition_set_link_congestion_state_update()
{
  return MEMORY[0x18960A110]();
}

uint64_t nw_protocol_definition_set_link_state_update()
{
  return MEMORY[0x18960A118]();
}

uint64_t nw_protocol_definition_set_maximum_message_size_update()
{
  return MEMORY[0x18960A120]();
}

uint64_t nw_protocol_definition_set_message_size_handler()
{
  return MEMORY[0x18960A128]();
}

uint64_t nw_protocol_definition_set_multipath()
{
  return MEMORY[0x18960A138]();
}

uint64_t nw_protocol_definition_set_outbound_events()
{
  return MEMORY[0x18960A158]();
}

uint64_t nw_protocol_definition_set_path_changed_handler()
{
  return MEMORY[0x18960A160]();
}

uint64_t nw_protocol_definition_set_probe_connectivity_update()
{
  return MEMORY[0x18960A168]();
}

uint64_t nw_protocol_definition_set_start()
{
  return MEMORY[0x18960A170]();
}

uint64_t nw_protocol_definition_set_stop()
{
  return MEMORY[0x18960A178]();
}

uint64_t nw_protocol_definition_set_supports_discontiguous_data()
{
  return MEMORY[0x18960A180]();
}

uint64_t nw_protocol_definition_set_traffic_mgmt_update()
{
  return MEMORY[0x18960A188]();
}

uint64_t nw_protocol_establishment_report_create()
{
  return MEMORY[0x18960A1C8]();
}

uint64_t nw_protocol_establishment_report_set_client_accurate_ecn_state()
{
  return MEMORY[0x18960A1D0]();
}

uint64_t nw_protocol_establishment_report_set_l4s_enabled()
{
  return MEMORY[0x18960A1D8]();
}

uint64_t nw_protocol_implementation_finalize_pending_frames()
{
  return MEMORY[0x18960A248]();
}

uint64_t nw_protocol_instance_access_flow_state()
{
  return MEMORY[0x18960A270]();
}

uint64_t nw_protocol_instance_access_globals()
{
  return MEMORY[0x18960A278]();
}

uint64_t nw_protocol_instance_access_state()
{
  return MEMORY[0x18960A280]();
}

uint64_t nw_protocol_instance_add_inbound()
{
  return MEMORY[0x18960A288]();
}

uint64_t nw_protocol_instance_add_new_flow()
{
  return MEMORY[0x18960A290]();
}

uint64_t nw_protocol_instance_add_outbound()
{
  return MEMORY[0x18960A298]();
}

uint64_t nw_protocol_instance_assert_fallback_agent()
{
  return MEMORY[0x18960A2A0]();
}

uint64_t nw_protocol_instance_async()
{
  return MEMORY[0x18960A2A8]();
}

uint64_t nw_protocol_instance_async_if_needed()
{
  return MEMORY[0x18960A2B0]();
}

uint64_t nw_protocol_instance_clear_flow_for_key()
{
  return MEMORY[0x18960A2B8]();
}

uint64_t nw_protocol_instance_copy_association()
{
  return MEMORY[0x18960A2C0]();
}

uint64_t nw_protocol_instance_copy_endpoint()
{
  return MEMORY[0x18960A2C8]();
}

uint64_t nw_protocol_instance_copy_interface_for_path()
{
  return MEMORY[0x18960A2D0]();
}

uint64_t nw_protocol_instance_copy_local_cid_for_path()
{
  return MEMORY[0x18960A2D8]();
}

uint64_t nw_protocol_instance_copy_options()
{
  return MEMORY[0x18960A2E0]();
}

uint64_t nw_protocol_instance_copy_override_endpoint_for_path()
{
  return MEMORY[0x18960A2E8]();
}

uint64_t nw_protocol_instance_copy_path()
{
  return MEMORY[0x18960A2F0]();
}

uint64_t nw_protocol_instance_copy_remote_cid_for_path()
{
  return MEMORY[0x18960A2F8]();
}

uint64_t nw_protocol_instance_create_extra_path()
{
  return MEMORY[0x18960A300]();
}

uint64_t nw_protocol_instance_enumerate_flows()
{
  return MEMORY[0x18960A308]();
}

uint64_t nw_protocol_instance_establish_path()
{
  return MEMORY[0x18960A310]();
}

uint64_t nw_protocol_instance_flush_batched_input()
{
  return MEMORY[0x18960A318]();
}

uint64_t nw_protocol_instance_get_flow_for_key()
{
  return MEMORY[0x18960A320]();
}

uint64_t nw_protocol_instance_get_level()
{
  return MEMORY[0x18960A328]();
}

uint64_t nw_protocol_instance_get_logging_disabled()
{
  return MEMORY[0x18960A330]();
}

uint64_t nw_protocol_instance_get_maximum_message_size()
{
  return MEMORY[0x18960A338]();
}

uint64_t nw_protocol_instance_get_multipath_service()
{
  return MEMORY[0x18960A340]();
}

uint64_t nw_protocol_instance_get_priority_for_path()
{
  return MEMORY[0x18960A348]();
}

uint64_t nw_protocol_instance_get_sensitive_redacted()
{
  return MEMORY[0x18960A350]();
}

uint64_t nw_protocol_instance_get_stats()
{
  return MEMORY[0x18960A358]();
}

uint64_t nw_protocol_instance_get_stats_region()
{
  return MEMORY[0x18960A360]();
}

uint64_t nw_protocol_instance_ignore_future_path_changes()
{
  return MEMORY[0x18960A368]();
}

uint64_t nw_protocol_instance_notify_connection_id_changed()
{
  return MEMORY[0x18960A370]();
}

uint64_t nw_protocol_instance_notify_updated_message_properties()
{
  return MEMORY[0x18960A378]();
}

uint64_t nw_protocol_instance_process_external_input()
{
  return MEMORY[0x18960A380]();
}

uint64_t nw_protocol_instance_report_done()
{
  return MEMORY[0x18960A388]();
}

uint64_t nw_protocol_instance_report_ready()
{
  return MEMORY[0x18960A390]();
}

uint64_t nw_protocol_instance_reset_after_early_data()
{
  return MEMORY[0x18960A398]();
}

uint64_t nw_protocol_instance_schedule_wakeup()
{
  return MEMORY[0x18960A3A0]();
}

uint64_t nw_protocol_instance_set_current_path()
{
  return MEMORY[0x18960A3A8]();
}

uint64_t nw_protocol_instance_set_flow_for_key()
{
  return MEMORY[0x18960A3B0]();
}

uint64_t nw_protocol_instance_set_flow_is_datagram()
{
  return MEMORY[0x18960A3B8]();
}

uint64_t nw_protocol_instance_set_is_datagram()
{
  return MEMORY[0x18960A3C0]();
}

uint64_t nw_protocol_instance_set_limit_outbound_data()
{
  return MEMORY[0x18960A3C8]();
}

uint64_t nw_protocol_instance_set_link_flow_controlled()
{
  return MEMORY[0x18960A3D0]();
}

uint64_t nw_protocol_instance_set_preferred_addresses()
{
  return MEMORY[0x18960A3D8]();
}

uint64_t nw_protocol_instance_set_wakeup_handler()
{
  return MEMORY[0x18960A3E0]();
}

uint64_t nw_protocol_instance_tear_down_path()
{
  return MEMORY[0x18960A3E8]();
}

uint64_t nw_protocol_instance_unassert_fallback_agent()
{
  return MEMORY[0x18960A3F0]();
}

uint64_t nw_protocol_instance_update_outbound_data_limit()
{
  return MEMORY[0x18960A3F8]();
}

uint64_t nw_protocol_instance_wait_for_early_data()
{
  return MEMORY[0x18960A400]();
}

uint64_t nw_protocol_metadata_copy_original()
{
  return MEMORY[0x18960A420]();
}

uint64_t nw_protocol_metadata_create_reply()
{
  return MEMORY[0x18960A428]();
}

uint64_t nw_protocol_metadata_create_singleton()
{
  return MEMORY[0x18960A430]();
}

uint64_t nw_protocol_metadata_is_quic_connection()
{
  return MEMORY[0x18960A440]();
}

uint64_t nw_protocol_metadata_is_quic_stream()
{
  return MEMORY[0x18960A448]();
}

uint64_t nw_protocol_metadata_supports_replies()
{
  return MEMORY[0x18960A458]();
}

uint64_t nw_protocol_options_copy()
{
  return MEMORY[0x18960A488]();
}

uint64_t nw_protocol_options_get_log_id_num()
{
  return MEMORY[0x18960A498]();
}

uint64_t nw_protocol_options_get_log_id_str()
{
  return MEMORY[0x18960A4A0]();
}

uint64_t nw_protocol_options_is_quic_stream()
{
  return MEMORY[0x18960A4A8]();
}

uint64_t nw_protocol_request_outbound_data()
{
  return MEMORY[0x18960A4F0]();
}

void nw_protocol_stack_clear_application_protocols(nw_protocol_stack_t stack)
{
}

void nw_protocol_stack_prepend_application_protocol(nw_protocol_stack_t stack, nw_protocol_options_t protocol)
{
}

uint64_t nw_protocol_stack_set_original_proxied_transport_protocol()
{
  return MEMORY[0x18960A550]();
}

void nw_protocol_stack_set_transport_protocol(nw_protocol_stack_t stack, nw_protocol_options_t protocol)
{
}

uint64_t nw_queue_context_target_dispatch_queue()
{
  return MEMORY[0x18960A610]();
}

uint64_t nw_quic_access_0rtt_state_on_queue()
{
  return MEMORY[0x18960A638]();
}

uint64_t nw_quic_access_application_result_on_queue()
{
  return MEMORY[0x18960A640]();
}

uint64_t nw_quic_access_token_on_queue()
{
  return MEMORY[0x18960A648]();
}

uint64_t nw_quic_connection_copy_sec_protocol_options()
{
  return MEMORY[0x18960A660]();
}

uint64_t nw_quic_connection_copy_stream_metadata()
{
  return MEMORY[0x18960A668]();
}

uint64_t nw_quic_connection_execute_locked()
{
  return MEMORY[0x18960A670]();
}

uint64_t nw_quic_connection_execute_max_streams_update_block()
{
  return MEMORY[0x18960A678]();
}

uint64_t nw_quic_connection_execute_session_state_update_block()
{
  return MEMORY[0x18960A680]();
}

uint64_t nw_quic_connection_get_ack_delay_size()
{
  return MEMORY[0x18960A688]();
}

uint64_t nw_quic_connection_get_application_result_handler()
{
  return MEMORY[0x18960A698]();
}

uint64_t nw_quic_connection_get_datagram_context_id()
{
  return MEMORY[0x18960A6A0]();
}

uint64_t nw_quic_connection_get_datagram_quarter_stream_id()
{
  return MEMORY[0x18960A6A8]();
}

uint64_t nw_quic_connection_get_datagram_variant_flow_id_enabled()
{
  return MEMORY[0x18960A6B0]();
}

uint64_t nw_quic_connection_get_disable_ecn()
{
  return MEMORY[0x18960A6B8]();
}

uint64_t nw_quic_connection_get_disable_ecn_echo()
{
  return MEMORY[0x18960A6C0]();
}

uint64_t nw_quic_connection_get_disable_spin_bit()
{
  return MEMORY[0x18960A6C8]();
}

uint64_t nw_quic_connection_get_enable_l4s()
{
  return MEMORY[0x18960A6D0]();
}

uint64_t nw_quic_connection_get_enable_multipath()
{
  return MEMORY[0x18960A6D8]();
}

uint64_t nw_quic_connection_get_force_version_negotiation()
{
  return MEMORY[0x18960A6E0]();
}

uint64_t nw_quic_connection_get_idle_timeout()
{
  return MEMORY[0x18960A6E8]();
}

uint64_t nw_quic_connection_get_initial_max_data()
{
  return MEMORY[0x18960A6F0]();
}

uint64_t nw_quic_connection_get_initial_max_stream_data_bidirectional_local()
{
  return MEMORY[0x18960A6F8]();
}

uint64_t nw_quic_connection_get_initial_max_stream_data_bidirectional_remote()
{
  return MEMORY[0x18960A700]();
}

uint64_t nw_quic_connection_get_initial_max_stream_data_unidirectional()
{
  return MEMORY[0x18960A708]();
}

uint64_t nw_quic_connection_get_initial_max_streams_bidirectional()
{
  return MEMORY[0x18960A710]();
}

uint64_t nw_quic_connection_get_initial_max_streams_unidirectional()
{
  return MEMORY[0x18960A718]();
}

uint64_t nw_quic_connection_get_initial_packet_size()
{
  return MEMORY[0x18960A720]();
}

uint64_t nw_quic_connection_get_keepalive_count()
{
  return MEMORY[0x18960A728]();
}

uint64_t nw_quic_connection_get_keepalive_handler()
{
  return MEMORY[0x18960A730]();
}

uint64_t nw_quic_connection_get_local_max_streams_bidirectional_handler()
{
  return MEMORY[0x18960A738]();
}

uint64_t nw_quic_connection_get_local_max_streams_unidirectional_handler()
{
  return MEMORY[0x18960A740]();
}

uint64_t nw_quic_connection_get_max_datagram_frame_size()
{
  return MEMORY[0x18960A748]();
}

uint64_t nw_quic_connection_get_max_paths_per_interface()
{
  return MEMORY[0x18960A750]();
}

uint64_t nw_quic_connection_get_max_udp_payload_size()
{
  return MEMORY[0x18960A758]();
}

uint64_t nw_quic_connection_get_migration_for_non_transport()
{
  return MEMORY[0x18960A760]();
}

uint64_t nw_quic_connection_get_peer_idle_timeout_handler()
{
  return MEMORY[0x18960A770]();
}

uint64_t nw_quic_connection_get_pmtud()
{
  return MEMORY[0x18960A778]();
}

uint64_t nw_quic_connection_get_pmtud_for_non_transport()
{
  return MEMORY[0x18960A780]();
}

uint64_t nw_quic_connection_get_pmtud_ignore_cost()
{
  return MEMORY[0x18960A788]();
}

uint64_t nw_quic_connection_get_probe_simultaneously()
{
  return MEMORY[0x18960A790]();
}

uint64_t nw_quic_connection_get_quic_state()
{
  return MEMORY[0x18960A798]();
}

uint64_t nw_quic_connection_get_remote_max_streams_bidirectional_handler()
{
  return MEMORY[0x18960A7A0]();
}

uint64_t nw_quic_connection_get_remote_max_streams_unidirectional_handler()
{
  return MEMORY[0x18960A7A8]();
}

uint64_t nw_quic_connection_get_retry()
{
  return MEMORY[0x18960A7B0]();
}

uint64_t nw_quic_connection_get_source_connection_id()
{
  return MEMORY[0x18960A7B8]();
}

uint64_t nw_quic_connection_get_spin_bit_value()
{
  return MEMORY[0x18960A7C0]();
}

uint64_t nw_quic_connection_get_stream_path_affinity()
{
  return MEMORY[0x18960A7C8]();
}

uint64_t nw_quic_connection_get_tls_state()
{
  return MEMORY[0x18960A7D0]();
}

uint64_t nw_quic_connection_get_use_swift_tls()
{
  return MEMORY[0x18960A7D8]();
}

uint64_t nw_quic_connection_inject_packet_handler()
{
  return MEMORY[0x18960A7E0]();
}

uint64_t nw_quic_connection_set_application_error_internal()
{
  return MEMORY[0x18960A7F8]();
}

uint64_t nw_quic_connection_set_application_error_reason()
{
  return MEMORY[0x18960A800]();
}

uint64_t nw_quic_connection_set_application_result_handler()
{
  return MEMORY[0x18960A808]();
}

uint64_t nw_quic_connection_set_close_with_error_handler()
{
  return MEMORY[0x18960A810]();
}

uint64_t nw_quic_connection_set_is_early_data_accepted()
{
  return MEMORY[0x18960A838]();
}

uint64_t nw_quic_connection_set_keepalive_handler()
{
  return MEMORY[0x18960A850]();
}

uint64_t nw_quic_connection_set_link_flow_controlled_handler()
{
  return MEMORY[0x18960A858]();
}

uint64_t nw_quic_connection_set_local_max_streams_bidirectional_handler()
{
  return MEMORY[0x18960A860]();
}

uint64_t nw_quic_connection_set_local_max_streams_unidirectional_handler()
{
  return MEMORY[0x18960A868]();
}

uint64_t nw_quic_connection_set_max_data_handler()
{
  return MEMORY[0x18960A870]();
}

uint64_t nw_quic_connection_set_max_stream_data_bidirectional_local_handler()
{
  return MEMORY[0x18960A878]();
}

uint64_t nw_quic_connection_set_max_stream_data_bidirectional_remote_handler()
{
  return MEMORY[0x18960A880]();
}

uint64_t nw_quic_connection_set_max_stream_data_unidirectional_handler()
{
  return MEMORY[0x18960A888]();
}

uint64_t nw_quic_connection_set_sec_protocol_metadata()
{
  return MEMORY[0x18960A8A0]();
}

uint64_t nw_quic_connection_set_stream_metadata()
{
  return MEMORY[0x18960A8A8]();
}

uint64_t nw_quic_create_connection_metadata()
{
  return MEMORY[0x18960A8B0]();
}

uint64_t nw_quic_create_stream_metadata()
{
  return MEMORY[0x18960A8B8]();
}

uint64_t nw_quic_get_remote_transport_parameters()
{
  return MEMORY[0x18960A8C8]();
}

uint64_t nw_quic_info_allocate()
{
  return MEMORY[0x18960A8D8]();
}

uint64_t nw_quic_report_application_result_on_queue()
{
  return MEMORY[0x18960A8E0]();
}

uint64_t nw_quic_save_0rtt_state_on_queue()
{
  return MEMORY[0x18960A8E8]();
}

uint64_t nw_quic_save_token_on_queue()
{
  return MEMORY[0x18960A8F0]();
}

uint64_t nw_quic_stream_copy_shared_connection_options()
{
  return MEMORY[0x18960A8F8]();
}

uint64_t nw_quic_stream_get_associated_stream_id()
{
  return MEMORY[0x18960A908]();
}

uint64_t nw_quic_stream_get_datagram_context_id()
{
  return MEMORY[0x18960A910]();
}

uint64_t nw_quic_stream_get_is_datagram()
{
  return MEMORY[0x18960A920]();
}

uint64_t nw_quic_stream_get_is_unidirectional()
{
  return MEMORY[0x18960A928]();
}

uint64_t nw_quic_stream_set_application_error_handler()
{
  return MEMORY[0x18960A938]();
}

uint64_t nw_quic_stream_set_application_error_internal()
{
  return MEMORY[0x18960A940]();
}

uint64_t nw_quic_stream_set_connection_metadata()
{
  return MEMORY[0x18960A948]();
}

uint64_t nw_quic_stream_set_datagram_variant_flow_id()
{
  return MEMORY[0x18960A950]();
}

uint64_t nw_quic_stream_set_has_datagram_variant_flow_id()
{
  return MEMORY[0x18960A958]();
}

uint64_t nw_quic_stream_set_id()
{
  return MEMORY[0x18960A960]();
}

uint64_t nw_quic_stream_set_type()
{
  return MEMORY[0x18960A970]();
}

uint64_t nw_quic_stream_set_usable_datagram_frame_size()
{
  return MEMORY[0x18960A978]();
}

void nw_release(void *obj)
{
}

void *__cdecl nw_retain(void *obj)
{
  return (void *)MEMORY[0x18960AA20](obj);
}

uint64_t nw_settings_get_signposts_enabled()
{
  return MEMORY[0x18960AA78]();
}

uint64_t nw_settings_register_quic_log_debug_updates()
{
  return MEMORY[0x18960AA88]();
}

uint64_t nw_swift_tls_create_options()
{
  return MEMORY[0x18960AAA0]();
}

sec_protocol_metadata_t nw_tls_copy_sec_protocol_metadata(nw_protocol_metadata_t metadata)
{
  return (sec_protocol_metadata_t)MEMORY[0x18960AB90](metadata);
}

sec_protocol_options_t nw_tls_copy_sec_protocol_options(nw_protocol_options_t options)
{
  return (sec_protocol_options_t)MEMORY[0x18960AB98](options);
}

nw_protocol_options_t nw_tls_create_options(void)
{
  return (nw_protocol_options_t)MEMORY[0x18960ABA0]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

uint64_t os_log_pack_compose()
{
  return MEMORY[0x1895FC448]();
}

uint64_t os_log_pack_send()
{
  return MEMORY[0x1895FC450]();
}

uint64_t os_log_pack_send_and_compose()
{
  return MEMORY[0x1895FC458]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

void os_release(void *object)
{
}

void *__cdecl os_retain(void *object)
{
  return (void *)MEMORY[0x1895FC5F8](object);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1895FC6C8]();
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1895FCC70](__ptr, __size);
}

uint64_t sec_protocol_metadata_copy_quic_transport_parameters()
{
  return MEMORY[0x18960BF58]();
}

uint64_t sec_protocol_metadata_copy_serialized_session()
{
  return MEMORY[0x18960BF70]();
}

BOOL sec_protocol_metadata_get_early_data_accepted(sec_protocol_metadata_t metadata)
{
  return MEMORY[0x18960BF80](metadata);
}

tls_ciphersuite_t sec_protocol_metadata_get_negotiated_tls_ciphersuite(sec_protocol_metadata_t metadata)
{
  return (unsigned __int16)MEMORY[0x18960BFA0](metadata);
}

uint64_t sec_protocol_options_copy_transport_specific_application_protocol()
{
  return MEMORY[0x18960C018]();
}

uint64_t sec_protocol_options_set_allow_unknown_alpn_protos()
{
  return MEMORY[0x18960C048]();
}

void sec_protocol_options_set_min_tls_protocol_version( sec_protocol_options_t options, tls_protocol_version_t version)
{
}

uint64_t sec_protocol_options_set_output_handler_access_block()
{
  return MEMORY[0x18960C0A0]();
}

uint64_t sec_protocol_options_set_quic_transport_parameters()
{
  return MEMORY[0x18960C0B8]();
}

void sec_protocol_options_set_quic_use_legacy_codepoint( sec_protocol_options_t options, BOOL quic_use_legacy_codepoint)
{
}

uint64_t sec_protocol_options_set_session_state()
{
  return MEMORY[0x18960C0D8]();
}

uint64_t sec_protocol_options_set_session_update_block()
{
  return MEMORY[0x18960C0E0]();
}

uint64_t sec_protocol_options_set_tls_certificate_compression_enabled()
{
  return MEMORY[0x18960C0E8]();
}

uint64_t sec_protocol_options_set_tls_encryption_level_update_block()
{
  return MEMORY[0x18960C100]();
}

uint64_t sec_protocol_options_set_tls_encryption_secret_update_block()
{
  return MEMORY[0x18960C108]();
}

void sec_release(void *obj)
{
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FD050](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1895FD080](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1895FD2B8](a1, a2, a3, a4, a5);
}

int timingsafe_bcmp(const void *__b1, const void *__b2, size_t __len)
{
  return MEMORY[0x1895FD418](__b1, __b2, __len);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1895FD610](__str, __size, __format, a4);
}

void xpc_release(xpc_object_t object)
{
}

uint64_t objc_msgSend_metricsUpdated_smoothed_rtt_latest_rtt_rtt_variance_pto_count_congestion_window_bytes_in_flight_ssthresh_packets_in_flight_in_recovery_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_metricsUpdated_smoothed_rtt_latest_rtt_rtt_variance_pto_count_congestion_window_bytes_in_flight_ssthresh_packets_in_flight_in_recovery_);
}

uint64_t objc_msgSend_parametersSet_resumption_allowed_early_data_enabled_tls_cipher_original_dcid_initial_scid_retry_scid_disable_active_migration_max_idle_timeout_max_udp_payload_size_ack_delay_exponent_max_ack_delay_active_cid_limit_initial_max_data_initial_msd_bidi_remote_initial_msd_bidi_local_initial_msd_uni_initial_ms_bidi_initial_ms_uni_preferred_address_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_parametersSet_resumption_allowed_early_data_enabled_tls_cipher_original_dcid_initial_scid_retry_scid_disable_active_migration_max_idle_timeout_max_udp_payload_size_ack_delay_exponent_max_ack_delay_active_cid_limit_initial_max_data_initial_msd_bidi_remote_initial_msd_bidi_local_initial_msd_uni_initial_ms_bidi_initial_ms_uni_preferred_address_);
}