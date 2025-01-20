@interface DMFProfile
- (id)initWithProfile:(id)a3 isManaged:(BOOL)a4 signerCertificates:(id)a5 restrictions:(id)a6;
@end

@implementation DMFProfile

- (id)initWithProfile:(id)a3 isManaged:(BOOL)a4 signerCertificates:(id)a5 restrictions:(id)a6
{
  id v8 = a3;
  id v42 = a5;
  id v40 = a6;
  v41 = v8;
  if ([v8 isEncrypted])
  {
    v9 = 0LL;
  }

  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v8 payloads]);
    v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [0 count]));
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    id obj = v10;
    id v11 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v49;
      do
      {
        v14 = 0LL;
        do
        {
          if (*(void *)v49 != v13) {
            objc_enumerationMutation(obj);
          }
          v15 = *(void **)(*((void *)&v48 + 1) + 8LL * (void)v14);
          id v16 = objc_alloc(&OBJC_CLASS___DMFProfilePayload);
          v17 = (void *)objc_claimAutoreleasedReturnValue([v15 type]);
          v18 = (void *)objc_claimAutoreleasedReturnValue([v15 identifier]);
          id v19 = [v15 version];
          v20 = (void *)objc_claimAutoreleasedReturnValue([v15 displayName]);
          v21 = (void *)objc_claimAutoreleasedReturnValue([v15 organization]);
          v22 = (void *)objc_claimAutoreleasedReturnValue([v15 payloadDescription]);
          id v23 = [v16 initWithType:v17 identifier:v18 payloadVersion:v19 displayName:v20 organization:v21 payloadDescription:v22];
          [v46 addObject:v23];

          v14 = (char *)v14 + 1;
        }

        while (v12 != v14);
        id v12 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
      }

      while (v12);
    }

    id v8 = v41;
    v9 = v46;
  }

  v47 = v9;
  BOOL obja = [v8 installType] == (id)2;
  v37 = (void *)objc_claimAutoreleasedReturnValue([v8 UUID]);
  v36 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  id v35 = [v8 version];
  v34 = (void *)objc_claimAutoreleasedReturnValue([v8 displayName]);
  v33 = (void *)objc_claimAutoreleasedReturnValue([v8 organization]);
  v24 = (void *)objc_claimAutoreleasedReturnValue([v8 profileDescription]);
  unsigned __int8 v25 = [v8 isLocked];
  v26 = (void *)objc_claimAutoreleasedReturnValue([v8 removalPasscode]);
  unsigned __int8 v27 = [v8 isEncrypted];
  id v28 = [v42 copy];
  id v29 = [v9 copy];
  id v30 = [v40 copy];
  BYTE3(v32) = v27;
  BYTE2(v32) = v26 != 0LL;
  BYTE1(v32) = v25;
  LOBYTE(v32) = a4;
  objb = -[DMFProfile initWithUUID:type:identifier:profileVersion:displayName:organization:profileDescription:isManaged:isLocked:hasRemovalPasscode:isEncrypted:signerCertificates:payloads:restrictions:]( self,  "initWithUUID:type:identifier:profileVersion:displayName:organization:profileDescription:isManaged:isLocked:ha sRemovalPasscode:isEncrypted:signerCertificates:payloads:restrictions:",  v37,  obja,  v36,  v35,  v34,  v33,  v24,  v32,  v28,  v29,  v30);

  return objb;
}

@end