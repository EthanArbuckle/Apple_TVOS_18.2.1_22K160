@interface CUFileQuery
- (CUFileQuery)initWithDictionary:(id)a3 error:(id *)a4;
- (NSString)path;
- (id)completionHandler;
- (id)description;
- (void)encodeWithDictionary:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setPath:(id)a3;
@end

@implementation CUFileQuery

- (CUFileQuery)initWithDictionary:(id)a3 error:(id *)a4
{
  v6 = (const __CFDictionary *)a3;
  v7 = -[CUFileQuery init](self, "init");
  if (v7)
  {
    CFTypeID TypeID = CFStringGetTypeID();
    CFDictionaryGetTypedValue(v6, @"path", TypeID, 0LL);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9) {
      objc_storeStrong((id *)&v7->_path, v9);
    }

    v10 = v7;
  }

  else if (a4)
  {
    NSErrorF_safe((void *)*MEMORY[0x189607670], (const char *)0xFFFFE5D4LL);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (void)encodeWithDictionary:(id)a3
{
  path = self->_path;
  if (path) {
    [a3 setObject:path forKeyedSubscript:@"path"];
  }
}

- (id)description
{
  return NSPrintF();
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (void).cxx_destruct
{
}

@end