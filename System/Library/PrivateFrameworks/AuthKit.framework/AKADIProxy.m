@interface AKADIProxy
+ (int)destroyProvisioningSession:(unsigned int)a3;
+ (int)dispose:(void *)a3;
+ (int)endProvisioningWithSession:(unsigned int)a3 PTM:(const char *)a4 PTMLength:(unsigned int)a5 TK:(const char *)a6 TKLength:(unsigned int)a7;
+ (int)eraseProvisioningForDSID:(unint64_t)a3;
+ (int)getIDMSRoutingInfo:(unint64_t *)a3 forDSID:(unint64_t)a4;
+ (int)isMachineProvisioned:(unint64_t)a3;
+ (int)requestOTPForDSID:(unint64_t)a3 outMID:(char *)a4 outMIDSize:(unsigned int *)a5 outOTP:(char *)a6 outOTPSize:(unsigned int *)a7;
+ (int)setIDMSRoutingInfo:(unint64_t)a3 forDSID:(unint64_t)a4;
+ (int)startProvisioningWithDSID:(unint64_t)a3 SPIM:(const char *)a4 SPIMLength:(unsigned int)a5 outCPIM:(char *)a6 outCPIMLength:(unsigned int *)a7 outSession:(unsigned int *)a8;
+ (int)synchronizeWithDSID:(unint64_t)a3 SIM:(const char *)a4 SIMLength:(unsigned int)a5 outMID:(char *)a6 outMIDLength:(unsigned int *)a7 outSRM:(char *)a8 outSRMLength:(unsigned int *)a9;
@end

@implementation AKADIProxy

+ (int)getIDMSRoutingInfo:(unint64_t *)a3 forDSID:(unint64_t)a4
{
  return sub_100103CF4(a4, (uint64_t)a3);
}

+ (int)setIDMSRoutingInfo:(unint64_t)a3 forDSID:(unint64_t)a4
{
  return sub_10011FDC0(a4);
}

+ (int)requestOTPForDSID:(unint64_t)a3 outMID:(char *)a4 outMIDSize:(unsigned int *)a5 outOTP:(char *)a6 outOTPSize:(unsigned int *)a7
{
  return result;
}

+ (int)dispose:(void *)a3
{
  return result;
}

+ (int)isMachineProvisioned:(unint64_t)a3
{
  return result;
}

+ (int)startProvisioningWithDSID:(unint64_t)a3 SPIM:(const char *)a4 SPIMLength:(unsigned int)a5 outCPIM:(char *)a6 outCPIMLength:(unsigned int *)a7 outSession:(unsigned int *)a8
{
  return result;
}

+ (int)endProvisioningWithSession:(unsigned int)a3 PTM:(const char *)a4 PTMLength:(unsigned int)a5 TK:(const char *)a6 TKLength:(unsigned int)a7
{
  return result;
}

+ (int)destroyProvisioningSession:(unsigned int)a3
{
  return result;
}

+ (int)synchronizeWithDSID:(unint64_t)a3 SIM:(const char *)a4 SIMLength:(unsigned int)a5 outMID:(char *)a6 outMIDLength:(unsigned int *)a7 outSRM:(char *)a8 outSRMLength:(unsigned int *)a9
{
  return result;
}

+ (int)eraseProvisioningForDSID:(unint64_t)a3
{
  return result;
}

@end