@interface NEIKEv2AddressList
+ (CFStringRef)normalizeServerAddress:(void *)a3 path:;
+ (__CFString)getSynthesizedIPv6Address:(uint64_t)a1 outgoingIf:(void *)a2 nat64Prefixes:(uint64_t)a3 numNat64Prefixes:(int)a4;
@end

@implementation NEIKEv2AddressList

- (void).cxx_destruct
{
}

+ (__CFString)getSynthesizedIPv6Address:(uint64_t)a1 outgoingIf:(void *)a2 nat64Prefixes:(uint64_t)a3 numNat64Prefixes:(int)a4
{
  LODWORD(v4) = a4;
  v6 = a2;
  objc_opt_self();
  if (!NECreateAddressStructFromString(v6, 0LL, 0LL))
  {
    ne_log_obj();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v10.isa) = 0;
      _os_log_error_impl( &dword_1876B1000,  v7,  OS_LOG_TYPE_ERROR,  "Failed to synthesize IPv6 address with IPv4 IKEv2 server address",  (uint8_t *)&v10,  2u);
    }

    goto LABEL_11;
  }

  if ((int)v4 < 1)
  {
LABEL_11:
    v8 = 0LL;
    goto LABEL_12;
  }

  uint64_t v4 = v4;
  while (1)
  {
    memset(&v10.info, 0, 20);
    v10.isa = (void *)7708;
    a3 += 16LL;
    if (!--v4) {
      goto LABEL_11;
    }
  }

  v8 = (__CFString *)NECreateAddressString(&v10);
LABEL_12:

  return v8;
}

+ (CFStringRef)normalizeServerAddress:(void *)a3 path:
{
  v15.data = (char *)*MEMORY[0x1895F89C0];
  uint64_t v4 = a2;
  id v5 = a3;
  objc_opt_self();
  if (!v4)
  {
    CFStringRef v7 = 0LL;
    goto LABEL_6;
  }

  if (NEGetAddressFamilyFromString(v4) == 30)
  {
    v9 = NECreateAddressStructFromString(v4, 0LL, 0LL);
    [v5 scopedInterface];
    __CFString v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10) {
      [v5 scopedInterface];
    }
    else {
      [v5 interface];
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 interfaceIndex];

    if (v9)
    {
      int v12 = nw_nat64_copy_prefixes();
      if (v12 >= 1)
      {
        uint64_t v13 = 0LL;
        v15.info = 0LL;
        v15.isa = (void *)528;
        uint64_t v14 = 16LL * v12;
        while ((nw_nat64_extract_v4() & 1) == 0)
        {
          v13 += 16LL;
          if (v14 == v13)
          {
            free(0LL);
            goto LABEL_16;
          }
        }

        CFStringRef v6 = NECreateAddressString(&v15);
        goto LABEL_4;
      }

@end