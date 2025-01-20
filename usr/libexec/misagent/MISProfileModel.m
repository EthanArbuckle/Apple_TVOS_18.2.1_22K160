@interface MISProfileModel
- (BOOL)isProfileInstalled:(id)a3;
- (BOOL)queryCMSBlobForProfile:(id)a3 forcingXML:(BOOL)a4 handler:(id)a5;
- (MISProfileModel)initWithDB:(id)a3;
- (id)getCertPrimaryKey:(id)a3;
- (int)insertProfile:(void *)a3;
- (int)removeProfile:(id)a3;
- (void)queryProfile:(id)a3;
@end

@implementation MISProfileModel

- (MISProfileModel)initWithDB:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MISProfileModel;
  v5 = -[MISProfileModel init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_weak_db, v4);
    v7 = v6;
  }

  return v6;
}

- (BOOL)queryCMSBlobForProfile:(id)a3 forcingXML:(BOOL)a4 handler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weak_db);
  if (v8)
  {
    if (!v6) {
      goto LABEL_4;
    }
    uint64_t v22 = 0LL;
    v23 = &v22;
    uint64_t v24 = 0x2020000000LL;
    char v25 = 0;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100008F44;
    v20[3] = &unk_100010760;
    id v21 = v8;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100008FA0;
    v17[3] = &unk_100010B08;
    v19 = &v22;
    id v18 = v9;
    unsigned int v11 = [WeakRetained executeQuery:@"SELECT cms_blob FROM xml_profiles_cache WHERE uuid = @uuid" withBind:v20 withResults:v17];
    int v12 = *((unsigned __int8 *)v23 + 24);
    BOOL v13 = v11 == 0;

    _Block_object_dispose(&v22, 8);
    if (!v12)
    {
LABEL_4:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_100008FBC;
      v15[3] = &unk_100010760;
      id v16 = v8;
      BOOL v13 = [WeakRetained executeQuery:@"SELECT cms_blob FROM profiles WHERE uuid = @uuid" withBind:v15 withResults:v9] == 0;
    }
  }

  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (void)queryProfile:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v8 = 0LL;
    id v9 = &v8;
    uint64_t v10 = 0x2020000000LL;
    uint64_t v11 = 0LL;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000090E0;
    v7[3] = &unk_1000109C8;
    v7[4] = &v8;
    -[MISProfileModel queryCMSBlobForProfile:forcingXML:handler:]( self,  "queryCMSBlobForProfile:forcingXML:handler:",  v4,  0LL,  v7);
    v5 = (void *)v9[3];
    _Block_object_dispose(&v8, 8);
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

- (BOOL)isProfileInstalled:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weak_db);
  if (v4)
  {
    uint64_t v13 = 0LL;
    v14 = &v13;
    uint64_t v15 = 0x2020000000LL;
    char v16 = 0;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10000929C;
    v11[3] = &unk_100010760;
    id v12 = v4;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000092F8;
    v8[3] = &unk_100010B30;
    uint64_t v10 = &v13;
    id v9 = v12;
    [WeakRetained executeQuery:@"SELECT uuid FROM profiles WHERE uuid = @uuid" withBind:v11 withResults:v8];
    BOOL v6 = *((_BYTE *)v14 + 24) != 0;

    _Block_object_dispose(&v13, 8);
  }

  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (int)insertProfile:(void *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weak_db);
  uint64_t UUID = MISProvisioningProfileGetUUID(a3);
  v35 = (void *)objc_claimAutoreleasedReturnValue(UUID);
  uint64_t Name = MISProvisioningProfileGetName(a3);
  v33 = (void *)objc_claimAutoreleasedReturnValue(Name);
  uint64_t DeveloperCertificatesHashes = MISProvisioningProfileGetDeveloperCertificatesHashes(a3);
  v30 = (void *)objc_claimAutoreleasedReturnValue(DeveloperCertificatesHashes);
  uint64_t TeamIdentifier = MISProvisioningProfileGetTeamIdentifier(a3);
  v32 = (void *)objc_claimAutoreleasedReturnValue(TeamIdentifier);
  uint64_t ExpirationDate = MISProvisioningProfileGetExpirationDate(a3);
  v31 = (void *)objc_claimAutoreleasedReturnValue(ExpirationDate);
  DataRepresentation = (void *)MISProfileCreateDataRepresentation(a3);
  uint64_t Entitlements = MISProvisioningProfileGetEntitlements(a3);
  v29 = (void *)objc_claimAutoreleasedReturnValue(Entitlements);
  uint64_t EmbeddedDER = MISProvisioningProfileGetEmbeddedDER(a3);
  v36 = (void *)objc_claimAutoreleasedReturnValue(EmbeddedDER);
  id v12 = objc_autoreleasePoolPush();
  if ([v36 length])
  {
    uint64_t v13 = (void *)MISProfileCreateWithData(kCFAllocatorDefault, v36);
    if (MISProvisioningProfileValidateSignature(v13))
    {
      int v14 = 4;
    }

    else
    {
      int v14 = -[MISProfileModel insertProfile:](self, "insertProfile:", v13);
      if (!v14)
      {
        v64[0] = _NSConcreteStackBlock;
        v64[1] = 3221225472LL;
        v64[2] = sub_1000098D0;
        v64[3] = &unk_100010878;
        id v65 = v35;
        id v66 = DataRepresentation;
        int v14 = objc_msgSend( WeakRetained,  "executeQuery:withBind:withResults:",  @"INSERT INTO xml_profiles_cache VALUES (@uuid, @cms_blob)",  v64,  0);
      }
    }

    objc_autoreleasePoolPop(v12);
  }

  else
  {
    objc_autoreleasePoolPop(v12);
    BOOL v15 = MISProvisioningProfileProvisionsAllDevices(a3) != 0;
    BOOL v16 = MISProvisioningProfileIsForLocalProvisioning(a3) != 0;
    BOOL v17 = MISProvisioningProfileIsAppleInternalProfile(a3) != 0;
    BOOL v18 = MISProvisioningProfileIsForBetaDeployment(a3) != 0;
    BOOL v19 = MISProfileIsDEREncoded(a3) != 0;
    uint64_t v60 = 0LL;
    v61 = &v60;
    uint64_t v62 = 0x2020000000LL;
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472LL;
    v49[2] = sub_100009970;
    v49[3] = &unk_100010B58;
    id v20 = v35;
    id v50 = v20;
    id v51 = v32;
    id v52 = v33;
    id v53 = v31;
    BOOL v55 = v15;
    BOOL v56 = v17;
    BOOL v57 = v16;
    BOOL v58 = v18;
    id v54 = DataRepresentation;
    BOOL v59 = v19;
    unsigned int v63 = objc_msgSend( WeakRetained,  "executeQuery:withBind:withResults:",  @"INSERT INTO profiles VALUES (@uuid, @team_id, NULL, @name, @expires, @is_for_all_devices, @is_apple_internal, @is_local, @is_beta, @cms_blob, @is_der)",  v49,  0);
    int v14 = *((_DWORD *)v61 + 6);
    if (!v14)
    {
      __int128 v47 = 0u;
      __int128 v48 = 0u;
      __int128 v45 = 0u;
      __int128 v46 = 0u;
      id v21 = v30;
      id v22 = [v21 countByEnumeratingWithState:&v45 objects:v67 count:16];
      if (v22)
      {
        uint64_t v23 = *(void *)v46;
        while (2)
        {
          for (i = 0LL; i != v22; i = (char *)i + 1)
          {
            if (*(void *)v46 != v23) {
              objc_enumerationMutation(v21);
            }
            char v25 = (void *)objc_claimAutoreleasedReturnValue( -[MISProfileModel getCertPrimaryKey:]( self,  "getCertPrimaryKey:",  *(void *)(*((void *)&v45 + 1) + 8LL * (void)i)));
            if (!v25)
            {
              int v14 = 1;
LABEL_19:

              goto LABEL_20;
            }

            v42[0] = _NSConcreteStackBlock;
            v42[1] = 3221225472LL;
            v42[2] = sub_100009B4C;
            v42[3] = &unk_100010878;
            id v43 = v20;
            id v26 = v25;
            id v44 = v26;
            int v14 = objc_msgSend( WeakRetained,  "executeQuery:withBind:withResults:",  @"INSERT INTO certificate_provisioning_cache VALUES (NULL, @uuid, @leaf_pk)",  v42,  0);
            *((_DWORD *)v61 + 6) = v14;

            if (v14) {
              goto LABEL_19;
            }
          }

          id v22 = [v21 countByEnumeratingWithState:&v45 objects:v67 count:16];
          if (v22) {
            continue;
          }
          break;
        }
      }

      v27 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained Entitlements]);
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472LL;
      v38[2] = sub_100009BD4;
      v38[3] = &unk_100010B80;
      v41 = &v60;
      id v39 = WeakRetained;
      id v40 = v20;
      [v27 emitEntitlementPredicates:v29 predicateHandler:v38];

      int v14 = *((_DWORD *)v61 + 6);
      id v21 = v39;
LABEL_20:
    }

    _Block_object_dispose(&v60, 8);
  }

  return v14;
}

- (int)removeProfile:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weak_db);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100009D0C;
  v9[3] = &unk_100010760;
  id v10 = v4;
  id v6 = v4;
  int v7 = [WeakRetained executeQuery:@"DELETE FROM profiles WHERE uuid = @uuid" withBind:v9 withResults:0];

  return v7;
}

- (id)getCertPrimaryKey:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weak_db);
  uint64_t v14 = 0LL;
  BOOL v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  BOOL v17 = sub_100009EF4;
  BOOL v18 = sub_100009F04;
  id v19 = 0LL;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100009F0C;
  v12[3] = &unk_100010760;
  id v6 = v4;
  id v13 = v6;
  if (objc_msgSend( WeakRetained,  "executeQuery:withBind:withResults:",  @"INSERT OR IGNORE INTO certificates VALUES (NULL, @cert)",  v12,  0))
  {
    id v7 = 0LL;
  }

  else
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100009F74;
    v10[3] = &unk_100010760;
    id v11 = v6;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100009FDC;
    v9[3] = &unk_1000109C8;
    void v9[4] = &v14;
    if ([WeakRetained executeQuery:@"SELECT pk FROM certificates WHERE leaf = @cert" withBind:v10 withResults:v9]) {
      id v7 = 0LL;
    }
    else {
      id v7 = (id)v15[5];
    }
  }

  _Block_object_dispose(&v14, 8);
  return v7;
}

- (void).cxx_destruct
{
}

@end