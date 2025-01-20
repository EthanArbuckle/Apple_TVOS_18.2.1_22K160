@interface NSJSONReader
@end

@implementation NSJSONReader

uint64_t __51___NSJSONReader_validForJSON_depth_allowFragments___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  _BYTE *a4)
{
  uint64_t result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
  {
    uint64_t result = +[_NSJSONReader validForJSON:depth:allowFragments:]( &OBJC_CLASS____NSJSONReader,  "validForJSON:depth:allowFragments:",  a3,  *(void *)(a1 + 40) + 1LL,  1LL);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
    if (*(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
      return result;
    }
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
  }

  *a4 = 1;
  return result;
}

BOOL __51___NSJSONReader_validForJSON_depth_allowFragments___block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3,  _BYTE *a4)
{
  BOOL result = +[_NSJSONReader validForJSON:depth:allowFragments:]( &OBJC_CLASS____NSJSONReader,  "validForJSON:depth:allowFragments:",  a2,  *(void *)(a1 + 40) + 1LL,  1LL);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
    *a4 = 1;
  }
  return result;
}

@end