@interface UPCandidateProfileStoreSnapshot
- (PBSSuggestedUserProfileSnapshot)pb_suggestedUserProfilesSnapshot;
@end

@implementation UPCandidateProfileStoreSnapshot

- (PBSSuggestedUserProfileSnapshot)pb_suggestedUserProfilesSnapshot
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UPCandidateProfileStoreSnapshot profiles](self, "profiles"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allObjects]);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bs_map:", &stru_1003D2D18));

  v5 = -[PBSSuggestedUserProfileSnapshot initWithSuggestedUserProfiles:]( objc_alloc(&OBJC_CLASS___PBSSuggestedUserProfileSnapshot),  "initWithSuggestedUserProfiles:",  v4);
  return v5;
}

@end