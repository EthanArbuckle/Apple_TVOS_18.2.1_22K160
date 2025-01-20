@interface BOMBomNewFromDirectory
@end

@implementation BOMBomNewFromDirectory

void __BOMBomNewFromDirectory_parallel_block_invoke(uint64_t a1)
{
  ActualPath = (const char *)BOMCopierSourceEntryGetActualPath(*(void *)(a1 + 40));
  Name = BOMCopierSourceEntryGetName(*(void **)(a1 + 40));
  v4 = BOMFSObjectNewFromPathWithSys( ActualPath,  *(_WORD *)(a1 + 64),  *(unsigned int (***)(void, const char *, __int128 *))(a1 + 48));
  if (v4)
  {
    v5 = v4;
    BOMFSObjectSetPathName((uint64_t)v4, Name, 1);
    *(void *)(*(void *)(a1 + 56) + 8LL) = v5;
  }

  else
  {
    fprintf((FILE *)*MEMORY[0x1895F89D0], "Could not create BOMFSObject for %s\n", ActualPath);
    uint64_t v6 = *(void *)(a1 + 56);
    *(_BYTE *)(v6 + 52) = 1;
    *(void *)(v6 + 56) = strdup(ActualPath);
    *(void *)(*(void *)(a1 + 56) + 64LL) = strdup(Name);
  }

  v7 = *(dispatch_group_s **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 48LL);
  if (v7) {
    dispatch_group_leave(v7);
  }
}

@end