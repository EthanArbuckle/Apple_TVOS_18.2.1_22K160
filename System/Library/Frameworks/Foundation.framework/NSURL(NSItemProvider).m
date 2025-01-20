@interface NSURL(NSItemProvider)
+ (id)objectWithItemProviderData:()NSItemProvider typeIdentifier:error:;
+ (uint64_t)readableTypeIdentifiersForItemProvider;
+ (uint64_t)writableTypeIdentifiersForItemProvider;
- (NSData)_URLArchive;
- (uint64_t)loadDataWithTypeIdentifier:()NSItemProvider forItemProviderCompletionHandler:;
- (void)writableTypeIdentifiersForItemProvider;
@end

@implementation NSURL(NSItemProvider)

+ (uint64_t)readableTypeIdentifiersForItemProvider
{
  v1[1] = *MEMORY[0x1895F89C0];
  v1[0] = _MergedGlobals_87[0]();
  return [MEMORY[0x189603F18] arrayWithObjects:v1 count:1];
}

- (NSData)_URLArchive
{
  v2 = (void *)[a1 baseURL];
  v3 = (void *)[MEMORY[0x189603FA8] arrayWithCapacity:3];
  if (v2)
  {
    objc_msgSend(v3, "addObject:", objc_msgSend(a1, "relativeString"));
    v4 = (const __CFString *)[v2 absoluteString];
  }

  else
  {
    objc_msgSend(v3, "addObject:", objc_msgSend(a1, "absoluteString"));
    v4 = &stru_189CA6A28;
  }

  [v3 addObject:v4];
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v5 = objc_msgSend(a1, "_NSItemProviderArchive_customArchiveDictionary");
    if (v5) {
      [v3 addObject:v5];
    }
  }

  return +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v3,  200LL,  0LL,  0LL);
}

+ (id)objectWithItemProviderData:()NSItemProvider typeIdentifier:error:
{
  v38[1] = *MEMORY[0x1895F89C0];
  uint64_t v8 = _MergedGlobals_87[0]();
  if (!off_18C491828(a4, v8))
  {
    uint64_t v22 = (uint64_t)_NSIPCocoaErrorWithCode( 4864LL,  0LL,  0LL,  (uint64_t)@"A URL cannot be instantiated from a representation of type “%@”.",  v9,  v10,  v11,  v12,  a4);
    goto LABEL_18;
  }

  v38[0] = 0LL;
  id v13 = +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  a3,  0LL,  0LL,  v38);
  if ((unint64_t)[v13 count] >= 2
    && ([v13 objectAtIndexedSubscript:0], _NSIsNSString())
    && ([v13 objectAtIndexedSubscript:1], _NSIsNSString()))
  {
    int v18 = objc_msgSend((id)objc_msgSend(v13, "objectAtIndexedSubscript:", 1), "isEqualToString:", &stru_189CA6A28);
    id v19 = objc_alloc(MEMORY[0x189604030]);
    uint64_t v20 = [v13 objectAtIndexedSubscript:0];
    if (v18) {
      uint64_t v21 = [v19 initWithString:v20];
    }
    else {
      uint64_t v21 = objc_msgSend(v19, "initWithString:relativeToURL:", v20, objc_msgSend(v13, "objectAtIndexedSubscript:", 1));
    }
    v23 = (void *)v21;
  }

  else
  {
    v23 = 0LL;
  }

  if ((unint64_t)[v13 count] >= 3)
  {
    uint64_t v24 = [v13 objectAtIndexedSubscript:2];
    if (_NSIsNSDictionary())
    {
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        objc_msgSend(v23, "_NSItemProviderArchive_didUnarchiveCustomDictionary:", v24);
      }
    }
  }

  if (v23)
  {
    uint64_t v22 = 0LL;
  }

  else
  {
LABEL_16:
    uint64_t v22 = (uint64_t)_NSIPCocoaErrorWithCode( 4864LL,  v38[0],  0LL,  (uint64_t)@"The URL archive of type “%@” contains invalid data.",  v14,  v15,  v16,  v17,  a4);
    v23 = 0LL;
  }

  uint64_t v25 = v23;
  if (!v25)
  {
LABEL_18:
    if (![a3 length])
    {
      uint64_t v25 = 0LL;
LABEL_27:
      if (!(v25 | v22))
      {
        uint64_t v22 = (uint64_t)_NSIPCocoaErrorWithCode( 4864LL,  0LL,  0LL,  (uint64_t)@"A URL could not be instantiated because of an unknown error.",  v26,  v27,  v28,  v29,  v37);
        uint64_t v25 = 0LL;
      }

      goto LABEL_29;
    }

    v30 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", a3, 4LL);
    if (v30)
    {
      uint64_t v25 = [objc_alloc(MEMORY[0x189604030]) initWithString:v30];
      v31 = (void *)[(id)v25 scheme];
      if (v25 && [v31 length] && (objc_msgSend((id)v25, "isFileURL") & 1) == 0)
      {
        uint64_t v22 = 0LL;
        goto LABEL_25;
      }

      uint64_t v22 = (uint64_t)_NSIPCocoaErrorWithCode( 4864LL,  v22,  0LL,  (uint64_t)@"A URL cannot be instantiated from a representation of type “%@” even after treating it as a string.",  v32,  v33,  v34,  v35,  a4);
    }

    uint64_t v25 = 0LL;
LABEL_25:

    goto LABEL_27;
  }

+ (uint64_t)writableTypeIdentifiersForItemProvider
{
  v1[1] = *MEMORY[0x1895F89C0];
  v1[0] = _MergedGlobals_87[0]();
  return [MEMORY[0x189603F18] arrayWithObjects:v1 count:1];
}

- (void)writableTypeIdentifiersForItemProvider
{
  v2 = (void *)[MEMORY[0x189603FA8] array];
  [v2 addObject:_MergedGlobals_87[0]()];
  return v2;
}

- (uint64_t)loadDataWithTypeIdentifier:()NSItemProvider forItemProviderCompletionHandler:
{
  if (([a3 isEqualToString:off_18C491820[0]()] & 1) != 0
    || [a3 isEqualToString:_MergedGlobals_87[0]()])
  {
    uint64_t v7 = [a1 _URLArchive];
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  (*(void (**)(uint64_t, uint64_t, void))(a4 + 16))(a4, v7, 0LL);
  return 0LL;
}

@end