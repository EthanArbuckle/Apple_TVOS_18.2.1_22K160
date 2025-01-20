@interface SUControllerScanOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)downloadWhenFound;
- (BOOL)isEqual:(id)a3;
- (BOOL)userInitiated;
- (SUControllerScanOptions)init;
- (SUControllerScanOptions)initWithCoder:(id)a3;
- (id)copy;
- (id)description;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
- (void)setDownloadWhenFound:(BOOL)a3;
- (void)setUserInitiated:(BOOL)a3;
@end

@implementation SUControllerScanOptions

- (SUControllerScanOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SUControllerScanOptions;
  result = -[SUControllerScanOptions init](&v3, "init");
  if (result) {
    *(_WORD *)&result->_userInitiated = 257;
  }
  return result;
}

- (SUControllerScanOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SUControllerScanOptions;
  v5 = -[SUControllerScanOptions init](&v7, "init");
  if (v5)
  {
    v5->_userInitiated = [v4 decodeBoolForKey:@"userInitiated"];
    v5->_downloadWhenFound = [v4 decodeBoolForKey:@"downloadWhenFound"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend( v4,  "encodeBool:forKey:",  -[SUControllerScanOptions userInitiated](self, "userInitiated"),  @"userInitiated");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[SUControllerScanOptions downloadWhenFound](self, "downloadWhenFound"),  @"downloadWhenFound");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  self,  1LL,  0LL));
  id v3 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___SUControllerScanOptions),  v2,  0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  unsigned int v5 = -[SUControllerScanOptions userInitiated](self, "userInitiated");
  if (v5 == [v4 userInitiated])
  {
    unsigned int v7 = -[SUControllerScanOptions downloadWhenFound](self, "downloadWhenFound");
    unsigned int v6 = v7 ^ [v4 downloadWhenFound] ^ 1;
  }

  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)description
{
  if (-[SUControllerScanOptions userInitiated](self, "userInitiated")) {
    id v3 = @"YES";
  }
  else {
    id v3 = @"NO";
  }
  if (-[SUControllerScanOptions downloadWhenFound](self, "downloadWhenFound")) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\n        userInitiated: %@\n    downloadWhenFound: %@",  v3,  v4);
}

- (id)summary
{
  if (-[SUControllerScanOptions userInitiated](self, "userInitiated")) {
    id v3 = @"Y";
  }
  else {
    id v3 = @"N";
  }
  if (-[SUControllerScanOptions downloadWhenFound](self, "downloadWhenFound")) {
    id v4 = @"Y";
  }
  else {
    id v4 = @"N";
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"userInitiated:%@,downloadWhenFound:%@",  v3,  v4);
}

- (BOOL)userInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

- (BOOL)downloadWhenFound
{
  return self->_downloadWhenFound;
}

- (void)setDownloadWhenFound:(BOOL)a3
{
  self->_downloadWhenFound = a3;
}

@end