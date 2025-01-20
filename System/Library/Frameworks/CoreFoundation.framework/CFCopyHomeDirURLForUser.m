@interface CFCopyHomeDirURLForUser
@end

@implementation CFCopyHomeDirURLForUser

void ___CFCopyHomeDirURLForUser_block_invoke(uint64_t a1)
{
  v2 = *(__CFString **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  if (v2) {
    CFStringAppend(v2, @"\n");
  }
  else {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = CFStringCreateMutable(0LL, 0LL);
  }
}

@end