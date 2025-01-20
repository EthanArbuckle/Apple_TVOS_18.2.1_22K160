@interface PBSnapshotLoadRequest
+ (id)requestWithBundleIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)preferLaunchImage;
- (NSString)bundleIdentifier;
- (NSString)variant;
- (double)preferredScaleFactor;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setPreferLaunchImage:(BOOL)a3;
- (void)setPreferredScaleFactor:(double)a3;
- (void)setVariant:(id)a3;
@end

@implementation PBSnapshotLoadRequest

+ (id)requestWithBundleIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___PBSnapshotLoadRequest);
  v5 = (NSString *)[v3 copy];

  bundleIdentifier = v4->_bundleIdentifier;
  v4->_bundleIdentifier = v5;

  v4->_preferLaunchImage = 0;
  v4->_preferredScaleFactor = 1.0;
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBSnapshotLoadRequest bundleIdentifier](self, "bundleIdentifier", a3));
  uint64_t v5 = objc_claimAutoreleasedReturnValue( +[PBSnapshotLoadRequest requestWithBundleIdentifier:]( &OBJC_CLASS___PBSnapshotLoadRequest,  "requestWithBundleIdentifier:",  v4));

  id v6 = -[NSString copy](self->_variant, "copy");
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  *(_BYTE *)(v5 + 8) = self->_preferLaunchImage;
  *(double *)(v5 + 24) = self->_preferredScaleFactor;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___PBSnapshotLoadRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBSnapshotLoadRequest bundleIdentifier](self, "bundleIdentifier"));
    if (![v8 isEqual:v9])
    {
      BOOL v12 = 0;
LABEL_14:

      goto LABEL_15;
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 variant]);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBSnapshotLoadRequest variant](self, "variant"));
    if (v10 == v11
      || (id v3 = (void *)objc_claimAutoreleasedReturnValue([v6 variant]),
          v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBSnapshotLoadRequest variant](self, "variant")),
          [v3 isEqual:v4]))
    {
      unsigned int v13 = [v6 preferLaunchImage];
      if (v13 == -[PBSnapshotLoadRequest preferLaunchImage](self, "preferLaunchImage"))
      {
        [v6 preferredScaleFactor];
        double v15 = v14;
        -[PBSnapshotLoadRequest preferredScaleFactor](self, "preferredScaleFactor");
        BOOL v12 = v15 == v16;
      }

      else
      {
        BOOL v12 = 0;
      }

      if (v10 == v11) {
        goto LABEL_13;
      }
    }

    else
    {
      BOOL v12 = 0;
    }

LABEL_13:
    goto LABEL_14;
  }

  BOOL v12 = 0;
LABEL_15:

  return v12;
}

- (unint64_t)hash
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBSnapshotLoadRequest bundleIdentifier](self, "bundleIdentifier"));
  v4 = (char *)[v3 hash];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSnapshotLoadRequest variant](self, "variant"));
  id v6 = &v4[(void)[v5 hash]];
  unsigned int v7 = -[PBSnapshotLoadRequest preferLaunchImage](self, "preferLaunchImage");
  uint64_t v8 = 10000LL;
  if (!v7) {
    uint64_t v8 = 0LL;
  }
  v9 = &v6[v8];
  -[PBSnapshotLoadRequest preferredScaleFactor](self, "preferredScaleFactor");
  unint64_t v11 = (unint64_t)&v9[(unint64_t)(v10 * 2500.0)];

  return v11;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (BOOL)preferLaunchImage
{
  return self->_preferLaunchImage;
}

- (void)setPreferLaunchImage:(BOOL)a3
{
  self->_preferLaunchImage = a3;
}

- (double)preferredScaleFactor
{
  return self->_preferredScaleFactor;
}

- (void)setPreferredScaleFactor:(double)a3
{
  self->_preferredScaleFactor = a3;
}

- (NSString)variant
{
  return self->_variant;
}

- (void)setVariant:(id)a3
{
}

- (void).cxx_destruct
{
}

@end