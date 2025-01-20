@interface DMDFetchCertificatesOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDFetchCertificatesOperation

+ (id)whitelistedClassesForRequest
{
  v5[0] = objc_opt_class(&OBJC_CLASS___DMFFetchCertificatesRequest);
  v5[1] = objc_opt_class(&OBJC_CLASS___DMFFetchInstalledCertificatesRequest);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v5, 2LL));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v2));

  return v3;
}

+ (id)requiredEntitlements
{
  return &off_1000A5700;
}

- (void)runWithRequest:(id)a3
{
  id v34 = a3;
  v32 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v30 installedProfilesWithFilterFlags:1]);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___MCCertificatePayload);
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v45;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v45 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)i);
        if (![v34 managedOnly] || objc_msgSend(v10, "isManagedByMDM"))
        {
          __int128 v42 = 0u;
          __int128 v43 = 0u;
          __int128 v40 = 0u;
          __int128 v41 = 0u;
          v11 = (void *)objc_claimAutoreleasedReturnValue([v10 payloads]);
          id v12 = [v11 countByEnumeratingWithState:&v40 objects:v49 count:16];
          if (v12)
          {
            id v13 = v12;
            uint64_t v14 = *(void *)v41;
            do
            {
              for (j = 0LL; j != v13; j = (char *)j + 1)
              {
                if (*(void *)v41 != v14) {
                  objc_enumerationMutation(v11);
                }
                v16 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)j);
                if ((objc_opt_isKindOfClass(v16, v5) & 1) != 0)
                {
                  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 certificatePersistentID]);
                  -[NSMutableSet addObject:](v3, "addObject:", v17);
                }
              }

              id v13 = [v11 countByEnumeratingWithState:&v40 objects:v49 count:16];
            }

            while (v13);
          }
        }
      }

      id v7 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
    }

    while (v7);
  }

  CFTypeID TypeID = SecIdentityGetTypeID();
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  v19 = v3;
  id v20 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v36,  v48,  16LL);
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v37;
    do
    {
      for (k = 0LL; k != v21; k = (char *)k + 1)
      {
        if (*(void *)v37 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = (__SecCertificate *)+[MCKeychain copyItemWithPersistentID:useSystemKeychain:]( &OBJC_CLASS___MCKeychain,  "copyItemWithPersistentID:useSystemKeychain:",  *(void *)(*((void *)&v36 + 1) + 8LL * (void)k),  1LL);
        if (v24)
        {
          v25 = v24;
          SecCertificateRef certificateRef = 0LL;
          CFTypeID v26 = CFGetTypeID(v24);
          if (v26 != TypeID)
          {
            SecCertificateRef certificateRef = v25;
LABEL_30:
            v27 = objc_alloc(&OBJC_CLASS___DMFCertificate);
            v28 = -[DMFCertificate initWithCertificateRef:isIdentity:]( v27,  "initWithCertificateRef:isIdentity:",  certificateRef,  v26 == TypeID);
            -[NSMutableArray addObject:](v32, "addObject:", v28);

            CFRelease(certificateRef);
            continue;
          }

          SecIdentityCopyCertificate(v25, &certificateRef);
          CFRelease(v25);
          if (certificateRef) {
            goto LABEL_30;
          }
        }
      }

      id v21 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v36,  v48,  16LL);
    }

    while (v21);
  }

  id v29 = [[DMFFetchCertificatesResultObject alloc] initWithCertificates:v32];
  -[DMDFetchCertificatesOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v29);
}

@end