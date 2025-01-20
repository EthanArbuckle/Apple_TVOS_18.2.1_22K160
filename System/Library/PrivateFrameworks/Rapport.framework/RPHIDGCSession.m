@interface RPHIDGCSession
- (RPHIDGCSession)initWithOptions:(id)a3;
- (RPMessageable)messenger;
- (void)_activateWithCompletion:(id)a3;
- (void)_invalidate;
- (void)activateWithCompletion:(id)a3;
- (void)invalidate;
- (void)sendGCEvent:(RPHIDGCEvent *)a3 destinationID:(id)a4 completion:(id)a5;
- (void)setMessenger:(id)a3;
@end

@implementation RPHIDGCSession

- (RPHIDGCSession)initWithOptions:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___RPHIDGCSession;
  v6 = -[RPHIDGCSession init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dispatchQueue, MEMORY[0x1895F8AE0]);
    objc_storeStrong((id *)&v7->_options, a3);
    v8 = v7;
  }

  return v7;
}

- (void)_activateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = self->_messenger;
  if (v5)
  {
    options = self->_options;
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __42__RPHIDGCSession__activateWithCompletion___block_invoke;
    v8[3] = &unk_18A0325E8;
    id v9 = v4;
    -[RPMessageable sendRequestID:request:destinationID:options:responseHandler:]( v5,  "sendRequestID:request:destinationID:options:responseHandler:",  @"_gcStart",  options,  @"rapport:rdid:DirectPeer",  0LL,  v8);
  }

  else
  {
    RPErrorF();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_RPHIDGCSession <= 90
      && (gLogCategory_RPHIDGCSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    if (v4) {
      (*((void (**)(id, void *))v4 + 2))(v4, v7);
    }
  }
}

void __42__RPHIDGCSession__activateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    if (gLogCategory_RPHIDGCSession <= 90
      && (gLogCategory_RPHIDGCSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      (*(void (**)(uint64_t, id))(v9 + 16))(v9, v8);
    }
  }

  else
  {
    if (gLogCategory_RPHIDGCSession <= 30
      && (gLogCategory_RPHIDGCSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    uint64_t v10 = *(void *)(a1 + 32);
    if (v10) {
      (*(void (**)(uint64_t, void))(v10 + 16))(v10, 0LL);
    }
  }
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  -[RPMessageable dispatchQueue](self->_messenger, "dispatchQueue");
  id v5 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  dispatchQueue = v5;
  if (!v5) {
    dispatchQueue = self->_dispatchQueue;
  }
  objc_storeStrong((id *)&self->_dispatchQueue, dispatchQueue);

  id v7 = (dispatch_queue_s *)self->_dispatchQueue;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __41__RPHIDGCSession_activateWithCompletion___block_invoke;
  v9[3] = &unk_18A031B60;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

uint64_t __41__RPHIDGCSession_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40)];
}

- (void)_invalidate
{
  if (gLogCategory_RPHIDGCSession <= 30
    && (gLogCategory_RPHIDGCSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  -[RPMessageable sendRequestID:request:destinationID:options:responseHandler:]( self->_messenger,  "sendRequestID:request:destinationID:options:responseHandler:",  @"_gcStop",  MEMORY[0x189604A60],  @"rapport:rdid:DirectPeer",  0LL,  &__block_literal_global_6);
  messenger = self->_messenger;
  self->_messenger = 0LL;
}

void __29__RPHIDGCSession__invalidate__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v8 = a2;
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (gLogCategory_RPHIDGCSession <= 90
      && (gLogCategory_RPHIDGCSession != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      LogPrintF();
    }
  }

  else if (gLogCategory_RPHIDGCSession <= 30 {
         && (gLogCategory_RPHIDGCSession != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_7;
  }
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __28__RPHIDGCSession_invalidate__block_invoke;
  block[3] = &unk_18A031A30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __28__RPHIDGCSession_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)sendGCEvent:(RPHIDGCEvent *)a3 destinationID:(id)a4 completion:(id)a5
{
  v51[21] = *MEMORY[0x1895F89C0];
  id v8 = a4;
  uint64_t v9 = (void (**)(id, void *))a5;
  if (a3)
  {
    uint64_t v11 = a3->var17 | (a3->var16 << 8);
    uint64_t v12 = a3->var19 | (a3->var18 << 8);
    unsigned int v42 = a3->var21 | (a3->var20 << 8);
    v50[0] = @"_gcDU";
    *(float *)&double v10 = a3->var0;
    [MEMORY[0x189607968] numberWithFloat:v10];
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v48;
    v50[1] = @"_gcDD";
    *(float *)&double v13 = a3->var1;
    [MEMORY[0x189607968] numberWithFloat:v13];
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v51[1] = v47;
    v50[2] = @"_gcDL";
    *(float *)&double v14 = a3->var2;
    [MEMORY[0x189607968] numberWithFloat:v14];
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v51[2] = v46;
    v50[3] = @"_gcDR";
    *(float *)&double v15 = a3->var3;
    [MEMORY[0x189607968] numberWithFloat:v15];
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v51[3] = v45;
    v50[4] = @"_gcLThx";
    [MEMORY[0x189607968] numberWithDouble:a3->var4.x];
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v51[4] = v44;
    v50[5] = @"_gcLThy";
    [MEMORY[0x189607968] numberWithDouble:a3->var4.y];
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v51[5] = v43;
    v50[6] = @"_gcRThx";
    [MEMORY[0x189607968] numberWithDouble:a3->var5.x];
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v51[6] = v41;
    v50[7] = @"_gcRThy";
    [MEMORY[0x189607968] numberWithDouble:a3->var5.y];
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v51[7] = v40;
    v50[8] = @"_gcBtA";
    *(float *)&double v16 = a3->var6;
    [MEMORY[0x189607968] numberWithFloat:v16];
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v51[8] = v39;
    v50[9] = @"_gcBtB";
    *(float *)&double v17 = a3->var7;
    [MEMORY[0x189607968] numberWithFloat:v17];
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v51[9] = v38;
    v50[10] = @"_gcBtX";
    *(float *)&double v18 = a3->var8;
    [MEMORY[0x189607968] numberWithFloat:v18];
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v51[10] = v37;
    v50[11] = @"_gcBtY";
    *(float *)&double v19 = a3->var9;
    [MEMORY[0x189607968] numberWithFloat:v19];
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v51[11] = v36;
    v50[12] = @"_gcL1";
    *(float *)&double v20 = a3->var13;
    [MEMORY[0x189607968] numberWithFloat:v20];
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v51[12] = v35;
    v50[13] = @"_gcL2";
    *(float *)&double v21 = a3->var10;
    [MEMORY[0x189607968] numberWithFloat:v21];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v51[13] = v22;
    v50[14] = @"_gcR1";
    *(float *)&double v23 = a3->var14;
    [MEMORY[0x189607968] numberWithFloat:v23];
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v51[14] = v24;
    v50[15] = @"_gcR2";
    *(float *)&double v25 = a3->var11;
    [MEMORY[0x189607968] numberWithFloat:v25];
    v49 = v9;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v51[15] = v26;
    v50[16] = @"_gcLThB";
    [MEMORY[0x189607968] numberWithInt:a3->var12];
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v51[16] = v27;
    v50[17] = @"_gcRThB";
    [MEMORY[0x189607968] numberWithInt:a3->var15];
    v34 = self;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v51[17] = v28;
    v50[18] = @"_gcBtHome";
    [MEMORY[0x189607968] numberWithInt:v11];
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v51[18] = v29;
    v50[19] = @"_gcBtMenu";
    [MEMORY[0x189607968] numberWithInt:v12];
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v51[19] = v30;
    v50[20] = @"_gcBtOptions";
    [MEMORY[0x189607968] numberWithInt:v42];
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v51[20] = v31;
    [MEMORY[0x189603F68] dictionaryWithObjects:v51 forKeys:v50 count:21];
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v9 = v49;
    -[RPMessageable sendEventID:event:destinationID:options:completion:]( v34->_messenger,  "sendEventID:event:destinationID:options:completion:",  @"_hidGC",  v32,  v8,  0LL,  v49);
  }

  else
  {
    [MEMORY[0x189607870] errorWithDomain:@"RPHIDGCSessionErrorDomain" code:0 userInfo:0];
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9) {
      v9[2](v9, v33);
    }
  }
}

- (RPMessageable)messenger
{
  return self->_messenger;
}

- (void)setMessenger:(id)a3
{
}

- (void).cxx_destruct
{
}

@end