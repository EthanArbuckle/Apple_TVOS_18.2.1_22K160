@interface LibLogRedirect
@end

@implementation LibLogRedirect

void __LibLogRedirect_OSLogHook_block_invoke(uint64_t a1, uint64_t a2, int *a3)
{
  if (LibLogRedirect_OSLogHook_prevLogHook) {
    (*(void (**)(void))(LibLogRedirect_OSLogHook_prevLogHook + 16))();
  }
  __int16 v6 = hookMode;
  if ((hookMode & 1) == 0) {
    return;
  }
  if ((hookMode & 0x200) != 0) {
    goto LABEL_16;
  }
  int v7 = *a3;
  BOOL v8 = !*((void *)a3 + 16)
    && !*((void *)a3 + 17)
    && (v20 = (const char *)*((void *)a3 + 4)) != 0LL
    && strstr(v20, "/System/Library/Frameworks/Foundation.framework") != 0LL;
  if ((a2 & 0xFE) == 0x10 || (v7 & 0xE0000) == 0x20000 || v8) {
    goto LABEL_16;
  }
  if ((v7 & 0x60000) == 0x40000) {
    return;
  }
  v9 = (const char *)*((void *)a3 + 4);
  if (!v9)
  {
LABEL_16:
    if ((_DWORD)a2 == 17 && (v6 & 0x400) == 0)
    {
      if ((v12 = (const char *)*((void *)a3 + 16),
            v13 = (const char *)*((void *)a3 + 17),
            v14 = (const char *)*((void *)a3 + 11),
            v12)
        && !strcmp(v12, "com.apple.runtime-issues")
        || v13 && !strcmp(v13, "RuntimeIssues"))
      {
        if (v14 && strstr(v14, "xcode:text-backtrace")) {
          return;
        }
      }
    }

    unint64_t v15 = v124;
    uint64_t v16 = *(void *)(a1 + 32);
    if (!HookValidateParamsBuffersOnly((void *)v16)
      || !*(void *)(v16 + 48)
      || !*(void *)(v16 + 56)
      || (*(_DWORD *)(v16 + 64) & 0x80000000) != 0
      || (pthread_getspecific(logRedirectThreadLockFlagsKey) & 8) != 0)
    {
      return;
    }

    v17 = (_BYTE *)os_log_copy_message_string(a3);
    signed int v18 = pthread_getspecific(logRedirectThreadLockFlagsKey);
    if ((v18 & 2) != 0)
    {
      int v19 = 12;
    }

    else
    {
      os_unfair_lock_lock((os_unfair_lock_t)&logRedirectLock);
      int v19 = 14;
    }

    pthread_setspecific(logRedirectThreadLockFlagsKey, (const void *)(v19 | v18));
    int v21 = HookHandleLogMessage_lastOutputSuccessful;
    HookHandleLogMessage_lastOutputSuccessful = 0;
    unint64_t v27 = HookBufferAppend((void *)(v16 + 16), *(void *)(v16 + 56), "%c %llx ", v22, v23, v24, v25, v26, 76);
    ++HookHandleLogMessage_logSequenceNum;
    if (!v27)
    {
      int v34 = *__error();
      v35 = "Failed to update flags for log message";
LABEL_144:
      uint64_t v36 = v16;
      goto LABEL_145;
    }

    if (!v17)
    {
      v35 = "Failed to copy log message content";
      uint64_t v36 = v16;
      int v34 = 94;
LABEL_145:
      HookWriteError(v36, v34, v35);
      goto LABEL_146;
    }

    uint64_t v119 = v27;
    if (HookHandleLogMessage_lastFullMessageTime + 10000000000LL >= v15)
    {
      int v33 = v21 ^ 1;
    }

    else
    {
      HookHandleLogMessage_lastFullMessageTime = v15;
      int v33 = 1;
    }

    if (!*(_BYTE *)(v16 + 68))
    {
      time_t v37 = *((void *)a3 + 5);
      if (!v37)
      {
        time_t v37 = v123[0];
        unint64_t v38 = v123[1];
        *((void *)a3 + 5) = v123[0];
        a3[12] = v38 / 0x3E8;
      }

      time_t v125 = v37;
      localtime_r(&v125, &v126);
      int tm_isdst = v126.tm_isdst;
      unint64_t v40 = ((unsigned __int128)(v126.tm_gmtoff * (__int128)0x7777777777777777LL) >> 64) - v126.tm_gmtoff;
      a3[14] = (v40 >> 5) + (v40 >> 63) + 60 * v126.tm_isdst;
      a3[15] = tm_isdst;
    }

    __int16 v121 = hookMode;
    v122 = (uint64_t *)(v16 + 32);
    unint64_t v41 = HookBufferAppend((void *)(v16 + 32), 0LL, "{t:%ld.%06d", v28, v29, v30, v31, v32, *((void *)a3 + 5));
    if (!v41) {
      goto LABEL_143;
    }
    unint64_t v47 = v41;
    int v120 = v33 | ((unsigned __int16)(v121 & 0x100) >> 8);
    if ((v120 & 1) != 0)
    {
      int v48 = a3[14];
    }

    else
    {
      int v48 = a3[14];
      if (HookBufferFillMetadata_last_0 == v48) {
        goto LABEL_53;
      }
    }

    unint64_t v49 = HookBufferAppend(v122, v41, ",tz:%d", v42, v43, v44, v45, v46, v48);
    if (!v49) {
      goto LABEL_143;
    }
    unint64_t v47 = v49;
    if ((v121 & 0x100) != 0 || (HookBufferFillMetadata_last_0 = a3[14], (v120 & 1) != 0))
    {
      int v50 = a3[15];
LABEL_54:
      unint64_t v51 = HookBufferAppend(v122, v47, ",tzDST:%d", v42, v43, v44, v45, v46, v50);
      if (!v51) {
        goto LABEL_143;
      }
      unint64_t v47 = v51;
      if ((v121 & 0x100) != 0 || (HookBufferFillMetadata_last_1 = a3[15], (v120 & 1) != 0))
      {
        uint64_t v52 = *((void *)a3 + 2);
LABEL_59:
        unint64_t v53 = HookBufferAppend(v122, v47, ",tid:0x%llx", v42, v43, v44, v45, v46, v52);
        if (!v53) {
          goto LABEL_143;
        }
        unint64_t v47 = v53;
        if ((v121 & 0x100) == 0) {
          HookBufferFillMetadata_last_2 = *((void *)a3 + 2);
        }
LABEL_62:
        name = (char *)os_log_type_get_name(a2);
        unint64_t appended = HookBufferAppendEscapedString( v122,  v47,  v120 & 1,  ",type:",  name,  (char *)HookBufferFillMetadata_last_3,  v55,  v56);
        if (!appended) {
          goto LABEL_143;
        }
        unint64_t v60 = appended;
        if ((v121 & 0x100) == 0)
        {
          free((void *)HookBufferFillMetadata_last_3);
          if (name) {
            v61 = strdup(name);
          }
          else {
            v61 = 0LL;
          }
          HookBufferFillMetadata_last_3 = (uint64_t)v61;
        }

        unint64_t v62 = HookBufferAppendEscapedString( v122,  v60,  v120 & 1,  ",subsystem:",  *((char **)a3 + 16),  (char *)HookBufferFillMetadata_last_4,  v58,  v59);
        if (!v62) {
          goto LABEL_143;
        }
        unint64_t v65 = v62;
        if ((v121 & 0x100) == 0)
        {
          free((void *)HookBufferFillMetadata_last_4);
          v66 = (char *)*((void *)a3 + 16);
          if (v66) {
            v66 = strdup(v66);
          }
          HookBufferFillMetadata_last_4 = (uint64_t)v66;
        }

        unint64_t v67 = HookBufferAppendEscapedString( v122,  v65,  v120 & 1,  ",category:",  *((char **)a3 + 17),  (char *)HookBufferFillMetadata_last_5,  v63,  v64);
        if (!v67) {
          goto LABEL_143;
        }
        unint64_t v73 = v67;
        if ((v121 & 0x100) != 0)
        {
          if ((hookMode & 2) == 0) {
            goto LABEL_98;
          }
          unint64_t v73 = HookBufferAppend(v122, v67, ",offset:0x%llx", v68, v69, v70, v71, v72, *((void *)a3 + 8));
          if (!v73) {
            goto LABEL_143;
          }
          goto LABEL_86;
        }

        free((void *)HookBufferFillMetadata_last_5);
        v74 = (char *)*((void *)a3 + 17);
        if (v74) {
          v74 = strdup(v74);
        }
        HookBufferFillMetadata_last_5 = (uint64_t)v74;
        if ((hookMode & 2) == 0) {
          goto LABEL_98;
        }
        if ((v120 & 1) != 0)
        {
          uint64_t v75 = *((void *)a3 + 8);
        }

        else
        {
          uint64_t v75 = *((void *)a3 + 8);
          if (HookBufferFillMetadata_last_6 == v75)
          {
LABEL_86:
            v76 = (const unsigned __int8 *)*((void *)a3 + 3);
            if (v76)
            {
              uuid_unparse(v76, (char *)&v126);
              unint64_t v79 = HookBufferAppendEscapedString( v122,  v73,  v120 & 1,  ",imgUUID:",  (char *)&v126,  (char *)HookBufferFillMetadata_last_7,  v77,  v78);
              if (!v79) {
                goto LABEL_143;
              }
              unint64_t v82 = v79;
              if ((v121 & 0x100) == 0)
              {
                free((void *)HookBufferFillMetadata_last_7);
                HookBufferFillMetadata_last_7 = (uint64_t)strdup((const char *)&v126);
              }
            }

            else
            {
              unint64_t v83 = HookBufferAppendEscapedString( v122,  v73,  v120 & 1,  ",imgUUID:",  0LL,  (char *)HookBufferFillMetadata_last_7,  v71,  v72);
              if (!v83) {
                goto LABEL_143;
              }
              unint64_t v82 = v83;
              if ((v121 & 0x100) == 0)
              {
                free((void *)HookBufferFillMetadata_last_7);
                HookBufferFillMetadata_last_7 = 0LL;
              }
            }

            unint64_t v84 = HookBufferAppendEscapedString( v122,  v82,  v120 & 1,  ",imgPath:",  *((char **)a3 + 4),  (char *)HookBufferFillMetadata_last_8,  v80,  v81);
            if (!v84) {
              goto LABEL_143;
            }
            unint64_t v73 = v84;
            if ((v121 & 0x100) == 0)
            {
              free((void *)HookBufferFillMetadata_last_8);
              v85 = (char *)*((void *)a3 + 4);
              if (v85) {
                v85 = strdup(v85);
              }
              HookBufferFillMetadata_last_8 = (uint64_t)v85;
            }

@end