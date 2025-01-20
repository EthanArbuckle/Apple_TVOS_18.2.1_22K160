@interface SHLLibraryTrack
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualTrack:(id)a3;
- (BOOL)validProviderIdentifier;
- (BOOL)validProviderName;
- (CLLocation)location;
- (NSDate)date;
- (NSMutableSet)labelSet;
- (NSSet)labels;
- (NSString)associatedGroupIdentifier;
- (NSString)identifier;
- (NSString)providerIdentifier;
- (NSString)providerName;
- (NSString)recognitionIdentifier;
- (NSString)subtitle;
- (NSString)title;
- (SHLLibraryItemMetadata)metadata;
- (SHLLibraryTrack)initWithCoder:(id)a3;
- (SHLLibraryTrack)initWithIdentifier:(id)a3;
- (SHLLibraryTrack)initWithIdentifier:(id)a3 metadata:(id)a4;
- (SHLLibraryTrack)initWithLibraryTrack:(id)a3;
- (SHLLibraryTrack)initWithRecognitionIdentifier:(id)a3 shazamKey:(id)a4;
- (SHLLibraryTrack)initWithRecognitionIdentifier:(id)a3 shazamKey:(id)a4 metadata:(id)a5;
- (SHLLibraryTrackCompoundIdentifier)compoundIdentifier;
- (SHLShazamKey)shazamKey;
- (id)_initWithIdentifier:(id)a3 metadata:(id)a4 labels:(id)a5;
- (id)_initWithRecognitionIdentifier:(id)a3 shazamKey:(id)a4 metadata:(id)a5 labels:(id)a6;
- (id)bundleIdentifier;
- (id)bundleName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)platformLabel;
- (unint64_t)hash;
- (void)addLabel:(id)a3;
- (void)addPlatformLabel;
- (void)commonInitWithIdentifier:(id)a3 metadata:(id)a4 labels:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)removeLabel:(id)a3;
- (void)setAssociatedGroupIdentifier:(id)a3;
- (void)setDate:(id)a3;
- (void)setLabelSet:(id)a3;
- (void)setLocation:(id)a3;
- (void)setProviderIdentifier:(id)a3;
- (void)setProviderName:(id)a3;
- (void)setRecognitionIdentifier:(id)a3;
- (void)setShazamKey:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SHLLibraryTrack

- (SHLLibraryTrack)initWithIdentifier:(id)a3
{
  return (SHLLibraryTrack *)-[SHLLibraryTrack _initWithIdentifier:metadata:labels:]( self,  "_initWithIdentifier:metadata:labels:",  a3,  0LL,  &__NSArray0__struct);
}

- (SHLLibraryTrack)initWithIdentifier:(id)a3 metadata:(id)a4
{
  return (SHLLibraryTrack *)-[SHLLibraryTrack _initWithIdentifier:metadata:labels:]( self,  "_initWithIdentifier:metadata:labels:",  a3,  a4,  &__NSArray0__struct);
}

- (id)_initWithIdentifier:(id)a3 metadata:(id)a4 labels:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___SHLLibraryTrack;
  v11 = -[SHLLibraryTrack init](&v14, "init");
  v12 = v11;
  if (v11) {
    -[SHLLibraryTrack commonInitWithIdentifier:metadata:labels:]( v11,  "commonInitWithIdentifier:metadata:labels:",  v8,  v9,  v10);
  }

  return v12;
}

- (void)commonInitWithIdentifier:(id)a3 metadata:(id)a4 labels:(id)a5
{
  id v8 = (NSString *)a3;
  id v9 = (SHLLibraryItemMetadata *)a4;
  id v27 = a5;
  if (-[SHLLibraryTrack validProviderIdentifier](self, "validProviderIdentifier"))
  {
    if (-[SHLLibraryTrack validProviderName](self, "validProviderName"))
    {
      identifier = self->_identifier;
      self->_identifier = v8;
      v11 = v8;

      metadata = self->_metadata;
      self->_metadata = v9;
      v13 = v9;

      objc_super v14 = (NSString *)objc_claimAutoreleasedReturnValue(-[SHLLibraryTrack bundleIdentifier](self, "bundleIdentifier"));
      providerIdentifier = self->_providerIdentifier;
      self->_providerIdentifier = v14;

      v16 = (NSString *)objc_claimAutoreleasedReturnValue(-[SHLLibraryTrack bundleName](self, "bundleName"));
      providerName = self->_providerName;
      self->_providerName = v16;

      v18 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      date = self->_date;
      self->_date = v18;

      v20 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v27));
      labelSet = self->_labelSet;
      self->_labelSet = v20;

      -[SHLLibraryTrack addPlatformLabel](self, "addPlatformLabel");
      return;
    }

    NSExceptionName v22 = NSInvalidArgumentException;
    v23 = @"You must have a valid CFBundleName key set in the bundle’s information property list.";
  }

  else
  {
    NSExceptionName v22 = NSInvalidArgumentException;
    v23 = @"You must have a valid CFBundleIdentifier key set in the bundle’s information property list.";
  }

  id v24 = (id)objc_claimAutoreleasedReturnValue( +[NSException shl_exceptionWithName:reason:]( &OBJC_CLASS___NSException,  "shl_exceptionWithName:reason:",  v22,  v23));
  objc_exception_throw(v24);
  -[SHLLibraryTrack bundleIdentifier](v25, v26);
}

- (id)bundleIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 bundleIdentifier]);

  return v3;
}

- (id)bundleName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForInfoDictionaryKey:@"CFBundleName"]);

  return v3;
}

- (NSSet)labels
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryTrack labelSet](self, "labelSet"));
  id v3 = [v2 copy];

  return (NSSet *)v3;
}

- (void)addLabel:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryTrack labelSet](self, "labelSet"));
  [v5 containsObject:v4];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SHLLibraryTrack labelSet](self, "labelSet"));
  [v6 addObject:v4];
}

- (void)removeLabel:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryTrack labelSet](self, "labelSet"));
  [v5 containsObject:v4];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SHLLibraryTrack labelSet](self, "labelSet"));
  [v6 removeObject:v4];
}

- (SHLLibraryTrack)initWithCoder:(id)a3
{
  id v4 = a3;
  v69.receiver = self;
  v69.super_class = (Class)&OBJC_CLASS___SHLLibraryTrack;
  id v6 = -[SHLLibraryTrack init](&v69, "init");
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSData, v5),  @"SHLLibraryTrackMetadata");
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if (v9)
    {
      id v10 = -[SHLLibraryItemMetadata initWithEncodedSystemData:]( objc_alloc(&OBJC_CLASS___SHLLibraryItemMetadata),  "initWithEncodedSystemData:",  v9);
      metadata = v6->_metadata;
      v6->_metadata = v10;
    }

    id v12 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(SHLLibraryTrackCompoundIdentifier, v8),  @"SHLLibraryTrackCompoundIdentifierKey");
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    compoundIdentifier = v6->_compoundIdentifier;
    v6->_compoundIdentifier = (SHLLibraryTrackCompoundIdentifier *)v13;

    id v16 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v15),  @"SHLLibraryTrackShazamKey");
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    if (v17) {
      v18 = -[SHLShazamKey initWithKey:](objc_alloc(&OBJC_CLASS___SHLShazamKey), "initWithKey:", v17);
    }
    else {
      v18 = (SHLShazamKey *)objc_claimAutoreleasedReturnValue(-[SHLLibraryTrackCompoundIdentifier shazamKey](v6->_compoundIdentifier, "shazamKey"));
    }
    shazamKey = v6->_shazamKey;
    v6->_shazamKey = v18;

    id v21 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v20),  @"SHLLibraryTrackRecognitionIdentifier");
    NSExceptionName v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = v22;
    if (v22) {
      id v24 = v22;
    }
    else {
      id v24 = (NSString *)objc_claimAutoreleasedReturnValue( -[SHLLibraryTrackCompoundIdentifier recognitionIdentifier]( v6->_compoundIdentifier,  "recognitionIdentifier"));
    }
    recognitionIdentifier = v6->_recognitionIdentifier;
    v6->_recognitionIdentifier = v24;

    id v27 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v26),  @"SHLLibraryTrackIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v29 = v28;
    if (v28) {
      v30 = v28;
    }
    else {
      v30 = (NSString *)objc_claimAutoreleasedReturnValue( -[SHLLibraryTrackCompoundIdentifier libraryItemIdentifier]( v6->_compoundIdentifier,  "libraryItemIdentifier"));
    }
    identifier = v6->_identifier;
    v6->_identifier = v30;

    id v33 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v32),  @"SHLLibraryTrackProviderIdentifier");
    uint64_t v34 = objc_claimAutoreleasedReturnValue(v33);
    providerIdentifier = v6->_providerIdentifier;
    v6->_providerIdentifier = (NSString *)v34;

    id v37 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v36),  @"SHLLibraryTrackProviderName");
    uint64_t v38 = objc_claimAutoreleasedReturnValue(v37);
    providerName = v6->_providerName;
    v6->_providerName = (NSString *)v38;

    id v41 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSDate, v40),  @"SHLLibraryTrackDate");
    uint64_t v42 = objc_claimAutoreleasedReturnValue(v41);
    date = v6->_date;
    v6->_date = (NSDate *)v42;

    id v45 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v44),  @"SHLLibraryTrackTitle");
    uint64_t v46 = objc_claimAutoreleasedReturnValue(v45);
    title = v6->_title;
    v6->_title = (NSString *)v46;

    id v49 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v48),  @"SHLLibraryTrackSubtitle");
    uint64_t v50 = objc_claimAutoreleasedReturnValue(v49);
    subtitle = v6->_subtitle;
    v6->_subtitle = (NSString *)v50;

    id v53 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(CLLocation, v52),  @"SHLLibraryTrackLocation");
    uint64_t v54 = objc_claimAutoreleasedReturnValue(v53);
    location = v6->_location;
    v6->_location = (CLLocation *)v54;

    id v57 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v56),  @"SHLLibraryTrackAssociatedGroupIdentifier");
    uint64_t v58 = objc_claimAutoreleasedReturnValue(v57);
    associatedGroupIdentifier = v6->_associatedGroupIdentifier;
    v6->_associatedGroupIdentifier = (NSString *)v58;

    uint64_t v61 = objc_opt_class(&OBJC_CLASS___NSSet, v60);
    v63 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v61,  objc_opt_class(&OBJC_CLASS___SHLLibraryLabel, v62),  0LL);
    v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
    v65 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v64 forKey:@"SHLLibraryTrackLibrarySet"]);
    v66 = (NSMutableSet *)[v65 mutableCopy];
    labelSet = v6->_labelSet;
    v6->_labelSet = v66;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v8 = a3;
  [v8 encodeObject:identifier forKey:@"SHLLibraryTrackIdentifier"];
  [v8 encodeObject:self->_recognitionIdentifier forKey:@"SHLLibraryTrackRecognitionIdentifier"];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHLShazamKey validatedKey](self->_shazamKey, "validatedKey"));
  [v8 encodeObject:v5 forKey:@"SHLLibraryTrackShazamKey"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryItemMetadata encodedSystemData](self->_metadata, "encodedSystemData"));
  [v8 encodeObject:v6 forKey:@"SHLLibraryTrackMetadata"];

  [v8 encodeObject:self->_providerIdentifier forKey:@"SHLLibraryTrackProviderIdentifier"];
  [v8 encodeObject:self->_providerName forKey:@"SHLLibraryTrackProviderName"];
  [v8 encodeObject:self->_date forKey:@"SHLLibraryTrackDate"];
  [v8 encodeObject:self->_title forKey:@"SHLLibraryTrackTitle"];
  [v8 encodeObject:self->_subtitle forKey:@"SHLLibraryTrackSubtitle"];
  [v8 encodeObject:self->_location forKey:@"SHLLibraryTrackLocation"];
  [v8 encodeObject:self->_associatedGroupIdentifier forKey:@"SHLLibraryTrackAssociatedGroupIdentifier"];
  id v7 = -[NSMutableSet copy](self->_labelSet, "copy");
  [v8 encodeObject:v7 forKey:@"SHLLibraryTrackLibrarySet"];

  [v8 encodeObject:self->_compoundIdentifier forKey:@"SHLLibraryTrackCompoundIdentifierKey"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SHLLibraryTrack)initWithLibraryTrack:(id)a3
{
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)&OBJC_CLASS___SHLLibraryTrack;
  uint64_t v5 = -[SHLLibraryTrack init](&v46, "init");
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    id v7 = (NSString *)[v6 copy];
    identifier = v5->_identifier;
    v5->_identifier = v7;

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 recognitionIdentifier]);
    id v10 = (NSString *)[v9 copy];
    recognitionIdentifier = v5->_recognitionIdentifier;
    v5->_recognitionIdentifier = v10;

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 shazamKey]);
    uint64_t v13 = (SHLShazamKey *)[v12 copy];
    shazamKey = v5->_shazamKey;
    v5->_shazamKey = v13;

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v4 metadata]);
    id v16 = (SHLLibraryItemMetadata *)[v15 copy];
    metadata = v5->_metadata;
    v5->_metadata = v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue([v4 providerIdentifier]);
    v19 = (NSString *)[v18 copy];
    providerIdentifier = v5->_providerIdentifier;
    v5->_providerIdentifier = v19;

    id v21 = (void *)objc_claimAutoreleasedReturnValue([v4 providerName]);
    NSExceptionName v22 = (NSString *)[v21 copy];
    providerName = v5->_providerName;
    v5->_providerName = v22;

    id v24 = (void *)objc_claimAutoreleasedReturnValue([v4 date]);
    v25 = (NSDate *)[v24 copy];
    date = v5->_date;
    v5->_date = v25;

    id v27 = (void *)objc_claimAutoreleasedReturnValue([v4 title]);
    v28 = (NSString *)[v27 copy];
    title = v5->_title;
    v5->_title = v28;

    v30 = (void *)objc_claimAutoreleasedReturnValue([v4 subtitle]);
    v31 = (NSString *)[v30 copy];
    subtitle = v5->_subtitle;
    v5->_subtitle = v31;

    id v33 = (void *)objc_claimAutoreleasedReturnValue([v4 location]);
    uint64_t v34 = (CLLocation *)[v33 copy];
    location = v5->_location;
    v5->_location = v34;

    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v4 associatedGroupIdentifier]);
    id v37 = (NSString *)[v36 copy];
    associatedGroupIdentifier = v5->_associatedGroupIdentifier;
    v5->_associatedGroupIdentifier = v37;

    v39 = (void *)objc_claimAutoreleasedReturnValue([v4 labelSet]);
    uint64_t v40 = (NSMutableSet *)[v39 copy];
    labelSet = v5->_labelSet;
    v5->_labelSet = v40;

    uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v4 compoundIdentifier]);
    v43 = (SHLLibraryTrackCompoundIdentifier *)[v42 copy];
    compoundIdentifier = v5->_compoundIdentifier;
    v5->_compoundIdentifier = v43;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SHLLibraryTrack initWithLibraryTrack:]( +[SHLLibraryTrack allocWithZone:](&OBJC_CLASS___SHLLibraryTrack, "allocWithZone:", a3),  "initWithLibraryTrack:",  self);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[SHLLibraryTrack initWithLibraryTrack:]( +[SHLMutableLibraryTrack allocWithZone:](&OBJC_CLASS___SHLMutableLibraryTrack, "allocWithZone:", a3),  "initWithLibraryTrack:",  self);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (SHLLibraryTrack *)a3;
  if (self == v5)
  {
    BOOL v9 = 1;
  }

  else
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___SHLLibraryTrack, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0
      || (uint64_t v8 = objc_opt_class(&OBJC_CLASS___SHLMutableLibraryTrack, v7), (objc_opt_isKindOfClass(v5, v8) & 1) != 0))
    {
      BOOL v9 = -[SHLLibraryTrack isEqualTrack:](self, "isEqualTrack:", v5);
    }

    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (BOOL)isEqualTrack:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryTrack identifier](self, "identifier"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryTrack identifier](self, "identifier"));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)validProviderIdentifier
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryTrack bundleIdentifier](self, "bundleIdentifier"));
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryTrack bundleIdentifier](self, "bundleIdentifier"));
    BOOL v5 = [v4 length] != 0;
  }

  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)validProviderName
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryTrack bundleName](self, "bundleName"));
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryTrack bundleName](self, "bundleName"));
    BOOL v5 = [v4 length] != 0;
  }

  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)platformLabel
{
  v2 = objc_alloc(&OBJC_CLASS___SHLLibraryLabel);
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_tvos",  @"platform"));
  id v4 = -[SHLLibraryLabel initWithName:](v2, "initWithName:", v3);

  return v4;
}

- (void)addPlatformLabel
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryTrack labels](self, "labels", 0LL));
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
LABEL_3:
    uint64_t v7 = 0LL;
    while (1)
    {
      if (*(void *)v9 != v6) {
        objc_enumerationMutation(v3);
      }
      if (![*(id *)(*((void *)&v8 + 1) + 8 * v7) type]) {
        break;
      }
      if (v5 == (id)++v7)
      {
        id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }

  else
  {
LABEL_9:

    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryTrack platformLabel](self, "platformLabel"));
    -[SHLLibraryTrack addLabel:](self, "addLabel:", v3);
  }
}

- (SHLLibraryTrack)initWithRecognitionIdentifier:(id)a3 shazamKey:(id)a4
{
  return (SHLLibraryTrack *)-[SHLLibraryTrack _initWithRecognitionIdentifier:shazamKey:metadata:labels:]( self,  "_initWithRecognitionIdentifier:shazamKey:metadata:labels:",  a3,  a4,  0LL,  &__NSArray0__struct);
}

- (SHLLibraryTrack)initWithRecognitionIdentifier:(id)a3 shazamKey:(id)a4 metadata:(id)a5
{
  return (SHLLibraryTrack *)-[SHLLibraryTrack _initWithRecognitionIdentifier:shazamKey:metadata:labels:]( self,  "_initWithRecognitionIdentifier:shazamKey:metadata:labels:",  a3,  a4,  a5,  &__NSArray0__struct);
}

- (id)_initWithRecognitionIdentifier:(id)a3 shazamKey:(id)a4 metadata:(id)a5 labels:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v12)
  {
    uint64_t v15 = v14;
    v26.receiver = self;
    v26.super_class = (Class)&OBJC_CLASS___SHLLibraryTrack;
    id v16 = -[SHLLibraryTrack init](&v26, "init");
    if (!v16)
    {
LABEL_5:

      return v16;
    }

    v17 = -[SHLLibraryTrackCompoundIdentifier initWithRecognitionIdentifier:shazamKey:]( objc_alloc(&OBJC_CLASS___SHLLibraryTrackCompoundIdentifier),  "initWithRecognitionIdentifier:shazamKey:",  v11,  v12);
    compoundIdentifier = v16->_compoundIdentifier;
    v16->_compoundIdentifier = v17;

    if (-[SHLLibraryTrackCompoundIdentifier hasValidRecognitionIdentifier]( v16->_compoundIdentifier,  "hasValidRecognitionIdentifier"))
    {
      objc_storeStrong((id *)&v16->_recognitionIdentifier, a3);
      objc_storeStrong((id *)&v16->_shazamKey, a4);
      v19 = (void *)objc_claimAutoreleasedReturnValue( -[SHLLibraryTrackCompoundIdentifier libraryItemIdentifier]( v16->_compoundIdentifier,  "libraryItemIdentifier"));
      -[SHLLibraryTrack commonInitWithIdentifier:metadata:labels:]( v16,  "commonInitWithIdentifier:metadata:labels:",  v19,  v13,  v15);

      goto LABEL_5;
    }
  }

  else
  {
    id v21 = (id)objc_claimAutoreleasedReturnValue( +[NSException shl_exceptionWithName:reason:]( &OBJC_CLASS___NSException,  "shl_exceptionWithName:reason:",  NSInvalidArgumentException,  @"You must have a valid Shazam key to create a library item."));
    objc_exception_throw(v21);
  }

  NSExceptionName v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ is not a valid recognition identifier.",  v11));
  id v23 = (id)objc_claimAutoreleasedReturnValue( +[NSException shl_exceptionWithName:reason:]( &OBJC_CLASS___NSException,  "shl_exceptionWithName:reason:",  NSInvalidArgumentException,  v22));

  objc_exception_throw(v23);
  return -[SHLLibraryTrack identifier](v24, v25);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (SHLLibraryItemMetadata)metadata
{
  return self->_metadata;
}

- (NSString)providerName
{
  return self->_providerName;
}

- (void)setProviderName:(id)a3
{
}

- (NSString)providerIdentifier
{
  return self->_providerIdentifier;
}

- (void)setProviderIdentifier:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (NSString)recognitionIdentifier
{
  return self->_recognitionIdentifier;
}

- (void)setRecognitionIdentifier:(id)a3
{
}

- (SHLShazamKey)shazamKey
{
  return self->_shazamKey;
}

- (void)setShazamKey:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (NSString)associatedGroupIdentifier
{
  return self->_associatedGroupIdentifier;
}

- (void)setAssociatedGroupIdentifier:(id)a3
{
}

- (SHLLibraryTrackCompoundIdentifier)compoundIdentifier
{
  return self->_compoundIdentifier;
}

- (NSMutableSet)labelSet
{
  return self->_labelSet;
}

- (void)setLabelSet:(id)a3
{
}

- (void).cxx_destruct
{
}

@end