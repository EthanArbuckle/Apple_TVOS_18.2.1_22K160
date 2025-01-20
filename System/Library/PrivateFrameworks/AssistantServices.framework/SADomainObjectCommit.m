@interface SADomainObjectCommit
- (BOOL)supportsADSADOCommand;
- (id)_ad_replyCommandValue;
- (id)domainFromSADObject;
- (id)expectedResponseClassName;
- (void)_ad_getMessagesRequestValueWithCompletionHandler:(id)a3;
@end

@implementation SADomainObjectCommit

- (void)_ad_getMessagesRequestValueWithCompletionHandler:(id)a3
{
  v10 = (void (**)(id, id))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SADomainObjectCommit identifier](self, "identifier"));
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___SASmsSms);
  char isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SADomainObjectCommit identifier](self, "identifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "af_messageValue"));

    if (v8) {
      id v9 = [[STSendDraftMessageRequest alloc] _initWithMessage:v8];
    }
    else {
      id v9 = 0LL;
    }
  }

  else
  {
    id v9 = 0LL;
    v8 = 0LL;
  }

  if (v10) {
    v10[2](v10, v9);
  }
}

- (id)_ad_replyCommandValue
{
  v3 = objc_alloc_init(&OBJC_CLASS___SADomainObjectCommitCompleted);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SADomainObjectCommit identifier](self, "identifier"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  -[SADomainObjectCommitCompleted setIdentifier:](v3, "setIdentifier:", v5);

  return v3;
}

- (id)domainFromSADObject
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SADomainObjectCommit identifier](self, "identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 groupIdentifier]);

  return v3;
}

- (id)expectedResponseClassName
{
  return SADomainObjectCommitCompletedClassIdentifier;
}

- (BOOL)supportsADSADOCommand
{
  return 1;
}

@end