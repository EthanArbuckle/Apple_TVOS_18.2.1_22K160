uint64_t SPAKE2CtxSize()
{
  ccspake_cp_256();
  return ccspake_sizeof_ctx();
}

uint64_t SPAKE2Alishaz0Size()
{
  return ccspake_sizeof_w();
}

uint64_t AESLubyRackoffContextSize()
{
  return 40LL;
}

uint64_t keyIsCompactRepresentable()
{
  id v0 = (id)MEMORY[0x1895F8858]();
  [v0 length];
  id v1 = v0;
  [v1 bytes];

  uint64_t result = ccec_validate_pub();
  if ((_DWORD)result)
  {
    MEMORY[0x1895F8858]();
    ccn_sub();
    return (int)ccn_cmp() >= 0;
  }

  return result;
}

uint64_t ccss_sizeof_parameters_fix()
{
  return ccss_sizeof_parameters();
}
}

uint64_t init_ccec_ctx_pub(uint64_t result, void *a2)
{
  *a2 = result;
  return result;
}

uint64_t init_ccec_ctx_full(uint64_t result, void *a2)
{
  *a2 = result;
  return result;
}

uint64_t getDigestSizeForDigestInfo(uint64_t a1)
{
  return *(void *)(a1 + 8) + *(void *)(a1 + 16) + 12LL;
}

unint64_t getHMACContextSizeForDigestInfo(uint64_t a1)
{
  return ((*(void *)(a1 + 8) + *(void *)(a1 + 16) + 19LL) & 0xFFFFFFFFFFFFFFF8LL) + *(void *)(a1 + 8);
}

uint64_t getCMACContextSize()
{
  uint64_t v0 = *(void *)(ccaes_cbc_encrypt_mode() + 8);
  return v0 + *(void *)ccaes_cbc_encrypt_mode() + 80;
}

uint64_t getccec_full_ctx_size(void *a1)
{
  return (32LL * *a1) | 0x10;
}

uint64_t getccec_pub_ctx_size(void *a1)
{
  return 24LL * *a1 + 16;
}

uint64_t ccrng_generate_bridge(uint64_t (**a1)(void))
{
  uint64_t result = (*a1)();
  if ((_DWORD)result) {
    abort();
  }
  return result;
}

uint64_t SecAccessControlCopyData()
{
  return MEMORY[0x18960B1B0]();
}

void abort(void)
{
}

void bzero(void *a1, size_t a2)
{
}

uint64_t cc_clear()
{
  return MEMORY[0x1895F9748]();
}

uint64_t ccaes_cbc_encrypt_mode()
{
  return MEMORY[0x1895F9760]();
}

uint64_t ccec_affinify()
{
  return MEMORY[0x1895F9AA8]();
}

uint64_t ccec_compressed_x962_export_pub()
{
  return MEMORY[0x1895F9AE0]();
}

uint64_t ccec_compressed_x962_export_pub_size()
{
  return MEMORY[0x1895F9AE8]();
}

uint64_t ccec_compressed_x962_import_pub()
{
  return MEMORY[0x1895F9AF0]();
}

uint64_t ccec_cp_256()
{
  return MEMORY[0x1895F9B10]();
}

uint64_t ccec_cp_384()
{
  return MEMORY[0x1895F9B18]();
}

uint64_t ccec_cp_521()
{
  return MEMORY[0x1895F9B20]();
}

uint64_t ccec_full_add()
{
  return MEMORY[0x1895F9B70]();
}

uint64_t ccec_full_sub()
{
  return MEMORY[0x1895F9B78]();
}

uint64_t ccec_generate_scalar_fips_retry()
{
  return MEMORY[0x1895F9B98]();
}

uint64_t ccec_mult_blinded()
{
  return MEMORY[0x1895F9BB8]();
}

uint64_t ccec_projectify()
{
  return MEMORY[0x1895F9BC0]();
}

uint64_t ccec_raw_import_priv_only()
{
  return MEMORY[0x1895F9BC8]();
}

uint64_t ccec_raw_import_pub()
{
  return MEMORY[0x1895F9BD0]();
}

uint64_t ccec_validate_pub()
{
  return MEMORY[0x1895F9C38]();
}

uint64_t ccec_x963_export()
{
  return MEMORY[0x1895F9C50]();
}

uint64_t ccec_x963_import_priv()
{
  return MEMORY[0x1895F9C58]();
}

uint64_t ccec_x963_import_pub()
{
  return MEMORY[0x1895F9C68]();
}

uint64_t ccecb_context_size()
{
  return MEMORY[0x1895F9C78]();
}

uint64_t ccgcm_context_size()
{
  return MEMORY[0x1895F9D40]();
}

uint64_t ccn_cmp()
{
  return MEMORY[0x1895FA088]();
}

uint64_t ccn_read_uint()
{
  return MEMORY[0x1895FA098]();
}

uint64_t ccn_sub()
{
  return MEMORY[0x1895FA0A8]();
}

uint64_t ccn_write_uint_padded_ct()
{
  return MEMORY[0x1895FA0D8]();
}

uint64_t ccrng()
{
  return MEMORY[0x1895FA118]();
}

uint64_t ccspake_cp_256()
{
  return MEMORY[0x1895FA2A0]();
}

uint64_t ccspake_sizeof_ctx()
{
  return MEMORY[0x1895FA300]();
}

uint64_t ccspake_sizeof_w()
{
  return MEMORY[0x1895FA310]();
}

uint64_t ccss_shamir_share_export()
{
  return MEMORY[0x1895FA3F0]();
}

uint64_t ccss_shamir_share_import()
{
  return MEMORY[0x1895FA420]();
}

uint64_t ccss_shamir_share_init()
{
  return MEMORY[0x1895FA428]();
}

uint64_t ccss_shamir_share_sizeof_y()
{
  return MEMORY[0x1895FA430]();
}

uint64_t ccss_sizeof_parameters()
{
  return MEMORY[0x1895FA440]();
}

uint64_t ccss_sizeof_share()
{
  return MEMORY[0x1895FA450]();
}

uint64_t cczp_add()
{
  return MEMORY[0x1895FA4B0]();
}

uint64_t cczp_bitlen()
{
  return MEMORY[0x1895FA4B8]();
}

uint64_t cczp_inv()
{
  return MEMORY[0x1895FA4C0]();
}

uint64_t cczp_mod()
{
  return MEMORY[0x1895FA4C8]();
}

uint64_t cczp_mul()
{
  return MEMORY[0x1895FA4D0]();
}

uint64_t cczp_n()
{
  return MEMORY[0x1895FA4D8]();
}

uint64_t cczp_sub()
{
  return MEMORY[0x1895FA4E0]();
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

uint64_t map_to_curve_sswu()
{
  return MEMORY[0x1895FBD68]();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1895FBE68](__s, __smax, *(void *)&__c, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
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

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x189616820](a1);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1895FC890](a1);
}