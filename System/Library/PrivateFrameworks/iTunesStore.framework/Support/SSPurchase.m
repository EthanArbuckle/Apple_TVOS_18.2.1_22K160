@interface SSPurchase
- (id)newAMSPurchase;
@end

@implementation SSPurchase

- (id)newAMSPurchase
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSPurchase buyParameters](self, "buyParameters"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AMSBuyParams buyParamsWithString:](&OBJC_CLASS___AMSBuyParams, "buyParamsWithString:", v3));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSPurchase affiliateIdentifier](self, "affiliateIdentifier"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSPurchase affiliateIdentifier](self, "affiliateIdentifier"));
    [v4 setObject:v6 forKeyedSubscript:AMSBuyParamPropertyAffiliateId];
  }

  [v4 setObject:0 forKeyedSubscript:@"isUpdateAll"];
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"generateBuyParams"]);
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v7 BOOLValue]));
    [v4 setObject:v9 forKeyedSubscript:@"generateBuyParams"];
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SSPurchase requestProperties](self, "requestProperties"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 requestParameters]);
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_10003B0EC;
  v41[3] = &unk_10034B178;
  id v12 = v4;
  id v42 = v12;
  [v11 enumerateKeysAndObjectsUsingBlock:v41];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SSPurchase requestProperties](self, "requestProperties"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 URLBagKey]);

  if (([v14 isEqualToString:@"backgroundUpdateProduct"] & 1) == 0)
  {
    if ([v14 isEqualToString:@"buyProduct"])
    {
      uint64_t v16 = 0LL;
      int v15 = 0;
      goto LABEL_34;
    }

    if ([v14 isEqualToString:@"downloadProduct"])
    {
      int v15 = 0;
      uint64_t v16 = 2LL;
      goto LABEL_34;
    }

    if ([v14 isEqualToString:@"p2-in-app-buy"])
    {
      int v15 = 0;
      uint64_t v16 = 3LL;
      goto LABEL_34;
    }

    if ([v14 isEqualToString:@"updateProduct"])
    {
      int v15 = 0;
      uint64_t v16 = 4LL;
      goto LABEL_34;
    }

    if ([v14 isEqualToString:@"redownloadAllTones"])
    {
LABEL_33:
      uint64_t v16 = 0LL;
      int v15 = 1;
      goto LABEL_34;
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v17) {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v18 = [v17 shouldLog];
    else {
      LODWORD(v19) = v18;
    }
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 OSLogObject]);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      uint64_t v19 = v19;
    }
    else {
      v19 &= 2u;
    }
    if ((_DWORD)v19)
    {
      v21 = (void *)objc_opt_class(self);
      int v43 = 138543618;
      v44 = v21;
      __int16 v45 = 2112;
      v46 = v14;
      id v22 = v21;
      v23 = (void *)_os_log_send_and_compose_impl( v19,  0LL,  0LL,  0LL,  &_mh_execute_header,  v20,  17LL,  "%{public}@: Unmatched type found in AMSPurchaseShim for bag key: (%@)",  &v43,  22);

      if (!v23)
      {
LABEL_32:

        goto LABEL_33;
      }

      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v23,  4LL));
      free(v23);
      v40 = v20;
      SSFileLog(v17, @"%@");
    }

    goto LABEL_32;
  }

  int v15 = 0;
  uint64_t v16 = 1LL;
LABEL_34:
  v24 = -[SSAMSPurchase initWithPurchaseType:buyParams:]( objc_alloc(&OBJC_CLASS___SSAMSPurchase),  "initWithPurchaseType:buyParams:",  v16,  v12);
  v25 = v24;
  if (v15 && (objc_opt_respondsToSelector(v24, "setURLBagKey:") & 1) != 0) {
    -[SSAMSPurchase performSelector:withObject:](v25, "performSelector:withObject:", "setURLBagKey:", v14);
  }
  v26 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v27 = (void *)objc_claimAutoreleasedReturnValue([v10 HTTPHeaders]);

  if (v27)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue([v10 HTTPHeaders]);
    -[NSMutableDictionary addEntriesFromDictionary:](v26, "addEntriesFromDictionary:", v28);
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[SSPurchase tidHeaders](self, "tidHeaders", v40));

  if (v29)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[SSPurchase tidHeaders](self, "tidHeaders"));
    -[NSMutableDictionary addEntriesFromDictionary:](v26, "addEntriesFromDictionary:", v30);
  }

  id v31 = -[NSMutableDictionary copy](v26, "copy");
  -[SSAMSPurchase setAdditionalHeaders:](v25, "setAdditionalHeaders:", v31);

  -[SSAMSPurchase setUserInitiated:]( v25,  "setUserInitiated:",  -[SSPurchase isBackgroundPurchase](self, "isBackgroundPurchase") ^ 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[SSPurchase ownerAccountDSID](self, "ownerAccountDSID"));
  -[SSAMSPurchase setOwnerAccountId:](v25, "setOwnerAccountId:", v32);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[SSPurchase accountIdentifier](self, "accountIdentifier"));
  -[SSAMSPurchase setAccountIdentifier:](v25, "setAccountIdentifier:", v33);

  -[SSAMSPurchase setIgnoreRequirePasswordRestriction:]( v25,  "setIgnoreRequirePasswordRestriction:",  -[SSPurchase ignoresForcedPasswordRestriction](self, "ignoresForcedPasswordRestriction"));
  -[SSAMSPurchase setPreauthenticated:]( v25,  "setPreauthenticated:",  -[SSPurchase isPreauthenticated](self, "isPreauthenticated"));
  -[SSAMSPurchase setRequiresAccount:](v25, "setRequiresAccount:", 1LL);
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[SSPurchase presentingSceneBundleIdentifier](self, "presentingSceneBundleIdentifier"));
  -[SSAMSPurchase setPresentingSceneBundleIdentifier:](v25, "setPresentingSceneBundleIdentifier:", v34);

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[SSPurchase presentingSceneIdentifier](self, "presentingSceneIdentifier"));
  -[SSAMSPurchase setPresentingSceneIdentifier:](v25, "setPresentingSceneIdentifier:", v35);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[SSPurchase requestProperties](self, "requestProperties"));
  uint64_t v37 = SSAccountScopeForURLBagType([v36 URLBagType]);

  v38 = &AMSAccountMediaTypeProduction;
  if (v37) {
    v38 = &AMSAccountMediaTypeAppStoreSandbox;
  }
  -[SSAMSPurchase setMediaType:](v25, "setMediaType:", *v38);

  return v25;
}

@end