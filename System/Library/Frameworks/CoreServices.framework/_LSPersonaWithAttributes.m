@interface _LSPersonaWithAttributes
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (_LSPersonaWithAttributes)initWithCoder:(id)a3;
- (id)description;
- (uint64_t)personaType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)initWithPersonaType:(void *)a3 personaUniqueString:;
@end

@implementation _LSPersonaWithAttributes

- (void)initWithPersonaType:(void *)a3 personaUniqueString:
{
  id v5 = a3;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_CLASS____LSPersonaWithAttributes;
    a1 = objc_msgSendSuper2(&v9, sel_init);
    if (a1)
    {
      uint64_t v6 = [v5 copy];
      v7 = (void *)a1[1];
      a1[1] = v6;

      a1[2] = a2;
    }
  }

  return a1;
}

- (unint64_t)hash
{
  return self->_personaType ^ -[NSString hash](self->_personaUniqueString, "hash");
}

- (uint64_t)personaType
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (void).cxx_destruct
{
}

- (_LSPersonaWithAttributes)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____LSPersonaWithAttributes;
  id v5 = -[_LSPersonaWithAttributes init](&v9, sel_init);
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"personaUniqueString");
    personaUniqueString = v5->_personaUniqueString;
    v5->_personaUniqueString = (NSString *)v6;

    v5->_personaType = [v4 decodeIntegerForKey:@"personaType"];
  }

  return v5;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %@ (type %d)>", objc_opt_class(), self->_personaUniqueString, self->_personaType];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_personaUniqueString forKey:@"personaUniqueString"];
  [v4 encodeInteger:self->_personaType forKey:@"personaType"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (id *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && v4[2] == (id)self->_personaType) {
    char v5 = [v4[1] isEqualToString:self->_personaUniqueString];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end