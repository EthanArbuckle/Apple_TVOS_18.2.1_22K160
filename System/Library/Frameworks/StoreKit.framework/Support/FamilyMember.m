@interface FamilyMember
- (BOOL)isAskToBuyEnabled;
- (BOOL)isCurrentSignedInUser;
- (BOOL)isSharingPurchases;
- (FamilyMember)initWithDictionaryRepresentation:(id)a3;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)iCloudDSID;
- (NSNumber)iTunesDSID;
- (NSString)firstName;
- (NSString)iCloudUsername;
- (NSString)iTunesUsername;
- (NSString)lastName;
- (id)description;
- (void)setCurrentSignedInUser:(BOOL)a3;
@end

@implementation FamilyMember

- (FamilyMember)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"ITunesPreferredDsid"]);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0) {
    id v7 = v5;
  }
  else {
    id v7 = 0LL;
  }

  if (v7)
  {
    v38.receiver = self;
    v38.super_class = (Class)&OBJC_CLASS___FamilyMember;
    v8 = -[FamilyMember init](&v38, "init");
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"askToBuy"]);
      uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0) {
        id v11 = v9;
      }
      else {
        id v11 = 0LL;
      }

      v8->_askToBuyEnabled = [v11 BOOLValue];
      v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"firstName"]);
      uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0) {
        v16 = v14;
      }
      else {
        v16 = 0LL;
      }

      firstName = v8->_firstName;
      v8->_firstName = v16;

      v18 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"ICloudDsid"]);
      uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0) {
        v20 = v18;
      }
      else {
        v20 = 0LL;
      }

      iCloudDSID = v8->_iCloudDSID;
      v8->_iCloudDSID = v20;

      v22 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"accountName"]);
      uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v22, v23) & 1) != 0) {
        v24 = v22;
      }
      else {
        v24 = 0LL;
      }

      iCloudUsername = v8->_iCloudUsername;
      v8->_iCloudUsername = v24;

      objc_storeStrong((id *)&v8->_iTunesDSID, v7);
      v26 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"ITunesPreferredAccountName"]);
      uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v26, v27) & 1) != 0) {
        v28 = v26;
      }
      else {
        v28 = 0LL;
      }

      iTunesUsername = v8->_iTunesUsername;
      v8->_iTunesUsername = v28;

      v30 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"lastName"]);
      uint64_t v31 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v30, v31) & 1) != 0) {
        v32 = v30;
      }
      else {
        v32 = 0LL;
      }

      lastName = v8->_lastName;
      v8->_lastName = v32;

      v34 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"sharingPurchases"]);
      uint64_t v35 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v34, v35) & 1) != 0) {
        id v36 = v34;
      }
      else {
        id v36 = 0LL;
      }

      v8->_sharingPurchases = [v36 BOOLValue];
    }

    self = v8;
    v13 = self;
  }

  else
  {
    if (qword_10032E7E0 != -1) {
      dispatch_once(&qword_10032E7E0, &stru_1002E91E0);
    }
    v12 = (os_log_s *)qword_10032E798;
    if (os_log_type_enabled((os_log_t)qword_10032E798, OS_LOG_TYPE_ERROR)) {
      sub_1002618A0((uint64_t)v4, v12);
    }
    v13 = 0LL;
  }

  return v13;
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[FamilyMember isAskToBuyEnabled](self, "isAskToBuyEnabled")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, @"askToBuy");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyMember iTunesDSID](self, "iTunesDSID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v5,  @"ITunesPreferredDsid");

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[FamilyMember isSharingPurchases](self, "isSharingPurchases")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v6, @"sharingPurchases");

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyMember firstName](self, "firstName"));
  -[NSMutableDictionary ams_setNullableObject:forKey:](v3, "ams_setNullableObject:forKey:", v7, @"firstName");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyMember iCloudDSID](self, "iCloudDSID"));
  -[NSMutableDictionary ams_setNullableObject:forKey:](v3, "ams_setNullableObject:forKey:", v8, @"ICloudDsid");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyMember iCloudUsername](self, "iCloudUsername"));
  -[NSMutableDictionary ams_setNullableObject:forKey:](v3, "ams_setNullableObject:forKey:", v9, @"accountName");

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyMember iTunesUsername](self, "iTunesUsername"));
  -[NSMutableDictionary ams_setNullableObject:forKey:]( v3,  "ams_setNullableObject:forKey:",  v10,  @"ITunesPreferredAccountName");

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyMember lastName](self, "lastName"));
  -[NSMutableDictionary ams_setNullableObject:forKey:](v3, "ams_setNullableObject:forKey:", v11, @"lastName");

  id v12 = -[NSMutableDictionary copy](v3, "copy");
  return (NSDictionary *)v12;
}

- (id)description
{
  v15[0] = @"firstName";
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyMember firstName](self, "firstName"));
  v16[0] = v3;
  v15[1] = @"iCloudDSID";
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyMember iCloudDSID](self, "iCloudDSID"));
  v16[1] = v4;
  v15[2] = @"iCloudUsername";
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyMember iCloudUsername](self, "iCloudUsername"));
  v16[2] = v5;
  v15[3] = @"isCurrentSignedInUser";
  if (-[FamilyMember isCurrentSignedInUser](self, "isCurrentSignedInUser")) {
    uint64_t v6 = @"true";
  }
  else {
    uint64_t v6 = @"false";
  }
  v16[3] = v6;
  v15[4] = @"iTunesDSID";
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyMember iTunesDSID](self, "iTunesDSID"));
  v16[4] = v7;
  v15[5] = @"iTunesUsername";
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyMember iTunesUsername](self, "iTunesUsername"));
  v16[5] = v8;
  v15[6] = @"isAskToBuyEnabled";
  if (-[FamilyMember isAskToBuyEnabled](self, "isAskToBuyEnabled")) {
    v9 = @"true";
  }
  else {
    v9 = @"false";
  }
  v16[6] = v9;
  v15[7] = @"isSharingPurchases";
  if (-[FamilyMember isSharingPurchases](self, "isSharingPurchases")) {
    uint64_t v10 = @"true";
  }
  else {
    uint64_t v10 = @"false";
  }
  v16[7] = v10;
  v15[8] = @"lastName";
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyMember lastName](self, "lastName"));
  v16[8] = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  9LL));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v12));
  return v13;
}

- (BOOL)isCurrentSignedInUser
{
  return self->_currentSignedInUser;
}

- (void)setCurrentSignedInUser:(BOOL)a3
{
  self->_currentSignedInUser = a3;
}

- (BOOL)isAskToBuyEnabled
{
  return self->_askToBuyEnabled;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSNumber)iCloudDSID
{
  return self->_iCloudDSID;
}

- (NSString)iCloudUsername
{
  return self->_iCloudUsername;
}

- (NSNumber)iTunesDSID
{
  return self->_iTunesDSID;
}

- (NSString)iTunesUsername
{
  return self->_iTunesUsername;
}

- (NSString)lastName
{
  return self->_lastName;
}

- (BOOL)isSharingPurchases
{
  return self->_sharingPurchases;
}

- (void).cxx_destruct
{
}

@end