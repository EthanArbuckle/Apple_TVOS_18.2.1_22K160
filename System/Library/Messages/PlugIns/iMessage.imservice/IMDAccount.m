@interface IMDAccount
- (id)idsAccount;
@end

@implementation IMDAccount

- (id)idsAccount
{
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___IMDIDSAccount);
  if ((objc_opt_isKindOfClass(self, v3) & 1) != 0) {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMDAccount idsAccount](self, "idsAccount"));
  }
  else {
    v4 = 0LL;
  }
  return v4;
}

@end