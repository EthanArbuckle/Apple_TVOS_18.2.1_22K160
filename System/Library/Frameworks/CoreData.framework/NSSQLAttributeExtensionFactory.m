@interface NSSQLAttributeExtensionFactory
+ (uint64_t)createUnvalidatedTriggerForString:(void *)a3 onAttribute:;
+ (void)newExtensionsForAttribute:(uint64_t *)a3 error:;
@end

@implementation NSSQLAttributeExtensionFactory

+ (void)newExtensionsForAttribute:(uint64_t *)a3 error:
{
  v28[1] = *MEMORY[0x1895F89C0];
  objc_opt_self();
  id v5 = objc_alloc_init(MEMORY[0x189603FA8]);
  id v6 = objc_alloc_init(MEMORY[0x189603FA8]);
  v7 = (void *)objc_msgSend( (id)objc_msgSend((id)objc_msgSend(a2, "attributeDescription"), "userInfo"),  "objectForKey:",  @"NSTriggerKey");
  if (v7)
  {
    v8 = v7;
    if ([v7 length])
    {
      *(void *)buf = 0LL;
      v9 = (void *)+[NSSQLAttributeExtensionFactory createUnvalidatedTriggerForString:onAttribute:]( (uint64_t)&OBJC_CLASS___NSSQLAttributeExtensionFactory,  v8,  a2);
      if ([v9 validate:buf])
      {
        v10 = v6;
        v11 = v9;
      }

      else
      {
        v11 = *(void **)buf;
        v10 = v5;
      }

      [v10 addObject:v11];
    }
  }

  v12 = (void *)[v6 copy];
  if ([v5 count])
  {

    if ([v5 count] == 1)
    {
      uint64_t v13 = [v5 lastObject];
      if (v13) {
        goto LABEL_10;
      }
    }

    else
    {
      uint64_t v14 = *MEMORY[0x189607460];
      v27 = @"NSDetailedErrors";
      v28[0] = v5;
      uint64_t v13 = objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  v14,  134060,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1));
      if (v13)
      {
LABEL_10:
        if (a3)
        {
          v12 = 0LL;
          *a3 = v13;
          goto LABEL_16;
        }

+ (uint64_t)createUnvalidatedTriggerForString:(void *)a3 onAttribute:
{
  uint64_t v5 = [a3 entity];
  id v6 = (void *)objc_msgSend( a2,  "stringByTrimmingCharactersInSet:",  objc_msgSend(MEMORY[0x189607810], "whitespaceAndNewlineCharacterSet"));
  int v7 = objc_msgSend((id)objc_msgSend(v6, "lowercaseString"), "hasSuffix:", @"@count");
  v8 = off_189EA5588;
  if (!v7) {
    v8 = off_189EA5550;
  }
  return objc_msgSend( objc_alloc(*v8),  "initWithObjectFromUserInfo:onAttributeNamed:onEntity:",  v6,  objc_msgSend(a3, "name"),  v5);
}

@end