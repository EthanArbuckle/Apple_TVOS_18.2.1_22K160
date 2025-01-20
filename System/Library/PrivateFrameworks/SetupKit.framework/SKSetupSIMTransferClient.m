@interface SKSetupSIMTransferClient
- (SKSetupSIMTransferClient)init;
- (void)_run;
@end

@implementation SKSetupSIMTransferClient

- (SKSetupSIMTransferClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SKSetupSIMTransferClient;
  v2 = -[SKSetupBase initWithLogCategory:](&v6, sel_initWithLogCategory_, &gLogCategory_SKSetupSIMTransferClient);
  v3 = v2;
  if (v2)
  {
    v2->super._bluetoothUseCase = 258;
    v4 = v2;
  }

  return v3;
}

- (void)_run
{
  if (!self->super._invalidateCalled)
  {
    while (1)
    {
      int runState = self->super._runState;
      if (runState <= 11) {
        break;
      }
      if (runState == 12)
      {
        int v5 = -[SKConnection state](self->super._skCnx, "state");
        int v4 = self->super._runState;
        if (v5 != 1) {
          goto LABEL_14;
        }
        ++v4;
        goto LABEL_13;
      }

      if (runState != 13) {
        return;
      }
      -[SKSetupBase _completeWithError:](self, "_completeWithError:", 0LL);
      int v4 = self->super._runState;
LABEL_14:
      if (v4 == runState) {
        return;
      }
      int var0 = self->super._ucat->var0;
    }

    if (runState)
    {
      if (runState != 11) {
        return;
      }
      -[SKSetupBase _connectionStartWithSKConnection:clientMode:completeOnFailure:completion:]( self,  "_connectionStartWithSKConnection:clientMode:completeOnFailure:completion:",  0LL,  1LL,  1LL,  &__block_literal_global_356);
      int v4 = self->super._runState + 1;
    }

    else
    {
      int v4 = 11;
    }

@end