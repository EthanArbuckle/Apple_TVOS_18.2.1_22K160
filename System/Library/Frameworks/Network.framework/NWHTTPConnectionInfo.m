@interface NWHTTPConnectionInfo
@end

@implementation NWHTTPConnectionInfo

void __52___NWHTTPConnectionInfo_sendPingWithReceiveHandler___block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if ((a2 & 1) != 0)
  {
    if (v4) {
      uint64_t v6 = *(void *)(v4 + 16);
    }
    else {
      uint64_t v6 = 0LL;
    }
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __52___NWHTTPConnectionInfo_sendPingWithReceiveHandler___block_invoke_3;
    v12[3] = &unk_189BC73D0;
    v7 = v12;
    v8 = (id *)v13;
    v13[0] = *(id *)(a1 + 40);
    v13[1] = a3;
    if (!v6) {
      goto LABEL_15;
    }
LABEL_14:
    -[NWURLSessionDelegateQueue runDelegateBlock:](*(void **)(v6 + 48), v7);
    goto LABEL_15;
  }

  if (v4) {
    v9 = *(void **)(v4 + 8);
  }
  else {
    v9 = 0LL;
  }
  if (nw_http_connection_metadata_get_is_closed(v9)) {
    int v10 = 57;
  }
  else {
    int v10 = 45;
  }
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    uint64_t v6 = *(void *)(v11 + 16);
  }
  else {
    uint64_t v6 = 0LL;
  }
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __52___NWHTTPConnectionInfo_sendPingWithReceiveHandler___block_invoke_2;
  v14[3] = &unk_189BC87B8;
  v7 = v14;
  v8 = &v15;
  id v15 = *(id *)(a1 + 40);
  int v16 = v10;
  if (v6) {
    goto LABEL_14;
  }
LABEL_15:
}

void __52___NWHTTPConnectionInfo_sendPingWithReceiveHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:*(int *)(a1 + 40) userInfo:0];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, double))(v1 + 16))(v1, v2, 0.0);
}

uint64_t __52___NWHTTPConnectionInfo_sendPingWithReceiveHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  unsigned int v3 = dword_18C45F3A4;
  if (!dword_18C45F3A4)
  {
    mach_timebase_info((mach_timebase_info_t)&time_base);
    unsigned int v3 = dword_18C45F3A4;
  }

  return (*(uint64_t (**)(uint64_t, void, double))(v1 + 16))( v1,  0LL,  (double)(v2 * (unint64_t)time_base / v3) * 0.000000001);
}

@end