@interface NSBPlistMappedString
@end

@implementation NSBPlistMappedString

uint64_t __45___NSBPlistMappedString_getCharacters_range___block_invoke( void *a1,  uint64_t a2,  unint64_t a3)
{
  char v5 = dyld_program_sdk_at_least();
  unint64_t v6 = a1[6];
  uint64_t v7 = a1[7];
  if (v7 + v6 >= a3) {
    unint64_t v8 = a3;
  }
  else {
    unint64_t v8 = v7 + v6;
  }
  if (v7 + v6) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9) {
    unint64_t v10 = v8;
  }
  else {
    unint64_t v10 = 0LL;
  }
  unint64_t v11 = v8 - v6;
  if (v6 < a3) {
    unint64_t v12 = a1[6];
  }
  else {
    unint64_t v12 = 0LL;
  }
  if (v6 < a3) {
    unint64_t v10 = v11;
  }
  if ((v5 & 1) != 0)
  {
    unint64_t v13 = a1[7];
  }

  else
  {
    unint64_t v6 = v12;
    unint64_t v13 = v10;
  }

  if (v13 + v6 <= a3)
  {
    __CFStrConvertBytesToUnicode();
  }

  else
  {
    *(void *)(*(void *)(a1[4] + 8LL) + 24LL) = a3;
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
  }

  return 1LL;
}

uint64_t __45___NSBPlistMappedString_getCharacters_range___block_invoke_2( void *a1,  uint64_t a2,  unint64_t a3)
{
  char v6 = dyld_program_sdk_at_least();
  unint64_t v7 = a1[6];
  uint64_t v8 = a1[7];
  if (v8 + v7 >= a3) {
    unint64_t v9 = a3;
  }
  else {
    unint64_t v9 = v8 + v7;
  }
  if (v8 + v7) {
    BOOL v10 = v7 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10) {
    unint64_t v11 = v9;
  }
  else {
    unint64_t v11 = 0LL;
  }
  unint64_t v12 = v9 - v7;
  if (v7 < a3) {
    uint64_t v13 = a1[6];
  }
  else {
    uint64_t v13 = 0LL;
  }
  if (v7 >= a3) {
    unint64_t v12 = v11;
  }
  if ((v6 & 1) != 0) {
    uint64_t v14 = a1[6];
  }
  else {
    uint64_t v14 = v13;
  }
  if ((v6 & 1) != 0) {
    unint64_t v15 = a1[7];
  }
  else {
    unint64_t v15 = v12;
  }
  if (v15 + v14 <= a3)
  {
    if (v15)
    {
      v16 = (_WORD *)a1[8];
      v17 = (unsigned __int16 *)(a2 + 2 * v14);
      do
      {
        unsigned int v18 = *v17++;
        *v16++ = bswap32(v18) >> 16;
        --v15;
      }

      while (v15);
    }
  }

  else
  {
    *(void *)(*(void *)(a1[4] + 8LL) + 24LL) = a3;
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
  }

  return 1LL;
}

uint64_t __46___NSBPlistMappedString__fastCStringContents___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a2;
  return 1LL;
}

@end