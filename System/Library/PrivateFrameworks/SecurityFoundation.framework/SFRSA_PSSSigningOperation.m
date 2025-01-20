@interface SFRSA_PSSSigningOperation
- (SFMaskGenerationFunction)maskGenerationFunction;
- (SFRSA_PSSSigningOperation)initWithCoder:(id)a3;
- (SFRSA_PSSSigningOperation)initWithKeySpecifier:(id)a3 digestOperation:(id)a4;
- (SFRSA_PSSSigningOperation)initWithKeySpecifier:(id)a3 digestOperation:(id)a4 maskGenerationFunction:(id)a5;
- (void)setMaskGenerationFunction:(id)a3;
@end

@implementation SFRSA_PSSSigningOperation

- (SFRSA_PSSSigningOperation)initWithKeySpecifier:(id)a3 digestOperation:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  _defaultMaskGenerationFunction();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SFRSA_PSSSigningOperation initWithKeySpecifier:digestOperation:maskGenerationFunction:]( self,  "initWithKeySpecifier:digestOperation:maskGenerationFunction:",  v7,  v6,  v8);

  return v9;
}

- (SFRSA_PSSSigningOperation)initWithKeySpecifier:(id)a3 digestOperation:(id)a4 maskGenerationFunction:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SFRSA_PSSSigningOperation;
  v10 = -[SFRSASigningOperation initWithKeySpecifier:digestOperation:]( &v13,  sel_initWithKeySpecifier_digestOperation_,  a3,  a4);
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)v10->_pssSigningOperationInternal + 1, a5);
  }

  return v11;
}

- (SFRSA_PSSSigningOperation)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SFRSA_PSSSigningOperation;
  return -[SFRSASigningOperation initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (SFMaskGenerationFunction)maskGenerationFunction
{
  return (SFMaskGenerationFunction *)(id)[*((id *)self->_pssSigningOperationInternal + 1) copyWithZone:0];
}

- (void)setMaskGenerationFunction:(id)a3
{
  uint64_t v4 = [a3 copyWithZone:0];
  pssSigningOperationInternal = self->_pssSigningOperationInternal;
  id v6 = (void *)pssSigningOperationInternal[1];
  pssSigningOperationInternal[1] = v4;
}

- (void).cxx_destruct
{
}

@end