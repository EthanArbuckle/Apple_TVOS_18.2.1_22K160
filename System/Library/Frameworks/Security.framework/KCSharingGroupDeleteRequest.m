@interface KCSharingGroupDeleteRequest
+ (BOOL)supportsSecureCoding;
- (KCSharingGroupDeleteRequest)initWithCoder:(id)a3;
- (KCSharingGroupDeleteRequest)initWithGroupID:(id)a3;
- (NSString)groupID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation KCSharingGroupDeleteRequest

- (KCSharingGroupDeleteRequest)initWithGroupID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___KCSharingGroupDeleteRequest;
  v6 = -[KCSharingGroupDeleteRequest init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_groupID, a3);
  }

  return v7;
}

- (KCSharingGroupDeleteRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___KCSharingGroupDeleteRequest;
  id v5 = -[KCSharingGroupDeleteRequest init](&v9, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupID"];
    groupID = v5->_groupID;
    v5->_groupID = (NSString *)v6;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  -[KCSharingGroupDeleteRequest groupID](self, "groupID");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"groupID"];
}

- (NSString)groupID
{
  return self->_groupID;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end