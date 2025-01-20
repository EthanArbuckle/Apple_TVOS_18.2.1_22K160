@interface NSValidationErrorLocalizationPolicy
- (NSValidationErrorLocalizationPolicy)initWithURL:(id)a3;
- (id)_cachedObjectForKey:(id)a3 value:(void *)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)localizationDictionary;
- (id)localizedEntityNameForEntity:(id)a3;
- (id)localizedModelStringForKey:(id)a3;
- (id)localizedPropertyNameForProperty:(id)a3;
- (uint64_t)_localizedPropertyNameForProperty:(void *)a3 entity:;
- (void)_ensureFullLocalizationDictionaryIsLoaded;
- (void)dealloc;
- (void)setLocalizationDictionary:(id)a3;
@end

@implementation NSValidationErrorLocalizationPolicy

- (NSValidationErrorLocalizationPolicy)initWithURL:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSValidationErrorLocalizationPolicy;
  v4 = -[NSValidationErrorLocalizationPolicy init](&v6, sel_init);
  if (v4)
  {
    v4->_url = (NSURL *)a3;
    v4->_localizationBundle = 0LL;
    v4->_modelStringsFileName = 0LL;
    v4->_localizationDictionary = 0LL;
  }

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSValidationErrorLocalizationPolicy;
  -[NSValidationErrorLocalizationPolicy dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    v4[1] = -[NSURL copy](self->_url, "copy");
    v4[2] = self->_localizationBundle;
    v4[3] = -[NSString copy](self->_modelStringsFileName, "copy");
    v4[4] = 0LL;
  }

  return v4;
}

- (void)_ensureFullLocalizationDictionaryIsLoaded
{
  if (!self->_hasSetLocalizationDictionary)
  {
    if (!self->_localizationDictionary) {
      self->_localizationDictionary = (NSDictionary *)[objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:10];
    }
    localizationBundle = self->_localizationBundle;
    if (localizationBundle) {
      goto LABEL_5;
    }
    url = self->_url;
    if (url)
    {
      v7 = -[NSString stringByDeletingLastPathComponent]( -[NSURL path](url, "path"),  "stringByDeletingLastPathComponent");
      if (-[NSString isEqualToString:]( -[NSString lastPathComponent](v7, "lastPathComponent"),  "isEqualToString:",  @"Contents"))
      {
        v7 = -[NSString stringByDeletingLastPathComponent](v7, "stringByDeletingLastPathComponent");
      }

      self->_localizationBundle = (NSBundle *)(id)[MEMORY[0x1896077F8] bundleWithPath:v7];
      v8 = -[NSString lastPathComponent](-[NSURL path](self->_url, "path"), "lastPathComponent");
      self->_modelStringsFileName = v8;
      v9 = -[NSString stringByDeletingPathExtension](v8, "stringByDeletingPathExtension");
      self->_modelStringsFileName = v9;
      v10 = -[NSString stringByAppendingString:](v9, "stringByAppendingString:", @"Model");
      self->_modelStringsFileName = v10;
      v11 = v10;
      localizationBundle = self->_localizationBundle;
      if (localizationBundle)
      {
LABEL_5:
        uint64_t v4 = -[NSBundle pathForResource:ofType:]( localizationBundle,  "pathForResource:ofType:",  self->_modelStringsFileName,  @"strings");
        if (v4)
        {
          uint64_t v5 = [MEMORY[0x189603F68] dictionaryWithContentsOfFile:v4];
          if (v5) {
            -[NSDictionary addEntriesFromDictionary:](self->_localizationDictionary, "addEntriesFromDictionary:", v5);
          }
        }
      }
    }

    self->_hasSetLocalizationDictionary = 1;
  }

- (id)_cachedObjectForKey:(id)a3 value:(void *)a4
{
  id result = -[NSDictionary objectForKey:](self->_localizationDictionary, "objectForKey:", a3);
  if (!result)
  {
    if (self->_modelStringsFileName) {
      v8 = -[NSBundle localizedStringForKey:value:table:]( self->_localizationBundle,  "localizedStringForKey:value:table:",  a3,  a4);
    }
    else {
      v8 = 0LL;
    }
    id result = 0LL;
    if (v8) {
      a4 = v8;
    }
    if (a4)
    {
      if (a4 != a3)
      {
        -[NSDictionary setObject:forKey:](self->_localizationDictionary, "setObject:forKey:", a4, a3);
        return a4;
      }
    }
  }

  return result;
}

- (id)localizationDictionary
{
  return (id)-[NSDictionary copy](self->_localizationDictionary, "copy");
}

- (void)setLocalizationDictionary:(id)a3
{
  localizationDictionary = self->_localizationDictionary;
  if (localizationDictionary != a3)
  {
    if (localizationDictionary) {
      -[NSDictionary addEntriesFromDictionary:](localizationDictionary, "addEntriesFromDictionary:");
    }
    else {
      self->_localizationDictionary = (NSDictionary *)[a3 mutableCopy];
    }
  }

  self->_hasSetLocalizationDictionary = 1;
}

- (id)localizedEntityNameForEntity:(id)a3
{
  uint64_t v4 = [a3 name];
  return -[NSValidationErrorLocalizationPolicy _cachedObjectForKey:value:]( self,  "_cachedObjectForKey:value:",  [@"Entity/" stringByAppendingString:v4],  v4);
}

- (uint64_t)_localizedPropertyNameForProperty:(void *)a3 entity:
{
  uint64_t v3 = 0LL;
  if (a1 && a3)
  {
    uint64_t v7 = [a2 name];
    v8 = (void *)[@"Property/" mutableCopy];
    [v8 appendString:v7];
    [v8 appendString:@"/Entity/"];
    objc_msgSend(v8, "appendString:", objc_msgSend(a3, "name"));
    uint64_t v3 = [a1 _cachedObjectForKey:v8 value:0];
    if (!v3) {
      uint64_t v3 = -[NSValidationErrorLocalizationPolicy _localizedPropertyNameForProperty:entity:]( a1,  a2,  [a3 superentity]);
    }
  }

  return v3;
}

- (id)localizedPropertyNameForProperty:(id)a3
{
  id result = (id)-[NSValidationErrorLocalizationPolicy _localizedPropertyNameForProperty:entity:]( self,  a3,  (void *)[a3 entity]);
  if (!result)
  {
    uint64_t v6 = [a3 name];
    return -[NSValidationErrorLocalizationPolicy _cachedObjectForKey:value:]( self,  "_cachedObjectForKey:value:",  [@"Property/" stringByAppendingString:v6],  v6);
  }

  return result;
}

- (id)localizedModelStringForKey:(id)a3
{
  return -[NSValidationErrorLocalizationPolicy _cachedObjectForKey:value:]( self,  "_cachedObjectForKey:value:",  objc_msgSend(@"ErrorString/", "stringByAppendingString:"),  a3);
}

@end