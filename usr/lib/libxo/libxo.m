void xo_no_setlocale()
{
  xo_locale_inited = 1;
}

_DWORD *xo_retain_clear_all()
{
  uint64_t v0 = xo_retain();
  for (uint64_t i = 0LL; i != 64; ++i)
  {
    v2 = *(void **)(v0 + 8 * i);
    if (v2)
    {
      do
      {
        v3 = (void *)*v2;
        xo_free();
        v2 = v3;
      }

      while (v3);
    }

    *(void *)(v0 + 8 * i) = 0LL;
  }

  result = (_DWORD *)xo_retain_count();
  _DWORD *result = 0;
  return result;
}

_DWORD *xo_retain_clear()
{
  result = (_DWORD *)xo_retain();
  v3 = &result[2 * v2];
  while (1)
  {
    v4 = v3;
    v3 = (void *)*v3;
    if (!v3) {
      break;
    }
    if (v3[2] == v1)
    {
      void *v4 = *v3;
      result = (_DWORD *)xo_retain_count();
      --*result;
      return result;
    }
  }

  return result;
}

uint64_t xo_warn_hc( uint64_t a1, int a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return xo_warn_hcv(a1, a2, 0, a3, &a9);
}

uint64_t xo_warn_hcv(uint64_t result, int a2, int a3, char *__s, va_list a5)
{
  uint64_t v9 = result;
  uint64_t v63 = *MEMORY[0x1895F89C0];
  va_list v62 = a5;
  if (result)
  {
    if (a3) {
      goto LABEL_3;
    }
LABEL_9:
    if (!__s) {
      return result;
    }
    goto LABEL_10;
  }

  if (!*(_DWORD *)xo_default_inited()) {
    xo_default_init();
  }
  result = xo_default_handle();
  uint64_t v9 = result;
  if (!a3) {
    goto LABEL_9;
  }
LABEL_3:
  if (!__s || (*(void *)v9 & 0x10) == 0) {
    return result;
  }
LABEL_10:
  size_t v10 = strlen(__s);
  v11 = (char *)xo_program;
  if (xo_program)
  {
    size_t v12 = strlen((const char *)xo_program);
    uint64_t v13 = MEMORY[0x1895F8858]();
    v15 = (char *)&v60 - v14;
    if (v13)
    {
      memcpy((char *)&v60 - v14, v11, v12);
      *(_WORD *)&v15[v12] = 8250;
      v11 = (char *)(v12 + 2);
    }

    else
    {
      v11 = 0LL;
    }
  }

  else
  {
    MEMORY[0x1895F8858]();
    v15 = (char *)&v60 - ((v10 + 18) & 0xFFFFFFFFFFFFFFF0LL);
  }

  memcpy(&v11[(void)v15], __s, v10);
  v11[v10 + (void)v15] = 0;
  if ((*(_BYTE *)v9 & 0x80) != 0)
  {
    uint64_t v18 = *(void *)(v9 + 72);
    v19 = *(_DWORD **)(v9 + 80);
    if ((unint64_t)v19 + 7 >= v18 + *(void *)(v9 + 88))
    {
      unint64_t v20 = ((unint64_t)v19 - v18 + 8198) & 0xFFFFFFFFFFFFE000LL;
      uint64_t v21 = xo_realloc(v18, v20);
      uint64_t v22 = *(void *)(v9 + 80);
      if (!v21) {
        goto LABEL_24;
      }
      v19 = (_DWORD *)(v21 + v22 - *(void *)(v9 + 72));
      *(void *)(v9 + 72) = v21;
      *(void *)(v9 + 80) = v19;
      *(void *)(v9 + 88) = v20;
    }

    int v23 = *(_DWORD *)xo_warn_hcv_err_open;
    *(_DWORD *)((char *)v19 + 3) = *(_DWORD *)&xo_warn_hcv_err_open[3];
    _DWORD *v19 = v23;
    uint64_t v22 = *(void *)(v9 + 80) + 7LL;
    *(void *)(v9 + 80) = v22;
LABEL_24:
    uint64_t v24 = *(void *)(v9 + 72);
    if (v22 + 9 >= (unint64_t)(v24 + *(void *)(v9 + 88)))
    {
      unint64_t v25 = (v22 + 9 - v24 + 0x1FFF) & 0xFFFFFFFFFFFFE000LL;
      uint64_t v26 = xo_realloc(v24, v25);
      if (!v26) {
        goto LABEL_28;
      }
      uint64_t v22 = v26 + *(void *)(v9 + 80) - *(void *)(v9 + 72);
      *(void *)(v9 + 72) = v26;
      *(void *)(v9 + 80) = v22;
      *(void *)(v9 + 88) = v25;
    }

    uint64_t v27 = *(void *)xo_warn_hcv_msg_open;
    *(_BYTE *)(v22 + 8) = xo_warn_hcv_msg_open[8];
    *(void *)uint64_t v22 = v27;
    *(void *)(v9 + 80) += 9LL;
LABEL_28:
    va_list v61 = v62;
    v28 = *(char **)(v9 + 80);
    int64_t v29 = *(void *)(v9 + 72) - (void)v28 + *(void *)(v9 + 88);
    uint64_t v30 = vsnprintf(v28, v29, v15, v62);
    if (v29 <= v30)
    {
      uint64_t v31 = *(void *)(v9 + 72);
      unint64_t v32 = *(void *)(v9 + 80) + v30;
      if (v32 >= v31 + *(void *)(v9 + 88))
      {
        unint64_t v33 = (v32 - v31 + 0x1FFF) & 0xFFFFFFFFFFFFE000LL;
        result = xo_realloc(v31, v33);
        if (!result) {
          return result;
        }
        uint64_t v34 = result + *(void *)(v9 + 80) - *(void *)(v9 + 72);
        *(void *)(v9 + 72) = result;
        *(void *)(v9 + 80) = v34;
        *(void *)(v9 + 88) = v33;
      }

      va_list v62 = v61;
      uint64_t v30 = vsnprintf(*(char **)(v9 + 80), *(void *)(v9 + 88) - *(void *)(v9 + 80) + *(void *)(v9 + 72), __s, v61);
    }

    uint64_t v35 = xo_escape_xml((uint64_t *)(v9 + 72), v30, 1u);
    uint64_t v36 = *(void *)(v9 + 72);
    v37 = (char *)(*(void *)(v9 + 80) + v35);
    *(void *)(v9 + 80) = v37;
    if ((unint64_t)(v37 + 10) >= v36 + *(void *)(v9 + 88))
    {
      unint64_t v38 = (unint64_t)&v37[-v36 + 8201] & 0xFFFFFFFFFFFFE000LL;
      uint64_t v39 = xo_realloc(v36, v38);
      v40 = *(void **)(v9 + 80);
      if (!v39) {
        goto LABEL_37;
      }
      v37 = (char *)v40 + v39 - *(void *)(v9 + 72);
      *(void *)(v9 + 72) = v39;
      *(void *)(v9 + 80) = v37;
      *(void *)(v9 + 88) = v38;
    }

    uint64_t v41 = *(void *)xo_warn_hcv_msg_close;
    *((_WORD *)v37 + 4) = *(_WORD *)&xo_warn_hcv_msg_close[8];
    *(void *)v37 = v41;
    v40 = (void *)(*(void *)(v9 + 80) + 10LL);
    *(void *)(v9 + 80) = v40;
LABEL_37:
    uint64_t v42 = *(void *)(v9 + 72);
    if ((unint64_t)(v40 + 1) >= v42 + *(void *)(v9 + 88))
    {
      unint64_t v43 = ((unint64_t)v40 - v42 + 8199) & 0xFFFFFFFFFFFFE000LL;
      uint64_t v44 = xo_realloc(v42, v43);
      if (!v44) {
        goto LABEL_41;
      }
      v40 = (void *)(v44 + *(void *)(v9 + 80) - *(void *)(v9 + 72));
      *(void *)(v9 + 72) = v44;
      *(void *)(v9 + 80) = v40;
      *(void *)(v9 + 88) = v43;
    }

    void *v40 = xo_warn_hcv_err_close;
    *(void *)(v9 + 80) += 8LL;
LABEL_41:
    if (a2 < 0)
    {
      v46 = *(_BYTE **)(v9 + 80);
      goto LABEL_53;
    }

    v45 = strerror(a2);
    v46 = *(_BYTE **)(v9 + 80);
    if (!v45) {
      goto LABEL_53;
    }
    v47 = v45;
    uint64_t v48 = *(void *)(v9 + 72);
    if ((unint64_t)(v46 + 2) >= v48 + *(void *)(v9 + 88))
    {
      unint64_t v49 = (unint64_t)&v46[-v48 + 8193] & 0xFFFFFFFFFFFFE000LL;
      uint64_t v50 = xo_realloc(v48, v49);
      v46 = *(_BYTE **)(v9 + 80);
      if (!v50)
      {
LABEL_47:
        size_t v51 = strlen(v47);
        if (!v51) {
          goto LABEL_53;
        }
        size_t v52 = v51;
        v53 = &v46[v51];
        uint64_t v54 = *(void *)(v9 + 72);
        if ((unint64_t)v53 >= v54 + *(void *)(v9 + 88))
        {
          unint64_t v55 = (unint64_t)&v53[-v54 + 0x1FFF] & 0xFFFFFFFFFFFFE000LL;
          uint64_t v56 = xo_realloc(v54, v55);
          v46 = *(_BYTE **)(v9 + 80);
          if (!v56) {
            goto LABEL_53;
          }
          v46 = &v46[v56 - *(void *)(v9 + 72)];
          *(void *)(v9 + 72) = v56;
          *(void *)(v9 + 80) = v46;
          *(void *)(v9 + 88) = v55;
        }

        memcpy(v46, v47, v52);
        v46 = (_BYTE *)(*(void *)(v9 + 80) + v52);
        *(void *)(v9 + 80) = v46;
LABEL_53:
        uint64_t v57 = *(void *)(v9 + 72);
        if ((unint64_t)(v46 + 1) >= v57 + *(void *)(v9 + 88))
        {
          unint64_t v58 = (unint64_t)&v46[-v57 + 0x2000] & 0xFFFFFFFFFFFFE000LL;
          uint64_t v59 = xo_realloc(v57, v58);
          if (!v59) {
            return xo_write((void *)v9);
          }
          v46 = (_BYTE *)(v59 + *(void *)(v9 + 80) - *(void *)(v9 + 72));
          *(void *)(v9 + 72) = v59;
          *(void *)(v9 + 80) = v46;
          *(void *)(v9 + 88) = v58;
        }

        _BYTE *v46 = 10;
        ++*(void *)(v9 + 80);
        return xo_write((void *)v9);
      }

      v46 = &v46[v50 - *(void *)(v9 + 72)];
      *(void *)(v9 + 72) = v50;
      *(void *)(v9 + 80) = v46;
      *(void *)(v9 + 88) = v49;
    }

    *(_WORD *)v46 = 8250;
    v46 = (_BYTE *)(*(void *)(v9 + 80) + 2LL);
    *(void *)(v9 + 80) = v46;
    goto LABEL_47;
  }

  v16 = (FILE **)MEMORY[0x1895F89D0];
  vfprintf((FILE *)*MEMORY[0x1895F89D0], v15, a5);
  if ((a2 & 0x80000000) == 0)
  {
    v17 = strerror(a2);
    if (v17) {
      fprintf(*v16, ": %s", v17);
    }
  }

  return fputc(10, *v16);
}

uint64_t xo_warn_c(int a1, char *__s, ...)
{
  return xo_warn_hcv(0LL, a1, 0, __s, va);
}

uint64_t xo_warn( char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  size_t v10 = __error();
  return xo_warn_hcv(0LL, *v10, 0, a1, &a9);
}

uint64_t xo_warnx(char *__s, ...)
{
  return xo_warn_hcv(0LL, -1, 0, __s, va);
}

void xo_err( int a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  v11 = __error();
  uint64_t v12 = xo_warn_hcv(0LL, *v11, 0, a2, &a9);
  xo_finish(v12, v13, v14, v15, v16, v17, v18, v19);
  exit(a1);
}

uint64_t xo_finish( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_finish_h(0LL, a2, a3, a4, a5, a6, a7, a8);
}

void xo_errx(int a1, char *__s, ...)
{
  uint64_t v3 = xo_warn_hcv(0LL, -1, 0, __s, va);
  xo_finish(v3, v4, v5, v6, v7, v8, v9, v10);
  exit(a1);
}

void xo_errc(int a1, int a2, char *__s, ...)
{
  uint64_t v4 = xo_warn_hcv(0LL, a2, 0, __s, va);
  xo_finish(v4, v5, v6, v7, v8, v9, v10, v11);
  exit(a1);
}

uint64_t xo_message_hcv(uint64_t result, int a2, char *__s, va_list a4)
{
  uint64_t v7 = result;
  uint64_t v58 = *MEMORY[0x1895F89C0];
  va_list v56 = a4;
  if (!result)
  {
    if (!*(_DWORD *)xo_default_inited()) {
      xo_default_init();
    }
    result = xo_default_handle();
    uint64_t v7 = result;
  }

  if (__s && *__s)
  {
    result = strlen(__s);
    int v8 = __s[result - 1];
    switch(*(_WORD *)(v7 + 16))
    {
      case 0:
        uint64_t v9 = xo_printf_v(v7, __s, a4);
        if (v9 >= 1)
        {
          if ((*(_BYTE *)(v7 + 2) & 0x20) != 0) {
            *(void *)(v7 + 376) += v9;
          }
          if ((*(_BYTE *)(v7 + 8) & 8) != 0) {
            *(void *)(v7 + 352) += v9;
          }
        }

        if (a2 < 1 || v8 == 10)
        {
          if (v8 == 10) {
            goto LABEL_60;
          }
        }

        else
        {
          uint64_t v16 = strerror(a2);
          if (v16) {
            xo_printf(v7, ": %s", v10, v11, v12, v13, v14, v15, (char)v16);
          }
        }

        xo_printf(v7, "\n", v10, v11, v12, v13, v14, v15, v54[0]);
        goto LABEL_60;
      case 1:
        if ((*(_BYTE *)v7 & 2) != 0) {
          xo_buf_indent((void *)v7, *(unsigned __int16 *)(v7 + 20));
        }
        uint64_t v17 = *(void *)(v7 + 72);
        uint64_t v18 = *(void *)(v7 + 80);
        unint64_t v19 = (v18 + 9 - v17 + 0x1FFF) & 0xFFFFFFFFFFFFE000LL;
        uint64_t v20 = xo_realloc(v17, v19);
        if (v20)
        {
          uint64_t v18 = v20 + *(void *)(v7 + 80) - *(void *)(v7 + 72);
          *(void *)(v7 + 72) = v20;
          *(void *)(v7 + 80) = v18;
          *(void *)(v7 + 88) = v19;
LABEL_22:
          uint64_t v21 = *(void *)xo_message_hcv_msg_open;
          *(_BYTE *)(v18 + 8) = xo_message_hcv_msg_open[8];
          *(void *)uint64_t v18 = v21;
          *(void *)(v7 + 80) += 9LL;
        }

        va_list v55 = v56;
        uint64_t v22 = *(char **)(v7 + 80);
        int64_t v23 = *(void *)(v7 + 72) - (void)v22 + *(void *)(v7 + 88);
        uint64_t v24 = vsnprintf(v22, v23, __s, v56);
        if (v23 > v24) {
          goto LABEL_28;
        }
        uint64_t v25 = *(void *)(v7 + 72);
        unint64_t v26 = *(void *)(v7 + 80) + v24;
        if (v26 < v25 + *(void *)(v7 + 88)) {
          goto LABEL_27;
        }
        unint64_t v27 = (v26 - v25 + 0x1FFF) & 0xFFFFFFFFFFFFE000LL;
        result = xo_realloc(v25, v27);
        if (!result) {
          return result;
        }
        uint64_t v28 = result + *(void *)(v7 + 80) - *(void *)(v7 + 72);
        *(void *)(v7 + 72) = result;
        *(void *)(v7 + 80) = v28;
        *(void *)(v7 + 88) = v27;
LABEL_27:
        va_list v56 = v55;
        uint64_t v24 = vsnprintf( *(char **)(v7 + 80),  *(void *)(v7 + 88) - *(void *)(v7 + 80) + *(void *)(v7 + 72),  __s,  v55);
LABEL_28:
        uint64_t v29 = *(void *)(v7 + 80) + xo_escape_xml((uint64_t *)(v7 + 72), v24, 0);
        *(void *)(v7 + 80) = v29;
        if (a2 < 1 || v8 == 10)
        {
          if (v8 == 10) {
            goto LABEL_50;
          }
        }

        else
        {
          uint64_t v30 = strerror(a2);
          if (v30)
          {
            uint64_t v31 = v30;
            xo_buf_append((void *)(v7 + 72), ": ", 2uLL);
            size_t v32 = strlen(v31);
            xo_buf_append((void *)(v7 + 72), v31, v32);
          }
        }

        uint64_t v41 = *(void *)(v7 + 72);
        uint64_t v42 = *(_BYTE **)(v7 + 80);
        unint64_t v43 = (unint64_t)&v42[-v41 + 0x2000] & 0xFFFFFFFFFFFFE000LL;
        uint64_t v44 = xo_realloc(v41, v43);
        uint64_t v29 = *(void *)(v7 + 80);
        if (v44)
        {
          uint64_t v42 = (_BYTE *)(v44 + v29 - *(void *)(v7 + 72));
          *(void *)(v7 + 72) = v44;
          *(void *)(v7 + 80) = v42;
          *(void *)(v7 + 88) = v43;
LABEL_49:
          *uint64_t v42 = 10;
          uint64_t v29 = *(void *)(v7 + 80) + 1LL;
          *(void *)(v7 + 80) = v29;
        }

LABEL_50:
        uint64_t v45 = *(void *)(v7 + 72);
        unint64_t v46 = (v29 + 10 - v45 + 0x1FFF) & 0xFFFFFFFFFFFFE000LL;
        uint64_t v47 = xo_realloc(v45, v46);
        if (v47)
        {
          uint64_t v29 = v47 + *(void *)(v7 + 80) - *(void *)(v7 + 72);
          *(void *)(v7 + 72) = v47;
          *(void *)(v7 + 80) = v29;
          *(void *)(v7 + 88) = v46;
LABEL_53:
          uint64_t v48 = *(void *)xo_message_hcv_msg_close;
          *(_WORD *)(v29 + 8) = *(_WORD *)&xo_message_hcv_msg_close[8];
          *(void *)uint64_t v29 = v48;
          *(void *)(v7 + 80) += 10LL;
        }

        if ((*(_BYTE *)v7 & 2) == 0) {
          goto LABEL_59;
        }
        uint64_t v49 = *(void *)(v7 + 72);
        uint64_t v50 = *(_BYTE **)(v7 + 80);
        unint64_t v51 = (unint64_t)&v50[-v49 + 0x2000] & 0xFFFFFFFFFFFFE000LL;
        uint64_t v52 = xo_realloc(v49, v51);
        if (v52)
        {
          uint64_t v50 = (_BYTE *)(v52 + *(void *)(v7 + 80) - *(void *)(v7 + 72));
          *(void *)(v7 + 72) = v52;
          *(void *)(v7 + 80) = v50;
          *(void *)(v7 + 88) = v51;
LABEL_58:
          *uint64_t v50 = 10;
          ++*(void *)(v7 + 80);
        }

LABEL_59:
        xo_write((void *)v7);
LABEL_60:
        if (*(_WORD *)(v7 + 16) == 3)
        {
          uint64_t v53 = *(void *)(v7 + 8);
          if ((v53 & 2) != 0)
          {
            *(void *)(v7 + 8) = v53 & 0xFFFFFFFFFFFFFFFDLL;
            xo_data_append((void *)v7, xo_message_hcv_div_close, 6uLL);
            if ((*(_BYTE *)v7 & 2) != 0) {
              xo_data_append((void *)v7, "\n", 1uLL);
            }
          }
        }

LABEL_64:
        result = xo_flush_h(v7);
        break;
      case 2:
      case 4:
      case 5:
        return result;
      case 3:
        va_list v55 = v56;
        uint64_t v33 = 1024LL;
        uint64_t v34 = v57;
        uint64_t v35 = vsnprintf(v57, 0x400uLL, __s, v56);
        uint64_t v36 = (int)v35;
        if ((int)v35 >= 1025)
        {
          uint64_t v33 = (int)v35 + 1024LL;
          MEMORY[0x1895F8858](v35);
          uint64_t v34 = &v54[-((v36 + 1039) & 0xFFFFFFFFFFFFFFF0LL)];
          va_list v55 = v56;
          uint64_t v36 = vsnprintf(v34, v36 + 1024, __s, v56);
        }

        if (v8 != 10)
        {
          v37 = (char *)&xo_version_extra;
          size_t v38 = v33 - v36;
          if (a2 <= 0) {
            uint64_t v39 = (const char *)&xo_version_extra;
          }
          else {
            uint64_t v39 = ": ";
          }
          if (a2 >= 1) {
            v37 = strerror(a2);
          }
          int v40 = snprintf(&v34[v36], v38, "%s%s\n", v39, v37);
          if (v40 >= 1) {
            v36 += v40;
          }
        }

        xo_buf_append_div(v7, "message", 0, 0LL, 0LL, v34, v36, 0LL, 0LL, 0LL, 0LL);
        goto LABEL_60;
      default:
        goto LABEL_64;
    }
  }

  return result;
}

      __divti3();
      result = snprintf(v15, v39, "%s%lld%s%s%s");
LABEL_65:
      uint64_t v31 = result;
LABEL_66:
      if ((int)v31 >= 1)
      {
        a2[1] += v31;
        uint64_t v35 = a3[2];
        *(void *)(v6 + 376) = a3[1] + v31;
        *(void *)(v6 + 352) = v35 + v31;
      }
    }
  }

  return result;
}

char *xo_buf_indent(void *a1, int a2)
{
  int v2 = a2;
  if (a2 <= 0) {
    int v2 = xo_indent((uint64_t)a1);
  }
  uint64_t v5 = a1[9];
  uint64_t v4 = (char *)a1[10];
  uint64_t v6 = &v4[v2];
  if ((unint64_t)v6 >= v5 + a1[11])
  {
    unint64_t v7 = (unint64_t)&v6[-v5 + 0x1FFF] & 0xFFFFFFFFFFFFE000LL;
    result = (char *)xo_realloc(a1[9], v7);
    if (!result) {
      return result;
    }
    uint64_t v9 = result;
    uint64_t v4 = &result[a1[10] - a1[9]];
    a1[9] = v9;
    a1[10] = v4;
    a1[11] = v7;
  }

  result = (char *)memset(v4, 32, v2);
  a1[10] += v2;
  return result;
}

void *xo_buf_append(void *result, void *__src, size_t __n)
{
  if (__src && __n)
  {
    uint64_t v5 = result;
    uint64_t v6 = (char *)result[1];
    if ((unint64_t)&v6[__n] >= *v5 + v5[2])
    {
      size_t v7 = (unint64_t)&v6[__n - *v5 + 0x1FFF] & 0xFFFFFFFFFFFFE000LL;
      result = (void *)xo_realloc(*v5, v7);
      if (!result) {
        return result;
      }
      int v8 = result;
      uint64_t v6 = (char *)result + v5[1] - *v5;
      *uint64_t v5 = v8;
      v5[1] = v6;
      v5[2] = v7;
    }

    result = memcpy(v6, __src, __n);
    v5[1] += __n;
  }

  return result;
}

uint64_t xo_escape_xml(uint64_t *a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3 = a2;
  if (a2 >= 1)
  {
    __int16 v4 = a3;
    uint64_t v6 = 0LL;
    size_t v7 = (unsigned __int8 *)a1[1];
    int v8 = v7;
    do
    {
      int v9 = *v8;
      if (v9 == 38)
      {
        v6 += 4LL;
      }

      else
      {
        if (((v9 == 34) & (a3 >> 9)) != 0) {
          uint64_t v10 = v6 + 5;
        }
        else {
          uint64_t v10 = v6;
        }
        if (v9 == 60) {
          uint64_t v10 = v6 + 3;
        }
        if (v9 == 62) {
          v6 += 3LL;
        }
        else {
          uint64_t v6 = v10;
        }
      }

      ++v8;
    }

    while (v8 < &v7[a2]);
    if (v6)
    {
      uint64_t v11 = *a1;
      if ((unint64_t)&v7[v6] >= *a1 + a1[2])
      {
        unint64_t v12 = (unint64_t)&v7[v6 - v11 + 0x1FFF] & 0xFFFFFFFFFFFFE000LL;
        uint64_t v13 = xo_realloc();
        if (!v13) {
          return 0LL;
        }
        size_t v7 = (unsigned __int8 *)(v13 + a1[1] - *a1);
        *a1 = v13;
        a1[1] = (uint64_t)v7;
        a1[2] = v12;
      }

      uint64_t v14 = &v7[v3 + v6];
      uint64_t v15 = &v7[v3 - 1];
      while (1)
      {
        --v14;
        int v16 = *v15;
        if (v16 == 38) {
          break;
        }
        if (v16 == 60)
        {
          uint64_t v17 = xo_xml_lt;
          goto LABEL_27;
        }

        if (v16 == 62)
        {
          uint64_t v17 = xo_xml_gt;
LABEL_27:
          size_t v18 = strlen(v17);
          uint64_t v14 = &v14[-v18 + 1];
          memcpy(v14, v17, v18);
          goto LABEL_28;
        }

        if ((v4 & 0x200) != 0)
        {
          uint64_t v17 = xo_xml_quot;
          if (v16 == 34) {
            goto LABEL_27;
          }
        }

        *uint64_t v14 = v16;
LABEL_28:
        if (v15 > v7 && v15-- != v14) {
          continue;
        }
        v3 += v6;
        return v3;
      }

      uint64_t v17 = xo_xml_amp;
      goto LABEL_27;
    }
  }

  return v3;
}

uint64_t xo_write(void *a1)
{
  __int16 v4 = a1 + 9;
  int v2 = (_BYTE *)a1[9];
  uint64_t v3 = (_BYTE *)v4[1];
  if (v3 == v2)
  {
    uint64_t result = 0LL;
    goto LABEL_11;
  }

  if (v3 + 1 < &v2[a1[11]]) {
    goto LABEL_5;
  }
  unint64_t v5 = (v3 + 1 - v2 + 0x1FFF) & 0xFFFFFFFFFFFFE000LL;
  uint64_t v6 = xo_realloc();
  if (v6)
  {
    uint64_t v3 = (_BYTE *)(v6 + a1[10] - a1[9]);
    a1[9] = v6;
    a1[10] = v3;
    a1[11] = v5;
LABEL_5:
    _BYTE *v3 = 0;
    ++a1[10];
  }

  a1[1] &= ~8uLL;
  a1[44] = 0LL;
  a1[45] = 0LL;
  a1[43] = 0LL;
  size_t v7 = (uint64_t (*)(void, void))a1[3];
  if (v7) {
    uint64_t result = v7(a1[8], a1[9]);
  }
  else {
    uint64_t result = 0LL;
  }
  a1[10] = a1[9];
LABEL_11:
  a1[1] &= ~0x10uLL;
  return result;
}

void *xo_buf_append_div( unint64_t a1, char *a2, unsigned int a3, void *a4, uint64_t a5, char *a6, uint64_t a7, void *a8, size_t a9, char *a10, size_t a11)
{
  uint64_t v11 = a8;
  v93 = a2;
  unint64_t v19 = a10;
  size_t v20 = a9;
  v94[3] = *MEMORY[0x1895F89C0];
  if (a8 && !a10)
  {
    ((void (*)(void))MEMORY[0x1895F8858])();
    unint64_t v19 = (char *)&v86 - ((a9 + 16) & 0xFFFFFFFFFFFFFFF0LL);
    memcpy(v19, v11, a9);
    v19[a9] = 0;
    if (*v19 == 37 && (v19[1] - 48) <= 9)
    {
      do
      {
        unsigned int v21 = v19[2] - 48;
        ++v19;
      }

      while (v21 < 0xA);
      char *v19 = 37;
    }

    a11 = strlen(v19);
  }

  if (a4 && (a3 & 0xC0) == 0x80LL && (*(_BYTE *)a1 & 0x20) != 0)
  {
    v94[0] = *(void *)(a1 + 200);
    v86 = (void *)(a1 + 200);
    v87 = a6;
    uint64_t v22 = *(void (**)(unint64_t, void, void))(a1 + 56);
    if (v22) {
      v22(a1, *(void *)(a1 + 200), 0LL);
    }
    int64_t v23 = *(_BYTE **)(a1 + 144);
    *(void *)(a1 + 152) = v23;
    if (*(uint64_t *)(a1 + 160) <= 1)
    {
      uint64_t v24 = xo_realloc(v23, 0x2000LL);
      if (!v24) {
        goto LABEL_17;
      }
      uint64_t v25 = v24;
      int64_t v23 = (_BYTE *)(v24 + *(void *)(a1 + 152) - *(void *)(a1 + 144));
      *(void *)(a1 + 144) = v25;
      *(void *)(a1 + 152) = v23;
      *(void *)(a1 + 160) = 0x2000LL;
    }

    *int64_t v23 = 91;
    ++*(void *)(a1 + 152);
LABEL_17:
    xo_buf_escape(a1, (uint64_t *)(a1 + 144), a4, a5, 0);
    uint64_t v26 = *(void *)(a1 + 144);
    unint64_t v27 = *(_DWORD **)(a1 + 152);
    unint64_t v28 = v26 + *(void *)(a1 + 160);
    char v29 = *(_BYTE *)a1;
    v89 = a4;
    if ((v29 & 2) != 0)
    {
      if ((unint64_t)(v27 + 1) >= v28)
      {
        unint64_t v33 = ((unint64_t)v27 - v26 + 8195) & 0xFFFFFFFFFFFFE000LL;
        uint64_t v34 = xo_realloc(v26, v33);
        if (!v34) {
          goto LABEL_27;
        }
        unint64_t v27 = (_DWORD *)(v34 + *(void *)(a1 + 152) - *(void *)(a1 + 144));
        *(void *)(a1 + 144) = v34;
        *(void *)(a1 + 152) = v27;
        *(void *)(a1 + 160) = v33;
      }

      *unint64_t v27 = 656424224;
      uint64_t v32 = 4LL;
    }

    else
    {
      if ((unint64_t)v27 + 2 >= v28)
      {
        unint64_t v30 = ((unint64_t)v27 - v26 + 8193) & 0xFFFFFFFFFFFFE000LL;
        uint64_t v31 = xo_realloc(v26, v30);
        if (!v31) {
          goto LABEL_27;
        }
        unint64_t v27 = (_DWORD *)(v31 + *(void *)(a1 + 152) - *(void *)(a1 + 144));
        *(void *)(a1 + 144) = v31;
        *(void *)(a1 + 152) = v27;
        *(void *)(a1 + 160) = v30;
      }

      *(_WORD *)unint64_t v27 = 10045;
      uint64_t v32 = 2LL;
    }

    *(void *)(a1 + 152) += v32;
LABEL_27:
    xo_do_format_field(a1, (uint64_t *)(a1 + 144), (unsigned __int8 *)v19, a11, a3 & 0xFFFFF4F7 | 0x300);
    uint64_t v35 = *(void *)(a1 + 144);
    uint64_t v36 = *(_WORD **)(a1 + 152);
    if ((unint64_t)(v36 + 1) >= v35 + *(void *)(a1 + 160))
    {
      unint64_t v37 = ((unint64_t)v36 - v35 + 8193) & 0xFFFFFFFFFFFFE000LL;
      uint64_t v38 = xo_realloc(v35, v37);
      if (!v38)
      {
LABEL_31:
        uint64_t v90 = a5;
        size_t v91 = a9;
        uint64_t v92 = a7;
        uint64_t v39 = *(void *)(a1 + 168) + 24LL * *(int *)(a1 + 176);
        uint64_t v42 = *(const char **)(v39 + 16);
        uint64_t v41 = (uint64_t *)(v39 + 16);
        int v40 = v42;
        v88 = v11;
        if (v42) {
          size_t v43 = strlen(v40);
        }
        else {
          size_t v43 = 0LL;
        }
        size_t v44 = *(void *)(a1 + 152) - *(void *)(a1 + 144);
        uint64_t v45 = xo_realloc(v40, v44 + v43 + 1);
        if (v45)
        {
          uint64_t v46 = v45;
          memcpy((void *)(v45 + v43), *(const void **)(a1 + 144), v44);
          *(_BYTE *)(v46 + v44 + v43) = 0;
          *uint64_t v41 = v46;
        }

        void *v86 = v94[0];
        uint64_t v47 = *(void (**)(unint64_t, void, uint64_t))(a1 + 56);
        if (v47) {
          v47(a1, *(void *)(a1 + 200), 1LL);
        }
        a6 = v87;
        uint64_t v11 = v88;
        size_t v20 = v91;
        a7 = v92;
        a4 = v89;
        a5 = v90;
        goto LABEL_39;
      }

      uint64_t v36 = (_WORD *)(v38 + *(void *)(a1 + 152) - *(void *)(a1 + 144));
      *(void *)(a1 + 144) = v38;
      *(void *)(a1 + 152) = v36;
      *(void *)(a1 + 160) = v37;
    }

    *uint64_t v36 = 23847;
    *(void *)(a1 + 152) += 2LL;
    goto LABEL_31;
  }

LABEL_39:
  if ((a3 & 8) != 0) {
    return (void *)xo_do_format_field(a1, 0LL, (unsigned __int8 *)v19, a11, a3 | 0x800);
  }
  xo_line_ensure_open((void *)a1);
  if ((*(_BYTE *)a1 & 2) != 0) {
    xo_buf_indent((void *)a1, *(unsigned __int16 *)(a1 + 20));
  }
  xo_data_append((void *)a1, xo_buf_append_div_div_start, 0xCuLL);
  size_t v48 = strlen(v93);
  xo_data_append((void *)a1, v93, v48);
  uint64_t v49 = *(_BYTE **)(a1 + 408);
  uint64_t v50 = *(_BYTE **)(a1 + 416);
  if (v50 != v49) {
    xo_data_append((void *)a1, v49, v50 - v49);
  }
  if (a4)
  {
    xo_data_append((void *)a1, xo_buf_append_div_div_tag, 0xCuLL);
    xo_buf_escape(a1, (uint64_t *)(a1 + 72), a4, a5, 0);
    uint64_t v51 = *(void *)a1;
    if ((*(void *)a1 & 0x40000) != 0)
    {
      *(void *)(a1 + 8) |= 0x10uLL;
      *(void *)(a1 + 368) = *(void *)(a1 + 80) - *(void *)(a1 + 72) + 1LL;
      if ((v51 & 0x20) == 0)
      {
LABEL_47:
        if ((v51 & 0x40) == 0)
        {
LABEL_77:
          if ((a3 & 0x80) != 0 && (*(_BYTE *)(a1 + 1) & 8) != 0) {
            xo_data_append((void *)a1, xo_buf_append_div_div_key, 0xFuLL);
          }
          goto LABEL_80;
        }

LABEL_71:
        if (*(void *)(a1 + 184))
        {
          v68 = xo_info_find(a1, (uint64_t)a4, a5);
          if (v68)
          {
            v69 = v68;
            if (v68[1])
            {
              xo_data_append((void *)a1, xo_buf_append_div_in_type, 0xDuLL);
              size_t v70 = strlen((const char *)v69[1]);
              xo_buf_escape(a1, (uint64_t *)(a1 + 72), (void *)v69[1], v70, 0);
            }

            if (v69[2])
            {
              xo_data_append((void *)a1, xo_buf_append_div_in_help, 0xDuLL);
              size_t v71 = strlen((const char *)v69[2]);
              xo_buf_escape(a1, (uint64_t *)(a1 + 72), (void *)v69[2], v71, 0);
            }
          }
        }

        goto LABEL_77;
      }
    }

    else if ((v51 & 0x20) == 0)
    {
      goto LABEL_47;
    }

    v89 = a4;
    uint64_t v90 = a5;
    size_t v91 = v20;
    uint64_t v92 = a7;
    xo_data_append((void *)a1, xo_buf_append_div_div_xpath, 0xEuLL);
    uint64_t v53 = *(void **)(a1 + 208);
    if (v53)
    {
      size_t v54 = strlen(*(const char **)(a1 + 208));
      xo_data_append((void *)a1, v53, v54);
    }

    LODWORD(v55) = *(_DWORD *)(a1 + 176);
    if ((v55 & 0x80000000) == 0)
    {
      uint64_t v56 = 0LL;
      uint64_t v57 = 0LL;
      do
      {
        uint64_t v58 = *(void *)(a1 + 168);
        uint64_t v59 = v58 + v56;
        if (*(void *)(v58 + v56 + 8) && (*(_DWORD *)(v59 + 4) | 4) != 7)
        {
          xo_data_append((void *)a1, "/", 1uLL);
          va_list v61 = *(char **)(v59 + 8);
          size_t v62 = strlen(v61);
          xo_buf_escape(a1, (uint64_t *)(a1 + 72), v61, v62, 0);
          uint64_t v63 = *(void **)(v58 + v56 + 16);
          uint64_t v55 = *(unsigned int *)(a1 + 176);
          BOOL v64 = (a3 & 0x80) != 0 && v57 == v55;
          BOOL v65 = !v64;
          if (v63 && v65)
          {
            size_t v67 = strlen(*(const char **)(v58 + v56 + 16));
            xo_data_append((void *)a1, v63, v67);
            LODWORD(v55) = *(_DWORD *)(a1 + 176);
          }
        }

        BOOL v60 = v57++ < (int)v55;
        v56 += 24LL;
      }

      while (v60);
    }

    xo_data_append((void *)a1, "/", 1uLL);
    a4 = v89;
    a5 = v90;
    xo_buf_escape(a1, (uint64_t *)(a1 + 72), v89, v90, 0);
    size_t v20 = v91;
    a7 = v92;
    if ((*(void *)a1 & 0x40) == 0) {
      goto LABEL_77;
    }
    goto LABEL_71;
  }

    if (v28[6])
    {
      snprintf(__str, 0xCuLL, "%u", v28[6]);
      uint64_t v42 = strlen(__str);
      if (v42)
      {
        size_t v43 = v42;
        if ((unint64_t)&v19[v42] >= v17 + v29)
        {
          size_t v44 = (unint64_t)&v19[v42 - v17 + 0x1FFF] & 0xFFFFFFFFFFFFE000LL;
          uint64_t v45 = xo_realloc(v17, v44);
          if (!v45) {
            goto LABEL_77;
          }
          unint64_t v19 = &v19[v45 - v17];
          char v29 = v44;
          uint64_t v17 = v45;
        }

        memcpy(v19, __str, v43);
        v19 += v43;
      }
    }

LABEL_80:
  uint64_t v72 = v20;
  uint64_t v73 = *(void *)(a1 + 72);
  uint64_t v74 = *(void *)(a1 + 80);
  xo_data_append((void *)a1, xo_buf_append_div_div_end, 2uLL);
  uint64_t v75 = *(void *)(a1 + 80) - *(void *)(a1 + 72);
  uint64_t v76 = *(void *)(a1 + 376);
  v94[0] = v75;
  v94[1] = v76;
  v94[2] = *(void *)(a1 + 352);
  if (a7)
  {
    uint64_t appended = xo_data_append_content(a1, a6, a7, a3);
    if ((a3 & 0x8000) == 0) {
      goto LABEL_88;
    }
  }

  else
  {
    uint64_t appended = xo_do_format_field(a1, 0LL, (unsigned __int8 *)v11, v72, a3);
    if ((a3 & 0x8000) == 0) {
      goto LABEL_88;
    }
  }

  size_t v78 = *(void *)(a1 + 80) - (v75 + *(void *)(a1 + 72));
  MEMORY[0x1895F8858](appended);
  v80 = (char *)&v86 - v79;
  memcpy((char *)&v86 - v79, v81, v78);
  v80[v78] = 0;
  xo_format_humanize(a1, (unint64_t *)(a1 + 72), v94, a3);
  uint64_t v82 = *(void *)(a1 + 72);
  uint64_t v83 = *(void *)(a1 + 80);
  unint64_t v84 = v83 + v78 + 15;
  if (v84 >= v82 + *(void *)(a1 + 88))
  {
    unint64_t v85 = (v84 - v82 + 0x1FFF) & 0xFFFFFFFFFFFFE000LL;
    uint64_t v82 = xo_realloc(v82, v85);
    if (!v82) {
      goto LABEL_88;
    }
    uint64_t v83 = v82 + *(void *)(a1 + 80) - *(void *)(a1 + 72);
    *(void *)(a1 + 72) = v82;
    *(void *)(a1 + 80) = v83;
    *(void *)(a1 + 88) = v85;
  }

  memmove((void *)(v82 + v74 - v73 + v78 + 15), (const void *)(v82 + v74 - v73), v83 - (v82 + v74 - v73));
  qmemcpy((void *)(*(void *)(a1 + 72) + v74 - v73), " data-number=", 15);
  memcpy((void *)(*(void *)(a1 + 72) + v74 - v73 + 15), v80, v78);
  *(void *)(a1 + 80) += v78 + 15;
LABEL_88:
  uint64_t result = xo_data_append((void *)a1, xo_buf_append_div_div_close, 6uLL);
  if ((*(_BYTE *)a1 & 2) != 0) {
    return xo_data_append((void *)a1, "\n", 1uLL);
  }
  return result;
}

uint64_t xo_printf_v(uint64_t a1, char *__format, va_list a3)
{
  int64_t v5 = *(void *)(a1 + 72) - *(void *)(a1 + 80) + *(void *)(a1 + 88);
  uint64_t result = vsnprintf(*(char **)(a1 + 80), v5, __format, a3);
  if (v5 <= (int)result)
  {
    uint64_t v7 = *(void *)(a1 + 72);
    unint64_t v8 = *(void *)(a1 + 80) + (int)result;
    if (v8 >= v7 + *(void *)(a1 + 88))
    {
      unint64_t v9 = (v8 - v7 + 0x1FFF) & 0xFFFFFFFFFFFFE000LL;
      uint64_t v10 = xo_realloc(*(void *)(a1 + 72), v9);
      if (!v10) {
        return -1LL;
      }
      uint64_t v11 = v10 + *(void *)(a1 + 80) - *(void *)(a1 + 72);
      *(void *)(a1 + 72) = v10;
      *(void *)(a1 + 80) = v11;
      *(void *)(a1 + 88) = v9;
    }

    uint64_t result = vsnprintf( *(char **)(a1 + 80),  *(void *)(a1 + 88) - *(void *)(a1 + 80) + *(void *)(a1 + 72),  __format,  a3);
  }

  if (result >= 1) {
    *(void *)(a1 + 80) += result;
  }
  return result;
}

uint64_t xo_printf( uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return xo_printf_v(a1, a2, &a9);
}

void *xo_data_append(void *result, void *__src, size_t __n)
{
  if (__src && __n)
  {
    int64_t v5 = result;
    uint64_t v6 = (char *)result[10];
    uint64_t v7 = v5[9];
    if ((unint64_t)&v6[__n] >= v7 + v5[11])
    {
      size_t v8 = (unint64_t)&v6[__n - v7 + 0x1FFF] & 0xFFFFFFFFFFFFE000LL;
      uint64_t result = (void *)xo_realloc(v5[9], v8);
      if (!result) {
        return result;
      }
      unint64_t v9 = result;
      uint64_t v6 = (char *)result + v5[10] - v5[9];
      v5[9] = v9;
      v5[10] = v6;
      v5[11] = v8;
    }

    uint64_t result = memcpy(v6, __src, __n);
    v5[10] += __n;
  }

  return result;
}

uint64_t xo_flush_h(uint64_t a1)
{
  uint64_t v1 = a1;
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited()) {
      xo_default_init();
    }
    uint64_t v1 = xo_default_handle();
  }

  if (*(_WORD *)(v1 + 16) == 5) {
    xo_encoder_handle(v1, 13LL, 0LL, 0LL, 0LL);
  }
  uint64_t v2 = xo_write((void *)v1);
  if ((v2 & 0x8000000000000000LL) == 0)
  {
    uint64_t v3 = *(uint64_t (**)(void))(v1 + 40);
    if (v3)
    {
      if ((v3(*(void *)(v1 + 64)) & 0x80000000) != 0) {
        return -1LL;
      }
    }
  }

  return v2;
}

uint64_t xo_message_hc( uint64_t a1, int a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return xo_message_hcv(a1, a2, a3, &a9);
}

uint64_t xo_message_c(int a1, char *__s, ...)
{
  return xo_message_hcv(0LL, a1, __s, va);
}

uint64_t xo_message_e( char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10 = __error();
  return xo_message_hcv(0LL, *v10, a1, &a9);
}

uint64_t xo_message(char *__s, ...)
{
  return xo_message_hcv(0LL, 0, __s, va);
}

_BYTE *xo_failure(_BYTE *result, char *__s)
{
  if ((*result & 0x10) != 0) {
    return (_BYTE *)xo_warn_hcv((int)result, -1, 1, __s);
  }
  return result;
}

uint64_t xo_create(__int16 a1, uint64_t a2)
{
  uint64_t v4 = xo_realloc(0LL, 472LL);
  uint64_t v5 = v4;
  if (v4)
  {
    *(void *)(v4 + 464) = 0LL;
    *(_OWORD *)(v4 + 432) = 0u;
    *(_OWORD *)(v4 + 448) = 0u;
    *(_OWORD *)(v4 + 400) = 0u;
    *(_OWORD *)(v4 + 416) = 0u;
    *(_OWORD *)(v4 + 368) = 0u;
    *(_OWORD *)(v4 + 384) = 0u;
    *(_OWORD *)(v4 + 336) = 0u;
    *(_OWORD *)(v4 + 352) = 0u;
    *(_OWORD *)(v4 + 304) = 0u;
    *(_OWORD *)(v4 + 320) = 0u;
    *(_OWORD *)(v4 + 272) = 0u;
    *(_OWORD *)(v4 + 288) = 0u;
    *(_OWORD *)(v4 + 240) = 0u;
    *(_OWORD *)(v4 + 256) = 0u;
    *(_OWORD *)(v4 + 208) = 0u;
    *(_OWORD *)(v4 + 224) = 0u;
    *(_OWORD *)(v4 + 176) = 0u;
    *(_OWORD *)(v4 + 192) = 0u;
    *(_OWORD *)(v4 + 144) = 0u;
    *(_OWORD *)(v4 + 160) = 0u;
    *(_OWORD *)(v4 + 112) = 0u;
    *(_OWORD *)(v4 + 128) = 0u;
    *(_OWORD *)(v4 + 80) = 0u;
    *(_OWORD *)(v4 + 96) = 0u;
    *(_OWORD *)(v4 + 48) = 0u;
    *(_OWORD *)(v4 + 64) = 0u;
    *(_OWORD *)(v4 + 16) = 0u;
    *(_OWORD *)(v4 + 32) = 0u;
    *(_OWORD *)uint64_t v4 = 0u;
    *(_WORD *)(v4 + 16) = a1;
    *(void *)uint64_t v4 = a2;
    xo_init_handle(v4);
    *(_WORD *)(v5 + 16) = a1;
  }

  return v5;
}

uint64_t xo_init_handle(uint64_t a1)
{
  uint64_t v2 = (FILE *)*MEMORY[0x1895F89E0];
  *(void *)(a1 + 64) = *MEMORY[0x1895F89E0];
  *(void *)(a1 + 24) = xo_write_to_file;
  *(void *)(a1 + 40) = xo_flush_file;
  int v3 = fileno(v2);
  if (isatty(v3)) {
    *(void *)a1 |= 0x800000uLL;
  }
  if ((xo_locale_inited & 1) == 0)
  {
    xo_locale_inited = 1;
    uint64_t v4 = getenv("LC_ALL");
    if (!v4)
    {
      uint64_t v4 = getenv("LC_CTYPE");
      if (!v4) {
        uint64_t v4 = getenv("LANG");
      }
    }

    if (v4) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = "C";
    }
    setlocale(2, v5);
  }

  *(void *)(a1 + 88) = 0x2000LL;
  uint64_t v6 = xo_realloc(0LL, 0x2000LL);
  *(void *)(a1 + 72) = v6;
  *(void *)(a1 + 80) = v6;
  *(void *)(a1 + 112) = 0x2000LL;
  uint64_t result = xo_realloc(0LL, 0x2000LL);
  *(void *)(a1 + 96) = result;
  *(void *)(a1 + 104) = result;
  uint64_t v8 = *(void *)(a1 + 8);
  if ((v8 & 0x20) == 0)
  {
    *(void *)(a1 + 8) = v8 | 0x20;
    *(_WORD *)(a1 + 20) = 2;
    uint64_t result = xo_depth_check(a1, 128);
    *(void *)(a1 + 8) &= ~0x20uLL;
  }

  return result;
}

void *xo_create_to_file(uint64_t a1, __int16 a2, uint64_t a3)
{
  uint64_t result = (void *)xo_create(a2, a3);
  if (result)
  {
    result[8] = a1;
    result[3] = xo_write_to_file;
    result[4] = xo_close_file;
    result[5] = xo_flush_file;
  }

  return result;
}

uint64_t xo_write_to_file(FILE *a1, const char *a2)
{
  return fprintf(a1, "%s", a2);
}

uint64_t xo_set_file_h(uint64_t a1, uint64_t a2)
{
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited()) {
      xo_default_init();
    }
    a1 = xo_default_handle();
    if (a2) {
      goto LABEL_3;
    }
LABEL_7:
    xo_failure((_BYTE *)a1, "xo_set_file: NULL fp");
    return 0xFFFFFFFFLL;
  }

  if (!a2) {
    goto LABEL_7;
  }
LABEL_3:
  uint64_t v3 = 0LL;
  *(void *)(a1 + 64) = a2;
  *(void *)(a1 + 24) = xo_write_to_file;
  *(void *)(a1 + 32) = xo_close_file;
  *(void *)(a1 + 40) = xo_flush_file;
  return v3;
}

uint64_t xo_set_file(uint64_t a1)
{
  return xo_set_file_h(0LL, a1);
}

_DWORD *xo_destroy(uint64_t a1)
{
  uint64_t v2 = a1;
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited()) {
      xo_default_init();
    }
    uint64_t v2 = xo_default_handle();
  }

  xo_flush_h(v2);
  uint64_t v3 = *(void (**)(void))(v2 + 32);
  if (v3 && (*(_BYTE *)v2 & 1) != 0) {
    v3(*(void *)(v2 + 64));
  }
  xo_free(*(void *)(v2 + 168));
  uint64_t v4 = *(void *)(v2 + 72);
  if (v4) {
    xo_free(v4);
  }
  *(void *)(v2 + 72) = 0LL;
  *(void *)(v2 + 80) = 0LL;
  *(void *)(v2 + 88) = 0LL;
  uint64_t v5 = *(void *)(v2 + 96);
  if (v5) {
    xo_free(v5);
  }
  *(void *)(v2 + 96) = 0LL;
  *(void *)(v2 + 104) = 0LL;
  *(void *)(v2 + 112) = 0LL;
  uint64_t v6 = *(void *)(v2 + 144);
  if (v6) {
    xo_free(v6);
  }
  *(void *)(v2 + 144) = 0LL;
  *(void *)(v2 + 152) = 0LL;
  *(void *)(v2 + 160) = 0LL;
  uint64_t v7 = *(void *)(v2 + 120);
  if (v7) {
    xo_free(v7);
  }
  *(void *)(v2 + 120) = 0LL;
  *(void *)(v2 + 128) = 0LL;
  *(void *)(v2 + 136) = 0LL;
  uint64_t v8 = *(void *)(v2 + 408);
  if (v8) {
    xo_free(v8);
  }
  *(void *)(v2 + 408) = 0LL;
  *(void *)(v2 + 416) = 0LL;
  *(void *)(v2 + 424) = 0LL;
  uint64_t v9 = *(void *)(v2 + 432);
  if (v9) {
    xo_free(v9);
  }
  if (a1) {
    return (_DWORD *)xo_free(v2);
  }
  uint64_t v11 = xo_default_handle();
  *(void *)(v11 + 464) = 0LL;
  *(_OWORD *)(v11 + 432) = 0u;
  *(_OWORD *)(v11 + 448) = 0u;
  *(_OWORD *)(v11 + 400) = 0u;
  *(_OWORD *)(v11 + 416) = 0u;
  *(_OWORD *)(v11 + 368) = 0u;
  *(_OWORD *)(v11 + 384) = 0u;
  *(_OWORD *)(v11 + 336) = 0u;
  *(_OWORD *)(v11 + 352) = 0u;
  *(_OWORD *)(v11 + 304) = 0u;
  *(_OWORD *)(v11 + 320) = 0u;
  *(_OWORD *)(v11 + 272) = 0u;
  *(_OWORD *)(v11 + 288) = 0u;
  *(_OWORD *)(v11 + 240) = 0u;
  *(_OWORD *)(v11 + 256) = 0u;
  *(_OWORD *)(v11 + 208) = 0u;
  *(_OWORD *)(v11 + 224) = 0u;
  *(_OWORD *)(v11 + 176) = 0u;
  *(_OWORD *)(v11 + 192) = 0u;
  *(_OWORD *)(v11 + 144) = 0u;
  *(_OWORD *)(v11 + 160) = 0u;
  *(_OWORD *)(v11 + 112) = 0u;
  *(_OWORD *)(v11 + 128) = 0u;
  *(_OWORD *)(v11 + 80) = 0u;
  *(_OWORD *)(v11 + 96) = 0u;
  *(_OWORD *)(v11 + 48) = 0u;
  *(_OWORD *)(v11 + 64) = 0u;
  *(_OWORD *)(v11 + 16) = 0u;
  *(_OWORD *)(v11 + 32) = 0u;
  *(_OWORD *)uint64_t v11 = 0u;
  uint64_t result = (_DWORD *)xo_default_inited();
  _DWORD *result = 0;
  return result;
}

uint64_t xo_set_style(uint64_t result, __int16 a2)
{
  if (!result)
  {
    if (!*(_DWORD *)xo_default_inited()) {
      xo_default_init();
    }
    uint64_t result = xo_default_handle();
  }

  *(_WORD *)(result + 16) = a2;
  return result;
}

uint64_t xo_get_style(uint64_t a1)
{
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited()) {
      xo_default_init();
    }
    a1 = xo_default_handle();
  }

  return *(unsigned __int16 *)(a1 + 16);
}

uint64_t xo_set_style_name(uint64_t a1, const char *a2)
{
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  int v3 = xo_name_to_style(a2);
  if (v3 < 0) {
    return 0xFFFFFFFFLL;
  }
  __int16 v4 = v3;
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited()) {
      xo_default_init();
    }
    a1 = xo_default_handle();
  }

  uint64_t result = 0LL;
  *(_WORD *)(a1 + 16) = v4;
  return result;
}

uint64_t xo_name_to_style(const char *a1)
{
  if (!strcmp(a1, "xml")) {
    return 1LL;
  }
  if (!strcmp(a1, "json")) {
    return 2LL;
  }
  if (!strcmp(a1, "encoder")) {
    return 5LL;
  }
  uint64_t result = strcmp(a1, "text");
  if ((_DWORD)result)
  {
    if (!strcmp(a1, "html"))
    {
      return 3LL;
    }

    else if (!strcmp(a1, "sdparams"))
    {
      return 4LL;
    }

    else
    {
      return 0xFFFFFFFFLL;
    }
  }

  return result;
}

uint64_t xo_set_options(uint64_t a1, char *__s)
{
  v26[1] = *MEMORY[0x1895F89C0];
  if (!__s) {
    return 0LL;
  }
  uint64_t v2 = __s;
  uint64_t v3 = a1;
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited()) {
      xo_default_init();
    }
    uint64_t v3 = xo_default_handle();
  }

  if (*v2 == 58)
  {
    uint64_t v5 = v2 + 1;
    char v4 = v2[1];
    if (v4)
    {
      do
      {
        if (v4 > 98)
        {
          switch(v4)
          {
            case 'c':
              uint64_t v6 = *(void *)v3 | 0x2000000LL;
              goto LABEL_31;
            case 'd':
            case 'e':
            case 'h':
            case 'j':
            case 'l':
            case 'm':
              break;
            case 'f':
              uint64_t v6 = *(void *)v3 | 0x400000LL;
              goto LABEL_31;
            case 'g':
              uint64_t v6 = *(void *)v3 | 0x10000000LL;
              goto LABEL_31;
            case 'i':
              int64_t v7 = strspn(v2 + 2, "0123456789");
              if (v7 >= 1)
              {
                int64_t v8 = v7;
                *(_WORD *)(v3 + 20) = atoi(v2 + 2);
                uint64_t v5 = &v2[v8];
              }

              break;
            case 'k':
              uint64_t v6 = *(void *)v3 | 0x800LL;
              goto LABEL_31;
            case 'n':
              uint64_t v6 = *(void *)v3 | 0x8000000LL;
              goto LABEL_31;
            default:
              if (v4 == 117)
              {
                uint64_t v6 = *(void *)v3 | 0x100000LL;
              }

              else
              {
                if (v4 != 120) {
                  break;
                }
                uint64_t v6 = *(void *)v3 | 0x20LL;
              }

LABEL_31:
              *(void *)uint64_t v3 = v6;
              break;
          }
        }

        else
        {
          switch(v4)
          {
            case 'F':
              uint64_t v6 = *(void *)v3 | 0x800000LL;
              goto LABEL_31;
            case 'H':
              *(_WORD *)(v3 + 16) = 3;
              break;
            case 'I':
              uint64_t v6 = *(void *)v3 | 0x40LL;
              goto LABEL_31;
            case 'J':
              *(_WORD *)(v3 + 16) = 2;
              break;
            case 'P':
              uint64_t v6 = *(void *)v3 | 2LL;
              goto LABEL_31;
            case 'T':
              *(_WORD *)(v3 + 16) = 0;
              break;
            case 'U':
              uint64_t v6 = *(void *)v3 | 0x40000LL;
              goto LABEL_31;
            case 'W':
              uint64_t v6 = *(void *)v3 | 0x10LL;
              goto LABEL_31;
            case 'X':
              *(_WORD *)(v3 + 16) = 1;
              break;
            default:
              break;
          }
        }

        uint64_t v2 = v5;
        int v9 = *++v5;
        char v4 = v9;
      }

      while (v9);
    }

    return 0LL;
  }

  size_t v10 = strlen(v2);
  size_t v11 = v10 + 1;
  unint64_t v12 = (unsigned __int8 *)v26 - ((MEMORY[0x1895F8858](v10) + 16) & 0xFFFFFFFFFFFFFFF0LL);
  memcpy(v12, v2, v11);
  unint64_t v13 = (unint64_t)&v12[v11 - 1];
  uint64_t v14 = 0LL;
  int v15 = -1;
  do
  {
    int v16 = strchr((const char *)v12, 44);
    uint64_t v17 = v16;
    if (v16)
    {
      *int v16 = 0;
      uint64_t v17 = v16 + 1;
    }

    if (*v12 == 64)
    {
      int v19 = v12[1];
      size_t v18 = (char *)(v12 + 1);
      if (!v19) {
        goto LABEL_71;
      }
      uint64_t v14 = xo_encoder_init((_BYTE *)v3, v18);
      if (!(_DWORD)v14) {
        goto LABEL_72;
      }
LABEL_41:
      xo_warnx("error initializing encoder: %s");
LABEL_49:
      if (!v17) {
        break;
      }
      goto LABEL_73;
    }

    size_t v20 = strchr((const char *)v12, 61);
    unsigned int v21 = v20;
    if (v20)
    {
      *size_t v20 = 0;
      unsigned int v21 = v20 + 1;
    }

    if (!strcmp("colors", (const char *)v12))
    {
      xo_set_color_map(v3, v21);
      if (!v17) {
        break;
      }
      goto LABEL_73;
    }

    int v22 = xo_name_to_style((const char *)v12);
    if ((v22 & 0x80000000) == 0 && v22 != 5)
    {
      if (v15 < 0)
      {
        int v15 = v22;
        if (!v17) {
          break;
        }
        goto LABEL_73;
      }

      xo_warnx("ignoring multiple styles: '%s'");
      goto LABEL_49;
    }

    uint64_t v23 = xo_name_lookup(xo_xof_names, (char *)v12, 0xFFFFFFFFFFFFFFFFLL);
    if (v23)
    {
      unint64_t v24 = *(void *)v3 | v23;
      goto LABEL_55;
    }

    if (!strcmp((const char *)v12, "no-color"))
    {
      unint64_t v24 = *(void *)v3 & 0xFFFFFFFFFDFFFFFFLL;
LABEL_55:
      *(void *)uint64_t v3 = v24;
      if (!v17) {
        break;
      }
      goto LABEL_73;
    }

    if (strcmp((const char *)v12, "indent"))
    {
      if (strcmp((const char *)v12, "encoder"))
      {
        xo_warnx("unknown libxo option value: '%s'", (const char *)v12);
        uint64_t v14 = 0xFFFFFFFFLL;
        if (!v17) {
          break;
        }
        goto LABEL_73;
      }

      if (!v21)
      {
LABEL_71:
        xo_failure((_BYTE *)v3, "missing value for encoder option");
LABEL_72:
        if (!v17) {
          break;
        }
        goto LABEL_73;
      }

      uint64_t v14 = xo_encoder_init((_BYTE *)v3, v21);
      if (!(_DWORD)v14) {
        goto LABEL_72;
      }
      goto LABEL_41;
    }

    if (v21)
    {
      *(_WORD *)(v3 + 20) = atoi(v21);
      if (!v17) {
        break;
      }
      goto LABEL_73;
    }

    xo_failure((_BYTE *)v3, "missing value for indent option");
    if (!v17) {
      break;
    }
LABEL_73:
    unint64_t v12 = (unsigned __int8 *)v17;
  }

  while ((unint64_t)v17 < v13);
  if (v15 >= 1) {
    *(_WORD *)(v3 + 16) = v15;
  }
  return v14;
}

uint64_t xo_set_color_map(uint64_t result, char *__s)
{
  uint64_t v2 = __s;
  uint64_t v3 = (void *)result;
  if (__s)
  {
    uint64_t result = strlen(__s);
    uint64_t v4 = result + 1;
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  unint64_t v5 = (unint64_t)&v2[v4 - 1];
  uint64_t v6 = 1LL;
  uint64_t v7 = 385LL;
  while (v2)
  {
    int v9 = strchr(v2, 43);
    size_t v10 = v9;
    if (v9)
    {
      *int v9 = 0;
      size_t v10 = v9 + 1;
    }

    uint64_t result = (uint64_t)strchr(v2, 47);
    size_t v11 = (const char *)result;
    if (result)
    {
      *(_BYTE *)uint64_t result = 0;
      size_t v11 = (const char *)(result + 1);
    }

    if (*v2)
    {
      uint64_t v12 = 0LL;
      while (1)
      {
        uint64_t result = strcmp(xo_color_names[v12], v2);
        if (!(_DWORD)result) {
          break;
        }
        if (++v12 == 9) {
          goto LABEL_18;
        }
      }
    }

    else
    {
LABEL_18:
      LODWORD(v12) = -1;
    }

    if (v11 && *v11)
    {
      uint64_t v13 = 0LL;
      while (1)
      {
        uint64_t result = strcmp(xo_color_names[v13], v11);
        if (!(_DWORD)result) {
          break;
        }
        if (++v13 == 9) {
          goto LABEL_24;
        }
      }

      else {
        char v16 = v6;
      }
      *((_BYTE *)v3 + v6 + 384) = v16;
      else {
        char v15 = v6;
      }
    }

    else
    {
LABEL_24:
      else {
        char v14 = v6;
      }
      *((_BYTE *)v3 + v6 + 384) = v14;
      char v15 = v6;
    }

    *((_BYTE *)v3 + v6++ + 393) = v15;
    ++v7;
    uint64_t v2 = v10;
    if (v6 == 10)
    {
      *v3 |= 0x100000000uLL;
      return result;
    }
  }

  uint64_t v17 = *v3;
  if (v6 <= 1)
  {
    void *v3 = v17 & 0xFFFFFFFEFFFFFFFFLL;
  }

  else
  {
    void *v3 = v17 | 0x100000000LL;
  }

  do
  {
    size_t v18 = (char *)v3 + v7;
    v18[9] = v7 + 0x80;
    *size_t v18 = v7++ + 0x80;
  }

  while (v7 != 393);
  return result;
}

void *xo_set_flags(void *result, uint64_t a2)
{
  if (!result)
  {
    if (!*(_DWORD *)xo_default_inited()) {
      xo_default_init();
    }
    uint64_t result = (void *)xo_default_handle();
  }

  *result |= a2;
  return result;
}

uint64_t xo_get_flags(uint64_t a1)
{
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited()) {
      xo_default_init();
    }
    a1 = xo_default_handle();
  }

  return *(void *)a1;
}

_BYTE *xo_set_leading_xpath(uint64_t a1, char *__s)
{
  uint64_t v3 = a1;
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited()) {
      xo_default_init();
    }
    uint64_t v3 = xo_default_handle();
  }

  uint64_t result = *(_BYTE **)(v3 + 208);
  if (result)
  {
    uint64_t result = (_BYTE *)xo_free(result);
    *(void *)(v3 + 208) = 0LL;
  }

  if (__s)
  {
    uint64_t result = xo_strndup(__s, 0xFFFFFFFFFFFFFFFFLL);
    *(void *)(v3 + 208) = result;
  }

  return result;
}

_BYTE *xo_strndup(char *__s, size_t a2)
{
  size_t v2 = a2;
  if ((a2 & 0x8000000000000000LL) != 0) {
    size_t v2 = strlen(__s);
  }
  uint64_t v4 = (_BYTE *)xo_realloc(0LL, v2 + 1);
  unint64_t v5 = v4;
  if (v4)
  {
    memcpy(v4, __s, v2);
    v5[v2] = 0;
  }

  return v5;
}

uint64_t xo_set_info(uint64_t result, void *a2, int a3)
{
  if (!result)
  {
    if (!*(_DWORD *)xo_default_inited()) {
      xo_default_init();
    }
    uint64_t result = xo_default_handle();
  }

  if (a2 && a3 < 0)
  {
    if (*a2)
    {
      a3 = 0;
      unint64_t v5 = a2 + 3;
      do
      {
        ++a3;
        uint64_t v6 = *v5;
        v5 += 3;
      }

      while (v6);
    }

    else
    {
      a3 = 0;
    }
  }

  *(void *)(result + 184) = a2;
  *(_DWORD *)(result + 192) = a3;
  return result;
}

uint64_t xo_set_formatter(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (!result)
  {
    if (!*(_DWORD *)xo_default_inited()) {
      xo_default_init();
    }
    uint64_t result = xo_default_handle();
  }

  *(void *)(result + 48) = a2;
  *(void *)(result + 56) = a3;
  return result;
}

void *xo_clear_flags(void *result, uint64_t a2)
{
  if (!result)
  {
    if (!*(_DWORD *)xo_default_inited()) {
      xo_default_init();
    }
    uint64_t result = (void *)xo_default_handle();
  }

  *result &= ~a2;
  return result;
}

uint64_t xo_simplify_format(uint64_t a1, char *a2, int a3, void (*a4)(uint64_t, void, void))
{
  uint64_t v7 = a1;
  uint64_t v61 = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited()) {
      xo_default_init();
    }
    uint64_t v7 = xo_default_handle();
  }

  *(void *)(v7 + 376) = 0LL;
  int64_t v8 = __error();
  *(_DWORD *)(v7 + 440) = *v8;
  int v9 = 1;
  for (uint64_t i = a2; ; ++i)
  {
    int v11 = *i;
    if (v11 != 10 && v11 != 123) {
      break;
    }
    ++v9;
LABEL_11:
    ;
  }

  if (*i) {
    goto LABEL_11;
  }
  unsigned int v12 = (2 * v9) | 1;
  MEMORY[0x1895F8858](v8);
  char v14 = &__str[-(v12 * (unint64_t)v13) - 4];
  bzero(v14, v15);
  if (!xo_parse_fields((_BYTE *)v7, (uint64_t)v14, v12, a2))
  {
    uint64_t v18 = xo_realloc(0LL, 0x2000LL);
    int v19 = (_BYTE *)v18;
    if (a3)
    {
      unsigned int v20 = 0;
      uint64_t v21 = 0LL;
      for (j = v14 + 88; ; j += 24)
      {
        int v23 = *(j - 20);
        if (v23 > 70)
        {
          if (v23 == 71 || v23 == 123) {
            continue;
          }
        }

        else
        {
          if (v23 == 10 || v23 == 43) {
            continue;
          }
          if (!v23) {
            break;
          }
        }

        if (++v20 > 0x3E) {
          break;
        }
        if (*j) {
          v21 |= 1LL << *j;
        }
      }

      unsigned int v24 = 0;
      for (k = v14; ; k += 96)
      {
        int v26 = *((_DWORD *)k + 2);
        if (v26 > 70)
        {
          if (v26 == 71 || v26 == 123) {
            continue;
          }
        }

        else
        {
          if (v26 == 10 || v26 == 43) {
            continue;
          }
          if (!v26) {
            break;
          }
        }

        if (!*((_DWORD *)k + 22))
        {
          do
            ++v24;
          while (((1LL << v24) & v21) != 0);
          if (v24 > v20) {
            break;
          }
          *((_DWORD *)k + 22) = v24;
          v21 |= 1LL << v24;
        }
      }
    }

    int v27 = *((_DWORD *)v14 + 2);
    if (!v27)
    {
      uint64_t v29 = 0x2000LL;
      uint64_t v17 = v18;
LABEL_102:
      if ((unint64_t)(v19 + 1) >= v17 + v29)
      {
        uint64_t v57 = xo_realloc(v17, (unint64_t)&v19[-v17 + 0x2000] & 0xFFFFFFFFFFFFE000LL);
        if (!v57) {
          return v17;
        }
        int v19 = &v19[v57 - v17];
        uint64_t v17 = v57;
      }

      _BYTE *v19 = 0;
      return v17;
    }

    unint64_t v28 = (unsigned int *)(v14 + 64);
    uint64_t v29 = 0x2000LL;
    uint64_t v17 = v18;
    while (1)
    {
      uint64_t v30 = *((void *)v28 - 8);
      if ((v30 & 0x80000) != 0)
      {
        if (a4)
        {
          if (v27 != 86)
          {
            uint64_t v31 = *((void *)v28 - 5);
            if (v31) {
              a4(v31, *v28, (v30 >> 20) & 1);
            }
          }
        }
      }

      if (v27 > 70) {
        break;
      }
      if (v27 != 10)
      {
        if (v27 == 43)
        {
          uint64_t v32 = (const void *)*((void *)v28 - 5);
          if (!v32) {
            goto LABEL_97;
          }
          size_t v33 = *(void *)v28;
          if (!*(void *)v28) {
            goto LABEL_97;
          }
          if ((unint64_t)&v19[v33] >= v17 + v29)
          {
            unint64_t v34 = (unint64_t)&v19[v33 - v17 + 0x1FFF] & 0xFFFFFFFFFFFFE000LL;
            uint64_t v35 = xo_realloc(v17, v34);
            if (!v35) {
              goto LABEL_97;
            }
            int v19 = &v19[v35 - v17];
            uint64_t v29 = v34;
            uint64_t v17 = v35;
          }

          memcpy(v19, v32, v33);
          goto LABEL_96;
        }

        goto LABEL_62;
      }

      unint64_t v55 = (unint64_t)&v19[-v17 + 0x2000] & 0xFFFFFFFFFFFFE000LL;
      uint64_t v56 = xo_realloc(v17, v55);
      if (v56)
      {
        int v19 = &v19[v56 - v17];
        uint64_t v29 = v55;
        uint64_t v17 = v56;
LABEL_94:
        char v54 = 10;
LABEL_95:
        _BYTE *v19 = v54;
        size_t v33 = 1LL;
LABEL_96:
        v19 += v33;
      }

LABEL_97:
      int v27 = v28[10];
      v28 += 24;
      if (!v27) {
        goto LABEL_102;
      }
    }

    if (v27 == 71) {
      goto LABEL_97;
    }
    if (v27 == 123)
    {
      if ((unint64_t)(v19 + 1) >= v17 + v29)
      {
        unint64_t v36 = (unint64_t)&v19[-v17 + 0x2000] & 0xFFFFFFFFFFFFE000LL;
        uint64_t v37 = xo_realloc(v17, v36);
        if (!v37)
        {
LABEL_81:
          size_t v48 = (const void *)*((void *)v28 - 5);
          if (v48)
          {
            size_t v49 = *(void *)v28;
            if (*(void *)v28)
            {
              if ((unint64_t)&v19[v49] < v17 + v29)
              {
LABEL_86:
                memcpy(v19, v48, v49);
                v19 += v49;
                goto LABEL_87;
              }

              unint64_t v50 = (unint64_t)&v19[v49 - v17 + 0x1FFF] & 0xFFFFFFFFFFFFE000LL;
              uint64_t v51 = xo_realloc(v17, v50);
              if (v51)
              {
                int v19 = &v19[v51 - v17];
                uint64_t v29 = v50;
                uint64_t v17 = v51;
                goto LABEL_86;
              }
            }
          }

LABEL_87:
          unint64_t v52 = (unint64_t)&v19[-v17 + 0x2000] & 0xFFFFFFFFFFFFE000LL;
          uint64_t v53 = xo_realloc(v17, v52);
          if (v53)
          {
            int v19 = &v19[v53 - v17];
            uint64_t v29 = v52;
            uint64_t v17 = v53;
LABEL_90:
            char v54 = 125;
            goto LABEL_95;
          }

          goto LABEL_97;
        }

        int v19 = &v19[v37 - v17];
        uint64_t v29 = v36;
        uint64_t v17 = v37;
      }

      *v19++ = 123;
      goto LABEL_81;
    }

LABEL_62:
    if ((unint64_t)(v19 + 1) >= v17 + v29)
    {
      unint64_t v38 = (unint64_t)&v19[-v17 + 0x2000] & 0xFFFFFFFFFFFFE000LL;
      uint64_t v39 = xo_realloc(v17, v38);
      if (!v39) {
        goto LABEL_66;
      }
      int v19 = &v19[v39 - v17];
      uint64_t v29 = v38;
      uint64_t v17 = v39;
    }

    *v19++ = 123;
LABEL_66:
    if (v27 != 86)
    {
      if ((unint64_t)(v19 + 1) < v17 + v29)
      {
LABEL_70:
        *v19++ = v27;
        goto LABEL_71;
      }

      unint64_t v40 = (unint64_t)&v19[-v17 + 0x2000] & 0xFFFFFFFFFFFFE000LL;
      uint64_t v41 = xo_realloc(v17, v40);
      if (v41)
      {
        int v19 = &v19[v41 - v17];
        uint64_t v29 = v40;
        uint64_t v17 = v41;
        goto LABEL_70;
      }
    }

LABEL_77:
    if ((unint64_t)(v19 + 1) >= v17 + v29)
    {
      unint64_t v46 = (unint64_t)&v19[-v17 + 0x2000] & 0xFFFFFFFFFFFFE000LL;
      uint64_t v47 = xo_realloc(v17, v46);
      if (!v47) {
        goto LABEL_81;
      }
      int v19 = &v19[v47 - v17];
      uint64_t v29 = v46;
      uint64_t v17 = v47;
    }

    *v19++ = 58;
    goto LABEL_81;
  }

  return 0LL;
}

uint64_t xo_parse_fields(_BYTE *a1, uint64_t a2, unsigned int a3, char *a4)
{
  if (*a4) {
    BOOL v4 = a3 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    int v10 = 0;
    unsigned int v11 = 0;
    uint64_t v12 = a2;
    unsigned int v13 = a4;
    while (1)
    {
      unsigned int v14 = v11;
      *(void *)(v12 + 16) = v13;
      int v15 = *v13;
      if (v15 == 10)
      {
        *(_DWORD *)(v12 + 8) = 10;
        *(void *)(v12 + 56) = 1LL;
        ++v13;
        goto LABEL_23;
      }

      if (v15 != 123)
      {
        uint64_t v19 = 0LL;
        *(_DWORD *)(v12 + 8) = 43;
        *(void *)(v12 + 24) = v13;
        *(void *)(v12 + 64) = v19;
        v13 += v19;
        *(void *)(v12 + 48) = v13;
        goto LABEL_23;
      }

      int v16 = v13[1];
      *(void *)(v12 + 16) = v13 + 1;
      if (v16 == 123)
      {
        *(_DWORD *)(v12 + 8) = 123;
        for (uint64_t i = 2LL; ; ++i)
        {
          if (v13[i] == 125)
          {
            uint64_t v18 = (unsigned __int8 *)&v13[i];
            if (v13[i + 1] == 125)
            {
              *(void *)(v12 + 56) = i;
              if (*v18 == 125) {
                uint64_t v18 = (unsigned __int8 *)&v13[2 * (v18[1] == 125) + i];
              }
              *(void *)(v12 + 48) = v18;
              unsigned int v13 = (char *)v18;
              goto LABEL_23;
            }
          }

          else if (!v13[i])
          {
            xo_printable((uint64_t)a4);
            uint64_t v37 = "missing closing '}}': '%s'";
            goto LABEL_81;
          }
        }
      }

      uint64_t v21 = xo_parse_roles(a1, (uint64_t)a4, v13 + 1, v12);
      if (!v21) {
        return 0xFFFFFFFFLL;
      }
      if (*(_DWORD *)(v12 + 88)) {
        int v10 = 1;
      }
      if (*v21 != 58)
      {
        xo_printable((uint64_t)a4);
        uint64_t v37 = "missing content (':'): '%s'";
        goto LABEL_81;
      }

      for (uint64_t j = 1LL; ; ++j)
      {
        unsigned int v23 = v21[j];
        if (v23 <= 0x5B) {
          break;
        }
        if (v23 == 92)
        {
          if (!v21[++j])
          {
LABEL_80:
            uint64_t v37 = "backslash at the end of string";
            goto LABEL_81;
          }
        }

        else if (v23 == 125)
        {
          goto LABEL_43;
        }

LABEL_42:
        ;
      }

      if (v21[j] && v23 != 47) {
        goto LABEL_42;
      }
LABEL_43:
      unsigned int v24 = &v21[j];
      uint64_t v25 = j - 1;
      if (v25)
      {
        *(void *)(v12 + 64) = v25;
        *(void *)(v12 + 24) = v21 + 1;
        unsigned int v23 = *v24;
      }

      if (v23 != 47)
      {
        unint64_t v28 = 0LL;
        int v26 = 0LL;
        goto LABEL_66;
      }

      int v26 = ++v24;
      while (2)
      {
        unsigned int v23 = *v24;
        if (v23 > 0x5B)
        {
          if (v23 == 92)
          {
            if (!*++v24) {
              goto LABEL_80;
            }
          }

          else if (v23 == 125)
          {
            break;
          }

          goto LABEL_55;
        }

        if (*v24 && v23 != 47)
        {
LABEL_55:
          ++v24;
          continue;
        }

        break;
      }

      unint64_t v28 = (_BYTE *)(v24 - v26);
      if (v23 == 47)
      {
        uint64_t v29 = 0LL;
        uint64_t v30 = v24 + 1;
        while (v30[v29] && v30[v29] != 125)
          ++v29;
        *(void *)(v12 + 40) = v30;
        *(void *)(v12 + 80) = v29;
        unsigned int v24 = &v30[v29];
        unsigned int v23 = *v24;
      }

LABEL_66:
      if (v23 != 125)
      {
        xo_printable((uint64_t)a4);
        uint64_t v37 = "missing closing '}': %s";
LABEL_81:
        xo_failure(a1, v37);
        return 0xFFFFFFFFLL;
      }

      uint64_t v31 = &v24[-*(void *)(v12 + 16)];
      unsigned int v13 = v24 + 1;
      *(void *)(v12 + 48) = v13;
      *(void *)(v12 + 56) = v31;
      if (*(void *)(v12 + 64)) {
        BOOL v32 = 0;
      }
      else {
        BOOL v32 = v26 == 0LL;
      }
      if (v32)
      {
        if ((*(_BYTE *)(v12 + 2) & 0x20) == 0) {
          goto LABEL_23;
        }
      }

      else if (v26)
      {
        *(void *)(v12 + 32) = v26;
        *(void *)(v12 + 72) = v28;
        goto LABEL_23;
      }

      unsigned int v33 = *(_DWORD *)(v12 + 8) - 67;
      BOOL v34 = v33 > 0x1A;
      int v35 = (1 << v33) & 0x5000011;
      if (v34 || v35 == 0)
      {
        *(void *)(v12 + 32) = "%s";
        *(void *)(v12 + 72) = 2LL;
      }

  unsigned int v33 = (char)v32;
  BOOL v34 = (char)v32 - 48;
  if (v34 <= 9)
  {
    if ((v31 & 0x80000000) != 0)
    {
      uint64_t v31 = v33 == 48;
      HIDWORD(v119) = v33 == 48;
      BOOL v34 = (char)*v17 - 48;
    }

    int v35 = (char *)&v119 + 4 * v29;
    unint64_t v36 = *((_DWORD *)v35 + 5);
    if (v36 <= 0) {
      uint64_t v37 = 0;
    }
    else {
      uint64_t v37 = 10 * v36;
    }
    *((_DWORD *)v35 + 5) = v34 + v37;
    goto LABEL_83;
  }

  if (v33 == 42)
  {
    ++LODWORD(v123[0]);
    *((_BYTE *)v123 + v29 + 4) = 1;
    goto LABEL_83;
  }

  v108 = v23;
  uint64_t v38 = v31;
  uint64_t v39 = v7;
  uint64_t v7 = v25;
  v113 = v26;
  v115 = v27;
  int v40 = v28;
  uint64_t v25 = v24;
  if (memchr("diouxXDOUeEfFgGaAcCsSpm", v33, 0x18uLL))
  {
    int v15 = (unint64_t)v112;
    LOBYTE(v24) = v25;
    int v22 = v114;
    LOBYTE(v25) = v7;
    LOWORD(v7) = v39;
    unint64_t v5 = v107;
    LODWORD(v31) = v38;
    unsigned int v23 = v108;
    goto LABEL_86;
  }

  int v27 = v115;
  int v26 = v113;
  unsigned int v23 = v108;
  if (v33 != 118)
  {
    unsigned int v24 = v25;
    unint64_t v28 = v40;
    uint64_t v25 = v7;
    uint64_t v7 = v39;
    uint64_t v31 = v38;
  }

  v95 = "unsupported format: '%s'";
LABEL_246:
  xo_failure((_BYTE *)a1, v95);
  return -1LL;
}

LABEL_23:
      unsigned int v11 = v14 + 1;
      v12 += 96LL;
      if (*v13) {
        BOOL v20 = v11 >= a3;
      }
      else {
        BOOL v20 = 1;
      }
      if (v20)
      {
        if (v10)
        {
          uint64_t v38 = 0LL;
          uint64_t v39 = (unsigned int *)(a2 + 88);
          int v40 = -1;
          while (1)
          {
            unsigned int v41 = *v39;
            if (*v39)
            {
              if (v41 > v11)
              {
                uint64_t v37 = "field number exceeds number of fields: '%s'";
                goto LABEL_81;
              }
            }

            else
            {
              unsigned int v41 = v40 + 2;
              *uint64_t v39 = v40 + 2;
            }

            if (v41 <= 0x40)
            {
              uint64_t v42 = 1LL << (v41 - 1);
              if ((v42 & v38) != 0)
              {
                uint64_t v37 = "field number %u reused: '%s'";
                goto LABEL_81;
              }

              v38 |= v42;
            }

            uint64_t result = 0LL;
            v39 += 24;
            if (v14 == ++v40) {
              return result;
            }
          }
        }

        return 0LL;
      }
    }
  }

  return 0LL;
}

uint64_t xo_emit_hv(unint64_t a1, char *a2, uint64_t a3)
{
  unint64_t v4 = a1;
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited()) {
      xo_default_init();
    }
    unint64_t v4 = xo_default_handle();
  }

  *(void *)(v4 + 200) = a3;
  uint64_t result = (int)xo_do_emit(v4, 0, a2);
  *(void *)(v4 + 200) = 0LL;
  return result;
}

uint64_t xo_do_emit(unint64_t a1, int a2, char *a3)
{
  v28[1] = *MEMORY[0x1895F89C0];
  *(void *)(a1 + 376) = 0LL;
  uint64_t v6 = __error();
  *(_DWORD *)(a1 + 440) = *v6;
  if (!a3) {
    return 0LL;
  }
  BOOL v7 = ((a2 | (*(_DWORD *)a1 >> 30)) & 1) == 0 || *(int *)a1 < 0;
  char v8 = v7;
  if (!v7)
  {
    uint64_t v6 = (int *)xo_retain_count();
    if (*v6)
    {
      v28[0] = a3;
      uint64_t v6 = (int *)xo_retain(&xo_retain, v9);
      unsigned int v11 = &v6[2 * v10];
      while (1)
      {
        unsigned int v11 = *(int **)v11;
        if (!v11) {
          break;
        }
        if (*((char **)v11 + 2) == a3)
        {
          uint64_t v12 = (char *)*((void *)v11 + 4);
          unsigned int v13 = v11[6];
          ++*((void *)v11 + 1);
          if (v12) {
            return xo_do_emit_fields(a1, (uint64_t)v12, v13);
          }
          break;
        }
      }
    }
  }

  int v14 = 1;
  for (uint64_t i = a3; ; ++i)
  {
    int v16 = *i;
    if (v16 != 10 && v16 != 123) {
      break;
    }
    ++v14;
LABEL_20:
    ;
  }

  if (*i) {
    goto LABEL_20;
  }
  unsigned int v13 = (2 * v14) | 1;
  MEMORY[0x1895F8858](v6);
  uint64_t v12 = (char *)v28 - v13 * (unint64_t)v17;
  bzero(v12, 96LL * v13);
  if ((v8 & 1) == 0)
  {
    v28[0] = a3;
    uint64_t v20 = xo_realloc(0LL, (96LL * (2 * v14 + 2)) | 0x28);
    if (v20)
    {
      uint64_t v21 = v20;
      unsigned int v22 = 9 * ((a3 >> 4) & 0xFFFFFF ^ (((a3 >> 4) & 0xFFFFFF) >> 16) ^ 0x3D);
      unsigned int v23 = ((982451653 * (v22 ^ (v22 >> 4))) ^ ((982451653 * (v22 ^ (v22 >> 4))) >> 15)) & 0x3F;
      uint64_t v24 = v20 + 40;
      memcpy((void *)(v20 + 40), v12, 96LL * v13);
      *(_OWORD *)uint64_t v21 = 0u;
      *(_OWORD *)(v21 + 16) = 0u;
      *(void *)(v21 + 16) = a3;
      *(void *)(v21 + 32) = v24;
      *(_DWORD *)(v21 + 24) = v13;
      uint64_t v26 = xo_retain(&xo_retain, v25);
      *(void *)uint64_t v21 = *(void *)(v26 + 8LL * v23);
      *(void *)(v26 + 8LL * v23) = v21;
      int v27 = (_DWORD *)xo_retain_count();
      ++*v27;
    }
  }

  return xo_do_emit_fields(a1, (uint64_t)v12, v13);
}

uint64_t xo_emit_h( unint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  unint64_t v10 = a1;
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited()) {
      xo_default_init();
    }
    unint64_t v10 = xo_default_handle();
  }

  *(void *)(v10 + 200) = &a9;
  uint64_t result = (int)xo_do_emit(v10, 0, a2);
  *(void *)(v10 + 200) = 0LL;
  return result;
}

uint64_t xo_emit( char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (!*(_DWORD *)xo_default_inited()) {
    xo_default_init();
  }
  unint64_t v10 = xo_default_handle();
  *(void *)(v10 + 200) = &a9;
  uint64_t result = (int)xo_do_emit(v10, 0, a1);
  *(void *)(v10 + 200) = 0LL;
  return result;
}

uint64_t xo_emit_hvf(unint64_t a1, int a2, char *a3, uint64_t a4)
{
  unint64_t v6 = a1;
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited()) {
      xo_default_init();
    }
    unint64_t v6 = xo_default_handle();
  }

  *(void *)(v6 + 200) = a4;
  uint64_t result = (int)xo_do_emit(v6, a2, a3);
  *(void *)(v6 + 200) = 0LL;
  return result;
}

uint64_t xo_emit_hf( unint64_t a1, int a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  unint64_t v11 = a1;
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited()) {
      xo_default_init();
    }
    unint64_t v11 = xo_default_handle();
  }

  *(void *)(v11 + 200) = &a9;
  uint64_t result = (int)xo_do_emit(v11, a2, a3);
  *(void *)(v11 + 200) = 0LL;
  return result;
}

uint64_t xo_emit_f( int a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (!*(_DWORD *)xo_default_inited()) {
    xo_default_init();
  }
  unint64_t v11 = xo_default_handle();
  *(void *)(v11 + 200) = &a9;
  uint64_t result = (int)xo_do_emit(v11, a1, a2);
  *(void *)(v11 + 200) = 0LL;
  return result;
}

uint64_t xo_emit_field_hv( unint64_t a1, char *a2, const char *a3, const char *a4, const char *a5, uint64_t a6)
{
  unint64_t v10 = a1;
  uint64_t v22 = a6;
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited()) {
      xo_default_init();
    }
    unint64_t v10 = xo_default_handle();
  }

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  if (a2) {
    unint64_t v11 = a2;
  }
  else {
    unint64_t v11 = "V";
  }
  __int128 v18 = 0uLL;
  __int128 v19 = 0uLL;
  __int128 v16 = 0uLL;
  __int128 v17 = 0uLL;
  *(void *)&__int128 v17 = a4;
  *((void *)&v17 + 1) = a3;
  *(void *)&__int128 v18 = a4;
  *((void *)&v18 + 1) = a5;
  if (a3) {
    size_t v12 = strlen(a3);
  }
  else {
    size_t v12 = 0LL;
  }
  *(void *)&__int128 v20 = v12;
  if (a4) {
    size_t v14 = strlen(a4);
  }
  else {
    size_t v14 = 0LL;
  }
  *((void *)&v20 + 1) = v14;
  if (a5) {
    size_t v15 = strlen(a5);
  }
  else {
    size_t v15 = 0LL;
  }
  *(void *)&__int128 v21 = v15;
  if (a3 && !a4 && ((DWORD2(v16) - 67) > 0x1A || ((1 << (BYTE8(v16) - 67)) & 0x5000011) == 0))
  {
    *(void *)&__int128 v18 = "%s";
    *((void *)&v20 + 1) = 2LL;
  }

  *(void *)(v10 + 200) = v22;
  return xo_do_emit_fields(v10, (uint64_t)&v16, 1);
}

char *xo_parse_roles(_BYTE *a1, uint64_t a2, char *a3, uint64_t a4)
{
  unint64_t v5 = a3;
  if (!a3)
  {
    unsigned __int8 v7 = 0;
    *(void *)a4 = 0LL;
    goto LABEL_55;
  }

  unsigned __int8 v7 = 0;
  uint64_t v8 = 0LL;
  uint64_t v9 = 0LL;
  while (1)
  {
    unsigned int v10 = *v5;
    if (v10 > 0x39) {
      break;
    }
    if (v10 != 44)
    {
      if (!*v5 || v10 == 47) {
        goto LABEL_52;
      }
LABEL_24:
      __int128 v16 = (const char *)(char)v10;
      switch((char)v10)
      {
        case '0':
        case '1':
        case '2':
        case '3':
        case '4':
        case '5':
        case '6':
        case '7':
        case '8':
        case '9':
          unsigned __int8 v7 = v10 + 10 * v7 - 48;
          goto LABEL_28;
        case 'C':
        case 'D':
        case 'E':
        case 'G':
        case 'L':
        case 'N':
        case 'P':
        case 'T':
        case 'U':
        case 'V':
        case 'W':
        case '[':
        case ']':
          if (!(_DWORD)v9) {
            goto LABEL_29;
          }
          xo_printable(a2);
          __int128 v19 = "field descriptor uses multiple types: '%s'";
          goto LABEL_58;
        case 'a':
          v8 |= 0x200000uLL;
          goto LABEL_28;
        case 'c':
          v8 |= 1uLL;
          goto LABEL_28;
        case 'd':
          v8 |= 0x40uLL;
          goto LABEL_28;
        case 'e':
          v8 |= 8uLL;
          goto LABEL_28;
        case 'g':
          v8 |= 0x80000uLL;
          goto LABEL_28;
        case 'h':
          v8 |= 0x8000uLL;
          goto LABEL_28;
        case 'k':
          v8 |= 0x80uLL;
          goto LABEL_28;
        case 'l':
          v8 |= 0x2000uLL;
          goto LABEL_28;
        case 'n':
          v8 |= 0x20uLL;
          goto LABEL_28;
        case 'p':
          v8 |= 0x100000uLL;
          goto LABEL_28;
        case 'q':
          v8 |= 0x10uLL;
          goto LABEL_28;
        case 't':
          v8 |= 0x1000uLL;
          goto LABEL_28;
        case 'w':
          v8 |= 4uLL;
LABEL_28:
          __int128 v16 = v9;
LABEL_29:
          if (((_DWORD)v16 == 85 || (_DWORD)v16 == 78) && (v8 & 1) != 0)
          {
            xo_printable(a2);
            xo_failure(a1, "colon modifier on 'N' or 'U' field ignored: '%s'");
            v8 &= ~1uLL;
          }

          uint64_t v9 = v16;
          goto LABEL_38;
        default:
          xo_printable(a2);
          __int128 v19 = "field descriptor uses unknown modifier: '%s'";
          goto LABEL_58;
      }
    }

    for (int64_t i = 0LL; ; ++i)
    {
      unsigned int v12 = v5[i + 1];
      BOOL v13 = v12 > 0x3A || ((1LL << v12) & 0x400900000000001LL) == 0;
      if (!v13 || v12 == 125) {
        break;
      }
    }

    if (i >= 1)
    {
      size_t v15 = xo_name_lookup(xo_role_names, v5 + 1, i);
      if (v15)
      {
        uint64_t v9 = v15;
      }

      else
      {
        __int128 v17 = xo_name_lookup(xo_modifier_names, v5 + 1, i);
        if (v17) {
          v8 |= (unint64_t)v17;
        }
        else {
          xo_failure(a1, "unknown keyword ignored: '%.*s'");
        }
      }
    }

    v5 += i;
LABEL_38:
    ++v5;
  }

  if (v10 != 92)
  {
    if (v10 != 58 && v10 != 125) {
      goto LABEL_24;
    }
LABEL_52:
    *(void *)a4 = v8;
    if ((_DWORD)v9)
    {
LABEL_56:
      *(_DWORD *)(a4 + 8) = (_DWORD)v9;
      *(_DWORD *)(a4 + 88) = v7;
      return v5;
    }

LABEL_55:
    LODWORD(v9) = 86;
    goto LABEL_56;
  }

  if (*++v5) {
    goto LABEL_38;
  }
  __int128 v19 = "backslash at the end of string";
LABEL_58:
  xo_failure(a1, v19);
  return 0LL;
}

uint64_t xo_do_emit_fields(unint64_t a1, uint64_t a2, int a3)
{
  uint64_t v133 = *MEMORY[0x1895F89C0];
  unsigned int v5 = *(_DWORD *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  if ((v6 & 1) != 0 || *(_WORD *)(a1 + 16) == 5) {
    int v125 = 0;
  }
  else {
    int v125 = (v5 >> 23) & 1;
  }
  unint64_t v7 = 0x18C75E000uLL;
  if (!a3) {
    goto LABEL_239;
  }
  unsigned int v119 = *(_DWORD *)a1;
  int v8 = 0;
  v126 = (const char ***)(a1 + 200);
  uint64_t v9 = MEMORY[0x1895F8770];
  do
  {
    int v10 = *(_DWORD *)(a2 + 8);
    if (!v10) {
      break;
    }
    uint64_t v11 = *(void *)a2;
    if ((*(void *)a2 & 0x200000) != 0)
    {
      size_t v14 = (*v126)++;
      unsigned int v12 = (char *)*v14;
      if (*v14) {
        uint64_t v13 = strlen(*v14);
      }
      else {
        uint64_t v13 = 0LL;
      }
    }

    else
    {
      unsigned int v12 = *(char **)(a2 + 24);
      uint64_t v13 = *(void *)(a2 + 64);
    }

    if (v10 <= 77)
    {
      if (v10 == 10)
      {
        xo_line_close((void *)a1);
        if (!v125 || (xo_flush_h(a1) & 0x8000000000000000LL) == 0) {
          goto LABEL_237;
        }
        return -1LL;
      }

      if (v10 == 43)
      {
        size_t v15 = *(char **)(a2 + 24);
        uint64_t v16 = *(void *)(a2 + 64);
        goto LABEL_21;
      }
    }

    else if (v10 == 78 || v10 == 85)
    {
      if ((v11 & 4) != 0)
      {
        xo_format_content(a1, "padding", 0LL, " ", 1LL, 0LL, 0LL, v11);
        v11 &= ~4uLL;
      }
    }

    else if (v10 == 123)
    {
      size_t v15 = *(char **)(a2 + 16);
      uint64_t v16 = *(void *)(a2 + 56);
LABEL_21:
      xo_format_text(a1, v15, v16);
      goto LABEL_237;
    }

    if (v10 > 85)
    {
      switch(v10)
      {
        case ']':
          xo_anchor_stop(a1, a2, (uint64_t)v12, v13);
          goto LABEL_233;
        case '[':
          uint64_t v21 = *(void *)(a1 + 8);
          if ((v21 & 8) != 0)
          {
            xo_failure((_BYTE *)a1, "the anchor already recording is discarded");
            uint64_t v21 = *(void *)(a1 + 8);
          }

          *(void *)(a1 + 8) = v21 | 8;
          *(void *)(a1 + 344) = *(void *)(a1 + 80) - *(void *)(a1 + 72);
          *(void *)(a1 + 352) = 0LL;
          *(void *)(a1 + 360) = xo_find_width(a1, a2, (uint64_t)v12, v13);
          goto LABEL_233;
        case 'V':
          xo_format_value( a1,  v12,  v13,  0LL,  0LL,  *(unsigned __int8 **)(a2 + 32),  *(void *)(a2 + 72),  *(char **)(a2 + 40),  *(void *)(a2 + 80),  v11);
          goto LABEL_233;
      }

      goto LABEL_53;
    }

    if (v10 != 67)
    {
      if (v10 == 71)
      {
        __int128 v17 = *(unsigned __int8 **)(a2 + 32);
        uint64_t v18 = *(void *)(a2 + 72);
        uint64_t v19 = *(void *)(a1 + 448);
        if (v19)
        {
          (*(void (**)(uint64_t))(v7 + 2632))(v19);
          *(void *)(a1 + 448) = 0LL;
        }

        if (v13 | v18)
        {
          if (v13 || !v18)
          {
            *(void *)(a1 + 448) = xo_strndup(v12, v13);
          }

          else
          {
            uint64_t v20 = *(void *)(a1 + 80) - *(void *)(a1 + 72);
            xo_do_format_field(a1, 0LL, v17, v18, 0);
            *(void *)(a1 + 448) = xo_strndup( (char *)(v20 + *(void *)(a1 + 72)),  *(void *)(a1 + 80) - (v20 + *(void *)(a1 + 72)));
            if ((v20 & 0x8000000000000000LL) == 0) {
              *(void *)(a1 + 80) = *(void *)(a1 + 72) + v20;
            }
          }
        }

        goto LABEL_237;
      }

LABEL_53:
      if (v13 || *(void *)(a2 + 32))
      {
        int v27 = "decoration";
        switch(v10)
        {
          case 'D':
            goto LABEL_144;
          case 'E':
            int v27 = "error";
            goto LABEL_144;
          case 'L':
            int v27 = "label";
            goto LABEL_144;
          case 'N':
            int v27 = "note";
            goto LABEL_144;
          case 'P':
            int v27 = "padding";
            goto LABEL_144;
          case 'T':
            xo_format_title(a1, (uint64_t *)a2, v12, v13);
            goto LABEL_233;
          case 'U':
            xo_format_units((uint64_t *)a1, (uint64_t *)a2, v12, v13);
            goto LABEL_233;
          case 'W':
            int v27 = "warning";
LABEL_144:
            uint64_t v58 = "__warning";
            if (v10 != 87) {
              uint64_t v58 = 0LL;
            }
            if (v10 == 69) {
              uint64_t v59 = "__error";
            }
            else {
              uint64_t v59 = (char *)v58;
            }
            xo_format_content(a1, v27, v59, v12, v13, *(unsigned __int8 **)(a2 + 32), *(void *)(a2 + 72), v11);
            break;
          default:
            xo_failure((_BYTE *)a1, "unknown field type: '%c'");
            break;
        }
      }

      goto LABEL_233;
    }

    if (v13)
    {
      unsigned int v22 = *(unsigned __int16 *)(a1 + 16);
      if (v22 <= 5 && ((1 << v22) & 0x36) != 0) {
        goto LABEL_233;
      }
      char v118 = v11;
      unint64_t v23 = v7;
      unint64_t v130 = 0x2000LL;
      uint64_t v24 = (char *)xo_realloc(0LL, 0x2000LL);
      __s = v24;
      v129 = v24;
      if (v12)
      {
        uint64_t v25 = v24;
        if (v13 < 0x2000) {
          goto LABEL_52;
        }
        uint64_t v26 = (char *)xo_realloc(v24, (v13 + 0x1FFF) & 0xFFFFFFFFFFFFE000LL);
        if (v26)
        {
          uint64_t v25 = v26;
          __s = v26;
          unint64_t v130 = (v13 + 0x1FFF) & 0xFFFFFFFFFFFFE000LL;
LABEL_52:
          memcpy(v25, v12, v13);
          v129 = &v25[v13];
        }
      }
    }

    else
    {
      char v118 = v11;
      unint64_t v23 = v7;
      unint64_t v28 = *(unsigned __int8 **)(a2 + 32);
      uint64_t v29 = *(void *)(a2 + 72);
      unint64_t v130 = 0x2000LL;
      uint64_t v30 = (char *)xo_realloc(0LL, 0x2000LL);
      __s = v30;
      v129 = v30;
      if (v29)
      {
        xo_do_format_field(a1, (uint64_t *)&__s, v28, v29, 0);
      }

      else
      {
        strcpy(v30, "reset");
        v129 = v30 + 6;
      }
    }

    unint64_t v7 = v23;
    if ((*(_BYTE *)(a1 + 3) & 4) == 0 || *(_WORD *)(a1 + 16) != 3 && *(_WORD *)(a1 + 16)) {
      goto LABEL_231;
    }
    uint64_t v31 = v129;
    if (v129 + 1 >= &__s[v130])
    {
      unint64_t v32 = (v129 + 1 - __s + 0x1FFF) & 0xFFFFFFFFFFFFE000LL;
      unsigned int v33 = (char *)xo_realloc(__s, v32);
      if (!v33) {
        goto LABEL_68;
      }
      uint64_t v31 = &v33[v129 - __s];
      __s = v33;
      v129 = v31;
      unint64_t v130 = v32;
    }

    *uint64_t v31 = 0;
    ++v129;
LABEL_68:
    int v123 = *(unsigned __int8 *)(a1 + 402);
    unsigned int v120 = *(unsigned __int8 *)(a1 + 404);
    unsigned int v121 = *(unsigned __int8 *)(a1 + 403);
    BOOL v34 = __s;
    size_t v35 = strlen(__s);
    if (__s)
    {
      unint64_t v36 = &__s[v35 - 1];
      if (v36 > __s)
      {
        do
        {
          uint64_t v37 = v34 - 1;
          do
          {
            uint64_t v38 = v37;
            unsigned int v39 = v37[1];
            if ((v39 & 0x80000000) != 0) {
              int v40 = __maskrune(v39, 0x4000uLL);
            }
            else {
              int v40 = *(_DWORD *)(v9 + 4LL * v39 + 60) & 0x4000;
            }
            ++v37;
          }

          while (v40);
          unsigned int v41 = strchr(v38 + 1, 44);
          BOOL v34 = v41;
          if (v41)
          {
            *unsigned int v41 = 0;
            BOOL v34 = v41 + 1;
          }

          for (int64_t i = &v38[strlen(v38 + 1)]; ; --i)
          {
            unsigned int v43 = *i;
            int v44 = (v43 & 0x80000000) != 0 ? __maskrune(v43, 0x4000uLL) : *(_DWORD *)(v9 + 4LL * v43 + 60) & 0x4000;
            if (i <= v37 || !v44) {
              break;
            }
            *int64_t i = 0;
          }

          int v45 = *v37;
          if (v45 == 98)
          {
            if (v37[1] != 103 || v37[2] != 45) {
              goto LABEL_105;
            }
            uint64_t v47 = 0LL;
            while (strcmp(xo_color_names[v47], v37 + 3))
            {
              if (++v47 == 9) {
                goto LABEL_130;
              }
            }

            if ((v47 & 0x80000000) != 0)
            {
LABEL_130:
              if ((*(_BYTE *)a1 & 0x10) != 0) {
                xo_failure((_BYTE *)a1, "unknown color/effect string detected: '%s'");
              }
              continue;
            }

            unsigned int v120 = v47;
          }

          else
          {
            if (v45 != 102)
            {
              if (v45 == 110 && v37[1] == 111 && v37[2] == 45)
              {
                uint64_t v46 = 0LL;
                while (strcmp(xo_effect_names[v46], v37 + 3))
                {
                  if (++v46 == 5) {
                    goto LABEL_130;
                  }
                }

                if ((v46 & 0x80000000) != 0) {
                  goto LABEL_130;
                }
                int v57 = (v123 & ~(1 << v46));
              }

              else
              {
LABEL_105:
                uint64_t v49 = 0LL;
                while (strcmp(xo_effect_names[v49], v37))
                {
                  if (++v49 == 5) {
                    goto LABEL_130;
                  }
                }

                if ((v49 & 0x80000000) != 0) {
                  goto LABEL_130;
                }
                int v50 = 1 << v49;
                int v51 = v123 | (1 << v49);
                int v52 = v51 & 0xE1;
                unsigned int v54 = v120;
                unsigned int v53 = v121;
                if (1 << v49 == 1) {
                  unsigned int v55 = 0;
                }
                else {
                  unsigned int v55 = v120;
                }
                if (v50 == 1) {
                  unsigned int v56 = 0;
                }
                else {
                  unsigned int v56 = v121;
                }
                if (v50 == 1) {
                  int v51 = 1;
                }
                if (v50 != 2)
                {
                  unsigned int v54 = v55;
                  unsigned int v53 = v56;
                }

                unsigned int v120 = v54;
                unsigned int v121 = v53;
                if (v50 == 2) {
                  int v57 = v52;
                }
                else {
                  int v57 = v51;
                }
              }

              int v123 = v57;
              continue;
            }

            if (v37[1] != 103 || v37[2] != 45) {
              goto LABEL_105;
            }
            uint64_t v48 = 0LL;
            while (strcmp(xo_color_names[v48], v37 + 3))
            {
              if (++v48 == 9) {
                goto LABEL_130;
              }
            }

            if ((v48 & 0x80000000) != 0) {
              goto LABEL_130;
            }
            unsigned int v121 = v48;
          }
        }

        while (v34 && v34 < v36);
      }
    }

    if ((*(void *)a1 & 0x100000000LL) != 0 && v121 <= 8) {
      unsigned int v121 = *(unsigned __int8 *)(a1 + v121 + 384);
    }
    unint64_t v7 = 0x18C75E000LL;
    if ((*(void *)a1 & 0x100000000LL) != 0 && v120 <= 8) {
      unsigned int v120 = *(unsigned __int8 *)(a1 + v120 + 393);
    }
    if (!*(_WORD *)(a1 + 16))
    {
      char __src = 27;
      if ((*(unsigned __int8 *)(a1 + 402) & ~v123) != 0)
      {
        v123 |= 1u;
        *(_BYTE *)(a1 + 402) = 0;
      }

      uint64_t v75 = 0LL;
      uint64_t v76 = 1LL;
      v77 = &v132;
      int v78 = 1;
      do
      {
        if ((v78 & (*(unsigned __int8 *)(a1 + 402) ^ v123)) != 0)
        {
          v76 += snprintf(v77, 1024 - v76, ";%s", xo_effect_on_codes[v75]);
          if (v76 > 1023) {
            goto LABEL_193;
          }
          if (v78 == 1)
          {
            *(_WORD *)(a1 + 402) = 0;
            *(_BYTE *)(a1 + 404) = 0;
          }
        }

        v78 *= 2;
        v77 = &__src + v76;
        ++v75;
      }

      while (v75 != 5);
      if (v121 != *(unsigned __int8 *)(a1 + 403))
      {
        int v79 = v121 - 1;
        if (!v121) {
          int v79 = 9;
        }
        v76 += snprintf(v77, 1024 - v76, ";3%u", v79);
      }

      if (v120 != *(unsigned __int8 *)(a1 + 404))
      {
        int v80 = v120 - 1;
        if (!v120) {
          int v80 = 9;
        }
        v76 += snprintf(&__src + v76, 1024 - v76, ";4%u", v80);
      }

      if (v76 != 1 && v76 <= 1020)
      {
        char v132 = 91;
        *(_WORD *)(&__src + v76) = 109;
        uint64_t v81 = v76 + 1;
        if (v76 != -1)
        {
          uint64_t v83 = *(void *)(a1 + 72);
          uint64_t v82 = *(void **)(a1 + 80);
          unint64_t v84 = ((unint64_t)v82 + v81 - v83 + 0x1FFF) & 0xFFFFFFFFFFFFE000LL;
          uint64_t v85 = xo_realloc(*(void *)(a1 + 72), v84);
          if (v85)
          {
            uint64_t v86 = v85;
            uint64_t v82 = (void *)(v85 + *(void *)(a1 + 80) - *(void *)(a1 + 72));
            *(void *)(a1 + 72) = v86;
            *(void *)(a1 + 80) = v82;
            *(void *)(a1 + 88) = v84;
LABEL_192:
            memcpy(v82, &__src, v76 + 1);
            *(void *)(a1 + 80) += v81;
          }
        }
      }

LABEL_193:
      LOBYTE(v60) = v123 & 0xFE;
LABEL_194:
      char v87 = v120;
      char v73 = v121;
      goto LABEL_230;
    }

    int v60 = v123 & 0xFE;
    if (*(unsigned __int8 *)(a1 + 402) == v60
      && *(unsigned __int8 *)(a1 + 403) == v121
      && *(unsigned __int8 *)(a1 + 404) == v120)
    {
      goto LABEL_194;
    }

    uint64_t v61 = 0LL;
    *(void *)(a1 + 416) = *(void *)(a1 + 408);
    int v62 = 1;
    char v122 = v123 & 0xFE;
    do
    {
      if ((v62 & v60) == 0) {
        goto LABEL_167;
      }
      uint64_t v63 = *(void *)(a1 + 408);
      BOOL v64 = *(char **)(a1 + 416);
      if ((unint64_t)(v64 + 8) >= v63 + *(void *)(a1 + 424))
      {
        unint64_t v65 = (unint64_t)&v64[-v63 + 8199] & 0xFFFFFFFFFFFFE000LL;
        uint64_t v66 = xo_realloc(v63, v65);
        size_t v67 = *(char **)(a1 + 416);
        if (!v66) {
          goto LABEL_163;
        }
        BOOL v64 = &v67[v66 - *(void *)(a1 + 408)];
        *(void *)(a1 + 408) = v66;
        *(void *)(a1 + 416) = v64;
        *(void *)(a1 + 424) = v65;
      }

      *(void *)BOOL v64 = 0x2D74636566666520LL;
      size_t v67 = (char *)(*(void *)(a1 + 416) + 8LL);
      *(void *)(a1 + 416) = v67;
LABEL_163:
      v68 = xo_effect_names[v61];
      size_t v69 = strlen(v68);
      uint64_t v70 = *(void *)(a1 + 408);
      if ((unint64_t)&v67[v69] >= v70 + *(void *)(a1 + 424))
      {
        unint64_t v71 = (unint64_t)&v67[v69 - v70 + 0x1FFF] & 0xFFFFFFFFFFFFE000LL;
        uint64_t v72 = xo_realloc(v70, v71);
        int v60 = v123 & 0xFE;
        if (!v72) {
          goto LABEL_167;
        }
        size_t v67 = (char *)(v72 + *(void *)(a1 + 416) - *(void *)(a1 + 408));
        *(void *)(a1 + 408) = v72;
        *(void *)(a1 + 416) = v67;
        *(void *)(a1 + 424) = v71;
      }

      memcpy(v67, v68, v69);
      *(void *)(a1 + 416) += v69;
      int v60 = v123 & 0xFE;
LABEL_167:
      v62 *= 2;
      ++v61;
    }

    while (v61 != 5);
    char v73 = v121;
    if (v121) {
      uint64_t v74 = xo_color_names[v121];
    }
    else {
      uint64_t v74 = 0LL;
    }
    char v87 = v120;
    if (v120) {
      v88 = xo_color_names[v120];
    }
    else {
      v88 = 0LL;
    }
    v89 = "inverse";
    if (v88) {
      uint64_t v90 = v88;
    }
    else {
      uint64_t v90 = "inverse";
    }
    if (v74) {
      v89 = v74;
    }
    if ((v123 & 0x10) != 0) {
      size_t v91 = v90;
    }
    else {
      size_t v91 = v74;
    }
    if ((v123 & 0x10) != 0) {
      uint64_t v92 = v89;
    }
    else {
      uint64_t v92 = v88;
    }
    v124 = v92;
    if (v91)
    {
      uint64_t v93 = *(void *)(a1 + 408);
      v94 = *(char **)(a1 + 416);
      unint64_t v95 = (unint64_t)&v94[-v93 + 8201] & 0xFFFFFFFFFFFFE000LL;
      uint64_t v96 = xo_realloc(v93, v95);
      v97 = *(char **)(a1 + 416);
      if (v96)
      {
        v94 = &v97[v96 - *(void *)(a1 + 408)];
        *(void *)(a1 + 408) = v96;
        *(void *)(a1 + 416) = v94;
        *(void *)(a1 + 424) = v95;
LABEL_214:
        *((_WORD *)v94 + 4) = 11623;
        *(void *)v94 = *(void *)" color-fg-";
        v97 = (char *)(*(void *)(a1 + 416) + 10LL);
        *(void *)(a1 + 416) = v97;
      }

      size_t v98 = strlen(v91);
      uint64_t v99 = *(void *)(a1 + 408);
      if ((unint64_t)&v97[v98] < v99 + *(void *)(a1 + 424))
      {
LABEL_218:
        memcpy(v97, v91, v98);
        *(void *)(a1 + 416) += v98;
      }

      else
      {
        unint64_t v100 = (unint64_t)&v97[v98 - v99 + 0x1FFF] & 0xFFFFFFFFFFFFE000LL;
        uint64_t v101 = xo_realloc(v99, v100);
        if (v101)
        {
          v97 = (char *)(v101 + *(void *)(a1 + 416) - *(void *)(a1 + 408));
          *(void *)(a1 + 408) = v101;
          *(void *)(a1 + 416) = v97;
          *(void *)(a1 + 424) = v100;
          goto LABEL_218;
        }
      }
    }

    v102 = v124;
    if (v124)
    {
      uint64_t v103 = *(void *)(a1 + 408);
      v104 = *(char **)(a1 + 416);
      unint64_t v7 = 0x18C75E000LL;
      unint64_t v105 = (unint64_t)&v104[-v103 + 8201] & 0xFFFFFFFFFFFFE000LL;
      uint64_t v106 = xo_realloc(v103, v105);
      v107 = *(char **)(a1 + 416);
      if (v106)
      {
        v104 = &v107[v106 - *(void *)(a1 + 408)];
        *(void *)(a1 + 408) = v106;
        *(void *)(a1 + 416) = v104;
        *(void *)(a1 + 424) = v105;
LABEL_223:
        *((_WORD *)v104 + 4) = 11623;
        *(void *)v104 = *(void *)" color-bg-";
        v107 = (char *)(*(void *)(a1 + 416) + 10LL);
        *(void *)(a1 + 416) = v107;
      }

      size_t v108 = strlen(v124);
      uint64_t v109 = *(void *)(a1 + 408);
      if ((unint64_t)&v107[v108] < v109 + *(void *)(a1 + 424))
      {
LABEL_227:
        memcpy(v107, v102, v108);
        *(void *)(a1 + 416) += v108;
      }

      else
      {
        unint64_t v110 = (unint64_t)&v107[v108 - v109 + 0x1FFF] & 0xFFFFFFFFFFFFE000LL;
        uint64_t v111 = xo_realloc(v109, v110);
        if (v111)
        {
          v107 = (char *)(v111 + *(void *)(a1 + 416) - *(void *)(a1 + 408));
          *(void *)(a1 + 408) = v111;
          *(void *)(a1 + 416) = v107;
          *(void *)(a1 + 424) = v110;
          v102 = v124;
          goto LABEL_227;
        }
      }
    }

    else
    {
      unint64_t v7 = 0x18C75E000uLL;
    }

    LOBYTE(v60) = v122;
LABEL_230:
    *(_BYTE *)(a1 + 402) = v60;
    *(_BYTE *)(a1 + 403) = v73;
    *(_BYTE *)(a1 + 404) = v87;
LABEL_231:
    LOBYTE(v11) = v118;
    if (__s) {
      (*(void (**)(char *))(v7 + 2632))(__s);
    }
LABEL_233:
    if ((v11 & 1) != 0) {
      xo_format_content(a1, "decoration", 0LL, ":", 1LL, 0LL, 0LL, 0LL);
    }
    if ((v11 & 4) != 0) {
      xo_format_content(a1, "padding", 0LL, " ", 1LL, 0LL, 0LL, 0LL);
    }
LABEL_237:
    a2 += 96LL;
    ++v8;
  }

  while (v8 != a3);
  uint64_t v6 = *(void *)(a1 + 8);
  unsigned int v5 = v119;
LABEL_239:
  *(void *)(a1 + 8) = v6 & 0xFFFFFFFFFFFFFFFELL;
  int v112 = (v5 >> 22) & 1;
  uint64_t v113 = v6 & 8;
  if (v112 == 1 && v113 == 0) {
    unint64_t v115 = (unint64_t)xo_flush_h(a1) >> 63;
  }
  else {
    LOBYTE(v115) = 0;
  }
  uint64_t v116 = *(void *)(a1 + 448);
  if (v116)
  {
    (*(void (**)(uint64_t))(v7 + 2632))(v116);
    *(void *)(a1 + 448) = 0LL;
  }

  if ((v115 & 1) != 0) {
    return -1LL;
  }
  else {
    return *(void *)(a1 + 376);
  }
}

uint64_t xo_emit_field_h( unint64_t a1, char *a2, const char *a3, const char *a4, const char *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return xo_emit_field_hv(a1, a2, a3, a4, a5, (uint64_t)&a9);
}

uint64_t xo_emit_field( char *a1, const char *a2, const char *a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return xo_emit_field_hv(0LL, a1, a2, a3, a4, (uint64_t)&a9);
}

uint64_t xo_attr_hv(uint64_t a1, char *__s, char *a3, va_list a4)
{
  uint64_t v7 = a1;
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited()) {
      xo_default_init();
    }
    uint64_t v7 = xo_default_handle();
  }

  size_t v8 = strlen(__s);
  size_t v9 = v8;
  int v10 = *(unsigned __int16 *)(v7 + 16);
  if (v10 != 5)
  {
    if (v10 != 1) {
      return 0LL;
    }
    uint64_t v11 = *(void *)(v7 + 120);
    unsigned int v12 = *(_BYTE **)(v7 + 128);
    uint64_t v13 = &v12[v9 + 5];
    if ((unint64_t)v13 >= v11 + *(void *)(v7 + 136))
    {
      unint64_t v14 = (unint64_t)&v13[-v11 + 0x1FFF] & 0xFFFFFFFFFFFFE000LL;
      uint64_t v15 = xo_realloc(v11, v14);
      if (!v15) {
        return -1LL;
      }
      unsigned int v12 = (_BYTE *)(v15 + *(void *)(v7 + 128) - *(void *)(v7 + 120));
      *(void *)(v7 + 120) = v15;
      *(void *)(v7 + 136) = v14;
    }

    *(void *)(v7 + 128) = v12 + 1;
    *unsigned int v12 = 32;
    memcpy(*(void **)(v7 + 128), __s, v9);
    uint64_t v16 = (_BYTE *)(*(void *)(v7 + 128) + v9);
    *(void *)(v7 + 128) = v16 + 1;
    *uint64_t v16 = 61;
    __int128 v17 = *(_BYTE **)(v7 + 128);
    *(void *)(v7 + 128) = v17 + 1;
    _BYTE *v17 = 34;
    uint64_t v18 = xo_vsnprintf(v7, v7 + 120, a3, a4);
    if (v18 < 0)
    {
      uint64_t v19 = *(_BYTE **)(v7 + 128);
    }

    else
    {
      uint64_t v18 = xo_escape_xml((uint64_t *)(v7 + 120), v18, 1u);
      uint64_t v19 = (_BYTE *)(*(void *)(v7 + 128) + v18);
      *(void *)(v7 + 128) = v19;
    }

    uint64_t v34 = *(void *)(v7 + 120);
    unint64_t v35 = (unint64_t)&v19[-v34 + 8193] & 0xFFFFFFFFFFFFE000LL;
    uint64_t v36 = xo_realloc(v34, v35);
    if (v36)
    {
      uint64_t v19 = (_BYTE *)(v36 + *(void *)(v7 + 128) - *(void *)(v7 + 120));
      *(void *)(v7 + 120) = v36;
      *(void *)(v7 + 136) = v35;
LABEL_30:
      *(void *)(v7 + 128) = v19 + 1;
      _BYTE *v19 = 34;
      **(_BYTE **)(v7 + 128) = 0;
      return v18 + v9 + 5;
    }

    return -1LL;
  }

  uint64_t v20 = *(void *)(v7 + 120);
  uint64_t v21 = *(void *)(v7 + 128);
  if (__s && v8)
  {
    size_t v22 = v21 + v8;
    unint64_t v23 = *(_BYTE **)(v7 + 128);
    if (v21 + v9 >= v20 + *(void *)(v7 + 136))
    {
      unint64_t v24 = (v22 - v20 + 0x1FFF) & 0xFFFFFFFFFFFFE000LL;
      uint64_t v25 = xo_realloc(*(void *)(v7 + 120), v24);
      uint64_t v26 = *(void *)(v7 + 120);
      int v27 = *(_BYTE **)(v7 + 128);
      if (!v25) {
        goto LABEL_20;
      }
      unint64_t v23 = &v27[v25 - v26];
      *(void *)(v7 + 120) = v25;
      *(void *)(v7 + 128) = v23;
      *(void *)(v7 + 136) = v24;
    }

    memcpy(v23, __s, v9);
    uint64_t v26 = *(void *)(v7 + 120);
    int v27 = (_BYTE *)(*(void *)(v7 + 128) + v9);
    *(void *)(v7 + 128) = v27;
  }

  else
  {
    uint64_t v26 = *(void *)(v7 + 120);
    int v27 = *(_BYTE **)(v7 + 128);
  }

LABEL_20:
  if ((unint64_t)(v27 + 1) >= v26 + *(void *)(v7 + 136))
  {
    unint64_t v29 = (unint64_t)&v27[-v26 + 0x2000] & 0xFFFFFFFFFFFFE000LL;
    uint64_t v30 = xo_realloc(v26, v29);
    uint64_t v31 = *(void *)(v7 + 128);
    if (!v30) {
      goto LABEL_24;
    }
    int v27 = (_BYTE *)(v30 + v31 - *(void *)(v7 + 120));
    *(void *)(v7 + 120) = v30;
    *(void *)(v7 + 128) = v27;
    *(void *)(v7 + 136) = v29;
  }

  *int v27 = 0;
  uint64_t v31 = *(void *)(v7 + 128) + 1LL;
  *(void *)(v7 + 128) = v31;
LABEL_24:
  uint64_t v32 = *(void *)(v7 + 120);
  uint64_t result = xo_vsnprintf(v7, v7 + 120, a3, a4);
  if ((result & 0x8000000000000000LL) == 0)
  {
    unsigned int v33 = (_BYTE *)(*(void *)(v7 + 128) + result);
    *(void *)(v7 + 128) = v33;
    *unsigned int v33 = 0;
    return (int)xo_encoder_handle(v7, 15LL, *(void *)(v7 + 120) + v21 - v20, *(void *)(v7 + 120) + v31 - v32, 0LL);
  }

  return result;
}

uint64_t xo_vsnprintf(uint64_t a1, uint64_t a2, char *__format, va_list a4)
{
  uint64_t v8 = a2 + 8;
  uint64_t v7 = *(char **)(a2 + 8);
  int64_t v9 = *(void *)a2 - (void)v7 + *(void *)(v8 + 8);
  int v10 = *(uint64_t (**)(uint64_t))(a1 + 48);
  if (v10) {
    uint64_t result = v10(a1);
  }
  else {
    uint64_t result = vsnprintf(v7, v9, __format, a4);
  }
  if (result >= v9)
  {
    unint64_t v12 = *(void *)(a2 + 8) + result;
    if (v12 >= *(void *)a2 + *(void *)(a2 + 16))
    {
      unint64_t v13 = (v12 - *(void *)a2 + 0x1FFF) & 0xFFFFFFFFFFFFE000LL;
      uint64_t v14 = xo_realloc(*(void *)a2, v13);
      if (!v14) {
        return -1LL;
      }
      uint64_t v15 = v14 + *(void *)(a2 + 8) - *(void *)a2;
      *(void *)a2 = v14;
      *(void *)(a2 + 8) = v15;
      *(void *)(a2 + 16) = v13;
    }

    uint64_t v16 = *(uint64_t (**)(uint64_t))(a1 + 48);
    if (v16) {
      return v16(a1);
    }
    else {
      return vsnprintf(*(char **)(a2 + 8), *(void *)a2 - *(void *)(a2 + 8) + *(void *)(a2 + 16), __format, a4);
    }
  }

  return result;
}

uint64_t xo_attr_h( uint64_t a1, char *a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return xo_attr_hv(a1, a2, a3, &a9);
}

uint64_t xo_attr(char *__s, char *a2, ...)
{
  return xo_attr_hv(0LL, __s, a2, va);
}

uint64_t xo_set_depth(uint64_t a1, int a2)
{
  uint64_t v3 = a1;
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited()) {
      xo_default_init();
    }
    uint64_t v3 = xo_default_handle();
  }

  uint64_t result = xo_depth_check(v3, a2);
  if (!(_DWORD)result)
  {
    int v5 = *(_DWORD *)(v3 + 176) + a2;
    *(_DWORD *)(v3 + 176) = v5;
    *(_WORD *)(v3 + 18) += a2;
    if (*(_WORD *)(v3 + 16) == 2 && (*(_BYTE *)(v3 + 2) & 1) == 0 && v5 >= 1) {
      *(void *)(v3 + 8) |= 4uLL;
    }
  }

  return result;
}

uint64_t xo_depth_check(uint64_t a1, int a2)
{
  if (*(_DWORD *)(a1 + 180) > a2) {
    return 0LL;
  }
  uint64_t v4 = a2 + 128LL;
  uint64_t v5 = xo_realloc(*(void *)(a1 + 168), 24LL * (int)v4);
  if (v5)
  {
    uint64_t v6 = v5;
    bzero((void *)(v5 + 24LL * *(int *)(a1 + 180)), 24 * (v4 - *(int *)(a1 + 180)));
    uint64_t result = 0LL;
    *(_DWORD *)(a1 + 180) = v4;
    *(void *)(a1 + 168) = v6;
  }

  else
  {
    xo_failure((_BYTE *)a1, "xo_depth_check: out of memory (%d)");
    return 0xFFFFFFFFLL;
  }

  return result;
}

uint64_t xo_open_container_hf( uint64_t a1, uint64_t a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_transition(a1, a2, a3, 1LL, a5, a6, a7, a8);
}

uint64_t xo_transition( uint64_t a1, uint64_t a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a4;
  uint64_t v11 = a1;
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited()) {
      xo_default_init();
    }
    uint64_t v11 = xo_default_handle();
  }

  uint64_t v12 = *(void *)(v11 + 168);
  int v13 = *(_DWORD *)(v11 + 176);
  uint64_t v14 = v12 + 24LL * v13;
  int v15 = *(_DWORD *)(v14 + 4);
  if (v15 != 10 || v13 == 0)
  {
    int v17 = *(_DWORD *)(v14 + 4);
  }

  else
  {
    uint64_t v18 = 24LL * v13;
    do
    {
      int v17 = *(_DWORD *)(v12 + v18 - 20);
      BOOL v19 = v17 != 10 || v18 == 24;
      v18 -= 24LL;
    }

    while (!v19);
  }

  uint64_t v20 = 0LL;
  int v21 = v8 | (v17 << 8);
  if (v21 > 768)
  {
    switch(v21)
    {
      case 769:
LABEL_25:
        if (v15 == 10) {
          goto LABEL_32;
        }
        int v22 = xo_do_close_leaf_list(v11, 0LL);
        if (v22 < 0) {
          goto LABEL_62;
        }
        goto LABEL_35;
      case 770:
      case 772:
      case 774:
      case 776:
        goto LABEL_31;
      case 771:
        if (v15 == 10) {
          goto LABEL_32;
        }
        int v22 = xo_do_close_list(v11, 0LL);
LABEL_53:
        if ((v22 & 0x80000000) == 0) {
          goto LABEL_54;
        }
        goto LABEL_62;
      case 773:
        goto LABEL_61;
      case 775:
LABEL_37:
        if (v15 == 10) {
          goto LABEL_32;
        }
        int v22 = xo_do_close_list(v11, 0LL);
        if ((v22 & 0x80000000) == 0) {
          goto LABEL_39;
        }
        goto LABEL_62;
      case 777:
      case 778:
        goto LABEL_66;
      case 779:
        if (v15 == 10) {
          goto LABEL_32;
        }
        unint64_t v23 = (_BYTE *)v11;
        unint64_t v24 = 0LL;
        int v25 = 4;
        goto LABEL_34;
      case 780:
        goto LABEL_69;
      default:
        switch(v21)
        {
          case 1281:
            goto LABEL_35;
          case 1282:
          case 1288:
            goto LABEL_31;
          case 1283:
            goto LABEL_54;
          case 1284:
            goto LABEL_33;
          case 1285:
            uint64_t v26 = v11;
            if (v15 == 10) {
              goto LABEL_60;
            }
            int v22 = xo_do_close_instance(v11, 0LL);
            if (v22 < 0) {
              goto LABEL_62;
            }
            goto LABEL_61;
          case 1286:
            if (v15 == 10) {
              goto LABEL_32;
            }
            int v22 = xo_do_close_instance(v11, a3);
            goto LABEL_62;
          case 1287:
          case 1292:
            goto LABEL_39;
          case 1289:
          case 1290:
            goto LABEL_66;
          case 1291:
            goto LABEL_69;
          default:
            switch(v21)
            {
              case 1793:
                goto LABEL_25;
              case 1794:
              case 1798:
                if (v15 == 10) {
                  goto LABEL_32;
                }
                int v22 = xo_do_close_leaf_list(v11, 0LL);
                if (v22 < 0) {
                  goto LABEL_62;
                }
                goto LABEL_33;
              case 1795:
                if (v15 == 10) {
                  goto LABEL_32;
                }
                int v22 = xo_do_close_leaf_list(v11, 0LL);
                goto LABEL_53;
              case 1796:
                goto LABEL_33;
              case 1797:
                if (v15 == 10) {
                  goto LABEL_32;
                }
                int v22 = xo_do_close_leaf_list(v11, 0LL);
                if (v22 < 0) {
                  goto LABEL_62;
                }
                goto LABEL_61;
              case 1799:
                goto LABEL_37;
              case 1800:
                if (v15 == 10) {
                  goto LABEL_32;
                }
                uint64_t v27 = v11;
                unint64_t v28 = a3;
                goto LABEL_50;
              case 1803:
                if (v15 == 10) {
                  goto LABEL_32;
                }
                uint64_t v27 = v11;
                unint64_t v28 = 0LL;
LABEL_50:
                int v22 = xo_do_close_leaf_list(v27, v28);
                break;
              case 1804:
                goto LABEL_69;
              default:
                goto LABEL_66;
            }

            goto LABEL_62;
        }
    }
  }

  switch(v21)
  {
    case 1:
LABEL_35:
      uint64_t v20 = xo_do_open_container(v11, a2, a3);
      if ((v20 & 0x8000000000000000LL) == 0) {
        goto LABEL_69;
      }
      goto LABEL_72;
    case 2:
      int v22 = xo_do_close_container(v11, a3);
      goto LABEL_62;
    case 3:
LABEL_54:
      int v22 = xo_do_open_list(v11, a2, a3, a4, a5, a6, a7, a8);
      goto LABEL_62;
    case 4:
LABEL_33:
      unint64_t v23 = (_BYTE *)v11;
      unint64_t v24 = a3;
      int v25 = v8;
LABEL_34:
      xo_do_close(v23, v24, v25);
      goto LABEL_68;
    case 5:
LABEL_40:
      uint64_t v26 = v11;
LABEL_60:
      int v22 = xo_do_open_list(v26, a2, a3, a4, a5, a6, a7, a8);
      if ((v22 & 0x80000000) == 0) {
LABEL_61:
      }
        int v22 = xo_do_open_instance(v11, a2, a3);
      goto LABEL_62;
    case 6:
      unint64_t v29 = "xo_close_instance ignored when called from initial state ('%s')";
      goto LABEL_67;
    case 7:
    case 12:
LABEL_39:
      int v22 = xo_do_open_leaf_list(v11, a2, (uint64_t)a3, a4, a5, a6, a7, a8);
LABEL_62:
      uint64_t v20 = v22;
      if ((v22 & 0x8000000000000000LL) != 0) {
        goto LABEL_72;
      }
      goto LABEL_69;
    case 8:
      unint64_t v29 = "xo_close_leaf_list ignored when called from initial state ('%s')";
      goto LABEL_67;
    case 9:
    case 10:
LABEL_66:
      unint64_t v29 = "unknown transition: (%u -> %u)";
LABEL_67:
      xo_failure((_BYTE *)v11, v29);
LABEL_68:
      uint64_t v20 = 0LL;
      goto LABEL_69;
    case 11:
LABEL_69:
      if ((*(_BYTE *)(v11 + 2) & 0x40) != 0 && xo_flush_h(v11) < 0) {
        uint64_t v20 = -1LL;
      }
LABEL_72:
      *(void *)(v11 + 8) |= 0x40uLL;
      break;
    default:
      switch(v21)
      {
        case 257:
          goto LABEL_35;
        case 258:
        case 262:
        case 264:
LABEL_31:
          if (v15 != 10) {
            goto LABEL_33;
          }
LABEL_32:
          xo_failure((_BYTE *)v11, "marker '%s' prevents transition from %s to %s");
          uint64_t v20 = -1LL;
          break;
        case 259:
          goto LABEL_54;
        case 260:
          goto LABEL_33;
        case 261:
          goto LABEL_40;
        case 263:
        case 268:
          goto LABEL_39;
        case 267:
          goto LABEL_69;
        default:
          goto LABEL_66;
      }

      break;
  }

  return v20;
}

uint64_t xo_open_container_h( uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_transition(a1, 0LL, a2, 1LL, a5, a6, a7, a8);
}

uint64_t xo_open_container( char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_transition(0LL, 0LL, a1, 1LL, a5, a6, a7, a8);
}

uint64_t xo_open_container_hd( uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_transition(a1, 1024LL, a2, 1LL, a5, a6, a7, a8);
}

uint64_t xo_open_container_d( char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_transition(0LL, 1024LL, a1, 1LL, a5, a6, a7, a8);
}

uint64_t xo_close_container_h( uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_transition(a1, 0LL, a2, 2LL, a5, a6, a7, a8);
}

uint64_t xo_close_container( char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_transition(0LL, 0LL, a1, 2LL, a5, a6, a7, a8);
}

uint64_t xo_close_container_hd( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_transition(a1, 0LL, 0LL, 2LL, a5, a6, a7, a8);
}

uint64_t xo_close_container_d( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_transition(0LL, 0LL, 0LL, 2LL, a5, a6, a7, a8);
}

uint64_t xo_open_list_hf( uint64_t a1, uint64_t a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_transition(a1, a2, a3, 3LL, a5, a6, a7, a8);
}

uint64_t xo_open_list_h( uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_transition(a1, 0LL, a2, 3LL, a5, a6, a7, a8);
}

uint64_t xo_open_list( char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_transition(0LL, 0LL, a1, 3LL, a5, a6, a7, a8);
}

uint64_t xo_open_list_hd( uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_transition(a1, 1024LL, a2, 3LL, a5, a6, a7, a8);
}

uint64_t xo_open_list_d( char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_transition(0LL, 1024LL, a1, 3LL, a5, a6, a7, a8);
}

uint64_t xo_close_list_h( uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_transition(a1, 0LL, a2, 4LL, a5, a6, a7, a8);
}

uint64_t xo_close_list( char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_transition(0LL, 0LL, a1, 4LL, a5, a6, a7, a8);
}

uint64_t xo_close_list_hd( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_transition(a1, 0LL, 0LL, 4LL, a5, a6, a7, a8);
}

uint64_t xo_close_list_d( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_transition(0LL, 0LL, 0LL, 4LL, a5, a6, a7, a8);
}

uint64_t xo_open_instance_hf( uint64_t a1, uint64_t a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_transition(a1, a2, a3, 5LL, a5, a6, a7, a8);
}

uint64_t xo_open_instance_h( uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_transition(a1, 0LL, a2, 5LL, a5, a6, a7, a8);
}

uint64_t xo_open_instance( char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_transition(0LL, 0LL, a1, 5LL, a5, a6, a7, a8);
}

uint64_t xo_open_instance_hd( uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_transition(a1, 1024LL, a2, 5LL, a5, a6, a7, a8);
}

uint64_t xo_open_instance_d( char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_transition(0LL, 1024LL, a1, 5LL, a5, a6, a7, a8);
}

uint64_t xo_close_instance_h( uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_transition(a1, 0LL, a2, 6LL, a5, a6, a7, a8);
}

uint64_t xo_close_instance( char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_transition(0LL, 0LL, a1, 6LL, a5, a6, a7, a8);
}

uint64_t xo_close_instance_hd( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_transition(a1, 0LL, 0LL, 6LL, a5, a6, a7, a8);
}

uint64_t xo_close_instance_d( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_transition(0LL, 0LL, 0LL, 6LL, a5, a6, a7, a8);
}

uint64_t xo_open_marker_h(uint64_t a1, char *a2)
{
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited()) {
      xo_default_init();
    }
    a1 = xo_default_handle();
  }

  xo_depth_change((_BYTE *)a1, a2, 1, 0, 0xAu, *(_DWORD *)(*(void *)(a1 + 168) + 24LL * *(int *)(a1 + 176)) & 0xF1);
  return 0LL;
}

_BYTE *xo_depth_change(_BYTE *result, char *__s1, int a3, __int16 a4, unsigned int a5, int a6)
{
  int v8 = result;
  int v9 = *((unsigned __int16 *)result + 8);
  if (v9 == 3 || v9 == 0) {
    a4 = 0;
  }
  uint64_t v12 = *(void *)result;
  unsigned int v13 = (*(void *)result >> 7) & 8 | a6;
  int v14 = *((_DWORD *)result + 44);
  if ((a3 & 0x80000000) == 0)
  {
    uint64_t result = (_BYTE *)xo_depth_check((uint64_t)result, v14 + a3);
    if ((_DWORD)result) {
      return result;
    }
    uint64_t v16 = *((void *)v8 + 21);
    int v17 = *((_DWORD *)v8 + 44);
    uint64_t v18 = v17 + a3;
    BOOL v19 = (unsigned int *)(v16 + 24 * v18);
    unsigned int *v19 = v13;
    v19[1] = a5;
    uint64_t v20 = *(void *)v8;
    if ((*(void *)v8 & 0x2000) != 0)
    {
      *(_DWORD *)(v16 + 24LL * v17) |= 1u;
      *(void *)int v8 = v20 & 0xFFFFFFFFFFFFDFFFLL;
    }

    if (__s1) {
      int v21 = __s1;
    }
    else {
      int v21 = "failure";
    }
    uint64_t result = xo_strndup(v21, 0xFFFFFFFFFFFFFFFFLL);
    *(void *)(v16 + 24LL * (int)v18 + 8) = result;
    goto LABEL_21;
  }

  if (v14)
  {
    uint64_t v22 = *((void *)result + 21);
    uint64_t v23 = v22 + 24LL * v14;
    uint64_t v26 = *(const char **)(v23 + 8);
    int v25 = (void *)(v23 + 8);
    unint64_t v24 = v26;
    if ((v12 & 0x10) == 0)
    {
LABEL_17:
      if (v24)
      {
        xo_free(v24);
        *int v25 = 0LL;
      }

      uint64_t v27 = v22 + 24LL * v14;
      unint64_t v29 = *(_BYTE **)(v27 + 16);
      unint64_t v28 = (void *)(v27 + 16);
      uint64_t result = v29;
      if (v29)
      {
        uint64_t result = (_BYTE *)xo_free(result);
        void *v28 = 0LL;
      }

LABEL_21:
      *((_DWORD *)v8 + 44) += a3;
      *((_WORD *)v8 + 9) += a4;
      return result;
    }

    if (__s1 && v24 && strcmp(__s1, v24))
    {
      uint64_t v30 = "incorrect close: '%s' .vs. '%s'";
    }

    else
    {
      int v31 = *(_DWORD *)(v22 + 24LL * v14) ^ v13;
      if ((v31 & 2) != 0)
      {
        uint64_t v30 = "list close on list confict: '%s'";
      }

      else
      {
        if ((v31 & 4) == 0) {
          goto LABEL_17;
        }
        uint64_t v30 = "list close on instance confict: '%s'";
      }
    }
  }

  else
  {
    if ((v12 & 0x1000) != 0) {
      return result;
    }
    uint64_t v30 = "close with empty stack: '%s'";
  }

  return xo_failure(v8, v30);
}

uint64_t xo_open_marker(char *a1)
{
  return 0LL;
}

uint64_t xo_close_marker_h(_BYTE *a1, char *a2)
{
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited()) {
      xo_default_init();
    }
    a1 = (_BYTE *)xo_default_handle();
  }

  xo_do_close(a1, a2, 10);
  return 0LL;
}

_BYTE *xo_do_close(_BYTE *result, char *__s1, int a3)
{
  uint64_t v4 = result;
  char v5 = 1;
  int v6 = 1;
  switch(a3)
  {
    case 2:
      goto LABEL_6;
    case 4:
      int v6 = 3;
      goto LABEL_6;
    case 6:
      int v6 = 5;
      goto LABEL_6;
    case 8:
      int v6 = 7;
      goto LABEL_6;
    case 10:
      char v5 = 0;
      int v6 = 10;
LABEL_6:
      int v7 = *((_DWORD *)result + 44);
      if (v7 < 1) {
        goto LABEL_17;
      }
      unint64_t v8 = *((void *)result + 21);
      unint64_t v9 = v8 + 24LL * v7;
      char v10 = v5 ^ 1;
      break;
    default:
      return result;
  }

  while (1)
  {
    int v11 = *(_DWORD *)(v9 + 4);
    char v12 = v11 == 10 ? v10 : 1;
    if ((v12 & 1) == 0) {
      break;
    }
    if (v11 == v6)
    {
      if (!__s1) {
        return (_BYTE *)xo_do_close_all((uint64_t)v4, v9);
      }
      unsigned int v13 = *(const char **)(v9 + 8);
      if (!v13 || !strcmp(__s1, v13)) {
        return (_BYTE *)xo_do_close_all((uint64_t)v4, v9);
      }
    }

    v9 -= 24LL;
    if (v9 <= v8)
    {
LABEL_17:
      int v14 = "xo_%s can't find match for '%s'";
      return xo_failure(v4, v14);
    }
  }

  if (__s1)
  {
    int v14 = "close (xo_%s) fails at marker '%s'; not found '%s'";
    return xo_failure(v4, v14);
  }

  xo_failure(v4, "close stops at marker '%s'");
  return (_BYTE *)xo_do_close_all((uint64_t)v4, v9);
}

uint64_t xo_close_marker(char *a1)
{
  return 0LL;
}

void *xo_set_writer(void *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!result)
  {
    if (!*(_DWORD *)xo_default_inited()) {
      xo_default_init();
    }
    uint64_t result = (void *)xo_default_handle();
  }

  result[8] = a2;
  result[3] = a3;
  result[4] = a4;
  result[5] = a5;
  return result;
}

uint64_t (*xo_set_allocator(uint64_t (*result)(void), uint64_t (*a2)(void)))(void)
{
  xo_realloc = result;
  xo_free = a2;
  return result;
}

uint64_t xo_flush()
{
  return xo_flush_h(0LL);
}

uint64_t xo_finish_h( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = a1;
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited()) {
      xo_default_init();
    }
    uint64_t v8 = xo_default_handle();
  }

  if ((*(_BYTE *)(v8 + 3) & 1) == 0) {
    xo_do_close_all(v8, *(void *)(v8 + 168));
  }
  int v9 = *(unsigned __int16 *)(v8 + 16);
  if (v9 == 5)
  {
    xo_encoder_handle(v8, 12LL, 0LL, 0LL, 0LL);
  }

  else if (v9 == 2 && (*(void *)v8 & 0x10000) == 0)
  {
    char v10 = "\n";
    if ((*(void *)v8 & 2LL) == 0) {
      char v10 = (const char *)&xo_version_extra;
    }
    uint64_t v11 = *(void *)(v8 + 8);
    if ((v11 & 4) != 0)
    {
      *(void *)(v8 + 8) = v11 & 0xFFFFFFFFFFFFFFFBLL;
    }

    else if ((v11 & 0x40) == 0)
    {
      char v10 = (const char *)&xo_version_extra;
    }

    xo_printf(v8, "%s%*s%s}\n", a3, a4, a5, a6, a7, a8, (char)v10);
  }

  return xo_flush_h(v8);
}

uint64_t xo_do_close_all(uint64_t result, unint64_t a2)
{
  unint64_t v2 = *(void *)(result + 168) + 24LL * *(int *)(result + 176);
  if (v2 >= a2)
  {
    uint64_t v4 = result;
    uint64_t v5 = 0LL;
    while (2)
    {
      uint64_t v6 = *(unsigned int *)(v2 + 4);
      switch((int)v6)
      {
        case 0:
          goto LABEL_12;
        case 1:
          uint64_t result = xo_do_close_container(v4, 0LL);
          goto LABEL_8;
        case 3:
          uint64_t result = xo_do_close_list(v4, 0LL);
          goto LABEL_8;
        case 5:
          uint64_t result = xo_do_close_instance(v4, 0LL);
          goto LABEL_8;
        case 7:
          uint64_t result = xo_do_close_leaf_list(v4, 0LL);
LABEL_8:
          uint64_t v5 = (int)result;
          goto LABEL_9;
        case 10:
          int v7 = *(_DWORD *)v2 & 0xF1;
          uint64_t result = (uint64_t)xo_depth_change((_BYTE *)v4, *(char **)(v2 + 8), -1, 0, 0xAu, 0);
          uint64_t v6 = 0LL;
          *(_DWORD *)(*(void *)(v4 + 168) + 24LL * *(int *)(v4 + 176)) |= v7;
          goto LABEL_12;
        default:
LABEL_9:
          if (v5 < 0) {
            uint64_t result = (uint64_t)xo_failure((_BYTE *)v4, "close %d failed: %d");
          }
          uint64_t v6 = v5;
LABEL_12:
          v2 -= 24LL;
          uint64_t v5 = v6;
          if (v2 < a2) {
            return result;
          }
          continue;
      }
    }
  }

  return result;
}

uint64_t xo_indent(uint64_t a1)
{
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited()) {
      xo_default_init();
    }
    a1 = xo_default_handle();
  }

  if ((*(_BYTE *)a1 & 2) != 0) {
  else
  }
    return 0LL;
}

uint64_t xo_finish_atexit( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_finish_h(0LL, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t xo_errorn_hv( uint64_t result, int a2, char *a3, va_list a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = result;
  v20[1] = *MEMORY[0x1895F89C0];
  v20[0] = a4;
  if (!result)
  {
    if (!*(_DWORD *)xo_default_inited()) {
      xo_default_init();
    }
    uint64_t result = xo_default_handle();
    uint64_t v11 = result;
  }

  if (a2)
  {
    uint64_t result = strlen(a3);
    if (result >= 1)
    {
      size_t v12 = result;
      if (a3[result - 1] != 10)
      {
        MEMORY[0x1895F8858](result);
        uint64_t result = (uint64_t)memcpy((char *)v20 - ((v12 + 17) & 0xFFFFFFFFFFFFFFF0LL), a3, v12);
        *(_WORD *)((char *)v20 + v12 - ((v12 + 17) & 0xFFFFFFFFFFFFFFF0LL)) = 10;
        a3 = (char *)v20 - ((v12 + 17) & 0xFFFFFFFFFFFFFFF0LL);
      }
    }
  }

  int v13 = *(unsigned __int16 *)(v11 + 16);
  if ((v13 - 1) < 2)
  {
    *(void *)(v11 + 200) = v20[0];
    xo_transition(v11, 0LL, "error", 1LL, a5, a6, a7, a8);
    size_t v14 = strlen(a3);
    xo_format_value(v11, "message", 7uLL, 0LL, 0LL, (unsigned __int8 *)a3, v14, 0LL, 0LL, 0LL);
    uint64_t result = xo_transition(v11, 0LL, "error", 2LL, v15, v16, v17, v18);
LABEL_17:
    *(void *)(v11 + 200) = 0LL;
    return result;
  }

  if (v13 == 3)
  {
    *(void *)(v11 + 200) = v20[0];
    size_t v19 = strlen(a3);
    xo_buf_append_div(v11, "error", 0, 0LL, 0LL, 0LL, 0LL, a3, v19, 0LL, 0LL);
    if ((*(_BYTE *)(v11 + 8) & 2) != 0) {
      xo_line_close((void *)v11);
    }
    uint64_t result = xo_write((void *)v11);
    goto LABEL_17;
  }

  if (!*(_WORD *)(v11 + 16)) {
    return vfprintf((FILE *)*MEMORY[0x1895F89D0], a3, a4);
  }
  return result;
}

void *xo_line_close(void *result)
{
  uint64_t v1 = result;
  if (!*((_WORD *)result + 8)) {
    return xo_data_append(v1, "\n", 1uLL);
  }
  if (*((_WORD *)result + 8) == 3)
  {
    uint64_t v2 = result[1];
    if ((v2 & 2) == 0)
    {
      xo_line_ensure_open(result);
      uint64_t v2 = v1[1];
    }

    v1[1] = v2 & 0xFFFFFFFFFFFFFFFDLL;
    uint64_t result = xo_data_append(v1, xo_line_close_div_close, 6uLL);
    if ((*(_BYTE *)v1 & 2) != 0) {
      return xo_data_append(v1, "\n", 1uLL);
    }
  }

  return result;
}

void *xo_format_value( unint64_t a1, char *a2, size_t a3, char *a4, uint64_t a5, unsigned __int8 *a6, size_t a7, char *a8, size_t a9, uint64_t a10)
{
  uint64_t v82 = a5;
  uint64_t v17 = a10;
  v83[3] = *MEMORY[0x1895F89C0];
  uint64_t v80 = *(void *)a1;
  uint64_t v18 = *(void *)(a1 + 168);
  int v19 = *(_DWORD *)(a1 + 176);
  uint64_t v20 = (int *)(v18 + 24LL * v19);
  if ((a10 & 0x2000) != 0)
  {
    if ((*v20 & 0xE0) != 0x80)
    {
      MEMORY[0x1895F8858](a1);
      memcpy((char *)&v79 - ((a3 + 16) & 0xFFFFFFFFFFFFFFF0LL), a2, a3);
      *((_BYTE *)&v79 + a3 - ((a3 + 16) & 0xFFFFFFFFFFFFFFF0LL)) = 0;
      else {
        *(_DWORD *)(*(void *)(a1 + 168) + 24LL * *(int *)(a1 + 176)) |= 0x80u;
      }
      uint64_t v18 = *(void *)(a1 + 168);
      int v19 = *(_DWORD *)(a1 + 176);
    }

    uint64_t v41 = v18 + 24LL * v19;
    uint64_t v42 = *(char **)(v41 + 8);
    if (v42)
    {
      a3 = strlen(*(const char **)(v41 + 8));
      a2 = v42;
    }

    goto LABEL_24;
  }

  int v21 = *v20;
  if ((a10 & 0x80) != 0)
  {
    if ((a10 & 0x40) != 0 || (v21 & 0x20) == 0)
    {
      if ((v21 & 0x40) == 0)
      {
        MEMORY[0x1895F8858](a1);
        memcpy((char *)&v79 - ((a3 + 16) & 0xFFFFFFFFFFFFFFF0LL), a2, a3);
        *((_BYTE *)&v79 + a3 - ((a3 + 16) & 0xFFFFFFFFFFFFFFF0LL)) = 0;
        if (xo_transition(a1, 0LL, (char *)&v79 - ((a3 + 16) & 0xFFFFFFFFFFFFFFF0LL), 11LL, v34, v35, v36, v37) < 0)
        {
          v17 |= 0x48uLL;
          uint64_t v26 = *(void *)(a1 + 168);
          int v38 = *(_DWORD *)(a1 + 176);
          int v40 = *(_DWORD *)(v26 + 24LL * v38);
        }

        else
        {
          uint64_t v26 = *(void *)(a1 + 168);
          int v38 = *(_DWORD *)(a1 + 176);
          uint64_t v39 = 24LL * v38;
          int v40 = *(_DWORD *)(v26 + v39) | 0x40;
          *(_DWORD *)(v26 + v39) = v40;
        }

        uint64_t v43 = 24LL * v38;
        int v44 = v40 | 0x40;
        goto LABEL_23;
      }
    }

    else
    {
      xo_failure((_BYTE *)a1, "key field emitted after normal value field: '%.*s'");
    }
  }

  else if ((*v20 & 0xA0) != 0x20)
  {
    MEMORY[0x1895F8858](a1);
    memcpy((char *)&v79 - ((a3 + 16) & 0xFFFFFFFFFFFFFFF0LL), a2, a3);
    *((_BYTE *)&v79 + a3 - ((a3 + 16) & 0xFFFFFFFFFFFFFFF0LL)) = 0;
    if (xo_transition(a1, 0LL, (char *)&v79 - ((a3 + 16) & 0xFFFFFFFFFFFFFFF0LL), 11LL, v22, v23, v24, v25) < 0)
    {
      v17 |= 0x48uLL;
      uint64_t v26 = *(void *)(a1 + 168);
      int v27 = *(_DWORD *)(a1 + 176);
      int v29 = *(_DWORD *)(v26 + 24LL * v27);
    }

    else
    {
      uint64_t v26 = *(void *)(a1 + 168);
      int v27 = *(_DWORD *)(a1 + 176);
      uint64_t v28 = 24LL * v27;
      int v29 = *(_DWORD *)(v26 + v28) | 0x20;
      *(_DWORD *)(v26 + v28) = v29;
    }

    uint64_t v43 = 24LL * v27;
    int v44 = v29 | 0x20;
LABEL_23:
    *(_DWORD *)(v26 + v43) = v44;
  }

LABEL_24:
  uint64_t result = xo_xml_leader_len((_BYTE *)a1, a2);
  int v46 = *(unsigned __int16 *)(a1 + 16);
  uint64_t v81 = a4;
  size_t v47 = a9;
  uint64_t v48 = (void *)(a1 + 72);
  switch(v46)
  {
    case 0:
      uint64_t v49 = *(void *)(a1 + 376);
      v83[0] = *(void *)(a1 + 80) - *(void *)(a1 + 72);
      v83[1] = v49;
      v83[2] = *(void *)(a1 + 352);
      if (v82)
      {
        uint64_t result = (void *)xo_data_append_content(a1, v81, v82, ((_DWORD)v17 << 8) & 0x800 | v17);
        if ((v17 & 0x8000) == 0) {
          return result;
        }
        return (void *)xo_format_humanize( a1,  (unint64_t *)(a1 + 72),  v83,  ((_DWORD)v17 << 8) & 0x800 | v17);
      }

      uint64_t result = (void *)xo_do_format_field(a1, 0LL, a6, a7, ((_DWORD)v17 << 8) & 0x800 | v17);
      if ((v17 & 0x8000) != 0) {
        return (void *)xo_format_humanize( a1,  (unint64_t *)(a1 + 72),  v83,  ((_DWORD)v17 << 8) & 0x800 | v17);
      }
      return result;
    case 1:
      if ((v17 & 0x40) != 0) {
        goto LABEL_80;
      }
      int v50 = result;
      if (!a8)
      {
        MEMORY[0x1895F8858](result);
        a8 = (char *)&v79 - ((a7 + 16) & 0xFFFFFFFFFFFFFFF0LL);
        memcpy(a8, a6, a7);
        a8[a7] = 0;
        if (*a8 == 37 && (a8[1] - 48) <= 9)
        {
          do
          {
            unsigned int v51 = a8[2] - 48;
            ++a8;
          }

          while (v51 < 0xA);
          *a8 = 37;
        }

        size_t v47 = strlen(a8);
      }

      if (!a3)
      {
        xo_failure((_BYTE *)a1, "missing field name: %s");
        a2 = xo_format_value_missing;
        a3 = 18LL;
      }

      char v52 = v80;
      if ((v80 & 2) != 0) {
        xo_buf_indent((void *)a1, -1);
      }
      xo_data_append((void *)a1, "<", 1uLL);
      if (*v50) {
        xo_data_append((void *)a1, v50, 1uLL);
      }
      xo_buf_escape(a1, (uint64_t *)(a1 + 72), a2, a3, 0);
      unsigned int v53 = *(_BYTE **)(a1 + 120);
      unsigned int v54 = *(_BYTE **)(a1 + 128);
      if (v54 != v53)
      {
        xo_data_append((void *)a1, v53, v54 - v53);
        *(void *)(a1 + 128) = *(void *)(a1 + 120);
      }

      uint64_t v55 = *(void *)a1;
      if ((v17 & 0x80) != 0 && (v55 & 0x800) != 0)
      {
        xo_data_append((void *)a1, xo_format_value_attr, 0xAuLL);
        uint64_t v55 = *(void *)a1;
      }

      if ((v55 & 0x40000) != 0)
      {
        *(void *)(a1 + 8) |= 0x10uLL;
        *(void *)(a1 + 368) = *(void *)(a1 + 80) - *(void *)(a1 + 72);
      }

      xo_data_append((void *)a1, ">", 1uLL);
      if (v82) {
        xo_data_append_content(a1, v81, v82, v17);
      }
      else {
        xo_do_format_field(a1, 0LL, (unsigned __int8 *)a8, v47, v17);
      }
      xo_data_append((void *)a1, "</", 2uLL);
      if (*v50) {
        xo_data_append((void *)a1, v50, 1uLL);
      }
      xo_buf_escape(a1, (uint64_t *)(a1 + 72), a2, a3, 0);
      uint64_t result = xo_data_append((void *)a1, ">", 1uLL);
      if ((v52 & 2) != 0)
      {
        v68 = "\n";
        goto LABEL_127;
      }

      return result;
    case 2:
      if ((v17 & 0x40) != 0) {
        goto LABEL_80;
      }
      if (!a8)
      {
        MEMORY[0x1895F8858](result);
        a8 = (char *)&v79 - ((a7 + 16) & 0xFFFFFFFFFFFFFFF0LL);
        memcpy(a8, a6, a7);
        a8[a7] = 0;
        if (*a8 == 37 && (a8[1] - 48) <= 9)
        {
          do
          {
            unsigned int v56 = a8[2] - 48;
            ++a8;
          }

          while (v56 < 0xA);
          *a8 = 37;
        }

        size_t v47 = strlen(a8);
      }

      uint64_t v57 = *(void *)a1;
      uint64_t v58 = (int *)(*(void *)(a1 + 168) + 24LL * *(int *)(a1 + 176));
      int v59 = *v58;
      if ((*(void *)a1 & 0x2000) != 0)
      {
        v59 |= 1u;
        *uint64_t v58 = v59;
        *(void *)a1 = v57 & 0xFFFFFFFFFFFFDFFFLL;
      }

      char v60 = v80;
      if ((v59 & 1) != 0)
      {
        xo_data_append((void *)a1, ",", 1uLL);
        if ((v17 & 0x2000) == 0 && (*(_BYTE *)a1 & 2) != 0) {
          xo_data_append((void *)a1, "\n", 1uLL);
        }
      }

      else
      {
        *uint64_t v58 = v59 | 1;
      }

      if ((v17 & 0x10) != 0) {
        goto LABEL_91;
      }
      if ((v17 & 0x20) != 0)
      {
        BOOL is_numeric = 1;
      }

      else if (v82)
      {
LABEL_91:
        BOOL is_numeric = 0;
      }

      else if (v47)
      {
        BOOL is_numeric = xo_format_is_numeric(a8, v47);
      }

      else
      {
        a8 = "true";
        BOOL is_numeric = 1;
        size_t v47 = 4LL;
      }

      if (!a3)
      {
        xo_failure((_BYTE *)a1, "missing field name: %s");
        a2 = xo_format_value_missing_219;
        a3 = 18LL;
      }

      if ((v17 & 0x2000) != 0)
      {
        if ((v59 & 1) != 0 && (v60 & 2) != 0)
        {
          xo_data_append((void *)a1, "\n", 1uLL);
          uint64_t v73 = v82;
        }

        else
        {
          uint64_t v73 = v82;
          if ((v60 & 2) == 0) {
            goto LABEL_119;
          }
        }

        xo_buf_indent((void *)a1, -1);
      }

      else
      {
        if ((v60 & 2) != 0) {
          xo_buf_indent((void *)a1, -1);
        }
        xo_data_append((void *)a1, "", 1uLL);
        uint64_t v72 = *(void *)(a1 + 72);
        uint64_t v71 = *(void *)(a1 + 80);
        xo_buf_escape(a1, (uint64_t *)(a1 + 72), a2, a3, 0);
        uint64_t v73 = v82;
        if ((*(_BYTE *)(a1 + 2) & 0x10) != 0)
        {
          uint64_t v74 = v71 - v72;
          uint64_t v75 = *(void *)(a1 + 80) - *(void *)(a1 + 72);
          if (v71 - v72 < v75)
          {
            do
            {
              if (*(_BYTE *)(*v48 + v74) == 45) {
                *(_BYTE *)(*v48 + v74) = 95;
              }
              ++v74;
            }

            while (v74 < v75);
          }
        }

        xo_data_append((void *)a1, ":", 2uLL);
        if ((v80 & 2) != 0) {
          xo_data_append((void *)a1, " ", 1uLL);
        }
      }

LABEL_119:
      if (!is_numeric)
      {
        xo_data_append((void *)a1, "", 1uLL);
        if (v73) {
          xo_data_append_content(a1, v81, v73, v17);
        }
        else {
          xo_do_format_field(a1, 0LL, (unsigned __int8 *)a8, v47, v17);
        }
        v68 = "";
LABEL_127:
        size_t v69 = (void *)a1;
        size_t v70 = 1LL;
        return xo_data_append(v69, v68, v70);
      }

      uint64_t v64 = a1;
      if (!v73)
      {
        unint64_t v65 = (unsigned __int8 *)a8;
        uint64_t v66 = v47;
        int v63 = v17;
        return (void *)xo_do_format_field(v64, 0LL, v65, v66, v63);
      }

      return (void *)xo_data_append_content(a1, v81, v73, v17);
    case 3:
      return xo_buf_append_div( a1,  "data",  ((_DWORD)v17 << 8) & 0x800 | v17,  a2,  a3,  v81,  v82,  a6,  a7,  a8,  a9);
    case 4:
      if ((v17 & 0x40) != 0) {
        goto LABEL_80;
      }
      if (!a8)
      {
        MEMORY[0x1895F8858](result);
        a8 = (char *)&v79 - ((a7 + 16) & 0xFFFFFFFFFFFFFFF0LL);
        memcpy(a8, a6, a7);
        a8[a7] = 0;
        if (*a8 == 37 && (a8[1] - 48) <= 9)
        {
          do
          {
            unsigned int v61 = a8[2] - 48;
            ++a8;
          }

          while (v61 < 0xA);
          *a8 = 37;
        }

        size_t v47 = strlen(a8);
      }

      if (!a3)
      {
        xo_failure((_BYTE *)a1, "missing field name: %s");
        a2 = xo_format_value_missing_221;
        a3 = 18LL;
      }

      xo_buf_escape(a1, (uint64_t *)(a1 + 72), a2, a3, 0);
      xo_data_append((void *)a1, "=", 2uLL);
      if (v82) {
        xo_data_append_content(a1, v81, v82, v17);
      }
      else {
        xo_do_format_field(a1, 0LL, (unsigned __int8 *)a8, v47, v17);
      }
      v68 = " ";
      size_t v69 = (void *)a1;
      size_t v70 = 2LL;
      return xo_data_append(v69, v68, v70);
    case 5:
      if ((v17 & 0x40) != 0)
      {
LABEL_80:
        if (!v82)
        {
          int v63 = v17 | 0x800;
          uint64_t v64 = a1;
          unint64_t v65 = a6;
          uint64_t v66 = a7;
          return (void *)xo_do_format_field(v64, 0LL, v65, v66, v63);
        }
      }

      else
      {
        if ((v17 & 0x10) != 0)
        {
          uint64_t v62 = 10LL;
        }

        else if ((v17 & 0x20) != 0)
        {
          uint64_t v62 = 11LL;
        }

        else if (a7)
        {
          uint64_t result = memchr("diouxXDOUeEfFgGaAcCp", (char)a6[a7 - 1], 0x15uLL);
          if (result) {
            uint64_t v62 = 11LL;
          }
          else {
            uint64_t v62 = 10LL;
          }
        }

        else
        {
          a6 = "true";
          uint64_t v62 = 11LL;
          a7 = 4LL;
        }

        if (!a8)
        {
          MEMORY[0x1895F8858](result);
          a8 = (char *)&v79 - ((a7 + 16) & 0xFFFFFFFFFFFFFFF0LL);
          memcpy(a8, a6, a7);
          a8[a7] = 0;
          if (*a8 == 37 && (a8[1] - 48) <= 9)
          {
            do
            {
              unsigned int v76 = a8[2] - 48;
              ++a8;
            }

            while (v76 < 0xA);
            *a8 = 37;
          }

          size_t v47 = strlen(a8);
        }

        if (!a3)
        {
          xo_failure((_BYTE *)a1, "missing field name: %s");
          a2 = xo_format_value_missing_225;
          a3 = 18LL;
        }

        uint64_t v77 = *(void *)(a1 + 80) - *(void *)(a1 + 72);
        xo_data_append((void *)a1, a2, a3);
        xo_data_append((void *)a1, &xo_version_extra, 1uLL);
        uint64_t v78 = *(void *)(a1 + 80) - *(void *)(a1 + 72);
        if (v82) {
          xo_data_append_content(a1, v81, v82, v17);
        }
        else {
          xo_do_format_field(a1, 0LL, (unsigned __int8 *)a8, v47, v17);
        }
        xo_data_append((void *)a1, &xo_version_extra, 1uLL);
        uint64_t result = (void *)xo_encoder_handle(a1, v62, *(void *)(a1 + 72) + v77, *(void *)(a1 + 72) + v78, v17);
        *(void *)(a1 + 80) = *(void *)(a1 + 72);
      }

      return result;
    default:
      return result;
  }

    uint64_t v22 = 1;
    BYTE2(v119) = 1;
    if ((v5 & 0x800) != 0) {
      goto LABEL_53;
    }
LABEL_54:
    uint64_t v17 = v19 + 1;
    uint64_t v23 = 0;
    LOBYTE(v25) = 0;
    LOBYTE(v24) = 0;
    LODWORD(v31) = -1;
LABEL_86:
    if (v17 == (unsigned __int8 *)v15)
    {
      uint64_t v41 = v24;
      uint64_t v42 = v23;
      xo_failure((_BYTE *)a1, "field format missing format character: %s");
      uint64_t v23 = v42;
      LOBYTE(v24) = v41;
      int v7 = *(void *)a1;
    }

    uint64_t v43 = *v17;
    LOBYTE(v119) = *v17;
    if ((v7 & 0x200) == 0 && (v43 | 0x20) == 0x73)
    {
      int v44 = 0LL;
      int v45 = BYTE9(v119);
      do
      {
        if (*((_BYTE *)v123 + v44 + 4))
        {
          int v46 = (*v118)++;
          size_t v47 = *(_DWORD *)v46;
          uint64_t v48 = (char *)v123 + 4 * v44 + 4;
          *((_DWORD *)v48 - 4) = v47;
          if (v47 < 0)
          {
            if (v44)
            {
              *((_DWORD *)v48 - 4) = -1;
            }

            else
            {
              LODWORD(v121) = -(int)v121;
              int v45 = 1;
              uint64_t v23 = 1;
            }
          }
        }

        ++v44;
      }

      while (v44 != 3);
      BYTE9(v119) = v45;
    }

    uint64_t v49 = SHIDWORD(v121);
    if (SHIDWORD(v121) > -1LL && v122 < 0) {
      unsigned int v51 = HIDWORD(v121);
    }
    else {
      unsigned int v51 = v122;
    }
    char v122 = v51;
    if ((v43 - 68) <= 0x11 && ((1 << (v43 - 68)) & 0x20801) != 0)
    {
      LOBYTE(v24) = 1;
      BYTE3(v119) = 1;
    }

    if (!v22)
    {
      v102 = v51;
      uint64_t v109 = v23;
      uint64_t v106 = v24;
      char v52 = v17 - v19;
      unsigned int v53 = *(void *)(a1 + 96);
      unsigned int v54 = *(_BYTE **)(a1 + 104);
      uint64_t v55 = (unint64_t)&v54[v17 - v19 + 2];
      if (v55 >= v53 + *(void *)(a1 + 112))
      {
        unsigned int v56 = (v55 - v53 + 0x1FFF) & 0xFFFFFFFFFFFFE000LL;
        uint64_t v57 = xo_realloc(v53, v56);
        if (!v57) {
          return -1LL;
        }
        unsigned int v54 = (_BYTE *)(v57 + *(void *)(a1 + 104) - *(void *)(a1 + 96));
        *(void *)(a1 + 96) = v57;
        *(void *)(a1 + 104) = v54;
        *(void *)(a1 + 112) = v56;
      }

      memcpy(v54, v19, v52 + 1);
      *unsigned int v54 = 37;
      v54[v52 + 1] = 0;
      uint64_t v22 = 0;
      if (*(void *)(a1 + 48))
      {
LABEL_112:
        uint64_t v58 = xo_vsnprintf(a1, (uint64_t)v111, v54, *(va_list *)(a1 + 200));
        LOBYTE(v24) = v106;
        uint64_t v5 = v107;
        if (v58 < 1) {
          goto LABEL_209;
        }
        switch(v110)
        {
          case 1:
            if ((v107 & 0x1000) != 0) {
              uint64_t v58 = xo_trim_ws((uint64_t)v111, v58);
            }
            goto LABEL_116;
          case 2:
            if ((v107 & 0x1000) != 0) {
              uint64_t v58 = xo_trim_ws((uint64_t)v111, v58);
            }
            uint64_t v73 = xo_escape_json(v111, v58);
            goto LABEL_160;
          case 3:
LABEL_116:
            int v59 = xo_escape_xml(v111, v58, v96);
            LOBYTE(v24) = v106;
            goto LABEL_164;
          case 4:
            if ((v107 & 0x1000) != 0) {
              uint64_t v58 = xo_trim_ws((uint64_t)v111, v58);
            }
            uint64_t v73 = xo_escape_sdparams(v111, v58);
LABEL_160:
            int v59 = v73;
            LOBYTE(v24) = v106;
            goto LABEL_164;
          case 5:
            if ((v107 & 0x1000) != 0)
            {
              uint64_t v58 = xo_trim_ws((uint64_t)v111, v58);
              LOBYTE(v24) = v106;
            }

            goto LABEL_163;
          default:
LABEL_163:
            int v59 = v58;
LABEL_164:
            if ((*(_BYTE *)(a1 + 2) & 0x20) != 0) {
              *(void *)(a1 + 376) += v58;
            }
            if ((*(_BYTE *)(a1 + 8) & 8) != 0) {
              *(void *)(a1 + 352) += v58;
            }
            break;
        }

        goto LABEL_207;
      }

      switch(v43)
      {
        case 's':
LABEL_124:
          unsigned int v61 = 1;
          if (v43 != 83 && !v106)
          {
            if ((_BYTE)v25) {
              unsigned int v61 = 3;
            }
            else {
              unsigned int v61 = 2;
            }
          }

          break;
        case 'm':
          unsigned int v61 = 2;
          break;
        case 'S':
          goto LABEL_124;
        default:
          goto LABEL_112;
      }

      BYTE1(v119) = v61;
      if ((*(_BYTE *)(a1 + 3) & 0x20) != 0)
      {
        uint64_t v62 = 2;
      }

      else if (*(_WORD *)(a1 + 16))
      {
        uint64_t v62 = 2;
      }

      else
      {
        uint64_t v62 = 3;
      }

      int v63 = v61;
      uint64_t v64 = (unsigned __int16)(v62 | (v61 << 8));
      if ((v64 - 258) >= 2 && (v64 - 514) >= 2 && (v64 - 770) >= 2)
      {
        xo_failure((_BYTE *)a1, "invalid conversion (%c:%c)");
        LOBYTE(v24) = v106;
        int v59 = 0LL;
        uint64_t v5 = v107;
      }

      else
      {
        unint64_t v65 = v111[1] - *v111;
        if (v43 == 109)
        {
          uint64_t v66 = strerror(*(_DWORD *)(a1 + 440));
          size_t v67 = v66;
          if ((v49 & 0x80000000) == 0)
          {
            v68 = (__int32 *)v66;
            goto LABEL_144;
          }

          if (v66)
          {
            uint64_t v71 = strlen(v66);
            size_t v70 = v102;
            goto LABEL_175;
          }

          size_t v70 = v102;
          if ((v107 & 0x20) == 0)
          {
LABEL_174:
            uint64_t v71 = 6LL;
            size_t v67 = xo_format_string_null;
            goto LABEL_175;
          }
}

uint64_t xo_error_h(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  return xo_errorn_hv(a1, 0, a2, va, a5, a6, a7, a8);
}

uint64_t xo_error_hv( uint64_t a1, char *a2, va_list a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return xo_errorn_hv(a1, 0, a2, a3, a5, a6, a7, a8);
}

uint64_t xo_error(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  return xo_errorn_hv(0LL, 0, a1, va, a5, a6, a7, a8);
}

uint64_t xo_errorn_h(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  return xo_errorn_hv(a1, 1, a2, va, a5, a6, a7, a8);
}

uint64_t xo_errorn(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  return xo_errorn_hv(0LL, 1, a1, va, a5, a6, a7, a8);
}

uint64_t xo_parse_args(int a1, uint64_t *a2)
{
  if (!xo_program)
  {
    xo_program = *a2;
    uint64_t v4 = (const char *)xo_program;
    uint64_t v5 = strrchr((const char *)xo_program, 47);
    if (v5)
    {
      uint64_t v4 = v5 + 1;
      xo_program = (uint64_t)(v5 + 1);
    }

    size_t v6 = strlen(v4);
    if (v6 >= 6)
    {
      int v7 = &v4[v6 - 5];
      if (!strcmp(v7, ".test")) {
        *int v7 = 0;
      }
    }
  }

  if (!*(_DWORD *)xo_default_inited()) {
    xo_default_init();
  }
  uint64_t v8 = xo_default_handle();
  uint64_t v9 = 1LL;
  if (a1 < 2)
  {
LABEL_28:
    if ((*(_BYTE *)(v8 + 3) & 2) != 0 && isatty(1)) {
      *(void *)v8 |= 0x4000000uLL;
    }
    a2[(int)v9] = 0LL;
    return v9;
  }

  LODWORD(v10) = 1;
  while (1)
  {
    uint64_t v11 = a2[(int)v10];
    if (!v11 || strncmp((const char *)a2[(int)v10], xo_parse_args_libxo_opt, 7uLL))
    {
      if ((_DWORD)v9 != (_DWORD)v10) {
        a2[(int)v9] = v11;
      }
      uint64_t v9 = (v9 + 1);
      goto LABEL_16;
    }

    size_t v12 = (char *)(v11 + 7);
    unsigned int v13 = *(unsigned __int8 *)(v11 + 7);
    if (v13 <= 0x39) {
      break;
    }
    if (v13 != 58)
    {
      if (v13 != 61) {
        goto LABEL_35;
      }
      size_t v12 = (char *)(v11 + 8);
    }

    if ((xo_set_options(v8, v12) & 0x80000000) != 0) {
      return 0xFFFFFFFFLL;
    }
LABEL_16:
    LODWORD(v10) = v10 + 1;
  }

  if (*(_BYTE *)(v11 + 7))
  {
LABEL_35:
    xo_warnx("unknown libxo option: '%s'");
    return 0xFFFFFFFFLL;
  }

  uint64_t v10 = (int)v10 + 1LL;
  size_t v14 = (char *)a2[v10];
  if (v14)
  {
    if ((xo_set_options(v8, v14) & 0x80000000) != 0) {
      return 0xFFFFFFFFLL;
    }
    goto LABEL_16;
  }

  xo_warnx("missing libxo option");
  return 0xFFFFFFFFLL;
}

size_t xo_dump_stack(uint64_t a1)
{
  uint64_t v1 = a1;
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited()) {
      xo_default_init();
    }
    uint64_t v1 = xo_default_handle();
  }

  uint64_t v2 = (FILE **)MEMORY[0x1895F89D0];
  size_t result = fwrite("Stack dump:\n", 0xCuLL, 1uLL, (FILE *)*MEMORY[0x1895F89D0]);
  if (*(int *)(v1 + 176) >= 1)
  {
    int v4 = 0;
    uint64_t v5 = (const char **)(*(void *)(v1 + 168) + 32LL);
    do
    {
      uint64_t v6 = *((unsigned int *)v5 - 1);
      int v7 = "unknown";
      ++v4;
      uint64_t v8 = *v5;
      if (!*v5) {
        uint64_t v8 = "--";
      }
      size_t result = fprintf(*v2, "   [%d] %s '%s' [%x]\n", v4, v7, v8, *((_DWORD *)v5 - 2));
      v5 += 3;
    }

    while (v4 < *(_DWORD *)(v1 + 176));
  }

  return result;
}

uint64_t xo_set_program(uint64_t result)
{
  xo_program = result;
  return result;
}

char *xo_set_version_h(char *result, char *__s)
{
  uint64_t v3 = (uint64_t)result;
  if (result)
  {
    if (!__s) {
      return result;
    }
    goto LABEL_7;
  }

  if (!*(_DWORD *)xo_default_inited()) {
    xo_default_init();
  }
  size_t result = (char *)xo_default_handle();
  uint64_t v3 = (uint64_t)result;
  if (__s)
  {
LABEL_7:
    size_t result = strchr(__s, 34);
    if (!result)
    {
      int v9 = *(unsigned __int16 *)(v3 + 16);
      switch(v9)
      {
        case 5:
          return (char *)xo_encoder_handle(v3, 16LL, 0LL, (uint64_t)__s, 0LL);
        case 2:
          size_t result = xo_strndup(__s, 0xFFFFFFFFFFFFFFFFLL);
          *(void *)(v3 + 432) = result;
          break;
        case 1:
          return (char *)xo_attr_h(v3, "version", "%s", v4, v5, v6, v7, v8, (char)__s);
      }
    }
  }

  return result;
}

char *xo_set_version(char *__s)
{
  return xo_set_version_h(0LL, __s);
}

uint64_t xo_emit_warn_hcv(uint64_t result, int a2, int a3, char *a4, uint64_t a5)
{
  uint64_t v5 = a5;
  unint64_t v9 = result;
  uint64_t v62 = *MEMORY[0x1895F89C0];
  if (!result)
  {
    if (!*(_DWORD *)xo_default_inited()) {
      xo_default_init();
    }
    size_t result = xo_default_handle();
    unint64_t v9 = result;
  }

  if (a4)
  {
    xo_open_marker_h(v9, "xo_emit_warn_hcv");
    if (a2) {
      size_t v14 = "__warning";
    }
    else {
      size_t v14 = "__error";
    }
    xo_transition(v9, 0LL, v14, 1LL, v10, v11, v12, v13);
    if (xo_program) {
      xo_emit("{wc:program}", v15, v16, v17, v18, v19, v20, v21, xo_program);
    }
    if (*(unsigned __int16 *)(v9 + 16) - 1 <= 1)
    {
      uint64_t v61 = 0LL;
      __int128 v59 = 0u;
      __int128 v60 = 0u;
      __int128 v57 = 0u;
      __int128 v58 = 0u;
      __int128 v55 = 0u;
      __int128 v56 = 0u;
      __int128 v53 = 0u;
      __int128 v54 = 0u;
      __int128 v51 = 0u;
      __int128 v52 = 0u;
      __int128 v49 = 0u;
      __int128 v50 = 0u;
      __int128 v47 = 0u;
      __int128 v48 = 0u;
      __int128 v45 = 0u;
      __int128 v46 = 0u;
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      __int128 v41 = 0u;
      __int128 v42 = 0u;
      __int128 v39 = 0u;
      __int128 v40 = 0u;
      __int128 v38 = 0u;
      uint64_t v34 = 0LL;
      memset(v33, 0, sizeof(v33));
      uint64_t v37 = 0x2000LL;
      uint64_t v35 = (char *)xo_realloc(0LL, 0x2000LL);
      uint64_t v36 = v35;
      xo_depth_check((uint64_t)v33, 128);
      xo_emit_hv((unint64_t)v33, a4, a5);
      xo_format_value(v9, "message", 7uLL, v35, v36 - v35, 0LL, 0LL, 0LL, 0LL, 0LL);
      xo_free(*((void *)&v42 + 1));
      if (v35) {
        xo_free(v35);
      }
      uint64_t v5 = a5;
    }

    xo_emit_hv(v9, a4, v5);
    int64_t v22 = strlen(a4);
    if (v22 >= 1 && a4[v22 - 1] != 10)
    {
      if (a3 >= 1)
      {
        uint64_t v30 = strerror(a3);
        if (v30) {
          xo_emit_h(v9, ": {G:strerror}{g:error/%s}", v24, v25, v26, v27, v28, v29, (uint64_t)v30);
        }
      }

      xo_emit("\n", v23, v24, v25, v26, v27, v28, v29, v31);
    }

    xo_close_marker_h((_BYTE *)v9, "xo_emit_warn_hcv");
    return xo_flush_h(v9);
  }

  return result;
}

uint64_t xo_emit_warn_hc( uint64_t a1, int a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return xo_emit_warn_hcv(a1, 1, a2, a3, (uint64_t)&a9);
}

uint64_t xo_emit_warn_c( int a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return xo_emit_warn_hcv(0LL, 1, a1, a2, (uint64_t)&a9);
}

uint64_t xo_emit_warn( char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10 = __error();
  return xo_emit_warn_hcv(0LL, 1, *v10, a1, (uint64_t)&a9);
}

uint64_t xo_emit_warnx( char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return xo_emit_warn_hcv(0LL, 1, -1, a1, (uint64_t)&a9);
}

void xo_emit_err_v(int a1, int a2, char *a3, uint64_t a4)
{
  uint64_t v5 = xo_emit_warn_hcv(0LL, 0, a2, a3, a4);
  xo_finish(v5, v6, v7, v8, v9, v10, v11, v12);
  exit(a1);
}

void xo_emit_err( int a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v11 = __error();
  xo_emit_err_v(a1, *v11, a2, (uint64_t)&a9);
}

void xo_emit_errx( int a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void xo_emit_errc( int a1, int a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t xo_get_private(uint64_t a1)
{
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited()) {
      xo_default_init();
    }
    a1 = xo_default_handle();
  }

  return *(void *)(a1 + 464);
}

uint64_t xo_set_private(uint64_t result, uint64_t a2)
{
  if (!result)
  {
    if (!*(_DWORD *)xo_default_inited()) {
      xo_default_init();
    }
    size_t result = xo_default_handle();
  }

  *(void *)(result + 464) = a2;
  return result;
}

uint64_t xo_get_encoder(uint64_t a1)
{
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited()) {
      xo_default_init();
    }
    a1 = xo_default_handle();
  }

  return *(void *)(a1 + 456);
}

uint64_t xo_set_encoder(uint64_t result, uint64_t a2)
{
  if (!result)
  {
    if (!*(_DWORD *)xo_default_inited()) {
      xo_default_init();
    }
    size_t result = xo_default_handle();
  }

  *(_WORD *)(result + 16) = 5;
  *(void *)(result + 456) = a2;
  return result;
}

uint64_t xo_explicit_transition( uint64_t result, int a2, char *__s1, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = result;
  if (!result)
  {
    if (!*(_DWORD *)xo_default_inited()) {
      xo_default_init();
    }
    size_t result = xo_default_handle();
    uint64_t v11 = result;
  }

  switch(a2)
  {
    case 3:
      size_t result = xo_do_open_list(v11, a4, __s1, a4, a5, a6, a7, a8);
      break;
    case 4:
      xo_depth_change((_BYTE *)v11, __s1, 1, 1, 3u, (a4 >> 7) & 8 | (*(_DWORD *)v11 >> 13) & 1 | 2);
      size_t result = xo_do_close_list(v11, __s1);
      break;
    case 5:
      size_t result = xo_do_open_instance(v11, a4, __s1);
      break;
    case 6:
      xo_depth_change((_BYTE *)v11, __s1, 1, 1, 5u, (a4 >> 7) & 8);
      uint64_t v12 = *(void *)v11;
      if ((*(void *)v11 & 0x2000) != 0)
      {
        *(_DWORD *)(*(void *)(v11 + 168) + 24LL * *(int *)(v11 + 176)) |= 1u;
        *(void *)uint64_t v11 = v12 & 0xFFFFFFFFFFFFDFFFLL;
      }

      size_t result = xo_do_close_instance(v11, __s1);
      break;
    default:
      return result;
  }

  return result;
}

uint64_t xo_do_open_list( uint64_t a1, uint64_t a2, char *__s, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = __s;
  uint64_t v10 = a1;
  v25[1] = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited()) {
      xo_default_init();
    }
    uint64_t v10 = xo_default_handle();
  }

  int v11 = *(unsigned __int16 *)(v10 + 16);
  if (v11 == 5)
  {
    uint64_t v22 = xo_encoder_handle(v10, 4LL, (uint64_t)v8, 0LL, a2);
    __int16 v23 = 0;
  }

  else if (v11 == 2)
  {
    if ((*(void *)v10 & 0x10000) == 0 && (*(_BYTE *)(v10 + 8) & 4) == 0) {
      xo_emit_top(v10);
    }
    if (!v8)
    {
      xo_failure((_BYTE *)v10, "NULL passed for list name");
      uint64_t v8 = "failure";
    }

    uint64_t v12 = *(void *)v10;
    uint64_t v13 = (int *)(*(void *)(v10 + 168) + 24LL * *(int *)(v10 + 176));
    int v14 = *v13;
    if ((*(void *)v10 & 0x2000) != 0)
    {
      v14 |= 1u;
      *uint64_t v13 = v14;
      v12 &= ~0x2000uLL;
      *(void *)uint64_t v10 = v12;
    }

    uint64_t v15 = ",\n";
    if ((v12 & 2) == 0) {
      uint64_t v15 = ", ";
    }
    if ((v14 & 1) != 0) {
      LOBYTE(v16) = (_BYTE)v15;
    }
    else {
      uint64_t v16 = &xo_version_extra;
    }
    *uint64_t v13 = v14 | 1;
    if ((v12 & 0x100000) != 0)
    {
      size_t v17 = strlen(v8);
      uint64_t v18 = MEMORY[0x1895F8858](v17);
      uint64_t v19 = (char *)v25 - ((v18 + 16) & 0xFFFFFFFFFFFFFFF0LL);
      if (v19 < &v19[v18 + 1])
      {
        uint64_t v20 = 0LL;
        do
        {
          int v21 = v8[v20];
          if (v21 == 45) {
            LOBYTE(v21) = 95;
          }
          v19[v20++] = v21;
        }

        while (&v19[v20 - 1] < &v19[v18]);
      }
    }

    uint64_t v22 = xo_printf(v10, "%s%*s%s: [%s", (uint64_t)__s, a4, a5, a6, a7, a8, (char)v16);
    __int16 v23 = 1;
  }

  else
  {
    __int16 v23 = 0;
    uint64_t v22 = 0LL;
  }

  xo_depth_change((_BYTE *)v10, v8, 1, v23, 3u, (a2 >> 7) & 8 | 2);
  return v22;
}

uint64_t xo_do_open_instance(uint64_t a1, uint64_t a2, char *__s)
{
  uint64_t v5 = a1;
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited()) {
      xo_default_init();
    }
    uint64_t v5 = xo_default_handle();
  }

  if ((*(_BYTE *)v5 & 2) != 0) {
    uint64_t v6 = "\n";
  }
  else {
    uint64_t v6 = (const char *)&xo_version_extra;
  }
  if (!__s)
  {
    xo_failure((_BYTE *)v5, "NULL passed for instance name");
    __s = "failure";
  }

  strlen(__s);
  xo_xml_leader_len((_BYTE *)v5, __s);
  uint64_t v13 = *(void *)v5;
  uint64_t v14 = *(void *)v5 | a2;
  int v15 = *(unsigned __int16 *)(v5 + 16);
  switch(v15)
  {
    case 5:
      uint64_t v17 = xo_encoder_handle(v5, 8LL, (uint64_t)__s, 0LL, v14);
      break;
    case 2:
      uint64_t v18 = (int *)(*(void *)(v5 + 168) + 24LL * *(int *)(v5 + 176));
      int v19 = *v18;
      if ((v13 & 0x2000) != 0)
      {
        v19 |= 1u;
        *uint64_t v18 = v19;
        v13 &= ~0x2000uLL;
        *(void *)uint64_t v5 = v13;
      }

      uint64_t v20 = ",\n";
      if ((v13 & 2) == 0) {
        uint64_t v20 = ", ";
      }
      if ((v19 & 1) == 0) {
        uint64_t v20 = (const char *)&xo_version_extra;
      }
      *uint64_t v18 = v19 | 1;
      uint64_t v17 = xo_printf(v5, "%s%*s{%s", v7, v8, v9, v10, v11, v12, (char)v20);
      break;
    case 1:
      if ((v13 & 2) != 0) {
      else
      }
        LOBYTE(v16) = 0;
      uint64_t v21 = xo_printf(v5, "%*s<%s%s", v7, v8, v9, v10, v11, v12, v16);
      uint64_t v27 = v21;
      uint64_t v28 = *(_BYTE **)(v5 + 120);
      uint64_t v29 = *(_BYTE **)(v5 + 128);
      size_t v30 = v29 - v28;
      if (v29 != v28)
      {
        uint64_t v27 = v30 + v21;
        xo_data_append((void *)v5, v28, v30);
        *(void *)(v5 + 128) = *(void *)(v5 + 120);
      }

      uint64_t v17 = xo_printf(v5, ">%s", v30, v22, v23, v24, v25, v26, (char)v6) + v27;
      break;
    default:
      uint64_t v17 = 0LL;
      break;
  }

  xo_depth_change((_BYTE *)v5, __s, 1, 1, 5u, (v14 >> 7) & 8);
  return v17;
}

uint64_t xo_do_close_instance(uint64_t a1, char *__s)
{
  uint64_t v3 = a1;
  v24[1] = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited()) {
      xo_default_init();
    }
    uint64_t v3 = xo_default_handle();
  }

  if (!__s)
  {
    uint64_t v4 = *(void *)(v3 + 168);
    int v5 = *(_DWORD *)(v3 + 176);
    uint64_t v6 = v4 + 24LL * v5;
    uint64_t v7 = *(const void **)(v6 + 8);
    if (v7)
    {
      strlen(*(const char **)(v6 + 8));
      __s = (char *)v24 - ((MEMORY[0x1895F8858]() + 16) & 0xFFFFFFFFFFFFFFF0LL);
      memcpy(__s, v7, v8);
    }

    else if ((*(_BYTE *)(v4 + 24LL * v5) & 8) != 0)
    {
      __s = 0LL;
    }

    else
    {
      xo_failure((_BYTE *)v3, "missing name without 'dtrt' mode");
      __s = "failure";
    }
  }

  strlen(__s);
  xo_xml_leader_len((_BYTE *)v3, __s);
  uint64_t result = 0LL;
  switch(*(_WORD *)(v3 + 16))
  {
    case 0:
    case 3:
      xo_depth_change((_BYTE *)v3, __s, -1, 0, 6u, 0);
      uint64_t result = 0LL;
      break;
    case 1:
      xo_depth_change((_BYTE *)v3, __s, -1, -1, 6u, 0);
      LOBYTE(v16) = 0;
      if ((*(_BYTE *)v3 & 2) != 0) {
      uint64_t result = xo_printf(v3, "%*s</%s%s>%s", v10, v11, v12, v13, v14, v15, v16);
      }
      break;
    case 2:
      if ((*(void *)v3 & 2LL) != 0) {
        uint64_t v17 = "\n";
      }
      else {
        uint64_t v17 = (const char *)&xo_version_extra;
      }
      xo_depth_change((_BYTE *)v3, __s, -1, -1, 6u, 0);
      uint64_t result = xo_printf(v3, "%s%*s}", v18, v19, v20, v21, v22, v23, (char)v17);
      *(_DWORD *)(*(void *)(v3 + 168) + 24LL * *(int *)(v3 + 176)) |= 1u;
      break;
    case 5:
      xo_depth_change((_BYTE *)v3, __s, -1, 0, 6u, 0);
      uint64_t result = xo_encoder_handle(v3, 9LL, (uint64_t)__s, 0LL, 0LL);
      break;
    default:
      return result;
  }

  return result;
}

uint64_t xo_do_close_list(uint64_t a1, char *__s1)
{
  uint64_t v2 = __s1;
  v19[1] = *MEMORY[0x1895F89C0];
  if (!__s1)
  {
    uint64_t v4 = *(void *)(a1 + 168);
    int v5 = *(_DWORD *)(a1 + 176);
    uint64_t v6 = v4 + 24LL * v5;
    uint64_t v7 = *(const void **)(v6 + 8);
    if (v7)
    {
      strlen(*(const char **)(v6 + 8));
      uint64_t v2 = (char *)v19 - ((MEMORY[0x1895F8858]() + 16) & 0xFFFFFFFFFFFFFFF0LL);
      memcpy(v2, v7, v8);
    }

    else if ((*(_BYTE *)(v4 + 24LL * v5) & 8) != 0)
    {
      uint64_t v2 = 0LL;
    }

    else
    {
      xo_failure((_BYTE *)a1, "missing name without 'dtrt' mode");
      uint64_t v2 = "failure";
    }
  }

  int v9 = *(unsigned __int16 *)(a1 + 16);
  if (v9 == 5)
  {
    xo_depth_change((_BYTE *)a1, v2, -1, 0, 4u, 2);
    return xo_encoder_handle(a1, 5LL, (uint64_t)v2, 0LL, 0LL);
  }

  else
  {
    if (v9 == 2)
    {
      uint64_t v10 = (_DWORD *)(*(void *)(a1 + 168) + 24LL * *(int *)(a1 + 176));
      uint64_t v11 = (const char *)&xo_version_extra;
      if ((*v10 & 1) != 0)
      {
        if ((*(_BYTE *)a1 & 2) != 0) {
          uint64_t v11 = "\n";
        }
        else {
          uint64_t v11 = (const char *)&xo_version_extra;
        }
      }

      *v10 |= 1u;
      xo_depth_change((_BYTE *)a1, v2, -1, -1, 4u, 2);
      xo_indent(a1);
      uint64_t result = xo_printf(a1, "%s%*s]", v12, v13, v14, v15, v16, v17, (char)v11);
    }

    else
    {
      xo_depth_change((_BYTE *)a1, v2, -1, 0, 4u, 2);
      uint64_t result = 0LL;
    }

    *(_DWORD *)(*(void *)(a1 + 168) + 24LL * *(int *)(a1 + 176)) |= 1u;
  }

  return result;
}

_DWORD *xo_default_init()
{
  uint64_t v0 = (_BYTE *)xo_default_handle();
  xo_init_handle((uint64_t)v0);
  if ((v0[1] & 1) == 0)
  {
    uint64_t v1 = getenv("LIBXO_OPTIONS");
    if (v1) {
      xo_set_options_simple(v0, v1);
    }
  }

  uint64_t result = (_DWORD *)xo_default_inited();
  _DWORD *result = 1;
  return result;
}

uint64_t xo_set_options_simple(_BYTE *a1, char *__s)
{
  v13[1] = *MEMORY[0x1895F89C0];
  size_t v4 = strlen(__s) + 1;
  int v5 = (char *)v13 - ((MEMORY[0x1895F8858]() + 16) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t result = (uint64_t)memcpy(v5, __s, v4);
  unint64_t v7 = (unint64_t)&v5[v4 - 1];
  if ((unint64_t)v5 < v7)
  {
    do
    {
      size_t v8 = strchr(v5, 44);
      int v9 = v8;
      if (v8)
      {
        *size_t v8 = 0;
        int v9 = v8 + 1;
      }

      uint64_t v10 = strchr(v5, 61);
      uint64_t v11 = v10;
      if (v10)
      {
        *uint64_t v10 = 0;
        uint64_t v11 = v10 + 1;
      }

      if (!strcmp("colors", v5))
      {
        uint64_t result = xo_set_color_map((uint64_t)a1, v11);
        if (!v9) {
          return result;
        }
      }

      else
      {
        uint64_t result = (uint64_t)xo_name_lookup(xo_xof_simple_names, v5, 0xFFFFFFFFFFFFFFFFLL);
        if (result)
        {
          unint64_t v12 = *(void *)a1 | result;
        }

        else
        {
          uint64_t result = strcmp(v5, "no-color");
          if ((_DWORD)result) {
            return (uint64_t)xo_failure(a1, "unknown simple option: %s");
          }
          unint64_t v12 = *(void *)a1 & 0xFFFFFFFFFDFFFFFFLL;
        }

        *(void *)a1 = v12;
        if (!v9) {
          return result;
        }
      }

      int v5 = v9;
    }

    while ((unint64_t)v9 < v7);
  }

  return result;
}

const char *xo_name_lookup(void *a1, char *__s2, size_t a3)
{
  if (!a3) {
    return 0LL;
  }
  size_t v3 = a3;
  if ((a3 & 0x8000000000000000LL) != 0) {
    size_t v3 = strlen(__s2);
  }
  size_t v6 = ~v3;
  uint64_t v7 = MEMORY[0x1895F8770];
  for (int64_t i = __s2; ; ++i)
  {
    unsigned int v9 = *i;
    if ((v9 & 0x80000000) != 0) {
      break;
    }
    if ((*(_DWORD *)(v7 + 4LL * v9 + 60) & 0x4000) == 0) {
      goto LABEL_10;
    }
LABEL_9:
    ++v6;
  }

  if (__maskrune(v9, 0x4000uLL)) {
    goto LABEL_9;
  }
LABEL_10:
  uint64_t v10 = 0LL;
  uint64_t v11 = &__s2[v3];
  do
  {
    unsigned int v12 = v11[v10];
    if ((v12 & 0x80000000) != 0) {
      int v13 = __maskrune(v12, 0x4000uLL);
    }
    else {
      int v13 = *(_DWORD *)(v7 + 4LL * v12 + 60) & 0x4000;
    }
    --v10;
  }

  while (v13);
  if (!*i) {
    return 0LL;
  }
  uint64_t result = (const char *)a1[1];
  if (result)
  {
    while (strncmp(result, i, v10 - v6))
    {
      uint64_t result = (const char *)a1[3];
      a1 += 2;
      if (!result) {
        return result;
      }
    }

    return (const char *)*a1;
  }

  return result;
}

uint64_t xo_buf_escape(uint64_t a1, uint64_t *a2, void *__src, uint64_t __n, unsigned int a5)
{
  uint64_t v6 = __n;
  uint64_t v10 = (void *)a2[1];
  if ((unint64_t)v10 + __n >= *a2 + a2[2])
  {
    size_t v11 = ((unint64_t)v10 + __n - *a2 + 0x1FFF) & 0xFFFFFFFFFFFFE000LL;
    uint64_t result = xo_realloc(*a2, v11);
    if (!result) {
      return result;
    }
    uint64_t v13 = result;
    uint64_t v10 = (void *)(result + a2[1] - *a2);
    *a2 = v13;
    a2[1] = (uint64_t)v10;
    a2[2] = v11;
  }

  uint64_t result = (uint64_t)memcpy(v10, __src, v6);
  switch(*(_WORD *)(a1 + 16))
  {
    case 1:
    case 3:
      uint64_t result = xo_escape_xml(a2, v6, a5);
      goto LABEL_8;
    case 2:
      uint64_t result = xo_escape_json(a2, v6);
      goto LABEL_8;
    case 4:
      uint64_t result = xo_escape_sdparams(a2, v6);
LABEL_8:
      uint64_t v6 = result;
      break;
    default:
      break;
  }

  a2[1] += v6;
  return result;
}

uint64_t xo_do_format_field(uint64_t a1, uint64_t *a2, unsigned __int8 *a3, uint64_t a4, int a5)
{
  int v5 = a5;
  if ((a5 & 0x100) != 0) {
    int v6 = 1;
  }
  else {
    int v6 = *(unsigned __int16 *)(a1 + 16);
  }
  int v110 = v6;
  uint64_t v7 = *(void *)a1;
  int v8 = 2;
  if ((*(void *)a1 & 0x20000000) == 0)
  {
    if (*(_WORD *)(a1 + 16)) {
      int v8 = 2;
    }
    else {
      int v8 = 3;
    }
  }

  uint64_t v9 = *(void *)(a1 + 376);
  if ((a5 & 0x80000) != 0) {
    int v10 = 2;
  }
  else {
    int v10 = v8;
  }
  int v105 = v10;
  size_t v11 = (uint64_t *)(a1 + 72);
  if (a2) {
    size_t v11 = a2;
  }
  uint64_t v111 = v11;
  uint64_t v12 = v11[1];
  uint64_t v100 = *v11;
  if (a4 < 1) {
    goto LABEL_239;
  }
  uint64_t v97 = v11[1];
  int v98 = v8;
  uint64_t v99 = *(void *)(a1 + 376);
  uint64_t v13 = 0LL;
  uint64_t v14 = a3;
  unint64_t v15 = (unint64_t)&a3[a4];
  __int16 v104 = v5 | 0x4000;
  char v118 = (__int32 ***)(a1 + 200);
  unsigned int v96 = v5 & 0x200;
  uint64_t v101 = (uint64_t)&a3[a4 - 2];
  uint64_t v103 = (uint64_t)&a3[a4 - 1];
  unsigned int v107 = v5;
  int v112 = &a3[a4];
  while (1)
  {
    int v16 = *v14;
    if (v16 != 37)
    {
      if (!v13) {
        uint64_t v13 = (char *)v14;
      }
      if (v16 == 92)
      {
        if (v14[1]) {
          uint64_t v17 = v14 + 1;
        }
        else {
          uint64_t v17 = v14;
        }
      }

      else
      {
        uint64_t v17 = v14;
      }

      goto LABEL_228;
    }

    uint64_t v17 = v14 + 1;
    if ((unint64_t)(v14 + 1) < v15 && *v17 == 37)
    {
      if (!v13) {
        uint64_t v13 = (char *)(v14 + 1);
      }
      goto LABEL_228;
    }

    if ((v5 & 0x800) == 0 && v13)
    {
      int v18 = xo_format_string_direct(a1, v111, v104, 0LL, v13, v14 - (unsigned __int8 *)v13, 0xFFFFFFFF, v105, 2);
      uint64_t v7 = *(void *)a1;
      if ((*(void *)a1 & 0x200000) != 0) {
        *(void *)(a1 + 376) += v18;
      }
      if ((*(_BYTE *)(a1 + 8) & 8) != 0) {
        *(void *)(a1 + 352) += v18;
      }
    }

    __int128 v119 = 0u;
    unsigned int v120 = 0;
    v123[0] = 0LL;
    HIDWORD(v119) = -1;
    int v122 = -1;
    uint64_t v121 = -1LL;
    if (*v17 == 64)
    {
      uint64_t v19 = v14 + 2;
      if ((unint64_t)(v14 + 2) < v15)
      {
        uint64_t v20 = v101 - (void)v14;
        do
        {
          int v21 = *v19;
          if (v21 == 42)
          {
            if ((v7 & 0x200) == 0) {
              ++*v118;
            }
          }

          else if (v21 == 64)
          {
            goto LABEL_43;
          }

          ++v19;
          --v20;
        }

        while (v20);
        uint64_t v19 = (unsigned __int8 *)v15;
      }

LABEL_43:
      if ((v7 & 8) == 0)
      {
LABEL_44:
        int v22 = 0;
        if ((v7 & 0x40) == 0 || !v110) {
          goto LABEL_52;
        }
        if (*(_WORD *)(a1 + 16) == 3) {
          goto LABEL_51;
        }
        goto LABEL_119;
      }
    }

    else
    {
      uint64_t v19 = v14;
      if ((v7 & 8) == 0) {
        goto LABEL_44;
      }
    }

    if (v110 == 1 || (unsigned int v60 = *(unsigned __int16 *)(a1 + 16) - 1, v60 < 5) && ((0x1Bu >> v60) & 1) != 0)
    {
LABEL_51:
      int v22 = 0;
LABEL_52:
      if ((v5 & 0x800) == 0) {
        goto LABEL_54;
      }
LABEL_53:
      int v22 = 1;
      BYTE2(v119) = 1;
      goto LABEL_54;
    }

LABEL_152:
          unsigned int v72 = *(unsigned __int16 *)(a1 + 16) - 1;
          if (v72 > 4) {
            goto LABEL_174;
          }
          size_t v71 = qword_188FD3E18[(__int16)v72];
          size_t v67 = (&off_18A331230)[(__int16)v72];
LABEL_175:
          v68 = 0LL;
          if (v62 == v63 && (v121 & 0x80000000) != 0 && (v49 & 0x80000000) != 0 && (v70 & 0x80000000) != 0)
          {
            if ((*(_BYTE *)(a1 + 8) & 8) == 0 && (*(_BYTE *)(a1 + 2) & 0x20) == 0)
            {
              size_t v74 = strlen(v67);
              uint64_t v75 = v67;
              int v5 = v107;
              xo_buf_escape(a1, v111, v75, v74, v107);
              uint64_t v76 = v65 + *v111;
              uint64_t v59 = v111[1] - v76;
              v111[1] = v76;
              goto LABEL_192;
            }

            v68 = 0LL;
          }

          uint64_t v49 = v71;
        }

        else
        {
          size_t v69 = (*v118)++;
          v68 = *v69;
          if (v61 != 1)
          {
LABEL_144:
            unsigned int v70 = v102;
            if (v68) {
              size_t v71 = v49;
            }
            else {
              size_t v71 = 6LL;
            }
            if (v68) {
              size_t v67 = (char *)v68;
            }
            else {
              size_t v67 = xo_format_string_null;
            }
            if (!v68 && (v107 & 0x20) != 0) {
              goto LABEL_152;
            }
            goto LABEL_175;
          }

          unsigned int v70 = v102;
          if (v68)
          {
            size_t v67 = 0LL;
          }

          else
          {
            uint64_t v49 = 6LL;
            size_t v67 = xo_format_string_null;
          }
        }

        int v77 = xo_format_string_direct(a1, v111, v107, v68, v67, v49, v70, v62, v63);
        uint64_t v78 = v111;
        if (v77 < 0) {
          goto LABEL_191;
        }
        uint64_t v79 = v77;
        uint64_t v80 = *v111;
        uint64_t v81 = (char *)(v65 + *v111);
        uint64_t v59 = v111[1] - (void)v81;
        v111[1] = (uint64_t)v81;
        int v82 = v121;
        unint64_t v83 = (unint64_t)&v81[(int)v121 - v80 + 0x1FFF] & 0xFFFFFFFFFFFFE000LL;
        uint64_t v84 = xo_realloc(v80, v83);
        uint64_t v78 = v111;
        if (!v84)
        {
LABEL_191:
          uint64_t v59 = 0LL;
          v78[1] = *v78 + v65;
          int v5 = v107;
LABEL_192:
          LOBYTE(v24) = v106;
        }

        else
        {
          uint64_t v81 = (char *)(v84 + v111[1] - *v111);
          *uint64_t v111 = v84;
          v111[1] = (uint64_t)v81;
          v111[2] = v83;
LABEL_189:
          int v85 = v82 - v79;
          if (v109)
          {
            v81 += v59;
            size_t v86 = v85;
          }

          else
          {
            size_t v86 = v85;
            memmove(&v81[v85], v81, v59);
          }

          else {
            int v87 = 48;
          }
          memset(v81, v87, v86);
          v59 += v86;
          v79 += v86;
LABEL_198:
          LOBYTE(v24) = v106;
          if ((*(_BYTE *)(a1 + 2) & 0x20) != 0) {
            *(void *)(a1 + 376) += v79;
          }
          if ((*(_BYTE *)(a1 + 8) & 8) != 0) {
            *(void *)(a1 + 352) += v79;
          }
          int v5 = v107;
        }
      }

      int v22 = 0;
      if ((v5 & 0x1000) != 0)
      {
        unsigned int v88 = *(unsigned __int16 *)(a1 + 16);
        if (v88 <= 5 && ((1 << v88) & 0x36) != 0)
        {
          uint64_t v59 = xo_trim_ws((uint64_t)v111, v59);
          LOBYTE(v24) = v106;
        }
      }

LABEL_207:
      if (v59 >= 1) {
        v111[1] += v59;
      }
    }

LABEL_209:
    uint64_t v7 = *(void *)a1;
    if ((*(void *)a1 & 0x200) != 0)
    {
      uint64_t v13 = 0LL;
      unint64_t v15 = (unint64_t)v112;
    }

    else
    {
      unint64_t v15 = (unint64_t)v112;
      if ((v43 & 0xFFFFFFDF) == 0x53)
      {
        if (!v22) {
          goto LABEL_215;
        }
      }

      else
      {
        if (v43 == 109) {
          goto LABEL_215;
        }
        char v89 = v24;
        for (uint64_t i = 0LL; i != 3; ++i)
        {
          if (*((_BYTE *)v123 + i + 4)) {
            ++*v118;
          }
        }

        if (memchr("diouxXDOU", v43, 0xAuLL))
        {
        }

        else
        {
          if (memchr("eEfFgGaA", v43, 9uLL) || v43 == 67 || v43 == 99 && v89)
          {
LABEL_227:
            uint64_t v13 = 0LL;
            ++*v118;
            goto LABEL_228;
          }

          if (v43 != 99 && v43 != 112)
          {
LABEL_215:
            uint64_t v13 = 0LL;
            goto LABEL_228;
          }
        }
      }

      uint64_t v13 = 0LL;
      ++*v118;
    }

LABEL_228:
    uint64_t v14 = v17 + 1;
    if ((unint64_t)(v17 + 1) >= v15)
    {
      uint64_t v9 = v99;
      int v8 = v98;
      uint64_t v12 = v97;
      if ((v5 & 0x800) == 0 && v13)
      {
        int v91 = xo_format_string_direct(a1, v111, v104, 0LL, v13, v14 - (unsigned __int8 *)v13, 0xFFFFFFFF, v105, 2);
        if ((*(_BYTE *)(a1 + 2) & 0x20) != 0) {
          *(void *)(a1 + 376) += v91;
        }
        if ((*(_BYTE *)(a1 + 8) & 8) != 0) {
          *(void *)(a1 + 352) += v91;
        }
      }

      if ((*(void *)&v5 & 0x180000LL) == 0) {
        return 0LL;
      }
LABEL_239:
      uint64_t v92 = xo_format_gettext(a1, v5, v12 - v100, v9, v8);
      uint64_t v93 = v92;
      if ((*(_BYTE *)(a1 + 2) & 0x20) != 0) {
        *(void *)(a1 + 376) += v92 - v9;
      }
      if ((*(_BYTE *)(a1 + 8) & 8) == 0) {
        return 0LL;
      }
      uint64_t result = 0LL;
      *(void *)(a1 + 352) += v93 - v9;
      return result;
    }
  }

  int v114 = v22;
  int v23 = 0;
  uint64_t v24 = 0LL;
  uint64_t v25 = 0LL;
  int v26 = 0;
  int v27 = 0;
  uint64_t v28 = 0LL;
  int v116 = 0;
  unsigned int v29 = 0;
  uint64_t v30 = v103 - (void)v19;
  uint64_t v31 = 0xFFFFFFFFLL;
  while (1)
  {
    unsigned int v32 = *v17;
    if (v32 <= 0x67) {
      break;
    }
    switch(*v17)
    {
      case 'h':
        uint64_t v25 = (v25 + 1);
        BYTE4(v119) = v25;
        break;
      case 'i':
      case 'k':
      case 'm':
      case 'n':
      case 'o':
      case 'p':
        goto LABEL_66;
      case 'j':
        BYTE5(v119) = ++v26;
        break;
      case 'l':
        uint64_t v24 = (v24 + 1);
        BYTE3(v119) = v24;
        break;
      case 'q':
        BYTE8(v119) = ++v116;
        break;
      default:
        if (v32 == 116)
        {
          BYTE6(v119) = ++v27;
        }

        else
        {
          if (v32 != 122) {
            goto LABEL_66;
          }
          uint64_t v28 = (v28 + 1);
          BYTE7(v119) = v28;
        }

        break;
    }

LABEL_83:
    ++v17;
    if (!--v30)
    {
      unint64_t v15 = (unint64_t)v112;
      uint64_t v17 = v112;
      int v5 = v107;
      int v22 = v114;
      goto LABEL_86;
    }
  }

  if (v32 == 45)
  {
    int v23 = 1;
    BYTE9(v119) = 1;
    goto LABEL_83;
  }

  if (v32 == 46)
  {
    unsigned int v120 = ++v29;
    if (v29 >= 3)
    {
      unint64_t v95 = "Too many dots in format: '%s'";
      goto LABEL_246;
    }

    goto LABEL_83;
  }

void *xo_line_ensure_open(void *result)
{
  uint64_t v1 = result;
  if ((*result & 0x200000000LL) != 0)
  {
    uint64_t v3 = result[1] | 2LL;
    *result &= ~0x200000000uLL;
    result[1] = v3;
  }

  else
  {
    uint64_t v2 = result[1];
    if ((v2 & 2) == 0 && *((_WORD *)result + 8) == 3)
    {
      result[1] = v2 | 2;
      uint64_t result = xo_data_append(result, xo_line_ensure_open_div_open, 0x12uLL);
      if ((*(_BYTE *)v1 & 2) != 0) {
        return xo_data_append(v1, "\n", 1uLL);
      }
    }
  }

  return result;
}

void *xo_info_find(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v9[1] = *MEMORY[0x1895F89C0];
  MEMORY[0x1895F8858]();
  int v6 = (char *)v9 - ((v5 + 16) & 0xFFFFFFFFFFFFFFF0LL);
  memcpy(v6, v7, v5);
  v6[a3] = 0;
  return bsearch( v6,  *(const void **)(a1 + 184),  *(int *)(a1 + 192),  0x18uLL,  (int (__cdecl *)(const void *, const void *))xo_info_compare);
}

unint64_t xo_format_humanize( unint64_t result, unint64_t *a2, void *a3, unsigned int a4)
{
  if ((*(_BYTE *)(result + 3) & 8) != 0) {
    return result;
  }
  unint64_t v6 = result;
  uint64_t result = *a2;
  uint64_t v7 = (_BYTE *)a2[1];
  if (&v7[-*a2] == (_BYTE *)*a3) {
    return result;
  }
  if ((unint64_t)(v7 + 1) >= result + a2[2])
  {
    unint64_t v9 = (unint64_t)&v7[-result + 0x2000] & 0xFFFFFFFFFFFFE000LL;
    uint64_t v10 = xo_realloc(result, v9);
    if (!v10) {
      goto LABEL_7;
    }
    uint64_t v7 = (_BYTE *)(v10 + a2[1] - *a2);
    *a2 = v10;
    a2[1] = (unint64_t)v7;
    a2[2] = v9;
  }

  *uint64_t v7 = 0;
  ++a2[1];
LABEL_7:
  int64_t v11 = strtoull((const char *)(*a2 + *a3), &__endptr, 0);
  if (v11 == -1)
  {
    uint64_t result = (unint64_t)__error();
    if (*(_DWORD *)result == 34) {
      return result;
    }
  }

  uint64_t result = *a2;
  uint64_t v12 = (_BYTE *)*a3;
  unint64_t v13 = a2[2];
  unint64_t v14 = a2[1] + 10;
  if (v14 >= result + v13)
  {
    unint64_t v13 = (v14 - result + 0x1FFF) & 0xFFFFFFFFFFFFE000LL;
    uint64_t result = xo_realloc(result, v13);
    if (!result) {
      return result;
    }
    *a2 = result;
    a2[2] = v13;
    uint64_t v12 = (_BYTE *)*a3;
  }

  unint64_t v15 = &v12[result];
  a2[1] = (unint64_t)&v12[result];
  if (!v11)
  {
    if (result)
    {
      unsigned int v16 = 0;
      int64_t v19 = 0LL;
      uint64_t v20 = 0LL;
      goto LABEL_24;
    }

LABEL_69:
    xo_format_humanize_cold_1();
  }

  unsigned int v16 = -1;
  if (((a4 >> 15) & 8) != 0)
  {
    unint64_t v21 = v11;
    do
    {
      ++v16;
      BOOL v22 = v21 >= 0x3E8;
      v21 /= 0x3E8uLL;
    }

    while (v22);
  }

  else
  {
    unint64_t v17 = v11;
    do
    {
      ++v16;
      BOOL v18 = v17 > 0x3FF;
      v17 >>= 10;
    }

    while (v18);
  }

  if (!result) {
    goto LABEL_69;
  }
  int64_t v19 = v11;
  uint64_t v20 = v11 >> 63;
LABEL_24:
  if (v16 < 7 || (v16 & 0x30) != 0)
  {
    unint64_t v23 = v13 - (void)v12;
    if ((_BYTE *)v13 != v12) {
      char *v15 = 0;
    }
    if (v11 < 0) {
      uint64_t v24 = -100LL;
    }
    else {
      uint64_t v24 = 100LL;
    }
    uint64_t v25 = 2LL;
    uint64_t result = (unint64_t)&xo_version_extra;
    if (v11 < 0) {
      uint64_t v25 = 3LL;
    }
    uint64_t v26 = ((a4 >> 15) & 2) >> 1;
    if (v23 > v25 + v26)
    {
      uint64_t result = v19 * v24;
      size_t v39 = v13 - (void)v12;
      if ((v16 & 0x30) != 0)
      {
        uint64_t v38 = v15;
        if ((int)v23 - ((int)v25 + (int)v26) < 1)
        {
          uint64_t v28 = 100LL;
        }

        else
        {
          unsigned int v27 = v13 - v26 - v25 - (_DWORD)v12 + 1;
          uint64_t v28 = 100LL;
          do
          {
            v28 *= 10LL;
            --v27;
          }

          while (v27 > 1);
        }

        uint64_t v36 = v25 + v26;
        if ((__int128)(__PAIR128__(v20, v19) * __PAIR128__(v11 >> 63, v24)) >= (unint64_t)v28)
        {
          unsigned int v32 = 0;
          do
          {
            uint64_t result = __divti3();
            unsigned int v31 = v32 + 1;
            BOOL v22 = v32++ >= 6;
          }

          while (!v22);
        }

        else
        {
          unsigned int v31 = 0;
        }

        if ((v16 & 0x10) != 0) {
          goto LABEL_66;
        }
      }

      else
      {
        if (!v16) {
          goto LABEL_64;
        }
        uint64_t v36 = v25 + v26;
        uint64_t v38 = v15;
        if (v16 - 1 >= 6) {
          int v29 = 6;
        }
        else {
          int v29 = v16 - 1;
        }
        int v30 = v29 + 1;
        do
        {
          uint64_t result = __divti3();
          --v30;
        }

        while (v30);
        unsigned int v31 = v29 + 1;
      }

      if ((a4 & 0x20000) != 0)
      {
        unint64_t v15 = v38;
        if (result <= 0x3E2 && v31)
        {
          if (v36 + 3 > v39) {
            return result;
          }
          uint64_t v37 = (((int)result + 5) / 100);
          if (v11 >= 0) {
            unsigned int v34 = (const char *)&xo_version_extra;
          }
          else {
            unsigned int v34 = "-";
          }
          localeconv();
          uint64_t result = snprintf(v38, v39, "%s%d%s%d%s%s%s", v34, v37);
          goto LABEL_65;
        }
      }

      else
      {
        unint64_t v15 = v38;
      }

uint64_t xo_escape_json(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = a2;
  if (a2 >= 1)
  {
    uint64_t v4 = 0LL;
    size_t v5 = (unsigned __int8 *)a1[1];
    unint64_t v6 = v5;
    do
    {
      unsigned int v7 = *v6;
      if (v7 > 0x21)
      {
        if (v7 == 92 || v7 == 34) {
          ++v4;
        }
      }

      else
      {
        BOOL v8 = v7 == 10 || v7 == 13;
        if (v8) {
          ++v4;
        }
      }

      ++v6;
    }

    while (v6 < &v5[a2]);
    if (v4)
    {
      uint64_t v9 = *a1;
      if ((unint64_t)&v5[v4] >= *a1 + a1[2])
      {
        unint64_t v10 = (unint64_t)&v5[v4 - v9 + 0x1FFF] & 0xFFFFFFFFFFFFE000LL;
        uint64_t v11 = xo_realloc();
        if (!v11) {
          return 0LL;
        }
        size_t v5 = (unsigned __int8 *)(v11 + a1[1] - *a1);
        *a1 = v11;
        a1[1] = (uint64_t)v5;
        a1[2] = v10;
      }

      uint64_t v12 = &v5[v2 + v4];
      unint64_t v13 = &v5[v2 - 1];
      while (1)
      {
        unsigned int v14 = *v13;
        if (v14 > 0x21)
        {
          if (v14 == 92 || v14 == 34)
          {
            *(v12 - 2) = 92;
            v12 -= 2;
            v12[1] = v14;
            goto LABEL_28;
          }
        }

        else
        {
          if (v14 == 10)
          {
            *((_WORD *)v12 - 1) = 28252;
            v12 -= 2;
            goto LABEL_28;
          }

          if (v14 == 13)
          {
            *((_WORD *)v12 - 1) = 29276;
            v12 -= 2;
            goto LABEL_28;
          }
        }

        *--uint64_t v12 = v14;
LABEL_28:
        if (v13 > v5)
        {
          BOOL v8 = v13-- == v12;
          if (!v8) {
            continue;
          }
        }

        v2 += v4;
        return v2;
      }
    }
  }

  return v2;
}

uint64_t xo_escape_sdparams(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = a2;
  if (a2 >= 1)
  {
    uint64_t v4 = 0LL;
    size_t v5 = (unsigned __int8 *)a1[1];
    unint64_t v6 = v5;
    do
    {
      unsigned int v7 = *v6 - 34;
      BOOL v8 = v7 > 0x3B;
      uint64_t v9 = (1LL << v7) & 0xC00000000000001LL;
      BOOL v10 = v8 || v9 == 0;
      if (!v10) {
        ++v4;
      }
      ++v6;
    }

    while (v6 < &v5[a2]);
    if (v4)
    {
      uint64_t v11 = *a1;
      if ((unint64_t)&v5[v4] >= *a1 + a1[2])
      {
        unint64_t v12 = (unint64_t)&v5[v4 - v11 + 0x1FFF] & 0xFFFFFFFFFFFFE000LL;
        uint64_t v13 = xo_realloc();
        if (!v13) {
          return 0LL;
        }
        size_t v5 = (unsigned __int8 *)(v13 + a1[1] - *a1);
        *a1 = v13;
        a1[1] = (uint64_t)v5;
        a1[2] = v12;
      }

      unsigned int v14 = &v5[v2 + v4];
      unint64_t v15 = &v5[v2 - 1];
      do
      {
        int v16 = *v15;
        if ((v16 - 34) > 0x3B || ((1LL << (v16 - 34)) & 0xC00000000000001LL) == 0)
        {
          *--unsigned int v14 = v16;
        }

        else
        {
          *(v14 - 2) = 92;
          v14 -= 2;
          v14[1] = v16;
        }

        if (v15 <= v5) {
          break;
        }
        BOOL v10 = v15-- == v14;
      }

      while (!v10);
      v2 += v4;
    }
  }

  return v2;
}

uint64_t xo_format_string_direct( uint64_t a1, uint64_t *a2, __int16 a3, __int32 *a4, char *a5, uint64_t a6, unsigned int a7, int a8, int a9)
{
  uint64_t v9 = a6;
  __int32 v79 = 0;
  if (a6 >= 1)
  {
    uint64_t v14 = *a2;
    unint64_t v15 = a2[1] + a6;
    if (v15 < *a2 + a2[2]) {
      goto LABEL_6;
    }
    unint64_t v16 = (v15 - v14 + 0x1FFF) & 0xFFFFFFFFFFFFE000LL;
    uint64_t v17 = xo_realloc(v14, v16);
    if (v17)
    {
      uint64_t v18 = v17 + a2[1] - *a2;
      *a2 = v17;
      a2[1] = v18;
      a2[2] = v16;
      goto LABEL_6;
    }

    return 0LL;
  }

  if (!a6) {
    return 0LL;
  }
LABEL_6:
  uint64_t v19 = 0LL;
  unsigned int v72 = (mbstate_t *)(a1 + 216);
  uint64_t v20 = a7;
LABEL_7:
  uint64_t v73 = v20 - (int)v19;
  while (2)
  {
    if (a5)
    {
      int v21 = *a5;
      if (!*a5) {
        return v19;
      }
      if ((a3 & 0x4000) != 0 && (v21 == 92 || v21 == 37))
      {
        if (!--v9) {
          return v19;
        }
        if (!*++a5) {
          return v19;
        }
      }
    }

    if (a4 && !*a4) {
      return v19;
    }
    switch(a9)
    {
      case 3:
        if (v9 <= 0) {
          size_t v25 = 6LL;
        }
        else {
          size_t v25 = v9;
        }
        int64_t v24 = mbrtowc(&v79, a5, v25, v72);
        if ((v24 & 0x8000000000000000LL) == 0)
        {
          if (!v24) {
            return v19;
          }
          goto LABEL_32;
        }

        xo_failure((_BYTE *)a1, "invalid mbs char: %02hhx");
        __int32 v79 = 63;
LABEL_31:
        int64_t v24 = 1LL;
LABEL_32:
        a5 += v24;
        break;
      case 2:
        char v26 = *a5;
        if (*a5 < 0)
        {
          if ((v26 & 0xE0) == 0xC0)
          {
            int64_t v24 = 2u;
          }

          else if ((v26 & 0xF0) == 0xE0)
          {
            int64_t v24 = 3u;
          }

          else
          {
            if ((v26 & 0xF8) != 0xF0)
            {
              unsigned int v70 = "invalid UTF-8 character: %02hhx";
LABEL_126:
              xo_failure((_BYTE *)a1, v70);
              return 0xFFFFFFFFLL;
            }

            int64_t v24 = 4u;
          }

          if (v9 >= 1 && v9 < v24) {
            return v19;
          }
          int v32 = (*((_BYTE *)&xo_utf8_data_bits + v24) & v26);
          uint64_t v33 = 1LL;
          do
          {
            char v34 = a5[v33];
            if ((v34 & 0xC0) != 0x80)
            {
              __int32 v79 = -1;
              goto LABEL_125;
            }

            int v35 = v34 & 0x3F | (v32 << 6);
            ++v33;
            int v32 = v35;
          }

          while (v24 != v33);
          __int32 v79 = v35;
          if (v35 == -1)
          {
LABEL_125:
            unsigned int v70 = "invalid UTF-8 character: %02hhx/%d";
            goto LABEL_126;
          }

          goto LABEL_32;
        }

        __int32 v79 = *a5;
        goto LABEL_31;
      case 1:
        __int32 v23 = *a4++;
        __int32 v79 = v23;
        int64_t v24 = 1LL;
        break;
      default:
        int64_t v24 = 0LL;
        break;
    }

    if (v9 > 0) {
      uint64_t v9 = (v9 - v24) & ~((v9 - v24) >> 63);
    }
    uint64_t v27 = v79;
    unsigned int v28 = xo_wcwidth(v79);
    if ((v28 & 0x80000000) != 0)
    {
      else {
        int v30 = *(_DWORD *)(MEMORY[0x1895F8770] + 4 * v27 + 60) & 0x200;
      }
      uint64_t v29 = v30 == 0;
    }

    else
    {
      uint64_t v29 = v28;
    }

    if (*(_WORD *)(a1 + 16))
    {
      if ((int)a7 >= 1 && *(_WORD *)(a1 + 16) == 3)
      {
LABEL_46:
        if (v29 > v73) {
          return v19;
        }
      }
    }

    else if ((int)a7 >= 1)
    {
      goto LABEL_46;
    }

    if (a8 != 2)
    {
      if (a8 == 3)
      {
        uint64_t v36 = (char *)a2[1];
        if ((unint64_t)(v36 + 7) >= *a2 + a2[2])
        {
          unint64_t v37 = (unint64_t)&v36[-*a2 + 8198] & 0xFFFFFFFFFFFFE000LL;
          uint64_t v38 = xo_realloc(*a2, v37);
          if (!v38) {
            return 0xFFFFFFFFLL;
          }
          uint64_t v39 = v38;
          uint64_t v36 = (char *)(v38 + a2[1] - *a2);
          *a2 = v39;
          a2[1] = (uint64_t)v36;
          a2[2] = v37;
          uint64_t v20 = a7;
        }

        int64_t v40 = wcrtomb(v36, v79, v72);
        if (v40 <= 0)
        {
          xo_failure((_BYTE *)a1, "could not convert wide char: %lx");
          unsigned int v60 = (_BYTE *)a2[1];
          a2[1] = (uint64_t)(v60 + 1);
          *unsigned int v60 = 63;
          LODWORD(v29) = 1;
        }

        else
        {
          a2[1] += v40;
        }
      }

      goto LABEL_121;
    }

    switch(*(_WORD *)(a1 + 16))
    {
      case 1:
      case 3:
        unsigned __int32 v31 = v79;
        switch(v79)
        {
          case '&':
            __int16 v61 = xo_xml_amp;
            break;
          case '<':
            __int16 v61 = xo_xml_lt;
            break;
          case '>':
            __int16 v61 = xo_xml_gt;
            break;
          default:
            if ((a3 & 0x200) == 0 || v79 != 34) {
              goto LABEL_62;
            }
            __int16 v61 = xo_xml_quot;
            break;
        }

        size_t v62 = strlen(v61);
        uint64_t v64 = *a2;
        int v63 = (void *)a2[1];
        unint64_t v65 = (unint64_t)v63 + v62 - 1;
        if (v65 >= *a2 + a2[2])
        {
          uint64_t v75 = v61;
          unint64_t v66 = (v65 - v64 + 0x1FFF) & 0xFFFFFFFFFFFFE000LL;
          uint64_t v67 = xo_realloc(v64, v66);
          if (!v67) {
            return 0xFFFFFFFFLL;
          }
          uint64_t v68 = v67;
          int v63 = (void *)(v67 + a2[1] - *a2);
          *a2 = v68;
          a2[1] = (uint64_t)v63;
          a2[2] = v66;
          __int16 v61 = v75;
        }

        memcpy(v63, v61, v62);
        a2[1] += v62;
        uint64_t v20 = a7;
        goto LABEL_121;
      case 2:
        unsigned __int32 v31 = v79;
        uint64_t v50 = *a2;
        int v51 = (_BYTE *)a2[1];
        unint64_t v52 = (unint64_t)&v51[-v50 + 8193] & 0xFFFFFFFFFFFFE000LL;
        uint64_t v53 = xo_realloc(v50, v52);
        if (!v53) {
          return 0xFFFFFFFFLL;
        }
        int v51 = (_BYTE *)(v53 + a2[1] - *a2);
        *a2 = v53;
        a2[2] = v52;
LABEL_103:
        a2[1] = (uint64_t)(v51 + 1);
        *int v51 = 92;
        char v54 = v79;
        uint64_t v20 = a7;
        if (v79 == 13)
        {
          int v55 = 114;
        }

        else if (v79 == 10)
        {
          int v55 = 110;
        }

        else
        {
LABEL_110:
          int v55 = v54 & 0x7F;
        }

        __int32 v79 = v55;
        size_t v69 = (_BYTE *)a2[1];
        a2[1] = (uint64_t)(v69 + 1);
        _BYTE *v69 = v55;
        goto LABEL_121;
      case 4:
        unsigned __int32 v31 = v79;
        uint64_t v56 = *a2;
        uint64_t v57 = (_BYTE *)a2[1];
        uint64_t v20 = a7;
        unint64_t v58 = (unint64_t)&v57[-v56 + 8193] & 0xFFFFFFFFFFFFE000LL;
        uint64_t v59 = xo_realloc(v56, v58);
        if (!v59) {
          return 0xFFFFFFFFLL;
        }
        uint64_t v57 = (_BYTE *)(v59 + a2[1] - *a2);
        *a2 = v59;
        a2[2] = v58;
LABEL_109:
        a2[1] = (uint64_t)(v57 + 1);
        *uint64_t v57 = 92;
        char v54 = v79;
        goto LABEL_110;
      default:
        unsigned __int32 v31 = v79;
LABEL_62:
        if (v31 < 0x80)
        {
          uint64_t v74 = a1;
          uint64_t v41 = 1u;
          goto LABEL_91;
        }

        if (v31 < 0x800)
        {
          uint64_t v74 = a1;
          uint64_t v41 = 2u;
          goto LABEL_91;
        }

        if (v31 < 0x10000)
        {
          uint64_t v74 = a1;
          uint64_t v41 = 3u;
          goto LABEL_91;
        }

        if (v31 >= 0x200000)
        {
          xo_failure((_BYTE *)a1, "ignoring bad length");
          uint64_t v20 = a7;
          if (!v9) {
            return v19;
          }
          continue;
        }

        uint64_t v74 = a1;
        uint64_t v41 = 4u;
LABEL_91:
        uint64_t v42 = *a2;
        int v43 = (_BYTE *)a2[1];
        int v44 = v31;
        if ((unint64_t)&v43[v41] < *a2 + a2[2])
        {
LABEL_94:
          if (v31 >= 0x80)
          {
            uint64_t v48 = v41 - 1;
            do
            {
              v43[v48] = v44 & 0x3F | 0x80;
              v44 >>= 6;
              unint64_t v49 = v48-- + 1;
            }

            while (v49 > 1);
            char v47 = *((_BYTE *)&xo_utf8_len_bits + v41) | *v43 & *((_BYTE *)&xo_utf8_data_bits + v41);
          }

          else
          {
            char v47 = v44 & 0x7F;
          }

          *int v43 = v47;
          a2[1] += v41;
          a1 = v74;
          uint64_t v20 = a7;
LABEL_121:
          uint64_t v19 = (v19 + v29);
          if (!v9) {
            return v19;
          }
          goto LABEL_7;
        }

        unint64_t v45 = (unint64_t)&v43[v41 - v42 + 0x1FFF] & 0xFFFFFFFFFFFFE000LL;
        uint64_t v46 = xo_realloc(v42, v45);
        if (v46)
        {
          int v43 = (_BYTE *)(v46 + a2[1] - *a2);
          *a2 = v46;
          a2[1] = (uint64_t)v43;
          a2[2] = v45;
          int v44 = v79;
          goto LABEL_94;
        }

        return 0xFFFFFFFFLL;
    }
  }

size_t xo_trim_ws(uint64_t a1, uint64_t a2)
{
  size_t v2 = a2;
  uint64_t v4 = *(char **)(a1 + 8);
  if (a2 >= 1)
  {
    size_t v5 = &v4[a2];
    unint64_t v6 = v4;
    do
    {
      if (*v6 != 32) {
        break;
      }
      ++v6;
    }

    while (v6 < v5);
    if (v6 != v4)
    {
      v2 += v4 - v6;
      memmove(v4, v6, v2);
      uint64_t v4 = *(char **)(a1 + 8);
    }
  }

  uint64_t v7 = 0LL;
  BOOL v8 = &v4[v2];
  do
  {
    uint64_t v9 = v7;
    unint64_t v10 = (unint64_t)&v8[v7];
    int v11 = *(unsigned __int8 *)(v10 - 1);
    uint64_t v7 = v9 - 1;
  }

  while (v11 == 32);
  if (v9)
  {
    v2 += v9;
    v8[v9] = 0;
  }

  return v2;
}

uint64_t xo_format_gettext(uint64_t a1, int a2, uint64_t a3, uint64_t a4, int a5)
{
  v32[1] = *MEMORY[0x1895F89C0];
  uint64_t v11 = *(void *)(a1 + 72);
  unint64_t v12 = *(_BYTE **)(a1 + 80);
  uint64_t v13 = (uint64_t *)(a1 + 72);
  if ((unint64_t)(v12 + 1) >= v11 + v13[2])
  {
    unint64_t v14 = (unint64_t)&v12[-v11 + 0x2000] & 0xFFFFFFFFFFFFE000LL;
    uint64_t v15 = xo_realloc(v11, v14);
    if (!v15) {
      return a4;
    }
    unint64_t v12 = (_BYTE *)(v15 + *(void *)(a1 + 80) - *(void *)(a1 + 72));
    *(void *)(a1 + 72) = v15;
    *(void *)(a1 + 80) = v12;
    *(void *)(a1 + 88) = v14;
  }

  *unint64_t v12 = 0;
  unint64_t v16 = *v13;
  uint64_t v17 = (char *)(*v13 + a3);
  if ((a2 & 0x100000) == 0)
  {
    uint64_t v18 = (const char *)(*v13 + a3);
    if (a5 == 2) {
      return a4;
    }
    goto LABEL_29;
  }

  uint64_t v19 = *(_BYTE **)(a1 + 80);
  uint64_t v20 = (char *)(a3 + v16 - 1);
  do
  {
    if ((unint64_t)v20 < v16)
    {
      int v22 = 0;
      goto LABEL_15;
    }

    int v21 = *v20--;
  }

  while ((v21 - 48) > 9);
  int v22 = 0;
  __int32 v23 = v20 + 1;
  int v24 = 1;
  do
  {
    unsigned int v25 = *v23 - 48;
    if (v25 > 9) {
      break;
    }
    v22 += v25 * v24;
    v24 *= 10;
    --v23;
  }

  while ((unint64_t)v23 >= v16);
LABEL_15:
  char v26 = memchr((const void *)(*v13 + a3), 44, v19 - v17);
  if (v26)
  {
    if (v26 == v17)
    {
      unsigned int v28 = "nothing before comma in plural gettext field: '%s'";
    }

    else
    {
      if (v26 != v19)
      {
        *char v26 = 0;
        if (v22 == 1) {
          uint64_t v18 = v17;
        }
        else {
          uint64_t v18 = v26 + 1;
        }
        if (v18 == v17)
        {
          *(void *)(a1 + 80) = v26;
          if (a5 == 2) {
            return xo_count_utf8_cols(v17, v26 - v17);
          }
          uint64_t v18 = v17;
        }

LABEL_29:
        size_t v29 = strlen(v18);
        int v30 = (char *)v32 - ((MEMORY[0x1895F8858]() + 16) & 0xFFFFFFFFFFFFFFF0LL);
        memcpy(v30, v18, v31);
        *(void *)(a1 + 80) = *(void *)(a1 + 72) + a3;
        return (int)xo_format_string_direct(a1, v13, a2, 0LL, v30, v29, 0, a5, 2);
      }

      unsigned int v28 = "nothing after comma in plural gettext field: '%s'";
    }
  }

  else
  {
    unsigned int v28 = "no comma in plural gettext field: '%s'";
  }

  xo_failure((_BYTE *)a1, v28);
  return a4;
}

uint64_t xo_wcwidth(signed int a1)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v1 = 0xFFFFFFFFLL;
  if (a1 >= 32 && (a1 - 127) >= 0x21)
  {
    if ((a1 - 918000) >= 0xFFF20110)
    {
      int v2 = 0;
      int v3 = 141;
      do
      {
        int v4 = v3 + v2;
        if (v3 + v2 < 0 != __OFADD__(v3, v2)) {
          ++v4;
        }
        int v5 = v4 >> 1;
        uint64_t v6 = (uint64_t)v4 >> 1;
        if (xo_wcwidth_combining[2 * v5 + 1] >= a1)
        {
          if (xo_wcwidth_combining[2 * v6] <= a1) {
            return 0LL;
          }
          int v3 = v6 - 1;
        }

        else
        {
          int v2 = v6 + 1;
        }
      }

      while (v3 >= v2);
    }

    if (a1 < 4352)
    {
      return 1LL;
    }

    else
    {
      uint64_t v1 = 2LL;
      if (a1 >> 5 >= 0x8B && (a1 - 9001) >= 2)
      {
        BOOL v8 = a1 != 12351 && (a1 - 11904) >> 4 < 0x765;
        uint64_t v1 = 2LL;
        if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vcgtq_u32( (uint32x4_t)xmmword_188FD3E50,  (uint32x4_t)vaddq_s32( vdupq_n_s32(a1),  (int32x4_t)xmmword_188FD3E40)))) & 1) == 0 && (a1 - 65280) >= 0x61 && (a1 - 65504) >= 7 && (a1 - 0x20000) >= 0xFFFE && !v8)
        {
          else {
            return 2LL;
          }
        }
      }
    }
  }

  return v1;
}

uint64_t xo_count_utf8_cols(char *a1, uint64_t a2)
{
  if (a2 < 1) {
    return 0LL;
  }
  int v2 = a1;
  uint64_t v3 = 0LL;
  unint64_t v4 = (unint64_t)&a1[a2];
  uint64_t v5 = MEMORY[0x1895F8770];
  while (1)
  {
    unsigned int v6 = *v2;
    if (*v2 < 0) {
      break;
    }
    uint64_t v7 = 1LL;
LABEL_15:
    if (v6 > 0x7F)
    {
      if (__maskrune(v6, 0x40000uLL))
      {
LABEL_19:
        unsigned int v11 = xo_wcwidth(v6);
        if ((v11 & 0x80000000) != 0)
        {
          if (v6 > 0x7F) {
            int v13 = __maskrune(v6, 0x200uLL);
          }
          else {
            int v13 = *(_DWORD *)(v5 + 4LL * v6 + 60) & 0x200;
          }
          uint64_t v12 = v13 == 0;
        }

        else
        {
          uint64_t v12 = v11;
        }

        v3 += v12;
      }
    }

    else if ((*(_DWORD *)(v5 + 4LL * v6 + 60) & 0x40000) != 0)
    {
      goto LABEL_19;
    }

    v2 += v7;
  }

  if ((v6 & 0xE0) == 0xC0)
  {
    uint64_t v7 = 2u;
LABEL_11:
    unsigned int v8 = *((_BYTE *)&xo_utf8_data_bits + v7) & v6;
    uint64_t v9 = 1LL;
    while (1)
    {
      unsigned __int8 v10 = v2[v9];
      if ((v10 & 0xC0) != 0x80) {
        break;
      }
      unsigned int v6 = v10 & 0x3F | (v8 << 6);
      ++v9;
      unsigned int v8 = v6;
      if (v7 == v9)
      {
        if (v6 == -1) {
          return v3;
        }
        goto LABEL_15;
      }
    }
  }

  else
  {
    if ((v6 & 0xF0) == 0xE0)
    {
      uint64_t v7 = 3u;
      goto LABEL_11;
    }

    if ((v6 & 0xF8) == 0xF0)
    {
      uint64_t v7 = 4u;
      goto LABEL_11;
    }
  }

  return v3;
}

uint64_t xo_data_append_content(uint64_t a1, char *a2, uint64_t a3, int a4)
{
  int v6 = 2;
  if ((*(_BYTE *)(a1 + 3) & 0x20) == 0)
  {
    if (*(_WORD *)(a1 + 16)) {
      int v6 = 2;
    }
    else {
      int v6 = 3;
    }
  }

  uint64_t v7 = *(void *)(a1 + 80);
  uint64_t v8 = *(void *)(a1 + 72);
  uint64_t result = xo_format_string_direct(a1, (uint64_t *)(a1 + 72), a4 | 0x4000u, 0LL, a2, a3, 0xFFFFFFFF, v6, 2);
  if ((*(void *)&a4 & 0x180000LL) != 0) {
    uint64_t result = xo_format_gettext(a1, a4, v7 - v8, (int)result, v6);
  }
  if ((*(_BYTE *)(a1 + 2) & 0x20) != 0) {
    *(void *)(a1 + 376) += (int)result;
  }
  if ((*(_BYTE *)(a1 + 8) & 8) != 0) {
    *(void *)(a1 + 352) += (int)result;
  }
  return result;
}

uint64_t xo_info_compare(const char *a1, const char **a2)
{
  return strcmp(a1, *a2);
}

_BYTE *xo_printable(uint64_t a1)
{
  if (!a1) {
    return &xo_version_extra;
  }
  uint64_t v1 = (int *)xo_printable_bufnum();
  if (*v1 == 7) {
    int v2 = 0;
  }
  else {
    int v2 = *v1 + 1;
  }
  *uint64_t v1 = v2;
  uint64_t v3 = xo_printable_bufset();
  uint64_t result = (_BYTE *)(v3 + ((uint64_t)v5 << 7));
  int v7 = *v4;
  uint64_t v8 = result;
  if (*v4)
  {
    uint64_t v9 = 0LL;
    unsigned __int8 v10 = v4 + 1;
    uint64_t v8 = result;
    do
    {
      switch(v7)
      {
        case 34:
          ++v9;
          *uint64_t v8 = 92;
          result[v9] = 34;
          break;
        case 13:
          ++v9;
          *uint64_t v8 = 92;
          result[v9] = 114;
          break;
        case 10:
          ++v9;
          *uint64_t v8 = 92;
          result[v9] = 110;
          break;
        default:
          *uint64_t v8 = v7;
          break;
      }

      uint64_t v8 = &result[v9 + 1];
      int v11 = *v10++;
      int v7 = v11;
      if (!v11) {
        break;
      }
    }

    while (v9++ < 126);
  }

  *uint64_t v8 = 0;
  return result;
}

unint64_t xo_format_text(unint64_t result, char *a2, uint64_t a3)
{
  uint64_t v3 = a2;
  unint64_t v4 = result;
  if (*(_WORD *)(result + 16) == 3) {
    return (unint64_t)xo_buf_append_div(result, "text", 0, 0LL, 0LL, a2, a3, 0LL, 0LL, 0LL, 0LL);
  }
  if (!*(_WORD *)(result + 16))
  {
    int v5 = (void *)(result + 72);
    int v6 = &a2[a3];
    int v7 = (void *)(result + 80);
    if (a3 >= 1)
    {
      int v8 = 0;
      int64_t v46 = *(void *)(result + 72) - *(void *)(result + 80);
      uint64_t v9 = a2;
      while (1)
      {
        int v10 = *v3;
        if (v10 < 0) {
          break;
        }
        uint64_t result = 1LL;
LABEL_49:
        v8 += result;
        if (++v3 >= v6)
        {
          uint64_t v39 = v8;
          uint64_t v3 = v9;
          goto LABEL_55;
        }
      }

      if (v9 == v3)
      {
        int v18 = *v3;
        int64_t v17 = v6 - v3;
        goto LABEL_16;
      }

      if (v9)
      {
        uint64_t v12 = *(void *)(v4 + 72);
        int v11 = *(char **)(v4 + 80);
        int v13 = &v11[v3 - v9];
        if ((unint64_t)v13 >= v12 + *(void *)(v4 + 88))
        {
          unint64_t v14 = (unint64_t)&v13[-v12 + 0x1FFF] & 0xFFFFFFFFFFFFE000LL;
          uint64_t v15 = xo_realloc(*(void *)(v4 + 72), v14);
          if (!v15) {
            goto LABEL_13;
          }
          uint64_t v16 = v15;
          int v11 = (char *)(v15 + *(void *)(v4 + 80) - *(void *)(v4 + 72));
          *(void *)(v4 + 72) = v16;
          *(void *)(v4 + 80) = v11;
          *(void *)(v4 + 88) = v14;
        }

        memcpy(v11, v9, v3 - v9);
        *v7 += v3 - v9;
      }

LABEL_13:
      int v10 = *v3;
      int64_t v17 = v6 - v3;
      int v18 = *v3;
      if ((v10 & 0x80000000) == 0)
      {
        int v19 = 0;
        int v20 = 0;
        size_t v21 = 1u;
        goto LABEL_22;
      }

LABEL_16:
      if ((v18 & 0xE0) == 0xC0)
      {
        int v20 = 0;
        int v19 = 1;
        size_t v21 = 2u;
      }

      else if ((v18 & 0xF0) == 0xE0)
      {
        int v19 = 1;
        int v20 = 1;
        size_t v21 = 3u;
      }

      else
      {
        if ((v18 & 0xF8) != 0xF0)
        {
          int64_t v40 = "invalid UTF-8 data: %02hhx";
          goto LABEL_53;
        }

        int v19 = 1;
        int v20 = 1;
        size_t v21 = 4u;
      }

LABEL_22:
      if ((uint64_t)v21 > v17)
      {
        int64_t v40 = "invalid UTF-8 data (short): %02hhx (%d/%d)";
        goto LABEL_53;
      }

      if (v20)
      {
        if (v21 <= 3) {
          uint64_t v22 = 3LL;
        }
        else {
          uint64_t v22 = v21;
        }
        uint64_t v23 = 2LL;
        while ((v3[v23] & 0xC0) == 0x80)
        {
          if (v22 == ++v23) {
            goto LABEL_30;
          }
        }

        int64_t v40 = "invalid UTF-8 data (byte %d): %x";
LABEL_53:
        uint64_t result = (unint64_t)xo_failure((_BYTE *)v4, v40);
        int64_t v41 = v46;
LABEL_65:
        *int v7 = *v5 + v41;
        return result;
      }

LABEL_30:
      if (v19)
      {
        int v24 = (v10 & *((_BYTE *)&xo_utf8_data_bits + v21));
        size_t v25 = v21 - 1;
        char v26 = v3 + 1;
        while (1)
        {
          char v28 = *v26++;
          char v27 = v28;
          if ((v28 & 0xC0) != 0x80) {
            break;
          }
          int v18 = v27 & 0x3F | (v24 << 6);
          int v24 = v18;
          if (!--v25)
          {
            if (v18 != -1) {
              goto LABEL_35;
            }
            break;
          }
        }

        int v35 = (_BYTE *)v4;
        uint64_t v36 = "invalid UTF-8 byte sequence";
        goto LABEL_42;
      }

LABEL_35:
      uint64_t v30 = *(void *)(v4 + 72);
      size_t v29 = *(void **)(v4 + 80);
      unint64_t v31 = v30 + *(void *)(v4 + 88);
      if ((*(_BYTE *)(v4 + 1) & 0x40) != 0)
      {
        if ((unint64_t)v29 + v21 >= v31)
        {
          unint64_t v37 = ((unint64_t)v29 + v21 - v30 + 0x1FFF) & 0xFFFFFFFFFFFFE000LL;
          uint64_t result = xo_realloc(*(void *)(v4 + 72), v37);
          if (!result) {
            goto LABEL_48;
          }
          unint64_t v38 = result;
          size_t v29 = (void *)(result + *(void *)(v4 + 80) - *(void *)(v4 + 72));
          *(void *)(v4 + 72) = v38;
          *(void *)(v4 + 80) = v29;
          *(void *)(v4 + 88) = v37;
        }

        memcpy(v29, v3, v21);
        int64_t v34 = v21;
      }

      else
      {
        if ((unint64_t)v29 + 7 >= v31)
        {
          unint64_t v32 = ((unint64_t)v29 - v30 + 8198) & 0xFFFFFFFFFFFFE000LL;
          uint64_t result = xo_realloc(*(void *)(v4 + 72), v32);
          if (!result)
          {
LABEL_48:
            uint64_t v9 = &v3[v21];
            uint64_t v3 = &v3[v21 - 1];
            goto LABEL_49;
          }

          unint64_t v33 = result;
          size_t v29 = (void *)(result + *(void *)(v4 + 80) - *(void *)(v4 + 72));
          *(void *)(v4 + 72) = v33;
          *(void *)(v4 + 80) = v29;
          *(void *)(v4 + 88) = v32;
        }

        *(_OWORD *)(v4 + 312) = 0u;
        *(_OWORD *)(v4 + 328) = 0u;
        *(_OWORD *)(v4 + 280) = 0u;
        *(_OWORD *)(v4 + 296) = 0u;
        *(_OWORD *)(v4 + 248) = 0u;
        *(_OWORD *)(v4 + 264) = 0u;
        *(_OWORD *)(v4 + 216) = 0u;
        *(_OWORD *)(v4 + 232) = 0u;
        int64_t v34 = wcrtomb((char *)v29, v18, (mbstate_t *)(v4 + 216));
        if (v34 <= 0)
        {
          int v35 = (_BYTE *)v4;
          uint64_t v36 = "could not convert wide char: %lx";
LABEL_42:
          xo_failure(v35, v36);
          uint64_t result = 0LL;
          goto LABEL_48;
        }
      }

      *v7 += v34;
      uint64_t result = xo_wcwidth(v18);
      goto LABEL_48;
    }

    uint64_t v39 = 0LL;
LABEL_55:
    if ((*(_BYTE *)(v4 + 2) & 0x20) != 0) {
      *(void *)(v4 + 376) += v39;
    }
    if ((*(_BYTE *)(v4 + 8) & 8) != 0) {
      *(void *)(v4 + 352) += v39;
    }
    int64_t v41 = v6 - v3;
    if (v6 != v3 && v3)
    {
      uint64_t v43 = *(void *)(v4 + 72);
      uint64_t v42 = *(void **)(v4 + 80);
      if ((unint64_t)v42 + v41 >= v43 + *(void *)(v4 + 88))
      {
        unint64_t v44 = ((unint64_t)v42 + v41 - v43 + 0x1FFF) & 0xFFFFFFFFFFFFE000LL;
        uint64_t result = xo_realloc(*(void *)(v4 + 72), v44);
        if (!result) {
          return result;
        }
        unint64_t v45 = result;
        uint64_t v42 = (void *)(result + *(void *)(v4 + 80) - *(void *)(v4 + 72));
        *(void *)(v4 + 72) = v45;
        *(void *)(v4 + 80) = v42;
        *(void *)(v4 + 88) = v44;
      }

      uint64_t result = (unint64_t)memcpy(v42, v3, v6 - v3);
      int v5 = (void *)(v4 + 80);
      goto LABEL_65;
    }
  }

  return result;
}

uint64_t xo_format_content( uint64_t result, char *a2, char *a3, char *a4, uint64_t a5, unsigned __int8 *a6, size_t a7, uint64_t a8)
{
  uint64_t v13 = result;
  switch(*(_WORD *)(result + 16))
  {
    case 0:
      if (!a5)
      {
        int v20 = a6;
        uint64_t v21 = a7;
        int v19 = a8;
        goto LABEL_11;
      }

      uint64_t result = xo_data_append_content(result, a4, a5, a8);
      break;
    case 1:
    case 2:
    case 4:
      if (!a3) {
        goto LABEL_4;
      }
      xo_transition(result, 0LL, a3, 1LL, a5, (uint64_t)a6, a7, a8);
      xo_format_value(v13, "message", 7uLL, a4, a5, a6, a7, 0LL, 0LL, a8);
      uint64_t result = xo_transition(v13, 0LL, a3, 2LL, v15, v16, v17, v18);
      break;
    case 3:
      uint64_t result = (uint64_t)xo_buf_append_div(result, a2, a8, 0LL, 0LL, a4, a5, a6, a7, 0LL, 0LL);
      break;
    case 5:
LABEL_4:
      if (!a5)
      {
        int v19 = a8 | 0x800;
        int v20 = a6;
        uint64_t v21 = a7;
LABEL_11:
        uint64_t result = xo_do_format_field(result, 0LL, v20, v21, v19);
      }

      break;
    default:
      return result;
  }

  return result;
}

_BYTE *xo_anchor_stop(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v17[1] = *MEMORY[0x1895F89C0];
  uint64_t v5 = *(void *)(a1 + 8);
  if ((v5 & 8) == 0) {
    return xo_failure((_BYTE *)a1, "no start anchor");
  }
  *(void *)(a1 + 8) = v5 & 0xFFFFFFFFFFFFFFEFLL;
  uint64_t result = (_BYTE *)xo_find_width(a1, a2, a3, a4);
  uint64_t v7 = (uint64_t)result;
  if (!result) {
    uint64_t v7 = *(void *)(a1 + 360);
  }
  if (v7)
  {
    unint64_t v8 = v7 >= 0 ? v7 : -v7;
    uint64_t v9 = v8 - *(void *)(a1 + 352);
    if (v9 >= 1)
    {
      if (v8 <= 0x2000)
      {
        uint64_t v10 = *(void *)(a1 + 344);
        uint64_t v12 = *(void *)(a1 + 72);
        uint64_t v11 = *(void *)(a1 + 80);
        MEMORY[0x1895F8858](result);
        uint64_t v13 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        memset(v13, 32, v9);
        uint64_t result = (_BYTE *)xo_format_content(a1, "padding", 0LL, v13, v9, 0LL, 0LL, 0LL);
        if ((v7 & 0x8000000000000000LL) == 0)
        {
          uint64_t v14 = v11 - v12;
          uint64_t v15 = *(void *)(a1 + 72);
          int64_t v16 = *(void *)(a1 + 80) - v15 - v14;
          if (v16 >= 1)
          {
            if (v16 > (unint64_t)v9)
            {
              MEMORY[0x1895F8858](result);
              uint64_t v13 = (char *)v17 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
            }

            memcpy(v13, (const void *)(v15 + v14), v16);
            memmove((void *)(v15 + v10 + v16), (const void *)(v15 + v10), v14 - v10);
            uint64_t result = memmove((void *)(*(void *)(a1 + 72) + v10), v13, v16);
          }
        }
      }

      else
      {
        uint64_t result = xo_failure((_BYTE *)a1, "width over %u are not supported");
      }
    }
  }

  *(void *)(a1 + 8) &= ~8uLL;
  *(void *)(a1 + 352) = 0LL;
  *(void *)(a1 + 360) = 0LL;
  *(void *)(a1 + 344) = 0LL;
  return result;
}

uint64_t xo_format_title(uint64_t result, uint64_t *a2, const void *a3, size_t a4)
{
  uint64_t v5 = result;
  v37[1] = *MEMORY[0x1895F89C0];
  uint64_t v6 = a2[9];
  uint64_t v7 = *a2;
  if (v6) {
    size_t v8 = a2[9];
  }
  else {
    size_t v8 = 2LL;
  }
  if (v6) {
    uint64_t v9 = (unsigned __int8 *)a2[4];
  }
  else {
    uint64_t v9 = "%s";
  }
  unsigned int v10 = *(unsigned __int16 *)(result + 16);
  if (v10 <= 5 && ((1 << v10) & 0x36) != 0)
  {
    if (!a4) {
      return xo_do_format_field(result, 0LL, v9, v8, v7 | 0x800);
    }
    return result;
  }

  uint64_t v13 = *(void *)(result + 80);
  v37[0] = *(void *)(result + 72);
  uint64_t v14 = *(void *)(result + 88);
  if (v10 != 3) {
    goto LABEL_27;
  }
  xo_line_ensure_open((void *)result);
  if ((*(_BYTE *)v5 & 2) != 0) {
    xo_buf_indent((void *)v5, *(unsigned __int16 *)(v5 + 20));
  }
  uint64_t v15 = *(void *)(v5 + 72);
  uint64_t v16 = *(void *)(v5 + 80);
  unint64_t v17 = (v16 + 17 - v15 + 0x1FFF) & 0xFFFFFFFFFFFFE000LL;
  uint64_t v18 = xo_realloc(v15, v17);
  if (v18)
  {
    uint64_t v16 = v18 + *(void *)(v5 + 80) - *(void *)(v5 + 72);
    *(void *)(v5 + 72) = v18;
    *(void *)(v5 + 80) = v16;
    *(void *)(v5 + 88) = v17;
LABEL_20:
    __int128 v19 = *(_OWORD *)xo_format_title_div_open;
    *(_BYTE *)(v16 + 16) = xo_format_title_div_open[16];
    *(_OWORD *)uint64_t v16 = v19;
    *(void *)(v5 + 80) += 17LL;
  }

  int v20 = *(_BYTE **)(v5 + 408);
  uint64_t v21 = *(_BYTE **)(v5 + 416);
  if (v21 != v20) {
    xo_data_append((void *)v5, v20, v21 - v20);
  }
  uint64_t result = *(void *)(v5 + 72);
  uint64_t v22 = *(_WORD **)(v5 + 80);
  if ((unint64_t)(v22 + 1) >= result + *(void *)(v5 + 88))
  {
    unint64_t v23 = ((unint64_t)v22 - result + 8193) & 0xFFFFFFFFFFFFE000LL;
    uint64_t result = xo_realloc(result, v23);
    if (!result) {
      goto LABEL_27;
    }
    uint64_t v22 = (_WORD *)(result + *(void *)(v5 + 80) - *(void *)(v5 + 72));
    *(void *)(v5 + 72) = result;
    *(void *)(v5 + 80) = v22;
    *(void *)(v5 + 88) = v23;
  }

  *uint64_t v22 = *(_WORD *)xo_format_title_div_middle;
  *(void *)(v5 + 80) += 2LL;
LABEL_27:
  if (!a4)
  {
    uint64_t v31 = *(void *)(v5 + 80) - *(void *)(v5 + 72);
    uint64_t result = xo_do_format_field(v5, 0LL, v9, v8, v7);
    uint64_t v32 = *(void *)(v5 + 72) + v31;
    uint64_t v33 = *(void *)(v5 + 80) - v32;
    *(void *)(v5 + 80) = v32;
LABEL_42:
    if (*(_WORD *)(v5 + 16) == 3)
    {
      uint64_t result = xo_escape_xml((uint64_t *)(v5 + 72), v33, 0);
      uint64_t v33 = result;
    }

    if (v33 >= 1) {
      *(void *)(v5 + 80) += v33;
    }
    goto LABEL_46;
  }

  MEMORY[0x1895F8858](result);
  int v24 = (char *)v37 - ((v8 + 16) & 0xFFFFFFFFFFFFFFF0LL);
  size_t v25 = memcpy(v24, v9, v8);
  v24[v8] = 0;
  MEMORY[0x1895F8858](v25);
  char v26 = (char *)v37 - ((a4 + 16) & 0xFFFFFFFFFFFFFFF0LL);
  memcpy(v26, a3, a4);
  v26[a4] = 0;
  if (v26[a4 - 1] != 115)
  {
    int64_t v34 = v37[0] - v13 + v14;
    uint64_t result = snprintf(*(char **)(v5 + 80), v34, v24, (char *)v37 - ((a4 + 16) & 0xFFFFFFFFFFFFFFF0LL));
    uint64_t v33 = (int)result;
    if (v34 <= (int)result)
    {
      uint64_t result = *(void *)(v5 + 72);
      int v35 = *(char **)(v5 + 80);
      unint64_t v36 = *(void *)(v5 + 88);
      if ((unint64_t)&v35[v33] >= result + v36)
      {
        unint64_t v36 = (unint64_t)&v35[v33 - result + 0x1FFF] & 0xFFFFFFFFFFFFE000LL;
        uint64_t result = xo_realloc(result, v36);
        if (!result) {
          return result;
        }
        int v35 = (char *)(result + *(void *)(v5 + 80) - *(void *)(v5 + 72));
        *(void *)(v5 + 72) = result;
        *(void *)(v5 + 80) = v35;
        *(void *)(v5 + 88) = v36;
      }

      uint64_t result = snprintf(v35, v36 - (void)v35 + result, v24, (char *)v37 - ((a4 + 16) & 0xFFFFFFFFFFFFFFF0LL));
      uint64_t v33 = (int)result;
    }

    if (v33 >= 1)
    {
      if ((*(_BYTE *)(v5 + 2) & 0x20) != 0) {
        *(void *)(v5 + 376) += v33;
      }
      if ((*(_BYTE *)(v5 + 8) & 8) != 0) {
        *(void *)(v5 + 352) += v33;
      }
    }

    goto LABEL_42;
  }

  uint64_t result = snprintf(0LL, 0LL, v24, (char *)v37 - ((a4 + 16) & 0xFFFFFFFFFFFFFFF0LL));
  if ((int)result >= 1)
  {
    MEMORY[0x1895F8858](result);
    char v28 = (char *)v37 - ((v27 + 16) & 0x1FFFFFFF0LL);
    int v30 = snprintf(v28, v29, v24, (char *)v37 - ((a4 + 16) & 0xFFFFFFFFFFFFFFF0LL));
    uint64_t result = xo_data_append_content(v5, v28, v30, v7);
  }

LABEL_46:
  if (*(_WORD *)(v5 + 16) == 3)
  {
    uint64_t result = (uint64_t)xo_data_append((void *)v5, xo_format_title_div_close, 6uLL);
    if ((*(_BYTE *)v5 & 2) != 0) {
      return (uint64_t)xo_data_append((void *)v5, "\n", 1uLL);
    }
  }

  return result;
}

uint64_t *xo_format_units(uint64_t *result, uint64_t *a2, char *a3, uint64_t a4)
{
  uint64_t v6 = result;
  v27[1] = *MEMORY[0x1895F89C0];
  uint64_t v7 = (unsigned __int8 *)a2[4];
  size_t v8 = a2[9];
  uint64_t v9 = *a2;
  if ((result[1] & 0x10) == 0) {
    return (uint64_t *)xo_format_content((uint64_t)result, "units", 0LL, a3, a4, v7, v8, v9);
  }
  unsigned int v10 = result + 9;
  uint64_t v11 = result[9];
  uint64_t v12 = (void *)result[10];
  int v13 = *((unsigned __int16 *)result + 8);
  if (v13 == 3)
  {
    v27[0] = result[46];
    unint64_t v17 = v12;
    if ((unint64_t)v12 + 13 >= v11 + result[11])
    {
      uint64_t v18 = xo_realloc(v11, ((unint64_t)v12 - v11 + 8204) & 0xFFFFFFFFFFFFE000LL);
      if (!v18) {
        goto LABEL_14;
      }
      unint64_t v17 = (void *)(v18 + v6[10] - v6[9]);
      v6[9] = v18;
      v6[10] = (uint64_t)v17;
      v6[11] = ((unint64_t)v12 - v11 + 8204) & 0xFFFFFFFFFFFFE000LL;
    }

    uint64_t v19 = *(void *)xo_format_units_units_start_html;
    *(void *)((char *)v17 + 5) = *(void *)&xo_format_units_units_start_html[5];
    void *v17 = v19;
    uint64_t v16 = 13LL;
  }

  else
  {
    if (v13 != 1) {
      return result;
    }
    v27[0] = result[46];
    uint64_t v14 = v12;
    if ((unint64_t)(v12 + 1) >= v11 + result[11])
    {
      uint64_t v15 = xo_realloc(v11, ((unint64_t)v12 - v11 + 8199) & 0xFFFFFFFFFFFFE000LL);
      if (!v15) {
        goto LABEL_14;
      }
      uint64_t v14 = (void *)(v15 + v6[10] - v6[9]);
      v6[9] = v15;
      v6[10] = (uint64_t)v14;
      v6[11] = ((unint64_t)v12 - v11 + 8199) & 0xFFFFFFFFFFFFE000LL;
    }

    *uint64_t v14 = xo_format_units_units_start_xml;
    uint64_t v16 = 8LL;
  }

  v6[10] += v16;
LABEL_14:
  if (a4) {
    xo_buf_escape((uint64_t)v6, v6 + 9, a3, a4, 0);
  }
  else {
    xo_do_format_field((uint64_t)v6, 0LL, v7, v8, v9);
  }
  int v20 = (char *)v12 - v11;
  uint64_t result = (uint64_t *)v6[9];
  uint64_t v21 = (_BYTE *)v6[10];
  if (v21 + 1 >= (_BYTE *)result + v6[11])
  {
    unint64_t v22 = (v21 + 1 - (_BYTE *)result + 0x1FFF) & 0xFFFFFFFFFFFFE000LL;
    uint64_t result = (uint64_t *)xo_realloc(result, v22);
    uint64_t v23 = v6[10];
    if (!result) {
      goto LABEL_21;
    }
    uint64_t v21 = (char *)result + v23 - v6[9];
    v6[9] = (uint64_t)result;
    v6[10] = (uint64_t)v21;
    v6[11] = v22;
  }

  *uint64_t v21 = 34;
  uint64_t v23 = v6[10] + 1;
  v6[10] = v23;
LABEL_21:
  uint64_t v24 = *v10;
  int64_t v25 = v23 - *v10 - (void)v20;
  if (v25 <= 0)
  {
    v6[10] = (uint64_t)&v20[v24];
  }

  else
  {
    MEMORY[0x1895F8858](result);
    memcpy((char *)v27 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0LL), &v20[v24], v25);
    uint64_t v26 = v27[0];
    memmove((void *)(v24 + v27[0] + v25), (const void *)(v24 + v27[0]), (size_t)&v20[-v27[0]]);
    return (uint64_t *)memmove((void *)(*v10 + v26), (char *)v27 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0LL), v25);
  }

  return result;
}

uint64_t xo_find_width(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __endptr[1] = *(char **)MEMORY[0x1895F89C0];
  if (!a4)
  {
    uint64_t v10 = *(void *)(a2 + 72);
    if (!v10) {
      return 0LL;
    }
    uint64_t v11 = *(char **)(a2 + 32);
    if (*(void *)(a1 + 48)) {
      BOOL v12 = 0;
    }
    else {
      BOOL v12 = v10 == 2;
    }
    if (v12)
    {
      if (!strncmp("%d", *(const char **)(a2 + 32), 2uLL))
      {
        if ((*(_BYTE *)(a1 + 1) & 2) == 0)
        {
          uint64_t v21 = *(int **)(a1 + 200);
          *(void *)(a1 + 200) = v21 + 2;
          return *v21;
        }

        return 0LL;
      }

      if (!strncmp("%u", v11, 2uLL))
      {
        if ((*(_BYTE *)(a1 + 1) & 2) == 0)
        {
          unint64_t v22 = *(unsigned int **)(a1 + 200);
          *(void *)(a1 + 200) = v22 + 2;
          return *v22;
        }

        return 0LL;
      }
    }

    uint64_t v13 = *(void *)(a1 + 72);
    uint64_t v14 = *(const char **)(a1 + 80);
    __endptr[0] = 0LL;
    uint64_t v15 = *(void *)(a1 + 8);
    if ((v15 & 8) != 0) {
      *(void *)(a1 + 8) = v15 & 0xFFFFFFFFFFFFFFF7LL;
    }
    uint64_t v16 = &v14[-v13];
    uint64_t v17 = *(void *)(a1 + 72);
    uint64_t v18 = *(_BYTE **)(a1 + 80);
    if ((unint64_t)(v18 + 1) >= v17 + *(void *)(a1 + 88))
    {
      unint64_t v19 = (unint64_t)&v18[-v17 + 0x2000] & 0xFFFFFFFFFFFFE000LL;
      uint64_t v20 = xo_realloc(v17, v19);
      if (!v20) {
        goto LABEL_21;
      }
      uint64_t v18 = (_BYTE *)(v20 + *(void *)(a1 + 80) - *(void *)(a1 + 72));
      *(void *)(a1 + 72) = v20;
      *(void *)(a1 + 80) = v18;
      *(void *)(a1 + 88) = v19;
    }

    *uint64_t v18 = 0;
    ++*(void *)(a1 + 80);
LABEL_21:
    uint64_t result = strtol(v14, __endptr, 0);
    if ((unint64_t)(result - 0x7FFFFFFFFFFFFFFFLL) >= 2 && v14 != __endptr[0] && !*__endptr[0])
    {
LABEL_26:
      *(void *)(a1 + 80) = &v16[*(void *)(a1 + 72)];
      if ((v15 & 8) != 0) {
        *(void *)(a1 + 8) |= 8uLL;
      }
      return result;
    }

    xo_failure((_BYTE *)a1, "invalid width for anchor: '%s'");
LABEL_25:
    uint64_t result = 0LL;
    goto LABEL_26;
  }

  MEMORY[0x1895F8858](a1);
  uint64_t v7 = (char *)__endptr - ((v6 + 16) & 0xFFFFFFFFFFFFFFF0LL);
  memcpy(v7, v8, v6);
  v7[a4] = 0;
  uint64_t result = strtol(v7, __endptr, 0);
  if ((unint64_t)(result - 0x7FFFFFFFFFFFFFFFLL) < 2 || v7 == __endptr[0] || *__endptr[0])
  {
    xo_failure((_BYTE *)a1, "invalid width for anchor: '%s'");
    return 0LL;
  }

  return result;
}

uint64_t xo_do_open_container(uint64_t a1, uint64_t a2, char *__s)
{
  uint64_t v3 = __s;
  v38[1] = *MEMORY[0x1895F89C0];
  if ((*(_BYTE *)a1 & 2) != 0) {
    size_t v6 = "\n";
  }
  else {
    size_t v6 = (const char *)&xo_version_extra;
  }
  if (!__s)
  {
    xo_failure((_BYTE *)a1, "NULL passed for container name");
    uint64_t v3 = "failure";
  }

  strlen(v3);
  xo_xml_leader_len((_BYTE *)a1, v3);
  uint64_t v13 = *(void *)a1;
  uint64_t v14 = *(void *)a1 | a2;
  int v15 = *(unsigned __int16 *)(a1 + 16);
  switch(v15)
  {
    case 5:
      uint64_t v17 = (int)xo_encoder_handle(a1, 2LL, (uint64_t)v3, 0LL, v14);
      break;
    case 2:
      if ((v13 & 0x2000) != 0)
      {
        *(_DWORD *)(*(void *)(a1 + 168) + 24LL * *(int *)(a1 + 176)) |= 1u;
        v13 &= ~0x2000uLL;
        *(void *)a1 = v13;
      }

      if ((v13 & 0x10000) == 0 && (*(_BYTE *)(a1 + 8) & 4) == 0)
      {
        xo_emit_top(a1);
        uint64_t v13 = *(void *)a1;
      }

      uint64_t v18 = *(void *)(a1 + 168);
      int v19 = *(_DWORD *)(v18 + 24LL * *(int *)(a1 + 176));
      uint64_t v20 = ",\n";
      if ((v13 & 2) == 0) {
        uint64_t v20 = ", ";
      }
      if ((v19 & 1) != 0) {
        LOBYTE(v21) = (_BYTE)v20;
      }
      else {
        uint64_t v21 = &xo_version_extra;
      }
      *(_DWORD *)(v18 + 24LL * *(int *)(a1 + 176)) = v19 | 1;
      if ((v13 & 0x100000) != 0)
      {
        size_t v22 = strlen(v3);
        uint64_t v23 = MEMORY[0x1895F8858](v22);
        uint64_t v24 = (char *)v38 - ((v23 + 16) & 0xFFFFFFFFFFFFFFF0LL);
        if (v24 < &v24[v23 + 1])
        {
          uint64_t v25 = 0LL;
          do
          {
            int v26 = v3[v25];
            if (v26 == 45) {
              LOBYTE(v26) = 95;
            }
            v24[v25++] = v26;
          }

          while (&v24[v25 - 1] < &v24[v23]);
        }
      }

      uint64_t v17 = xo_printf(a1, "%s%*s%s: {%s", v7, v8, v9, v10, v11, v12, (char)v21);
      break;
    case 1:
      if ((v13 & 2) != 0) {
      else
      }
        LOBYTE(v16) = 0;
      uint64_t v27 = xo_printf(a1, "%*s<%s%s", v7, v8, v9, v10, v11, v12, v16);
      uint64_t v33 = v27;
      int64_t v34 = *(_BYTE **)(a1 + 120);
      int v35 = *(_BYTE **)(a1 + 128);
      size_t v36 = v35 - v34;
      if (v35 != v34)
      {
        uint64_t v33 = v36 + v27;
        xo_data_append((void *)a1, v34, v36);
        *(void *)(a1 + 128) = *(void *)(a1 + 120);
      }

      uint64_t v17 = xo_printf(a1, ">%s", v36, v28, v29, v30, v31, v32, (char)v6) + v33;
      break;
    default:
      uint64_t v17 = 0LL;
      break;
  }

  xo_depth_change((_BYTE *)a1, v3, 1, 1, 1u, (v14 >> 7) & 8);
  return v17;
}

uint64_t xo_do_close_leaf_list(uint64_t a1, char *__s1)
{
  int v2 = __s1;
  v22[1] = *MEMORY[0x1895F89C0];
  if (!__s1)
  {
    uint64_t v4 = *(void *)(a1 + 168);
    int v5 = *(_DWORD *)(a1 + 176);
    uint64_t v6 = v4 + 24LL * v5;
    uint64_t v7 = *(const void **)(v6 + 8);
    if (v7)
    {
      strlen(*(const char **)(v6 + 8));
      int v2 = (char *)v22 - ((MEMORY[0x1895F8858]() + 16) & 0xFFFFFFFFFFFFFFF0LL);
      memcpy(v2, v7, v8);
    }

    else if ((*(_BYTE *)(v4 + 24LL * v5) & 8) != 0)
    {
      int v2 = 0LL;
    }

    else
    {
      xo_failure((_BYTE *)a1, "missing name without 'dtrt' mode");
      int v2 = "failure";
    }
  }

  int v9 = *(unsigned __int16 *)(a1 + 16);
  if (v9 == 5)
  {
    uint64_t v20 = xo_encoder_handle(a1, 7LL, (uint64_t)v2, 0LL, 0LL);
LABEL_16:
    xo_depth_change((_BYTE *)a1, v2, -1, 0, 8u, 2);
    uint64_t v10 = (void *)(a1 + 168);
    uint64_t v11 = (int *)(a1 + 176);
    goto LABEL_17;
  }

  if (v9 != 2)
  {
    uint64_t v20 = 0LL;
    goto LABEL_16;
  }

  uint64_t v10 = (void *)(a1 + 168);
  uint64_t v11 = (int *)(a1 + 176);
  uint64_t v12 = (_DWORD *)(*(void *)(a1 + 168) + 24LL * *(int *)(a1 + 176));
  uint64_t v13 = (const char *)&xo_version_extra;
  if ((*v12 & 1) != 0)
  {
    if ((*(_BYTE *)a1 & 2) != 0) {
      uint64_t v13 = "\n";
    }
    else {
      uint64_t v13 = (const char *)&xo_version_extra;
    }
  }

  *v12 |= 1u;
  xo_depth_change((_BYTE *)a1, v2, -1, -1, 8u, 2);
  xo_indent(a1);
  uint64_t v20 = xo_printf(a1, "%s%*s]", v14, v15, v16, v17, v18, v19, (char)v13);
LABEL_17:
  *(_DWORD *)(*v10 + 24LL * *v11) |= 1u;
  return v20;
}

uint64_t xo_do_close_container(uint64_t a1, char *__s)
{
  uint64_t v3 = a1;
  v25[1] = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited()) {
      xo_default_init();
    }
    uint64_t v3 = xo_default_handle();
  }

  if (!__s)
  {
    uint64_t v4 = *(void *)(v3 + 168);
    int v5 = *(_DWORD *)(v3 + 176);
    uint64_t v6 = v4 + 24LL * v5;
    uint64_t v7 = *(const void **)(v6 + 8);
    if (v7)
    {
      strlen(*(const char **)(v6 + 8));
      __s = (char *)v25 - ((MEMORY[0x1895F8858]() + 16) & 0xFFFFFFFFFFFFFFF0LL);
      memcpy(__s, v7, v8);
    }

    else if ((*(_BYTE *)(v4 + 24LL * v5) & 8) != 0)
    {
      __s = 0LL;
    }

    else
    {
      xo_failure((_BYTE *)v3, "missing name without 'dtrt' mode");
      __s = "failure";
    }
  }

  strlen(__s);
  xo_xml_leader_len((_BYTE *)v3, __s);
  uint64_t result = 0LL;
  switch(*(_WORD *)(v3 + 16))
  {
    case 0:
    case 3:
      xo_depth_change((_BYTE *)v3, __s, -1, 0, 2u, 0);
      uint64_t result = 0LL;
      break;
    case 1:
      xo_depth_change((_BYTE *)v3, __s, -1, -1, 2u, 0);
      LOBYTE(v16) = 0;
      if ((*(_BYTE *)v3 & 2) != 0) {
      uint64_t result = xo_printf(v3, "%*s</%s%s>%s", v10, v11, v12, v13, v14, v15, v16);
      }
      break;
    case 2:
      uint64_t v17 = *(void *)v3;
      if ((*(void *)v3 & 0x2000) != 0)
      {
        *(_DWORD *)(*(void *)(v3 + 168) + 24LL * *(int *)(v3 + 176)) |= 1u;
        v17 &= ~0x2000uLL;
        *(void *)uint64_t v3 = v17;
      }

      if ((v17 & 2) != 0) {
        uint64_t v18 = "\n";
      }
      else {
        uint64_t v18 = (const char *)&xo_version_extra;
      }
      xo_depth_change((_BYTE *)v3, __s, -1, -1, 2u, 0);
      uint64_t result = xo_printf(v3, "%s%*s}%s", v19, v20, v21, v22, v23, v24, (char)v18);
      *(_DWORD *)(*(void *)(v3 + 168) + 24LL * *(int *)(v3 + 176)) |= 1u;
      break;
    case 5:
      xo_depth_change((_BYTE *)v3, __s, -1, 0, 2u, 0);
      uint64_t result = xo_encoder_handle(v3, 3LL, (uint64_t)__s, 0LL, 0LL);
      break;
    default:
      return result;
  }

  return result;
}

uint64_t xo_do_open_leaf_list( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t v8 = (char *)a3;
  uint64_t v10 = a1;
  if (!a1)
  {
    if (!*(_DWORD *)xo_default_inited()) {
      xo_default_init();
    }
    uint64_t v10 = xo_default_handle();
  }

  uint64_t v11 = *(void *)v10;
  int v12 = *(unsigned __int16 *)(v10 + 16);
  if (v12 == 5)
  {
    uint64_t v14 = xo_encoder_handle(v10, 6LL, (uint64_t)v8, 0LL, a2);
LABEL_13:
    __int16 v15 = 0;
    goto LABEL_25;
  }

  if (v12 != 2)
  {
    uint64_t v14 = 0LL;
    goto LABEL_13;
  }

  if ((v11 & 0x10000) == 0 && (*(_BYTE *)(v10 + 8) & 4) == 0)
  {
    if ((v11 & 2) != 0) {
      __int16 v13 = *(_WORD *)(v10 + 20) * *(_WORD *)(v10 + 18);
    }
    else {
      LOBYTE(v13) = 0;
    }
    xo_printf(v10, "%*s{%s", a3, a4, a5, a6, a7, a8, v13);
    *(void *)(v10 + 8) |= 4uLL;
  }

  if (!v8)
  {
    xo_failure((_BYTE *)v10, "NULL passed for list name");
    size_t v8 = "failure";
  }

  uint64_t v16 = *(void *)v10;
  uint64_t v17 = (int *)(*(void *)(v10 + 168) + 24LL * *(int *)(v10 + 176));
  int v18 = *v17;
  if ((*(void *)v10 & 0x2000) != 0)
  {
    v18 |= 1u;
    int *v17 = v18;
    v16 &= ~0x2000uLL;
    *(void *)uint64_t v10 = v16;
  }

  uint64_t v19 = ",\n";
  if ((v16 & 2) == 0) {
    uint64_t v19 = ", ";
  }
  if ((v18 & 1) == 0) {
    uint64_t v19 = (const char *)&xo_version_extra;
  }
  int *v17 = v18 | 1;
  uint64_t v14 = xo_printf(v10, "%s%*s%s: [%s", a3, a4, a5, a6, a7, a8, (char)v19);
  __int16 v15 = 1;
LABEL_25:
  xo_depth_change((_BYTE *)v10, v8, 1, v15, 7u, (a2 >> 7) & 8 | 2);
  return v14;
}

uint64_t xo_emit_top(uint64_t a1)
{
  char v2 = xo_indent(a1);
  uint64_t result = xo_printf(a1, "%*s{%s", v3, v4, v5, v6, v7, v8, v2);
  *(void *)(a1 + 8) |= 4uLL;
  if (*(void *)(a1 + 432))
  {
    char v10 = xo_indent(a1);
    xo_printf(a1, "%*s__version: %s, %s", v11, v12, v13, v14, v15, v16, v10);
    uint64_t result = xo_free(*(void *)(a1 + 432));
    *(void *)(a1 + 432) = 0LL;
  }

  return result;
}

const char *xo_xml_leader_len(_BYTE *a1, char *a2)
{
  if (!a2) {
    return (const char *)&xo_version_extra;
  }
  unsigned int v3 = *a2;
  if ((v3 & 0x80000000) != 0) {
    int v4 = __maskrune(*a2, 0x100uLL);
  }
  else {
    int v4 = *(_DWORD *)(MEMORY[0x1895F8770] + 4LL * v3 + 60) & 0x100;
  }
  if (v3 == 95 || v4 != 0) {
    return (const char *)&xo_version_extra;
  }
  xo_failure(a1, "invalid XML tag name: '%.*s'");
  return "_";
}

BOOL xo_format_is_numeric(_BYTE *a1, uint64_t a2)
{
  if (a2 < 1) {
    return 0LL;
  }
  char v2 = a1 + 1;
  if (*a1 != 37) {
    return 0LL;
  }
  unsigned int v3 = &a1[a2];
  uint64_t v4 = 0LL;
  uint64_t v5 = a2 - 1;
  if (a2 != 1)
  {
    do
    {
      if (!v2[v4]) {
        break;
      }
      ++v4;
    }

    while (&v2[v4] < v3);
  }

  BOOL v6 = v5 <= v4;
  uint64_t v7 = v5 - v4;
  if (v6) {
    return 0LL;
  }
  uint64_t v8 = &v2[v4];
  if (v7 < 1)
  {
    uint64_t v9 = 0LL;
  }

  else
  {
    uint64_t v9 = 0LL;
    do
    {
      if (!v8[v9]) {
        break;
      }
      ++v9;
    }

    while (&v8[v9] < v3);
  }

  BOOL result = 0LL;
  if (v7 > v9 && v7 - v9 == 1) {
    return memchr("diouDOUeEfFgG", (char)v8[v9], 0xEuLL) != 0LL;
  }
  return result;
}

void *xo_encoder_path_add(const char *a1)
{
  BOOL result = (void *)xo_encoder_setup();
  if (a1)
  {
    if (!qword_18C75F910)
    {
      xo_encoder_path = 0LL;
      qword_18C75F910 = (uint64_t)&xo_encoder_path;
    }

    size_t v3 = strlen(a1);
    BOOL result = (void *)xo_realloc(0LL, v3 + 17);
    if (result)
    {
      uint64_t v4 = result;
      uint64_t v5 = (char *)(result + 2);
      BOOL result = memcpy(result + 2, a1, v3);
      v5[v3] = 0;
      BOOL v6 = (void *)qword_18C75F910;
      void *v4 = 0LL;
      v4[1] = v6;
      *BOOL v6 = v4;
      qword_18C75F910 = (uint64_t)v4;
    }
  }

  return result;
}

void *xo_encoder_setup()
{
  if ((xo_encoder_setup_initted & 1) == 0)
  {
    xo_encoder_setup_initted = 1;
    if (!qword_18C75F910)
    {
      xo_encoder_path = 0LL;
      qword_18C75F910 = (uint64_t)&xo_encoder_path;
    }

    if (!qword_18C75F920)
    {
      xo_encoders = 0LL;
      qword_18C75F920 = (uint64_t)&xo_encoders;
    }

    return xo_encoder_path_add((const char *)&unk_188FD4C92);
  }

  return result;
}

void *xo_encoders_clean()
{
  BOOL result = xo_encoder_setup();
  for (uint64_t i = (uint64_t *)xo_encoders; xo_encoders; uint64_t i = (uint64_t *)xo_encoders)
  {
    uint64_t v2 = *i;
    size_t v3 = (void *)i[1];
    if (*i)
    {
      *(void *)(v2 + 8) = v3;
      size_t v3 = (void *)i[1];
    }

    else
    {
      qword_18C75F920 = i[1];
    }

    void *v3 = v2;
    uint64_t v4 = (void *)i[4];
    if (v4) {
      dlclose(v4);
    }
    BOOL result = (void *)xo_free(i);
  }

  if (qword_18C75F910)
  {
    while (1)
    {
      BOOL result = (void *)xo_encoder_path;
      if (!xo_encoder_path) {
        break;
      }
      uint64_t v5 = *(void *)xo_encoder_path;
      BOOL v6 = *(void **)(xo_encoder_path + 8);
      if (*(void *)xo_encoder_path)
      {
        *(void *)(v5 + 8) = v6;
        BOOL v6 = (void *)result[1];
      }

      else
      {
        qword_18C75F910 = *(void *)(xo_encoder_path + 8);
      }

      *BOOL v6 = v5;
      xo_free(result);
    }
  }

  else
  {
    xo_encoder_path = 0LL;
    qword_18C75F910 = (uint64_t)&xo_encoder_path;
  }

  return result;
}

uint64_t *xo_encoder_register(char *a1, uint64_t a2)
{
  BOOL result = xo_encoder_find(a1);
  if (!result)
  {
    BOOL result = xo_encoder_list_add(a1);
    if (result) {
      result[3] = a2;
    }
  }

  return result;
}

uint64_t *xo_encoder_find(char *__s2)
{
  if (!qword_18C75F920)
  {
    xo_encoders = 0LL;
    qword_18C75F920 = (uint64_t)&xo_encoders;
  }

  uint64_t v2 = &xo_encoders;
  do
    uint64_t v2 = (uint64_t *)*v2;
  while (v2 && strcmp((const char *)v2[2], __s2));
  return v2;
}

void *xo_encoder_list_add(const char *a1)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v2 = (void *)xo_realloc(0LL, 40LL);
  if (v2)
  {
    size_t v3 = strlen(a1) + 1;
    uint64_t v4 = (void *)xo_realloc(0LL, v3);
    v2[2] = v4;
    if (v4)
    {
      memcpy(v4, a1, v3);
      uint64_t v5 = (void *)qword_18C75F920;
      void *v2 = 0LL;
      v2[1] = v5;
      *uint64_t v5 = v2;
      qword_18C75F920 = (uint64_t)v2;
      return v2;
    }

    xo_free(v2);
    return 0LL;
  }

  return v2;
}

uint64_t *xo_encoder_unregister(char *a1)
{
  BOOL result = xo_encoder_find(a1);
  if (result)
  {
    uint64_t v3 = *result;
    uint64_t v4 = (uint64_t *)result[1];
    if (*result)
    {
      *(void *)(v3 + 8) = v4;
      uint64_t v4 = (uint64_t *)result[1];
    }

    else
    {
      qword_18C75F920 = result[1];
    }

    uint64_t *v4 = v3;
    return (uint64_t *)xo_free(result);
  }

  return result;
}

uint64_t xo_encoder_init(_BYTE *a1, char *a2)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  xo_encoder_setup();
  uint64_t v4 = strchr(a2, 58);
  uint64_t v5 = strchr(a2, 43);
  BOOL v6 = v5;
  if (v4)
  {
    if (v5 >= v4) {
      uint64_t v7 = v4;
    }
    else {
      uint64_t v7 = v5;
    }
    if (v5) {
      BOOL v6 = v7;
    }
    else {
      BOOL v6 = v4;
    }
  }

  else if (!v5)
  {
    int v8 = 0;
    goto LABEL_10;
  }

  int v8 = *v6;
  size_t v9 = strlen(a2);
  char v10 = (char *)&v20 - ((MEMORY[0x1895F8858](v9) + 16) & 0xFFFFFFFFFFFFFFF0LL);
  memcpy(v10, a2, v9);
  v10[v9] = 0;
  uint64_t v11 = &v10[v6 - a2];
  char *v11 = 0;
  BOOL v6 = v11 + 1;
  a2 = v10;
LABEL_10:
  if (strchr(a2, 47) || strchr(a2, 58))
  {
    uint64_t v12 = "invalid encoder name: %s";
LABEL_13:
    xo_failure(a1, v12);
    return 0xFFFFFFFFLL;
  }

  uint64_t v14 = xo_encoder_find(a2);
  if (!v14)
  {
    if (qword_18C75F910)
    {
      uint64_t v16 = xo_encoder_path;
      if (xo_encoder_path)
      {
        while (1)
        {
          if (snprintf(v23, 0x400uLL, "%s/%s.enc", (const char *)(v16 + 16), a2) <= 0x400)
          {
            uint64_t v17 = dlopen(v23, 2);
            if (v17) {
              break;
            }
          }

          uint64_t v16 = *(void *)v16;
          if (!v16) {
            goto LABEL_36;
          }
        }

        int v18 = v17;
        uint64_t v19 = (unsigned int (*)(uint64_t *))dlsym(v17, "xo_encoder_library_init");
        if (v19)
        {
          uint64_t v21 = 1LL;
          uint64_t v22 = 0LL;
          if (!v19(&v21))
          {
            if (v22)
            {
              uint64_t v14 = xo_encoder_list_add(a2);
              if (v14)
              {
                v14[3] = v22;
                v14[4] = (uint64_t)v18;
                goto LABEL_17;
              }
            }
          }
        }

        dlclose(v18);
      }
    }

    else
    {
      xo_encoder_path = 0LL;
      qword_18C75F910 = (uint64_t)&xo_encoder_path;
    }

LABEL_36:
    uint64_t v12 = "encoder not founde: %s";
    goto LABEL_13;
  }

LABEL_17:
  xo_set_encoder((uint64_t)a1, v14[3]);
  uint64_t result = xo_encoder_handle((uint64_t)a1, 1LL, (uint64_t)a2, 0LL, 0LL);
  if (!(_DWORD)result && v6)
  {
    if (v8 == 43) {
      uint64_t v15 = 18LL;
    }
    else {
      uint64_t v15 = 17LL;
    }
    return xo_encoder_handle((uint64_t)a1, v15, (uint64_t)a2, (uint64_t)v6, 0LL);
  }

  return result;
}

uint64_t xo_encoder_handle(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = xo_get_private(a1);
  encoder = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))xo_get_encoder(a1);
  if (encoder) {
    return encoder(a1, a2, a3, a4, v10, a5);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t xo_encoder_create(char *a1, uint64_t a2)
{
  uint64_t v3 = (_BYTE *)xo_create(5, a2);
  uint64_t v4 = (uint64_t)v3;
  if (v3 && xo_encoder_init(v3, a1))
  {
    xo_destroy(v4);
    return 0LL;
  }

  return v4;
}

const char *xo_encoder_op_name(unsigned int a1)
{
  if (a1 <= 0x12) {
    return (&xo_encoder_op_name_names)[a1];
  }
  else {
    return "unknown";
  }
}

uint64_t xo_set_syslog_enterprise_id(int a1)
{
  return snprintf(&xo_syslog_enterprise_id, 0xCuLL, "%u", a1);
}

uint64_t xo_open_log(uint64_t a1, int a2, int a3)
{
  return pthread_mutex_unlock(&xo_syslog_mutex);
}

uint64_t xo_open_log_unlocked(uint64_t result, int a2, int a3)
{
  if (result) {
    xo_logtag = result;
  }
  xo_logstat = a2;
  if (a3 && (a3 & 0xFFFFFC07) == 0) {
    xo_logfacility = a3;
  }
  if ((a2 & 8) != 0) {
    uint64_t result = xo_connect_log();
  }
  xo_opened = 1;
  return result;
}

uint64_t xo_close_log()
{
  if (xo_logfile != -1)
  {
    close(xo_logfile);
    xo_logfile = -1;
  }

  xo_logtag = 0LL;
  xo_status = 0;
  return pthread_mutex_unlock(&xo_syslog_mutex);
}

uint64_t xo_set_logmask(int a1)
{
  uint64_t v2 = xo_logmask;
  if (a1) {
    xo_logmask = a1;
  }
  pthread_mutex_unlock(&xo_syslog_mutex);
  return v2;
}

void *xo_set_syslog_handler(void *result, void *a2, void *a3)
{
  xo_syslog_open = result;
  xo_syslog_send = a2;
  xo_syslog_close = a3;
  return result;
}

uint64_t xo_set_unit_test_mode(uint64_t result)
{
  xo_unit_test = result;
  return result;
}

uint64_t xo_vsyslog(uint64_t a1, const char *a2, char *a3, uint64_t a4)
{
  uint64_t v73 = *MEMORY[0x1895F89C0];
  uint64_t v64 = a4;
  int v12 = *__error();
  if (!xo_vsyslog_my_pid)
  {
    if (xo_unit_test) {
      pid_t v13 = 222;
    }
    else {
      pid_t v13 = getpid();
    }
    xo_vsyslog_my_pid = v13;
  }

  if (a1 >= 0x400)
  {
    xo_syslog( 35LL,  (uint64_t)"syslog-unknown-priority",  (uint64_t)"syslog: unknown facility/priority: %#x",  v7,  v8,  v9,  v10,  v11,  a1);
    LODWORD(a1) = a1 & 0x3FF;
  }

  pthread_mutex_lock(&xo_syslog_mutex);
  else {
    int v14 = xo_logfacility;
  }
  __int16 v61 = v67;
  size_t v62 = v67;
  uint64_t v63 = 2048LL;
  uint64_t v15 = xo_create(4, 0LL);
  if (v15)
  {
    uint64_t v16 = (void *)v15;
    if (!xo_logtag) {
      xo_logtag = (uint64_t)getprogname();
    }
    xo_set_writer( v16,  (uint64_t)&v61,  (uint64_t)xo_syslog_handle_write,  (uint64_t)xo_syslog_handle_close,  (uint64_t)xo_syslog_handle_flush);
    if (xo_unit_test)
    {
      v59.tv_sec = 1435085229LL;
      v59.tv_usec = 123456;
    }

    else
    {
      gettimeofday(&v59, 0LL);
    }

    int v18 = v14 | a1;
    uint64_t v19 = localtime_r(&v59.tv_sec, &v60);
    if ((xo_logstat & 0x20) != 0)
    {
      MEMORY[0x1895F8858](v19);
      uint64_t v21 = v55;
      uint64_t v57 = v55;
      if (xo_logtag)
      {
        uint64_t v21 = &v55[xo_snprintf(v55, 2048LL, "%s", (const char *)xo_logtag)];
        char v20 = xo_logstat;
      }

      if ((v20 & 1) != 0) {
        v21 += xo_snprintf(v21, (char *)&v56 - v21, "[%d]", xo_vsyslog_my_pid);
      }
      if (xo_logtag) {
        xo_snprintf(v21, (char *)&v56 - v21, ": ");
      }
    }

    else
    {
      uint64_t v57 = 0LL;
    }

    int v22 = (int)v62;
    uint64_t v56 = v61;
    uint64_t v23 = xo_snprintf(v62, (int)v63 - (int)v62 + (int)v61, "<%d>1 ", v18);
    v62 += v23;
    size_t v24 = strftime(v62, (int)v63 - (int)v62 + (int)v61, "%FT%T", &v60);
    v62 += v24;
    uint64_t v25 = xo_snprintf(v62, (int)v63 - (int)v62 + (int)v61, ".%03.3u", v59.tv_usec / 1000);
    v62 += v25;
    size_t v26 = strftime(v62, (int)v63 - (int)v62 + (int)v61, "%z ", &v60);
    uint64_t v27 = &v62[v26];
    size_t v62 = v27;
    v66[0] = 0;
    if (xo_unit_test)
    {
      strcpy(v66, "worker-host");
      int v28 = 119;
    }

    else
    {
      gethostname(v66, 0x48uLL);
      uint64_t v27 = v62;
      int v28 = v66[0];
    }

    BOOL v42 = v28 == 0;
    uint64_t v29 = v66;
    if (v42) {
      uint64_t v29 = "-";
    }
    uint64_t v30 = xo_snprintf(v27, (int)v63 - (int)v27 + (int)v61, "%s ", v29);
    uint64_t v31 = &v62[v30];
    size_t v62 = v31;
    uint64_t v32 = (const char *)xo_logtag;
    if (!xo_logtag) {
      uint64_t v32 = "-";
    }
    uint64_t v33 = xo_snprintf(v31, (int)v63 - (int)v31 + (int)v61, "%s ", v32);
    v62 += v33;
    uint64_t v34 = xo_snprintf(v62, (int)v63 - (int)v62 + (int)v61, "%d ", xo_vsyslog_my_pid);
    int v35 = &v62[v34];
    size_t v62 = v35;
    if (a2)
    {
      if (*a2 != 64)
      {
        size_t v36 = &xo_syslog_enterprise_id;
        if (xo_syslog_enterprise_id)
        {
          unint64_t v37 = "@";
        }

        else
        {
          v68.iov_base = 0LL;
          uint64_t v38 = sysctlbyname("kern.syslog.enterprise_id", 0LL, (size_t *)&v68, 0LL, 0LL);
          if (!(_DWORD)v38 && v68.iov_base)
          {
            MEMORY[0x1895F8858](v38);
            int64_t v40 = &v55[-((v39 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
            int v41 = sysctlbyname("kern.syslog.enterprise_id", v40, (size_t *)&v68, 0LL, 0LL);
            BOOL v42 = v68.iov_base && v41 == 0;
            if (v42) {
              size_t v36 = v40;
            }
          }

          if (!*v36)
          {
            size_t v36 = &xo_syslog_enterprise_id;
            snprintf(&xo_syslog_enterprise_id, 0xCuLL, "%u", 32473);
          }

          unint64_t v37 = "@";
          int v35 = v62;
        }

        goto LABEL_51;
      }

      ++a2;
      size_t v36 = (char *)&unk_188FD4C92;
    }

    else
    {
      size_t v36 = (char *)&unk_188FD4C92;
      a2 = "-";
    }

    unint64_t v37 = (const char *)&unk_188FD4C92;
LABEL_51:
    uint64_t v43 = xo_snprintf(v35, (int)v63 - (int)v35 + (int)v61, "%s [%s%s%s ", a2, a2, v37, v36);
    v62 += v43;
    uint64_t v58 = v64;
    *__error() = v12;
    xo_emit_hv((unint64_t)v16, a3, v58);
    xo_flush_h((uint64_t)v16);
    unint64_t v44 = v62;
    unint64_t v45 = v62 - 1;
    if (*(v62 - 1) == 32)
    {
      --v62;
      unint64_t v44 = v45;
    }

    uint64_t v46 = xo_snprintf(v44, (int)v63 - (int)v44 + (int)v61, "] ");
    v62 += v46;
    uint64_t v47 = xo_snprintf(v62, (int)v63 - (int)v62 + (int)v61, "%c%c%c", 239LL, 187LL, 191LL);
    v62 += v47;
    if ((xo_logstat & 0x20) != 0) {
      uint64_t v48 = ((_DWORD)v62 - (_DWORD)v61);
    }
    else {
      uint64_t v48 = 0LL;
    }
    xo_set_style((uint64_t)v16, 0);
    xo_set_flags(v16, 0x20000000LL);
    *__error() = v12;
    xo_emit_hv((unint64_t)v16, a3, v58);
    xo_flush_h((uint64_t)v16);
    unint64_t v49 = v62 - 1;
    if (*(v62 - 1) == 10)
    {
      --v62;
      *unint64_t v49 = 0;
    }

    uint64_t v50 = v61;
    if (xo_syslog_send)
    {
      xo_syslog_send(v61, v57, &v61[v48]);
    }

    else
    {
      int v51 = strlen(v61);
      if (v57)
      {
        v65[0] = 10;
        v68.iov_base = v57;
        v68.iov_len = strlen(v57);
        size_t v69 = &v61[v48];
        size_t v70 = strlen(&v61[v48]);
        size_t v71 = v65;
        uint64_t v72 = 1LL;
        writev(2, &v68, 3);
      }

      if ((xo_opened & 1) == 0)
      {
        xo_logstat |= 8u;
        xo_connect_log();
        xo_opened = 1;
      }

      xo_connect_log();
      uint64_t v52 = v51;
      if (send(xo_logfile, v50, v51, 0) < 0)
      {
        if (*__error() == 55) {
          goto LABEL_75;
        }
        if (xo_syslog_close)
        {
          xo_syslog_close();
        }

        else
        {
          if (xo_logfile != -1)
          {
            close(xo_logfile);
            xo_logfile = -1;
          }

          xo_status = 0;
        }

        xo_connect_log();
        while (send(xo_logfile, v50, v51, 0) < 0)
        {
LABEL_75:
          if (*__error() != 55)
          {
            if ((xo_logstat & 2) != 0)
            {
              int v53 = open("/dev/console", 16777221, 0LL);
              if ((v53 & 0x80000000) == 0)
              {
                int v54 = v53;
                strcpy((char *)v65, "\r\n");
                v68.iov_base = strchr(v50, 62) + 1;
                v68.iov_len = (char *)&v50[v52] - (char *)v68.iov_base;
                size_t v69 = (const char *)v65;
                size_t v70 = 2LL;
                writev(v54, &v68, 2);
                close(v54);
              }
            }

            break;
          }

          usleep(1u);
        }
      }
    }

    xo_destroy((uint64_t)v16);
  }

  return pthread_mutex_unlock(&xo_syslog_mutex);
}

uint64_t xo_syslog( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return xo_vsyslog(a1, a2, a3, &a9);
}

uint64_t xo_syslog_handle_write(uint64_t a1, char *__s)
{
  int v4 = strlen(__s);
  int v5 = *(_DWORD *)(a1 + 16) - *(void *)(a1 + 8) + *(_DWORD *)a1;
  if (v5 <= v4) {
    int v6 = v5 - 1;
  }
  else {
    int v6 = v4;
  }
  memcpy(*(void **)(a1 + 8), __s, v6);
  uint64_t v7 = (_BYTE *)(*(void *)(a1 + 8) + v6);
  *(void *)(a1 + 8) = v7;
  *uint64_t v7 = 0;
  return v6;
}

uint64_t xo_syslog_handle_flush()
{
  return 0LL;
}

uint64_t xo_snprintf(char *__str, int64_t __size, const char *a3, ...)
{
  uint64_t result = 0LL;
  if (__str && __size)
  {
    LODWORD(result) = vsnprintf(__str, __size, a3, va);
    if ((result & 0x80000000) != 0)
    {
      uint64_t result = 0LL;
      *__str = 0;
    }

    else if (result >= __size)
    {
      return __size;
    }

    else
    {
      return result;
    }
  }

  return result;
}

uint64_t xo_connect_log()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  if (xo_syslog_open) {
    return xo_syslog_open();
  }
  uint64_t result = xo_logfile;
  if (xo_logfile != -1 || (uint64_t result = socket(1, 2, 0), xo_logfile = result, (_DWORD)result != -1))
  {
    if ((xo_status & 1) == 0)
    {
      strcpy((char *)&v1[1], "/var/run/syslog");
      memset(&v1[9], 0, 80);
      v1[0] = 362;
      uint64_t v2 = 0LL;
      uint64_t result = connect(result, (const sockaddr *)v1, 0x6Au);
      if ((_DWORD)result == -1)
      {
        if ((xo_status & 1) == 0)
        {
          uint64_t result = close(xo_logfile);
          xo_logfile = -1;
        }
      }

      else
      {
        xo_status = 1;
      }
    }
  }

  return result;
}

void xo_format_humanize_cold_1()
{
  __assert_rtn("xo_humanize_number", "xo_humanize.h", 79, "buf != NULL");
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t __divti3()
{
  return MEMORY[0x1895F8888]();
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1895F8918](*(void *)&a1, a2);
}

int atoi(const char *a1)
{
  return MEMORY[0x1895F95A0](a1);
}

void *__cdecl bsearch( const void *__key, const void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  return (void *)MEMORY[0x1895F9650](__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x1895FA5F0](*(void *)&a1, a2, *(void *)&a3);
}

int dlclose(void *__handle)
{
  return MEMORY[0x1895FAF50](__handle);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1895FAF60](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1895FAF78](__handle, __symbol);
}

void exit(int a1)
{
}

int fclose(FILE *a1)
{
  return MEMORY[0x1895FB208](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1895FB268](a1);
}

int fileno(FILE *a1)
{
  return MEMORY[0x1895FB2A0](a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1895FB360](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1895FB370](*(void *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1895FB4C8](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1895FB538](a1);
}

int gethostname(char *a1, size_t a2)
{
  return MEMORY[0x1895FB590](a1, a2);
}

pid_t getpid(void)
{
  return MEMORY[0x1895FB628]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1895FB638]();
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1895FB6E0](a1, a2);
}

int isatty(int a1)
{
  return MEMORY[0x1895FB868](*(void *)&a1);
}

lconv *localeconv(void)
{
  return (lconv *)MEMORY[0x1895FBA08]();
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1895FBA20](a1, a2);
}

size_t mbrtowc(__int32 *a1, const char *a2, size_t a3, mbstate_t *a4)
{
  return MEMORY[0x1895FBDC8](a1, a2, a3, a4);
}

void *__cdecl memchr(const void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1895FBE00](__s, *(void *)&__c, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1895FBE30](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1895FBE48](__b, *(void *)&__c, __len);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FC248](a1, *(void *)&a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCA98](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCAA8](a1);
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return MEMORY[0x1895FCE30](*(void *)&a1, a2, a3, *(void *)&a4);
}

char *__cdecl setlocale(int a1, const char *a2)
{
  return (char *)MEMORY[0x1895FCE98](*(void *)&a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x1895FCFA0](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

char *__cdecl strchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FD048](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FD050](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1895FD080](*(void *)&__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x1895FD090](a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1895FD0E8](__s1, __s2, __n);
}

char *__cdecl strrchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FD120](__s, *(void *)&__c);
}

size_t strspn(const char *__s, const char *__charset)
{
  return MEMORY[0x1895FD140](__s, __charset);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD180](__str, __endptr, *(void *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD1C8](__str, __endptr, *(void *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1895FD2B8](a1, a2, a3, a4, a5);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1895FD490](*(void *)&a1);
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return MEMORY[0x1895FD528](a1, a2, a3);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1895FD610](__str, __size, __format, a4);
}

size_t wcrtomb(char *a1, __int32 a2, mbstate_t *a3)
{
  return MEMORY[0x1895FD658](a1, *(void *)&a2, a3);
}