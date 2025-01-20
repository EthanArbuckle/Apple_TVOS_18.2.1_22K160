@interface AddHandlers
@end

@implementation AddHandlers

void __AddHandlers_block_invoke_2(id a1, MTLCommandBuffer *a2)
{
  v4 = a2;
  if (-[MTLCommandBuffer status](v4, "status") == (char *)&dword_4 + 1)
  {
    id v2 = GTMTLReplay_dictionaryFromCommandBuffer(v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    GTMTLReplay_handleCommandBufferError((uint64_t)v3);
  }
}

void __AddHandlers_block_invoke(id a1, MTLCommandBuffer *a2)
{
}

@end