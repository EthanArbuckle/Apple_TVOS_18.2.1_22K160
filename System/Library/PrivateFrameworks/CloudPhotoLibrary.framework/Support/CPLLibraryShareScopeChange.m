@interface CPLLibraryShareScopeChange
- (id)ckRecordForLibraryShareSettingsWithZoneID:(id)a3 userID:(id)a4;
- (void)updateExitConfigFromPreviousScopeChange:(id)a3;
- (void)updateLibraryShareSettingsWithCKRecord:(id)a3;
- (void)updateWithExitConfigRecord:(id)a3;
- (void)updateWithExitStatesRecord:(id)a3;
@end

@implementation CPLLibraryShareScopeChange

- (void)updateWithExitStatesRecord:(id)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([a3 objectForKey:@"exitingParticipantUserIds"]);
  if ([v5 count]) {
    id v4 = v5;
  }
  else {
    id v4 = 0LL;
  }
  -[CPLLibraryShareScopeChange setExitingUserIdentifiers:](self, "setExitingUserIdentifiers:", v4);
}

- (void)updateWithExitConfigRecord:(id)a3
{
  id v16 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKey:@"retentionPolicy"]);
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 integerValue];
    if (v6 == (id)2) {
      uint64_t v7 = 2LL;
    }
    else {
      uint64_t v7 = v6 == (id)1;
    }
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  -[CPLLibraryShareScopeChange setExitRetentionPolicy:](self, "setExitRetentionPolicy:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKey:@"exitType"]);
  v9 = v8;
  if (v8)
  {
    v10 = (char *)[v8 integerValue];
    else {
      v11 = 0LL;
    }
  }

  else
  {
    v11 = 0LL;
  }

  -[CPLLibraryShareScopeChange setExitType:](self, "setExitType:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKey:@"exitSource"]);
  v13 = v12;
  else {
    uint64_t v15 = 0LL;
  }
  -[CPLLibraryShareScopeChange setExitSource:](self, "setExitSource:", v15);
}

- (void)updateExitConfigFromPreviousScopeChange:(id)a3
{
  id v7 = a3;
  if (v7)
  {
    uint64_t v4 = objc_opt_class(&OBJC_CLASS___CPLLibraryShareScopeChange);
    if ((objc_opt_isKindOfClass(v7, v4) & 1) != 0)
    {
      id v5 = v7;
      -[CPLLibraryShareScopeChange setExitRetentionPolicy:]( self,  "setExitRetentionPolicy:",  [v5 exitRetentionPolicy]);
      -[CPLLibraryShareScopeChange setExitType:](self, "setExitType:", [v5 exitType]);
      id v6 = [v5 exitSource];

      -[CPLLibraryShareScopeChange setExitSource:](self, "setExitSource:", v6);
    }
  }
}

- (void)updateLibraryShareSettingsWithCKRecord:(id)a3
{
  id v8 = a3;
  if (+[CPLLibraryShareScopeChange serverSupportsLibraryShareSettingsRecordSyncing]( &OBJC_CLASS___CPLLibraryShareScopeChange,  "serverSupportsLibraryShareSettingsRecordSyncing"))
  {
    id v4 = objc_msgSend( v8,  "cpl_legacyDecryptedObjectForKey:validateClass:",  @"userScopeDefinedRulesEnc",  objc_opt_class(NSData));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    -[CPLLibraryShareScopeChange setUserDefinedRules:](self, "setUserDefinedRules:", v5);
  }

  if (+[CPLLibraryShareScopeChange serverSupportsLibraryShareSettingsUserViewedParticipantTrashNotificationDateSyncing]( &OBJC_CLASS___CPLLibraryShareScopeChange,  "serverSupportsLibraryShareSettingsUserViewedParticipantTrashNotificationDateSyncing"))
  {
    id v6 = objc_msgSend( v8,  "cpl_legacyDecryptedObjectForKey:validateClass:",  @"userViewedTrashNotificationDateEnc",  objc_opt_class(NSDate));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[CPLLibraryShareScopeChange setUserViewedParticipantTrashNotificationDate:]( self,  "setUserViewedParticipantTrashNotificationDate:",  v7);
  }
}

- (id)ckRecordForLibraryShareSettingsWithZoneID:(id)a3 userID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (+[CPLLibraryShareScopeChange serverSupportsLibraryShareSettingsRecordSyncing]( &OBJC_CLASS___CPLLibraryShareScopeChange,  "serverSupportsLibraryShareSettingsRecordSyncing"))
  {
    id v8 = CPLLibraryShareSettingsRecordID(v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if (v9)
    {
      v10 = -[CKRecord initWithRecordType:recordID:]( objc_alloc(&OBJC_CLASS___CKRecord),  "initWithRecordType:recordID:",  @"CPLScopeUserSettings",  v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLLibraryShareScopeChange userDefinedRules](self, "userDefinedRules"));

      if (v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLLibraryShareScopeChange userDefinedRules](self, "userDefinedRules"));
        -[CKRecord cpl_setLegacyEncryptedObject:forKey:]( v10,  "cpl_setLegacyEncryptedObject:forKey:",  v12,  @"userScopeDefinedRulesEnc");
      }

      if (+[CPLLibraryShareScopeChange serverSupportsLibraryShareSettingsUserViewedParticipantTrashNotificationDateSyncing]( &OBJC_CLASS___CPLLibraryShareScopeChange,  "serverSupportsLibraryShareSettingsUserViewedParticipantTrashNotificationDateSyncing"))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue( -[CPLLibraryShareScopeChange userViewedParticipantTrashNotificationDate]( self,  "userViewedParticipantTrashNotificationDate"));
        -[CKRecord cpl_setLegacyEncryptedObject:forKey:]( v10,  "cpl_setLegacyEncryptedObject:forKey:",  v13,  @"userViewedTrashNotificationDateEnc");
      }
    }

    else
    {
      v10 = 0LL;
    }
  }

  else
  {
    v10 = 0LL;
  }

  return v10;
}

@end