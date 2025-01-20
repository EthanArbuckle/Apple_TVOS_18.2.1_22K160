@interface KCSharingGroupFetchRequest
+ (BOOL)supportsSecureCoding;
+ (id)all;
+ (id)groupName:(id)a3;
+ (id)pending;
+ (id)predicateMatchingAllGroups;
+ (id)predicateMatchingGroupsWithInviteStatus:(int64_t)a3;
+ (id)predicateMatchingGroupsWithName:(id)a3;
- (KCSharingGroupFetchRequest)init;
- (KCSharingGroupFetchRequest)initWithCoder:(id)a3;
- (KCSharingGroupFetchRequest)initWithPredicate:(id)a3;
- (NSPredicate)predicate;
- (void)encodeWithCoder:(id)a3;
@end

@implementation KCSharingGroupFetchRequest

- (KCSharingGroupFetchRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___KCSharingGroupFetchRequest;
  v2 = -[KCSharingGroupFetchRequest init](&v6, sel_init);
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1896079C8] predicateWithValue:1];
    predicate = v2->_predicate;
    v2->_predicate = (NSPredicate *)v3;
  }

  return v2;
}

- (KCSharingGroupFetchRequest)initWithPredicate:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___KCSharingGroupFetchRequest;
  objc_super v6 = -[KCSharingGroupFetchRequest init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_predicate, a3);
  }

  return v7;
}

- (KCSharingGroupFetchRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___KCSharingGroupFetchRequest;
  id v5 = -[KCSharingGroupFetchRequest init](&v9, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"predicate"];
    predicate = v5->_predicate;
    v5->_predicate = (NSPredicate *)v6;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  -[KCSharingGroupFetchRequest predicate](self, "predicate");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"predicate"];
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)all
{
  return objc_alloc_init(&OBJC_CLASS___KCSharingGroupFetchRequest);
}

+ (id)groupName:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = -[KCSharingGroupFetchRequest initWithPredicate:]( objc_alloc(&OBJC_CLASS___KCSharingGroupFetchRequest),  "initWithPredicate:",  v3);

  return v4;
}

+ (id)pending
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = -[KCSharingGroupFetchRequest initWithPredicate:]( objc_alloc(&OBJC_CLASS___KCSharingGroupFetchRequest),  "initWithPredicate:",  v2);

  return v3;
}

+ (id)predicateMatchingAllGroups
{
  return (id)[MEMORY[0x1896079C8] predicateWithValue:1];
}

+ (id)predicateMatchingGroupsWithName:(id)a3
{
  return (id)[MEMORY[0x1896079C8] predicateWithValue:1];
}

+ (id)predicateMatchingGroupsWithInviteStatus:(int64_t)a3
{
  return (id)[MEMORY[0x1896079C8] predicateWithValue:1];
}

@end