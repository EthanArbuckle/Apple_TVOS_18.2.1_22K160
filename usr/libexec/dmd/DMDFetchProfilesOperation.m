@interface DMDFetchProfilesOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (id)_profileListWithFilterFlags:(int)a3;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDFetchProfilesOperation

+ (id)whitelistedClassesForRequest
{
  v5[0] = objc_opt_class(&OBJC_CLASS___DMFFetchProfilesRequest);
  v5[1] = objc_opt_class(&OBJC_CLASS___DMFFetchInstalledProfilesRequest);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v5, 2LL));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v2));

  return v3;
}

+ (id)requiredEntitlements
{
  return &off_1000A5808;
}

- (void)runWithRequest:(id)a3
{
  id v4 = -[DMDFetchProfilesOperation _profileListWithFilterFlags:]( self,  "_profileListWithFilterFlags:",  MCProfileFilterFlagsFromDMFProfileFilterFlags((uint64_t)[a3 filterFlags]));
  id v6 = (id)objc_claimAutoreleasedReturnValue(v4);
  id v5 = [[DMFFetchProfilesResultObject alloc] initWithProfiles:v6];
  -[DMDFetchProfilesOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v5);
}

- (id)_profileListWithFilterFlags:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyReader sharedReader](&OBJC_CLASS___MCDependencyReader, "sharedReader"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](&OBJC_CLASS___MCRestrictionManager, "sharedManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 installedProfileIdentifiersWithFilterFlags:v3]);
  v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v6 count]));
  v42 = (void *)objc_claimAutoreleasedReturnValue([v5 userProfileRestrictions]);
  v41 = (void *)objc_claimAutoreleasedReturnValue([v5 systemProfileRestrictions]);
  v34 = v5;
  v40 = (void *)objc_claimAutoreleasedReturnValue([v5 defaultRestrictions]);
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  id obj = v6;
  id v7 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v54;
    uint64_t v38 = kMCDMManagedProfileToManagingProfileKey;
    uint64_t v39 = *(void *)v54;
    v35 = v4;
    do
    {
      v10 = 0LL;
      id v36 = v8;
      do
      {
        if (*(void *)v54 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v53 + 1) + 8LL * (void)v10);
        v12 = objc_autoreleasePoolPush();
        v13 = (void *)objc_claimAutoreleasedReturnValue([v4 installedProfileWithIdentifier:v11]);
        if (v13)
        {
          v48 = (void *)objc_claimAutoreleasedReturnValue([v44 dependentsOfParent:v11 inDomain:v38]);
          id v14 = [v48 count];
          v15 = (void *)objc_claimAutoreleasedReturnValue([v13 signerCertificates]);
          if ([v15 count])
          {
            id v45 = v14;
            v46 = v15;
            v47 = v12;
            __int128 v51 = 0u;
            __int128 v52 = 0u;
            __int128 v49 = 0u;
            __int128 v50 = 0u;
            id v16 = v15;
            id v17 = [v16 countByEnumeratingWithState:&v49 objects:v57 count:16];
            if (v17)
            {
              id v18 = v17;
              uint64_t v19 = *(void *)v50;
              do
              {
                for (i = 0LL; i != v18; i = (char *)i + 1)
                {
                  if (*(void *)v50 != v19) {
                    objc_enumerationMutation(v16);
                  }
                  uint64_t v21 = *(void *)(*((void *)&v49 + 1) + 8LL * (void)i);
                  uint64_t Length = SecCertificateGetLength(v21);
                  v23 = +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  SecCertificateGetBytePtr(v21),  Length);
                  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
                  [0 addObject:v24];
                }

                id v18 = [v16 countByEnumeratingWithState:&v49 objects:v57 count:16];
              }

              while (v18);
            }

            id v4 = v35;
            id v8 = v36;
            v15 = v46;
            v12 = v47;
            id v14 = v45;
          }

          BOOL v25 = v14 != 0LL;
          if ([v13 installType] == (id)2) {
            v26 = v42;
          }
          else {
            v26 = v41;
          }
          v27 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:v11]);
          id v28 = v8;
          v29 = v4;
          v30 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManager filterRestrictionDictionary:toIncludeOnlyRestrictionsThatDifferFromRestrictions:]( &OBJC_CLASS___MCRestrictionManager,  "filterRestrictionDictionary:toIncludeOnlyRestrictionsThatDifferFromRestrictions:",  v27,  v40));

          v31 = -[DMFProfile initWithProfile:isManaged:signerCertificates:restrictions:]( objc_alloc(&OBJC_CLASS___DMFProfile),  "initWithProfile:isManaged:signerCertificates:restrictions:",  v13,  v25,  0LL,  v30);
          [v43 addObject:v31];

          uint64_t v9 = v39;
          id v4 = v29;
          id v8 = v28;
        }

        objc_autoreleasePoolPop(v12);
        v10 = (char *)v10 + 1;
      }

      while (v10 != v8);
      id v8 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
    }

    while (v8);
  }

  id v32 = [v43 copy];
  return v32;
}

@end