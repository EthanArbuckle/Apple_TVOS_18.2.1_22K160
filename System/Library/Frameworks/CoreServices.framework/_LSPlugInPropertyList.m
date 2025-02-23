@interface _LSPlugInPropertyList
+ (BOOL)supportsSecureCoding;
- (BOOL)_getPropertyList:(id *)a3;
- (BOOL)_getValue:(id *)a3 forPropertyListKey:(id)a4;
- (_LSPlugInPropertyList)initWithCoder:(id)a3;
- (_LSPlugInPropertyList)initWithInfoPlist:(id)a3 SDKPlist:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _LSPlugInPropertyList

- (_LSPlugInPropertyList)initWithInfoPlist:(id)a3 SDKPlist:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = -[_LSLazyPropertyList init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_infoPlist, a3);
    objc_storeStrong((id *)&v10->_sdkPlist, a4);
    v10->_mergeLock._os_unfair_lock_opaque = 0;
  }

  return v10;
}

- (BOOL)_getPropertyList:(id *)a3
{
  p_mergeLock = &self->_mergeLock;
  os_unfair_lock_lock(&self->_mergeLock);
  if (!self->_mergedPlist)
  {
    uint64_t v6 = -[_LSLazyPropertyList propertyList](self->_infoPlist);
    uint64_t v7 = -[_LSLazyPropertyList propertyList](self->_sdkPlist);
    id v8 = (void *)v7;
    if (v6 | v7)
    {
      if (v6)
      {
        objc_msgSend((id)v6, "ls_resolvePlugInKitInfoPlistWithDictionary:", v7);
        id v9 = (id)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        id v9 = (id)v7;
      }

      v10 = v9;
    }

    else
    {
      v10 = 0LL;
    }

    v11 = (NSDictionary *)[v10 copy];
    mergedPlist = self->_mergedPlist;
    self->_mergedPlist = v11;
  }

  os_unfair_lock_unlock(p_mergeLock);
  v13 = self->_mergedPlist;
  *a3 = v13;
  return v13 != 0LL;
}

- (BOOL)_getValue:(id *)a3 forPropertyListKey:(id)a4
{
  id v11 = 0LL;
  id v6 = a4;
  -[_LSPlugInPropertyList _getPropertyList:](self, "_getPropertyList:", &v11);
  id v7 = v11;
  [v7 objectForKeyedSubscript:v6];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  id v9 = v8;
  *a3 = v9;
  return v9 != 0LL;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS____LSPlugInPropertyList;
  id v4 = a3;
  -[_LSLazyPropertyList encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_infoPlist, @"infoPlist", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_sdkPlist forKey:@"sdkPlist"];
}

- (_LSPlugInPropertyList)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____LSPlugInPropertyList;
  objc_super v5 = -[_LSLazyPropertyList initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"infoPlist");
    uint64_t v7 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"sdkPlist");
    if (v6 | v7)
    {
      objc_storeStrong((id *)&v5->_infoPlist, (id)v6);
      objc_storeStrong((id *)&v5->_sdkPlist, (id)v7);
    }
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end