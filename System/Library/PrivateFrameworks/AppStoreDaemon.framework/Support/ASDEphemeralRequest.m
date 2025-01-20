@interface ASDEphemeralRequest
- (void)startUsingProxy:(id)a3 withErrorHandler:(id)a4;
@end

@implementation ASDEphemeralRequest

- (void)startUsingProxy:(id)a3 withErrorHandler:(id)a4
{
  v6 = (id *)a3;
  id v7 = a4;
  id v9 = objc_msgSend((id)objc_opt_class(self, v8), "requestType");
  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained(v6 + 1);
    v11 = WeakRetained;
    if (WeakRetained)
    {
      v12 = (void *)*((void *)WeakRetained + 1);
      goto LABEL_4;
    }
  }

  else
  {
    v11 = 0LL;
  }

  v12 = 0LL;
LABEL_4:
  id v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ASDEphemeralRequest options](self, "options"));
  id v15 = v13;
  id v16 = v14;
  switch((unint64_t)v9)
  {
    case 0uLL:
      v17 = &OBJC_CLASS___AccountLookupRequestTask;
      goto LABEL_23;
    case 1uLL:
      v17 = &OBJC_CLASS___CompleteCoordinatorsRequestTask;
      goto LABEL_23;
    case 2uLL:
      v17 = &OBJC_CLASS___CreatePlaceholdersRequestTask;
      goto LABEL_23;
    case 3uLL:
      v17 = &OBJC_CLASS___ExternalManifestRequestTask;
      goto LABEL_23;
    case 4uLL:
      v17 = &OBJC_CLASS___IAPInfoRequestTask;
      goto LABEL_23;
    case 5uLL:
      v17 = &OBJC_CLASS___IAPInfoUpdateRequestTask;
      goto LABEL_23;
    case 6uLL:
      v17 = &OBJC_CLASS___LegacyManifestRequestTask;
      goto LABEL_23;
    case 7uLL:
      v17 = &OBJC_CLASS___LaunchableAppRequestTask;
      goto LABEL_23;
    case 8uLL:
      id v18 = -[RequestTask initForClient:withOptions:]( objc_alloc(&OBJC_CLASS___MigrationRequestTask),  "initForClient:withOptions:",  v15,  v16);
      v20 = (void *)objc_claimAutoreleasedReturnValue([v15 clientID]);
      if (v18) {
        objc_setProperty_atomic_copy(v18, v19, v20, 64LL);
      }

      break;
    case 9uLL:
      v17 = &OBJC_CLASS___PostBulletinRequestTask;
      goto LABEL_23;
    case 0xAuLL:
      v17 = &OBJC_CLASS___PurchaseRequestTask;
      goto LABEL_23;
    case 0xBuLL:
      v17 = &OBJC_CLASS___PurgeableAppRequestTask;
      goto LABEL_23;
    case 0xCuLL:
      v17 = &OBJC_CLASS___PurgeAppsRequestTask;
      goto LABEL_23;
    case 0xDuLL:
      v17 = &OBJC_CLASS___PushCacheDeleteUpdateRequestTask;
      goto LABEL_23;
    case 0xEuLL:
      v17 = &OBJC_CLASS___RestoreApplicationsRequestTask;
      goto LABEL_23;
    case 0xFuLL:
      v17 = &OBJC_CLASS___RestoreDemotedApplicationsRequestTask;
LABEL_23:
      id v18 = [[v17 alloc] initForClient:v15 withOptions:v16];
      break;
    default:
      id v18 = 0LL;
      break;
  }

  objc_initWeak(&location, v18);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10031EBF0;
  v23[3] = &unk_1003F33C0;
  objc_copyWeak(&v26, &location);
  v23[4] = self;
  v21 = v6;
  v24 = v21;
  id v22 = v7;
  id v25 = v22;
  [v18 setCompletionBlock:v23];
  if (v6) {
    v6 = (id *)objc_loadWeakRetained(v21 + 1);
  }
  sub_10030B234((uint64_t)v6, v18);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

@end