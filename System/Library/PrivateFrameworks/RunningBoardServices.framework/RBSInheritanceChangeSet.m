@interface RBSInheritanceChangeSet
+ (BOOL)supportsRBSXPCSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSSet)gainedInheritances;
- (NSSet)lostInheritances;
- (NSString)description;
- (RBSInheritanceChangeSet)initWithGainedInheritances:(id)a3 lostInheritances:(id)a4;
- (RBSInheritanceChangeSet)initWithRBSXPCCoder:(id)a3;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSInheritanceChangeSet

- (RBSInheritanceChangeSet)initWithGainedInheritances:(id)a3 lostInheritances:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___RBSInheritanceChangeSet;
  v8 = -[RBSInheritanceChangeSet init](&v14, sel_init);
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    gainedInheritances = v8->_gainedInheritances;
    v8->_gainedInheritances = (NSSet *)v9;

    uint64_t v11 = [v7 copy];
    lostInheritances = v8->_lostInheritances;
    v8->_lostInheritances = (NSSet *)v11;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RBSInheritanceChangeSet *)a3;
  if (self == v4) {
    goto LABEL_14;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class())
  {
LABEL_3:
    char v6 = 0;
    goto LABEL_15;
  }

  gainedInheritances = self->_gainedInheritances;
  v8 = (const __CFSet *)v4->_gainedInheritances;
  if (gainedInheritances != (NSSet *)v8)
  {
    char v6 = 0;
    if (!gainedInheritances || !v8) {
      goto LABEL_15;
    }
    CFIndex Count = CFSetGetCount((CFSetRef)self->_gainedInheritances);
    if (Count != CFSetGetCount(v8) || !-[NSSet isEqualToSet:](gainedInheritances, "isEqualToSet:", v8)) {
      goto LABEL_3;
    }
  }

  lostInheritances = self->_lostInheritances;
  uint64_t v11 = (const __CFSet *)v4->_lostInheritances;
  if (lostInheritances == (NSSet *)v11)
  {
LABEL_14:
    char v6 = 1;
    goto LABEL_15;
  }

  char v6 = 0;
  if (lostInheritances && v11)
  {
    CFIndex v12 = CFSetGetCount((CFSetRef)lostInheritances);
    if (v12 == CFSetGetCount(v11))
    {
      char v6 = -[NSSet isEqualToSet:](lostInheritances, "isEqualToSet:", v11);
      goto LABEL_15;
    }

    goto LABEL_3;
  }

- (NSString)description
{
  id v3 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = (void *)[v3 initWithFormat:@"<%@| gained:%@ lost:%@>", v4, self->_gainedInheritances, self->_lostInheritances];

  return (NSString *)v5;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  if (-[NSSet count](self->_gainedInheritances, "count")) {
    [v4 encodeObject:self->_gainedInheritances forKey:@"gainedInheritances"];
  }
  if (-[NSSet count](self->_lostInheritances, "count")) {
    [v4 encodeObject:self->_lostInheritances forKey:@"lostInheritances"];
  }
}

- (RBSInheritanceChangeSet)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___RBSInheritanceChangeSet;
  uint64_t v5 = -[RBSInheritanceChangeSet init](&v13, sel_init);
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = [v4 decodeCollectionOfClass:v6 containingClass:objc_opt_class() forKey:@"gainedInheritances"];
    gainedInheritances = v5->_gainedInheritances;
    v5->_gainedInheritances = (NSSet *)v7;

    uint64_t v9 = objc_opt_class();
    uint64_t v10 = [v4 decodeCollectionOfClass:v9 containingClass:objc_opt_class() forKey:@"lostInheritances"];
    lostInheritances = v5->_lostInheritances;
    v5->_lostInheritances = (NSSet *)v10;
  }

  return v5;
}

- (NSSet)gainedInheritances
{
  return self->_gainedInheritances;
}

- (NSSet)lostInheritances
{
  return self->_lostInheritances;
}

- (void).cxx_destruct
{
}

@end