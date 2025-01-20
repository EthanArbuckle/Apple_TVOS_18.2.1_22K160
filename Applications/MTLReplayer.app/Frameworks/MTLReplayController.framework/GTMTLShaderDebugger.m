@interface GTMTLShaderDebugger
@end

@implementation GTMTLShaderDebugger

void __GTMTLShaderDebugger_executeCommandEncoder_block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if ([v7 status] == (char *)&dword_4 + 1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue([v7 error]);
    id v4 = [v3 copy];
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
    v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }
}

@end