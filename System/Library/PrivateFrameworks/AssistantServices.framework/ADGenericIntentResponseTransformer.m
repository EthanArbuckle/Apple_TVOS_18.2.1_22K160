@interface ADGenericIntentResponseTransformer
- (id)aceCommandForSiriResponse:(id)a3 responseError:(id)a4 forRequestCommand:(id)a5;
@end

@implementation ADGenericIntentResponseTransformer

- (id)aceCommandForSiriResponse:(id)a3 responseError:(id)a4 forRequestCommand:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___AFSiriRequestSucceededResponse);
  if ((objc_opt_isKindOfClass(v7, v10) & 1) == 0)
  {
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___STGenericIntentResponse);
    if ((objc_opt_isKindOfClass(v7, v13) & 1) == 0)
    {
      v16 = objc_alloc_init(&OBJC_CLASS___SACommandFailed);
LABEL_12:
      v12 = v16;
      goto LABEL_13;
    }

    id v14 = [v7 responseCode];
    if (v14 == (id)2)
    {
      v15 = (uint64_t *)&SAIntentGroupIntentEnabledAppHasNoResultsErrorCode;
    }

    else
    {
      if (v14 != (id)1)
      {
        uint64_t v17 = -1LL;
        goto LABEL_11;
      }

      v15 = (uint64_t *)&SAIntentGroupIntentEnabledAppDoesNotSupportIntentErrorCode;
    }

    uint64_t v17 = *v15;
LABEL_11:
    v16 = (SACommandFailed *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ad_aceResponseCommandRepresentationWithErrorCode:reason:", v17, 0));
    goto LABEL_12;
  }

  v11 = objc_alloc_init(&OBJC_CLASS___ADSiriRequestSucceededResponseTransformer);
  v12 = (SACommandFailed *)objc_claimAutoreleasedReturnValue( -[ADSiriRequestSucceededResponseTransformer aceCommandForSiriResponse:responseError:forRequestCommand:]( v11,  "aceCommandForSiriResponse:responseError:forRequestCommand:",  v7,  v8,  v9));

LABEL_13:
  return v12;
}

@end