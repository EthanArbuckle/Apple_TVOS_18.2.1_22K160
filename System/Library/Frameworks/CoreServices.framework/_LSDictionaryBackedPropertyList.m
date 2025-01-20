@interface _LSDictionaryBackedPropertyList
+ (BOOL)supportsSecureCoding;
- (BOOL)_getPropertyList:(id *)a3;
- (BOOL)_getValue:(id *)a3 forPropertyListKey:(id)a4;
- (_LSDictionaryBackedPropertyList)initWithCoder:(id)a3;
- (_LSDictionaryBackedPropertyList)initWithPropertyList:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _LSDictionaryBackedPropertyList

- (_LSDictionaryBackedPropertyList)initWithPropertyList:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____LSDictionaryBackedPropertyList;
  v5 = -[_LSLazyPropertyList init](&v9, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    plist = v5->_plist;
    v5->_plist = (NSDictionary *)v6;
  }

  return v5;
}

- (BOOL)_getPropertyList:(id *)a3
{
  id v4 = self->_plist;
  *a3 = v4;
  return v4 != 0LL;
}

- (BOOL)_getValue:(id *)a3 forPropertyListKey:(id)a4
{
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  *a3 = v5;
  return v5 != 0LL;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (_LSDictionaryBackedPropertyList)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  XNSGetPropertyListClasses();
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ls_decodeDictionaryWithKeysOfClass:valuesOfClasses:forKey:", v5, v6, @"plist");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[_LSDictionaryBackedPropertyList initWithPropertyList:](self, "initWithPropertyList:", v7);
  return v8;
}

- (void).cxx_destruct
{
}

@end