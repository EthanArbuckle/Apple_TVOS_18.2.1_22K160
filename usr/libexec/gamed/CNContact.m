@interface CNContact
+ (id)_gkContactFromCacheObject:(id)a3;
@end

@implementation CNContact

+ (id)_gkContactFromCacheObject:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___CNMutableContact);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 givenName]);
  -[CNMutableContact setGivenName:](v4, "setGivenName:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 familyName]);
  -[CNMutableContact setFamilyName:](v4, "setFamilyName:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 namePrefix]);
  -[CNMutableContact setNamePrefix:](v4, "setNamePrefix:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue([v3 nameSuffix]);
  -[CNMutableContact setNameSuffix:](v4, "setNameSuffix:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue([v3 nickname]);
  -[CNMutableContact setNickname:](v4, "setNickname:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue([v3 handle]);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[IDSURI URIWithPrefixedURI:](&OBJC_CLASS___IDSURI, "URIWithPrefixedURI:", v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 unprefixedURI]);
  id v13 = [v11 IDSIDType];
  if (v13 == (id)1)
  {
    v15 = -[CNLabeledValue initWithLabel:value:]( objc_alloc(&OBJC_CLASS___CNLabeledValue),  "initWithLabel:value:",  0LL,  v12);
    v22 = v15;
    v16 = (CNLabeledValue *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v22,  1LL));
    -[CNMutableContact setEmailAddresses:](v4, "setEmailAddresses:", v16);
    goto LABEL_5;
  }

  uint64_t v14 = (uint64_t)v13;
  if (!v13)
  {
    v15 = -[CNPhoneNumber initWithStringValue:](objc_alloc(&OBJC_CLASS___CNPhoneNumber), "initWithStringValue:", v12);
    v16 = -[CNLabeledValue initWithLabel:value:]( objc_alloc(&OBJC_CLASS___CNLabeledValue),  "initWithLabel:value:",  0LL,  v15);
    v23 = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v23, 1LL));
    -[CNMutableContact setPhoneNumbers:](v4, "setPhoneNumbers:", v17);

LABEL_5:
    goto LABEL_10;
  }

  if (!os_log_GKGeneral) {
    id v18 = (id)GKOSLoggers(v13);
  }
  v19 = (os_log_s *)os_log_GKError;
  if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
    sub_10010FAF0(v14, v19);
  }
LABEL_10:
  id v20 = -[CNMutableContact copy](v4, "copy");

  return v20;
}

@end