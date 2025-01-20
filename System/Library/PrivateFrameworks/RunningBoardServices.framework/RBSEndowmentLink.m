@interface RBSEndowmentLink
+ (BOOL)supportsRBSXPCSecureCoding;
+ (id)endowmentLinkForNamespace:(id)a3 sourceEnvironment:(id)a4 sourcePid:(int)a5 targetEnvironment:(id)a6 targetPid:(int)a7;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)endowmentNamespace;
- (NSString)sourceEnvironment;
- (NSString)targetEnvironment;
- (RBSEndowmentLink)initWithRBSXPCCoder:(id)a3;
- (id)_initWithNamespace:(void *)a3 sourceEnvironment:(int)a4 sourcePid:(void *)a5 targetEnvironment:(int)a6 targetPid:;
- (id)copyWithZone:(_NSZone *)a3;
- (int)sourcePid;
- (int)targetPid;
- (unint64_t)hash;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSEndowmentLink

+ (id)endowmentLinkForNamespace:(id)a3 sourceEnvironment:(id)a4 sourcePid:(int)a5 targetEnvironment:(id)a6 targetPid:(int)a7
{
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  v14 = -[RBSEndowmentLink _initWithNamespace:sourceEnvironment:sourcePid:targetEnvironment:targetPid:]( (id *)objc_alloc(&OBJC_CLASS___RBSEndowmentLink),  v13,  v12,  a5,  v11,  a7);

  return v14;
}

- (id)_initWithNamespace:(void *)a3 sourceEnvironment:(int)a4 sourcePid:(void *)a5 targetEnvironment:(int)a6 targetPid:
{
  id v12 = a2;
  id v13 = a3;
  id v14 = a5;
  if (a1)
  {
    v17.receiver = a1;
    v17.super_class = (Class)&OBJC_CLASS___RBSEndowmentLink;
    v15 = (id *)objc_msgSendSuper2(&v17, sel_init);
    a1 = v15;
    if (v15)
    {
      objc_storeStrong(v15 + 2, a2);
      objc_storeStrong(a1 + 3, a3);
      *((_DWORD *)a1 + 2) = a4;
      objc_storeStrong(a1 + 4, a5);
      *((_DWORD *)a1 + 3) = a6;
    }
  }

  return a1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(&OBJC_CLASS___RBSEndowmentLink);
  objc_storeStrong((id *)&v4->_endowmentNamespace, self->_endowmentNamespace);
  objc_storeStrong((id *)&v4->_sourceEnvironment, self->_sourceEnvironment);
  v4->_sourcePid = self->_sourcePid;
  objc_storeStrong((id *)&v4->_targetEnvironment, self->_targetEnvironment);
  v4->_targetPid = self->_targetPid;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RBSEndowmentLink *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
    goto LABEL_5;
  }

  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()) {
    goto LABEL_3;
  }
  endowmentNamespace = self->_endowmentNamespace;
  v9 = v4->_endowmentNamespace;
  if (endowmentNamespace != v9)
  {
    BOOL v6 = 0;
    if (!endowmentNamespace || !v9) {
      goto LABEL_5;
    }
  }

  sourceEnvironment = self->_sourceEnvironment;
  id v11 = v4->_sourceEnvironment;
  if (sourceEnvironment != v11)
  {
    BOOL v6 = 0;
    if (!sourceEnvironment || !v11) {
      goto LABEL_5;
    }
  }

  if (self->_sourcePid != v4->_sourcePid) {
    goto LABEL_3;
  }
  targetEnvironment = self->_targetEnvironment;
  id v13 = v4->_targetEnvironment;
  if (targetEnvironment == v13)
  {
LABEL_19:
    BOOL v6 = self->_targetPid == v4->_targetPid;
    goto LABEL_5;
  }

  BOOL v6 = 0;
  if (targetEnvironment && v13)
  {
LABEL_3:
    BOOL v6 = 0;
  }

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_endowmentNamespace, "hash");
  NSUInteger v4 = -[NSString hash](self->_sourceEnvironment, "hash") ^ v3;
  uint64_t sourcePid = self->_sourcePid;
  return v4 ^ sourcePid ^ -[NSString hash](self->_targetEnvironment, "hash") ^ self->_targetPid;
}

- (NSString)description
{
  id v3 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  NSUInteger v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = (void *)[v3 initWithFormat:@"<%@| namespace:%@ srcEnv:%d/%@ targEnv:%d/%@>", v4, self->_endowmentNamespace, self->_sourcePid, self->_sourceEnvironment, self->_targetPid, self->_targetEnvironment];

  return (NSString *)v5;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  endowmentNamespace = self->_endowmentNamespace;
  id v5 = a3;
  [v5 encodeObject:endowmentNamespace forKey:@"_endowmentNamespace"];
  [v5 encodeObject:self->_sourceEnvironment forKey:@"_sourceEnvironment"];
  [v5 encodeInt64:self->_sourcePid forKey:@"_sourcePid"];
  [v5 encodeObject:self->_targetEnvironment forKey:@"_targetEnvironment"];
  [v5 encodeInt64:self->_targetPid forKey:@"_targetPid"];
}

- (RBSEndowmentLink)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___RBSEndowmentLink;
  id v5 = -[RBSEndowmentLink init](&v13, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_endowmentNamespace"];
    endowmentNamespace = v5->_endowmentNamespace;
    v5->_endowmentNamespace = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_sourceEnvironment"];
    sourceEnvironment = v5->_sourceEnvironment;
    v5->_sourceEnvironment = (NSString *)v8;

    v5->_uint64_t sourcePid = [v4 decodeInt64ForKey:@"_sourcePid"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_targetEnvironment"];
    targetEnvironment = v5->_targetEnvironment;
    v5->_targetEnvironment = (NSString *)v10;

    v5->_targetPid = [v4 decodeInt64ForKey:@"_targetPid"];
  }

  return v5;
}

- (NSString)endowmentNamespace
{
  return self->_endowmentNamespace;
}

- (NSString)sourceEnvironment
{
  return self->_sourceEnvironment;
}

- (int)sourcePid
{
  return self->_sourcePid;
}

- (NSString)targetEnvironment
{
  return self->_targetEnvironment;
}

- (int)targetPid
{
  return self->_targetPid;
}

- (void).cxx_destruct
{
}

@end