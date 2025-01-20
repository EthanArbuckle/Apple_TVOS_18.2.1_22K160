@interface ICLBundlePersonaRecord
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (ICLBundlePersonaRecord)init;
- (ICLBundlePersonaRecord)initWithCoder:(id)a3;
- (NSDictionary)environmentVariables;
- (NSDictionary)groupContainerURLs;
- (NSURL)dataContainerURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDataContainerURL:(id)a3;
- (void)setEnvironmentVariables:(id)a3;
- (void)setGroupContainerURLs:(id)a3;
@end

@implementation ICLBundlePersonaRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICLBundlePersonaRecord)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ICLBundlePersonaRecord;
  return -[ICLBundlePersonaRecord init](&v3, sel_init);
}

- (ICLBundlePersonaRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___ICLBundlePersonaRecord;
  v5 = -[ICLBundlePersonaRecord init](&v20, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dataContainerURL"];
    dataContainerURL = v5->_dataContainerURL;
    v5->_dataContainerURL = (NSURL *)v6;

    v8 = (void *)MEMORY[0x189604010];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"groupContainerURLs"];
    groupContainerURLs = v5->_groupContainerURLs;
    v5->_groupContainerURLs = (NSDictionary *)v12;

    v14 = (void *)MEMORY[0x189604010];
    uint64_t v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"environmentVariables"];
    environmentVariables = v5->_environmentVariables;
    v5->_environmentVariables = (NSDictionary *)v17;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[ICLBundlePersonaRecord dataContainerURL](self, "dataContainerURL");
  [v4 encodeObject:v5 forKey:@"dataContainerURL"];

  -[ICLBundlePersonaRecord groupContainerURLs](self, "groupContainerURLs");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"groupContainerURLs"];

  -[ICLBundlePersonaRecord environmentVariables](self, "environmentVariables");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v7 forKey:@"environmentVariables"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[ICLBundlePersonaRecord dataContainerURL](self, "dataContainerURL");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = (void *)[v6 copyWithZone:a3];
  [v5 setDataContainerURL:v7];
  v8 = -[ICLBundlePersonaRecord groupContainerURLs](self, "groupContainerURLs");
  uint64_t v9 = (void *)[v8 copyWithZone:a3];
  [v5 setGroupContainerURLs:v9];

  -[ICLBundlePersonaRecord environmentVariables](self, "environmentVariables");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)[v10 copyWithZone:a3];
  [v5 setEnvironmentVariables:v11];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ICLBundlePersonaRecord *)a3;
  if (v4 == self)
  {
    BOOL v15 = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[ICLBundlePersonaRecord dataContainerURL](self, "dataContainerURL");
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICLBundlePersonaRecord dataContainerURL](v5, "dataContainerURL");
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v8 = MICompareObjects(v6, v7);

      if (v8)
      {
        -[ICLBundlePersonaRecord groupContainerURLs](self, "groupContainerURLs");
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICLBundlePersonaRecord groupContainerURLs](v5, "groupContainerURLs");
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v11 = MICompareObjects(v9, v10);

        if (v11)
        {
          -[ICLBundlePersonaRecord environmentVariables](self, "environmentVariables");
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[ICLBundlePersonaRecord environmentVariables](v5, "environmentVariables");
          BOOL v14 = MICompareObjects(v12, v13);

          if (v14)
          {
            BOOL v15 = 1;
LABEL_19:

            goto LABEL_20;
          }

          if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
          {
LABEL_18:
            BOOL v15 = 0;
            goto LABEL_19;
          }
        }

        else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        {
          goto LABEL_18;
        }
      }

      else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      {
        goto LABEL_18;
      }

      MOLogWrite();
      goto LABEL_18;
    }

    BOOL v15 = 0;
  }

- (unint64_t)hash
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 hash];
  v5 = -[ICLBundlePersonaRecord groupContainerURLs](self, "groupContainerURLs");
  uint64_t v6 = [v5 hash] ^ v4;

  -[ICLBundlePersonaRecord environmentVariables](self, "environmentVariables");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (id)description
{
  objc_super v3 = (void *)NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICLBundlePersonaRecord dataContainerURL](self, "dataContainerURL");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 path];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICLBundlePersonaRecord groupContainerURLs](self, "groupContainerURLs");
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICLBundlePersonaRecord environmentVariables](self, "environmentVariables");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<%@: dataContainerURL: %@ groupContainerURLs: %@ environmentVariables: %@>", v5, v7, v8, v9];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSURL)dataContainerURL
{
  return self->_dataContainerURL;
}

- (void)setDataContainerURL:(id)a3
{
}

- (NSDictionary)groupContainerURLs
{
  return self->_groupContainerURLs;
}

- (void)setGroupContainerURLs:(id)a3
{
}

- (NSDictionary)environmentVariables
{
  return self->_environmentVariables;
}

- (void)setEnvironmentVariables:(id)a3
{
}

- (void).cxx_destruct
{
}

@end