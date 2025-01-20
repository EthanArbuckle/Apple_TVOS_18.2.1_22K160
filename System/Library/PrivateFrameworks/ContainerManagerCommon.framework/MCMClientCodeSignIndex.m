@interface MCMClientCodeSignIndex
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToClientCodeSignIndex:(id)a3;
- (MCMClientCodeSignIndex)initWithCDHash:(id)a3 identifier:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation MCMClientCodeSignIndex

- (MCMClientCodeSignIndex)initWithCDHash:(id)a3 identifier:(id)a4
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MCMClientCodeSignIndex;
  v9 = -[MCMClientCodeSignIndex init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cdhash, a3);
    objc_storeStrong((id *)&v10->_identifier, a4);
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3 = -[NSData hash](self->_cdhash, "hash");
  return -[NSString hash](self->_identifier, "hash") ^ v3;
}

- (BOOL)isEqualToClientCodeSignIndex:(id)a3
{
  v4 = a3;
  if (-[NSData isEqualToData:](self->_cdhash, "isEqualToData:", v4[1])) {
    BOOL v5 = -[NSString isEqualToString:](self->_identifier, "isEqualToString:", v4[2]);
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && -[MCMClientCodeSignIndex isEqualToClientCodeSignIndex:](self, "isEqualToClientCodeSignIndex:", v4);

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[MCMClientCodeSignIndex initWithCDHash:identifier:]( objc_alloc(&OBJC_CLASS___MCMClientCodeSignIndex),  "initWithCDHash:identifier:",  self->_cdhash,  self->_identifier);
}

- (void).cxx_destruct
{
}

@end