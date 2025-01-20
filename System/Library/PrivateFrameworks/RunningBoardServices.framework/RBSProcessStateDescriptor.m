@interface RBSProcessStateDescriptor
+ (BOOL)supportsRBSXPCSecureCoding;
+ (id)descriptor;
- (BOOL)isEqual:(id)a3;
- (NSArray)endowmentNamespaces;
- (NSString)debugDescription;
- (NSString)description;
- (RBSProcessStateDescriptor)init;
- (RBSProcessStateDescriptor)initWithRBSXPCCoder:(id)a3;
- (id)_endowmentNamespaces;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)values;
- (void)encodeWithRBSXPCCoder:(id)a3;
- (void)filterState:(id)a3;
- (void)setEndowmentNamespaces:(id)a3;
- (void)setValues:(unint64_t)a3;
@end

@implementation RBSProcessStateDescriptor

+ (id)descriptor
{
  return objc_alloc_init((Class)a1);
}

- (RBSProcessStateDescriptor)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RBSProcessStateDescriptor;
  result = -[RBSProcessStateDescriptor init](&v3, sel_init);
  if (result) {
    result->_values = 1LL;
  }
  return result;
}

- (void)setEndowmentNamespaces:(id)a3
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x189604010], "setWithArray:");
    v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
    endowmentNamespaces = self->_endowmentNamespaces;
    self->_endowmentNamespaces = v4;
  }

  else
  {
    endowmentNamespaces = self->_endowmentNamespaces;
    self->_endowmentNamespaces = 0LL;
  }
}

- (NSArray)endowmentNamespaces
{
  return -[NSSet allObjects](self->_endowmentNamespaces, "allObjects");
}

- (id)_endowmentNamespaces
{
  if (a1) {
    a1 = (id *)a1[1];
  }
  return a1;
}

- (void)filterState:(id)a3
{
  id v4 = a3;
  v5 = v4;
  unint64_t values = self->_values;
  if ((values & 1) != 0)
  {
    if ((values & 4) != 0) {
      goto LABEL_3;
    }
  }

  else
  {
    [v4 setTaskState:0];
    [v5 setDebugState:0];
    if ((values & 4) != 0)
    {
LABEL_3:
      if ((values & 0x8000) != 0) {
        goto LABEL_4;
      }
LABEL_11:
      if (-[NSSet count](self->_endowmentNamespaces, "count")
        && ([v5 endowmentNamespaces],
            v7 = (void *)objc_claimAutoreleasedReturnValue(),
            v7,
            v7))
      {
        v8 = (void *)-[NSSet mutableCopy](self->_endowmentNamespaces, "mutableCopy");
        [v5 endowmentNamespaces];
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 intersectSet:v9];

        if ([v8 count]) {
          v10 = v8;
        }
        else {
          v10 = 0LL;
        }
        [v5 setEndowmentNamespaces:v10];

        if ((values & 2) == 0) {
          goto LABEL_19;
        }
      }

      else
      {
        [v5 setEndowmentNamespaces:0];
        if ((values & 2) == 0) {
          goto LABEL_19;
        }
      }

void __41__RBSProcessStateDescriptor_filterState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x189604010];
  id v7 = v3;
  [v3 endowmentNamespace];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setWithObject:v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RBSProcessStateDescriptor *)a3;
  if (self == v4)
  {
    char v6 = 1;
    goto LABEL_14;
  }

  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    id v7 = v4;
    v8 = v7;
    if (self->_values != v7->_values) {
      goto LABEL_11;
    }
    endowmentNamespaces = self->_endowmentNamespaces;
    v10 = (const __CFSet *)v7->_endowmentNamespaces;
    if (endowmentNamespaces == (NSSet *)v10)
    {
      char v6 = 1;
      goto LABEL_13;
    }

    char v6 = 0;
    if (!endowmentNamespaces || !v10) {
      goto LABEL_13;
    }
    CFIndex Count = CFSetGetCount((CFSetRef)endowmentNamespaces);
    if (Count == CFSetGetCount(v10)) {
      char v6 = -[NSSet isEqualToSet:](endowmentNamespaces, "isEqualToSet:", v10);
    }
    else {
LABEL_11:
    }
      char v6 = 0;
LABEL_13:

    goto LABEL_14;
  }

  char v6 = 0;
LABEL_14:

  return v6;
}

- (NSString)description
{
  id v3 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = (void *)[v3 initWithFormat:@"<%@| values:%llx>", v4, self->_values];

  return (NSString *)v5;
}

- (NSString)debugDescription
{
  id v4 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t values = self->_values;
  if (-[NSSet count](self->_endowmentNamespaces, "count")) {
    id v7 = @" namespaces:[";
  }
  else {
    id v7 = &stru_189DE1D08;
  }
  NSUInteger v8 = -[NSSet count](self->_endowmentNamespaces, "count");
  if (v8)
  {
    v2 = -[NSSet allObjects](self->_endowmentNamespaces, "allObjects");
    objc_msgSend(v2, "componentsJoinedByString:", @", ");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v9 = &stru_189DE1D08;
  }

  NSUInteger v10 = -[NSSet count](self->_endowmentNamespaces, "count");
  v11 = @"]";
  if (!v10) {
    v11 = &stru_189DE1D08;
  }
  v12 = (void *)[v4 initWithFormat:@"<%@| values:%llx%@%@%@>", v5, values, v7, v9, v11];
  if (v8)
  {
  }

  return (NSString *)v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = -[RBSProcessStateDescriptor init]( +[RBSProcessStateDescriptor allocWithZone:](&OBJC_CLASS___RBSProcessStateDescriptor, "allocWithZone:", a3),  "init");
  v4->_unint64_t values = self->_values;
  uint64_t v5 = -[NSSet copy](self->_endowmentNamespaces, "copy");
  endowmentNamespaces = v4->_endowmentNamespaces;
  v4->_endowmentNamespaces = (NSSet *)v5;

  return v4;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  unint64_t values = self->_values;
  id v5 = a3;
  [v5 encodeUInt64:values forKey:@"_values"];
  -[RBSProcessStateDescriptor endowmentNamespaces](self, "endowmentNamespaces");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v6 forKey:@"_endowmentNamespaces"];
}

- (RBSProcessStateDescriptor)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = -[RBSProcessStateDescriptor init](self, "init");
  if (v5)
  {
    v5->_unint64_t values = [v4 decodeUInt64ForKey:@"_values"];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = [v4 decodeCollectionOfClass:v6 containingClass:objc_opt_class() forKey:@"_endowmentNamespaces"];
    endowmentNamespaces = v5->_endowmentNamespaces;
    v5->_endowmentNamespaces = (NSSet *)v7;
  }

  return v5;
}

- (unint64_t)values
{
  return self->_values;
}

- (void)setValues:(unint64_t)a3
{
  self->_unint64_t values = a3;
}

- (void).cxx_destruct
{
}

@end