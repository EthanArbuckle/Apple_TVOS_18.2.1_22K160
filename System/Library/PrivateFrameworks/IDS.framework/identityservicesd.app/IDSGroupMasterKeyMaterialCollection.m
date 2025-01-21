@interface IDSGroupMasterKeyMaterialCollection
- (IDSGroupMasterKeyMaterialCollection)initWithMasterKeyMaterials:(id)a3 membershipURIs:(id)a4;
- (NSArray)masterKeyMaterials;
- (NSSet)membershipURIs;
- (id)debugDescription;
- (id)description;
@end

@implementation IDSGroupMasterKeyMaterialCollection

- (IDSGroupMasterKeyMaterialCollection)initWithMasterKeyMaterials:(id)a3 membershipURIs:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___IDSGroupMasterKeyMaterialCollection;
  v9 = -[IDSGroupMasterKeyMaterialCollection init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_masterKeyMaterials, a3);
    objc_storeStrong((id *)&v10->_membershipURIs, a4);
  }

  return v10;
}

- (id)description
{
  uint64_t v3 = objc_opt_class(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupMasterKeyMaterialCollection membershipURIs](self, "membershipURIs"));
  id v5 = [v4 count];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupMasterKeyMaterialCollection masterKeyMaterials](self, "masterKeyMaterials"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"<%@: %p URICount: %lu, MkMCount: %lu>",  v3,  self,  v5,  [v6 count]));

  return v7;
}

- (id)debugDescription
{
  uint64_t v3 = objc_opt_class(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupMasterKeyMaterialCollection membershipURIs](self, "membershipURIs"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupMasterKeyMaterialCollection masterKeyMaterials](self, "masterKeyMaterials"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p URIs: %@, MkMs: %@>",  v3,  self,  v4,  v5));

  return v6;
}

- (NSArray)masterKeyMaterials
{
  return self->_masterKeyMaterials;
}

- (NSSet)membershipURIs
{
  return self->_membershipURIs;
}

- (void).cxx_destruct
{
}

@end