@interface LSSpotlightAction
+ (BOOL)supportsSecureCoding;
+ (id)new;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSpotlightAction:(id)a3;
- (LSSpotlightAction)init;
- (LSSpotlightAction)initWithCoder:(id)a3;
- (NSString)identifier;
- (NSString)symbolImageName;
- (NSString)unlocalizedTitle;
- (id)_initWithIdentifier:(id)a3 unlocalizedTitle:(id)a4 symbolImageName:(id)a5;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LSSpotlightAction

+ (id)new
{
}

- (LSSpotlightAction)init
{
}

- (id)_initWithIdentifier:(id)a3 unlocalizedTitle:(id)a4 symbolImageName:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___LSSpotlightAction;
  v8 = -[LSSpotlightAction init](&v11, sel_init);
  p_isa = (id *)&v8->super.isa;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
  }

  return p_isa;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && -[LSSpotlightAction isEqualToSpotlightAction:](self, "isEqualToSpotlightAction:", a3);
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 hash];
  v5 = -[LSSpotlightAction unlocalizedTitle](self, "unlocalizedTitle");
  uint64_t v6 = [v5 hash];
  v7 = -[LSSpotlightAction symbolImageName](self, "symbolImageName");
  unint64_t v8 = v6 ^ v4 ^ [v7 hash];

  return v8;
}

- (id)description
{
  v3 = (void *)NSString;
  uint64_t v4 = objc_opt_class();
  v5 = -[LSSpotlightAction identifier](self, "identifier");
  -[LSSpotlightAction unlocalizedTitle](self, "unlocalizedTitle");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[LSSpotlightAction symbolImageName](self, "symbolImageName");
  [v3 stringWithFormat:@"<%@ %p> { identifier = %@, unlocalizedTitle = %@, symbolImageName = %@ }", v4, self, v5, v6, v7];
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (LSSpotlightAction)initWithCoder:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___LSSpotlightAction;
  uint64_t v4 = -[LSSpotlightAction init](&v12, sel_init);
  if (v4)
  {
    uint64_t v5 = objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"identifier");
    identifier = v4->_identifier;
    v4->_identifier = (NSString *)v5;

    uint64_t v7 = objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"unlocalizedTitle");
    unlocalizedTitle = v4->_unlocalizedTitle;
    v4->_unlocalizedTitle = (NSString *)v7;

    uint64_t v9 = objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"symbolImageName");
    symbolImageName = v4->_symbolImageName;
    v4->_symbolImageName = (NSString *)v9;
  }

  return v4;
}

- (BOOL)isEqualToSpotlightAction:(id)a3
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [a3 identifier];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v6 isEqual:v7])
  {
    -[LSSpotlightAction unlocalizedTitle](self, "unlocalizedTitle");
    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [a3 unlocalizedTitle];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (![v8 isEqual:v9])
    {
      char v13 = 0;
LABEL_12:

      goto LABEL_13;
    }
    v10 = -[LSSpotlightAction symbolImageName](self, "symbolImageName");
    if (v10 || ([a3 symbolImageName], (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[LSSpotlightAction symbolImageName](self, "symbolImageName");
      objc_super v11 = (void *)objc_claimAutoreleasedReturnValue();
      [a3 symbolImageName];
      objc_super v12 = (void *)objc_claimAutoreleasedReturnValue();
      char v13 = [v11 isEqual:v12];

      if (v10)
      {
LABEL_11:

        goto LABEL_12;
      }
    }

    else
    {
      char v13 = 1;
    }

    goto LABEL_11;
  }

  char v13 = 0;
LABEL_13:

  return v13;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)unlocalizedTitle
{
  return self->_unlocalizedTitle;
}

- (NSString)symbolImageName
{
  return self->_symbolImageName;
}

- (void).cxx_destruct
{
}

@end