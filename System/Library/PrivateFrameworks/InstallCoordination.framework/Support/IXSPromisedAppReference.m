@interface IXSPromisedAppReference
+ (BOOL)supportsSecureCoding;
- (BOOL)cancelForReason:(id)a3 client:(unint64_t)a4 error:(id *)a5;
- (BOOL)validateStagedPathWithError:(id *)a3;
- (IXSPromisedAppReference)initWithCoder:(id)a3;
- (IXSPromisedAppReference)initWithSeed:(id)a3 ifMatchingPredicate:(id)a4 error:(id *)a5;
- (MIAppReference)appReference;
- (void)encodeWithCoder:(id)a3;
- (void)markAppReferenceAsConsumed;
- (void)setAppReference:(id)a3;
@end

@implementation IXSPromisedAppReference

- (IXSPromisedAppReference)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___IXSPromisedAppReference;
  v5 = -[IXSOwnedDataPromise initWithCoder:](&v10, "initWithCoder:", v4);
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(MIAppReference) forKey:@"appReference"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    appReference = v5->_appReference;
    v5->_appReference = (MIAppReference *)v7;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v5);

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___IXSPromisedAppReference;
  -[IXSOwnedDataPromise encodeWithCoder:](&v7, "encodeWithCoder:", v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPromisedAppReference appReference](self, "appReference"));
  [v4 encodeObject:v6 forKey:@"appReference"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IXSPromisedAppReference)initWithSeed:(id)a3 ifMatchingPredicate:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v38.receiver = self;
  v38.super_class = (Class)&OBJC_CLASS___IXSPromisedAppReference;
  objc_super v10 = -[IXSOwnedDataPromise initWithSeed:error:](&v38, "initWithSeed:error:", v8, a5);
  if (!v10)
  {
    id v20 = 0LL;
    goto LABEL_7;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 identity]);
  id v12 = [v8 installationDomain];
  id v37 = 0LL;
  id v13 = sub_100013294(v11, (uint64_t)v12, &v37);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  id v15 = v37;
  if (!v14)
  {
    v25 = sub_1000047B4((uint64_t)off_1000E8CA0);
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_10007A9C4();
    }

    id v28 = sub_10003556C( (uint64_t)"-[IXSPromisedAppReference initWithSeed:ifMatchingPredicate:error:]",  68LL,  @"IXErrorDomain",  0x32uLL,  v15,  0LL,  @"Could not get LSApplicationRecord for app with identity %@",  v27,  (uint64_t)v11);
    goto LABEL_14;
  }

  [v9 allowEvaluation];
  if (([v9 evaluateWithObject:v14] & 1) == 0)
  {
    v29 = sub_1000047B4((uint64_t)off_1000E8CA0);
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_10007AA44();
    }

    id v28 = sub_10003556C( (uint64_t)"-[IXSPromisedAppReference initWithSeed:ifMatchingPredicate:error:]",  75LL,  @"IXErrorDomain",  0x31uLL,  0LL,  0LL,  @"Predicate %@ did not match for LSApplicationRecord %@",  v31,  (uint64_t)v9);
LABEL_14:
    id v20 = (id)objc_claimAutoreleasedReturnValue(v28);

    goto LABEL_15;
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue([v11 miAppIdentity]);
  v33 = v11;
  v17 = (void *)objc_claimAutoreleasedReturnValue([v14 installSessionIdentifier]);
  id v36 = v15;
  uint64_t v18 = MIAcquireReferenceForInstalledAppWithError(v16, v12, v17, &v36);
  v19 = (MIAppReference *)objc_claimAutoreleasedReturnValue(v18);
  id v20 = v36;

  if (v19)
  {
    appReference = v10->_appReference;
    v10->_appReference = v19;
    v22 = v19;

    v23 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](v10, "accessQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100012978;
    block[3] = &unk_1000CCE58;
    v35 = v10;
    dispatch_sync(v23, block);

LABEL_7:
    v24 = v10;
    goto LABEL_18;
  }

  v11 = v33;
LABEL_15:

  if (a5)
  {
    id v20 = v20;
    v24 = 0LL;
    *a5 = v20;
  }

  else
  {
    v24 = 0LL;
  }

- (MIAppReference)appReference
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v3);

  return self->_appReference;
}

- (void)setAppReference:(id)a3
{
  id v6 = (MIAppReference *)a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v5);

  if (self->_appReference != v6) {
    objc_storeStrong((id *)&self->_appReference, a3);
  }
}

- (void)markAppReferenceAsConsumed
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v3);

  -[IXSPromisedAppReference setAppReference:](self, "setAppReference:", 0LL);
}

- (BOOL)cancelForReason:(id)a3 client:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v9);

  if (!v8)
  {
    v14 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10007AACC();
    }

    v17 = @"Reason passed to -[IXSPromisedAppReference cancelForReason:client:error:] was nil";
    uint64_t v18 = 135LL;
    goto LABEL_12;
  }

  if (!a4)
  {
    v19 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10007AB40();
    }

    v17 = @"Client passed to -[IXSPromisedAppReference cancelForReason:client:error:] was IXClientNone (0)";
    uint64_t v18 = 140LL;
LABEL_12:
    id v21 = sub_10003556C( (uint64_t)"-[IXSPromisedAppReference cancelForReason:client:error:]",  v18,  @"IXErrorDomain",  0x35uLL,  0LL,  0LL,  v17,  v16,  (uint64_t)v27.receiver);
    id v13 = (id)objc_claimAutoreleasedReturnValue(v21);
    v11 = 0LL;
    goto LABEL_13;
  }

  uint64_t v10 = objc_claimAutoreleasedReturnValue(-[IXSPromisedAppReference appReference](self, "appReference"));
  v11 = (void *)v10;
  if (!v10)
  {
    id v13 = 0LL;
LABEL_16:
    v27.receiver = self;
    v27.super_class = (Class)&OBJC_CLASS___IXSPromisedAppReference;
    id v28 = v13;
    BOOL v22 = -[IXSOwnedDataPromise cancelForReason:client:error:](&v27, "cancelForReason:client:error:", v8, a4, &v28);
    id v23 = v28;

    id v13 = v23;
    if (!a5) {
      goto LABEL_19;
    }
    goto LABEL_17;
  }

  id v29 = 0LL;
  char v12 = MIInvalidateReferenceForInstalledAppWithError(v10, &v29);
  id v13 = v29;
  if ((v12 & 1) != 0)
  {
    -[IXSPromisedAppReference setAppReference:](self, "setAppReference:", 0LL);
    goto LABEL_16;
  }

  v25 = sub_1000047B4((uint64_t)off_1000E8CA0);
  v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
    sub_10007ABB4();
  }

LABEL_13:
  BOOL v22 = 0;
  if (!a5) {
    goto LABEL_19;
  }
LABEL_17:
  if (!v22) {
    *a5 = v13;
  }
LABEL_19:

  return v22;
}

- (BOOL)validateStagedPathWithError:(id *)a3
{
  return 1;
}

- (void).cxx_destruct
{
}

@end