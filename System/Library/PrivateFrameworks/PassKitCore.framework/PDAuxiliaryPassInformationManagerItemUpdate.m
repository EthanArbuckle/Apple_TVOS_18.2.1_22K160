@interface PDAuxiliaryPassInformationManagerItemUpdate
- (BOOL)_isEqualToItem:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInvalid;
- (PKPassAuxiliaryPassInformationItem)item;
- (unint64_t)hash;
- (void)setIsInvalid:(BOOL)a3;
- (void)setItem:(id)a3;
@end

@implementation PDAuxiliaryPassInformationManagerItemUpdate

- (unint64_t)hash
{
  return PKIntegerHash(PKHashStartingValue, -[PKPassAuxiliaryPassInformationItem hash](self->_item, "hash"));
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PDAuxiliaryPassInformationManagerItemUpdate *)a3;
  v6 = v4;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }

  else if (v4 && (uint64_t v7 = objc_opt_class(self, v5), (objc_opt_isKindOfClass(v6, v7) & 1) != 0))
  {
    BOOL v8 = -[PDAuxiliaryPassInformationManagerItemUpdate _isEqualToItem:](self, "_isEqualToItem:", v6);
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_isEqualToItem:(id)a3
{
  return PKEqualObjects(self->_item, *((void *)a3 + 2));
}

- (PKPassAuxiliaryPassInformationItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (BOOL)isInvalid
{
  return self->_isInvalid;
}

- (void)setIsInvalid:(BOOL)a3
{
  self->_isInvalid = a3;
}

- (void).cxx_destruct
{
}

@end