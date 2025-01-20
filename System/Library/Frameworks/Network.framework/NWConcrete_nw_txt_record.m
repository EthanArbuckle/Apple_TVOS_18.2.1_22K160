@interface NWConcrete_nw_txt_record
- (NSString)description;
- (NWConcrete_nw_txt_record)init;
- (id).cxx_construct;
- (void)dealloc;
@end

@implementation NWConcrete_nw_txt_record

- (NWConcrete_nw_txt_record)init
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_txt_record;
  v2 = -[NWConcrete_nw_txt_record init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    goto LABEL_3;
  }

  __nwlog_obj();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWConcrete_nw_txt_record init]";
  v7 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v14 = 0;
  if (__nwlog_fault(v7, &type, &v14))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v9 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_txt_record init]";
        _os_log_impl(&dword_181A5C000, v8, v9, "%{public}s [super init] failed", buf, 0xCu);
      }
    }

    else if (v14)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v11 = type;
      BOOL v12 = os_log_type_enabled(v8, type);
      if (backtrace_string)
      {
        if (v12)
        {
          *(_DWORD *)buf = 136446466;
          v18 = "-[NWConcrete_nw_txt_record init]";
          __int16 v19 = 2082;
          v20 = backtrace_string;
          _os_log_impl( &dword_181A5C000,  v8,  v11,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  buf,  0x16u);
        }

        free(backtrace_string);
        goto LABEL_20;
      }

      if (v12)
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_txt_record init]";
        _os_log_impl(&dword_181A5C000, v8, v11, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
      }
    }

    else
    {
      __nwlog_obj();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v13 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_txt_record init]";
        _os_log_impl(&dword_181A5C000, v8, v13, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }
  }

- (void)dealloc
{
  v3 = (void *)*((void *)self + 1);
  if (v3)
  {
    free(v3);
    *((void *)self + 1) = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_txt_record;
  -[NWConcrete_nw_txt_record dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  uint64_t v3 = *((void *)self + 2);
  size_t v4 = v3 + 2;
  if (v3 == -2)
  {
    __nwlog_obj();
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
    int v64 = 12;
    v33 = (void *)_os_log_send_and_compose_impl();

    result = (NSString *)__nwlog_abort((uint64_t)v33);
    if ((_DWORD)result) {
      goto LABEL_67;
    }
    free(v33);
  }

  v5 = (char *)malloc(v4);
  if (v5)
  {
    if ((*((_BYTE *)self + 36) & 1) == 0) {
      goto LABEL_4;
    }
LABEL_33:
    uint64_t v29 = *((void *)self + 2);
    if (v29 == 1)
    {
      v30 = &stru_189BCAF98;
      if (!v5) {
        return (NSString *)v30;
      }
      goto LABEL_27;
    }

    if (v29 < 1)
    {
LABEL_26:
      v5[v29] = 0;
      v30 = (__CFString *)CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, @"%s", v5 + 1, v64);
LABEL_27:
      free(v5);
      return (NSString *)v30;
    }

    v36 = (unsigned __int8 *)*((void *)self + 1);
    v37 = &v36[v29];
    v38.i64[0] = 0x8181818181818181LL;
    v38.i64[1] = 0x8181818181818181LL;
    v39.i64[0] = 0xA1A1A1A1A1A1A1A1LL;
    v39.i64[1] = 0xA1A1A1A1A1A1A1A1LL;
    v40.i64[0] = 0x2E2E2E2E2E2E2E2ELL;
    v40.i64[1] = 0x2E2E2E2E2E2E2E2ELL;
    v41 = v5;
    while (1)
    {
      char *v41 = 10;
      uint64_t v43 = *v36;
      if (*v36)
      {
        uint64_t v42 = v43 + 1;
        if (v43 < 8 || (unint64_t)(v41 - (char *)v36) <= 0x1F)
        {
          uint64_t v45 = 1LL;
          goto LABEL_62;
        }

        if (v43 >= 0x20)
        {
          uint64_t v46 = v43 & 0xE0;
          int8x16_t v47 = vbslq_s8( (int8x16_t)vcgtq_u8(v39, (uint8x16_t)vaddq_s8(*(int8x16_t *)(v36 + 17), v38)),  v40,  *(int8x16_t *)(v36 + 17));
          *(int8x16_t *)(v41 + 1) = vbslq_s8( (int8x16_t)vcgtq_u8(v39, (uint8x16_t)vaddq_s8(*(int8x16_t *)(v36 + 1), v38)),  v40,  *(int8x16_t *)(v36 + 1));
          *(int8x16_t *)(v41 + 17) = v47;
          if (v46 != 32)
          {
            int8x16_t v48 = vbslq_s8( (int8x16_t)vcgtq_u8(v39, (uint8x16_t)vaddq_s8(*(int8x16_t *)(v36 + 49), v38)),  v40,  *(int8x16_t *)(v36 + 49));
            *(int8x16_t *)(v41 + 33) = vbslq_s8( (int8x16_t)vcgtq_u8(v39, (uint8x16_t)vaddq_s8(*(int8x16_t *)(v36 + 33), v38)),  v40,  *(int8x16_t *)(v36 + 33));
            *(int8x16_t *)(v41 + 49) = v48;
            if (v46 != 64)
            {
              int8x16_t v49 = vbslq_s8( (int8x16_t)vcgtq_u8(v39, (uint8x16_t)vaddq_s8(*(int8x16_t *)(v36 + 81), v38)),  v40,  *(int8x16_t *)(v36 + 81));
              *(int8x16_t *)(v41 + 65) = vbslq_s8( (int8x16_t)vcgtq_u8(v39, (uint8x16_t)vaddq_s8(*(int8x16_t *)(v36 + 65), v38)),  v40,  *(int8x16_t *)(v36 + 65));
              *(int8x16_t *)(v41 + 81) = v49;
              if (v46 != 96)
              {
                int8x16_t v50 = vbslq_s8( (int8x16_t)vcgtq_u8(v39, (uint8x16_t)vaddq_s8(*(int8x16_t *)(v36 + 113), v38)),  v40,  *(int8x16_t *)(v36 + 113));
                *(int8x16_t *)(v41 + 97) = vbslq_s8( (int8x16_t)vcgtq_u8( v39,  (uint8x16_t)vaddq_s8(*(int8x16_t *)(v36 + 97), v38)),  v40,  *(int8x16_t *)(v36 + 97));
                *(int8x16_t *)(v41 + 113) = v50;
                if (v46 != 128)
                {
                  int8x16_t v51 = vbslq_s8( (int8x16_t)vcgtq_u8(v39, (uint8x16_t)vaddq_s8(*(int8x16_t *)(v36 + 145), v38)),  v40,  *(int8x16_t *)(v36 + 145));
                  *(int8x16_t *)(v41 + 129) = vbslq_s8( (int8x16_t)vcgtq_u8( v39,  (uint8x16_t)vaddq_s8(*(int8x16_t *)(v36 + 129), v38)),  v40,  *(int8x16_t *)(v36 + 129));
                  *(int8x16_t *)(v41 + 145) = v51;
                  if (v46 != 160)
                  {
                    int8x16_t v52 = vbslq_s8( (int8x16_t)vcgtq_u8(v39, (uint8x16_t)vaddq_s8(*(int8x16_t *)(v36 + 177), v38)),  v40,  *(int8x16_t *)(v36 + 177));
                    *(int8x16_t *)(v41 + 161) = vbslq_s8( (int8x16_t)vcgtq_u8( v39,  (uint8x16_t)vaddq_s8(*(int8x16_t *)(v36 + 161), v38)),  v40,  *(int8x16_t *)(v36 + 161));
                    *(int8x16_t *)(v41 + 177) = v52;
                    if (v46 != 192)
                    {
                      int8x16_t v53 = vbslq_s8( (int8x16_t)vcgtq_u8(v39, (uint8x16_t)vaddq_s8(*(int8x16_t *)(v36 + 209), v38)),  v40,  *(int8x16_t *)(v36 + 209));
                      *(int8x16_t *)(v41 + 193) = vbslq_s8( (int8x16_t)vcgtq_u8( v39,  (uint8x16_t)vaddq_s8(*(int8x16_t *)(v36 + 193), v38)),  v40,  *(int8x16_t *)(v36 + 193));
                      *(int8x16_t *)(v41 + 209) = v53;
                    }
                  }
                }
              }
            }
          }

          if (v46 == v43) {
            goto LABEL_39;
          }
          if ((v43 & 0x18) == 0)
          {
            uint64_t v45 = v46 | 1;
LABEL_62:
            uint64_t v59 = v43 - v45 + 1;
            v60 = &v41[v45];
            v61 = &v36[v45];
            do
            {
              int v63 = *v61++;
              char v62 = v63;
              *v60++ = v62;
              --v59;
            }

            while (v59);
            goto LABEL_39;
          }
        }

        else
        {
          uint64_t v46 = 0LL;
        }

        uint64_t v54 = v43 & 0xF8;
        uint64_t v55 = v46 - v54;
        v56 = (int8x8_t *)&v41[v46 + 1];
        v57 = (int8x8_t *)&v36[v46 + 1];
        do
        {
          int8x8_t v58 = *v57++;
          *v56++ = vbsl_s8( (int8x8_t)vcgt_u8( (uint8x8_t)0xA1A1A1A1A1A1A1A1LL,  (uint8x8_t)vadd_s8(v58, (int8x8_t)0x8181818181818181LL)),  (int8x8_t)0x2E2E2E2E2E2E2E2ELL,  v58);
          v55 += 8LL;
        }

        while (v55);
        if (v54 != v43)
        {
          uint64_t v45 = v54 | 1;
          goto LABEL_62;
        }
      }

      else
      {
        uint64_t v42 = 1LL;
      }

- (id).cxx_construct
{
  *((_DWORD *)self + 8) = 0;
  return self;
}

@end