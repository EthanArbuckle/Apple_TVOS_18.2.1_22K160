@interface MSDLegacyMigrationHelper
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)currentOSVersion;
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)getLastMigrationVersion;
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)getSkyEquivalentVersion;
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)getSydneyEquivalentVersion;
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)lastMigrationVersion;
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)skyEquivalentVersion;
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)sydneyEquivalentVersion;
- (BOOL)doPreSkyMigration;
- (BOOL)doPreSydneyMigration;
- (BOOL)getDoMigrationForTargetRelease:(id *)a3;
- (BOOL)isVersion:(id *)a3 lowerThan:(id *)a4;
- (MSDLegacyMigrationHelper)init;
- (NSString)osVersionStr;
- (id)stringFromNSOperatingSystemVersion:(id *)a3;
- (void)saveOSVerionAfterMigration;
- (void)setCurrentOSVersion:(id *)a3;
- (void)setDoPreSkyMigration:(BOOL)a3;
- (void)setDoPreSydneyMigration:(BOOL)a3;
- (void)setLastMigrationVersion:(id *)a3;
- (void)setOsVersionStr:(id)a3;
- (void)setSkyEquivalentVersion:(id *)a3;
- (void)setSydneyEquivalentVersion:(id *)a3;
@end

@implementation MSDLegacyMigrationHelper

- (MSDLegacyMigrationHelper)init
{
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___MSDLegacyMigrationHelper;
  v2 = -[MSDLegacyMigrationHelper init](&v28, "init");
  v3 = v2;
  if (v2)
  {
    -[MSDLegacyMigrationHelper getSkyEquivalentVersion](v2, "getSkyEquivalentVersion");
    __int128 v24 = v26;
    uint64_t v25 = v27;
    -[MSDLegacyMigrationHelper setSkyEquivalentVersion:](v3, "setSkyEquivalentVersion:", &v24);
    -[MSDLegacyMigrationHelper getSydneyEquivalentVersion](v3, "getSydneyEquivalentVersion");
    __int128 v20 = v22;
    uint64_t v21 = v23;
    -[MSDLegacyMigrationHelper setSydneyEquivalentVersion:](v3, "setSydneyEquivalentVersion:", &v20);
    -[MSDLegacyMigrationHelper getLastMigrationVersion](v3, "getLastMigrationVersion");
    __int128 v16 = v18;
    uint64_t v17 = v19;
    -[MSDLegacyMigrationHelper setLastMigrationVersion:](v3, "setLastMigrationVersion:", &v16);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
    v5 = v4;
    if (v4)
    {
      [v4 operatingSystemVersion];
    }

    else
    {
      __int128 v14 = 0uLL;
      uint64_t v15 = 0LL;
    }

    __int128 v12 = v14;
    uint64_t v13 = v15;
    -[MSDLegacyMigrationHelper setCurrentOSVersion:](v3, "setCurrentOSVersion:", &v12);

    -[MSDLegacyMigrationHelper skyEquivalentVersion](v3, "skyEquivalentVersion");
    -[MSDLegacyMigrationHelper setDoPreSkyMigration:]( v3,  "setDoPreSkyMigration:",  -[MSDLegacyMigrationHelper getDoMigrationForTargetRelease:](v3, "getDoMigrationForTargetRelease:", v11));
    -[MSDLegacyMigrationHelper sydneyEquivalentVersion](v3, "sydneyEquivalentVersion");
    -[MSDLegacyMigrationHelper setDoPreSydneyMigration:]( v3,  "setDoPreSydneyMigration:",  -[MSDLegacyMigrationHelper getDoMigrationForTargetRelease:](v3, "getDoMigrationForTargetRelease:", v10));
    -[MSDLegacyMigrationHelper currentOSVersion](v3, "currentOSVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue( -[MSDLegacyMigrationHelper stringFromNSOperatingSystemVersion:]( v3,  "stringFromNSOperatingSystemVersion:",  v9));
    -[MSDLegacyMigrationHelper setOsVersionStr:](v3, "setOsVersionStr:", v6);

    v7 = v3;
  }

  return v3;
}

- (void)saveOSVerionAfterMigration
{
  id v3 = sub_10003A95C();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDLegacyMigrationHelper osVersionStr](self, "osVersionStr"));
    int v8 = 138543362;
    v9 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Saving last migration OS version: %{public}@",  (uint8_t *)&v8,  0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDLegacyMigrationHelper osVersionStr](self, "osVersionStr"));
  [v6 setObject:v7 forKey:@"LastMigrationVersion"];
}

- (id)stringFromNSOperatingSystemVersion:(id *)a3
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%td.%td.%td",  a3->var0,  a3->var1,  a3->var2);
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)getSkyEquivalentVersion
{
  retstr->var1 = 0LL;
  retstr->var2 = 0LL;
  retstr->var0 = 15LL;
  return self;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)getSydneyEquivalentVersion
{
  retstr->var1 = 0LL;
  retstr->var2 = 0LL;
  retstr->var0 = 16LL;
  return self;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)getLastMigrationVersion
{
  retstr->var1 = -1LL;
  retstr->var2 = -1LL;
  retstr->var0 = -1LL;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"LastMigrationVersion"]);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 componentsSeparatedByString:@"."]);
    v7 = v6;
    if (v6 && [v6 count] == (id)3)
    {
      int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:0]);
      retstr->var0 = (int64_t)[v8 integerValue];

      v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:1]);
      retstr->var1 = (int64_t)[v9 integerValue];

      v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:2]);
      retstr->var2 = (int64_t)[v10 integerValue];
    }

    else
    {
      id v14 = sub_10003A95C();
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_100098E60((uint64_t)v5, v15);
      }
    }
  }

  else
  {
    id v16 = sub_10003A95C();
    v7 = (void *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR)) {
      sub_100098E20((os_log_t)v7);
    }
  }

  id v11 = sub_10003A95C();
  __int128 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138543362;
    __int128 v18 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Last migration OS version: %{public}@",  (uint8_t *)&v17,  0xCu);
  }

  return result;
}

- (BOOL)getDoMigrationForTargetRelease:(id *)a3
{
  $9FE6E10C8CE45DBC9A88DFDEA39A390D buf = *a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[MSDLegacyMigrationHelper stringFromNSOperatingSystemVersion:]( self,  "stringFromNSOperatingSystemVersion:",  &buf));
  -[MSDLegacyMigrationHelper lastMigrationVersion](self, "lastMigrationVersion");
  if (v10[3] == -1LL)
  {
    BOOL v6 = 1;
  }

  else
  {
    -[MSDLegacyMigrationHelper lastMigrationVersion](self, "lastMigrationVersion");
    $9FE6E10C8CE45DBC9A88DFDEA39A390D buf = *a3;
    BOOL v6 = -[MSDLegacyMigrationHelper isVersion:lowerThan:](self, "isVersion:lowerThan:", v10, &buf);
  }

  id v7 = sub_10003A95C();
  int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf.var0) = 138543618;
    *(int64_t *)((char *)&buf.var0 + 4) = (int64_t)v5;
    WORD2(buf.var1) = 1026;
    *(_DWORD *)((char *)&buf.var1 + 6) = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Need legacy migration for target OS release (%{public}@): %{public, BOOL}d",  (uint8_t *)&buf,  0x12u);
  }

  return v6;
}

- (BOOL)isVersion:(id *)a3 lowerThan:(id *)a4
{
  BOOL v4 = a3->var0 < a4->var0;
  if (a3->var0 == a4->var0)
  {
    int64_t var1 = a3->var1;
    int64_t v6 = a4->var1;
    BOOL v4 = var1 < v6;
    if (var1 == v6) {
      return a3->var2 < a4->var2;
    }
  }

  return v4;
}

- (BOOL)doPreSkyMigration
{
  return self->_doPreSkyMigration;
}

- (void)setDoPreSkyMigration:(BOOL)a3
{
  self->_doPreSkyMigration = a3;
}

- (BOOL)doPreSydneyMigration
{
  return self->_doPreSydneyMigration;
}

- (void)setDoPreSydneyMigration:(BOOL)a3
{
  self->_doPreSydneyMigration = a3;
}

- (NSString)osVersionStr
{
  return self->_osVersionStr;
}

- (void)setOsVersionStr:(id)a3
{
  self->_osVersionStr = (NSString *)a3;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)skyEquivalentVersion
{
  *($A44FF20282FB96BA82CF1B0FF6945C38 *)retstr = ($A44FF20282FB96BA82CF1B0FF6945C38)self[1];
  return self;
}

- (void)setSkyEquivalentVersion:(id *)a3
{
  __int128 v3 = *(_OWORD *)&a3->var0;
  self->_skyEquivalentVersion.patchVersion = a3->var2;
  *(_OWORD *)&self->_skyEquivalentVersion.majorVersion = v3;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)sydneyEquivalentVersion
{
  *($A44FF20282FB96BA82CF1B0FF6945C38 *)retstr = ($A44FF20282FB96BA82CF1B0FF6945C38)self[2];
  return self;
}

- (void)setSydneyEquivalentVersion:(id *)a3
{
  __int128 v3 = *(_OWORD *)&a3->var0;
  self->_sydneyEquivalentVersion.patchVersion = a3->var2;
  *(_OWORD *)&self->_sydneyEquivalentVersion.majorVersion = v3;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)lastMigrationVersion
{
  *($A44FF20282FB96BA82CF1B0FF6945C38 *)retstr = ($A44FF20282FB96BA82CF1B0FF6945C38)self[3];
  return self;
}

- (void)setLastMigrationVersion:(id *)a3
{
  __int128 v3 = *(_OWORD *)&a3->var0;
  self->_lastMigrationVersion.patchVersion = a3->var2;
  *(_OWORD *)&self->_lastMigrationVersion.majorVersion = v3;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)currentOSVersion
{
  *($A44FF20282FB96BA82CF1B0FF6945C38 *)retstr = ($A44FF20282FB96BA82CF1B0FF6945C38)self[4];
  return self;
}

- (void)setCurrentOSVersion:(id *)a3
{
  __int128 v3 = *(_OWORD *)&a3->var0;
  self->_currentOSVersion.patchVersion = a3->var2;
  *(_OWORD *)&self->_currentOSVersion.majorVersion = v3;
}

@end