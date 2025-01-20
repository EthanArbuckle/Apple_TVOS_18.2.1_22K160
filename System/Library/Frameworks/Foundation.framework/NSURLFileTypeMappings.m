@interface NSURLFileTypeMappings
+ (id)sharedMappings;
- (id)MIMETypeForExtension:(id)a3;
- (id)extensionsForMIMEType:(id)a3;
- (id)preferredExtensionForMIMEType:(id)a3;
@end

@implementation NSURLFileTypeMappings

+ (id)sharedMappings
{
  if (_MergedGlobals_124 != -1) {
    dispatch_once(&_MergedGlobals_124, &__block_literal_global_52);
  }
  return (id)qword_18C496C68;
}

NSURLFileTypeMappings *__39__NSURLFileTypeMappings_sharedMappings__block_invoke()
{
  result = objc_alloc_init(&OBJC_CLASS___NSURLFileTypeMappings);
  qword_18C496C68 = (uint64_t)result;
  return result;
}

- (id)MIMETypeForExtension:(id)a3
{
  uint64_t v4 = [a3 lowercaseString];
  id result = (id)[&unk_189D1F3D8 objectForKey:v4];
  if (!result && self)
  {
    if (v4) {
      return (id)objc_msgSend( (id)-[objc_class typeWithFilenameExtension:](UTTypeClass(), "typeWithFilenameExtension:", v4),  "preferredMIMEType");
    }
  }

  return result;
}

- (id)preferredExtensionForMIMEType:(id)a3
{
  uint64_t v4 = [a3 lowercaseString];
  id result = (id)objc_msgSend((id)objc_msgSend(&unk_189D1F400, "objectForKey:", v4), "objectAtIndex:", 0);
  if (!result && self)
  {
    if (v4) {
      return (id)objc_msgSend( (id)-[objc_class typeWithMIMEType:](UTTypeClass(), "typeWithMIMEType:", v4),  "preferredFilenameExtension");
    }
  }

  return result;
}

- (id)extensionsForMIMEType:(id)a3
{
  v6[1] = *MEMORY[0x1895F89C0];
  uint64_t v4 = [a3 lowercaseString];
  id result = (id)[&unk_189D1F428 objectForKey:v4];
  if (!result && self && v4)
  {
    id result = (id)objc_msgSend( (id)-[objc_class typeWithMIMEType:](UTTypeClass(), "typeWithMIMEType:", v4),  "preferredFilenameExtension");
    if (result)
    {
      v6[0] = result;
      return (id)[MEMORY[0x189603F18] arrayWithObjects:v6 count:1];
    }
  }

  return result;
}

@end