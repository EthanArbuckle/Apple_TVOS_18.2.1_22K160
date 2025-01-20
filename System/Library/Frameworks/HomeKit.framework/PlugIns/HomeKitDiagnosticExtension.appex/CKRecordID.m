@interface CKRecordID
- (NSString)hmd_canonicalStringRepresentation;
- (id)hmd_initWithCanonicalStringRepresentation:(id)a3;
@end

@implementation CKRecordID

- (id)hmd_initWithCanonicalStringRepresentation:(id)a3
{
  id v3 = a3;
  if (qword_100032C60 != -1) {
    dispatch_once(&qword_100032C60, &stru_100028830);
  }
  id v4 = (id)qword_100032C68;
  v5 = -[NSScanner initWithString:](objc_alloc(&OBJC_CLASS___NSScanner), "initWithString:", v3);
  -[NSScanner setCharactersToBeSkipped:](v5, "setCharactersToBeSkipped:", 0LL);
  id v23 = 0LL;
  unsigned int v6 = -[NSScanner scanCharactersFromSet:intoString:](v5, "scanCharactersFromSet:intoString:", v4, &v23);
  id v7 = v23;
  v8 = v7;
  if (!v6)
  {
    v13 = 0LL;
    v9 = v7;
LABEL_17:
    v17 = 0LL;
    v19 = 0LL;
    goto LABEL_21;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByRemovingPercentEncoding]);

  if (!v9 || ![v9 length])
  {
    v13 = 0LL;
    goto LABEL_19;
  }

  if (!-[NSScanner scanString:intoString:](v5, "scanString:intoString:", @"/", 0LL))
  {
    v13 = 0LL;
    goto LABEL_17;
  }

  id v22 = 0LL;
  unsigned int v10 = -[NSScanner scanCharactersFromSet:intoString:](v5, "scanCharactersFromSet:intoString:", v4, &v22);
  id v11 = v22;
  v12 = v11;
  if (!v10)
  {
    v17 = 0LL;
    v13 = v11;
    goto LABEL_20;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue([v11 stringByRemovingPercentEncoding]);

  if (!v13
    || ![v13 length]
    || !-[NSScanner scanString:intoString:](v5, "scanString:intoString:", @"/", 0LL))
  {
LABEL_19:
    v17 = 0LL;
LABEL_20:
    v19 = 0LL;
    goto LABEL_21;
  }

  id v21 = 0LL;
  unsigned int v14 = -[NSScanner scanCharactersFromSet:intoString:](v5, "scanCharactersFromSet:intoString:", v4, &v21);
  id v15 = v21;
  v16 = v15;
  if (!v14)
  {
    v19 = 0LL;
    v17 = v15;
    goto LABEL_21;
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue([v15 stringByRemovingPercentEncoding]);

  if (!v17 || ![v17 length] || !-[NSScanner isAtEnd](v5, "isAtEnd")) {
    goto LABEL_20;
  }
  v18 = -[CKRecordZoneID initWithZoneName:ownerName:]( objc_alloc(&OBJC_CLASS___CKRecordZoneID),  "initWithZoneName:ownerName:",  v13,  v9);
  v19 = -[CKRecordID initWithRecordName:zoneID:]( objc_alloc(&OBJC_CLASS___CKRecordID),  "initWithRecordName:zoneID:",  v17,  v18);

LABEL_21:
  return v19;
}

- (NSString)hmd_canonicalStringRepresentation
{
  id v3 = sub_10000895C();
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordID zoneID](self, "zoneID"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 ownerName]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAddingPercentEncodingWithAllowedCharacters:v4]);

  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 zoneName]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByAddingPercentEncodingWithAllowedCharacters:v4]);

  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordID recordName](self, "recordName"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 stringByAddingPercentEncodingWithAllowedCharacters:v4]);

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@/%@",  v7,  v9,  v11));
  return (NSString *)v12;
}

@end