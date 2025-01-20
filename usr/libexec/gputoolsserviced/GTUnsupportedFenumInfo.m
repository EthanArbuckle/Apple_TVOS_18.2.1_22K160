@interface GTUnsupportedFenumInfo
+ (BOOL)supportsSecureCoding;
- (GTUnsupportedFenumInfo)initWithCoder:(id)a3;
- (GTUnsupportedFenumInfo)initWithFenum:(id)a3 category:(id)a4 customMessage:(id)a5 customRecoverySuggestion:(id)a6;
- (NSString)category;
- (NSString)customMessage;
- (NSString)customRecoverySuggestion;
- (NSString)fenum;
- (id)asError;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GTUnsupportedFenumInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTUnsupportedFenumInfo)initWithFenum:(id)a3 category:(id)a4 customMessage:(id)a5 customRecoverySuggestion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___GTUnsupportedFenumInfo;
  v15 = -[GTUnsupportedFenumInfo init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_fenum, a3);
    objc_storeStrong((id *)&v16->_category, a4);
    objc_storeStrong((id *)&v16->_customMessage, a5);
    objc_storeStrong((id *)&v16->_customRecoverySuggestion, a6);
  }

  return v16;
}

- (GTUnsupportedFenumInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___GTUnsupportedFenumInfo;
  v5 = -[GTUnsupportedFenumInfo init](&v19, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"fenum"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    fenum = v5->_fenum;
    v5->_fenum = (NSString *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"category"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    category = v5->_category;
    v5->_category = (NSString *)v10;

    id v12 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"customMessage"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    customMessage = v5->_customMessage;
    v5->_customMessage = (NSString *)v13;

    id v15 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"customRecoverySuggestion"];
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    customRecoverySuggestion = v5->_customRecoverySuggestion;
    v5->_customRecoverySuggestion = (NSString *)v16;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  fenum = self->_fenum;
  id v5 = a3;
  [v5 encodeObject:fenum forKey:@"fenum"];
  [v5 encodeObject:self->_category forKey:@"category"];
  [v5 encodeObject:self->_customMessage forKey:@"customMessage"];
  [v5 encodeObject:self->_customRecoverySuggestion forKey:@"customRecoverySuggestion"];
}

- (id)asError
{
  if (-[NSString isEqualToString:](self->_fenum, "isEqualToString:", &stru_100031028)) {
    fenum = 0LL;
  }
  else {
    fenum = self->_fenum;
  }
  id v4 = PrettifyFenumString(fenum, 0, 1);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (-[NSString isEqualToString:](self->_category, "isEqualToString:", &stru_100031028)) {
    category = 0LL;
  }
  else {
    category = self->_category;
  }
  uint64_t v7 = category;
  if (-[NSString isEqualToString:](self->_customMessage, "isEqualToString:", &stru_100031028)) {
    customMessage = 0LL;
  }
  else {
    customMessage = self->_customMessage;
  }
  id v9 = customMessage;
  if (-[NSString isEqualToString:](self->_customRecoverySuggestion, "isEqualToString:", &stru_100031028)) {
    customRecoverySuggestion = 0LL;
  }
  else {
    customRecoverySuggestion = self->_customRecoverySuggestion;
  }
  id v11 = customRecoverySuggestion;
  id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v13 = v12;
  if (v7)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Capturing %@ is not supported.",  v7));
    -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v14, NSLocalizedDescriptionKey);

    if (!v5) {
      goto LABEL_19;
    }
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unsupported method: %@",  v5));
    NSErrorUserInfoKey v16 = NSLocalizedFailureReasonErrorKey;
  }

  else
  {
    if (!v5)
    {
      -[NSMutableDictionary setObject:forKey:]( v12,  "setObject:forKey:",  @"Capturing disabled. Unsupported API usage.",  NSLocalizedDescriptionKey);
      if (v9) {
        goto LABEL_20;
      }
      goto LABEL_24;
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Capturing %@ is not supported.",  v5));
    NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
  }

  -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v15, v16);

LABEL_19:
  if (v9)
  {
LABEL_20:
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v13, "objectForKey:", NSLocalizedFailureReasonErrorKey));
    objc_super v18 = v17;
    if (v17) {
      objc_super v19 = (NSString *)objc_claimAutoreleasedReturnValue([v17 stringByAppendingFormat:@"\n\n%@", v9]);
    }
    else {
      objc_super v19 = v9;
    }
    v20 = v19;
    -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v19, NSLocalizedFailureReasonErrorKey);
  }

- (NSString)fenum
{
  return self->_fenum;
}

- (NSString)category
{
  return self->_category;
}

- (NSString)customMessage
{
  return self->_customMessage;
}

- (NSString)customRecoverySuggestion
{
  return self->_customRecoverySuggestion;
}

- (void).cxx_destruct
{
}

@end