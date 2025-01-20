@interface CFFileDescriptorPerform
@end

@implementation CFFileDescriptorPerform

uint64_t ____CFFileDescriptorPerform_block_invoke(uint64_t result)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = *(_DWORD *)(*(void *)(result + 72) + 16LL) == 0;
  if (*(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL))
  {
    v1 = (void *)result;
    *(_BYTE *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL) = *(_BYTE *)(*(void *)(result + 72) + 50LL);
    if (*(_BYTE *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL))
    {
      uint64_t v2 = *(void *)(result + 72);
      *(_BYTE *)(v2 + 50) = 0;
      result = cffd_is_readable(*(_DWORD *)(v2 + 24));
      *(_BYTE *)(*(void *)(v1[5] + 8LL) + 24LL) = result;
    }

    *(_BYTE *)(*(void *)(v1[6] + 8LL) + 24LL) = *(_BYTE *)(v1[9] + 51LL);
    if (*(_BYTE *)(*(void *)(v1[6] + 8LL) + 24LL))
    {
      uint64_t v3 = v1[9];
      *(_BYTE *)(v3 + 51) = 0;
      result = cffd_is_writeable(*(_DWORD *)(v3 + 28));
      *(_BYTE *)(*(void *)(v1[6] + 8LL) + 24LL) = result;
    }

    uint64_t v4 = v1[9];
    v5 = *(uint64_t (**)(void))(v4 + 88);
    if (v5 && (*(_BYTE *)(*(void *)(v1[5] + 8LL) + 24LL) || *(_BYTE *)(*(void *)(v1[6] + 8LL) + 24LL)))
    {
      result = v5(*(void *)(v4 + 80));
      *(void *)(*(void *)(v1[7] + 8LL) + 24LL) = result;
      uint64_t v6 = v1[8];
      uint64_t v7 = *(void *)(v1[9] + 96LL);
    }

    else
    {
      uint64_t v7 = *(void *)(v4 + 80);
      uint64_t v6 = v1[7];
    }

    *(void *)(*(void *)(v6 + 8) + 24LL) = v7;
  }

  return result;
}

@end