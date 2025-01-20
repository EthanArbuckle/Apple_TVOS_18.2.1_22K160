@interface _LSApplicationState
+ (BOOL)supportsSecureCoding;
- (BOOL)isAlwaysAvailable;
- (BOOL)isBlocked;
- (BOOL)isDowngraded;
- (BOOL)isInstalled;
- (BOOL)isPlaceholder;
- (BOOL)isRemovedSystemApp;
- (BOOL)isRestricted;
- (BOOL)isRestrictedWithStateProvider:(id)a3;
- (BOOL)isValid;
- (NSString)bundleIdentifier;
- (_LSApplicationState)initWithBundleIdentifier:(id)a3 stateFlags:(unint64_t)a4 ratingRank:(int)a5 installType:(unint64_t)a6;
- (_LSApplicationState)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)installType;
- (void)addStateFlag:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _LSApplicationState

- (_LSApplicationState)initWithBundleIdentifier:(id)a3 stateFlags:(unint64_t)a4 ratingRank:(int)a5 installType:(unint64_t)a6
{
  id v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS____LSApplicationState;
  v11 = -[_LSApplicationState init](&v15, sel_init);
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    bundleIdentifier = v11->_bundleIdentifier;
    v11->_bundleIdentifier = (NSString *)v12;

    v11->_stateFlags = a4;
    v11->_ratingRank = a5;
    v11->_installType = a6;
  }

  return v11;
}

- (BOOL)isValid
{
  return (LOBYTE(self->_stateFlags) >> 2) & 1;
}

- (BOOL)isRestricted
{
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  v4 = -[LSApplicationRestrictionsManager defaultStateProvider](v3);
  LOBYTE(self) = -[_LSApplicationState isRestrictedWithStateProvider:](self, "isRestrictedWithStateProvider:", v4);

  return (char)self;
}

- (BOOL)isRestrictedWithStateProvider:(id)a3
{
  id v4 = a3;
  if (-[_LSApplicationState isPlaceholder](self, "isPlaceholder") && (self->_stateFlags & 0x20) != 0)
  {
    char v8 = 1;
  }

  else
  {
    int ratingRank = self->_ratingRank;
    v6 = +[LSApplicationRestrictionsManager sharedInstance]();
    v7 = -[LSApplicationRestrictionsManager maximumRating](v6);
    if (ratingRank <= (int)[v7 intValue])
    {
      v9 = +[LSApplicationRestrictionsManager sharedInstance]();
      char v8 = -[LSApplicationRestrictionsManager isApplicationRestricted:checkFlags:stateProvider:]( (uint64_t)v9,  self->_bundleIdentifier,  self->_stateFlags,  v4);
    }

    else
    {
      char v8 = 1;
    }
  }

  return v8;
}

- (BOOL)isPlaceholder
{
  return (LOBYTE(self->_stateFlags) >> 3) & 1;
}

- (void).cxx_destruct
{
}

- (BOOL)isInstalled
{
  return (LOBYTE(self->_stateFlags) >> 4) & 1;
}

- (BOOL)isAlwaysAvailable
{
  return (LOBYTE(self->_stateFlags) >> 1) & 1;
}

- (BOOL)isRemovedSystemApp
{
  return 0;
}

- (BOOL)isBlocked
{
  return 0;
}

- (BOOL)isDowngraded
{
  return self->_installType - 7 < 3;
}

- (unint64_t)installType
{
  return self->_installType;
}

- (void)addStateFlag:(unint64_t)a3
{
  self->_stateFlags |= a3;
}

- (id)description
{
  v3 = (void *)NSString;
  bundleIdentifier = self->_bundleIdentifier;
  if (-[_LSApplicationState isValid](self, "isValid")) {
    v5 = &stru_189D7B4C8;
  }
  else {
    v5 = @"INVALID";
  }
  if (-[_LSApplicationState isPlaceholder](self, "isPlaceholder")) {
    v6 = @"placeholder";
  }
  else {
    v6 = &stru_189D7B4C8;
  }
  if (-[_LSApplicationState isInstalled](self, "isInstalled")) {
    v7 = @"installed";
  }
  else {
    v7 = &stru_189D7B4C8;
  }
  if (-[_LSApplicationState isBlocked](self, "isBlocked")) {
    char v8 = @"(blocked)";
  }
  else {
    char v8 = &stru_189D7B4C8;
  }
  if (-[_LSApplicationState isRemovedSystemApp](self, "isRemovedSystemApp")) {
    v9 = @"(removedSystemApp)";
  }
  else {
    v9 = &stru_189D7B4C8;
  }
  BOOL v10 = -[_LSApplicationState isRestricted](self, "isRestricted");
  v11 = @"(restricted)";
  if (!v10) {
    v11 = &stru_189D7B4C8;
  }
  return (id)[v3 stringWithFormat:@"%@ <%@%@%@ %@%@%@>", bundleIdentifier, v5, v6, v7, v8, v9, v11];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  bundleIdentifier = self->_bundleIdentifier;
  id v5 = a3;
  [v5 encodeObject:bundleIdentifier forKey:@"bundleIdentifier"];
  [v5 encodeInteger:self->_stateFlags forKey:@"_LSAppStateFlags"];
  [v5 encodeInt:self->_ratingRank forKey:@"ratingRank"];
  [v5 encodeInteger:self->_installType forKey:@"installType"];
}

- (_LSApplicationState)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"bundleIdentifier");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v4 decodeIntegerForKey:@"_LSAppStateFlags"];
  uint64_t v7 = [v4 decodeIntForKey:@"ratingRank"];
  uint64_t v8 = [v4 decodeIntegerForKey:@"installType"];
  if (v5)
  {
    v9 = -[_LSApplicationState initWithBundleIdentifier:stateFlags:ratingRank:installType:]( self,  "initWithBundleIdentifier:stateFlags:ratingRank:installType:",  v5,  v6,  v7,  v8);
  }

  else
  {
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607460],  4865LL,  (uint64_t)"-[_LSApplicationState initWithCoder:]",  147LL,  0LL);
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 failWithError:v10];

    v9 = 0LL;
  }

  return v9;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

@end