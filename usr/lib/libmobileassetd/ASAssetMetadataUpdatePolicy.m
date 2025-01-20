@interface ASAssetMetadataUpdatePolicy
+ (id)policy;
- (char)trainName;
- (double)automaticMetadataUpdateIntervalForAssetType:(id)a3;
- (double)defaultNetworkTimeout;
- (id)_stringPreferenceValueForKey:(id)a3;
- (id)checkPreferencesForOverride:(id)a3;
- (id)getSystemAppURL:(id)a3;
- (id)serverURLForAssetType:(id)a3;
- (void)getDelay:(double *)a3 andGracePeriod:(double *)a4 forUpdateError:(id)a5;
- (void)getDelay:(double *)a3 andGracePeriod:(double *)a4 forUpdateInterval:(double)a5;
@end

@implementation ASAssetMetadataUpdatePolicy

+ (id)policy
{
  if (policy_once != -1) {
    dispatch_once(&policy_once, &__block_literal_global_29);
  }
  return (id)policy_policy;
}

- (id)serverURLForAssetType:(id)a3
{
  id v4 = a3;
  int IsInternalAllowed = _MAPreferencesIsInternalAllowed();
  unsigned int v6 = [v4 isEqualToString:@"com.apple.MobileAsset.SystemApp"];
  if (!IsInternalAllowed)
  {
    if (v6)
    {
      v7 = @"https://mesu.apple.com/systemassets/";
      goto LABEL_6;
    }

    goto LABEL_11;
  }

  if (!v6)
  {
    v9 = -[ASAssetMetadataUpdatePolicy trainName](self, "trainName");
    if (v9)
    {
      v14 = v9;
      if (MGGetSInt32Answer(@"DeviceClassNumber", 0xFFFFFFFFLL) == 7) {
        v15 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"https://basejumper.apple.com/livability/audio/%s/",  v14);
      }
      else {
        v15 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"https://basejumper.apple.com/livability/%s/",  v14);
      }
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue(v15);
      if (!v4)
      {
LABEL_21:
        v17 = v16;
LABEL_22:
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v17));

        goto LABEL_23;
      }

- (char)trainName
{
  if (trainName_onceToken != -1) {
    dispatch_once(&trainName_onceToken, &__block_literal_global_609);
  }
  return (char *)trainName_trainName;
}

- (id)checkPreferencesForOverride:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  @"MobileAssetServerURL",  v4));
  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[ASAssetMetadataUpdatePolicy _stringPreferenceValueForKey:](self, "_stringPreferenceValueForKey:", v5));
  if (v6)
  {
    v7 = (void *)v6;
    v8 = v5;
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"default-%@-%@",  @"MobileAssetServerURL",  v4));

    uint64_t v9 = objc_claimAutoreleasedReturnValue(-[ASAssetMetadataUpdatePolicy _stringPreferenceValueForKey:](self, "_stringPreferenceValueForKey:", v8));
    if (!v9) {
      uint64_t v9 = objc_claimAutoreleasedReturnValue( -[ASAssetMetadataUpdatePolicy _stringPreferenceValueForKey:]( self,  "_stringPreferenceValueForKey:",  @"MobileAssetServerURL"));
    }
    v7 = (void *)v9;
  }

  return v7;
}

- (id)_stringPreferenceValueForKey:(id)a3
{
  id v3 = a3;
  id v4 = _MAPreferencesCopyValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v5)
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0)
    {
      v7 = (objc_class *)objc_opt_class(v5);
      v8 = NSStringFromClass(v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v8);
      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ASAssetMetadataUpdatePolicy _stringPreferenceValueForKey:]",  @"Ignoring preference; key %@ has unexpected class: %@ value: '%@'",
        v9,
        v10,
        v11,
        v12,
        (uint64_t)v3);

      v5 = 0LL;
    }
  }

  return v5;
}

void __37__ASAssetMetadataUpdatePolicy_policy__block_invoke(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___ASAssetMetadataUpdatePolicy);
  v2 = (void *)policy_policy;
  policy_policy = (uint64_t)v1;
}

- (void)getDelay:(double *)a3 andGracePeriod:(double *)a4 forUpdateInterval:(double)a5
{
  double v5 = fmax(a5 + 86400.0, 43200.0);
  double v6 = fmax(a5, 0.0);
  BOOL v7 = a5 < 0.0;
  double v8 = 259200.0;
  if (v7) {
    double v8 = v5;
  }
  *a3 = v6;
  *a4 = v8;
}

- (void)getDelay:(double *)a3 andGracePeriod:(double *)a4 forUpdateError:(id)a5
{
  *a3 = 86400.0;
  *a4 = 86400.0;
}

void __40__ASAssetMetadataUpdatePolicy_trainName__block_invoke(id a1)
{
  id DownloadManager = getDownloadManager();
  v2 = (void *)objc_claimAutoreleasedReturnValue(DownloadManager);
  id v22 = (id)objc_claimAutoreleasedReturnValue([v2 trainName]);

  if (!v22
    || (uint64_t v3 = objc_opt_class(v22), (objc_opt_isKindOfClass(v22, v3) & 1) == 0)
    || ![v22 length]
    || (_MobileAssetLog( 0LL,  6,  (uint64_t)"-[ASAssetMetadataUpdatePolicy trainName]_block_invoke",  @"DownloadManager returned a valid train name",  v4,  v5,  v6,  v7,  v21),  double v8 = malloc(0x200uLL),  (trainName_trainName = (uint64_t)v8) == 0))
  {
    v14 = "$SIDEBUILD_PARENT_TRAIN";
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s",  "$SIDEBUILD_PARENT_TRAIN"));
    if ([v15 isEqualToString:&stru_355768])
    {
    }

    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s",  "$SIDEBUILD_PARENT_TRAIN"));
      unsigned __int8 v17 = [v16 isEqualToString:@"$SIDEBUILD_PARENT_TRAIN"];

      if ((v17 & 1) == 0) {
        goto LABEL_12;
      }
    }

    v14 = "SapphireC";
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%s", "SapphireC"));
    if ([v18 isEqualToString:&stru_355768])
    {

LABEL_13:
      uint64_t v13 = @"Using train name(%s) from legacy method";
      goto LABEL_14;
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%s", "SapphireC"));
    unsigned __int8 v20 = [v19 isEqualToString:@"$RC_RELEASE"];

    if ((v20 & 1) != 0) {
      goto LABEL_13;
    }
LABEL_12:
    trainName_trainName = (uint64_t)v14;
    goto LABEL_13;
  }

  v8[30] = 0u;
  v8[31] = 0u;
  v8[28] = 0u;
  v8[29] = 0u;
  v8[26] = 0u;
  v8[27] = 0u;
  v8[24] = 0u;
  v8[25] = 0u;
  v8[22] = 0u;
  v8[23] = 0u;
  v8[20] = 0u;
  v8[21] = 0u;
  v8[18] = 0u;
  v8[19] = 0u;
  v8[16] = 0u;
  v8[17] = 0u;
  v8[14] = 0u;
  v8[15] = 0u;
  v8[12] = 0u;
  v8[13] = 0u;
  v8[10] = 0u;
  v8[11] = 0u;
  v8[8] = 0u;
  v8[9] = 0u;
  v8[6] = 0u;
  v8[7] = 0u;
  v8[4] = 0u;
  v8[5] = 0u;
  v8[2] = 0u;
  v8[3] = 0u;
  _OWORD *v8 = 0u;
  v8[1] = 0u;
  [v22 getCString:v8 maxLength:511 encoding:4];
  uint64_t v13 = @"Using train name(%s) from download manager";
LABEL_14:
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ASAssetMetadataUpdatePolicy trainName]_block_invoke",  v13,  v9,  v10,  v11,  v12,  trainName_trainName);
}

- (id)getSystemAppURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  @"MobileAssetServerURL",  @"com.apple.MobileAsset.SystemApp"));
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[ASAssetMetadataUpdatePolicy _stringPreferenceValueForKey:](self, "_stringPreferenceValueForKey:", v5));
  if (!v6) {
    id v6 = v4;
  }
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v6));

  return v7;
}

- (double)defaultNetworkTimeout
{
  return 30.0;
}

- (double)automaticMetadataUpdateIntervalForAssetType:(id)a3
{
  return 432000.0;
}

@end