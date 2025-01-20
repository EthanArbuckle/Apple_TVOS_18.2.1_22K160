@interface ODRManifestRequestTask
- (void)main;
@end

@implementation ODRManifestRequestTask

- (void)main
{
  v2 = self;
  id v3 = *(id *)&self->super._success;
  uint64_t v4 = objc_opt_self(&OBJC_CLASS___ODRManifestRequestTask);
  v5 = objc_alloc(&OBJC_CLASS___AMSURLRequestEncoder);
  id v6 = sub_100255630((uint64_t)&OBJC_CLASS___URLBag);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = -[AMSURLRequestEncoder initWithBag:](v5, "initWithBag:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ams_activeiTunesAccount"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ams_activeiTunesAccount"));
    -[AMSURLRequestEncoder setAccount:](v8, "setAccount:", v12);
  }

  id v13 = v3;
  uint64_t v14 = objc_opt_self(v4);
  if (sub_1002DA93C((uint64_t)v13))
  {
    BOOL v15 = sub_1002DA714((uint64_t)v13);
    id v16 = v13;
    objc_opt_self(v14);
    v17 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v18 = sub_1002DA0C8((uint64_t)v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v19, @"adamId");

    id v20 = sub_1002DAA1C((uint64_t)v16);
    uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);
    v22 = (void *)v21;
    if (v21) {
      v23 = (const __CFString *)v21;
    }
    else {
      v23 = &stru_1003F3E40;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  v23,  @"thinningVariant");

    id v24 = sub_1002DA4EC((uint64_t)v16);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    if (v15)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  v25,  @"betaExternalVersionId");

      id v26 = sub_1002DA1F8((uint64_t)v16);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  v27,  @"bundleShortVersionId");

      id v28 = sub_1002DA3F4((uint64_t)v16);
      v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  v29,  @"bundleVersionId");

      LODWORD(v29) = sub_1002DA884((uint64_t)v16);
      if (!(_DWORD)v29) {
        goto LABEL_20;
      }
      id v16 = (id)objc_claimAutoreleasedReturnValue(+[AMSDevice serialNumber](&OBJC_CLASS___AMSDevice, "serialNumber"));
      if (v16) {
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  v16,  @"serial-no");
      }
    }

    else
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  v25,  @"externalVersionId");

      v31 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDevice deviceGUID](&OBJC_CLASS___AMSDevice, "deviceGUID"));
      if (v31) {
        -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v31, @"guid");
      }
      if (sub_1002DA884((uint64_t)v16))
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDevice serialNumber](&OBJC_CLASS___AMSDevice, "serialNumber"));
        if (v32) {
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  v32,  @"serial-no");
        }
      }
    }

LABEL_20:
    v30 = 0LL;
    id v33 = 0LL;
    if (v17) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }

  v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"_OnDemandResourcesErrorDomain",  117LL,  0LL));
LABEL_21:
  id v33 = v30;
  v17 = 0LL;
LABEL_22:

  id v34 = v33;
  id v35 = v34;
  if (!v17)
  {
    if (v34)
    {
      v45 = 0LL;
    }

    else
    {
      uint64_t v57 = ASDErrorWithDescription( @"_OnDemandResourcesErrorDomain",  2008LL,  @"Failed to create the body for the manifest request");
      id v35 = (id)objc_claimAutoreleasedReturnValue(v57);
      v45 = 0LL;
      if (!v35) {
        goto LABEL_33;
      }
    }

- (void).cxx_destruct
{
}

@end