@interface LSIsDictionaryWithKeysAndValuesOfClasses
@end

@implementation LSIsDictionaryWithKeysAndValuesOfClasses

void ___LSIsDictionaryWithKeysAndValuesOfClasses_block_invoke(void *a1, void *a2, void *a3, _BYTE *a4)
{
  id v12 = a2;
  id v7 = a3;
  v8 = (void *)a1[4];
  if (v8) {
    int v9 = _LSIsKindOfClasses(v12, v8) ^ 1;
  }
  else {
    int v9 = 0;
  }
  v10 = (void *)a1[5];
  if (v10) {
    int v11 = _LSIsKindOfClasses(v7, v10) ^ 1;
  }
  else {
    int v11 = 0;
  }
  if ((v9 | v11) == 1)
  {
    *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 0;
    *a4 = 1;
  }
}

@end