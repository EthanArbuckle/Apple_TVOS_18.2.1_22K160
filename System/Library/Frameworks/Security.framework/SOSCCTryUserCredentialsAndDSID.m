@interface SOSCCTryUserCredentialsAndDSID
@end

@implementation SOSCCTryUserCredentialsAndDSID

uint64_t __SOSCCTryUserCredentialsAndDSID_internal_block_invoke(uint64_t a1)
{
  if (gSecurityd)
  {
    v1 = *(uint64_t (**)(void, void, void, void))(gSecurityd + 192);
    if (v1) {
      return v1(*(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
    }
  }

  uint64_t v3 = *(void *)(a1 + 32);
  if (!v3)
  {
    SOSErrorCreate(1045LL, *(CFTypeRef **)(a1 + 56), 0LL, @"user_label is nil");
    return 0LL;
  }

  uint64_t v4 = *(void *)(a1 + 40);
  if (!v4)
  {
    SOSErrorCreate(1045LL, *(CFTypeRef **)(a1 + 56), 0LL, @"user_password is nil");
    return 0LL;
  }

  if (*(void *)(a1 + 48)) {
    v5 = *(const __CFString **)(a1 + 48);
  }
  else {
    v5 = &stru_1896794C8;
  }
  return label_and_password_and_dsid_to_BOOL_error_request(0x2Cu, v3, v4, (uint64_t)v5, *(CFTypeRef **)(a1 + 56));
}

@end