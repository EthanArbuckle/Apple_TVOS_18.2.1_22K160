@interface UARPBundleIdentity
- (NSArray)chipEntries;
- (NSString)build;
- (UARPBundleIdentity)initWithBuild:(id)a3 chipEntries:(id)a4;
- (id)description;
- (void)dealloc;
@end

@implementation UARPBundleIdentity

- (UARPBundleIdentity)initWithBuild:(id)a3 chipEntries:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___UARPBundleIdentity;
  v6 = -[UARPBundleIdentity init](&v8, "init");
  if (v6)
  {
    v6->_build = (NSString *)[a3 copy];
    v6->_chipEntries = (NSArray *)[a4 copy];
  }

  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UARPBundleIdentity;
  -[UARPBundleIdentity dealloc](&v3, "dealloc");
}

- (id)description
{
  id v3 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
  v4 = (objc_class *)objc_opt_class(self);
  [v3 appendFormat:@"%@\n{\n", NSStringFromClass(v4)];
  [v3 appendFormat:@"\tBuild: %@\n", self->_build];
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  chipEntries = self->_chipEntries;
  id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( chipEntries,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(chipEntries);
        }
        [v3 appendFormat:@"%@\n", objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * (void)v9), "descriptionWithTabDepth:", 1)];
        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( chipEntries,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v7);
  }

  [v3 appendString:@"}\n"];
  return +[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", v3);
}

- (NSString)build
{
  return self->_build;
}

- (NSArray)chipEntries
{
  return self->_chipEntries;
}

@end