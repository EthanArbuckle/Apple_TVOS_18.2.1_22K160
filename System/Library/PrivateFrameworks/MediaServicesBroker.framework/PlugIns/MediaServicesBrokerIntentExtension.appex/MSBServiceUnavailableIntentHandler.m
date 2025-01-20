@interface MSBServiceUnavailableIntentHandler
- (MSBServiceUnavailableIntentHandler)init;
- (MSBServiceUnavailableIntentHandler)initWithReason:(unint64_t)a3;
- (NSString)description;
- (unint64_t)reason;
- (void)handleAddMedia:(id)a3 completion:(id)a4;
- (void)handlePlayMedia:(id)a3 completion:(id)a4;
- (void)handleSearchForMedia:(id)a3 completion:(id)a4;
- (void)handleUpdateMediaAffinity:(id)a3 completion:(id)a4;
- (void)resolveMediaItemsForAddMedia:(id)a3 withCompletion:(id)a4;
- (void)resolveMediaItemsForPlayMedia:(id)a3 withCompletion:(id)a4;
- (void)resolveMediaItemsForSearchForMedia:(id)a3 withCompletion:(id)a4;
- (void)resolveMediaItemsForUpdateMediaAffinity:(id)a3 withCompletion:(id)a4;
@end

@implementation MSBServiceUnavailableIntentHandler

- (MSBServiceUnavailableIntentHandler)init
{
  return -[MSBServiceUnavailableIntentHandler initWithReason:](self, "initWithReason:", 0LL);
}

- (MSBServiceUnavailableIntentHandler)initWithReason:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MSBServiceUnavailableIntentHandler;
  result = -[MSBServiceUnavailableIntentHandler init](&v5, "init");
  if (result) {
    result->_reason = a3;
  }
  return result;
}

- (NSString)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<MSBServiceUnavailableReason:%ld>",  self->_reason);
}

- (void)resolveMediaItemsForPlayMedia:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  v8 = (void (**)(id, void *))a4;
  switch(self->_reason)
  {
    case 0uLL:
      id v9 = sub_10000CCD4();
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10000DC5C();
      }
      goto LABEL_9;
    case 1uLL:
      id v11 = sub_10000CCD4();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_10000DB7C(v12, v13, v14, v15, v16, v17, v18, v19);
      }

      v20 = (uint64_t *)&_INPlayMediaMediaItemUnsupportedReasonAppNotConfigured;
      goto LABEL_16;
    case 2uLL:
      id v21 = sub_10000CCD4();
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10000DBEC(v10, v22, v23, v24, v25, v26, v27, v28);
      }
LABEL_9:

      v20 = (uint64_t *)&_INPlayMediaMediaItemUnsupportedReasonAppNotAvailable;
      goto LABEL_16;
    case 3uLL:
      id v29 = sub_10000CCD4();
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        sub_10000DC88();
      }

      uint64_t v7 = 7LL;
      break;
    case 4uLL:
      id v31 = sub_10000CCD4();
      v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        sub_10000DCB4();
      }

      v20 = (uint64_t *)&_INPlayMediaMediaItemUnsupportedReasonAppDoesntSupportIntent;
LABEL_16:
      uint64_t v7 = *v20;
      break;
    default:
      break;
  }

  if (v8)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue( +[INPlayMediaMediaItemResolutionResult unsupportedForReason:]( &OBJC_CLASS___INPlayMediaMediaItemResolutionResult,  "unsupportedForReason:",  v7));
    v35 = v33;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v35, 1LL));
    v8[2](v8, v34);
  }
}

- (void)handlePlayMedia:(id)a3 completion:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    id v6 = -[INPlayMediaIntentResponse initWithCode:userActivity:]( objc_alloc(&OBJC_CLASS___INPlayMediaIntentResponse),  "initWithCode:userActivity:",  6LL,  0LL);
    (*((void (**)(id, INPlayMediaIntentResponse *))a4 + 2))(v5, v6);
  }

- (void)resolveMediaItemsForAddMedia:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  v8 = (void (**)(id, void *))a4;
  switch(self->_reason)
  {
    case 0uLL:
      id v9 = sub_10000CCD4();
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10000DC5C();
      }
      goto LABEL_9;
    case 1uLL:
      id v11 = sub_10000CCD4();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_10000DCE0(v12, v13, v14, v15, v16, v17, v18, v19);
      }

      v20 = (uint64_t *)&_INAddMediaMediaItemUnsupportedReasonAppNotConfigured;
      goto LABEL_16;
    case 2uLL:
      id v21 = sub_10000CCD4();
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10000DD50(v10, v22, v23, v24, v25, v26, v27, v28);
      }
LABEL_9:

      v20 = (uint64_t *)&_INAddMediaMediaItemUnsupportedReasonAppNotAvailable;
      goto LABEL_16;
    case 3uLL:
      id v29 = sub_10000CCD4();
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        sub_10000DC88();
      }

      uint64_t v7 = 7LL;
      break;
    case 4uLL:
      id v31 = sub_10000CCD4();
      v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        sub_10000DCB4();
      }

      v20 = (uint64_t *)&_INAddMediaMediaItemUnsupportedReasonAppDoesntSupportIntent;
LABEL_16:
      uint64_t v7 = *v20;
      break;
    default:
      break;
  }

  if (v8)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue( +[INAddMediaMediaItemResolutionResult unsupportedForReason:]( &OBJC_CLASS___INAddMediaMediaItemResolutionResult,  "unsupportedForReason:",  v7));
    v35 = v33;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v35, 1LL));
    v8[2](v8, v34);
  }
}

- (void)handleAddMedia:(id)a3 completion:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    id v6 = -[INAddMediaIntentResponse initWithCode:userActivity:]( objc_alloc(&OBJC_CLASS___INAddMediaIntentResponse),  "initWithCode:userActivity:",  5LL,  0LL);
    (*((void (**)(id, INAddMediaIntentResponse *))a4 + 2))(v5, v6);
  }

- (void)resolveMediaItemsForUpdateMediaAffinity:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  v8 = (void (**)(id, void *))a4;
  switch(self->_reason)
  {
    case 0uLL:
      id v9 = sub_10000CCD4();
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10000DC5C();
      }
      goto LABEL_9;
    case 1uLL:
      id v11 = sub_10000CCD4();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_10000DDC0(v12, v13, v14, v15, v16, v17, v18, v19);
      }

      v20 = (uint64_t *)&_INUpdateMediaAffinityMediaItemUnsupportedReasonAppNotConfigured;
      goto LABEL_16;
    case 2uLL:
      id v21 = sub_10000CCD4();
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10000DE30(v10, v22, v23, v24, v25, v26, v27, v28);
      }
LABEL_9:

      v20 = (uint64_t *)&_INUpdateMediaAffinityMediaItemUnsupportedReasonAppNotAvailable;
      goto LABEL_16;
    case 3uLL:
      id v29 = sub_10000CCD4();
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        sub_10000DC88();
      }

      uint64_t v7 = 7LL;
      break;
    case 4uLL:
      id v31 = sub_10000CCD4();
      v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        sub_10000DCB4();
      }

      v20 = (uint64_t *)&_INUpdateMediaAffinityMediaItemUnsupportedReasonAppDoesntSupportIntent;
LABEL_16:
      uint64_t v7 = *v20;
      break;
    default:
      break;
  }

  if (v8)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue( +[INUpdateMediaAffinityMediaItemResolutionResult unsupportedForReason:]( &OBJC_CLASS___INUpdateMediaAffinityMediaItemResolutionResult,  "unsupportedForReason:",  v7));
    v35 = v33;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v35, 1LL));
    v8[2](v8, v34);
  }
}

- (void)handleUpdateMediaAffinity:(id)a3 completion:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    id v6 = -[INUpdateMediaAffinityIntentResponse initWithCode:userActivity:]( objc_alloc(&OBJC_CLASS___INUpdateMediaAffinityIntentResponse),  "initWithCode:userActivity:",  4LL,  0LL);
    (*((void (**)(id, INUpdateMediaAffinityIntentResponse *))a4 + 2))(v5, v6);
  }

- (void)resolveMediaItemsForSearchForMedia:(id)a3 withCompletion:(id)a4
{
  if (a4)
  {
    uint64_t v5 = _INSearchForMediaMediaItemUnsupportedReasonAppDoesntSupportIntent;
    id v6 = a4;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[INSearchForMediaMediaItemResolutionResult unsupportedForReason:]( &OBJC_CLASS___INSearchForMediaMediaItemResolutionResult,  "unsupportedForReason:",  v5));
    id v9 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
    (*((void (**)(id, void *))a4 + 2))(v6, v8);
  }

- (void)handleSearchForMedia:(id)a3 completion:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    id v6 = -[INSearchForMediaIntentResponse initWithCode:userActivity:]( objc_alloc(&OBJC_CLASS___INSearchForMediaIntentResponse),  "initWithCode:userActivity:",  5LL,  0LL);
    (*((void (**)(id, INSearchForMediaIntentResponse *))a4 + 2))(v5, v6);
  }

- (unint64_t)reason
{
  return self->_reason;
}

  ;
}

  ;
}

@end