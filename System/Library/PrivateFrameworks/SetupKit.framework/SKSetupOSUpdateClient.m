@interface SKSetupOSUpdateClient
- (SKSetupOSUpdateClient)init;
- (void)_activate;
- (void)_prepareSteps;
- (void)_run;
@end

@implementation SKSetupOSUpdateClient

- (SKSetupOSUpdateClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SKSetupOSUpdateClient;
  v2 = -[SKSetupBase initWithLogCategory:](&v6, sel_initWithLogCategory_, &gLogCategory_SKSetupOSUpdateClient);
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (void)_activate
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SKSetupOSUpdateClient;
  -[SKSetupBase _activate](&v3, sel__activate);
}

- (void)_prepareSteps
{
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___SKStepWiFiSetupClientLegacy);
  -[SKStepWiFiSetupClientLegacy setDispatchQueue:](v3, "setDispatchQueue:", self->super._dispatchQueue);
  -[SKStepWiFiSetupClientLegacy setSkMessaging:](v3, "setSkMessaging:", self);
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __38__SKSetupOSUpdateClient__prepareSteps__block_invoke;
  v4[3] = &unk_18A282310;
  v4[4] = self;
  v4[5] = v3;
  -[SKStepWiFiSetupClientLegacy setSkCompletionHandler:](v3, "setSkCompletionHandler:", v4);
  -[SKSetupBase _addStep:](self, "_addStep:", v3);
}

- (void)_run
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (!self->super._invalidateCalled)
  {
    while (1)
    {
      uint64_t runState = self->super._runState;
      switch((int)runState)
      {
        case 11:
          -[SKSetupBase _connectionStartWithSKConnection:clientMode:completeOnFailure:completion:]( self,  "_connectionStartWithSKConnection:clientMode:completeOnFailure:completion:",  0LL,  1LL,  1LL,  &__block_literal_global_2216);
          int v4 = self->super._runState;
          goto LABEL_10;
        case 12:
          int v5 = -[SKConnection state](self->super._skCnx, "state");
          int v4 = self->super._runState;
          if (v5 != 1) {
            goto LABEL_13;
          }
          goto LABEL_10;
        case 13:
          BOOL v6 = -[SKSetupBase _runSteps](self, "_runSteps");
          int v4 = self->super._runState;
          if (!v6) {
            goto LABEL_13;
          }
LABEL_10:
          ++v4;
          break;
        case 14:
          -[SKSetupBase _completeWithError:](self, "_completeWithError:", 0LL);
          int v4 = self->super._runState;
          goto LABEL_13;
        default:
          if ((_DWORD)runState) {
            return;
          }
          int v4 = 11;
          break;
      }

      self->super._uint64_t runState = v4;
LABEL_13:
      if (v4 == (_DWORD)runState) {
        break;
      }
      if (sCUOSLogCreateOnce_logger_2217 != -1) {
        dispatch_once(&sCUOSLogCreateOnce_logger_2217, &__block_literal_global_10);
      }
      v7 = (os_log_s *)sCUOSLogHandle_logger_2218;
      if (os_log_type_enabled((os_log_t)sCUOSLogHandle_logger_2218, OS_LOG_TYPE_DEFAULT))
      {
        if (((0x78FFu >> runState) & 1) != 0)
        {
          v8 = off_18A282240[runState];
        }

        else if ((int)runState <= 9)
        {
          v8 = "?";
        }

        else
        {
          v8 = "User";
        }

        uint64_t v9 = self->super._runState;
        if (v9 < 0xF && ((0x78FFu >> v9) & 1) != 0)
        {
          v10 = off_18A282240[v9];
        }

        else if ((int)v9 <= 9)
        {
          v10 = "?";
        }

        else
        {
          v10 = "User";
        }

        *(_DWORD *)buf = 136315394;
        v12 = v8;
        __int16 v13 = 2080;
        v14 = v10;
        _os_log_impl(&dword_188798000, v7, OS_LOG_TYPE_DEFAULT, "State: %s -> %s", buf, 0x16u);
      }
    }
  }

uint64_t __38__SKSetupOSUpdateClient__prepareSteps__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _completedStep:*(void *)(a1 + 40) error:a2];
}

@end