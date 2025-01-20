@interface NSCache(NSPrivate_Enumeration)
- (NSMapTable)mapTableRepresentation;
@end

@implementation NSCache(NSPrivate_Enumeration)

- (NSMapTable)mapTableRepresentation
{
  v4[5] = *MEMORY[0x1895F89C0];
  v2 = +[NSMapTable strongToStrongObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToStrongObjectsMapTable");
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __56__NSCache_NSPrivate_Enumeration__mapTableRepresentation__block_invoke;
  v4[3] = &unk_189C9E728;
  v4[4] = v2;
  objc_msgSend(a1, "__apply:", v4);
  return v2;
}

@end