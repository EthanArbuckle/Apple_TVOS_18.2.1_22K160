@interface NSUserDefaults(NSKeyValueCoding)
- (uint64_t)setValue:()NSKeyValueCoding forKey:;
- (uint64_t)valueForKey:()NSKeyValueCoding;
@end

@implementation NSUserDefaults(NSKeyValueCoding)

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
  v11.super_class = (Class)&off_18C688CE0;
  id v9 = objc_msgSendSuper2(&v11, sel_valueForKey_, v7);

  return (uint64_t)v9;
}

- (uint64_t)setValue:()NSKeyValueCoding forKey:
{
  if (a3) {
    return objc_msgSend(a1, "setObject:forKey:");
  }
  else {
    return [a1 removeObjectForKey:a4];
  }
}

@end