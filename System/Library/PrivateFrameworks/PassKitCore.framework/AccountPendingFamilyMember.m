@interface AccountPendingFamilyMember
+ (BOOL)deleteAccountPendingFamilyMembersForAccountPID:(id)a3 inDatabase:(id)a4;
+ (id)_accountPendingFamilyMembersWithQuery:(id)a3;
+ (id)_predicateForAccountPID:(id)a3;
+ (id)_predicateForAltDSID:(id)a3 accountPID:(id)a4;
+ (id)_predicateForDisplayedNotification:(BOOL)a3;
+ (id)_predicateForDisplayedNotification:(BOOL)a3 accountPID:(id)a4;
+ (id)_predicateForInviteEmail:(id)a3 accountPID:(id)a4;
+ (id)_propertySettersForAccountPendingFamilyMember;
+ (id)_propertyValuesAccountPendingFamilyMember:(id)a3;
+ (id)accountPendingFamilyMembersForAccountIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)accountPendingFamilyMembersWithDisplayedNotification:(BOOL)a3 inDatabase:(id)a4;
+ (id)anyInDatabase:(id)a3 inviteEmail:(id)a4 forAccountPID:(id)a5;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteAccountPendingFamilyMember:(id)a3 inDatabase:(id)a4;
+ (void)deleteAccountPendingFamilyMembersWithAccountIdentifier:(id)a3 altDSIDs:(id)a4 inDatabase:(id)a5;
+ (void)insertOrUpdateAccountPendingFamilyMembers:(id)a3 inDatabase:(id)a4;
- (AccountPendingFamilyMember)initWithPendingMember:(id)a3 accountPID:(id)a4 inDatabase:(id)a5;
- (void)updateWithAccountPendingFamilyMember:(id)a3;
@end

@implementation AccountPendingFamilyMember

+ (id)databaseTable
{
  return @"account_pending_family_member";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___Account, a2) == a3) {
    return @"account_pid";
  }
  else {
    return 0LL;
  }
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (__CFString *)v5;
  v9 = v7;
  if (v7 == @"pears.a"
    || v7
    && (unsigned int v8 = -[__CFString isEqualToString:](v7, "isEqualToString:", @"pears.a"), v9, v8))
  {
    [v6 addObject:@"JOIN pears ON pears.pid = account_pending_family_member.account_pid"];
  }
}

+ (void)insertOrUpdateAccountPendingFamilyMembers:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id obj = v6;
  id v8 = [v6 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v26;
    *(void *)&__int128 v9 = 138412290LL;
    __int128 v21 = v9;
    v22 = (objc_class *)a1;
    do
    {
      v12 = 0LL;
      id v23 = v10;
      do
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "accountIdentifier", v21));
        v15 = (void *)objc_claimAutoreleasedReturnValue( +[Account anyInDatabase:withIdentifier:]( &OBJC_CLASS___Account,  "anyInDatabase:withIdentifier:",  v7,  v14));

        if (v15)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v15 persistentID]));
          v17 = (void *)objc_claimAutoreleasedReturnValue([v13 inviteEmail]);
          if (v17)
          {
            v18 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[objc_class anyInDatabase:inviteEmail:forAccountPID:]( v22,  "anyInDatabase:inviteEmail:forAccountPID:",  v7,  v17,  v16));
            v19 = v18;
            if (v18) {
              -[os_log_s updateWithAccountPendingFamilyMember:](v18, "updateWithAccountPendingFamilyMember:", v13);
            }
            else {

            }
            id v10 = v23;
          }

          else
          {
            uint64_t Object = PKLogFacilityTypeGetObject(14LL);
            v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v21;
              v30 = v13;
              _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "The account pending family member is not defined correctly. %@",  buf,  0xCu);
            }
          }
        }

        v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
    }

    while (v10);
  }
}

- (AccountPendingFamilyMember)initWithPendingMember:(id)a3 accountPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t Object = PKLogFacilityTypeGetObject(14LL);
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    id v19 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Adding account pending family %@",  (uint8_t *)&v18,  0xCu);
  }

  id v14 = objc_msgSend((id)objc_opt_class(self, v13), "_propertyValuesAccountPendingFamilyMember:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  [v15 setObject:v9 forKey:@"account_pid"];
  v16 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v15, v10);

  return v16;
}

- (void)updateWithAccountPendingFamilyMember:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_propertyValuesAccountPendingFamilyMember:", v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v7);
}

+ (id)anyInDatabase:(id)a3 inviteEmail:(id)a4 forAccountPID:(id)a5
{
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForInviteEmail:a4 accountPID:a5]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v9]);

  return v10;
}

+ (id)accountPendingFamilyMembersWithDisplayedNotification:(BOOL)a3 inDatabase:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForDisplayedNotification:v4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _accountPendingFamilyMembersWithQuery:v8]);
  return v9;
}

+ (id)accountPendingFamilyMembersForAccountIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[Account anyInDatabase:withIdentifier:]( &OBJC_CLASS___Account,  "anyInDatabase:withIdentifier:",  v6,  a3));
  id v8 = v7;
  if (v7)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v7 persistentID]));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:v9]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v10]);

    v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _accountPendingFamilyMembersWithQuery:v11]);
  }

  else
  {
    v12 = 0LL;
  }

  return v12;
}

+ (BOOL)deleteAccountPendingFamilyMembersForAccountPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  LOBYTE(v7) = [v8 deleteAllEntities];
  return (char)v7;
}

+ (void)deleteAccountPendingFamilyMember:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 accountIdentifier]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[Account anyInDatabase:withIdentifier:]( &OBJC_CLASS___Account,  "anyInDatabase:withIdentifier:",  v7,  v8));

  if (v9)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(14LL);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Deleting account pending family member %@",  (uint8_t *)&v16,  0xCu);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue([v6 inviteEmail]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v9 persistentID]));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForInviteEmail:v12 accountPID:v13]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v7 predicate:v14]);

    [v15 deleteAllEntities];
  }
}

+ (void)deleteAccountPendingFamilyMembersWithAccountIdentifier:(id)a3 altDSIDs:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v23 = v8;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[Account anyInDatabase:withIdentifier:]( &OBJC_CLASS___Account,  "anyInDatabase:withIdentifier:",  v10,  v8));
  if (v11)
  {
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id v22 = v9;
    id obj = v9;
    id v12 = [obj countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v26;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v26 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)i);
          id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v11 persistentID]));
          int v18 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAltDSID:v16 accountPID:v17]);
          id v19 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v10 predicate:v18]);

          if ((uint64_t)[v19 countOfEntities] >= 1)
          {
            uint64_t Object = PKLogFacilityTypeGetObject(14LL);
            __int128 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v30 = v16;
              __int16 v31 = 2112;
              v32 = v23;
              _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Deleting account pending family member %@ with accountID %@",  buf,  0x16u);
            }

            [v19 deleteAllEntities];
          }
        }

        id v13 = [obj countByEnumeratingWithState:&v25 objects:v33 count:16];
      }

      while (v13);
    }

    id v9 = v22;
  }
}

+ (id)_predicateForInviteEmail:(id)a3 accountPID:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a4]);
  v12[0] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"invite_email",  v6));

  v12[1] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 2LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v9));

  return v10;
}

+ (id)_predicateForAltDSID:(id)a3 accountPID:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a4]);
  v12[0] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"alt_dsid",  v6));

  v12[1] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 2LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v9));

  return v10;
}

+ (id)_predicateForDisplayedNotification:(BOOL)a3 accountPID:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a4]);
  v11[0] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForDisplayedNotification:v4]);
  v11[1] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v8));

  return v9;
}

+ (id)_predicateForAccountPID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"account_pid",  a3);
}

+ (id)_predicateForDisplayedNotification:(BOOL)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"displayed_notification",  v3));

  return v4;
}

+ (id)_propertyValuesAccountPendingFamilyMember:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 inviteEmail]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"invite_email");

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 altDSID]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v6, @"alt_dsid");

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 inviteDate]);
  id v8 = (void *)_SQLValueForDate(v7);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v8, @"invite_date");

  id v9 = [v3 displayedNotification];
  -[NSMutableDictionary setBool:forKey:](v4, "setBool:forKey:", v9, @"displayed_notification");
  return v4;
}

+ (id)_accountPendingFamilyMembersWithQuery:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForAccountPendingFamilyMember]);
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  void v12[2] = sub_1000DBC88;
  v12[3] = &unk_100639BF0;
  id v15 = a1;
  id v13 = v5;
  id v8 = v6;
  uint64_t v14 = v8;
  id v9 = v5;
  [v4 enumeratePersistentIDsAndProperties:v7 usingBlock:v12];

  if (-[NSMutableSet count](v8, "count")) {
    id v10 = -[NSMutableSet copy](v8, "copy");
  }
  else {
    id v10 = 0LL;
  }

  return v10;
}

+ (id)_propertySettersForAccountPendingFamilyMember
{
  v3[0] = @"invite_email";
  v3[1] = @"invite_date";
  v4[0] = &stru_100642100;
  v4[1] = &stru_100642120;
  v3[2] = @"alt_dsid";
  v3[3] = @"displayed_notification";
  v4[2] = &stru_100642140;
  v4[3] = &stru_100642160;
  v3[4] = @"pears.a";
  v4[4] = &stru_100642180;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  5LL));
}

@end