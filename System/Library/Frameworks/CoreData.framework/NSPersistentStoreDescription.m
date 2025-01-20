@interface NSPersistentStoreDescription
+ (NSPersistentStoreDescription)persistentStoreDescriptionWithURL:(NSURL *)URL;
+ (id)inMemoryPersistentStoreDescription;
- (BOOL)isEqual:(id)a3;
- (BOOL)isReadOnly;
- (BOOL)shouldAddStoreAsynchronously;
- (BOOL)shouldInferMappingModelAutomatically;
- (BOOL)shouldInvokeCompletionHandlerConcurrently;
- (BOOL)shouldMigrateStoreAutomatically;
- (BOOL)usesPersistentHistoryTracking;
- (NSDictionary)options;
- (NSDictionary)sqlitePragmas;
- (NSPersistentCloudKitContainerOptions)cloudKitContainerOptions;
- (NSPersistentStoreDescription)init;
- (NSPersistentStoreDescription)initWithURL:(NSURL *)url;
- (NSString)configuration;
- (NSString)type;
- (NSTimeInterval)timeout;
- (NSURL)URL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mirroringDelegate;
- (id)mirroringOptions;
- (unint64_t)hash;
- (void)dealloc;
- (void)setCloudKitContainerOptions:(NSPersistentCloudKitContainerOptions *)cloudKitContainerOptions;
- (void)setConfiguration:(NSString *)configuration;
- (void)setMirroringDelegate:(id)a3;
- (void)setOption:(NSObject *)option forKey:(NSString *)key;
- (void)setOption:(id)a3 forMirroringKey:(id)a4;
- (void)setReadOnly:(BOOL)readOnly;
- (void)setShouldAddStoreAsynchronously:(BOOL)shouldAddStoreAsynchronously;
- (void)setShouldInferMappingModelAutomatically:(BOOL)shouldInferMappingModelAutomatically;
- (void)setShouldInvokeCompletionHandlerConcurrently:(BOOL)a3;
- (void)setShouldMigrateStoreAutomatically:(BOOL)shouldMigrateStoreAutomatically;
- (void)setTimeout:(NSTimeInterval)timeout;
- (void)setType:(NSString *)type;
- (void)setURL:(NSURL *)URL;
- (void)setUsesPersistentHistoryTracking:(BOOL)a3;
- (void)setValue:(NSObject *)value forPragmaNamed:(NSString *)name;
@end

@implementation NSPersistentStoreDescription

- (NSPersistentCloudKitContainerOptions)cloudKitContainerOptions
{
  return (NSPersistentCloudKitContainerOptions *)-[NSDictionary objectForKey:]( -[NSPersistentStoreDescription options](self, "options"),  "objectForKey:",  @"NSPersistentCloudKitContainerOptionsKey");
}

- (void)setCloudKitContainerOptions:(NSPersistentCloudKitContainerOptions *)cloudKitContainerOptions
{
}

+ (NSPersistentStoreDescription)persistentStoreDescriptionWithURL:(NSURL *)URL
{
  return (NSPersistentStoreDescription *)(id)[objc_alloc((Class)a1) initWithURL:URL];
}

+ (id)inMemoryPersistentStoreDescription
{
  id v2 = objc_alloc_init((Class)a1);
  [v2 setType:@"SQLite"];
  objc_msgSend( v2,  "setURL:",  objc_msgSend(MEMORY[0x189604030], "fileURLWithPath:isDirectory:", @"/dev/null", 0));
  return v2;
}

- (NSDictionary)options
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_options, "copy");
}

- (void)setOption:(NSObject *)option forKey:(NSString *)key
{
  options = self->_options;
  if (option) {
    -[NSMutableDictionary setObject:forKey:](options, "setObject:forKey:", option, key);
  }
  else {
    -[NSMutableDictionary removeObjectForKey:](options, "removeObjectForKey:", key);
  }
}

- (BOOL)isReadOnly
{
  id v2 = (void *)-[NSMutableDictionary objectForKey:]( self->_options,  "objectForKey:",  @"NSReadOnlyPersistentStoreOption");
  if (v2) {
    LOBYTE(v2) = [v2 BOOLValue];
  }
  return (char)v2;
}

- (void)setReadOnly:(BOOL)readOnly
{
}

- (NSTimeInterval)timeout
{
  id v2 = (void *)-[NSMutableDictionary objectForKey:]( self->_options,  "objectForKey:",  @"NSPersistentStoreTimeoutOption");
  if (!v2) {
    return 240.0;
  }
  [v2 doubleValue];
  return result;
}

- (void)setTimeout:(NSTimeInterval)timeout
{
}

- (NSDictionary)sqlitePragmas
{
  NSTimeInterval result = (NSDictionary *)-[NSMutableDictionary objectForKey:]( self->_options,  "objectForKey:",  @"NSSQLitePragmasOption");
  if (!result) {
    return (NSDictionary *)MEMORY[0x189604A60];
  }
  return result;
}

- (void)setValue:(NSObject *)value forPragmaNamed:(NSString *)name
{
  id v7 = (id)-[NSDictionary mutableCopy]( -[NSPersistentStoreDescription sqlitePragmas](self, "sqlitePragmas"),  "mutableCopy");
  if (value) {
    [v7 setObject:value forKey:name];
  }
  else {
    [v7 removeObjectForKey:name];
  }
  -[NSPersistentStoreDescription setOption:forKey:]( self,  "setOption:forKey:",  (id)[v7 copy],  @"NSSQLitePragmasOption");
}

- (BOOL)shouldAddStoreAsynchronously
{
  id v2 = (void *)-[NSMutableDictionary objectForKey:]( self->_options,  "objectForKey:",  @"NSAddStoreAsynchronouslyOption");
  if (v2) {
    LOBYTE(v2) = [v2 BOOLValue];
  }
  return (char)v2;
}

- (void)setShouldAddStoreAsynchronously:(BOOL)shouldAddStoreAsynchronously
{
}

- (BOOL)shouldInvokeCompletionHandlerConcurrently
{
  id v2 = (void *)-[NSMutableDictionary objectForKey:]( self->_options,  "objectForKey:",  @"NSInvokeCompletionHandlerConcurrently");
  if (v2) {
    LOBYTE(v2) = [v2 BOOLValue];
  }
  return (char)v2;
}

- (void)setShouldInvokeCompletionHandlerConcurrently:(BOOL)a3
{
}

- (BOOL)shouldMigrateStoreAutomatically
{
  id v2 = (void *)-[NSMutableDictionary objectForKey:]( self->_options,  "objectForKey:",  @"NSMigratePersistentStoresAutomaticallyOption");
  if (v2) {
    LOBYTE(v2) = [v2 BOOLValue];
  }
  return (char)v2;
}

- (void)setShouldMigrateStoreAutomatically:(BOOL)shouldMigrateStoreAutomatically
{
}

- (BOOL)shouldInferMappingModelAutomatically
{
  id v2 = (void *)-[NSMutableDictionary objectForKey:]( self->_options,  "objectForKey:",  @"NSInferMappingModelAutomaticallyOption");
  if (v2) {
    LOBYTE(v2) = [v2 BOOLValue];
  }
  return (char)v2;
}

- (void)setShouldInferMappingModelAutomatically:(BOOL)shouldInferMappingModelAutomatically
{
}

- (NSPersistentStoreDescription)init
{
  return -[NSPersistentStoreDescription initWithURL:]( self,  "initWithURL:",  [MEMORY[0x189604030] fileURLWithPath:@"/dev/null" isDirectory:0]);
}

- (NSPersistentStoreDescription)initWithURL:(NSURL *)url
{
  v8[2] = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSPersistentStoreDescription;
  v4 = -[NSPersistentStoreDescription init](&v6, sel_init);
  if (v4)
  {
    v4->_url = (NSURL *)-[NSURL copy](url, "copy");
    v4->_type = (NSString *)@"SQLite";
    v7[0] = @"NSInferMappingModelAutomaticallyOption";
    v7[1] = @"NSMigratePersistentStoresAutomaticallyOption";
    v8[0] = MEMORY[0x189604A88];
    v8[1] = MEMORY[0x189604A88];
    v4->_options = (NSMutableDictionary *)objc_msgSend( (id)objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  2),  "mutableCopy");
  }

  return v4;
}

- (unint64_t)hash
{
  return objc_msgSend(standardizedURL(-[NSPersistentStoreDescription URL](self, "URL")), "hash");
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v7) = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = standardizedURL(-[NSPersistentStoreDescription URL](self, "URL"));
      objc_super v6 = standardizedURL((void *)[a3 URL]);
      if (v5 == v6 || (int v7 = [v5 isEqual:v6]) != 0)
      {
        v8 = -[NSPersistentStoreDescription type](self, "type");
        if (v8 == (NSString *)[a3 type]
          || (int v7 = -[NSString isEqualToString:]( -[NSPersistentStoreDescription type](self, "type"),  "isEqualToString:",  [a3 type])) != 0)
        {
          v9 = -[NSPersistentStoreDescription configuration](self, "configuration");
          if (v9 == (NSString *)[a3 configuration]
            || (int v7 = -[NSString isEqual:]( -[NSPersistentStoreDescription configuration](self, "configuration"),  "isEqual:",  [a3 configuration])) != 0)
          {
            LOBYTE(v7) = -[NSDictionary isEqual:]( -[NSPersistentStoreDescription options](self, "options"),  "isEqual:",  [a3 options]);
          }
        }
      }
    }

    else
    {
      LOBYTE(v7) = 0;
    }
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (id *)[objc_alloc((Class)objc_opt_class()) initWithURL:self->_url];

  v4[3] = (id)-[NSString copy](self->_configuration, "copy");
  v4[2] = (id)-[NSString copy](self->_type, "copy");

  v4[1] = (id)-[NSMutableDictionary mutableCopy](self->_options, "mutableCopy");
  return v4;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSPersistentStoreDescription;
  return (id)[NSString stringWithFormat:@"%@ (type: %@, url: %@)", -[NSPersistentStoreDescription description](&v3, sel_description), -[NSPersistentStoreDescription type](self, "type"), -[NSPersistentStoreDescription URL](self, "URL")];
}

- (void)dealloc
{
  type = self->_type;
  if (type) {

  }
  configuration = self->_configuration;
  if (configuration) {

  }
  url = self->_url;
  if (url) {

  }
  options = self->_options;
  if (options) {

  }
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSPersistentStoreDescription;
  -[NSPersistentStoreDescription dealloc](&v7, sel_dealloc);
}

- (void)setMirroringDelegate:(id)a3
{
}

- (id)mirroringDelegate
{
  return (id)objc_msgSend( -[NSPersistentStoreDescription mirroringOptions](self, "mirroringOptions"),  "objectForKey:",  @"NSPersistentStoreMirroringDelegateOptionKey");
}

- (id)mirroringOptions
{
  id result = (id)-[NSMutableDictionary objectForKey:]( self->_options,  "objectForKey:",  @"NSPersistentStoreMirroringOptionsKey");
  if (!result) {
    return (id)[MEMORY[0x189603F68] dictionary];
  }
  return result;
}

- (void)setOption:(id)a3 forMirroringKey:(id)a4
{
  id v7 = (id)objc_msgSend( (id)-[NSMutableDictionary objectForKey:]( self->_options,  "objectForKey:",  @"NSPersistentStoreMirroringOptionsKey"),  "mutableCopy");
  if (!v7) {
    id v7 = objc_alloc_init(MEMORY[0x189603FC8]);
  }
  if (a3) {
    [v7 setObject:a3 forKey:a4];
  }
  else {
    [v7 removeObjectForKey:a4];
  }
  id v8 = (id)[v7 copy];
  -[NSMutableDictionary setObject:forKey:]( self->_options,  "setObject:forKey:",  v8,  @"NSPersistentStoreMirroringOptionsKey");
}

- (BOOL)usesPersistentHistoryTracking
{
  id v2 = (void *)-[NSMutableDictionary objectForKey:]( self->_options,  "objectForKey:",  @"NSPersistentHistoryTrackingKey");
  if (v2)
  {
    objc_super v3 = v2;
    if ([v2 isNSDictionary])
    {
      LOBYTE(v2) = 1;
    }

    else
    {
      LODWORD(v2) = [v3 isNSNumber];
      if ((_DWORD)v2) {
        LOBYTE(v2) = [v3 BOOLValue];
      }
    }
  }

  return (char)v2;
}

- (void)setUsesPersistentHistoryTracking:(BOOL)a3
{
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setType:(NSString *)type
{
}

- (NSString)configuration
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setConfiguration:(NSString *)configuration
{
}

- (NSURL)URL
{
  return (NSURL *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setURL:(NSURL *)URL
{
}

@end