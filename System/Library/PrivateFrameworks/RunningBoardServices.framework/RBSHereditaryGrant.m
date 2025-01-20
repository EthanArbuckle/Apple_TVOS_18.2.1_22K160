@interface RBSHereditaryGrant
+ (id)grantWithNamespace:(id)a3 endowment:(id)a4 attributes:(id)a5;
+ (id)grantWithNamespace:(id)a3 sourceEnvironment:(id)a4 attributes:(id)a5;
+ (id)grantWithNamespace:(id)a3 sourceEnvironment:(id)a4 endowment:(id)a5 attributes:(id)a6;
- (BOOL)isEqual:(id)a3;
- (NSArray)attributes;
- (NSString)endowmentNamespace;
- (NSString)sourceEnvironment;
- (OS_xpc_object)encodedEndowment;
- (RBSHereditaryGrant)initWithRBSXPCCoder:(id)a3;
- (id)debugDescription;
- (id)description;
- (unint64_t)hash;
- (void)_initWithNamespace:(void *)a3 sourceEnvironment:(void *)a4 endowment:(void *)a5 attributes:;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSHereditaryGrant

+ (id)grantWithNamespace:(id)a3 endowment:(id)a4 attributes:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = -[RBSHereditaryGrant _initWithNamespace:sourceEnvironment:endowment:attributes:]( objc_alloc(&OBJC_CLASS___RBSHereditaryGrant),  v9,  0LL,  v8,  v7);

  return v10;
}

- (void)_initWithNamespace:(void *)a3 sourceEnvironment:(void *)a4 endowment:(void *)a5 attributes:
{
  id v10 = a2;
  unint64_t v11 = a3;
  unint64_t v12 = a4;
  id v13 = a5;
  if (a1)
  {
    if (!v10)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      [v22 handleFailureInMethod:sel__initWithNamespace_sourceEnvironment_endowment_attributes_, a1, @"RBSHereditaryGrant.m", 133, @"Invalid parameter not satisfying: %@", @"endowmentNamespace" object file lineNumber description];
    }

    if (!(v11 | v12))
    {
      [MEMORY[0x1896077D8] currentHandler];
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      [v23 handleFailureInMethod:sel__initWithNamespace_sourceEnvironment_endowment_attributes_ object:a1 file:@"RBSHereditaryGrant.m" lineNumber:134 description:@"Missing source environment or endowment"];
    }

    v25.receiver = a1;
    v25.super_class = (Class)&OBJC_CLASS___RBSHereditaryGrant;
    id v14 = objc_msgSendSuper2(&v25, sel__init);
    a1 = v14;
    if (v14)
    {
      objc_storeStrong((id *)v14 + 1, a2);
      uint64_t v15 = [(id)v11 copy];
      v16 = (void *)a1[2];
      a1[2] = v15;

      uint64_t v17 = RBSEndowmentEncode((void *)v12);
      v18 = (void *)a1[3];
      a1[3] = v17;

      uint64_t v19 = [v13 copy];
      v20 = (void *)a1[4];
      a1[4] = v19;

      if ((v12 == 0) != (a1[3] == 0LL))
      {
        [MEMORY[0x1896077D8] currentHandler];
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        [v24 handleFailureInMethod:sel__initWithNamespace_sourceEnvironment_endowment_attributes_, a1, @"RBSHereditaryGrant.m", 142, @"endowment encode failed : %@", v12 object file lineNumber description];
      }
    }
  }

  return a1;
}

+ (id)grantWithNamespace:(id)a3 sourceEnvironment:(id)a4 attributes:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = -[RBSHereditaryGrant _initWithNamespace:sourceEnvironment:endowment:attributes:]( objc_alloc(&OBJC_CLASS___RBSHereditaryGrant),  v9,  v8,  0LL,  v7);

  return v10;
}

+ (id)grantWithNamespace:(id)a3 sourceEnvironment:(id)a4 endowment:(id)a5 attributes:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = -[RBSHereditaryGrant _initWithNamespace:sourceEnvironment:endowment:attributes:]( objc_alloc(&OBJC_CLASS___RBSHereditaryGrant),  v12,  v11,  v10,  v9);

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___RBSHereditaryGrant;
  BOOL v11 = 0;
  if (-[RBSAttribute isEqual:](&v13, sel_isEqual_, v4))
  {
    endowmentNamespace = self->_endowmentNamespace;
    if (endowmentNamespace == (NSString *)v4[1] || -[NSString isEqual:](endowmentNamespace, "isEqual:"))
    {
      sourceEnvironment = self->_sourceEnvironment;
      if (sourceEnvironment == (NSString *)v4[2] || -[NSString isEqualToString:](sourceEnvironment, "isEqualToString:"))
      {
        encodedEndowment = self->_encodedEndowment;
        id v8 = (OS_xpc_object *)v4[3];
        if (encodedEndowment == v8 || (encodedEndowment ? (BOOL v9 = v8 == 0LL) : (BOOL v9 = 1), !v9))
        {
          attributes = self->_attributes;
          if (attributes == (NSArray *)v4[4] || -[NSArray isEqualToArray:](attributes, "isEqualToArray:")) {
            BOOL v11 = 1;
          }
        }
      }
    }
  }

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3 = -[NSArray hash](self->_attributes, "hash");
  NSUInteger v4 = -[NSString hash](self->_endowmentNamespace, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_sourceEnvironment, "hash");
}

- (id)description
{
  id v3 = objc_alloc(NSString);
  uint64_t v4 = [(id)objc_opt_class() description];
  v5 = (void *)v4;
  sourceEnvironment = (const __CFString *)self->_sourceEnvironment;
  id v7 = @" ";
  id v8 = &stru_189DE1D08;
  if (!sourceEnvironment)
  {
    id v7 = &stru_189DE1D08;
    sourceEnvironment = &stru_189DE1D08;
  }

  if (self->_encodedEndowment) {
    id v8 = @" hasEncodedEndowment";
  }
  BOOL v9 = (void *)[v3 initWithFormat:@"<%@| endowmentNamespace:%@%@%@%@>", v4, self->_endowmentNamespace, v7, sourceEnvironment, v8];

  return v9;
}

- (id)debugDescription
{
  id v16 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  endowmentNamespace = self->_endowmentNamespace;
  sourceEnvironment = self->_sourceEnvironment;
  if (sourceEnvironment) {
    v6 = @" sourceEnvironment:";
  }
  else {
    v6 = &stru_189DE1D08;
  }
  if (sourceEnvironment) {
    id v7 = (const __CFString *)self->_sourceEnvironment;
  }
  else {
    id v7 = &stru_189DE1D08;
  }
  if (self->_encodedEndowment) {
    id v8 = @" hasEncodedEndowment";
  }
  else {
    id v8 = &stru_189DE1D08;
  }
  attributes = self->_attributes;
  if (attributes) {
    id v10 = @"attributes: [\n\t";
  }
  else {
    id v10 = &stru_189DE1D08;
  }
  uint64_t v11 = -[NSArray componentsJoinedByString:](attributes, "componentsJoinedByString:", @",\n\t");
  id v12 = (void *)v11;
  if (self->_attributes) {
    objc_super v13 = @"\n\t]";
  }
  else {
    objc_super v13 = &stru_189DE1D08;
  }
  id v14 = (void *)[v16 initWithFormat:@"<%@| endowmentNamespace:%@%@%@%@%@%@%@>", v3, endowmentNamespace, v6, v7, v8, v10, v11, v13];

  return v14;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RBSHereditaryGrant;
  id v4 = a3;
  -[RBSAttribute encodeWithRBSXPCCoder:](&v6, sel_encodeWithRBSXPCCoder_, v4);
  objc_msgSend( v4,  "encodeObject:forKey:",  self->_endowmentNamespace,  @"_endowmentNamespace",  v6.receiver,  v6.super_class);
  [v4 encodeObject:self->_sourceEnvironment forKey:@"_sourceEnvironment"];
  [v4 encodeObject:self->_attributes forKey:@"_attributes"];
  RBSXPCPackObject(self->_encodedEndowment);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeXPCObject:v5 forKey:@"_encodedEndowment"];
}

- (RBSHereditaryGrant)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeStringForKey:@"_endowmentNamespace"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_sourceEnvironment"];
    [v4 decodeXPCObjectOfType:MEMORY[0x1895F9250] forKey:@"_encodedEndowment"];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = RBSXPCUnpackObject(v7);

    if (v6 | v8)
    {
      v29.receiver = self;
      v29.super_class = (Class)&OBJC_CLASS___RBSHereditaryGrant;
      v23 = -[RBSAttribute initWithRBSXPCCoder:](&v29, sel_initWithRBSXPCCoder_, v4);
      v24 = v23;
      if (v23)
      {
        objc_storeStrong((id *)&v23->_endowmentNamespace, v5);
        objc_storeStrong((id *)&v24->_sourceEnvironment, (id)v6);
        objc_storeStrong((id *)&v24->_encodedEndowment, (id)v8);
        uint64_t v25 = objc_opt_class();
        uint64_t v26 = [v4 decodeCollectionOfClass:v25 containingClass:objc_opt_class() forKey:@"_attributes"];
        attributes = v24->_attributes;
        v24->_attributes = (NSArray *)v26;
      }

      self = v24;
      id v16 = self;
    }

    else
    {
      rbs_assertion_log();
      BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[RBSHereditaryGrant initWithRBSXPCCoder:].cold.2((uint64_t)self, v9, v10, v11, v12, v13, v14, v15);
      }

      id v16 = 0LL;
    }
  }

  else
  {
    uint64_t v6 = rbs_assertion_log();
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR)) {
      -[RBSHereditaryGrant initWithRBSXPCCoder:].cold.1((uint64_t)self, (os_log_s *)v6, v17, v18, v19, v20, v21, v22);
    }
    id v16 = 0LL;
  }

  return v16;
}

- (NSString)endowmentNamespace
{
  return self->_endowmentNamespace;
}

- (NSString)sourceEnvironment
{
  return self->_sourceEnvironment;
}

- (OS_xpc_object)encodedEndowment
{
  return self->_encodedEndowment;
}

- (NSArray)attributes
{
  return self->_attributes;
}

- (void).cxx_destruct
{
}

- (void)initWithRBSXPCCoder:(uint64_t)a3 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)initWithRBSXPCCoder:(uint64_t)a3 .cold.2( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end