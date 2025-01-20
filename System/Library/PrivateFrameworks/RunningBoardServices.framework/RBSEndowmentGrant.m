@interface RBSEndowmentGrant
+ (id)grantWithNamespace:(id)a3 endowment:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)endowmentNamespace;
- (OS_xpc_object)encodedEndowment;
- (RBSEndowmentGrant)initWithRBSXPCCoder:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSEndowmentGrant

+ (id)grantWithNamespace:(id)a3 endowment:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 handleFailureInMethod:a2, a1, @"RBSEndowmentGrant.m", 17, @"Invalid parameter not satisfying: %@", @"nspace != nil" object file lineNumber description];
  }

  v9 = (void *)[objc_alloc((Class)a1) _init];
  if (v9)
  {
    uint64_t v10 = [v7 copy];
    v11 = (void *)v9[1];
    v9[1] = v10;

    uint64_t v12 = RBSEndowmentEncode(v8);
    v13 = (void *)v9[2];
    v9[2] = v12;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___RBSEndowmentGrant;
  if (!-[RBSAttribute isEqual:](&v12, sel_isEqual_, v4)) {
    goto LABEL_14;
  }
  endowmentNamespace = self->_endowmentNamespace;
  v6 = (NSString *)v4[1];
  if (endowmentNamespace != v6)
  {
    BOOL v7 = !endowmentNamespace || v6 == 0LL;
    if (v7 || !-[NSString isEqualToString:](endowmentNamespace, "isEqualToString:")) {
      goto LABEL_14;
    }
  }

  encodedEndowment = self->_encodedEndowment;
  v9 = (OS_xpc_object *)v4[2];
  if (encodedEndowment)
  {
    if (v9 && (encodedEndowment == v9 || xpc_equal(encodedEndowment, v9))) {
      goto LABEL_12;
    }
LABEL_14:
    BOOL v10 = 0;
    goto LABEL_15;
  }

  if (v9) {
    goto LABEL_14;
  }
LABEL_12:
  BOOL v10 = 1;
LABEL_15:

  return v10;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_endowmentNamespace, "hash");
}

- (id)description
{
  id v3 = objc_alloc(NSString);
  uint64_t v4 = [(id)objc_opt_class() description];
  v5 = (void *)v4;
  if (self->_encodedEndowment) {
    v6 = @" hasEndowment";
  }
  else {
    v6 = &stru_189DE1D08;
  }
  BOOL v7 = (void *)[v3 initWithFormat:@"<%@| namespace:%@%@>", v4, self->_endowmentNamespace, v6];

  return v7;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RBSEndowmentGrant;
  id v4 = a3;
  -[RBSAttribute encodeWithRBSXPCCoder:](&v6, sel_encodeWithRBSXPCCoder_, v4);
  objc_msgSend( v4,  "encodeObject:forKey:",  self->_endowmentNamespace,  @"_endowmentNamespace",  v6.receiver,  v6.super_class);
  RBSXPCPackObject(self->_encodedEndowment);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeXPCObject:v5 forKey:@"_encodedEndowment"];
}

- (RBSEndowmentGrant)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeStringForKey:@"_endowmentNamespace"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v13.receiver = self;
    v13.super_class = (Class)&OBJC_CLASS___RBSEndowmentGrant;
    objc_super v6 = -[RBSAttribute initWithRBSXPCCoder:](&v13, sel_initWithRBSXPCCoder_, v4);
    BOOL v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_endowmentNamespace, v5);
      [v4 decodeXPCObjectOfType:MEMORY[0x1895F9250] forKey:@"_encodedEndowment"];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = RBSXPCUnpackObject(v8);
      encodedEndowment = v7->_encodedEndowment;
      v7->_encodedEndowment = (OS_xpc_object *)v9;
    }

    self = v7;
    v11 = self;
  }

  else
  {
    v11 = 0LL;
  }

  return v11;
}

- (NSString)endowmentNamespace
{
  return self->_endowmentNamespace;
}

- (OS_xpc_object)encodedEndowment
{
  return self->_encodedEndowment;
}

- (void).cxx_destruct
{
}

@end