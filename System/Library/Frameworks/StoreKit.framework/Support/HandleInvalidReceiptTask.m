@interface HandleInvalidReceiptTask
- (HandleInvalidReceiptTask)initWithClient:(id)a3 pid:(int)a4;
- (_TtC9storekitd6Client)client;
- (id)dialogRequestWithTitle:(id)a3 dialogMessage:(id)a4;
- (id)productURLForAppWithID:(id)a3;
- (int)pid;
- (void)_presentSystemDialogWithTitle:(id)a3 dialogMessage:(id)a4 actionURL:(id)a5;
- (void)main;
- (void)terminateClientApplication;
@end

@implementation HandleInvalidReceiptTask

- (HandleInvalidReceiptTask)initWithClient:(id)a3 pid:(int)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___HandleInvalidReceiptTask;
  v8 = -[Task init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)(v8 + 50), a3);
    *(_DWORD *)(v9 + 42) = a4;
  }

  return (HandleInvalidReceiptTask *)v9;
}

- (void)main
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HandleInvalidReceiptTask client](self, "client"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 callerBundleURL]);
  id v25 = (id)objc_claimAutoreleasedReturnValue(+[ASFReceipt receiptFromBundleAtURL:](&OBJC_CLASS___ASFReceipt, "receiptFromBundleAtURL:", v4));

  v5 = (void *)objc_claimAutoreleasedReturnValue([v25 expirationDate]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v7 = [v5 compare:v6];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HandleInvalidReceiptTask client](self, "client"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedName]);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HandleInvalidReceiptTask client](self, "client"));
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v10 vendorName]);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HandleInvalidReceiptTask client](self, "client"));
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v12 storeItemID]));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 stringValue]);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[HandleInvalidReceiptTask client](self, "client"));
  id v16 = [v15 storeItemID];

  if ([v25 isVPPLicensed] && (objc_msgSend(v25, "isRevoked") & 1) != 0
    || [v25 isVPPLicensed] && v7 == (id)-1)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AppStoreDaemon"));
    if (v9)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue( [v17 localizedStringForKey:@"RECEIPT_REVOKED_TITLE" value:&stru_1002FBA48 table:0]);
      v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v18,  v9));
    }

    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue( [v17 localizedStringForKey:@"RECEIPT_REVOKED_FALLBACK_TITLE" value:&stru_1002FBA48 table:0]);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AppStoreDaemon"));
    if (v11)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue( [v20 localizedStringForKey:@"RECEIPT_REVOKED_MESSAGE" value:&stru_1002FBA48 table:0]);
      v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v21,  v11));
    }

    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue( [v20 localizedStringForKey:@"RECEIPT_REVOKED_FALLBACK_MESSAGE" value:&stru_1002FBA48 table:0]);
    }

    if (v16) {
      uint64_t v23 = objc_claimAutoreleasedReturnValue(-[HandleInvalidReceiptTask productURLForAppWithID:](self, "productURLForAppWithID:", v14));
    }
    else {
      uint64_t v23 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", @"itms-appss://?action=software"));
    }
    v24 = (void *)v23;
    -[HandleInvalidReceiptTask _presentSystemDialogWithTitle:dialogMessage:actionURL:]( self,  "_presentSystemDialogWithTitle:dialogMessage:actionURL:",  v19,  v22,  v23);
  }

  else
  {
    -[AsyncTask completeWithSuccess](self, "completeWithSuccess");
  }
}

- (id)dialogRequestWithTitle:(id)a3 dialogMessage:(id)a4
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[AMSDialogRequest requestWithTitle:message:]( &OBJC_CLASS___AMSDialogRequest,  "requestWithTitle:message:",  a3,  a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AppStoreDaemon"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 localizedStringForKey:@"VIEW_IN_APP_STORE" value:&stru_1002FBA48 table:0]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[AMSDialogAction actionWithTitle:identifier:]( &OBJC_CLASS___AMSDialogAction,  "actionWithTitle:identifier:",  v6,  @"InvalidReceiptPromptOKAction"));

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AppStoreDaemon"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedStringForKey:@"CANCEL" value:&stru_1002FBA48 table:0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[AMSDialogAction actionWithTitle:identifier:]( &OBJC_CLASS___AMSDialogAction,  "actionWithTitle:identifier:",  v9,  @"InvalidReceiptPromptCancelAction"));

  [v4 addButtonAction:v7];
  [v4 addButtonAction:v10];

  return v4;
}

- (void)terminateClientApplication
{
  id v3 = [[RBSTerminateContext alloc] initWithExplanation:@"StoreKit invalid receipt"];
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessIdentifier identifierWithPid:]( &OBJC_CLASS___RBSProcessIdentifier,  "identifierWithPid:",  -[HandleInvalidReceiptTask pid](self, "pid")));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessPredicate predicateMatchingIdentifier:]( &OBJC_CLASS___RBSProcessPredicate,  "predicateMatchingIdentifier:",  v4));
  id v6 = [[RBSTerminateRequest alloc] initWithPredicate:v5 context:v3];
  id v14 = 0LL;
  unsigned __int8 v7 = [v6 execute:&v14];
  id v8 = v14;
  if ((v7 & 1) != 0)
  {
    if (qword_10032EE48 != -1) {
      dispatch_once(&qword_10032EE48, &stru_1002E9DB0);
    }
    v9 = (void *)qword_10032EE00;
    if (os_log_type_enabled((os_log_t)qword_10032EE00, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[HandleInvalidReceiptTask client](self, "client"));
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 callerBundleID]);
      *(_DWORD *)buf = 138543362;
      id v16 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Terminated app with bundle identifier:%{public}@ for invalid receipt.",  buf,  0xCu);
    }
  }

  else
  {
    if (qword_10032EE48 != -1) {
      dispatch_once(&qword_10032EE48, &stru_1002E9DB0);
    }
    v13 = (void *)qword_10032EE00;
    if (os_log_type_enabled((os_log_t)qword_10032EE00, OS_LOG_TYPE_ERROR)) {
      sub_10026350C(v13, self, (uint64_t)v8);
    }
  }
}

- (id)productURLForAppWithID:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"itms-apps:///app/%@",  a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v3));

  return v4;
}

- (void)_presentSystemDialogWithTitle:(id)a3 dialogMessage:(id)a4 actionURL:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue( -[HandleInvalidReceiptTask dialogRequestWithTitle:dialogMessage:]( self,  "dialogRequestWithTitle:dialogMessage:",  v8,  v9));
  id v12 = [[AMSSystemAlertDialogTask alloc] initWithRequest:v11];
  objc_initWeak(&location, self);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 present]);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000714A8;
  v15[3] = &unk_1002E9D90;
  objc_copyWeak(&v18, &location);
  id v14 = v10;
  id v16 = v14;
  v17 = self;
  [v13 addFinishBlock:v15];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (_TtC9storekitd6Client)client
{
  return *(_TtC9storekitd6Client **)((char *)&self->super.super._error + 2);
}

- (int)pid
{
  return *(_DWORD *)(&self->super.super._success + 2);
}

- (void).cxx_destruct
{
}

@end