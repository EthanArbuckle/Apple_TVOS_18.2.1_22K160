@interface DMDFetchProvisioningProfilesOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDFetchProvisioningProfilesOperation

+ (id)whitelistedClassesForRequest
{
  v5[0] = objc_opt_class(&OBJC_CLASS___DMFFetchProvisioningProfilesRequest);
  v5[1] = objc_opt_class(&OBJC_CLASS___DMFFetchInstalledProvisioningProfilesRequest);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v5, 2LL));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v2));

  return v3;
}

+ (id)requiredEntitlements
{
  return &off_1000A5820;
}

- (void)runWithRequest:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v5,  "listInstalledProvisioningProfileUUIDsWithManagedOnly:",  objc_msgSend(v4, "managedOnly")));

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v6 count]));
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      v12 = 0LL;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        if (MISCopyProvisioningProfile(*(void *)(*((void *)&v17 + 1) + 8LL * (void)v12), &v16))
        {

          -[DMDTaskOperation endOperationWithDMFErrorCode:](self, "endOperationWithDMFErrorCode:", 2400LL);
          goto LABEL_11;
        }

        v13 = objc_alloc(&OBJC_CLASS___DMFProvisioningProfile);
        v14 = -[DMFProvisioningProfile initWithProfileRef:](v13, "initWithProfileRef:", v16);
        [v7 addObject:v14];

        v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  id v15 = [[DMFFetchProvisioningProfilesResultObject alloc] initWithProfiles:v7];
  -[DMDFetchProvisioningProfilesOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v15);

LABEL_11:
}

@end