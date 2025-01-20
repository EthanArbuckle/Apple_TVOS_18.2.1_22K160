@interface SHLLibraryGroup
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualGroup:(id)a3;
- (BOOL)validIdentifier:(id)a3;
- (NSMutableArray)tracksToSave;
- (NSString)identifier;
- (SHLLibraryGroup)initWithCoder:(id)a3;
- (SHLLibraryGroup)initWithIdentifier:(id)a3;
- (SHLLibraryGroup)initWithIdentifier:(id)a3 metadata:(id)a4;
- (SHLLibraryGroup)initWithLibraryGroup:(id)a3;
- (SHLLibraryItemMetadata)metadata;
- (id)_initWithIdentifier:(id)a3 metadata:(id)a4 tracksToSave:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)commonInitWithIdentifier:(id)a3 metadata:(id)a4 tracksToSave:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)setTracksToSave:(id)a3;
@end

@implementation SHLLibraryGroup

- (SHLLibraryGroup)initWithIdentifier:(id)a3
{
  return (SHLLibraryGroup *)-[SHLLibraryGroup _initWithIdentifier:metadata:tracksToSave:]( self,  "_initWithIdentifier:metadata:tracksToSave:",  a3,  0LL,  &__NSArray0__struct);
}

- (SHLLibraryGroup)initWithIdentifier:(id)a3 metadata:(id)a4
{
  return (SHLLibraryGroup *)-[SHLLibraryGroup _initWithIdentifier:metadata:tracksToSave:]( self,  "_initWithIdentifier:metadata:tracksToSave:",  a3,  a4,  &__NSArray0__struct);
}

- (id)_initWithIdentifier:(id)a3 metadata:(id)a4 tracksToSave:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___SHLLibraryGroup;
  v11 = -[SHLLibraryGroup init](&v14, "init");
  v12 = v11;
  if (v11) {
    -[SHLLibraryGroup commonInitWithIdentifier:metadata:tracksToSave:]( v11,  "commonInitWithIdentifier:metadata:tracksToSave:",  v8,  v9,  v10);
  }

  return v12;
}

- (void)commonInitWithIdentifier:(id)a3 metadata:(id)a4 tracksToSave:(id)a5
{
  id v8 = (NSString *)a3;
  id v9 = (SHLLibraryItemMetadata *)a4;
  id v21 = a5;
  if (-[SHLLibraryGroup validIdentifier:](self, "validIdentifier:", v8))
  {
    identifier = self->_identifier;
    self->_identifier = v8;
    v11 = v8;

    metadata = self->_metadata;
    self->_metadata = v9;
    v13 = v9;

    objc_super v14 = (NSMutableArray *)[v21 mutableCopy];
    tracksToSave = self->_tracksToSave;
    self->_tracksToSave = v14;
  }

  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ is not a valid identifier.",  v8));
    id v17 = (id)objc_claimAutoreleasedReturnValue( +[NSException shl_exceptionWithName:reason:]( &OBJC_CLASS___NSException,  "shl_exceptionWithName:reason:",  NSInvalidArgumentException,  v16));

    objc_exception_throw(v17);
    -[SHLLibraryGroup initWithCoder:](v18, v19, v20);
  }

- (SHLLibraryGroup)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"SHLLibraryGroupIdentifier"];
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = [v4 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"SHLLibraryGroupMetadata"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (v8) {
    id v9 = -[SHLLibraryItemMetadata initWithEncodedSystemData:]( objc_alloc(&OBJC_CLASS___SHLLibraryItemMetadata),  "initWithEncodedSystemData:",  v8);
  }
  else {
    id v9 = 0LL;
  }
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSArray);
  v11 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v10,  objc_opt_class(&OBJC_CLASS___SHLLibraryTrack),  0LL);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v12 forKey:@"SHLLibraryGroupTracksToSave"]);
  objc_super v14 = -[SHLLibraryGroup _initWithIdentifier:metadata:tracksToSave:]( self,  "_initWithIdentifier:metadata:tracksToSave:",  v6,  v9,  v13);

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"SHLLibraryGroupIdentifier"];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryItemMetadata encodedSystemData](self->_metadata, "encodedSystemData"));
  [v5 encodeObject:v6 forKey:@"SHLLibraryGroupMetadata"];

  id v7 = -[NSMutableArray copy](self->_tracksToSave, "copy");
  [v5 encodeObject:v7 forKey:@"SHLLibraryGroupTracksToSave"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SHLLibraryGroup)initWithLibraryGroup:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___SHLLibraryGroup;
  id v5 = -[SHLLibraryGroup init](&v16, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    id v7 = (NSString *)[v6 copy];
    identifier = v5->_identifier;
    v5->_identifier = v7;

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 metadata]);
    uint64_t v10 = (SHLLibraryItemMetadata *)[v9 copy];
    metadata = v5->_metadata;
    v5->_metadata = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue([v4 tracksToSave]);
    v13 = (NSMutableArray *)[v12 copy];
    tracksToSave = v5->_tracksToSave;
    v5->_tracksToSave = v13;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SHLLibraryGroup initWithLibraryGroup:]( +[SHLLibraryGroup allocWithZone:](&OBJC_CLASS___SHLLibraryGroup, "allocWithZone:", a3),  "initWithLibraryGroup:",  self);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[SHLLibraryGroup initWithLibraryGroup:]( +[SHLMutableLibraryGroup allocWithZone:](&OBJC_CLASS___SHLMutableLibraryGroup, "allocWithZone:", a3),  "initWithLibraryGroup:",  self);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SHLLibraryGroup *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___SHLLibraryGroup);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0) {
      BOOL v6 = -[SHLLibraryGroup isEqualGroup:](self, "isEqualGroup:", v4);
    }
    else {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (BOOL)isEqualGroup:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryGroup identifier](self, "identifier"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryGroup identifier](self, "identifier"));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)validIdentifier:(id)a3
{
  return [a3 length] != 0;
}

- (SHLLibraryItemMetadata)metadata
{
  return self->_metadata;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSMutableArray)tracksToSave
{
  return self->_tracksToSave;
}

- (void)setTracksToSave:(id)a3
{
}

- (void).cxx_destruct
{
}

@end