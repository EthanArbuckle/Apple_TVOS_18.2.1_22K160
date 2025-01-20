@interface FamilyMember
- (id)description;
@end

@implementation FamilyMember

- (id)description
{
  v17 = @"firstName";
  if (self)
  {
    v3 = self->_firstName;
    v26 = v3;
    v18 = @"iCloudDSID";
    v4 = self->_iCloudDSID;
    v27 = v4;
    v19 = @"iCloudUsername";
    v5 = self->_iCloudUsername;
    v6 = v5;
    if (self->_currentSignedInUser) {
      v7 = @"true";
    }
    else {
      v7 = @"false";
    }
    v28 = v5;
    v29 = v7;
    v20 = @"isCurrentSignedInUser";
    v21 = @"iTunesDSID";
    v8 = self->_iTunesDSID;
    v30 = v8;
    v9 = self->_iTunesUsername;
    if (self->_askToBuyEnabled) {
      v10 = @"true";
    }
    else {
      v10 = @"false";
    }
    if (self->_sharingPurchases) {
      v11 = @"true";
    }
    else {
      v11 = @"false";
    }
    lastName = self->_lastName;
  }

  else
  {
    v9 = 0LL;
    v6 = 0LL;
    v3 = 0LL;
    v4 = 0LL;
    v8 = 0LL;
    lastName = 0LL;
    v26 = 0LL;
    v27 = 0LL;
    v18 = @"iCloudDSID";
    v19 = @"iCloudUsername";
    v10 = @"false";
    v28 = 0LL;
    v29 = @"false";
    v20 = @"isCurrentSignedInUser";
    v21 = @"iTunesDSID";
    v11 = @"false";
    v30 = 0LL;
  }

  v22 = @"iTunesUsername";
  v23 = @"isAskToBuyEnabled";
  v31 = v9;
  v32 = v10;
  v24 = @"isSharingPurchases";
  v25 = @"lastName";
  v33 = v11;
  v34 = lastName;
  v13 = lastName;
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v17,  9LL));

  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@",  v14,  v17,  v18,  v19,  v20,  v21,  v22,  v23,  v24,  v25,  v26,  v27,  v28,  v29,  v30,  v31,  v32,  v33,  v34));
  return v15;
}

- (void).cxx_destruct
{
}

@end