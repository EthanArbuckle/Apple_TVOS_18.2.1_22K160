@interface CRYPTO
@end

@implementation CRYPTO

uint64_t __quic_frame_process_CRYPTO_block_invoke(uint64_t a1, int64x2_t **a2)
{
  v62[1] = *MEMORY[0x1895F89C0];
  int v4 = *(unsigned __int8 *)(a1 + 72);
  switch(v4)
  {
    case 3:
      v5 = (unint64_t **)(a2 + 35);
      goto LABEL_7;
    case 2:
      v5 = (unint64_t **)(a2 + 34);
LABEL_7:
      uint64_t v6 = *(void *)(a1 + 40);
      if ((*(_BYTE *)(v6 + 1381) & 0x10) != 0)
      {
        if (!qlog_debug_enabled && (qlog_nwlog_enabled & 1) == 0)
        {
          uint64_t v30 = 1LL;
          if (!os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO)) {
            return v30;
          }
        }

        if (*(void *)(v6 + 1112))
        {
          uint64_t v31 = _os_log_pack_size();
          v62[0] = v62;
          v32 = (char *)v62 - ((MEMORY[0x1895F8858](v31, v31) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          uint64_t v33 = _os_log_pack_fill();
          uint64_t v34 = *(void *)(a1 + 40);
          uint64_t v35 = *(void *)(v34 + 1112);
          if (quic_cid_describe_state % 3 == 2) {
            v36 = &quic_cid_describe_cid_buf2;
          }
          else {
            v36 = &quic_cid_describe_cid_buf3;
          }
          if (quic_cid_describe_state % 3) {
            v37 = v36;
          }
          else {
            v37 = &quic_cid_describe_cid_buf1;
          }
          int v38 = ++quic_cid_describe_state;
          unsigned int v39 = *(unsigned __int8 *)(v35 + 38);
          __int128 v40 = 0uLL;
          *(_OWORD *)((char *)v37 + 25) = 0u;
          if (v39 >= 0x14) {
            uint64_t v41 = 20LL;
          }
          else {
            uint64_t v41 = v39;
          }
          _OWORD *v37 = 0uLL;
          v37[1] = 0uLL;
          if ((_DWORD)v41)
          {
            v42 = (unsigned __int8 *)(v35 + 39);
            do
            {
              int v43 = *v42++;
              snprintf((char *)v37, 0x29uLL, "%s%02x", (const char *)v37, v43);
              --v41;
            }

            while (v41);
            int v38 = quic_cid_describe_state;
            __int128 v40 = 0uLL;
          }

          uint64_t v44 = v34 + 976;
          uint64_t v45 = *(void *)(*(void *)(a1 + 40) + 1112LL);
          if (v38 % 3 == 2) {
            v46 = &quic_cid_describe_cid_buf2;
          }
          else {
            v46 = &quic_cid_describe_cid_buf3;
          }
          if (v38 % 3) {
            v47 = v46;
          }
          else {
            v47 = &quic_cid_describe_cid_buf1;
          }
          quic_cid_describe_state = v38 + 1;
          else {
            uint64_t v48 = *(unsigned __int8 *)(v45 + 17);
          }
          _OWORD *v47 = v40;
          v47[1] = v40;
          *(_OWORD *)((char *)v47 + 25) = v40;
          if ((_DWORD)v48)
          {
            v49 = (unsigned __int8 *)(v45 + 18);
            do
            {
              int v50 = *v49++;
              snprintf((char *)v47, 0x29uLL, "%s%02x", (const char *)v47, v50);
              --v48;
            }

            while (v48);
          }

          else {
            v51 = off_18A117130[(*(_BYTE *)(*(void *)(a1 + 48) + 16LL) - 1)];
          }
          *(_DWORD *)uint64_t v33 = 136447234;
          *(void *)(v33 + 4) = "quic_frame_process_CRYPTO_block_invoke";
          *(_WORD *)(v33 + 12) = 2082;
          *(void *)(v33 + 14) = v44;
          *(_WORD *)(v33 + 22) = 2082;
          *(void *)(v33 + 24) = v37;
          *(_WORD *)(v33 + 32) = 2082;
          *(void *)(v33 + 34) = v47;
          *(_WORD *)(v33 + 42) = 2082;
          *(void *)(v33 + 44) = v51;
          uint64_t v30 = 1LL;
          qlog_internal(1, (uint64_t)v32, 2946LL);
          return v30;
        }
      }

      else
      {
        v7 = *v5;
        if (v4 == 2) {
          unint64_t v8 = 0x2000LL;
        }
        else {
          unint64_t v8 = 4096LL;
        }
        if (quic_reassq_size((uint64_t)v7) <= v8)
        {
          if (quic_reassq_append( v7,  *(void *)(a1 + 56),  *(void *)(*(void *)(a1 + 48) + 24LL),  *(void *)(*(void *)(a1 + 48) + 32LL),  *(_BYTE **)(*(void *)(a1 + 48) + 40LL),  0))
          {
            uint64_t v52 = *(void *)(a1 + 40);
            uint64_t v53 = *(void *)(v52 + 40);
            if (!v53)
            {
              *(void *)(v52 + 40) = *(void *)(a1 + 64);
              uint64_t v52 = *(void *)(a1 + 40);
              uint64_t v53 = *(void *)(v52 + 40);
            }

            quic_crypto_process_reassq(v53, v52 + 48, (uint64_t)a2, a2[33]);
            quic_crypto_process_reassq( *(void *)(*(void *)(a1 + 40) + 40LL),  *(void *)(a1 + 40) + 112LL,  (uint64_t)a2,  a2[34]);
            quic_crypto_process_reassq( *(void *)(*(void *)(a1 + 40) + 40LL),  *(void *)(a1 + 40) + 240LL,  (uint64_t)a2,  a2[35]);
          }
        }

        else
        {
          if ((qlog_debug_enabled
             || (qlog_nwlog_enabled & 1) != 0
             || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
            && *(void *)(*(void *)(a1 + 40) + 1112LL))
          {
            uint64_t v9 = _os_log_pack_size();
            v62[0] = v62;
            v10 = (char *)v62 - ((MEMORY[0x1895F8858](v9, v9) + 15) & 0xFFFFFFFFFFFFFFF0LL);
            _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
            uint64_t v11 = _os_log_pack_fill();
            uint64_t v12 = *(void *)(a1 + 40);
            uint64_t v13 = *(void *)(v12 + 1112);
            if (quic_cid_describe_state % 3 == 2) {
              v14 = &quic_cid_describe_cid_buf2;
            }
            else {
              v14 = &quic_cid_describe_cid_buf3;
            }
            if (quic_cid_describe_state % 3) {
              v15 = v14;
            }
            else {
              v15 = &quic_cid_describe_cid_buf1;
            }
            int v16 = ++quic_cid_describe_state;
            unsigned int v17 = *(unsigned __int8 *)(v13 + 38);
            __int128 v18 = 0uLL;
            *(_OWORD *)((char *)v15 + 25) = 0u;
            if (v17 >= 0x14) {
              uint64_t v19 = 20LL;
            }
            else {
              uint64_t v19 = v17;
            }
            _OWORD *v15 = 0uLL;
            v15[1] = 0uLL;
            if ((_DWORD)v19)
            {
              v20 = (unsigned __int8 *)(v13 + 39);
              do
              {
                int v21 = *v20++;
                snprintf((char *)v15, 0x29uLL, "%s%02x", (const char *)v15, v21);
                --v19;
              }

              while (v19);
              int v16 = quic_cid_describe_state;
              __int128 v18 = 0uLL;
            }

            uint64_t v22 = v12 + 976;
            uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 1112LL);
            if (v16 % 3 == 2) {
              v24 = &quic_cid_describe_cid_buf2;
            }
            else {
              v24 = &quic_cid_describe_cid_buf3;
            }
            if (v16 % 3) {
              v25 = v24;
            }
            else {
              v25 = &quic_cid_describe_cid_buf1;
            }
            quic_cid_describe_state = v16 + 1;
            else {
              uint64_t v26 = *(unsigned __int8 *)(v23 + 17);
            }
            _OWORD *v25 = v18;
            v25[1] = v18;
            *(_OWORD *)((char *)v25 + 25) = v18;
            if ((_DWORD)v26)
            {
              v27 = (unsigned __int8 *)(v23 + 18);
              do
              {
                int v28 = *v27++;
                snprintf((char *)v25, 0x29uLL, "%s%02x", (const char *)v25, v28);
                --v26;
              }

              while (v26);
            }

            else {
              v29 = off_18A117130[(*(_BYTE *)(a1 + 72) - 1)];
            }
            *(_DWORD *)uint64_t v11 = 136447490;
            *(void *)(v11 + 4) = "quic_frame_process_CRYPTO_block_invoke";
            *(_WORD *)(v11 + 12) = 2082;
            *(void *)(v11 + 14) = v22;
            *(_WORD *)(v11 + 22) = 2082;
            *(void *)(v11 + 24) = v15;
            *(_WORD *)(v11 + 32) = 2082;
            *(void *)(v11 + 34) = v25;
            *(_WORD *)(v11 + 42) = 2048;
            *(void *)(v11 + 44) = v8;
            *(_WORD *)(v11 + 52) = 2082;
            *(void *)(v11 + 54) = v29;
            qlog_internal(16, (uint64_t)v10, 2960LL);
          }

          v54 = *(void **)(a1 + 40);
          if (*(_BYTE *)(a1 + 72) == 2)
          {
            uint64_t v30 = 0LL;
            v54[134] = 13LL;
            v54[135] = "exceeded crypto buffer";
            *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
            return v30;
          }

          *(void *)((char *)v54 + 1380) |= 0x1000uLL;
        }
      }

      return 1LL;
    case 1:
      v5 = (unint64_t **)(a2 + 33);
      goto LABEL_7;
  }

  uint64_t v56 = *(void *)(a1 + 40);
  v57 = (const char *)(v56 + 976);
  v58 = quic_cid_describe((unsigned __int8 *)(*(void *)(v56 + 1112) + 38LL));
  v59 = quic_cid_describe((unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 1112LL) + 17LL));
  uint64_t v60 = qlog_abort_internal( "%s %s [%s-%s] space %d not implemented",  "quic_frame_process_CRYPTO_block_invoke",  v57,  v58,  v59,  *(unsigned __int8 *)(a1 + 72));
  return __quic_frame_process_STOP_SENDING_block_invoke(v60, v61);
}

@end