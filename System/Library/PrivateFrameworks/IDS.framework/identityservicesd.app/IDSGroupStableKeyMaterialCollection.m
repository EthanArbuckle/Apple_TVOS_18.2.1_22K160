@interface IDSGroupStableKeyMaterialCollection
- (IDSGroupStableKeyMaterialCollection)initWithStableKeyMaterials:(id)a3;
- (NSArray)stableKeyMaterials;
- (id)description;
@end

@implementation IDSGroupStableKeyMaterialCollection

- (IDSGroupStableKeyMaterialCollection)initWithStableKeyMaterials:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___IDSGroupStableKeyMaterialCollection;
  v6 = -[IDSGroupStableKeyMaterialCollection init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_stableKeyMaterials, a3);
  }

  return v7;
}

- (id)description
{
  uint64_t v3 = objc_opt_class(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupStableKeyMaterialCollection stableKeyMaterials](self, "stableKeyMaterials"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"<%@: %p SKMCount: %lu>",  v3,  self,  [v4 count]));

  return v5;
}

- (NSArray)stableKeyMaterials
{
  return self->_stableKeyMaterials;
}

- (void).cxx_destruct
{
}

@end