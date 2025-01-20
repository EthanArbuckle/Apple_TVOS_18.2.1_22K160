@interface PDAuxiliaryRegistrationRequirementReference
- (BOOL)isReferencing:(id)a3;
- (PDAuxiliaryRegistrationRequirementReference)init;
- (PDAuxiliaryRegistrationRequirementReference)initWithDecryptionType:(unint64_t)a3;
- (PDAuxiliaryRegistrationRequirementReference)initWithSignatureType:(unint64_t)a3;
- (id)_initWithRole:(unint64_t)a3;
@end

@implementation PDAuxiliaryRegistrationRequirementReference

- (PDAuxiliaryRegistrationRequirementReference)init
{
  return 0LL;
}

- (PDAuxiliaryRegistrationRequirementReference)initWithSignatureType:(unint64_t)a3
{
  result = -[PDAuxiliaryRegistrationRequirementReference _initWithRole:](self, "_initWithRole:", 2LL);
  if (result) {
    result->_signatureType = a3;
  }
  return result;
}

- (PDAuxiliaryRegistrationRequirementReference)initWithDecryptionType:(unint64_t)a3
{
  result = -[PDAuxiliaryRegistrationRequirementReference _initWithRole:](self, "_initWithRole:", 1LL);
  if (result) {
    result->_decryptionType = a3;
  }
  return result;
}

- (id)_initWithRole:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDAuxiliaryRegistrationRequirementReference;
  id result = -[PDAuxiliaryRegistrationRequirementReference init](&v5, "init");
  if (result) {
    *((void *)result + 1) = a3;
  }
  return result;
}

- (BOOL)isReferencing:(id)a3
{
  id v4 = a3;
  id v5 = [v4 role];
  if (v5 == (id)self->_role)
  {
    uint64_t v6 = 3LL;
    if (v5 == (id)2) {
      uint64_t v6 = 2LL;
    }
    Class v7 = (&self->super.isa)[v6];
    BOOL v8 = v7 == [v4 type];
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

@end