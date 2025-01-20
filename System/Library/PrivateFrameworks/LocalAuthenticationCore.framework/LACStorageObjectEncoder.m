@interface LACStorageObjectEncoder
- (id)_lastBioAuthDataToNumber:(id)a3;
- (id)encodeValue:(id)a3 forKey:(int64_t)a4 error:(id *)a5;
@end

@implementation LACStorageObjectEncoder

- (id)encodeValue:(id)a3 forKey:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = v8;
  if (a5) {
    *a5 = 0LL;
  }
  if (!v8) {
    goto LABEL_22;
  }
  if ((-[objc_class isEqual:]( +[LACSecureStorage classForKey:](&OBJC_CLASS___LACSecureStorage, "classForKey:", a4),  "isEqual:",  objc_opt_class()) & 1) == 0)
  {
    id v14 = v9;
    goto LABEL_11;
  }

  if (a4 == 7)
  {
    if ([v9 length] != 1)
    {
      if (a5)
      {
        v15 = @"Expected 1 byte in NSNumber";
LABEL_21:
        +[LACStorageError errorWithCode:debugDescription:]( &OBJC_CLASS___LACStorageError,  "errorWithCode:debugDescription:",  1LL,  v15);
        v13 = 0LL;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_23;
      }

- (id)_lastBioAuthDataToNumber:(id)a3
{
  if (*(void *)[a3 bytes])
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v3 = 0LL;
  }

  return v3;
}

@end