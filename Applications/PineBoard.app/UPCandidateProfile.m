@interface UPCandidateProfile
- (NSString)pb_identifier;
- (NSString)pb_identityLogString;
- (PBSSuggestedUserProfile)pb_suggestedUserProfile;
@end

@implementation UPCandidateProfile

- (PBSSuggestedUserProfile)pb_suggestedUserProfile
{
  v3 = objc_alloc(&OBJC_CLASS___PBSSuggestedUserProfile);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UPCandidateProfile pb_identifier](self, "pb_identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UPCandidateProfile personNameComponents](self, "personNameComponents"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UPCandidateProfile iCloudAltDSID](self, "iCloudAltDSID"));
  v7 = -[PBSSuggestedUserProfile initWithIdentifier:personNameComponents:altDSID:suppressed:dsid:]( v3,  "initWithIdentifier:personNameComponents:altDSID:suppressed:dsid:",  v4,  v5,  v6,  -[UPCandidateProfile isSuppressed](self, "isSuppressed"),  0LL);

  return v7;
}

- (NSString)pb_identifier
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UPCandidateProfile systemAppCandidateUserIdentifier](self, "systemAppCandidateUserIdentifier"));
  if (v4) {
    return (NSString *)v4;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"identifier != nil"));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1002783F4(a2, (uint64_t)self, (uint64_t)v6);
  }
  result = (NSString *)_bs_set_crash_log_message([v6 UTF8String]);
  __break(0);
  return result;
}

- (NSString)pb_identityLogString
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UPCandidateProfile systemAppCandidateUserIdentifier](self, "systemAppCandidateUserIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UPCandidateProfile identity](self, "identity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ (identifier=%@)",  v4,  v3));

  return (NSString *)v5;
}

@end