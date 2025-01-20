@interface AKWalrusContext
+ (BOOL)supportsSecureCoding;
- (AKWalrusContext)initWithCoder:(id)a3;
- (BOOL)cliMode;
- (NSString)altDSID;
- (NSString)description;
- (NSUUID)_identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setCliMode:(BOOL)a3;
@end

@implementation AKWalrusContext

- (AKWalrusContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v6 = -[AKWalrusContext init](self, "init");
  if (v6)
  {
    id v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID, v5), @"_identifier");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    identifier = v6->_identifier;
    v6->_identifier = (NSUUID *)v8;

    v6->_cliMode = [v4 decodeBoolForKey:@"_cliMode"];
    id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v10),  @"_altDSID");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    altDSID = v6->_altDSID;
    v6->_altDSID = (NSString *)v12;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"_identifier"];
  [v5 encodeBool:self->_cliMode forKey:@"_cliMode"];
  [v5 encodeObject:self->_altDSID forKey:@"_altDSID"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v4[8] = self->_cliMode;
  id v5 = -[NSString copy](self->_altDSID, "copy");
  v6 = (void *)*((void *)v4 + 3);
  *((void *)v4 + 3) = v5;

  id v7 = -[NSUUID copy](self->_identifier, "copy");
  uint64_t v8 = (void *)*((void *)v4 + 2);
  *((void *)v4 + 2) = v7;

  return v4;
}

- (NSString)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"WalrusContext:%@, altDSID: %@, cliMode: %i",  self->_identifier,  self->_altDSID,  self->_cliMode);
}

- (NSUUID)_identifier
{
  return self->_identifier;
}

- (BOOL)cliMode
{
  return self->_cliMode;
}

- (void)setCliMode:(BOOL)a3
{
  self->_cliMode = a3;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end