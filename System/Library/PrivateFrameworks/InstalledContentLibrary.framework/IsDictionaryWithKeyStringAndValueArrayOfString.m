@interface IsDictionaryWithKeyStringAndValueArrayOfString
@end

@implementation IsDictionaryWithKeyStringAndValueArrayOfString

void ___IsDictionaryWithKeyStringAndValueArrayOfString_block_invoke( uint64_t a1,  void *a2,  void *a3,  _BYTE *a4)
{
  id v7 = a2;
  id v8 = a3;
  objc_opt_class();
  id v12 = v7;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v9 = v12;
  }
  else {
    id v9 = 0LL;
  }

  if (!v9)
  {
LABEL_18:
    MOLogWrite();
LABEL_19:
    *a4 = 1;
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
    goto LABEL_20;
  }

  objc_opt_class();
  id v10 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0LL;
  }

  if (!v11)
  {
    goto LABEL_18;
  }

  objc_opt_class();
  if ((MIArrayContainsOnlyClass(v10) & 1) == 0)
  {
    goto LABEL_18;
  }

@end