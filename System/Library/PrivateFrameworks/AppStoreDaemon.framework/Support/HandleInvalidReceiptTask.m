@interface HandleInvalidReceiptTask
- (void)mainWithCompletionHandler:(id)a3;
@end

@implementation HandleInvalidReceiptTask

- (void)mainWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, void))a3;
  id v5 = *(id *)(&self->super.super._success + 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FBSSystemService sharedService](&OBJC_CLASS___FBSSystemService, "sharedService"));
  [v6 terminateApplication:v5 forReason:5 andReport:0 withDescription:@"StoreKit invalid receipt"];

  uint64_t v7 = ASDLogHandleForCategory(36LL);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(&self->super.super._success + 2);
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Terminated app with bundle identifier:%{public}@ due to invalid receipt.",  (uint8_t *)&buf,  0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[ApplicationProxy proxyForBundleID:]( &OBJC_CLASS___ApplicationProxy,  "proxyForBundleID:",  *(void *)(&self->super.super._success + 2)));
  v11 = v10;
  if (*(NSError **)((char *)&self->super.super._error + 2))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[ASFReceipt receiptFromBundleAtURL:](&OBJC_CLASS___ASFReceipt, "receiptFromBundleAtURL:"));
  }

  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleURL]);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[ASFReceipt receiptFromBundleAtURL:](&OBJC_CLASS___ASFReceipt, "receiptFromBundleAtURL:", v13));
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue([v12 expirationDate]);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v16 = [v14 compare:v15];

  if (v11)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue([v11 localizedName]);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v11 vendorName]);
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%lld",  [v11 storeItemID]));
    BOOL v20 = (uint64_t)[v11 storeItemID] > 0;
  }

  else
  {
    v18 = 0LL;
    v19 = 0LL;
    v17 = 0LL;
    BOOL v20 = 1;
  }

  if ((![v12 isVPPLicensed] || (objc_msgSend(v12, "isRevoked") & 1) == 0)
    && (![v12 isVPPLicensed] || v16 != (id)-1))
  {
    v4[2](v4, 0LL);
    goto LABEL_23;
  }

  v48 = v19;
  if (!v17)
  {
    uint64_t v26 = ASDLocalizedString(@"RECEIPT_REVOKED_FALLBACK_TITLE");
    v44 = (void *)objc_claimAutoreleasedReturnValue(v26);
    if (v18) {
      goto LABEL_15;
    }
LABEL_18:
    uint64_t v27 = ASDLocalizedString(@"RECEIPT_REVOKED_FALLBACK_MESSAGE");
    uint64_t v25 = objc_claimAutoreleasedReturnValue(v27);
    goto LABEL_19;
  }

  uint64_t v21 = ASDLocalizedString(@"RECEIPT_REVOKED_TITLE");
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v22, v17));

  if (!v18) {
    goto LABEL_18;
  }
LABEL_15:
  uint64_t v23 = ASDLocalizedString(@"RECEIPT_REVOKED_MESSAGE");
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  uint64_t v25 = objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v24, v18));

LABEL_19:
  v46 = v18;
  v47 = v17;
  if (v20)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"itms-apps:///app/%@",  v48));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v28));
  }

  else
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL URLWithString:]( &OBJC_CLASS___NSURL,  "URLWithString:",  @"itms-appss://?action=software"));
  }

  id v30 = v29;
  v31 = v4;
  v32 = (void *)v25;
  v33 = (void *)objc_claimAutoreleasedReturnValue( +[AMSDialogRequest requestWithTitle:message:]( &OBJC_CLASS___AMSDialogRequest,  "requestWithTitle:message:",  v44,  v25));
  uint64_t v34 = ASDLocalizedString(@"VIEW_IN_APP_STORE");
  v45 = v4;
  v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
  v36 = (void *)objc_claimAutoreleasedReturnValue( +[AMSDialogAction actionWithTitle:identifier:]( &OBJC_CLASS___AMSDialogAction,  "actionWithTitle:identifier:",  v35,  @"InvalidReceiptPromptOKAction"));

  uint64_t v37 = ASDLocalizedString(@"CANCEL");
  v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
  v39 = (void *)objc_claimAutoreleasedReturnValue( +[AMSDialogAction actionWithTitle:identifier:]( &OBJC_CLASS___AMSDialogAction,  "actionWithTitle:identifier:",  v38,  @"InvalidReceiptPromptCancelAction"));

  [v33 addButtonAction:v36];
  [v33 addButtonAction:v39];

  v40 = -[AMSSystemAlertDialogTask initWithRequest:]( objc_alloc(&OBJC_CLASS___AMSSystemAlertDialogTask),  "initWithRequest:",  v33);
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[AMSSystemAlertDialogTask present](v40, "present"));
  *(void *)&__int128 buf = _NSConcreteStackBlock;
  *((void *)&buf + 1) = 3221225472LL;
  v50 = sub_1002DE440;
  v51 = &unk_1003F1FB0;
  v42 = v31;
  id v53 = v42;
  id v43 = v30;
  id v52 = v43;
  [v41 addFinishBlock:&buf];

  v4 = v45;
  v18 = v46;
  v17 = v47;
  v19 = v48;
LABEL_23:
}

- (void).cxx_destruct
{
}

@end