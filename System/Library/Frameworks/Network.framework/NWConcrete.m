@interface NWConcrete
@end

@implementation NWConcrete

uint64_t __37__NWConcrete_nw_activity_description__block_invoke@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v75 = *MEMORY[0x1895F89C0];
  uint64_t v4 = MEMORY[0x189614768];
  uint64_t v5 = MEMORY[0x189614768] + 64LL;
  v6 = (uint64_t *)MEMORY[0x189614738];
  uint64_t v7 = *(void *)(MEMORY[0x189614738] + 8LL);
  uint64_t v8 = *(void *)(MEMORY[0x189614738] + 16LL);
  v73[0] = MEMORY[0x189614768] + 64LL;
  uint64_t v65 = v7;
  *(uint64_t *)((char *)&v65 + *(void *)(v7 - 24)) = v8;
  v9 = (std::ios_base *)((char *)&v65 + *(void *)(v65 - 24));
  std::ios_base::init(v9, &v66);
  v9[1].__vftable = 0LL;
  v9[1].__fmtflags_ = -1;
  uint64_t v65 = v4 + 24;
  v73[0] = v5;
  std::streambuf::basic_streambuf();
  uint64_t v10 = MEMORY[0x189614750];
  uint64_t v66 = MEMORY[0x189614750] + 16LL;
  *(_OWORD *)__p = 0u;
  __int128 v71 = 0u;
  int v72 = 16;
  v64 = 0LL;
  uint64_t v11 = *(void *)(a1 + 32);
  if (*(void *)(v11 + 24))
  {
    asprintf(&v64, " (investigation %llu)", *(void *)(v11 + 24));
    uint64_t v11 = *(void *)(a1 + 32);
  }

  v63 = 0LL;
  v12 = *(const char **)(v11 + 72);
  if (v12)
  {
    asprintf(&v63, " (underlying error %s:%d)", v12, *(_DWORD *)(v11 + 128));
  }

  else
  {
    int v14 = *(_DWORD *)(v11 + 124);
    int v13 = *(_DWORD *)(v11 + 128);
    if (v14 | v13) {
      asprintf(&v63, " (underlying error %d:%d)", v14, v13);
    }
  }

  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(&v65, (uint64_t)"<nw_activity ", 13LL);
  v15 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v15, (uint64_t)":", 1LL);
  v16 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v16, (uint64_t)" [", 2LL);
  else {
    v17 = out;
  }
  size_t v18 = strlen(v17);
  v19 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v16, (uint64_t)v17, v18);
  v20 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v19, (uint64_t)"]", 1LL);
  if ((*(_BYTE *)(*(void *)(a1 + 32) + 140LL) & 2) != 0) {
    v21 = " (lightweight)";
  }
  else {
    v21 = "";
  }
  if ((*(_BYTE *)(*(void *)(a1 + 32) + 140LL) & 2) != 0) {
    uint64_t v22 = 14LL;
  }
  else {
    uint64_t v22 = 0LL;
  }
  v23 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v20, (uint64_t)v21, v22);
  if ((*(_BYTE *)(*(void *)(a1 + 32) + 140LL) & 1) != 0) {
    v24 = " (retry)";
  }
  else {
    v24 = "";
  }
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>( v23,  (uint64_t)v24,  8LL * (*(_BYTE *)(*(void *)(a1 + 32) + 140LL) & 1));
  BOOL is_global_parent = nw_activity_is_global_parent(*(void **)(a1 + 32));
  if (is_global_parent) {
    v26 = " (global parent)";
  }
  else {
    v26 = "";
  }
  if (is_global_parent) {
    uint64_t v27 = 16LL;
  }
  else {
    uint64_t v27 = 0LL;
  }
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v16, (uint64_t)v26, v27);
  v28 = *(void **)(*(void *)(a1 + 32) + 56LL);
  if (v28)
  {
    v29 = v6;
    if (nw_activity_is_global_parent(v28)) {
      v30 = " (parent is global)";
    }
    else {
      v30 = "";
    }
  }

  else
  {
    v29 = v6;
    v30 = "";
  }

  size_t v31 = strlen(v30);
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v16, (uint64_t)v30, v31);
  int is_selected_for_reporting = nw_activity_is_selected_for_reporting(*(void **)(a1 + 32));
  if (is_selected_for_reporting) {
    v33 = " reported";
  }
  else {
    v33 = "";
  }
  if (is_selected_for_reporting) {
    uint64_t v34 = 9LL;
  }
  else {
    uint64_t v34 = 0LL;
  }
  v35 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v16, (uint64_t)v33, v34);
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v35, (uint64_t)" (reporting strategy ", 21LL);
  uint64_t v36 = *(unsigned int *)(*(void *)(a1 + 32) + 132LL);
  uint64_t v37 = v10;
  else {
    v38 = off_189BC1740[v36];
  }
  size_t v39 = strlen(v38);
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v16, (uint64_t)v38, v39);
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v16, (uint64_t)")", 1LL);
  if (v64) {
    v40 = v64;
  }
  else {
    v40 = "";
  }
  size_t v41 = strlen(v40);
  v42 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v16, (uint64_t)v40, v41);
  if ((*(_BYTE *)(*(void *)(a1 + 32) + 140LL) & 8) != 0) {
    v43 = " complete (reason ";
  }
  else {
    v43 = "";
  }
  if ((*(_BYTE *)(*(void *)(a1 + 32) + 140LL) & 8) != 0) {
    uint64_t v44 = 18LL;
  }
  else {
    uint64_t v44 = 0LL;
  }
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v42, (uint64_t)v43, v44);
  uint64_t v45 = *(void *)(a1 + 32);
  v46 = "";
  if ((*(_BYTE *)(v45 + 140) & 8) != 0)
  {
    unsigned int v47 = *(_DWORD *)(v45 + 136) - 1;
    if (v47 > 3) {
      v46 = "invalid";
    }
    else {
      v46 = off_189BC2D88[v47];
    }
  }

  size_t v48 = strlen(v46);
  v49 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v16, (uint64_t)v46, v48);
  unint64_t v50 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 140LL);
  if ((v50 & 8) != 0) {
    v51 = ")";
  }
  else {
    v51 = "";
  }
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v49, (uint64_t)v51, (v50 >> 3) & 1);
  if (v63) {
    v52 = v63;
  }
  else {
    v52 = "";
  }
  size_t v53 = strlen(v52);
  v54 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v16, (uint64_t)v52, v53);
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v54, (uint64_t)">", 1LL);
  if (v28) {

  }
  if (v64)
  {
    free(v64);
    v64 = 0LL;
  }

  if (v63)
  {
    free(v63);
    v63 = 0LL;
  }

  if ((v72 & 0x10) != 0)
  {
    unint64_t v56 = *((void *)&v71 + 1);
    if (*((void *)&v71 + 1) < v69)
    {
      *((void *)&v71 + 1) = v69;
      unint64_t v56 = v69;
    }

    v57 = (const void **)&v68;
  }

  else
  {
    if ((v72 & 8) == 0)
    {
      size_t v55 = 0LL;
      a2[23] = 0;
      goto LABEL_81;
    }

    v57 = (const void **)v67;
    unint64_t v56 = v67[2];
  }

  v58 = *v57;
  size_t v55 = v56 - (void)*v57;
  if (v55 >= 0x7FFFFFFFFFFFFFF8LL) {
    abort();
  }
  if (v55 >= 0x17)
  {
    uint64_t v59 = (v55 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((v55 | 7) != 0x17) {
      uint64_t v59 = v55 | 7;
    }
    uint64_t v60 = v59 + 1;
    v61 = operator new(v59 + 1);
    *((void *)a2 + 1) = v55;
    *((void *)a2 + 2) = v60 | 0x8000000000000000LL;
    *(void *)a2 = v61;
    a2 = v61;
    goto LABEL_80;
  }

  a2[23] = v55;
  if (v55) {
LABEL_80:
  }
    memmove(a2, v58, v55);
LABEL_81:
  a2[v55] = 0;
  uint64_t v65 = *v29;
  *(uint64_t *)((char *)&v65 + *(void *)(v65 - 24)) = v29[3];
  uint64_t v66 = v37 + 16;
  if (SBYTE7(v71) < 0) {
    operator delete(__p[0]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x186E10044](v73);
}

uint64_t __74__NWConcrete_nw_parameters_initWithParameters_stripConnected_shallowCopy___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  uint64_t v4 = nw_protocol_transform_copy(a3);
  nw_array_append(*(void *)(*(void *)(a1 + 32) + 160LL), v4);

  return 1LL;
}

uint64_t __74__NWConcrete_nw_parameters_initWithParameters_stripConnected_shallowCopy___block_invoke_2( uint64_t a1,  uint64_t a2,  void *a3)
{
  uint64_t v4 = nw_protocol_options_copy(a3);
  nw_array_append(*(void *)(*(void *)(a1 + 32) + 168LL), v4);

  return 1LL;
}

CFTypeRef __42__NWConcrete_nw_url_endpoint_copyEndpoint__block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 32) + 300LL) = 0;
  v2 = *(const char **)(*(void *)(a1 + 40) + 248LL);
  if (!v2)
  {
    __nwlog_obj();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    v12 = (void *)_os_log_send_and_compose_impl();

    CFTypeRef result = (CFTypeRef)__nwlog_abort((uint64_t)v12);
    if ((_DWORD)result) {
      goto LABEL_28;
    }
    free(v12);
  }

  v3 = strdup(v2);
  if (!v3)
  {
    __nwlog_obj();
    int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    int v14 = (void *)_os_log_send_and_compose_impl();

    CFTypeRef result = (CFTypeRef)__nwlog_abort((uint64_t)v14);
    if ((_DWORD)result) {
      goto LABEL_28;
    }
    free(v14);
  }

  *(void *)(*(void *)(a1 + 32) + 248LL) = v3;
  uint64_t v4 = *(const char **)(*(void *)(a1 + 40) + 256LL);
  if (!v4)
  {
    __nwlog_obj();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    v16 = (void *)_os_log_send_and_compose_impl();

    CFTypeRef result = (CFTypeRef)__nwlog_abort((uint64_t)v16);
    if ((_DWORD)result) {
      goto LABEL_28;
    }
    free(v16);
  }

  uint64_t v5 = strdup(v4);
  if (!v5)
  {
    __nwlog_obj();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    size_t v18 = (void *)_os_log_send_and_compose_impl();

    CFTypeRef result = (CFTypeRef)__nwlog_abort((uint64_t)v18);
    if ((_DWORD)result) {
      goto LABEL_28;
    }
    free(v18);
  }

  *(void *)(*(void *)(a1 + 32) + 256LL) = v5;
  v6 = *(const char **)(*(void *)(a1 + 40) + 264LL);
  if (!v6)
  {
    __nwlog_obj();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    v20 = (void *)_os_log_send_and_compose_impl();

    CFTypeRef result = (CFTypeRef)__nwlog_abort((uint64_t)v20);
    if ((_DWORD)result) {
      goto LABEL_28;
    }
    free(v20);
  }

  uint64_t v7 = strdup(v6);
  if (!v7)
  {
    __nwlog_obj();
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    uint64_t v22 = (void *)_os_log_send_and_compose_impl();

    CFTypeRef result = (CFTypeRef)__nwlog_abort((uint64_t)v22);
    if ((_DWORD)result) {
      goto LABEL_28;
    }
    free(v22);
  }

  *(void *)(*(void *)(a1 + 32) + 264LL) = v7;
  uint64_t v8 = *(char **)(*(void *)(a1 + 40) + 272LL);
  if (v8)
  {
    uint64_t v8 = strdup(v8);
    if (!v8)
    {
      __nwlog_obj();
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
      v24 = (void *)_os_log_send_and_compose_impl();

      CFTypeRef result = (CFTypeRef)__nwlog_abort((uint64_t)v24);
      if ((_DWORD)result) {
        goto LABEL_28;
      }
      free(v24);
      uint64_t v8 = 0LL;
    }
  }

  *(void *)(*(void *)(a1 + 32) + 272LL) = v8;
  v9 = *(char **)(*(void *)(a1 + 40) + 280LL);
  if (!v9) {
    goto LABEL_11;
  }
  v9 = strdup(v9);
  if (v9) {
    goto LABEL_11;
  }
  __nwlog_obj();
  v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
  v26 = (void *)_os_log_send_and_compose_impl();

  CFTypeRef result = (CFTypeRef)__nwlog_abort((uint64_t)v26);
  if (!(_DWORD)result)
  {
    free(v26);
    v9 = 0LL;
LABEL_11:
    *(void *)(*(void *)(a1 + 32) + 280LL) = v9;
    *(_WORD *)(*(void *)(a1 + 32) + 240LL) = *(_WORD *)(*(void *)(a1 + 40) + 240LL);
    *(_BYTE *)(*(void *)(a1 + 32) + 297LL) = *(_BYTE *)(*(void *)(a1 + 32) + 297LL) & 0xFE | *(_BYTE *)(*(void *)(a1 + 40) + 297LL) & 1;
    CFTypeRef result = CFRetain(*(CFTypeRef *)(*(void *)(a1 + 40) + 232LL));
    *(void *)(*(void *)(a1 + 32) + 232LL) = result;
    return result;
  }

void __35__NWConcrete_nw_path_copyWithZone___block_invoke(uint64_t a1)
{
  *(_OWORD *)(*(void *)(a1 + 32) + 120LL) = *(_OWORD *)(*(void *)(a1 + 40) + 120LL);
  *(_OWORD *)(*(void *)(a1 + 32) + 136LL) = *(_OWORD *)(*(void *)(a1 + 40) + 136LL);
  *(_OWORD *)(*(void *)(a1 + 32) + 152LL) = *(_OWORD *)(*(void *)(a1 + 40) + 152LL);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 168LL), *(id *)(*(void *)(a1 + 40) + 168LL));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 176LL), *(id *)(*(void *)(a1 + 40) + 176LL));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 184LL), *(id *)(*(void *)(a1 + 40) + 184LL));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 208LL), *(id *)(*(void *)(a1 + 40) + 208LL));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 216LL), *(id *)(*(void *)(a1 + 40) + 216LL));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 224LL), *(id *)(*(void *)(a1 + 40) + 224LL));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 232LL), *(id *)(*(void *)(a1 + 40) + 232LL));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 240LL), *(id *)(*(void *)(a1 + 40) + 240LL));
  v2 = *(char **)(*(void *)(a1 + 40) + 248LL);
  if (v2)
  {
    v2 = strdup(v2);
    if (!v2)
    {
      __nwlog_obj();
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
      v26 = (void *)_os_log_send_and_compose_impl();

      free(v26);
      v2 = 0LL;
    }
  }

  *(void *)(*(void *)(a1 + 32) + 248LL) = v2;
  v3 = (_OWORD *)(*(void *)(a1 + 40) + 264LL);
  uint64_t v4 = (_OWORD *)(*(void *)(a1 + 32) + 264LL);
  __int128 v5 = *(_OWORD *)(*(void *)(a1 + 40) + 344LL);
  __int128 v7 = *(_OWORD *)(*(void *)(a1 + 40) + 296LL);
  __int128 v6 = *(_OWORD *)(*(void *)(a1 + 40) + 312LL);
  v4[4] = *(_OWORD *)(*(void *)(a1 + 40) + 328LL);
  v4[5] = v5;
  v4[2] = v7;
  v4[3] = v6;
  __int128 v8 = v3[1];
  *uint64_t v4 = *v3;
  v4[1] = v8;
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(unsigned int *)(v9 + 348);
  if ((_DWORD)v10 && *(void *)(v9 + 296))
  {
    uint64_t v11 = malloc(20 * v10);
    if (!v11)
    {
      __nwlog_obj();
      uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
      v28 = (void *)_os_log_send_and_compose_impl();

      free(v28);
    }

    *(void *)(*(void *)(a1 + 32) + 296LL) = v11;
    memcpy( *(void **)(*(void *)(a1 + 32) + 296LL),  *(const void **)(*(void *)(a1 + 40) + 296LL),  20LL * *(unsigned int *)(*(void *)(a1 + 40) + 348LL));
    uint64_t v9 = *(void *)(a1 + 40);
  }

  uint64_t v12 = *(unsigned int *)(v9 + 344);
  if (!(_DWORD)v12 || !*(void *)(v9 + 304)) {
    goto LABEL_11;
  }
  int v13 = malloc(24 * v12);
  if (!v13)
  {
    __nwlog_obj();
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    v30 = (void *)_os_log_send_and_compose_impl();

    if (!__nwlog_abort((uint64_t)v30))
    {
      free(v30);
      goto LABEL_10;
    }

void __33__NWConcrete_nw_path_description__block_invoke(uint64_t a1)
{
}

void __33__NWConcrete_nw_path_description__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 256)) {
    objc_storeStrong((id *)(v1 + 256), *(id *)(a1 + 40));
  }
}

void __33__NWConcrete_nw_endpoint_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 216);
  if (v3)
  {
    nw_array_remove_all_objects((uint64_t)v3);
    uint64_t v2 = *(void *)(a1 + 32);
    v3 = *(void **)(v2 + 216);
  }

  *(void *)(v2 + 216) = 0LL;
}

void __33__NWConcrete_nw_endpoint_dealloc__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 64);
  if (v3)
  {
    free(v3);
    *(void *)(v2 + 64) = 0LL;
  }

  uint64_t v4 = *(void **)(v2 + 56);
  *(void *)(v2 + 56) = 0LL;

  uint64_t v5 = *(void *)(a1 + 32);
  __int128 v6 = *(void **)(v5 + 80);
  if (v6)
  {
    free(v6);
    *(void *)(v5 + 80) = 0LL;
  }

  __int128 v7 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = 0LL;
}

uint64_t __67__NWConcrete_nw_resolver_initWithEndpoint_parameters_path_log_str___block_invoke( uint64_t a1,  void *a2)
{
  id v4 = a2;
  int v5 = nw_resolver_config_get_class(v4);
  if (v5)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8LL);
    int v7 = *(_DWORD *)(v6 + 24);
    if (v7) {
      BOOL v8 = v5 < v7;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {
      *(_DWORD *)(v6 + 24) = v5;
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
    }
  }

  return 1LL;
}

void __52__NWConcrete_nw_endpoint_resolver_startWithHandler___block_invoke_2( uint64_t a1,  unsigned int a2,  void *a3)
{
  id v7 = a3;
  uint64_t v6 = (id *)nw_endpoint_handler_copy_resolver(*(NWConcrete_nw_endpoint_handler **)(a1 + 32));
  objc_storeStrong(v6 + 12, a3);
  nw_endpoint_resolver_update(*(void **)(a1 + 32), *(void **)(a1 + 40), a2);
}

uint64_t __61__NWConcrete_nw_endpoint_transform_cancelWithHandler_forced___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  return 1LL;
}

uint64_t __60__NWConcrete_nw_endpoint_resolver_cancelWithHandler_forced___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  return 1LL;
}

void __36__NWConcrete_nw_association_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3 = *(char **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __36__NWConcrete_nw_association_dealloc__block_invoke_2;
  v8[3] = &unk_189BC8650;
  id v4 = v2;
  uint64_t v5 = *(void *)(a1 + 40);
  id v9 = v4;
  uint64_t v10 = v5;
  nw_hash_table_apply(v3, (uint64_t)v8);
  id v7 = *(os_unfair_lock_s **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  if (v7)
  {
    _nw_hash_table_release(v7, v6);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0LL;
  }
}

void __37__NWConcrete_nw_endpoint_description__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 56))
  {
    v3 = *(const char **)(v2 + 64);
    if (v3
      || (*(void *)(*(void *)(a1 + 32) + 64) = [(id)v2 createDescription:0],
          uint64_t v2 = *(void *)(a1 + 32),
          (v3 = *(const char **)(v2 + 64)) != 0LL))
    {
      CFStringRef v4 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x189604DB0], v3, 0x8000100u);
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void **)(v5 + 56);
      *(void *)(v5 + 56) = v4;

      uint64_t v2 = *(void *)(a1 + 32);
    }
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), *(id *)(v2 + 56));
}

uint64_t __58__NWConcrete_nw_ethernet_channel_updateClientState_error___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(*(void *)(result + 40) + 8LL) + 40LL);
  if (v1) {
    return (*(uint64_t (**)(void, void, void))(v1 + 16))( *(void *)(*(void *)(*(void *)(result + 40) + 8LL) + 40LL),  *(unsigned int *)(result + 48),  *(void *)(result + 32));
  }
  return result;
}

void __47__NWConcrete_nw_ethernet_channel_createChannel__block_invoke(uint64_t a1)
{
  uint64_t v163 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && *(void *)(v2 + 152))
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v3 = (os_log_s *)(id)gLogObj;
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_8;
    }
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(char **)(v4 + 24);
    uint64_t v6 = v4 + 115;
    LODWORD(v4) = *(_DWORD *)(v4 + 168);
    *(_DWORD *)buf = 136447234;
    v149 = "-[NWConcrete_nw_ethernet_channel createChannel]_block_invoke";
    __int16 v150 = 2080;
    v151 = v5;
    __int16 v152 = 1042;
    LODWORD(v153) = 16;
    WORD2(v153) = 2098;
    *(void *)((char *)&v153 + 6) = v6;
    HIWORD(v153) = 1024;
    LODWORD(v154) = v4;
    id v7 = "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>] INPUT SOURCE: READ EVENT";
    BOOL v8 = v3;
    uint32_t v9 = 44;
  }

  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v3 = (os_log_s *)(id)gLogObj;
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_8;
    }
    uint64_t v10 = *(char **)(a1 + 32);
    *(_DWORD *)buf = 136446466;
    v149 = "-[NWConcrete_nw_ethernet_channel createChannel]_block_invoke";
    __int16 v150 = 2114;
    v151 = v10;
    id v7 = "%{public}s [%{public}@] INPUT SOURCE: READ EVENT";
    BOOL v8 = v3;
    uint32_t v9 = 22;
  }

  _os_log_impl(&dword_181A5C000, v8, OS_LOG_TYPE_DEBUG, v7, buf, v9);
LABEL_8:

  uint64_t v11 = *(_BYTE **)(a1 + 32);
  if (v11[112])
  {
    uint64_t v12 = v11;
    goto LABEL_11;
  }

  v11[112] = 1;
  nw_queue_suspend_source(*(void *)(*(void *)(a1 + 32) + 104LL));
  uint64_t v12 = (os_unfair_lock_s *)*(id *)(a1 + 32);
  if (!v12)
  {
    __nwlog_obj();
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v149 = "receiveFramesfromRings";
    v58 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    char v143 = 0;
    if (__nwlog_fault(v58, type, &v143))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        uint64_t v59 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v60 = type[0];
        if (os_log_type_enabled(v59, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          v149 = "receiveFramesfromRings";
          _os_log_impl(&dword_181A5C000, v59, v60, "%{public}s called with null ethernet_channel", buf, 0xCu);
        }
      }

      else if (v143)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        uint64_t v59 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v62 = type[0];
        BOOL v63 = os_log_type_enabled(v59, type[0]);
        if (backtrace_string)
        {
          if (v63)
          {
            *(_DWORD *)buf = 136446466;
            v149 = "receiveFramesfromRings";
            __int16 v150 = 2082;
            v151 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v59,  v62,  "%{public}s called with null ethernet_channel, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_90;
        }

        if (v63)
        {
          *(_DWORD *)buf = 136446210;
          v149 = "receiveFramesfromRings";
          _os_log_impl( &dword_181A5C000,  v59,  v62,  "%{public}s called with null ethernet_channel, no backtrace",  buf,  0xCu);
        }
      }

      else
      {
        __nwlog_obj();
        uint64_t v59 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v64 = type[0];
        if (os_log_type_enabled(v59, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          v149 = "receiveFramesfromRings";
          _os_log_impl( &dword_181A5C000,  v59,  v64,  "%{public}s called with null ethernet_channel, backtrace limit exceeded",  buf,  0xCu);
        }
      }
    }

void __33__NWConcrete_nw_resolver_dealloc__block_invoke(uint64_t a1)
{
}

void __45__NWConcrete_nw_endpoint_redactedDescription__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 72))
  {
    v3 = *(const char **)(v2 + 80);
    if (v3
      || (*(void *)(*(void *)(a1 + 32) + 80) = [(id)v2 createDescription:1],
          uint64_t v2 = *(void *)(a1 + 32),
          (v3 = *(const char **)(v2 + 80)) != 0LL))
    {
      CFStringRef v4 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x189604DB0], v3, 0x8000100u);
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void **)(v5 + 72);
      *(void *)(v5 + 72) = v4;

      uint64_t v2 = *(void *)(a1 + 32);
    }
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), *(id *)(v2 + 72));
}

uint64_t __49__NWConcrete_nw_establishment_report_description__block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  return 1LL;
}

uint64_t __49__NWConcrete_nw_establishment_report_description__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return 1LL;
}

uint64_t __49__NWConcrete_nw_establishment_report_description__block_invoke_3(uint64_t a1, uint64_t a2)
{
  v3 = *(__CFString **)(a1 + 40);
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
    CFStringRef v4 = ", ";
  }
  else {
    CFStringRef v4 = "";
  }
  CFStringAppendFormat(v3, 0LL, @"%s%@", v4, a2);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
  return 1LL;
}

BOOL __75__NWConcrete_nw_connection_group_initWithDescriptor_connection_parameters___block_invoke( uint64_t a1,  void *a2)
{
  v3 = a2;
  if (nw_endpoint_get_type(v3) == nw_endpoint_type_address)
  {
    *(_WORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = nw_endpoint_get_port(v3);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = nw_endpoint_copy_port_string(v3);
  }

  BOOL v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) == 0LL;

  return v4;
}

void __75__NWConcrete_nw_connection_group_initWithDescriptor_connection_parameters___block_invoke_10( uint64_t a1)
{
}

uint64_t __42__NWConcrete_nw_protocol_instance_destroy__block_invoke_54(uint64_t a1, uint64_t a2)
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  uint64_t extra = nw_hash_node_get_extra(a2);
  if (!*(void *)(extra + 32)) {
    goto LABEL_9;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v4 = (id)gLogObj;
  uint64_t v5 = *(void *)(extra + 32);
  uint64_t v6 = *(void *)(a1 + 32);
  *(_DWORD *)buf = 136446978;
  uint64_t v26 = "-[NWConcrete_nw_protocol_instance destroy]_block_invoke";
  __int16 v27 = 2048;
  uint64_t v28 = extra;
  __int16 v29 = 2048;
  uint64_t v30 = v5;
  __int16 v31 = 2048;
  uint64_t v32 = v6;
  id v7 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v23 = 0;
  if (__nwlog_fault(v7, &type, &v23))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      BOOL v8 = (os_log_s *)(id)gLogObj;
      os_log_type_t v9 = type;
      if (os_log_type_enabled(v8, type))
      {
        uint64_t v10 = *(void *)(extra + 32);
        uint64_t v11 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 136446978;
        uint64_t v26 = "-[NWConcrete_nw_protocol_instance destroy]_block_invoke";
        __int16 v27 = 2048;
        uint64_t v28 = extra;
        __int16 v29 = 2048;
        uint64_t v30 = v10;
        __int16 v31 = 2048;
        uint64_t v32 = v11;
        _os_log_impl( &dword_181A5C000,  v8,  v9,  "%{public}s Path state %p has an output handler %p when protocol instance %p is deallocated",  buf,  0x2Au);
      }
    }

    else if (v23)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      BOOL v8 = (os_log_s *)(id)gLogObj;
      os_log_type_t v14 = type;
      BOOL v15 = os_log_type_enabled(v8, type);
      if (backtrace_string)
      {
        if (v15)
        {
          uint64_t v16 = *(void *)(extra + 32);
          uint64_t v17 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 136447234;
          uint64_t v26 = "-[NWConcrete_nw_protocol_instance destroy]_block_invoke";
          __int16 v27 = 2048;
          uint64_t v28 = extra;
          __int16 v29 = 2048;
          uint64_t v30 = v16;
          __int16 v31 = 2048;
          uint64_t v32 = v17;
          __int16 v33 = 2082;
          unsigned int v34 = backtrace_string;
          _os_log_impl( &dword_181A5C000,  v8,  v14,  "%{public}s Path state %p has an output handler %p when protocol instance %p is deallocated, dumping backtrace:%{public}s",  buf,  0x34u);
        }

        free(backtrace_string);
        if (v7) {
          goto LABEL_8;
        }
        goto LABEL_9;
      }

      if (v15)
      {
        uint64_t v21 = *(void *)(extra + 32);
        uint64_t v22 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 136446978;
        uint64_t v26 = "-[NWConcrete_nw_protocol_instance destroy]_block_invoke";
        __int16 v27 = 2048;
        uint64_t v28 = extra;
        __int16 v29 = 2048;
        uint64_t v30 = v21;
        __int16 v31 = 2048;
        uint64_t v32 = v22;
        _os_log_impl( &dword_181A5C000,  v8,  v14,  "%{public}s Path state %p has an output handler %p when protocol instance %p is deallocated, no backtrace",  buf,  0x2Au);
      }
    }

    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      BOOL v8 = (os_log_s *)(id)gLogObj;
      os_log_type_t v18 = type;
      if (os_log_type_enabled(v8, type))
      {
        uint64_t v19 = *(void *)(extra + 32);
        uint64_t v20 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 136446978;
        uint64_t v26 = "-[NWConcrete_nw_protocol_instance destroy]_block_invoke";
        __int16 v27 = 2048;
        uint64_t v28 = extra;
        __int16 v29 = 2048;
        uint64_t v30 = v19;
        __int16 v31 = 2048;
        uint64_t v32 = v20;
        _os_log_impl( &dword_181A5C000,  v8,  v18,  "%{public}s Path state %p has an output handler %p when protocol instance %p is deallocated, backtrace limit exceeded",  buf,  0x2Au);
      }
    }
  }

  if (v7) {
LABEL_8:
  }
    free(v7);
LABEL_9:
  nw_protocol_path_state_dispose(*(void **)(a1 + 32), extra);
  return 1LL;
}

uint64_t __44__NWConcrete_nw_protocol_data_array_dealloc__block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  nw_frame_finalize((uint64_t)v3);
  uint64_t v4 = v3[4];
  uint64_t v5 = (void *)v3[5];
  if (v4)
  {
    *(void *)(v4 + 40) = v5;
    uint64_t v5 = (void *)v3[5];
  }

  else
  {
    *(void *)(*(void *)(a1 + 32) + 16LL) = v5;
  }

  *uint64_t v5 = v4;
  v3[4] = 0LL;
  v3[5] = 0LL;

  return 1LL;
}

void __41__NWConcrete_nw_listener_getPeerDeviceID__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(const char **)(*(void *)(a1 + 32) + 232LL);
  if (v2)
  {
    v3 = strdup(v2);
    if (!v3)
    {
      __nwlog_obj();
      uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
      uint64_t v5 = (void *)_os_log_send_and_compose_impl();

      if (__nwlog_abort((uint64_t)v5))
      {
        __break(1u);
        return;
      }

      free(v5);
    }

    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v3;
  }

void __43__NWConcrete_nw_listener_getIDSInformation__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 224LL);
  uint64_t v3 = nw_array_create();
  uint64_t v4 = v3;
  if (v2)
  {
    if (v3 == v2) {
      uint64_t v4 = v2;
    }
    else {
      std::vector<nw_object_wrapper_t>::__assign_with_size[abi:nn180100]<nw_object_wrapper_t*,nw_object_wrapper_t*>( v3 + 16,  *(void ***)(v2 + 16),  *(void ***)(v2 + 24),  (uint64_t)(*(void *)(v2 + 24) - *(void *)(v2 + 16)) >> 3);
    }
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __59__NWConcrete_nw_listener_updateParametersForNewConnection___block_invoke(uint64_t a1)
{
}

void __59__NWConcrete_nw_listener_updateParametersForNewConnection___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (nw_protocol_options_is_quic((nw_protocol_options_t)v3))
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 16LL);
    if (v4 && !nw_path_parameters_get_logging_disabled(*(void *)(v4 + 104)))
    {
      if (__nwlog_listener_log::onceToken != -1) {
        dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44340);
      }
      uint64_t v5 = (os_log_s *)(id)glistenerLogObj;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        id_string = nw_listener_get_id_string(*(void **)(a1 + 32));
        uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
        int v11 = 136446722;
        uint64_t v12 = "-[NWConcrete_nw_listener updateParametersForNewConnection:]_block_invoke_2";
        __int16 v13 = 2082;
        os_log_type_t v14 = id_string;
        __int16 v15 = 2114;
        uint64_t v16 = v7;
        _os_log_impl( &dword_181A5C000,  v5,  OS_LOG_TYPE_DEBUG,  "%{public}s [%{public}s] Setting trusted_peer_keys: %{public}@ for new connection",  (uint8_t *)&v11,  0x20u);
      }
    }

    BOOL v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    id v9 = nw_parameters_copy_context(*(void **)(*(void *)(a1 + 32) + 16LL));
    BOOL v10 = nw_context_copy_workloop(v9);
    nw_quic_connection_set_trusted_peer_keys(v3, v8, (void *)v10);
  }
}

void __78__NWConcrete_nw_listener_handleInboundPacket_length_from_to_interface_socket___block_invoke( void *a1)
{
  uint64_t v2 = _Block_copy(*(const void **)(a1[4] + 112LL));
  uint64_t v3 = *(void *)(a1[5] + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  objc_storeStrong((id *)(*(void *)(a1[6] + 8LL) + 40LL), *(id *)(a1[4] + 64LL));
}

uint64_t __78__NWConcrete_nw_listener_handleInboundPacket_length_from_to_interface_socket___block_invoke_42( void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void, void))(*(void *)(*(void *)(a1[9] + 8LL)
                                                                                               + 40LL)
                                                                                   + 16LL))( *(void *)(*(void *)(a1[9] + 8LL) + 40LL),  a1[4],  a1[5],  a1[6],  a1[7],  a1[8]);
}

void __57__NWConcrete_nw_listener_handleInbound_addProtocolInbox___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(_DWORD *)(v1 + 104);
  if (v2 != -1)
  {
    if (v2)
    {
      *(_DWORD *)(v1 + 104) = v2 - 1;
      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 16LL);
      if (v11 && !nw_path_parameters_get_logging_disabled(*(void *)(v11 + 104)))
      {
        if (__nwlog_listener_log::onceToken != -1) {
          dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44340);
        }
        uint64_t v5 = (os_log_s *)(id)glistenerLogObj;
        if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
          goto LABEL_16;
        }
        id_string = nw_listener_get_id_string(*(void **)(a1 + 32));
        int v13 = *(_DWORD *)(*(void *)(a1 + 32) + 104LL);
        int v14 = 136446722;
        __int16 v15 = "-[NWConcrete_nw_listener handleInbound:addProtocolInbox:]_block_invoke";
        __int16 v16 = 2082;
        uint64_t v17 = id_string;
        __int16 v18 = 1024;
        int v19 = v13;
        uint64_t v7 = "%{public}s [%{public}s] New connection limit is %u";
        BOOL v8 = v5;
        os_log_type_t v9 = OS_LOG_TYPE_INFO;
        uint32_t v10 = 28;
        goto LABEL_15;
      }
    }

    else
    {
      uint64_t v4 = *(void *)(v1 + 16);
      if (v4 && !nw_path_parameters_get_logging_disabled(*(void *)(v4 + 104)))
      {
        if (__nwlog_listener_log::onceToken != -1) {
          dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44340);
        }
        uint64_t v5 = (os_log_s *)(id)glistenerLogObj;
        if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          goto LABEL_16;
        }
        uint64_t v6 = nw_listener_get_id_string(*(void **)(a1 + 32));
        int v14 = 136446466;
        __int16 v15 = "-[NWConcrete_nw_listener handleInbound:addProtocolInbox:]_block_invoke";
        __int16 v16 = 2082;
        uint64_t v17 = v6;
        uint64_t v7 = "%{public}s [%{public}s] Unexpected connection notification";
        BOOL v8 = v5;
        os_log_type_t v9 = OS_LOG_TYPE_ERROR;
        uint32_t v10 = 22;
LABEL_15:
        _os_log_impl(&dword_181A5C000, v8, v9, v7, (uint8_t *)&v14, v10);
LABEL_16:
      }
    }
  }

void __57__NWConcrete_nw_listener_handleInbound_addProtocolInbox___block_invoke_38( uint64_t a1,  int a2,  int a3,  void *a4,  void *a5)
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  os_log_type_t v9 = a4;
  uint32_t v10 = a5;
  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 16LL);
  if (v11 && !nw_path_parameters_get_logging_disabled(*(void *)(v11 + 104)))
  {
    if (__nwlog_listener_log::onceToken != -1) {
      dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44340);
    }
    uint64_t v12 = (os_log_s *)(id)glistenerLogObj;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id_string = nw_listener_get_id_string(*(void **)(a1 + 32));
      uint64_t v14 = *(void *)(a1 + 40);
      __int16 v15 = v9 + 104;
      if (!v9) {
        __int16 v15 = 0LL;
      }
      int v25 = 136447746;
      uint64_t v26 = "-[NWConcrete_nw_listener handleInbound:addProtocolInbox:]_block_invoke";
      __int16 v16 = v10 + 104;
      __int16 v27 = 2082;
      if (!v10) {
        __int16 v16 = 0LL;
      }
      uint64_t v28 = id_string;
      __int16 v29 = 2112;
      uint64_t v30 = v14;
      __int16 v31 = 1024;
      int v32 = a2;
      __int16 v33 = 1024;
      int v34 = a3;
      __int16 v35 = 2080;
      dispatch_data_t v36 = v15;
      __int16 v37 = 2080;
      dispatch_data_t v38 = v16;
      _os_log_impl( &dword_181A5C000,  v12,  OS_LOG_TYPE_INFO,  "%{public}s [%{public}s] Connection %@ initial:%{BOOL}d cancelling:%{BOOL}d (%s) -> (%s)",  (uint8_t *)&v25,  0x40u);
    }
  }

  if (v9 || (a2 & 1) != 0)
  {
    if (!v10 && (a3 & 1) == 0)
    {
      nw_listener_adjust_awdl_usage_on_queue(*(NWConcrete_nw_listener **)(a1 + 32), 1);
      uint64_t v22 = *(void *)(*(void *)(a1 + 32) + 16LL);
      if (v22)
      {
        if (!nw_path_parameters_get_logging_disabled(*(void *)(v22 + 104)))
        {
          if (__nwlog_listener_log::onceToken != -1) {
            dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44340);
          }
          __int16 v18 = (os_log_s *)(id)glistenerLogObj;
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
            goto LABEL_29;
          }
          char v23 = nw_listener_get_id_string(*(void **)(a1 + 32));
          int v24 = *(unsigned __int16 *)(*(void *)(a1 + 32) + 240LL);
          int v25 = 136446722;
          uint64_t v26 = "-[NWConcrete_nw_listener handleInbound:addProtocolInbox:]_block_invoke";
          __int16 v27 = 2082;
          uint64_t v28 = v23;
          __int16 v29 = 1024;
          LODWORD(v30) = v24;
          uint64_t v21 = "%{public}s [%{public}s] Connection now needs AWDL, updated AWDL usage count=%u";
          goto LABEL_28;
        }
      }
    }
  }

  else
  {
    nw_listener_adjust_awdl_usage_on_queue(*(NWConcrete_nw_listener **)(a1 + 32), 0);
    uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 16LL);
    if (v17 && !nw_path_parameters_get_logging_disabled(*(void *)(v17 + 104)))
    {
      if (__nwlog_listener_log::onceToken != -1) {
        dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44340);
      }
      __int16 v18 = (os_log_s *)(id)glistenerLogObj;
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
        goto LABEL_29;
      }
      int v19 = nw_listener_get_id_string(*(void **)(a1 + 32));
      int v20 = *(unsigned __int16 *)(*(void *)(a1 + 32) + 240LL);
      int v25 = 136446722;
      uint64_t v26 = "-[NWConcrete_nw_listener handleInbound:addProtocolInbox:]_block_invoke";
      __int16 v27 = 2082;
      uint64_t v28 = v19;
      __int16 v29 = 1024;
      LODWORD(v30) = v20;
      uint64_t v21 = "%{public}s [%{public}s] Connection no longer needs AWDL, updated AWDL usage count=%u";
LABEL_28:
      _os_log_impl(&dword_181A5C000, v18, OS_LOG_TYPE_INFO, v21, (uint8_t *)&v25, 0x1Cu);
LABEL_29:
    }
  }
}

void __57__NWConcrete_nw_listener_handleInbound_addProtocolInbox___block_invoke_40(void *a1)
{
  *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = (*(_BYTE *)(a1[4] + 302LL) & 4) != 0;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8LL) + 40LL), *(id *)(a1[4] + 64LL));
  int v2 = _Block_copy(*(const void **)(a1[4] + 88LL));
  uint64_t v3 = *(void *)(a1[7] + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = _Block_copy(*(const void **)(a1[4] + 96LL));
  uint64_t v6 = *(void *)(a1[8] + 8LL);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  id v8 = *(id *)(a1[4] + 16LL);
  BOOL v9 = -[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]( (id *)objc_alloc(&OBJC_CLASS___NWConcrete_nw_parameters),  v8,  0,  0);

  uint64_t v10 = *(void *)(a1[9] + 8LL);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

uint64_t __57__NWConcrete_nw_listener_handleInbound_addProtocolInbox___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) + 16LL))();
}

uint64_t __57__NWConcrete_nw_listener_handleInbound_addProtocolInbox___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) + 16LL))();
}

uint64_t __57__NWConcrete_nw_listener_handleInbound_addProtocolInbox___block_invoke_41(uint64_t a1)
{
  return nw_utilities_execute_block_as_persona_from_parameters( *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL),  *(void **)(a1 + 32));
}

uint64_t __49__NWConcrete_nw_listener_canHandleNewConnection___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL) = *(_DWORD *)(*(void *)(result + 32) + 104LL) == 0;
  return result;
}

uint64_t __40__NWConcrete_nw_custom_endpoint_getHash__block_invoke( uint64_t a1,  int a2,  int a3,  void *data,  CC_LONG len)
{
  return 1LL;
}

uint64_t __60__NWConcrete_nw_endpoint_proxy_applyWithHandler_toChildren___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __57__NWConcrete_nw_endpoint_proxy_cancelWithHandler_forced___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  return 1LL;
}

uint64_t __49__NWConcrete_nw_endpoint_proxy_startWithHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (nw_proxy_config_has_fallback_proxy_agent(v4) || nw_proxy_config_has_fallback_proxy_config(v4))
  {
    uint64_t v5 = 0LL;
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
  }

  else
  {
    uint64_t v5 = 1LL;
  }

  return v5;
}

uint64_t __49__NWConcrete_nw_endpoint_proxy_startWithHandler___block_invoke_2( uint64_t a1,  uint64_t a2,  void *a3)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  nw_array_append(*(void *)(a1 + 32), v4);
  unsigned int generation = nw_proxy_config_get_generation(v4);
  *(_OWORD *)uint64_t v12 = 0uLL;
  nw_proxy_config_copy_fallback_proxy_agent(v4, v12);
  id v6 = nw_proxy_config_copy_fallback_proxy_config(v4);
  unsigned int v7 = 0;
  while (v6)
  {
    if (v7 >= 8) {
      goto LABEL_11;
    }
LABEL_9:
    uuid_clear(v12);
    if (v6)
    {
      id v8 = v6;
      v8[171] |= 0x20u;

      nw_array_append(*(void *)(a1 + 32), v8);
      BOOL v9 = v8;
      *(_OWORD *)uint64_t v12 = *(_OWORD *)(v9 + 72);

      uint64_t v10 = v9;
      id v6 = v10[11];
    }

    ++v7;
  }

  id v6 = 0LL;
  if (!uuid_is_null(v12) && v7 < 8)
  {
    id v6 = nw_path_copy_proxy_config_for_agent_uuid(v12, generation, *(void **)(a1 + 40));
    goto LABEL_9;
  }

uint64_t __49__NWConcrete_nw_endpoint_proxy_startWithHandler___block_invoke_3(id *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  int generation = nw_proxy_config_get_generation(v4);
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __49__NWConcrete_nw_endpoint_proxy_startWithHandler___block_invoke_4;
  v7[3] = &unk_189BB9EA0;
  int v11 = generation;
  id v8 = a1[4];
  id v9 = a1[5];
  id v10 = a1[6];
  nw_proxy_config_enumerate_alternate_agents(v4, v7);
  nw_array_append((uint64_t)a1[6], v4);

  return 1LL;
}

void __49__NWConcrete_nw_endpoint_proxy_startWithHandler___block_invoke_4(uint64_t a1, _OWORD *a2)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  *(_OWORD *)uint64_t v17 = *a2;
  id v3 = nw_path_copy_proxy_config_for_agent_uuid(v17, *(_DWORD *)(a1 + 56), *(void **)(a1 + 32));
  if (v3)
  {
    uint64_t v9 = 0LL;
    id v10 = &v9;
    uint64_t v11 = 0x2020000000LL;
    char v12 = 0;
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __49__NWConcrete_nw_endpoint_proxy_startWithHandler___block_invoke_5;
    v6[3] = &unk_189BB9E78;
    id v8 = &v9;
    id v7 = *(id *)(a1 + 40);
    nw_proxy_config_enumerate_preferred_domains(v3, v6);
    if (*((_BYTE *)v10 + 24))
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v4 = (os_log_s *)(id)gLogObj;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v5 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 136446466;
        uint64_t v14 = "-[NWConcrete_nw_endpoint_proxy startWithHandler:]_block_invoke_4";
        __int16 v15 = 2112;
        uint64_t v16 = v5;
        _os_log_impl( &dword_181A5C000,  v4,  OS_LOG_TYPE_DEBUG,  "%{public}s Endpoint %@ matches preferred domain of alternate proxy",  buf,  0x16u);
      }

      nw_array_append(*(void *)(a1 + 48), v3);
    }

    _Block_object_dispose(&v9, 8);
  }
}

void __49__NWConcrete_nw_endpoint_proxy_startWithHandler___block_invoke_5(uint64_t a1, const char *a2)
{
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = nw_endpoint_proxy_match_pattern_to_endpoint( *(void **)(a1 + 32),  a2);
    if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))
    {
      id v4 = nw_endpoint_copy_cname_array(*(void **)(a1 + 32));
      if (v4)
      {
        if (*((void *)v4 + 3) != *((void *)v4 + 2))
        {
          v6[1] = 3221225472LL;
          v6[2] = __49__NWConcrete_nw_endpoint_proxy_startWithHandler___block_invoke_6;
          v6[3] = &unk_189BC93C8;
          void v6[4] = *(void *)(a1 + 40);
          v6[5] = a2;
          id v5 = v4;
          v6[0] = MEMORY[0x1895F87A8];
          nw_array_apply((unsigned __int8 *)v4, (uint64_t)v6);
          id v4 = v5;
        }
      }
    }
  }

BOOL __49__NWConcrete_nw_endpoint_proxy_startWithHandler___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = nw_endpoint_proxy_match_pattern_to_endpoint( v4,  *(const char **)(a1 + 40));
  BOOL v5 = *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) == 0;

  return v5;
}

uint64_t __47__NWConcrete_nw_masque_connection_pair_dealloc__block_invoke( int a1,  int a2,  nw_connection_t connection)
{
  return 1LL;
}

uint64_t __45__NWConcrete_nw_masque_listener_pair_dealloc__block_invoke( int a1,  int a2,  nw_connection_t connection)
{
  return 1LL;
}

uint64_t __63__NWConcrete_nw_endpoint_resolver_applyWithHandler_toChildren___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __52__NWConcrete_nw_endpoint_resolver_startWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v164 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  id v7 = nw_endpoint_handler_copy_resolver(*(NWConcrete_nw_endpoint_handler **)(a1 + 32));
  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = (void *)*((void *)v7 + 1);
  id v10 = v8;
  id v141 = v9;
  id v142 = v5;
  id v143 = v6;
  unsigned int v139 = v7;
  v140 = v10;
  if (!v10)
  {
    __nwlog_obj();
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    __int128 v147 = "nw_endpoint_resolver_handle_alternative";
    v100 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v144 = 0;
    if (__nwlog_fault(v100, &type, &v144))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        uint32_t v101 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v102 = type;
        if (os_log_type_enabled(v101, type))
        {
          *(_DWORD *)buf = 136446210;
          __int128 v147 = "nw_endpoint_resolver_handle_alternative";
          _os_log_impl(&dword_181A5C000, v101, v102, "%{public}s called with null handler", buf, 0xCu);
        }
      }

      else if (v144)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        uint32_t v101 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v104 = type;
        BOOL v105 = os_log_type_enabled(v101, type);
        if (backtrace_string)
        {
          if (v105)
          {
            *(_DWORD *)buf = 136446466;
            __int128 v147 = "nw_endpoint_resolver_handle_alternative";
            __int16 v148 = 2082;
            id_str = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v101,  v104,  "%{public}s called with null handler, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_133;
        }

        if (v105)
        {
          *(_DWORD *)buf = 136446210;
          __int128 v147 = "nw_endpoint_resolver_handle_alternative";
          _os_log_impl(&dword_181A5C000, v101, v104, "%{public}s called with null handler, no backtrace", buf, 0xCu);
        }
      }

      else
      {
        __nwlog_obj();
        uint32_t v101 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v127 = type;
        if (os_log_type_enabled(v101, type))
        {
          *(_DWORD *)buf = 136446210;
          __int128 v147 = "nw_endpoint_resolver_handle_alternative";
          _os_log_impl( &dword_181A5C000,  v101,  v127,  "%{public}s called with null handler, backtrace limit exceeded",  buf,  0xCu);
        }
      }
    }

NWConcrete_nw_protocol_definition *__nw_protocol_copy_ethernet_definition_block_invoke()
{
  if (nw_protocol_ethernet_identifier::onceToken != -1) {
    dispatch_once(&nw_protocol_ethernet_identifier::onceToken, &__block_literal_global_31637);
  }
  CFTypeRef result = nw_protocol_definition_create_with_identifier((__int128 *)&g_ethernet_protocol_identifier);
  nw_protocol_copy_ethernet_definition::ethernet_definition = (uint64_t)result;
  return result;
}

uint64_t __41__NWConcrete_nw_proxy_config_description__block_invoke( uint64_t a1,  int a2,  nw_protocol_stack_t stack)
{
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __41__NWConcrete_nw_proxy_config_description__block_invoke_2;
  v5[3] = &unk_189BBCFB0;
  __int128 v3 = *(_OWORD *)(a1 + 48);
  __int128 v6 = *(_OWORD *)(a1 + 32);
  __int128 v7 = v3;
  nw_protocol_stack_iterate_application_protocols(stack, v5);
  return 0LL;
}

void __41__NWConcrete_nw_proxy_config_description__block_invoke_2(uint64_t a1, void *a2)
{
  __int128 v3 = a2;
  id v8 = v3;
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))
  {
    nw_protocol_definition_t v4 = nw_protocol_options_copy_definition(v3);
    if ((*(_BYTE *)(*(void *)(a1 + 32) + 171LL) & 0x20) != 0) {
      id v5 = "Fallback ";
    }
    else {
      id v5 = "";
    }
    CFStringAppendFormat(*(CFMutableStringRef *)(a1 + 56), 0LL, @"%@ %sProxy: ", v4, v5);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;

    __int128 v3 = v8;
  }

  id v6 = nw_protocol_options_copy_proxy_endpoint(v3);
  if (v6)
  {
    if (*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL)) {
      __int128 v7 = ", ";
    }
    else {
      __int128 v7 = "";
    }
    CFStringAppendFormat(*(CFMutableStringRef *)(a1 + 56), 0LL, @"%s%@", v7, v6);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
  }
}

uint64_t __29__NWConcrete_nw_storage_init__block_invoke()
{
  uint64_t result = atexit(nw_storage_flush_all_storages_atexit);
  storages = 0LL;
  qword_18C5A40C0 = (uint64_t)&storages;
  return result;
}

uint64_t __44__NWConcrete_nw_resolver_config_description__block_invoke(uint64_t a1, char *__s)
{
  __int128 v3 = (void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 48LL);
  size_t v4 = strlen(__s);
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v3, (uint64_t)__s, v4);
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v3, (uint64_t)" ", 1LL);
  return 1LL;
}

uint64_t __44__NWConcrete_nw_resolver_config_description__block_invoke_2(uint64_t a1, char *__s)
{
  __int128 v3 = (void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 48LL);
  size_t v4 = strlen(__s);
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v3, (uint64_t)__s, v4);
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v3, (uint64_t)" ", 1LL);
  return 1LL;
}

void __48__NWConcrete_nw_nat64_prefixes_resolver_dealloc__block_invoke(uint64_t a1)
{
}

unsigned __int8 *__42__NWConcrete_nw_address_endpoint_hostname__block_invoke(uint64_t a1)
{
  uint64_t result = *(unsigned __int8 **)(a1 + 32);
  unsigned __int8 v3 = result[390];
  if ((v3 & 1) == 0)
  {
    unsigned int v4 = result[233];
    BOOL v5 = v4 > 0x1E;
    int v6 = (1 << v4) & 0x40040004;
    if (!v5 && v6 != 0)
    {
      *(void *)(*(void *)(a1 + 32) + 376LL) = nw_endpoint_copy_address_string((nw_endpoint_t)result);
      uint64_t result = *(unsigned __int8 **)(a1 + 32);
      unsigned __int8 v3 = result[390];
    }

    result[390] = v3 | 1;
  }

  return result;
}

uint64_t __64__NWConcrete_nw_endpoint_transform_applyWithHandler_toChildren___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __37__NWConcrete_nw_agent_client_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = *(void *)(v2 + 24);
    if (v3)
    {
      unsigned int v4 = *(void (**)(void))(v3 + 8);
      if (v4)
      {
        v4();
        return;
      }
    }
  }

  __nwlog_obj();
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = *(void *)(a1 + 32);
  __int128 v7 = "invalid";
  if (v6)
  {
    id v8 = *(const char **)(v6 + 16);
    if (v8) {
      __int128 v7 = v8;
    }
  }

  *(_DWORD *)buf = 136446466;
  __int16 v31 = "-[NWConcrete_nw_agent_client dealloc]_block_invoke";
  __int16 v32 = 2082;
  char v33 = v7;
  uint64_t v9 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v28 = 0;
  if (__nwlog_fault(v9, &type, &v28))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v11 = type;
      if (os_log_type_enabled(v10, type))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        uint64_t v13 = "invalid";
        if (v12)
        {
          uint64_t v14 = *(const char **)(v12 + 16);
          if (v14) {
            uint64_t v13 = v14;
          }
        }

        *(_DWORD *)buf = 136446466;
        __int16 v31 = "-[NWConcrete_nw_agent_client dealloc]_block_invoke";
        __int16 v32 = 2082;
        char v33 = v13;
        _os_log_impl( &dword_181A5C000,  v10,  v11,  "%{public}s protocol %{public}s has invalid remove_input_handler callback",  buf,  0x16u);
      }
    }

    else if (v28)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v16 = type;
      BOOL v17 = os_log_type_enabled(v10, type);
      if (backtrace_string)
      {
        if (v17)
        {
          uint64_t v18 = *(void *)(a1 + 32);
          char v19 = "invalid";
          if (v18)
          {
            int v20 = *(const char **)(v18 + 16);
            if (v20) {
              char v19 = v20;
            }
          }

          *(_DWORD *)buf = 136446722;
          __int16 v31 = "-[NWConcrete_nw_agent_client dealloc]_block_invoke";
          __int16 v32 = 2082;
          char v33 = v19;
          __int16 v34 = 2082;
          __int16 v35 = backtrace_string;
          _os_log_impl( &dword_181A5C000,  v10,  v16,  "%{public}s protocol %{public}s has invalid remove_input_handler callback, dumping backtrace:%{public}s",  buf,  0x20u);
        }

        free(backtrace_string);
        goto LABEL_36;
      }

      if (v17)
      {
        uint64_t v25 = *(void *)(a1 + 32);
        uint64_t v26 = "invalid";
        if (v25)
        {
          __int16 v27 = *(const char **)(v25 + 16);
          if (v27) {
            uint64_t v26 = v27;
          }
        }

        *(_DWORD *)buf = 136446466;
        __int16 v31 = "-[NWConcrete_nw_agent_client dealloc]_block_invoke";
        __int16 v32 = 2082;
        char v33 = v26;
        _os_log_impl( &dword_181A5C000,  v10,  v16,  "%{public}s protocol %{public}s has invalid remove_input_handler callback, no backtrace",  buf,  0x16u);
      }
    }

    else
    {
      __nwlog_obj();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v21 = type;
      if (os_log_type_enabled(v10, type))
      {
        uint64_t v22 = *(void *)(a1 + 32);
        char v23 = "invalid";
        if (v22)
        {
          int v24 = *(const char **)(v22 + 16);
          if (v24) {
            char v23 = v24;
          }
        }

        *(_DWORD *)buf = 136446466;
        __int16 v31 = "-[NWConcrete_nw_agent_client dealloc]_block_invoke";
        __int16 v32 = 2082;
        char v33 = v23;
        _os_log_impl( &dword_181A5C000,  v10,  v21,  "%{public}s protocol %{public}s has invalid remove_input_handler callback, backtrace limit exceeded",  buf,  0x16u);
      }
    }
  }

void __53__NWConcrete_nw_endpoint_flow_updatePathWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1)
  {
    uint64_t v3 = v1;
    uint64_t v4 = v3[29];

    if ((_DWORD)v4 == 2)
    {
      nw_endpoint_flow_failed_with_error(*(void **)(a1 + 32), 1, 0LL);
    }

    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      BOOL v5 = (os_log_s *)(id)gLogObj;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        else {
          uint64_t v6 = off_189BBBBC0[v4];
        }
        *(_DWORD *)buf = 136446722;
        uint64_t v18 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]_block_invoke";
        __int16 v19 = 2082;
        int v20 = (void *)v6;
        __int16 v21 = 2082;
        uint64_t v22 = "flow";
        _os_log_impl( &dword_181A5C000,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}s Handler is in mode %{public}s, expected %{public}s",  buf,  0x20u);
      }
    }

    return;
  }

  __nwlog_obj();
  __int128 v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  uint64_t v18 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]_block_invoke";
  id v8 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v15 = 0;
  if (__nwlog_fault(v8, &type, &v15))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v10 = type;
      if (os_log_type_enabled(v9, type))
      {
        *(_DWORD *)buf = 136446210;
        uint64_t v18 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]_block_invoke";
        _os_log_impl(&dword_181A5C000, v9, v10, "%{public}s called with null handler", buf, 0xCu);
      }
    }

    else if (v15)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v12 = type;
      BOOL v13 = os_log_type_enabled(v9, type);
      if (backtrace_string)
      {
        if (v13)
        {
          *(_DWORD *)buf = 136446466;
          uint64_t v18 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]_block_invoke";
          __int16 v19 = 2082;
          int v20 = backtrace_string;
          _os_log_impl( &dword_181A5C000,  v9,  v12,  "%{public}s called with null handler, dumping backtrace:%{public}s",  buf,  0x16u);
        }

        free(backtrace_string);
        goto LABEL_27;
      }

      if (v13)
      {
        *(_DWORD *)buf = 136446210;
        uint64_t v18 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]_block_invoke";
        _os_log_impl(&dword_181A5C000, v9, v12, "%{public}s called with null handler, no backtrace", buf, 0xCu);
      }
    }

    else
    {
      __nwlog_obj();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v14 = type;
      if (os_log_type_enabled(v9, type))
      {
        *(_DWORD *)buf = 136446210;
        uint64_t v18 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]_block_invoke";
        _os_log_impl( &dword_181A5C000,  v9,  v14,  "%{public}s called with null handler, backtrace limit exceeded",  buf,  0xCu);
      }
    }
  }

void __53__NWConcrete_nw_endpoint_flow_updatePathWithHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v80 = *MEMORY[0x1895F89C0];
  uint64_t v1 = *(void **)(a1 + 32);
  if (!v1)
  {
    __nwlog_obj();
    __int16 v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    BOOL v67 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]_block_invoke";
    uint64_t v36 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v64 = 0;
    if (__nwlog_fault(v36, &type, &v64))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        __int16 v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v38 = type;
        if (os_log_type_enabled(v37, type))
        {
          *(_DWORD *)buf = 136446210;
          BOOL v67 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]_block_invoke";
          _os_log_impl(&dword_181A5C000, v37, v38, "%{public}s called with null handler", buf, 0xCu);
        }
      }

      else if (v64)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        __int16 v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v40 = type;
        BOOL v41 = os_log_type_enabled(v37, type);
        if (backtrace_string)
        {
          if (v41)
          {
            *(_DWORD *)buf = 136446466;
            BOOL v67 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]_block_invoke";
            __int16 v68 = 2082;
            uint32_t v69 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v37,  v40,  "%{public}s called with null handler, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_57;
        }

        if (v41)
        {
          *(_DWORD *)buf = 136446210;
          BOOL v67 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]_block_invoke";
          _os_log_impl(&dword_181A5C000, v37, v40, "%{public}s called with null handler, no backtrace", buf, 0xCu);
        }
      }

      else
      {
        __nwlog_obj();
        __int16 v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v49 = type;
        if (os_log_type_enabled(v37, type))
        {
          *(_DWORD *)buf = 136446210;
          BOOL v67 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]_block_invoke";
          _os_log_impl( &dword_181A5C000,  v37,  v49,  "%{public}s called with null handler, backtrace limit exceeded",  buf,  0xCu);
        }
      }
    }

uint64_t __36__NWConcrete_nw_association_dealloc__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  nw_hash_node_get_object(a2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t extra = (uint64_t *)nw_hash_node_get_extra(a2);
  uint64_t v6 = extra[5];
  if (v6) {
    nw_protocol_definition_deallocate_cache_entry(v4, v6);
  }
  nw_context_remove_cache_entry(*(void **)(a1 + 32), extra);
  if (nw_hash_table_remove_node(*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL), a2)) {
    goto LABEL_11;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v7 = (id)gLogObj;
  *(_DWORD *)buf = 136446466;
  __int16 v19 = "-[NWConcrete_nw_association dealloc]_block_invoke_2";
  __int16 v20 = 2048;
  uint64_t v21 = a2;
  id v8 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v16 = 0;
  if (__nwlog_fault(v8, &type, &v16))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      uint64_t v9 = (os_log_s *)(id)gLogObj;
      os_log_type_t v10 = type;
      if (os_log_type_enabled(v9, type))
      {
        *(_DWORD *)buf = 136446466;
        __int16 v19 = "-[NWConcrete_nw_association dealloc]_block_invoke";
        __int16 v20 = 2048;
        uint64_t v21 = a2;
        _os_log_impl( &dword_181A5C000,  v9,  v10,  "%{public}s Association failed to remove cache entry for node %p",  buf,  0x16u);
      }
    }

    else if (v16)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      uint64_t v9 = (os_log_s *)(id)gLogObj;
      os_log_type_t v13 = type;
      BOOL v14 = os_log_type_enabled(v9, type);
      if (backtrace_string)
      {
        if (v14)
        {
          *(_DWORD *)buf = 136446722;
          __int16 v19 = "-[NWConcrete_nw_association dealloc]_block_invoke";
          __int16 v20 = 2048;
          uint64_t v21 = a2;
          __int16 v22 = 2082;
          nw_endpoint_t v23 = backtrace_string;
          _os_log_impl( &dword_181A5C000,  v9,  v13,  "%{public}s Association failed to remove cache entry for node %p, dumping backtrace:%{public}s",  buf,  0x20u);
        }

        free(backtrace_string);
        if (v8) {
          goto LABEL_10;
        }
        goto LABEL_11;
      }

      if (v14)
      {
        *(_DWORD *)buf = 136446466;
        __int16 v19 = "-[NWConcrete_nw_association dealloc]_block_invoke";
        __int16 v20 = 2048;
        uint64_t v21 = a2;
        _os_log_impl( &dword_181A5C000,  v9,  v13,  "%{public}s Association failed to remove cache entry for node %p, no backtrace",  buf,  0x16u);
      }
    }

    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      uint64_t v9 = (os_log_s *)(id)gLogObj;
      os_log_type_t v15 = type;
      if (os_log_type_enabled(v9, type))
      {
        *(_DWORD *)buf = 136446466;
        __int16 v19 = "-[NWConcrete_nw_association dealloc]_block_invoke";
        __int16 v20 = 2048;
        uint64_t v21 = a2;
        _os_log_impl( &dword_181A5C000,  v9,  v15,  "%{public}s Association failed to remove cache entry for node %p, backtrace limit exceeded",  buf,  0x16u);
      }
    }
  }

  if (v8) {
LABEL_10:
  }
    free(v8);
LABEL_11:

  return 1LL;
}

@end