@interface SCNetworkReachabilityRestartResolver
@end

@implementation SCNetworkReachabilityRestartResolver

void ____SCNetworkReachabilityRestartResolver_block_invoke(uint64_t a1)
{
}

void ____SCNetworkReachabilityRestartResolver_block_invoke_110(uint64_t a1)
{
  if (pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 16LL))) {
    ____SCNetworkReachabilityRestartResolver_block_invoke_110_cold_2();
  }
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v2 == *(void **)(v3 + 264))
  {
    *(void *)(v3 + 264) = 0LL;
    v2 = *(void **)(a1 + 40);
  }

  nw_release(v2);
  if (pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 16LL))) {
    ____SCNetworkReachabilityRestartResolver_block_invoke_110_cold_1();
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void ____SCNetworkReachabilityRestartResolver_block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  if (pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 16LL))) {
    ____SCNetworkReachabilityRestartResolver_block_invoke_2_cold_3();
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v6 + 112))
  {
    uint64_t v18 = 0LL;
    v19 = &v18;
    uint64_t v20 = 0x2000000000LL;
    char v21 = 0;
    int FlagsFromPath = __SCNetworkReachabilityGetFlagsFromPath( v6 + 193,  *(void *)(a1 + 40),  *(nw_path_t *)(v6 + 248),  *(_DWORD *)(v6 + 80),  *(_DWORD *)(v6 + 272),  *(void *)(v6 + 280),  *(unsigned __int8 *)(v6 + 288),  *(_DWORD *)(v6 + 292));
    int interface_index = nw_path_get_interface_index();
    uint64_t count = nw_array_get_count();
    uint64_t v10 = *(void *)(a1 + 32);
    *(_DWORD *)(v10 + 272) = a2;
    nw_release(*(void **)(v10 + 280));
    *(void *)(*(void *)(a1 + 32) + 280LL) = nw_retain(a3);
    uint64_t v11 = *(void *)(a1 + 32);
    *(_BYTE *)(v11 + 288) = 0;
    *(void *)(v11 + 292) = 0LL;
    nw_array_apply();
    int v12 = *((unsigned __int8 *)v19 + 24);
    uint64_t v13 = *(void *)(a1 + 32);
    *(_BYTE *)(v13 + 288) = v12;
    int v14 = __SCNetworkReachabilityGetFlagsFromPath( v13 + 193,  (uint64_t)"ShouldUpdateClient",  *(nw_path_t *)(v13 + 248),  *(_DWORD *)(v13 + 80),  *(_DWORD *)(v13 + 272),  *(void *)(v13 + 280),  v12,  *(_DWORD *)(v13 + 292));
    int v15 = nw_path_get_interface_index();
    uint64_t v16 = nw_array_get_count();
    uint64_t v17 = *(void *)(a1 + 32);
    if (*(_BYTE *)(v13 + 113) && v14 == FlagsFromPath && v15 == interface_index && v16 == count)
    {
      if (pthread_mutex_unlock((pthread_mutex_t *)(v17 + 16))) {
        ____SCNetworkReachabilityRestartResolver_block_invoke_2_cold_2();
      }
    }

    else
    {
      reachUpdateAndUnlock(v17);
    }

    _Block_object_dispose(&v18, 8);
  }

  else if (pthread_mutex_unlock((pthread_mutex_t *)(v6 + 16)))
  {
    ____SCNetworkReachabilityRestartResolver_block_invoke_2_cold_1();
  }

BOOL ____SCNetworkReachabilityRestartResolver_block_invoke_3(uint64_t a1, uint64_t a2, nw_endpoint *a3)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  evaluator_for_endpoint = (void *)nw_path_create_evaluator_for_endpoint();
  uint64_t v6 = (nw_path *)nw_path_evaluator_copy_path();
  if (!v6)
  {
    int FlagsFromPath = 0;
    goto LABEL_23;
  }

  v19 = 0LL;
  nw_endpoint_type_t type = nw_endpoint_get_type(a3);
  nw_endpoint_type_t v8 = type;
  if (type == nw_endpoint_type_address)
  {
    address = nw_endpoint_get_address(a3);
    if (!address)
    {
LABEL_16:
      CrazyIvan46Path = (nw_path *)__SCNetworkReachabilityCreateCrazyIvan46Path( v6,  a3,  *(nw_parameters **)(*(void *)(a1 + 40) + 232LL),  0);
      if (CrazyIvan46Path)
      {
        uint64_t v13 = CrazyIvan46Path;
        nw_release(v6);
        uint64_t v6 = v13;
      }

      goto LABEL_18;
    }

    _SC_sockaddr_to_string((uint64_t)address, v20, 0x80uLL);
    goto LABEL_10;
  }

  if (type != 4 && type != nw_endpoint_type_host)
  {
    int v11 = asprintf(&v19, "endpoint %zu, ?");
    goto LABEL_12;
  }

  if (nw_endpoint_get_hostname(a3))
  {
LABEL_10:
    int v11 = asprintf(&v19, "endpoint %zu, %s");
LABEL_12:
    if (v11 < 0 && v19)
    {
      free(v19);
      v19 = 0LL;
    }

    goto LABEL_16;
  }

void ____SCNetworkReachabilityRestartResolver_block_invoke_110_cold_1()
{
}

void ____SCNetworkReachabilityRestartResolver_block_invoke_110_cold_2()
{
}

void ____SCNetworkReachabilityRestartResolver_block_invoke_2_cold_1()
{
}

void ____SCNetworkReachabilityRestartResolver_block_invoke_2_cold_2()
{
}

void ____SCNetworkReachabilityRestartResolver_block_invoke_2_cold_3()
{
}

@end