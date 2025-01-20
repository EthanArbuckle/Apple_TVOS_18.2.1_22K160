@interface SCNetworkReachabilityCopyDescription
@end

@implementation SCNetworkReachabilityCopyDescription

uint64_t ____SCNetworkReachabilityCopyDescription_block_invoke(uint64_t a1, int a2, nw_endpoint_t endpoint)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  uint64_t type = nw_endpoint_get_type(endpoint);
  if ((_DWORD)type == 2)
  {
    v7 = *(__CFString **)(a1 + 32);
    hostname = nw_endpoint_get_hostname(endpoint);
    CFStringAppendFormat(v7, 0LL, @", %s", hostname);
  }

  else if ((_DWORD)type == 1)
  {
    address = nw_endpoint_get_address(endpoint);
    _SC_sockaddr_to_string((uint64_t)address, v10, 0x40uLL);
    CFStringAppendFormat(*(CFMutableStringRef *)(a1 + 32), 0LL, @", %s", v10);
  }

  else
  {
    CFStringAppendFormat(*(CFMutableStringRef *)(a1 + 32), 0LL, @", unexpected nw_endpoint type: %u", type);
  }

  return 1LL;
}

@end