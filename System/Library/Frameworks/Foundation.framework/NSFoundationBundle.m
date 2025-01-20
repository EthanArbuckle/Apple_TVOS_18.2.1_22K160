@interface NSFoundationBundle
@end

@implementation NSFoundationBundle

NSBundle *___NSFoundationBundle_block_invoke()
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  v0 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_self());
  qword_18C496A48 = (uint64_t)v0;
  result = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  if (v0 == result)
  {
    v2 =  +[NSBundle bundleWithPath:]( &OBJC_CLASS___NSBundle,  "bundleWithPath:",  @"/System/Frameworks/Foundation.framework");
    qword_18C496A48 = (uint64_t)v2;
    if (!v2 || (v3 = v2, result = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"), v3 == result))
    {
      v4 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 1);
      __int128 v9 = 0u;
      __int128 v10 = 0u;
      __int128 v11 = 0u;
      __int128 v12 = 0u;
      result = (NSBundle *)-[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v9,  v8,  16LL);
      if (result)
      {
        v5 = result;
        uint64_t v6 = *(void *)v10;
LABEL_7:
        uint64_t v7 = 0LL;
        while (1)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v4);
          }
          result =  +[NSBundle bundleWithPath:]( NSBundle,  "bundleWithPath:",  [*(id *)(*((void *)&v9 + 1) + 8 * v7) stringByAppendingPathComponent:@"Frameworks/Foundation.framework"]);
          qword_18C496A48 = (uint64_t)result;
          if (result) {
            break;
          }
          if (v5 == (NSBundle *)++v7)
          {
            result = (NSBundle *)-[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v9,  v8,  16LL);
            v5 = result;
            if (result) {
              goto LABEL_7;
            }
            return result;
          }
        }
      }
    }
  }

  return result;
}

@end