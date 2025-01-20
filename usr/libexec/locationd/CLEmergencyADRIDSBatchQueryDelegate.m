@interface CLEmergencyADRIDSBatchQueryDelegate
- (CLEmergencyADRIDSBatchQueryDelegate)initWithADRPointer:(void *)a3;
- (void)batchQueryController:(id)a3 updatedDestinationsStatus:(id)a4 onService:(id)a5 error:(id)a6;
- (void)fADR;
- (void)setFADR:(void *)a3;
@end

@implementation CLEmergencyADRIDSBatchQueryDelegate

- (CLEmergencyADRIDSBatchQueryDelegate)initWithADRPointer:(void *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CLEmergencyADRIDSBatchQueryDelegate;
  v4 = -[CLEmergencyADRIDSBatchQueryDelegate init](&v6, "init");
  -[CLEmergencyADRIDSBatchQueryDelegate setFADR:](v4, "setFADR:", a3);
  return v4;
}

- (void)batchQueryController:(id)a3 updatedDestinationsStatus:(id)a4 onService:(id)a5 error:(id)a6
{
}

- (void)fADR
{
  return self->_fADR;
}

- (void)setFADR:(void *)a3
{
  self->_fADR = a3;
}

@end