@interface NSFileManagerEnumeratorAtURL
@end

@implementation NSFileManagerEnumeratorAtURL

uint64_t ____NSFileManagerEnumeratorAtURL_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (!a2 && !objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", @"NSURL"))
  {
    uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", @"NSFilePath");
    [MEMORY[0x189604030] fileURLWithPath:v5];
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

@end