@interface LSPropertyList
+ (LSPropertyList)new;
+ (LSPropertyList)propertyListWithContentsOfURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
+ (LSPropertyList)propertyListWithData:(id)a3;
+ (LSPropertyList)propertyListWithDictionary:(id)a3;
- (LSPropertyList)init;
- (NSDictionary)_expensiveDictionaryRepresentation;
- (NSString)_applicationIdentifier;
- (id)_init;
- (id)debugDescription;
- (id)description;
- (id)objectForKey:(id)a3 checkingKeyClass:(Class)a4 checkingValueClass:(Class)a5;
- (id)objectForKey:(id)a3 ofClass:(Class)a4;
- (id)objectForKey:(id)a3 ofClass:(Class)a4 valuesOfClass:(Class)a5;
- (id)objectsForKeys:(id)a3;
@end

@implementation LSPropertyList

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___LSPropertyList;
  return -[LSPropertyList init](&v3, sel_init);
}

- (LSPropertyList)init
{
}

+ (LSPropertyList)new
{
}

+ (LSPropertyList)propertyListWithData:(id)a3
{
  objc_super v3 = (void *)[a3 copy];
  v4 = +[_LSLazyPropertyList lazyPropertyListWithPropertyListData:]((uint64_t)&OBJC_CLASS____LSLazyPropertyList, v3);
  return (LSPropertyList *)v4;
}

+ (LSPropertyList)propertyListWithDictionary:(id)a3
{
  return (LSPropertyList *)+[_LSLazyPropertyList lazyPropertyListWithPropertyList:]( (uint64_t)&OBJC_CLASS____LSLazyPropertyList,  a3);
}

+ (LSPropertyList)propertyListWithContentsOfURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  return (LSPropertyList *)+[_LSLazyPropertyList lazyPropertyListWithPropertyListURL:options:error:]( (uint64_t)&OBJC_CLASS____LSLazyPropertyList,  a3,  a4,  (uint64_t)a5);
}

- (id)objectsForKeys:(id)a3
{
  v4 = objc_alloc(&OBJC_CLASS___LSBundleInfoCachedValues);
  return  -[LSBundleInfoCachedValues _initWithKeys:forDictionary:]( v4,  "_initWithKeys:forDictionary:",  a3,  MEMORY[0x189604A60]);
}

- (id)objectForKey:(id)a3 ofClass:(Class)a4
{
  return 0LL;
}

- (id)objectForKey:(id)a3 ofClass:(Class)a4 valuesOfClass:(Class)a5
{
  return 0LL;
}

- (id)objectForKey:(id)a3 checkingKeyClass:(Class)a4 checkingValueClass:(Class)a5
{
  return 0LL;
}

- (NSDictionary)_expensiveDictionaryRepresentation
{
  return (NSDictionary *)MEMORY[0x189604A60];
}

- (NSString)_applicationIdentifier
{
  return (NSString *)-[LSPropertyList objectForKey:ofClass:]( self,  "objectForKey:ofClass:",  @"application-identifier",  objc_opt_class());
}

- (id)description
{
  return (id)[objc_alloc(NSString) initWithFormat:@"<%@ %p>", objc_opt_class(), self];
}

- (id)debugDescription
{
  id v3 = objc_alloc(NSString);
  uint64_t v4 = objc_opt_class();
  v5 = -[LSPropertyList _expensiveDictionaryRepresentation](self, "_expensiveDictionaryRepresentation");
  v6 = (void *)[v3 initWithFormat:@"<%@ %p> %@", v4, self, v5];

  return v6;
}

@end