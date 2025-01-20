@interface ACAccountStore
- (id)amsd_iTunesAccountWithRecordZoneName:(id)a3;
- (id)amsd_saveMultiUserManagedAccount:(id)a3;
@end

@implementation ACAccountStore

- (id)amsd_iTunesAccountWithRecordZoneName:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccountStore ams_iTunesAccounts](self, "ams_iTunesAccounts"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100002BEC;
  v9[3] = &unk_1000D5A88;
  id v10 = v4;
  id v6 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ams_firstObjectPassingTest:", v9));

  return v7;
}

- (id)amsd_saveMultiUserManagedAccount:(id)a3
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ams_homeUserAllIdentifiers"));
  if ([v6 count]) {
    unsigned __int8 v7 = 0;
  }
  else {
    unsigned __int8 v7 = objc_msgSend(v5, "ams_isSecondaryHomeUser");
  }

  if (!+[AMSDevice deviceIsAudioAccessory](&OBJC_CLASS___AMSDevice, "deviceIsAudioAccessory"))
  {
    if ((v7 & 1) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    id v17 = (id)objc_claimAutoreleasedReturnValue(-[ACAccountStore ams_saveAccount:](self, "ams_saveAccount:", v5));
    goto LABEL_18;
  }

@end