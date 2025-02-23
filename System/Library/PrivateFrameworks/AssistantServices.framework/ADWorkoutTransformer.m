@interface ADWorkoutTransformer
- (id)aceCommandForSiriResponse:(id)a3 responseError:(id)a4 forRequestCommand:(id)a5;
- (void)getSiriRequestForClientBoundAceCommand:(id)a3 completionHandler:(id)a4;
@end

@implementation ADWorkoutTransformer

- (void)getSiriRequestForClientBoundAceCommand:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "_ad_transformedWorkoutRequest"));
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (id)aceCommandForSiriResponse:(id)a3 responseError:(id)a4 forRequestCommand:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = v9;
  if (!v8)
  {
    uint64_t v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_ad_transformedWorkoutSuccessResponse"));
LABEL_7:
    v13 = (SACommandFailed *)v17;
    goto LABEL_17;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 domain]);
  unsigned int v12 = [v11 isEqualToString:STWorkoutErrorDomain];

  if (!v12)
  {
    uint64_t v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ad_aceResponseCommandGenericErrorRepresentation"));
    goto LABEL_7;
  }

  v13 = objc_alloc_init(&OBJC_CLASS___SACommandFailed);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v10 aceId]);
  -[SACommandFailed setRefId:](v13, "setRefId:", v14);

  id v15 = [v8 code];
  v16 = &SAHLCannotStartWorkoutErrorCode;
  switch((unint64_t)v15)
  {
    case 'd':
      goto LABEL_16;
    case 'e':
      v16 = &SAHLWorkoutLocationUnspecifiedErrorCode;
      goto LABEL_16;
    case 'f':
      v16 = &SAHLInvalidWorkoutErrorCode;
      goto LABEL_16;
    case 'g':
      v16 = &SAHLFitnessTrackingDisabledErrorCode;
      goto LABEL_16;
    case 'h':
      v16 = &SAHLActivitySetupNeededErrorCode;
      goto LABEL_16;
    case 'i':
      v16 = &SAHLLocationTypeUnknownErrorCode;
      goto LABEL_16;
    default:
      if (v15 == (id)200)
      {
        v16 = &SAHLWorkoutStartedAssumedIndoorErrorCode;
      }

      else
      {
        if (v15 != (id)201) {
          break;
        }
        v16 = &SAHLWorkoutStartedAssumedOutdoorErrorCode;
      }

@end