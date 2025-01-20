@interface SHLLibraryTrackCompoundIdentifier
+ (BOOL)isTrackIdentifier:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)compoundIdentifierFromTrackIdentifier:(id)a3;
+ (id)identifierWithRecognitionIdentifier:(id)a3 shazamKey:(id)a4;
+ (id)recognitionIdentifierFromTrackIdentifier:(id)a3;
+ (id)shazamKeyFromTrackIdentifier:(id)a3;
- (BOOL)hasValidRecognitionIdentifier;
- (BOOL)isEqual:(id)a3;
- (NSString)libraryItemIdentifier;
- (NSString)recognitionIdentifier;
- (SHLLibraryTrackCompoundIdentifier)initWithCoder:(id)a3;
- (SHLLibraryTrackCompoundIdentifier)initWithRecognitionIdentifier:(id)a3 shazamKey:(id)a4;
- (SHLShazamKey)shazamKey;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SHLLibraryTrackCompoundIdentifier

+ (id)identifierWithRecognitionIdentifier:(id)a3 shazamKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithRecognitionIdentifier:v7 shazamKey:v6];

  return v8;
}

- (SHLLibraryTrackCompoundIdentifier)initWithRecognitionIdentifier:(id)a3 shazamKey:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7 && v8)
  {
    v18.receiver = self;
    v18.super_class = (Class)&OBJC_CLASS___SHLLibraryTrackCompoundIdentifier;
    v10 = -[SHLLibraryTrackCompoundIdentifier init](&v18, "init");
    v11 = v10;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_recognitionIdentifier, a3);
      objc_storeStrong((id *)&v11->_shazamKey, a4);
    }

    return v11;
  }

  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@ is not a valid recognition identifier and key",  v7,  v8));
    id v14 = (id)objc_claimAutoreleasedReturnValue( +[NSException shl_exceptionWithName:reason:]( &OBJC_CLASS___NSException,  "shl_exceptionWithName:reason:",  NSInvalidArgumentException,  v13));

    objc_exception_throw(v14);
    return (SHLLibraryTrackCompoundIdentifier *)+[SHLLibraryTrackCompoundIdentifier compoundIdentifierFromTrackIdentifier:]( v15,  v16,  v17);
  }

+ (id)compoundIdentifierFromTrackIdentifier:(id)a3
{
  id v4 = a3;
  if (+[SHLLibraryTrackCompoundIdentifier isTrackIdentifier:]( &OBJC_CLASS___SHLLibraryTrackCompoundIdentifier,  "isTrackIdentifier:",  v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[SHLLibraryTrackCompoundIdentifier recognitionIdentifierFromTrackIdentifier:]( &OBJC_CLASS___SHLLibraryTrackCompoundIdentifier,  "recognitionIdentifierFromTrackIdentifier:",  v4));
    uint64_t v6 = objc_claimAutoreleasedReturnValue( +[SHLLibraryTrackCompoundIdentifier shazamKeyFromTrackIdentifier:]( &OBJC_CLASS___SHLLibraryTrackCompoundIdentifier,  "shazamKeyFromTrackIdentifier:",  v4));
    id v7 = (void *)v6;
    if (v5) {
      BOOL v8 = v6 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8) {
      v9 = 0LL;
    }
    else {
      v9 = (void *)objc_claimAutoreleasedReturnValue([a1 identifierWithRecognitionIdentifier:v5 shazamKey:v6]);
    }
  }

  else
  {
    v9 = 0LL;
  }

  return v9;
}

+ (BOOL)isTrackIdentifier:(id)a3
{
  return [a3 containsString:@"_[T]_"];
}

+ (id)shazamKeyFromTrackIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = (char *)[v3 rangeOfString:@"_[T]_" options:4];
  if (v4 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0LL;
  }

  else
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringFromIndex:", &v4[(void)objc_msgSend(@"_[T]_", "length")]));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SHLShazamKey keyWithValue:](&OBJC_CLASS___SHLShazamKey, "keyWithValue:", v6));
  }

  return v5;
}

+ (id)recognitionIdentifierFromTrackIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = [v3 rangeOfString:@"_[T]_" options:4];
  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = 0LL;
  }

  else
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 substringToIndex:v4]);
    else {
      id v5 = 0LL;
    }
  }

  return v5;
}

- (NSString)libraryItemIdentifier
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryTrackCompoundIdentifier recognitionIdentifier](self, "recognitionIdentifier"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 precomposedStringWithCanonicalMapping]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryTrackCompoundIdentifier shazamKey](self, "shazamKey"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 validatedKey]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@%@",  v4,  @"_[T]_",  v6));

  return (NSString *)v7;
}

- (BOOL)hasValidRecognitionIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryTrackCompoundIdentifier recognitionIdentifier](self, "recognitionIdentifier"));
  BOOL v3 = [v2 length] != 0;

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  recognitionIdentifier = self->_recognitionIdentifier;
  id v5 = a3;
  [v5 encodeObject:recognitionIdentifier forKey:@"SHLLibraryTrackRecognitionIdentifierKey"];
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SHLShazamKey validatedKey](self->_shazamKey, "validatedKey"));
  [v5 encodeObject:v6 forKey:@"SHLLibraryTrackShazamKey"];
}

- (SHLLibraryTrackCompoundIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v5),  @"SHLLibraryTrackShazamKey");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  BOOL v8 = -[SHLShazamKey initWithKey:](objc_alloc(&OBJC_CLASS___SHLShazamKey), "initWithKey:", v7);
  id v10 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v9),  @"SHLLibraryTrackRecognitionIdentifierKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  v12 = -[SHLLibraryTrackCompoundIdentifier initWithRecognitionIdentifier:shazamKey:]( self,  "initWithRecognitionIdentifier:shazamKey:",  v11,  v8);
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryTrackCompoundIdentifier recognitionIdentifier](self, "recognitionIdentifier", a3));
  id v5 = [v4 copy];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryTrackCompoundIdentifier shazamKey](self, "shazamKey"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 validatedKey]);
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[SHLShazamKey keyWithValue:](&OBJC_CLASS___SHLShazamKey, "keyWithValue:", v7));

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[SHLLibraryTrackCompoundIdentifier identifierWithRecognitionIdentifier:shazamKey:]( &OBJC_CLASS___SHLLibraryTrackCompoundIdentifier,  "identifierWithRecognitionIdentifier:shazamKey:",  v5,  v8));
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    id v7 = v4;
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryTrackCompoundIdentifier recognitionIdentifier](self, "recognitionIdentifier"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 recognitionIdentifier]);
    if ([v8 isEqualToString:v9])
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryTrackCompoundIdentifier shazamKey](self, "shazamKey"));
      v11 = (void *)objc_claimAutoreleasedReturnValue([v10 validatedKey]);
      v12 = (void *)objc_claimAutoreleasedReturnValue([v7 shazamKey]);
      v13 = (void *)objc_claimAutoreleasedReturnValue([v12 validatedKey]);
      unsigned __int8 v14 = [v11 isEqualToString:v13];
    }

    else
    {
      unsigned __int8 v14 = 0;
    }
  }

  else
  {
    unsigned __int8 v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryTrackCompoundIdentifier recognitionIdentifier](self, "recognitionIdentifier"));
  unint64_t v4 = (unint64_t)[v3 hash];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryTrackCompoundIdentifier shazamKey](self, "shazamKey"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 validatedKey]);
  unint64_t v7 = (unint64_t)[v6 hash] ^ v4;

  return v7;
}

- (NSString)recognitionIdentifier
{
  return self->_recognitionIdentifier;
}

- (SHLShazamKey)shazamKey
{
  return self->_shazamKey;
}

- (void).cxx_destruct
{
}

@end