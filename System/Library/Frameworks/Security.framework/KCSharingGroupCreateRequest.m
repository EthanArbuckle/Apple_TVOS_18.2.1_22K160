@interface KCSharingGroupCreateRequest
+ (BOOL)supportsSecureCoding;
- (KCSharingGroup)group;
- (KCSharingGroupCreateRequest)initWithCoder:(id)a3;
- (KCSharingGroupCreateRequest)initWithNewGroup:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation KCSharingGroupCreateRequest

- (KCSharingGroupCreateRequest)initWithNewGroup:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___KCSharingGroupCreateRequest;
  v6 = -[KCSharingGroupCreateRequest init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_group, a3);
  }

  return v7;
}

- (KCSharingGroupCreateRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___KCSharingGroupCreateRequest;
  id v5 = -[KCSharingGroupCreateRequest init](&v9, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"group"];
    group = v5->_group;
    v5->_group = (KCSharingGroup *)v6;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  -[KCSharingGroupCreateRequest group](self, "group");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"group"];
}

- (KCSharingGroup)group
{
  return self->_group;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end