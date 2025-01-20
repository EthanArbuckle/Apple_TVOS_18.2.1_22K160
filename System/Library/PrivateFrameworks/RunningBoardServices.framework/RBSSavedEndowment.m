@interface RBSSavedEndowment
+ (BOOL)supportsRBSXPCSecureCoding;
+ (id)savedEndowment:(id)a3 withKey:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSSecureCoding)endowment;
- (NSString)description;
- (NSString)key;
- (RBSSavedEndowment)initWithRBSXPCCoder:(id)a3;
- (id)_initWithEndowment:(id)a3 andKey:(id)a4;
- (unint64_t)hash;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSSavedEndowment

- (id)_initWithEndowment:(id)a3 andKey:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___RBSSavedEndowment;
  v9 = -[RBSSavedEndowment init](&v12, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_endowment, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

+ (id)savedEndowment:(id)a3 withKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = -[RBSSavedEndowment _initWithEndowment:andKey:]( objc_alloc(&OBJC_CLASS___RBSSavedEndowment),  "_initWithEndowment:andKey:",  v6,  v5);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RBSSavedEndowment *)a3;
  if (self == v4) {
    goto LABEL_8;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class())
  {
    char v6 = 0;
    goto LABEL_9;
  }

  key = self->_key;
  id v8 = v4->_key;
  if (key == v8)
  {
LABEL_8:
    char v6 = 1;
    goto LABEL_9;
  }

  char v6 = 0;
  if (key && v8) {
    char v6 = -[NSString isEqual:](key, "isEqual:");
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_key, "hash");
}

- (NSString)description
{
  id v3 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString description](self->_key, "description");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSSecureCoding description](self->_endowment, "description");
  char v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = (void *)[v3 initWithFormat:@"<%@| key:%@ endowment:%@>", v4, v5, v6];

  return (NSString *)v7;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  key = self->_key;
  id v5 = a3;
  [v5 encodeObject:key forKey:@"_key"];
  RBSEndowmentEncode(self->_endowment);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  RBSXPCPackObject(v7);
  char v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 encodeXPCObject:v6 forKey:@"_endowment"];
}

- (RBSSavedEndowment)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeStringForKey:@"_key"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    [v4 decodeXPCObjectOfType:MEMORY[0x1895F9250] forKey:@"_endowment"];
    char v6 = (void *)objc_claimAutoreleasedReturnValue();
    RBSXPCUnpackObject(v6);
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    RBSEndowmentDecode(v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      self = (RBSSavedEndowment *) -[RBSSavedEndowment _initWithEndowment:andKey:]( self,  "_initWithEndowment:andKey:",  v8,  v5);
      v9 = self;
    }

    else
    {
      v9 = 0LL;
    }
  }

  else
  {
    v9 = 0LL;
  }

  return v9;
}

- (NSSecureCoding)endowment
{
  return self->_endowment;
}

- (NSString)key
{
  return self->_key;
}

- (void).cxx_destruct
{
}

@end