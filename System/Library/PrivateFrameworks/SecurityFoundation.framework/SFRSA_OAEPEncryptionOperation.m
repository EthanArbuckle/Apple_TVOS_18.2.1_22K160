@interface SFRSA_OAEPEncryptionOperation
- (SFMaskGenerationFunction)maskGenerationFunction;
- (SFRSA_OAEPEncryptionOperation)initWithCoder:(id)a3;
- (SFRSA_OAEPEncryptionOperation)initWithKeySpecifier:(id)a3;
- (SFRSA_OAEPEncryptionOperation)initWithKeySpecifier:(id)a3 maskGenerationFunction:(id)a4;
- (void)setMaskGenerationFunction:(id)a3;
@end

@implementation SFRSA_OAEPEncryptionOperation

- (SFRSA_OAEPEncryptionOperation)initWithKeySpecifier:(id)a3
{
  id v4 = a3;
  _defaultMaskGenerationFunction();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SFRSA_OAEPEncryptionOperation initWithKeySpecifier:maskGenerationFunction:]( self,  "initWithKeySpecifier:maskGenerationFunction:",  v4,  v5);

  return v6;
}

- (SFRSA_OAEPEncryptionOperation)initWithKeySpecifier:(id)a3 maskGenerationFunction:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }

  else
  {
    [MEMORY[0x1896077D8] currentHandler];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 handleFailureInMethod:a2, self, @"SFEncryptionOperation.m", 893, @"Invalid parameter not satisfying: %@", @"keySpecifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }

  [MEMORY[0x1896077D8] currentHandler];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 handleFailureInMethod:a2, self, @"SFEncryptionOperation.m", 894, @"Invalid parameter not satisfying: %@", @"maskGenerationFunction" object file lineNumber description];

LABEL_3:
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___SFRSA_OAEPEncryptionOperation;
  v10 = -[SFRSAEncryptionOperation initWithKeySpecifier:](&v15, sel_initWithKeySpecifier_, v7);
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)v10->_oaepEncryptionOperationInternal + 1, a4);
  }

  return v11;
}

- (SFRSA_OAEPEncryptionOperation)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SFRSA_OAEPEncryptionOperation;
  return -[SFRSAEncryptionOperation initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (SFMaskGenerationFunction)maskGenerationFunction
{
  return (SFMaskGenerationFunction *)(id)[*((id *)self->_oaepEncryptionOperationInternal + 1) copyWithZone:0];
}

- (void)setMaskGenerationFunction:(id)a3
{
  uint64_t v4 = [a3 copyWithZone:0];
  oaepEncryptionOperationInternal = self->_oaepEncryptionOperationInternal;
  v6 = (void *)oaepEncryptionOperationInternal[1];
  oaepEncryptionOperationInternal[1] = v4;
}

- (void).cxx_destruct
{
}

@end