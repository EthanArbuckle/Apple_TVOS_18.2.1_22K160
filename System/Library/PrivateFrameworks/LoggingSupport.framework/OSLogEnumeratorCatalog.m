@interface OSLogEnumeratorCatalog
@end

@implementation OSLogEnumeratorCatalog

uint64_t __56___OSLogEnumeratorCatalog_enumerateSubchunksUsingBlock___block_invoke( void *a1,  _DWORD *a2,  uint64_t a3,  uint64_t a4)
{
  if (!*(void *)(*(void *)(a1[6] + 8LL) + 24LL) || *a2 != 24589) {
    return 1LL;
  }
  v5 = -[_OSLogEnumeratorCatalogSubchunk initWithCatalog:subchunk:range:]( objc_alloc(&OBJC_CLASS____OSLogEnumeratorCatalogSubchunk),  "initWithCatalog:subchunk:range:",  a1[4],  *(void *)(*(void *)(a1[6] + 8LL) + 24LL),  a3,  a4);
  *(void *)(*(void *)(a1[6] + 8LL) + 24LL) = **(void **)(*(void *)(a1[6] + 8LL) + 24LL);
  uint64_t v6 = (*(uint64_t (**)(void))(a1[5] + 16LL))();

  return v6;
}

uint64_t __56___OSLogEnumeratorCatalog_enumerateSubchunksUsingBlock___block_invoke_2(NSRange a1, NSRange a2)
{
  if (*(_DWORD *)a1.length >> 1 == 12294)
  {
    NSUInteger length = a1.length;
    location = (void *)a1.location;
    uint64_t v4 = *(void *)(*(void *)(a1.location + 32) + 8LL);
    a1.location = *(void *)(v4 + 32);
    if (a1.location != 0x7FFFFFFFFFFFFFFFLL)
    {
      a1.NSUInteger length = *(void *)(v4 + 40);
      a2 = NSUnionRange(a1, a2);
      uint64_t v4 = *(void *)(location[4] + 8LL);
    }

    *(NSRange *)(v4 + 32) = a2;
    enumerateOldChunkTracepointLimits( length,  (unint64_t *)(*(void *)(location[5] + 8LL) + 24LL),  (unint64_t *)(*(void *)(location[6] + 8LL) + 24LL));
  }

  return 1LL;
}

@end