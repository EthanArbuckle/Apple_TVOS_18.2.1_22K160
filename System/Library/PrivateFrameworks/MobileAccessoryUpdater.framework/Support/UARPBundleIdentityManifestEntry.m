@interface UARPBundleIdentityManifestEntry
- (BOOL)trusted;
- (NSData)digest;
- (NSString)name;
- (UARPBundleIdentityManifestEntry)initWithName:(id)a3 digest:(id)a4 trusted:(BOOL)a5;
- (id)description;
- (id)descriptionWithTabDepth:(unint64_t)a3;
- (id)getTabs:(unint64_t)a3;
- (void)dealloc;
@end

@implementation UARPBundleIdentityManifestEntry

- (UARPBundleIdentityManifestEntry)initWithName:(id)a3 digest:(id)a4 trusted:(BOOL)a5
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___UARPBundleIdentityManifestEntry;
  v8 = -[UARPBundleIdentityManifestEntry init](&v10, "init");
  if (v8)
  {
    v8->_name = (NSString *)[a3 copy];
    v8->_digest = (NSData *)[a4 copy];
    v8->_trusted = a5;
  }

  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UARPBundleIdentityManifestEntry;
  -[UARPBundleIdentityManifestEntry dealloc](&v3, "dealloc");
}

- (id)description
{
  return -[UARPBundleIdentityManifestEntry descriptionWithTabDepth:](self, "descriptionWithTabDepth:", 0LL);
}

- (id)getTabs:(unint64_t)a3
{
  for (id i = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"); a3; --a3)
    [i appendString:@"\t"];
  return i;
}

- (id)descriptionWithTabDepth:(unint64_t)a3
{
  id v5 = sub_10002E554(a3);
  id v6 = sub_10002E554(a3 + 1);
  id v7 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
  v8 = (objc_class *)objc_opt_class(self);
  [v7 appendFormat:@"%@%@\n", v5, NSStringFromClass(v8)];
  [v7 appendFormat:@"%@{\n", v5];
  [v7 appendFormat:@"%@\tName: %@\n", v6, self->_name];
  [v7 appendFormat:@"%@\tDigest: %@\n", v6, self->_digest];
  if (self->_trusted) {
    v9 = "YES";
  }
  else {
    v9 = "NO";
  }
  [v7 appendFormat:@"%@\tTrusted: %s\n", v6, v9];
  [v7 appendFormat:@"%@}", v5];
  return +[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", v7);
}

- (NSString)name
{
  return self->_name;
}

- (NSData)digest
{
  return self->_digest;
}

- (BOOL)trusted
{
  return self->_trusted;
}

@end