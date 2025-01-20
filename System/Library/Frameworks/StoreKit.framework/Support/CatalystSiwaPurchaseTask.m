@interface CatalystSiwaPurchaseTask
- (AMSPurchaseSIWAResult)purchaseResult;
- (CatalystSiwaPurchaseTask)initWithPurchase:(id)a3 client:(id)a4 dialogContext:(id)a5 paymentSheetDelegate:(id)a6;
- (id)_performPurchase;
- (void)main;
@end

@implementation CatalystSiwaPurchaseTask

- (CatalystSiwaPurchaseTask)initWithPurchase:(id)a3 client:(id)a4 dialogContext:(id)a5 paymentSheetDelegate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___CatalystSiwaPurchaseTask;
  id v15 = -[Task init](&v18, "init");
  v16 = (CatalystSiwaPurchaseTask *)v15;
  if (v15)
  {
    objc_storeStrong((id *)v15 + 5, a3);
    objc_storeStrong((id *)&v16->super._error, a4);
    objc_storeStrong((id *)&v16->_purchase, a5);
    objc_storeWeak((id *)&v16->_client, v14);
  }

  return v16;
}

- (void)main
{
  if (self->super._error)
  {
    id v3 = 0LL;
  }

  else
  {
    uint64_t v4 = ASDErrorWithDescription(ASDErrorDomain, 1061LL, @"No client available to handle purchase");
    id v3 = (id)objc_claimAutoreleasedReturnValue(v4);
  }

  if (!*(void *)&self->super._success)
  {
    uint64_t v5 = ASDErrorWithDescription(ASDErrorDomain, 507LL, @"No purchase task available to perform purchase");
    uint64_t v6 = objc_claimAutoreleasedReturnValue(v5);

    id v3 = (id)v6;
    if (v6) {
      goto LABEL_6;
    }
LABEL_8:
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CatalystSiwaPurchaseTask _performPurchase](self, "_performPurchase"));
    id v18 = 0LL;
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 resultWithError:&v18]);
    id v3 = v18;

    objc_storeStrong((id *)&self->_dialogContext, v8);
    if (self->_dialogContext)
    {
      if (qword_10032DDB8 != -1) {
        dispatch_once(&qword_10032DDB8, &stru_1002E6D80);
      }
      v9 = (void *)qword_10032DD88;
      if (os_log_type_enabled((os_log_t)qword_10032DD88, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(void **)&self->super._success;
        id v11 = v9;
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 logUUID]);
        *(_DWORD *)buf = 138543618;
        v20 = self;
        __int16 v21 = 2114;
        v22 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[%{public}@][%{public}@]: Purchase completed.",  buf,  0x16u);
      }

      if (v3) {
        goto LABEL_14;
      }
    }

    else
    {
      if (v3)
      {
        if (qword_10032DDB8 != -1) {
          dispatch_once(&qword_10032DDB8, &stru_1002E6D80);
        }
        id v13 = (void *)qword_10032DD88;
        if (os_log_type_enabled((os_log_t)qword_10032DD88, OS_LOG_TYPE_DEFAULT))
        {
          id v14 = *(void **)&self->super._success;
          id v15 = v13;
          v16 = (void *)objc_claimAutoreleasedReturnValue([v14 logUUID]);
          *(_DWORD *)buf = 138543874;
          v20 = self;
          __int16 v21 = 2114;
          v22 = v16;
          __int16 v23 = 2112;
          id v24 = v3;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[%{public}@][%{public}@]: Purchase resulted in error: %@.",  buf,  0x20u);
        }

        goto LABEL_14;
      }

      uint64_t v17 = ASDErrorWithDescription(ASDErrorDomain, 500LL, @"Purchase completed without a result or error");
      id v3 = (id)objc_claimAutoreleasedReturnValue(v17);
      if (v3)
      {
LABEL_14:
        -[Task completeWithError:](self, "completeWithError:", v3);
LABEL_22:

        goto LABEL_23;
      }
    }

    -[Task completeWithSuccess](self, "completeWithSuccess");
    goto LABEL_22;
  }

  if (!v3) {
    goto LABEL_8;
  }
LABEL_6:
  -[Task completeWithError:](self, "completeWithError:", v3);
LABEL_23:
}

- (id)_performPurchase
{
  id v3 = objc_alloc_init(&OBJC_CLASS___AMSPromise);
  if (self->_purchase && (id v4 = objc_loadWeakRetained((id *)&self->_client), v4, v4))
  {
    purchase = self->_purchase;
    uint64_t v6 = *(void *)&self->super._success;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10000B6BC;
    v15[3] = &unk_1002E6D60;
    id v16 = v3;
    uint64_t v17 = self;
    -[AMSPurchaseSIWA handlePurchase:paymentSheetDelegate:completionHandler:]( purchase,  "handlePurchase:paymentSheetDelegate:completionHandler:",  v6,  WeakRetained,  v15);

    v8 = v16;
  }

  else
  {
    if (qword_10032DDB8 != -1) {
      dispatch_once(&qword_10032DDB8, &stru_1002E6D80);
    }
    v9 = (void *)qword_10032DD88;
    if (os_log_type_enabled((os_log_t)qword_10032DD88, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(void **)&self->super._success;
      id v11 = v9;
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 logUUID]);
      *(_DWORD *)buf = 138543618;
      v19 = self;
      __int16 v20 = 2114;
      __int16 v21 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[%{public}@][%{public}@]: No dialog observer to process purchase.",  buf,  0x16u);
    }

    uint64_t v13 = ASDErrorWithDescription(ASDErrorDomain, 1060LL, @"No dialog observer to process purchase.");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v13);
    [v3 finishWithError:v8];
  }

  return v3;
}

- (AMSPurchaseSIWAResult)purchaseResult
{
  return self->_dialogContext;
}

- (void).cxx_destruct
{
}

@end