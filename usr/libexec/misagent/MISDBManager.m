@interface MISDBManager
- (BOOL)isProfileInstalled:(id)a3;
- (BOOL)queryCMSBlobForProfile:(id)a3 forcingXML:(BOOL)a4 handler:(id)a5;
- (BOOL)setupSchema;
- (MISEntitlementsModel)Entitlements;
- (MISProfileModel)Profiles;
- (id)allCMSBlobs;
- (id)allProfiles;
- (id)findProfilesMatchingEntitlements:(id)a3 withCertificate:(id)a4;
- (id)findProfilesMatchingPredicates:(id)a3 withCertificate:(id)a4;
- (id)findProfilesWithCertificate:(id)a3;
- (int)insertProfile:(void *)a3;
- (int)removeProfile:(id)a3;
- (void)queryProfile:(id)a3;
- (void)setEntitlements:(id)a3;
- (void)setProfiles:(id)a3;
@end

@implementation MISDBManager

- (BOOL)setupSchema
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___MISDBManager;
  if (!-[SQLDB setupSchema](&v19, "setupSchema")) {
    return 0;
  }
  if (-[SQLDB checkpoint](self, "checkpoint"))
  {
    id v10 = sub_10000758C();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10000AC20(v11);
    }

    abort();
  }

  v3 = -[MISProfileModel initWithDB:](objc_alloc(&OBJC_CLASS___MISProfileModel), "initWithDB:", self);
  Profiles = self->Profiles;
  self->Profiles = v3;

  v5 = -[MISEntitlementsModel initWithDB:](objc_alloc(&OBJC_CLASS___MISEntitlementsModel), "initWithDB:", self);
  Entitlements = self->Entitlements;
  self->Entitlements = v5;

  uint64_t v15 = 0LL;
  v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  int v18 = 0;
  v13[0] = 0LL;
  v13[1] = v13;
  v13[2] = 0x3032000000LL;
  v13[3] = sub_100004270;
  v13[4] = sub_100004280;
  id v14 = 0LL;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100004288;
  v12[3] = &unk_100010788;
  v12[4] = self;
  v12[5] = v13;
  v12[6] = &v15;
  unsigned int v7 = -[SQLDB transaction:immediate:](self, "transaction:immediate:", v12, 1LL);
  *((_DWORD *)v16 + 6) = v7;
  BOOL v8 = v7 == 0;
  _Block_object_dispose(v13, 8);

  _Block_object_dispose(&v15, 8);
  return v8;
}

- (BOOL)queryCMSBlobForProfile:(id)a3 forcingXML:(BOOL)a4 handler:(id)a5
{
  return -[MISProfileModel queryCMSBlobForProfile:forcingXML:handler:]( self->Profiles,  "queryCMSBlobForProfile:forcingXML:handler:",  a3,  a4,  a5);
}

- (void)queryProfile:(id)a3
{
  return -[MISProfileModel queryProfile:](self->Profiles, "queryProfile:", a3);
}

- (BOOL)isProfileInstalled:(id)a3
{
  return -[MISProfileModel isProfileInstalled:](self->Profiles, "isProfileInstalled:", a3);
}

- (int)insertProfile:(void *)a3
{
  uint64_t v6 = 0LL;
  unsigned int v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  int v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100004A74;
  v5[3] = &unk_1000107B0;
  v5[5] = &v6;
  v5[6] = a3;
  v5[4] = self;
  -[SQLDB transaction:](self, "transaction:", v5);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int)removeProfile:(id)a3
{
  uint64_t v10 = 0LL;
  v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  int v13 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100004BB4;
  v6[3] = &unk_1000107D8;
  int v9 = &v10;
  unsigned int v7 = self;
  id v3 = a3;
  id v8 = v3;
  -[SQLDB transaction:](v7, "transaction:", v6);
  int v4 = *((_DWORD *)v11 + 6);

  _Block_object_dispose(&v10, 8);
  return v4;
}

- (id)allCMSBlobs
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100004CF8;
  v10[3] = &unk_100010800;
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 20LL));
  id v11 = v3;
  -[SQLDB executeQuery:withBind:withResults:]( self,  "executeQuery:withBind:withResults:",  @"SELECT cms_blob FROM profiles WHERE is_der = 0",  0LL,  v10);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100004D70;
  v8[3] = &unk_100010800;
  id v4 = v3;
  id v9 = v4;
  -[SQLDB executeQuery:withBind:withResults:]( self,  "executeQuery:withBind:withResults:",  @"SELECT cms_blob as blob FROM xml_profiles_cache",  0LL,  v8);
  v5 = v9;
  id v6 = v4;

  return v6;
}

- (id)allProfiles
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100004E7C;
  v5[3] = &unk_100010800;
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 20LL));
  id v6 = v3;
  -[SQLDB executeQuery:withBind:withResults:]( self,  "executeQuery:withBind:withResults:",  @"SELECT uuid, team_id, name, expires, is_for_all_devices, is_apple_internal, is_local, is_beta FROM profiles",  0LL,  v5);

  return v3;
}

- (id)findProfilesMatchingEntitlements:(id)a3 withCertificate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 10LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MISDBManager Entitlements](self, "Entitlements"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100004FBC;
  v13[3] = &unk_100010828;
  id v14 = v8;
  id v10 = v8;
  [v9 emitEntitlementPredicates:v7 predicateHandler:v13];

  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[MISDBManager findProfilesMatchingPredicates:withCertificate:]( self,  "findProfilesMatchingPredicates:withCertificate:",  v10,  v6));
  return v11;
}

- (id)findProfilesMatchingPredicates:(id)a3 withCertificate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 2LL));
  if (v7) {
    id v9 = @"SELECT uuid FROM certificate_provisioning_cache JOIN certificates ON certificates.pk = leaf_pk WHERE certificates.leaf = @cert";
  }
  else {
    id v9 = @"SELECT uuid FROM profiles";
  }
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100005178;
  v23[3] = &unk_100010850;
  id v24 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](&OBJC_CLASS___NSMutableString, "stringWithCapacity:", 1024LL));
  id v10 = v24;
  [v6 enumerateObjectsUsingBlock:v23];
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"WITH predicates(idx, predicate) AS (VALUES %@), filteredProfileUUIDs(uuid) AS (%@) SELECT * FROM (SELECT profiles.uuid, profiles.team_id, profiles.name, profiles.expires, profiles.is_for_all_devices, profiles.is_apple_internal, profiles.is_local, profiles.is_beta, profiles.is_der, COUNT(DISTINCT predicates.idx) as matchCount FROM filteredProfileUUIDs JOIN profiles ON profiles.uuid = filteredProfileUUIDs.uuid JOIN entitlements_provisioning_cache ON entitlements_provisioning_cache.uuid = filteredProfileUUIDs.uuid CROSS JOIN predicates WHERE profiles.is_apple_internal OR ((entitlements_provisioning_cache.wildcard = 0 AND entitlements_provisioning_cache.predicate = predicates.predicate) OR (entitlements_provisioning_cache.wildcard = 1 AND glob(entitlements_provisioning_cache.predicate, predicates.predicate))) GROUP BY profiles.uuid, profiles.is_apple_internal) AS aggregated WHERE aggregated.matchCount = @totalPredicates OR aggregated.is_apple_internal ORDER BY  aggregated.is_der DESC, aggregated.is_local ASC, aggregated.is_for_all_devices ASC",  v10,  v9));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000051CC;
  v20[3] = &unk_100010878;
  id v21 = v7;
  id v22 = v6;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10000534C;
  v18[3] = &unk_100010800;
  id v12 = v8;
  id v19 = v12;
  id v13 = v6;
  id v14 = v7;
  -[SQLDB executeQuery:withBind:withResults:](self, "executeQuery:withBind:withResults:", v11, v20, v18);

  uint64_t v15 = v19;
  id v16 = v12;

  return v16;
}

- (id)findProfilesWithCertificate:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 2LL));
  id v6 = @"SELECT uuid FROM certificate_provisioning_cache JOIN certificates ON certificates.pk = leaf_pk WHERE certificates.leaf = @cert";
  if (!v4) {
    id v6 = @"SELECT uuid FROM profiles";
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"WITH filteredProfileUUIDs(uuid) AS (%@) SELECT profiles.uuid, profiles.team_id, profiles.name, profiles.expires, profiles.is_for_all_devices, profiles.is_apple_internal, profiles.is_local, profiles.is_beta, profiles.is_der FROM filteredProfileUUIDs JOIN profiles ON profiles.uuid = filteredProfileUUIDs.uuid ORDER BY  profiles.is_der DESC, profiles.is_local ASC, profiles.is_for_all_devices ASC",  v6));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000054C0;
  v15[3] = &unk_100010760;
  id v16 = v4;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100005540;
  v13[3] = &unk_100010800;
  id v8 = v5;
  id v14 = v8;
  id v9 = v4;
  -[SQLDB executeQuery:withBind:withResults:](self, "executeQuery:withBind:withResults:", v7, v15, v13);

  id v10 = v14;
  id v11 = v8;

  return v11;
}

- (MISEntitlementsModel)Entitlements
{
  return (MISEntitlementsModel *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setEntitlements:(id)a3
{
}

- (MISProfileModel)Profiles
{
  return (MISProfileModel *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setProfiles:(id)a3
{
}

- (void).cxx_destruct
{
}

@end