@interface _LSEmptyPropertyList
+ (BOOL)supportsSecureCoding;
+ (id)sharedInstance;
- (BOOL)_getPropertyList:(id *)a3;
- (BOOL)_getValue:(id *)a3 forPropertyListKey:(id)a4;
- (_LSEmptyPropertyList)initWithCoder:(id)a3;
- (id)uncheckedObjectsForKeys:(id)a3;
@end

@implementation _LSEmptyPropertyList

+ (id)sharedInstance
{
  if (+[_LSEmptyPropertyList sharedInstance]::once != -1) {
    dispatch_once(&+[_LSEmptyPropertyList sharedInstance]::once, &__block_literal_global_41);
  }
  return (id)+[_LSEmptyPropertyList sharedInstance]::result;
}

- (id)uncheckedObjectsForKeys:(id)a3
{
  return (id)MEMORY[0x189604A60];
}

- (BOOL)_getPropertyList:(id *)a3
{
  *a3 = (id)MEMORY[0x189604A60];
  return 1;
}

- (BOOL)_getValue:(id *)a3 forPropertyListKey:(id)a4
{
  *a3 = 0LL;
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_LSEmptyPropertyList)initWithCoder:(id)a3
{
  v4 = (_LSEmptyPropertyList *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end