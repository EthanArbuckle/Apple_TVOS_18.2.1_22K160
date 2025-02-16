uint64_t pdwriter_open_stream(FILE *a1, uint64_t a2, uint64_t a3)
{
  _DWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  if (!a1) {
    pdwriter_open_stream_cold_1();
  }
  if (!a2) {
    pdwriter_open_stream_cold_1();
  }
  v6 = calloc(1uLL, 0x2C8uLL);
  v7 = (uint64_t)v6;
  if (v6)
  {
    v6[172] = 0;
    *((void *)v6 + 5) = a1;
    json_init((uint64_t)v6, (uint64_t)a1, 0, 2);
    *(void *)(v7 + 696) = -1LL;
    json_start_object(v7);
    json_member_str( v7,  (char)"$schema",  (uint64_t)"https://perfdata.apple.com/schema/draft-03.json",  v8,  v9,  v10,  v11,  v12);
    json_member_str( v7,  (char)"!notice",  (uint64_t)"Please use perfdata.framework (Swift/Objective-C), perfdata.py (Python 2/3), or perfdata.lua (Lua) to parse this data.",  v13,  v14,  v15,  v16,  v17);
    json_member_str(v7, (char)"name", a2, v18, v19, v20, v21, v22);
    json_member_uint(v7, (char)"version", a3, v23, v24, v25, v26, v27);
    emit_curtime_field(v7, (char)"start_date");
    json_member_strf(v7, (char)"generator", "perfdata.framework:perfdata-%s", v28, v29, v30, v31, v32, (char)"121");
    v33 = getenv("PERFDATA_NOTES");
    if (v33) {
      json_member_str(v7, (char)"notes", (uint64_t)v33, v34, v35, v36, v37, v38);
    }
  }

  else
  {
    v39 = *__error();
    fclose(a1);
    *__error() = v39;
  }

  return v7;
}

uint64_t emit_curtime_field(uint64_t a1, char a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  time(&v11);
  v4 = gmtime(&v11);
  strftime(v12, 0x15uLL, "%FT%TZ", v4);
  return json_member_str(a1, a2, (uint64_t)v12, v5, v6, v7, v8, v9);
}

FILE *pdwriter_open(const char *a1, uint64_t a2, uint64_t a3)
{
  result = fopen(a1, "w");
  if (result) {
    return (FILE *)pdwriter_open_stream(result, a2, a3);
  }
  return result;
}

uint64_t pdwriter_open_fd(int a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = fdopen(a1, "w");
  if (v6) {
    return pdwriter_open_stream(v6, a2, a3);
  }
  close(a1);
  return 0LL;
}

uint64_t pdwriter_open_tmp(const char *a1, const char *a2, uint64_t a3, uint64_t a4, char *a5, size_t a6)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  bzero(v23, 0x400uLL);
  unsigned int v11 = pdwriter_name(a1, a2, v23, 0x400uLL);
  if ((v11 & 0x80000000) != 0) {
    return 0LL;
  }
  if (v11 >= 0x401)
  {
LABEL_10:
    v15 = __error();
    uint64_t result = 0LL;
    int *v15 = 22;
    return result;
  }

  bzero(__str, 0x400uLL);
  v12 = getenv("TMPDIR");
  memset(&v21, 0, sizeof(v21));
  if (stat(v12, &v21) || (v21.st_mode & 0x4000) == 0) {
    v12 = 0LL;
  }
  uint64_t v13 = "/tmp";
  if (v12) {
    uint64_t v13 = v12;
  }
  unsigned int v14 = snprintf(__str, 0x400uLL, "%s/%s.XXXXX%s", v13, v23, ".pdj");
  if ((v14 & 0x80000000) != 0) {
    return 0LL;
  }
  if (v14 >= 0x401) {
    goto LABEL_10;
  }
  int v17 = mkstemps(__str, 4);
  if (v17 < 0) {
    return 0LL;
  }
  int v18 = v17;
  if (fchmod(v17, 0x1A4u) == -1)
  {
    int v19 = *__error();
    close(v18);
    unlink(__str);
    v20 = __error();
    uint64_t result = 0LL;
    int *v20 = v19;
  }

  else
  {
    if (a5) {
      strlcpy(a5, __str, a6);
    }
    return pdwriter_open_fd(v18, (uint64_t)v23, a3);
  }

  return result;
}

uint64_t pdwriter_name(const char *a1, const char *a2, char *a3, size_t a4)
{
  if (!a1) {
    pdwriter_open_stream_cold_1();
  }
  if (!a2) {
    pdwriter_open_stream_cold_1();
  }
  if (!a3) {
    pdwriter_open_stream_cold_1();
  }
  size_t v8 = strcspn(a1, " \t\v\n");
  if (v8 == strlen(a1))
  {
    size_t v9 = strcspn(a2, " \t\v\n");
    if (v9 == strlen(a2)) {
      return snprintf(a3, a4, "%s.%s", a1, a2);
    }
  }

  *__error() = 22;
  return 0xFFFFFFFFLL;
}

void pdwriter_close(uint64_t a1)
{
  if ((*(void *)(a1 + 696) & 0x8000000000000000LL) == 0) {
    goto LABEL_13;
  }
  int v2 = *(_DWORD *)(a1 + 688);
  if ((v2 - 2) < 2)
  {
    close_measurement(a1, 1);
LABEL_5:
    json_end_array(a1);
    json_end_array(a1);
    goto LABEL_6;
  }

  if (v2 == 1) {
    goto LABEL_5;
  }
LABEL_6:
  if (!*(_BYTE *)(a1 + 705))
  {
    uint64_t v3 = pdwriter_defer(a1, 0);
    config_emit(v3, v4, v5, v6, v7, v8, v9, v10);
    *(_BYTE *)(a1 + 705) = 1;
  }

  emit_curtime_field(a1, (char)"end_date");
  for (uint64_t i = 0LL; i != 640; i += 80LL)
  {
    uint64_t v12 = a1 + i;
    pddefer_flush(a1 + i + 48, a1, 1);
    if (*(_BYTE *)(a1 + i + 121))
    {
      json_destroy(v12 + 56);
      fclose(*(FILE **)(a1 + i + 48));
      free(*(void **)(v12 + 104));
    }
  }

  json_end_object(a1);
  json_destroy(a1);
LABEL_13:
  fclose(*(FILE **)(a1 + 40));
  free((void *)a1);
}

void close_measurement(uint64_t a1, int a2)
{
  if (a2) {
    json_end_object(a1);
  }
}

uint64_t pdwriter_defer(uint64_t a1, unsigned int a2)
{
  uint64_t v3 = a2;
  uint64_t v4 = a1 + 80LL * a2;
  int v6 = *(unsigned __int8 *)(v4 + 121);
  uint64_t v5 = (_BYTE *)(v4 + 121);
  if (!v6)
  {
    uint64_t v7 = a1 + 80LL * a2;
    *(void *)(v7 + 96) = pddconfigs[2 * a2];
    uint64_t v8 = open_memstream((char **)(v7 + 104), (size_t *)(v7 + 112));
    *(void *)(v7 + 48) = v8;
    if (!v8) {
      pdwriter_open_stream_cold_1();
    }
    uint64_t v9 = a1 + 80LL * v3;
    uint64_t v10 = (char *)&pddconfigs[2 * v3];
    json_init(v9 + 56, (uint64_t)v8, *((_DWORD *)v10 + 2), 2);
    *(_BYTE *)(v9 + 120) = v10[12];
    *uint64_t v5 = 1;
  }

  return a1 + 80LL * v3 + 56;
}

uint64_t pdwriter_flush(uint64_t result)
{
  if ((*(void *)(result + 696) & 0x8000000000000000LL) == 0) {
    return result;
  }
  uint64_t v1 = result;
  *(void *)(result + 696) = ftello(*(FILE **)(result + 40));
  __int128 v2 = *(_OWORD *)(v1 + 16);
  v13[0] = *(_OWORD *)v1;
  v13[1] = v2;
  uint64_t v14 = *(void *)(v1 + 32);
  int v3 = *(_DWORD *)(v1 + 688);
  if ((v3 - 2) < 2)
  {
    close_measurement(v1, 0);
    json_end_object((uint64_t)v13);
LABEL_5:
    json_end_array((uint64_t)v13);
    json_end_array((uint64_t)v13);
    goto LABEL_6;
  }

  if (v3 == 1) {
    goto LABEL_5;
  }
LABEL_6:
  if (!*(_BYTE *)(v1 + 705))
  {
    uint64_t v4 = pdwriter_defer(v1, 0);
    config_emit(v4, v5, v6, v7, v8, v9, v10, v11);
    *(_BYTE *)(v1 + 705) = 1;
  }

  emit_curtime_field((uint64_t)v13, (char)"end_date");
  for (uint64_t i = 0LL; i != 640; i += 80LL)
  {
    if (*(_BYTE *)(v1 + i + 121)) {
      pddefer_flush(v1 + i + 48, (uint64_t)v13, 0);
    }
  }

  json_end_object((uint64_t)v13);
  return fflush(*(FILE **)(v1 + 40));
}

void pddefer_flush(uint64_t a1, uint64_t a2, int a3)
{
  if (*(_BYTE *)(a1 + 73) && ftello(*(FILE **)a1) >= 1)
  {
    fflush(*(FILE **)a1);
    uint64_t v12 = *(void *)(a1 + 48);
    if (v12)
    {
      if (*(_BYTE *)(a1 + 72)) {
        json_member_start_array(a2, v12, v6, v7, v8, v9, v10, v11);
      }
      else {
        json_member_start_object(a2, v12, v6, v7, v8, v9, v10, v11);
      }
      json_printf(a2, "\n%*s", *(_DWORD *)(a1 + 40) * *(_DWORD *)(a2 + 36), " ");
    }

    else
    {
      json_comma(a2);
    }

    fwrite(*(const void **)(a1 + 56), *(void *)(a1 + 64), 1uLL, *(FILE **)a2);
    if (!*(void *)(a1 + 48))
    {
LABEL_12:
      if (!a3) {
        return;
      }
      goto LABEL_13;
    }

    if (*(_BYTE *)(a1 + 72))
    {
      json_end_array(a2);
      goto LABEL_12;
    }

    json_end_object(a2);
    if (a3)
    {
LABEL_13:
      json_reset(a1 + 8);
      rewind(*(FILE **)a1);
    }
  }
}

uint64_t pdwriter_set_description(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = pdwriter_defer(a1, 0);
  return json_member_str(v3, (char)"description", a2, v4, v5, v6, v7, v8);
}

uint64_t pdwriter_start_extension(uint64_t a1, char a2)
{
  if (*(_BYTE *)(a1 + 704)) {
    pdwriter_start_extension_cold_1();
  }
  *(_BYTE *)(a1 + 704) = 1;
  uint64_t v3 = pdwriter_defer(a1, 1u);
  json_member_start_object(v3, a2, v4, v5, v6, v7, v8, v9);
  return v3;
}

uint64_t pdwriter_end_extension(uint64_t a1, uint64_t a2)
{
  if (!*(_BYTE *)(a1 + 704)) {
    pdwriter_end_extension_cold_1();
  }
  if (pdwriter_defer(a1, 1u) != a2) {
    pdwriter_open_stream_cold_1();
  }
  *(_BYTE *)(a1 + 704) = 0;
  uint64_t v3 = pdwriter_defer(a1, 1u);
  return json_end_object(v3);
}

uint64_t pdwriter_apply_variable_str(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v5 = pdwriter_defer(a1, 7u);
  return json_member_str(v5, a2, a3, v6, v7, v8, v9, v10);
}

uint64_t pdwriter_apply_variable_dbl(uint64_t a1, char a2, double a3)
{
  uint64_t v5 = pdwriter_defer(a1, 7u);
  return json_member_dbl(v5, a2, v6, v7, v8, v9, v10, v11, a3);
}

uint64_t pdwriter_set_primary_metric(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = pdwriter_defer(a1, 0);
  return json_member_str(v3, (char)"primary_metric", a2, v4, v5, v6, v7, v8);
}

uint64_t pdwriter_new_value( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9)
{
  if (!a1) {
    pdwriter_open_stream_cold_1();
  }
  if (!a2) {
    pdwriter_open_stream_cold_1();
  }
  if (!a3) {
    pdwriter_open_stream_cold_1();
  }
  new_measurement(a1, a2, a3, a4, a5, a6, a7, a8);
  json_member_dbl(a1, (char)"value", v11, v12, v13, v14, v15, v16, a9);
  return json_multiline(a1);
}

uint64_t new_measurement( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  off_t v11 = *(void *)(a1 + 696);
  if ((v11 & 0x8000000000000000LL) == 0)
  {
    fseeko(*(FILE **)(a1 + 40), v11, 0);
    *(void *)(a1 + 696) = -1LL;
  }

  int v12 = *(_DWORD *)(a1 + 688);
  if ((v12 - 2) >= 2)
  {
    if (!v12)
    {
      json_member_start_array(a1, (char)"data", a3, a4, a5, a6, a7, a8);
      json_start_array(a1);
    }
  }

  else
  {
    close_measurement(a1, 1);
  }

  *(_DWORD *)(a1 + 688) = 2;
  json_start_object(a1);
  json_member_str(a1, (char)"metric", a2, v13, v14, v15, v16, v17);
  json_oneline(a1);
  uint64_t result = json_member_str(a1, (char)"unit", a3, v18, v19, v20, v21, v22);
  *(_DWORD *)(a1 + 688) = 2;
  return result;
}

uint64_t pdwriter_record_variable_str(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v6 = pdwriter_defer(a1, 2u);
  return json_member_str(v6, a2, a3, v7, v8, v9, v10, v11);
}

uint64_t check_measurement(uint64_t result)
{
  if ((*(_DWORD *)(result + 688) & 0xFFFFFFFE) != 2) {
    check_measurement_cold_1();
  }
  uint64_t v1 = result;
  off_t v2 = *(void *)(result + 696);
  if ((v2 & 0x8000000000000000LL) == 0)
  {
    uint64_t result = fseeko(*(FILE **)(result + 40), v2, 0);
    *(void *)(v1 + 696) = -1LL;
  }

  return result;
}

uint64_t pdwriter_record_variable_dbl(uint64_t a1, char a2, double a3)
{
  uint64_t v6 = pdwriter_defer(a1, 2u);
  return json_member_dbl(v6, a2, v7, v8, v9, v10, v11, v12, a3);
}

uint64_t pdwriter_record_label_str(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v6 = pdwriter_defer(a1, 3u);
  return json_member_str(v6, a2, a3, v7, v8, v9, v10, v11);
}

uint64_t pdwriter_record_label_dbl(uint64_t a1, char a2, double a3)
{
  uint64_t v6 = pdwriter_defer(a1, 3u);
  return json_member_dbl(v6, a2, v7, v8, v9, v10, v11, v12, a3);
}

uint64_t pdwriter_record_tag(uint64_t a1, char *a2)
{
  if (pdtag_summary != a2 && pdtag_context != a2) {
    pdwriter_record_tag_cold_1();
  }
  uint64_t v5 = pdwriter_defer(a1, 4u);
  return json_value_str(v5, (char)a2, v6, v7, v8, v9, v10, v11);
}

uint64_t pdwriter_record_larger_better(uint64_t a1)
{
  return json_member_BOOL(a1, (char)"larger_better", 1LL, v2, v3, v4, v5, v6);
}

uint64_t pdwriter_new_group(uint64_t result)
{
  uint64_t v1 = result;
  off_t v2 = *(void *)(result + 696);
  if ((v2 & 0x8000000000000000LL) == 0)
  {
    uint64_t result = fseeko(*(FILE **)(result + 40), v2, 0);
    *(void *)(v1 + 696) = -1LL;
  }

  if ((*(_DWORD *)(v1 + 688) & 0xFFFFFFFE) == 2)
  {
    close_measurement(v1, 1);
    json_end_array(v1);
    uint64_t result = json_start_array(v1);
    *(_DWORD *)(v1 + 688) = 1;
  }

  return result;
}

uint64_t pdwriter_new_stats( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(_DWORD *)(a1 + 688) = 3;
  json_member_dbl(a1, (char)"samples", v10, v11, v12, v13, v14, v15, (double)(unint64_t)a4);
  return json_multiline(a1);
}

uint64_t pdwriter_record_range(uint64_t a1, double a2, double a3)
{
  return json_member_dbl(a1, (char)"maximum", v12, v13, v14, v15, v16, v17, a3);
}

uint64_t check_stats(uint64_t result)
{
  if (*(_DWORD *)(result + 688) != 3) {
    check_stats_cold_1();
  }
  uint64_t v1 = result;
  off_t v2 = *(void *)(result + 696);
  if ((v2 & 0x8000000000000000LL) == 0)
  {
    uint64_t result = fseeko(*(FILE **)(result + 40), v2, 0);
    *(void *)(v1 + 696) = -1LL;
  }

  return result;
}

uint64_t pdwriter_record_mean(uint64_t a1, double a2, double a3)
{
  return json_member_dbl(a1, (char)"std_dev", v12, v13, v14, v15, v16, v17, a3);
}

uint64_t pdwriter_record_median(uint64_t a1, double a2)
{
  return json_member_dbl(a1, (char)"median", v4, v5, v6, v7, v8, v9, a2);
}

uint64_t pdwriter_record_percentile(uint64_t a1, double a2, double a3)
{
  if (a2 < 0.0 || a2 > 100.0) {
    pdwriter_open_stream_cold_1();
  }
  check_stats(a1);
  uint64_t v7 = pdwriter_defer(a1, 5u);
  json_start_object(v7);
  json_oneline(v7);
  json_member_dbl(v7, (char)"%", v8, v9, v10, v11, v12, v13, a2);
  json_member_dbl(v7, (char)"value", v14, v15, v16, v17, v18, v19, a3);
  return json_end_object(v7);
}

uint64_t pdwriter_record_bucket( uint64_t a1, unint64_t a2, char *a3, double a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  uint64_t v14 = pdwriter_defer(a1, 6u);
  json_start_object(v14);
  json_oneline(v14);
  json_member_dbl(v14, (char)">=", v15, v16, v17, v18, v19, v20, a4);
  json_member_dbl(v14, (char)"count", v21, v22, v23, v24, v25, v26, (double)a2);
  if (a3) {
    json_member_strvf(v14, (char)"label", a3, &a10, v27, v28, v29, v30);
  }
  return json_end_object(v14);
}

uint64_t OUTLINED_FUNCTION_0()
{
  return _os_assert_log();
}

uint64_t config_emit( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v191 = *MEMORY[0x1895F89C0];
  json_member_start_object(a1, (char)"configuration", a3, a4, a5, a6, a7, a8);
  emit_sysctl_str(a1, (char)"device_type", v9, v10, v11, v12, v13, v14, 6, 0, 2);
  uint64_t v15 = (const __CFString *)MGCopyAnswer();
  if (!v15 || (v16 = v15, CFTypeID v17 = CFGetTypeID(v15), v17 != CFStringGetTypeID())) {
    config_emit_cold_1();
  }
  CFIndex Length = CFStringGetLength(v16);
  CFIndex v19 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  uint64_t v20 = (char *)malloc(v19);
  if (!v20) {
    pdwriter_open_stream_cold_1();
  }
  uint64_t v21 = v20;
  if (!CFStringGetCString(v16, v20, v19, 0x8000100u)) {
    pdwriter_open_stream_cold_1();
  }
  json_member_str(a1, (char)"product_type", (uint64_t)v21, v22, v23, v24, v25, v26);
  CFRelease(v16);
  free(v21);
  emit_sysctlbyname_num(a1, (char)"cpu_type", "hw.cputype");
  emit_sysctlbyname_num(a1, (char)"cpu_subtype", "hw.cpusubtype");
  emit_sysctlbyname_num(a1, (char)"cpu_family", "hw.cpufamily");
  emit_sysctlany_str(a1, (char)"cpu_brand_string", 0, 0LL, "machdep.cpu.brand_string");
  emit_sysctlbyname_num(a1, (char)"logical_cpus", "hw.logicalcpu_max");
  emit_sysctlbyname_num(a1, (char)"physical_cpus", "hw.physicalcpu_max");
  uint64_t v27 = IOServiceMatching("AppleARMPE");
  io_service_t MatchingService = IOServiceGetMatchingService(0, v27);
  uint64_t v29 = (CFAllocatorRef *)MEMORY[0x189604DB0];
  if (MatchingService)
  {
    uint64_t v30 = (void *)IORegistryEntrySearchCFProperty( MatchingService,  "IOService",  @"chip-revision",  (CFAllocatorRef)*MEMORY[0x189604DB0],  1u);
    v31 = v30;
    if (v30 && [v30 length])
    {
      strcpy((char *)&out, "A0");
      unsigned __int8 v32 = *(_BYTE *)[v31 bytes];
      LOBYTE(out.f_bsize) = (v32 >> 4) + 65;
      BYTE1(out.f_bsize) = v32 & 0xF | 0x30;
      json_member_str(a1, (char)"chip_revision", (uint64_t)&out, v33, v34, v35, v36, v37);
    }
  }

  uint64_t v38 = IORegistryEntryFromPath(0, "IODeviceTree:/chosen");
  if ((_DWORD)v38)
  {
    uint64_t v46 = v38;
    *(void *)uuid_t uu = 0LL;
    LODWORD(v188.tv_sec) = 8;
    memset(&out, 0, 128);
    int v187 = 128;
    int v187 = 128;
    IOObjectRelease(v46);
  }

  emit_sysctl_num(a1, v39, v40, v41, v42, v43, v44, v45, 6, 0, 7);
  emit_sysctlbyname_num(a1, (char)"vm_pagesize", "vm.pagesize");
  emit_sysctlbyname_num(a1, (char)"vm_pages", "vm.pages");
  emit_sysctlbyname_num(a1, (char)"max_vnodes", "kern.maxvnodes");
  emit_sysctl_str(a1, (char)"kernel_version", v63, v64, v65, v66, v67, v68, 1, 0, 4);
  emit_sysctl_str(a1, (char)"build", v69, v70, v71, v72, v73, v74, 1, 0, 65);
  [MEMORY[0x189603F80] inputStreamWithFileAtPath:@"/System/Library/CoreServices/SystemVersion.plist"];
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v75;
  if (v75)
  {
    [v75 open];
    [MEMORY[0x1896079E8] propertyListWithStream:v76 options:0 format:0 error:0];
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    if (v77)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        [v77 objectForKeyedSubscript:@"ReleaseType"];
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = v78;
        if (v78)
        {
          uint64_t v80 = [v78 UTF8String];
          json_member_str(a1, (char)"release_type", v80, v81, v82, v83, v84, v85);
        }
      }
    }

    [v76 close];
  }

  uint64_t v86 = os_variant_copy_description();
  if (v86)
  {
    v92 = (void *)v86;
    json_member_str(a1, (char)"os_variant", v86, v87, v88, v89, v90, v91);
    free(v92);
  }

  emit_sysctlbyname_BOOL(a1, (char)"thread_groups_supported", "kern.thread_groups_supported");
  emit_sysctlany_str(a1, (char)"boot_args", 0, 0LL, "kern.bootargs");
  emit_sysctlbyname_BOOL(a1, (char)"kernel_link_time_optimized", "kern.link_time_optimized");
  if (os_variant_allows_internal_security_policies())
  {
    getpid();
    v186 = "hw.uuid";
    if (!sandbox_check())
    {
      timespec v188 = (timespec)xmmword_1863F47C0;
      if (!gethostuuid(uu, &v188) && !uuid_is_null(uu))
      {
        uuid_unparse(uu, (char *)&out);
        json_member_str(a1, (char)"device_uuid", (uint64_t)&out, v93, v94, v95, v96, v97);
      }
    }
  }

  if (statfs("/", &out)) {
    pdwriter_open_stream_cold_1();
  }
  if (!is_mul_ok(out.f_bsize, out.f_blocks)) {
    pdwriter_open_stream_cold_1();
  }
  json_member_dbl(a1, (char)"rootvol_size", v98, v99, v100, v101, v102, v103, (double)(out.f_bsize * out.f_blocks));
  v104 = strrchr(out.f_mntfromname, 47);
  v105 = IOBSDNameMatching(0, 0, v104 + 1);
  io_service_t v106 = IOServiceGetMatchingService(0, v105);
  if (v106)
  {
    io_registry_entry_t v107 = v106;
    v108 = *v29;
    v109 = (void *)IORegistryEntrySearchCFProperty(v106, "IOService", @"Device Characteristics", *v29, 3u);
    v110 = v109;
    if (v109)
    {
      [v109 objectForKeyedSubscript:@"Medium Type"];
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v112 = [v111 isEqualToString:@"Solid State"];
      json_member_BOOL(a1, (char)"rootvol_ssd", v112, v113, v114, v115, v116, v117);
    }

    v118 = (void *)IORegistryEntrySearchCFProperty(v107, "IOService", @"APFSComposited", v108, 3u);
    v124 = v118;
    if (v118) {
      uint64_t v125 = [v118 BOOLValue];
    }
    else {
      uint64_t v125 = 0LL;
    }
    json_member_BOOL(a1, (char)"rootvol_fusion", v125, v119, v120, v121, v122, v123);
  }

  uint64_t v126 = dyld_shared_cache_some_image_overridden();
  json_member_BOOL(a1, (char)"dsc_overriding_images_present", v126, v127, v128, v129, v130, v131);
  uint64_t v132 = _dyld_shared_cache_optimized();
  json_member_BOOL(a1, (char)"dsc_optimized", v132, v133, v134, v135, v136, v137);
  json_member_BOOL(a1, (char)"metadata_indexing_enabled", 0LL, v138, v139, v140, v141, v142);
  *(void *)&out.f_bsize = 0LL;
  if (!IOPSCopyPowerSourcesByTypePrecise())
  {
    if (*(void *)&out.f_bsize)
    {
      v143 = IOPSCopyPowerSourcesList(*(CFTypeRef *)&out.f_bsize);
      if (v143)
      {
        v144 = v143;
        CFIndex Count = CFArrayGetCount(v143);
        json_member_uint(a1, (char)"battery_count", Count, v146, v147, v148, v149, v150);
        ValueAtIndex = CFArrayGetValueAtIndex(v144, 0LL);
        IOPSGetPowerSourceDescription(*(CFTypeRef *)&out.f_bsize, ValueAtIndex);
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        [v152 objectForKeyedSubscript:@"Battery Service State"];
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        v154 = v153;
        if (v153)
        {
          int v155 = [v153 intValue];
          json_member_BOOL(a1, (char)"battery_service_needed", v155 != 0, v156, v157, v158, v159, v160);
          else {
            v166 = emit_battery_health_state_names[v155 + 1];
          }
          json_member_str(a1, (char)"battery_service_state", (uint64_t)v166, v161, v162, v163, v164, v165);
        }

        objc_msgSend(v152, "objectForKeyedSubscript:", @"Maximum Capacity Percent", v186);
        v167 = (void *)objc_claimAutoreleasedReturnValue();
        v168 = v167;
        if (v167)
        {
          uint64_t v169 = [v167 unsignedIntValue];
          json_member_uint(a1, (char)"battery_max_capacity_percent", v169, v170, v171, v172, v173, v174);
        }

        if (MEMORY[0x1896137C8]) {
          BOOL v175 = MEMORY[0x1896137D8] == 0LL;
        }
        else {
          BOOL v175 = 1;
        }
        if (!v175 && MEMORY[0x1896137D0] != 0LL)
        {
          v177 = IOServiceMatching("AppleSMC");
          io_service_t v178 = IOServiceGetMatchingService(0, v177);
          if (v178)
          {
            io_object_t v179 = v178;
            if (SMCOpenConnection())
            {
              SMCCloseConnection();
            }

            IOObjectRelease(v179);
          }
        }
      }
    }
  }

  return json_end_object(a1);
}

uint64_t emit_sysctlbyname_num(uint64_t a1, char a2, char *a3)
{
  unint64_t v12 = 0LL;
  size_t v13 = 4LL;
  uint64_t result = sysctlbyname(a3, &v12, &v13, 0LL, 0LL);
  if (!(_DWORD)result) {
    return json_member_dbl(a1, a2, v6, v7, v8, v9, v10, v11, (double)v12);
  }
  return result;
}

uint64_t emit_sysctl_num( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int a10, int a11)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  v20[0] = 4LL;
  int v23 = 0;
  uint64_t v22 = 0LL;
  v19[1] = &a9;
  v21[0] = a9;
  v21[1] = a11;
  v19[0] = 0LL;
  uint64_t result = sysctl(v21, 2u, v19, v20, 0LL, 0LL);
  if (!(_DWORD)result) {
    return json_member_dbl(a1, (char)"hw_pagesize", v13, v14, v15, v16, v17, v18, (double)v19[0]);
  }
  return result;
}

void emit_sysctl_str( uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int a10, int a11)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  int v13 = 0;
  uint64_t v12 = 0LL;
  v11[0] = a9;
  v11[1] = a11;
  emit_sysctlany_str(a1, a2, 2u, v11, 0LL);
}

uint64_t emit_sysctlbyname_BOOL(uint64_t a1, char a2, char *a3)
{
  int v12 = 0;
  size_t v11 = 4LL;
  uint64_t result = sysctlbyname(a3, &v12, &v11, 0LL, 0LL);
  if (!(_DWORD)result) {
    return json_member_BOOL(a1, a2, v12 != 0, v6, v7, v8, v9, v10);
  }
  return result;
}

void emit_sysctlany_str(uint64_t a1, char a2, u_int a3, int *a4, char *a5)
{
  size_t v22 = 0LL;
  if (a5) {
    sysctlbyname(a5, 0LL, &v22, 0LL, 0LL);
  }
  else {
    sysctl(a4, a3, 0LL, &v22, 0LL, 0LL);
  }
  if (v22)
  {
    uint64_t v15 = malloc(v22 + 1);
    if (!v15) {
      pdwriter_open_stream_cold_1();
    }
    uint64_t v16 = v15;
    if (a5)
    {
      if (sysctlbyname(a5, v15, &v22, 0LL, 0LL))
      {
LABEL_9:
        free(v16);
        return;
      }
    }

    else if (sysctl(a4, a3, v15, &v22, 0LL, 0LL))
    {
      goto LABEL_9;
    }

    *((_BYTE *)v16 + v22) = 0;
    json_member_str(a1, a2, (uint64_t)v16, v17, v18, v19, v20, v21);
    goto LABEL_9;
  }

  json_member_str(a1, a2, (uint64_t)&unk_1863F4C7E, v10, v11, v12, v13, v14);
}

_BYTE *pdunit_create(const char *a1)
{
  size_t v2 = strlen(a1);
  uint64_t v3 = calloc(v2 + 2, 1uLL);
  uint64_t v4 = v3;
  if (v3)
  {
    *uint64_t v3 = 35;
    strlcpy(v3 + 1, a1, v2 + 1);
  }

  return v4;
}

void pdunit_destroy(void *a1)
{
  if (a1) {
    free(a1);
  }
}

char *json_init(uint64_t a1, uint64_t a2, int a3, int a4)
{
  *(void *)a1 = a2;
  *(_DWORD *)(a1 + 32) = a3;
  *(_DWORD *)(a1 + 36) = a4;
  *(_WORD *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 28) = a3;
  uint64_t v5 = new_printf_domain();
  *(void *)(a1 + 8) = v5;
  if (!v5) {
    pdwriter_open_stream_cold_1();
  }
  if (register_printf_domain_function( v5,  115,  (printf_function *)json_printf_s,  (printf_arginfo_function *)json_printf_s_arginfo,  0LL))
  {
    pdwriter_open_stream_cold_1();
  }

  *(void *)(a1 + 16) = newlocale(2, "UTF-8", 0LL);
  return setlocale(2, "UTF-8");
}

uint64_t json_reset(uint64_t result)
{
  *(_WORD *)(result + 24) = 0;
  *(_DWORD *)(result + 28) = *(_DWORD *)(result + 32);
  return result;
}

uint64_t json_printf_s()
{
  uint64_t v0 = MEMORY[0x1895F8858]();
  uint64_t v2 = v1;
  uint64_t v3 = (FILE *)v0;
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t v5 = **v4;
  size_t v6 = strlen(v5);
  int v7 = *(_DWORD *)(v2 + 24);
  if (!v6) {
    return fprintf_l(v3, *(locale_t *)(v2 + 8), "%*s", *(_DWORD *)(v2 + 24), (const char *)&unk_1863F4C7E);
  }
  unint64_t v8 = v6;
  LODWORD(v9) = 0;
  while (1)
  {
    size_t v10 = v8 >= 0x400 ? 1024LL : v8;
    if (strsnvisx(v13, 0x1001uLL, v5, v10, 66, "\\\b\f\n\r\t") == -1) {
      break;
    }
    int v11 = fprintf_l(v3, *(locale_t *)(v2 + 8), "%*s", v7, v13);
    if (v11 == -1) {
      break;
    }
    uint64_t v9 = (v11 + v9);
    v5 += v10;
    v8 -= v10;
    if (!v8) {
      return v9;
    }
  }

  return 0xFFFFFFFFLL;
}

uint64_t json_printf_s_arginfo(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (a2) {
    *a3 = 8;
  }
  return 1LL;
}

uint64_t json_destroy(uint64_t a1)
{
  return freelocale(*(locale_t *)(a1 + 16));
}

uint64_t json_printf(uint64_t a1, char *__format, ...)
{
  return vfxprintf(*(FILE **)a1, *(printf_domain_t *)(a1 + 8), *(locale_t *)(a1 + 16), __format, va);
}

uint64_t json_start_object(uint64_t a1)
{
  uint64_t result = json_printf(a1, "%s", "{");
  ++*(_DWORD *)(a1 + 28);
  *(_WORD *)(a1 + 24) = 256;
  return result;
}

uint64_t json_end_object(uint64_t a1)
{
  unsigned int v1 = *(_DWORD *)(a1 + 28);
  if (v1 <= *(_DWORD *)(a1 + 32)) {
    pdwriter_open_stream_cold_1();
  }
  *(_DWORD *)(a1 + 28) = v1 - 1;
  if (*(_BYTE *)(a1 + 26)) {
    json_printf(a1, " ");
  }
  else {
    json_printf(a1, "\n%*s");
  }
  uint64_t result = json_printf(a1, "%s", "}");
  *(_BYTE *)(a1 + 26) = 0;
  *(_WORD *)(a1 + 24) = 1;
  return result;
}

uint64_t json_start_array(uint64_t a1)
{
  uint64_t result = json_printf(a1, "%s", "[");
  ++*(_DWORD *)(a1 + 28);
  *(_WORD *)(a1 + 24) = 256;
  return result;
}

uint64_t json_end_array(uint64_t a1)
{
  unsigned int v1 = *(_DWORD *)(a1 + 28);
  if (v1 <= *(_DWORD *)(a1 + 32)) {
    pdwriter_open_stream_cold_1();
  }
  *(_DWORD *)(a1 + 28) = v1 - 1;
  if (*(_BYTE *)(a1 + 26)) {
    json_printf(a1, " ");
  }
  else {
    json_printf(a1, "\n%*s");
  }
  uint64_t result = json_printf(a1, "%s", "]");
  *(_BYTE *)(a1 + 26) = 0;
  *(_WORD *)(a1 + 24) = 1;
  return result;
}

uint64_t json_oneline(uint64_t result)
{
  *(_BYTE *)(result + 26) = 1;
  return result;
}

uint64_t json_multiline(uint64_t result)
{
  *(_BYTE *)(result + 26) = 0;
  return result;
}

uint64_t json_value_strvf(uint64_t a1, char *__format, va_list __ap)
{
  return json_value_raw_internal(a1, 1, __format, __ap);
}

uint64_t json_value_raw_internal(uint64_t a1, int a2, char *__format, va_list __ap)
{
  if (a2)
  {
    json_printf(a1, "");
    vfxprintf(*(FILE **)a1, *(printf_domain_t *)(a1 + 8), *(locale_t *)(a1 + 16), __format, __ap);
    uint64_t result = json_printf(a1, "");
  }

  else
  {
    uint64_t result = vfxprintf(*(FILE **)a1, *(printf_domain_t *)(a1 + 8), *(locale_t *)(a1 + 16), __format, __ap);
  }

  *(_BYTE *)(a1 + 24) = 1;
  return result;
}

uint64_t json_value_strf( uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return json_value_raw_internal(a1, 1, a2, &a9);
}

uint64_t json_comma(uint64_t result)
{
  uint64_t v1 = result;
  if (*(_BYTE *)(result + 25))
  {
    if (*(_BYTE *)(result + 26)) {
      uint64_t result = json_printf(result, " ");
    }
    else {
      uint64_t result = json_printf(result, "\n%*s");
    }
    *(_BYTE *)(v1 + 25) = 0;
  }

  if (*(_BYTE *)(v1 + 24))
  {
    json_printf(v1, ",");
    if (*(_BYTE *)(v1 + 26)) {
      return json_printf(v1, " ");
    }
    else {
      return json_printf(v1, "\n%*s", *(_DWORD *)(v1 + 36) * *(_DWORD *)(v1 + 28), (const char *)&unk_1863F4C7E);
    }
  }

  return result;
}

uint64_t json_value_dbl( uint64_t a1, double a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (fabs(a2) == INFINITY) {
    pdwriter_open_stream_cold_1();
  }
  return json_value_raw(a1, 0LL, "%.17g", a5, a6, a7, a8, a9, SLOBYTE(a2));
}

uint64_t json_value_raw( uint64_t a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t result = vfxprintf(*(FILE **)a1, *(printf_domain_t *)(a1 + 8), *(locale_t *)(a1 + 16), a3, &a9);
  *(_BYTE *)(a1 + 24) = 1;
  return result;
}

uint64_t json_value_int( uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return json_value_raw(a1, 0LL, "%d", a4, a5, a6, a7, a8, a2);
}

uint64_t json_value_uint( uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return json_value_raw(a1, 0LL, "%u", a4, a5, a6, a7, a8, a2);
}

uint64_t json_value_BOOL( uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v8 = "false";
  if (a2) {
    unint64_t v8 = "true";
  }
  return json_value_raw(a1, 0LL, "%s", a4, a5, a6, a7, a8, (char)v8);
}

uint64_t json_value_str( uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return json_value_strf(a1, "%s", a3, a4, a5, a6, a7, a8, a2);
}

uint64_t json_key( uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = json_printf(a1, ": ");
  *(_BYTE *)(a1 + 24) = 0;
  return result;
}

uint64_t json_member_str( uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8 = a3;
  json_value_strf(a1, "%s", a3, a4, a5, a6, a7, a8, a2);
  json_printf(a1, ": ");
  *(_BYTE *)(a1 + 24) = 0;
  return json_value_strf(a1, "%s", v10, v11, v12, v13, v14, v15, v8);
}

uint64_t json_member_dbl( uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9)
{
  *(_BYTE *)(a1 + 24) = 0;
  return json_value_dbl(a1, a9, v11, v12, v13, v14, v15, v16, v17);
}

uint64_t json_member_int( uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8 = a3;
  json_value_strf(a1, "%s", a3, a4, a5, a6, a7, a8, a2);
  json_printf(a1, ": ");
  *(_BYTE *)(a1 + 24) = 0;
  return json_value_raw(a1, 0LL, "%d", v10, v11, v12, v13, v14, v8);
}

uint64_t json_member_uint( uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8 = a3;
  json_value_strf(a1, "%s", a3, a4, a5, a6, a7, a8, a2);
  json_printf(a1, ": ");
  *(_BYTE *)(a1 + 24) = 0;
  return json_value_raw(a1, 0LL, "%u", v10, v11, v12, v13, v14, v8);
}

uint64_t json_member_BOOL( uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a3;
  json_value_strf(a1, "%s", a3, a4, a5, a6, a7, a8, a2);
  json_printf(a1, ": ");
  *(_BYTE *)(a1 + 24) = 0;
  uint64_t v15 = "false";
  if (v8) {
    uint64_t v15 = "true";
  }
  return json_value_raw(a1, 0LL, "%s", v10, v11, v12, v13, v14, (char)v15);
}

uint64_t json_member_strf( uint64_t a1, char a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return json_member_strvf(a1, a2, a3, &a9, a5, a6, a7, a8);
}

uint64_t json_member_strvf( uint64_t a1, char a2, char *a3, va_list a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(_BYTE *)(a1 + 24) = 0;
  return json_value_raw_internal(a1, 1, a3, a4);
}

uint64_t json_member_start_array( uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(_BYTE *)(a1 + 24) = 0;
  json_comma(a1);
  uint64_t result = json_printf(a1, "%s", "[");
  ++*(_DWORD *)(a1 + 28);
  *(_WORD *)(a1 + 24) = 256;
  return result;
}

uint64_t json_member_start_object( uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(_BYTE *)(a1 + 24) = 0;
  json_comma(a1);
  uint64_t result = json_printf(a1, "%s", "{");
  ++*(_DWORD *)(a1 + 28);
  *(_WORD *)(a1 + 24) = 256;
  return result;
}

uint64_t handle_malformed_data(void *a1, void *a2)
{
  v10[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v3 = (void *)MEMORY[0x189607870];
    uint64_t v9 = *MEMORY[0x1896075E0];
    v10[0] = a2;
    uint64_t v4 = (void *)MEMORY[0x189603F68];
    id v5 = a2;
    [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];
    size_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 errorWithDomain:@"PDError" code:1 userInfo:v6];
    int v7 = (void *)objc_claimAutoreleasedReturnValue();

    *a1 = v7;
  }

  return 0LL;
}

uint64_t not_a_number(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v8 = (id)handle_malformed_data(a2, v6);
    uint64_t v7 = 1LL;
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  return v7;
}

id expect_dictionary(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a4;
  uint64_t v8 = [a1 objectForKeyedSubscript:a2];
  if (!v8)
  {
    uint64_t v9 = (void *)MEMORY[0x189604A60];
    goto LABEL_5;
  }

  uint64_t v9 = (void *)v8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
LABEL_5:
    id v10 = v9;
    uint64_t v9 = v10;
    goto LABEL_6;
  }

  handle_malformed_data(a3, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v10;
}

LABEL_41:
        goto LABEL_42;
      }

      uint64_t v15 = 1;
    }

    else
    {
      uint64_t v16 = (id)handle_malformed_data(a4, @"perfdata data");
      uint64_t v15 = 0;
    }
  }

  else
  {
    uint64_t v15 = 1;
  }

LABEL_43:
  return v15;
}

void sub_1863F214C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

id strip_container_prefix(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)NSString;
  [a1 name];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 stringWithFormat:@"%@.", v5];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ([v3 hasPrefix:v6])
  {
    objc_msgSend( v3,  "substringWithRange:",  objc_msgSend(v6, "length"),  objc_msgSend(v3, "length") - objc_msgSend(v6, "length"));
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v7 = v3;
  }

  uint64_t v8 = v7;

  return v8;
}

id get_metric_filter_metric(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 rangeOfString:@","];
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v3 = v1;
  }

  else
  {
    objc_msgSend(v1, "substringWithRange:", 0, v2);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }

  uint64_t v4 = v3;

  return v4;
}

id get_metric_filter_variables(void *a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  [a1 componentsSeparatedByString:@","];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v3 count] == 1)
  {
    id v4 = (id)MEMORY[0x189604A60];
  }

  else
  {
    objc_msgSend(v3, "subarrayWithRange:", 1, objc_msgSend(v3, "count") - 1);
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    id v6 = (void *)objc_opt_new();
    uint64_t v24 = a2;
    if (get_metric_filter_variables_formatter_once != -1) {
      dispatch_once(&get_metric_filter_variables_formatter_once, &__block_literal_global);
    }
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v27;
      id obj = v7;
      while (2)
      {
        for (uint64_t i = 0LL; i != v9; ++i)
        {
          if (*(void *)v27 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          uint64_t v13 = [v12 rangeOfString:@"="];
          if (v13 == 0x7FFFFFFFFFFFFFFFLL)
          {
            if (v24)
            {
              [NSString stringWithFormat:@"invalid metric filter component: %@", v12];
              uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v21 = (void *)MEMORY[0x189607870];
              uint64_t v30 = *MEMORY[0x1896075E0];
              v31 = v20;
              [MEMORY[0x189603F68] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
              size_t v22 = (void *)objc_claimAutoreleasedReturnValue();
              [v21 errorWithDomain:@"PDError" code:2 userInfo:v22];
              *uint64_t v24 = (id)objc_claimAutoreleasedReturnValue();
            }

            id v7 = obj;

            id v4 = 0LL;
            goto LABEL_20;
          }

          uint64_t v14 = v13;
          objc_msgSend(v12, "substringWithRange:", 0, v13);
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "substringWithRange:", v14 + 1, objc_msgSend(v12, "length") + ~v14);
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v17 = [(id)get_metric_filter_variables_formatter numberFromString:v16];
          uint64_t v18 = (void *)v17;
          if (v17) {
            uint64_t v19 = (void *)v17;
          }
          else {
            uint64_t v19 = v16;
          }
          [v6 setObject:v19 forKeyedSubscript:v15];
        }

        id v7 = obj;
        uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    id v4 = v6;
LABEL_20:
  }

  return v4;
}

uint64_t __get_metric_filter_variables_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x189607978]);
  id v1 = (void *)get_metric_filter_variables_formatter;
  get_metric_filter_variables_formatter = (uint64_t)v0;

  return [(id)get_metric_filter_variables_formatter setNumberStyle:1];
}

LABEL_15:
  return v16;
}

LABEL_26:
    }

    else
    {
      uint64_t v25 = (id)handle_malformed_data(a3, @"measurement histogram");
      size_t v22 = 0;
    }
  }

  else
  {
    size_t v22 = 1;
  }

  return v22;
}

LABEL_27:
  uint64_t v21 = v20 | i;
LABEL_28:

  return v21 & 1;
}

void pdwriter_open_stream_cold_1()
{
}

void pdwriter_start_extension_cold_1()
{
}

void pdwriter_end_extension_cold_1()
{
}

void check_measurement_cold_1()
{
}

void pdwriter_record_tag_cold_1()
{
}

void check_stats_cold_1()
{
}

void config_emit_cold_1()
{
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x189602660](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x189602698](theArray, idx);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x189602D30](cf);
}

void CFRelease(CFTypeRef cf)
{
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1896034F8](theString, buffer, bufferSize, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x189603548](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x189603558](length, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x189603590]();
}

CFMutableDictionaryRef IOBSDNameMatching(mach_port_t mainPort, uint32_t options, const char *bsdName)
{
  return (CFMutableDictionaryRef)MEMORY[0x189607C80](*(void *)&mainPort, *(void *)&options, bsdName);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x189608398](*(void *)&object);
}

uint64_t IOPSCopyPowerSourcesByTypePrecise()
{
  return MEMORY[0x1896083F8]();
}

CFArrayRef IOPSCopyPowerSourcesList(CFTypeRef blob)
{
  return (CFArrayRef)MEMORY[0x189608408](blob);
}

CFDictionaryRef IOPSGetPowerSourceDescription(CFTypeRef blob, CFTypeRef ps)
{
  return (CFDictionaryRef)MEMORY[0x189608428](blob, ps);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x189608488](*(void *)&mainPort, path);
}

kern_return_t IORegistryEntryGetProperty( io_registry_entry_t entry, const io_name_t propertyName, io_struct_inband_t buffer, uint32_t *size)
{
  return MEMORY[0x1896084F0](*(void *)&entry, propertyName, buffer, size);
}

CFTypeRef IORegistryEntrySearchCFProperty( io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x189608520](*(void *)&entry, plane, key, allocator, *(void *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x189608560](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x189608580](name);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1896136F0]();
}

uint64_t SMCCloseConnection()
{
  return MEMORY[0x1896137C8]();
}

uint64_t SMCOpenConnection()
{
  return MEMORY[0x1896137D0]();
}

uint64_t SMCReadKeyAsNumeric()
{
  return MEMORY[0x1896137D8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

uint64_t _dyld_shared_cache_optimized()
{
  return MEMORY[0x1895F8CE8]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x1895F8D68]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1895F8D78]();
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t dyld_shared_cache_some_image_overridden()
{
  return MEMORY[0x1895FB0D8]();
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x1895FB1E0](*(void *)&a1, a2);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1895FB208](a1);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return (FILE *)MEMORY[0x1895FB228](*(void *)&a1, a2);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1895FB268](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1895FB348](__filename, __mode);
}

int fprintf_l(FILE *a1, locale_t a2, const char *a3, ...)
{
  return MEMORY[0x1895FB368](a1, a2, a3);
}

void free(void *a1)
{
}

void free_printf_domain(printf_domain_t __domain)
{
}

int freelocale(locale_t a1)
{
  return MEMORY[0x1895FB3C0](a1);
}

int fseeko(FILE *__stream, off_t a2, int __whence)
{
  return MEMORY[0x1895FB428](__stream, a2, *(void *)&__whence);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x1895FB470](a1);
}

off_t ftello(FILE *__stream)
{
  return MEMORY[0x1895FB478](__stream);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1895FB4C8](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1895FB538](a1);
}

int gethostuuid(uuid_t a1, const timespec *a2)
{
  return MEMORY[0x1895FB598](a1, a2);
}

pid_t getpid(void)
{
  return MEMORY[0x1895FB628]();
}

tm *__cdecl gmtime(const time_t *a1)
{
  return (tm *)MEMORY[0x1895FB720](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

int mkstemps(char *a1, int a2)
{
  return MEMORY[0x1895FBF48](a1, *(void *)&a2);
}

printf_domain_t new_printf_domain(void)
{
  return (printf_domain_t)MEMORY[0x1895FC158]();
}

locale_t newlocale(int a1, const char *a2, locale_t a3)
{
  return (locale_t)MEMORY[0x1895FC160](*(void *)&a1, a2, a3);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1896165D8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x189616700](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x189616730]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x189616738]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x189616740]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x189616820](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x189616968](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616990](a1);
}

FILE *__cdecl open_memstream(char **__bufp, size_t *__sizep)
{
  return (FILE *)MEMORY[0x1895FC260](__bufp, __sizep);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1895FC6A8]();
}

uint64_t os_variant_copy_description()
{
  return MEMORY[0x1895FC6B0]();
}

int register_printf_domain_function( printf_domain_t __domain, int __spec, printf_function *__render, printf_arginfo_function *__arginfo, void *__context)
{
  return MEMORY[0x1895FCCE8](__domain, *(void *)&__spec, __render, __arginfo, __context);
}

void rewind(FILE *a1)
{
}

uint64_t sandbox_check()
{
  return MEMORY[0x1895FCD90]();
}

char *__cdecl setlocale(int a1, const char *a2)
{
  return (char *)MEMORY[0x1895FCE98](*(void *)&a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1895FD010](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1895FD018](a1, a2);
}

size_t strcspn(const char *__s, const char *__charset)
{
  return MEMORY[0x1895FD070](__s, __charset);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x1895FD090](a1, a2, a3, a4);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1895FD0B0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

char *__cdecl strrchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FD120](__s, *(void *)&__c);
}

int strsnvisx(char *a1, size_t a2, const char *a3, size_t a4, int a5, const char *a6)
{
  return MEMORY[0x1895FD138](a1, a2, a3, a4, *(void *)&a5, a6);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1895FD2B0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1895FD2B8](a1, a2, a3, a4, a5);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1895FD400](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x1895FD468](a1);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1895FD4E0](uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

int vfxprintf(FILE *__stream, printf_domain_t __domain, locale_t __loc, const char *__format, va_list __ap)
{
  return MEMORY[0x1895FD538](__stream, __domain, __loc, __format, __ap);
}

uint64_t objc_msgSend_enumerateAggregatedMeasurementsMatchingNullableFilter_ignoringVariables_error_usingBlock_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_enumerateAggregatedMeasurementsMatchingNullableFilter_ignoringVariables_error_usingBlock_);
}