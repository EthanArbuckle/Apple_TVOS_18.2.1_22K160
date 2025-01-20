@interface PS190OTPProgrammedFields
- (BOOL)boardID;
- (BOOL)certificateEpoch;
- (BOOL)debugDisable;
- (BOOL)ecid;
- (BOOL)productionStatus;
- (BOOL)realHDCPKeysPresent;
- (BOOL)securityDomain;
- (BOOL)securityMode;
- (PS190OTPProgrammedFields)initWithStatus1:(unsigned __int8)a3;
- (id)description;
@end

@implementation PS190OTPProgrammedFields

- (PS190OTPProgrammedFields)initWithStatus1:(unsigned __int8)a3
{
  unsigned int v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PS190OTPProgrammedFields;
  result = -[PS190OTPProgrammedFields init](&v6, sel_init);
  if (result)
  {
    int16x8_t v5 = (int16x8_t)vceqzq_s32((int32x4_t)vandq_s8((int8x16_t)vdupq_n_s32(v3), (int8x16_t)xmmword_188FEFB60));
    *(int8x8_t *)v5.i8 = vand_s8((int8x8_t)vmovn_s32((int32x4_t)v5), (int8x8_t)0x1000100010001LL);
    *(_DWORD *)&result->_certificateEpoch = vmovn_s16(v5).u32[0];
    result->_debugDisable = (v3 & 0x10) == 0;
    result->_realHDCPKeysPresent = (v3 & 0x20) == 0;
    result->_boardID = (v3 & 0x40) == 0;
    result->_ecid = (~v3 & 0x80) != 0;
  }

  return result;
}

- (id)description
{
  unsigned int v3 = (void *)MEMORY[0x189607940];
  v4 = (objc_class *)objc_opt_class();
  int16x8_t v5 = NSStringFromClass(v4);
  id v6 = (id)[v3 stringWithFormat:@"<%@:", v5];

  if (self->_certificateEpoch) {
    [v6 appendString:@" CEPO"];
  }
  if (self->_securityDomain) {
    [v6 appendString:@" SDOM"];
  }
  if (self->_productionStatus) {
    [v6 appendString:@" CPRO"];
  }
  if (self->_securityMode) {
    [v6 appendString:@" CSEC"];
  }
  if (self->_debugDisable) {
    [v6 appendString:@" DBGD"];
  }
  if (self->_realHDCPKeysPresent) {
    [v6 appendString:@" RHKP"];
  }
  if (self->_boardID) {
    [v6 appendString:@" BORD"];
  }
  if (self->_ecid) {
    [v6 appendString:@" ECID"];
  }
  [v6 appendString:@">"];
  id v7 = (id)[NSString stringWithString:v6];

  return v7;
}

- (BOOL)certificateEpoch
{
  return self->_certificateEpoch;
}

- (BOOL)securityDomain
{
  return self->_securityDomain;
}

- (BOOL)productionStatus
{
  return self->_productionStatus;
}

- (BOOL)securityMode
{
  return self->_securityMode;
}

- (BOOL)debugDisable
{
  return self->_debugDisable;
}

- (BOOL)realHDCPKeysPresent
{
  return self->_realHDCPKeysPresent;
}

- (BOOL)boardID
{
  return self->_boardID;
}

- (BOOL)ecid
{
  return self->_ecid;
}

@end