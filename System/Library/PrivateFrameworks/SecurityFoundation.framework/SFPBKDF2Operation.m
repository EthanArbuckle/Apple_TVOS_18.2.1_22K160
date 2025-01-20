@interface SFPBKDF2Operation
+ (BOOL)supportsSecureCoding;
+ (id)_randomSalt;
+ (int64_t)keySource;
- (NSData)salt;
- (SFPBKDF2Operation)init;
- (SFPBKDF2Operation)initWithCoder:(id)a3;
- (SFPBKDF2Operation)initWithPseudoRandomFunction:(id)a3 iterationCount:(int64_t)a4 salt:(id)a5;
- (SFPseudoRandomFunction)pseudoRandomFunction;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deriveKeyWithSpecifier:(id)a3 fromKeySource:(id)a4 error:(id *)a5;
- (int64_t)iterationCount;
- (void)setIterationCount:(int64_t)a3;
- (void)setPseudoRandomFunction:(id)a3;
- (void)setSalt:(id)a3;
@end

@implementation SFPBKDF2Operation

+ (int64_t)keySource
{
  return 0LL;
}

+ (id)_randomSalt
{
  return 0LL;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFPBKDF2Operation)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [(id)objc_opt_class() _randomSalt];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SFPBKDF2Operation initWithPseudoRandomFunction:iterationCount:salt:]( self,  "initWithPseudoRandomFunction:iterationCount:salt:",  v3,  20LL,  v4);

  return v5;
}

- (SFPBKDF2Operation)initWithPseudoRandomFunction:(id)a3 iterationCount:(int64_t)a4 salt:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___SFPBKDF2Operation;
  v11 = -[SFPBKDF2Operation init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)v11->_pbkdf2OperationInternal + 2, a3);
    *((void *)v12->_pbkdf2OperationInternal + 1) = a4;
    objc_storeStrong((id *)v12->_pbkdf2OperationInternal + 3, a5);
  }

  return v12;
}

- (SFPBKDF2Operation)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SFPBKDF2Operation;
  return -[SFPBKDF2Operation init](&v4, sel_init, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)[objc_alloc((Class)objc_opt_class()) initWithPseudoRandomFunction:*((void *)self->_pbkdf2OperationInternal + 2) iterationCount:*((void *)self->_pbkdf2OperationInternal + 1) salt:*((void *)self->_pbkdf2OperationInternal + 3)];
}

- (id)deriveKeyWithSpecifier:(id)a3 fromKeySource:(id)a4 error:(id *)a5
{
  return 0LL;
}

- (int64_t)iterationCount
{
  return *((void *)self->_pbkdf2OperationInternal + 1);
}

- (void)setIterationCount:(int64_t)a3
{
  *((void *)self->_pbkdf2OperationInternal + 1) = a3;
}

- (SFPseudoRandomFunction)pseudoRandomFunction
{
  return (SFPseudoRandomFunction *)(id)[*((id *)self->_pbkdf2OperationInternal + 2) copyWithZone:0];
}

- (void)setPseudoRandomFunction:(id)a3
{
  uint64_t v4 = [a3 copyWithZone:0];
  pbkdf2OperationInternal = self->_pbkdf2OperationInternal;
  v6 = (void *)pbkdf2OperationInternal[2];
  pbkdf2OperationInternal[2] = v4;
}

- (NSData)salt
{
  return (NSData *)(id)[*((id *)self->_pbkdf2OperationInternal + 3) copy];
}

- (void)setSalt:(id)a3
{
  uint64_t v4 = [a3 copy];
  pbkdf2OperationInternal = self->_pbkdf2OperationInternal;
  v6 = (void *)pbkdf2OperationInternal[3];
  pbkdf2OperationInternal[3] = v4;
}

- (void).cxx_destruct
{
}

@end