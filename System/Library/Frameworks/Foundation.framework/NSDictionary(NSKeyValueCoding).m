@interface NSDictionary(NSKeyValueCoding)
- (uint64_t)valueForKey:()NSKeyValueCoding;
- (void)valueForKeyPath:()NSKeyValueCoding;
@end

@implementation NSDictionary(NSKeyValueCoding)

- (uint64_t)valueForKey:()NSKeyValueCoding
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v5 = [a3 length];
  if (!v5) {
    return [a1 objectForKey:a3];
  }
  uint64_t v6 = v5;
  uint64_t v7 = objc_msgSend(a3, "_newSubstringWithRange:zone:", 1, v6 - 1, 0);
  if (!v7) {
    return [a1 objectForKey:a3];
  }
  v8 = (void *)v7;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_CLASS___NSDictionary_0;
  id v9 = objc_msgSendSuper2(&v11, sel_valueForKey_, v7);

  return (uint64_t)v9;
}

- (void)valueForKeyPath:()NSKeyValueCoding
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  uint64_t v5 = [a3 length];
  if (v5)
  {
    uint64_t v6 = v5;
    if ([a3 characterAtIndex:0] == 64)
    {
      uint64_t v7 = objc_msgSend(a3, "rangeOfString:options:range:", @".", 2, 0, v6);
      if (v8)
      {
        uint64_t v9 = v7 + 1;
        v10 = (void *)objc_msgSend(a3, "_newSubstringWithRange:zone:", 1, v7 - 1, 0);
        uint64_t v11 = objc_msgSend(a3, "_newSubstringWithRange:zone:", v9, v6 - v9, 0);
        if (v11)
        {
          uint64_t v12 = (void *)v11;
          uint64_t v13 = [v10 lengthOfBytesUsingEncoding:4];
          MEMORY[0x1895F8858](v13);
          v15 = (char *)&v27 - v14;
          objc_msgSend(v10, "getCString:maxLength:encoding:", (char *)&v27 - v14);
          v16 = (objc_class *)objc_opt_class();
          v17 = NSKeyValueMethodForPattern(v16, "%sForKeyPath:", v15);
          if (!v17)
          {
            v18 = (objc_class *)objc_opt_class();
            v17 = NSKeyValueMethodForPattern(v18, "_%sForKeyPath:", v15);
            if (!v17)
            {

              id v19 = v10;
              v20 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"[<%@ %p> valueForKeyPath:]: this class does not implement the %@ operation.", objc_opt_class(), a1, v10), 0 reason userInfo];
              objc_exception_throw(v20);
              -[NSKeyValueNestedProperty object:withObservance:didChangeValueForKeyOrKeys:recurse:forwardingValues:]( v21,  v22,  v23,  v24,  v25,  v26,  v31);
              return;
            }
          }

          method_invoke(a1, v17, v12);

          goto LABEL_12;
        }
      }

      else
      {
        v10 = (void *)objc_msgSend(a3, "_newSubstringWithRange:zone:", 1, v6 - 1, 0);
      }

      v29.receiver = a1;
      v29.super_class = (Class)&OBJC_CLASS___NSDictionary_0;
      objc_msgSendSuper2(&v29, sel_valueForKey_, v10);
LABEL_12:

      return;
    }
  }

  if (![a1 objectForKey:a3])
  {
    v28.receiver = a1;
    v28.super_class = (Class)&OBJC_CLASS___NSDictionary_0;
    objc_msgSendSuper2(&v28, sel_valueForKeyPath_, a3);
  }

@end