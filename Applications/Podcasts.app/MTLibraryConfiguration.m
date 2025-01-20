@interface MTLibraryConfiguration
+ (id)defaultConfiguration;
- (BOOL)supportsLocalMedia;
- (BOOL)supportsPlayback;
- (id)initSupportsPlayback:(BOOL)a3 supportsLocalMedia:(BOOL)a4;
- (void)setSupportsLocalMedia:(BOOL)a3;
- (void)setSupportsPlayback:(BOOL)a3;
@end

@implementation MTLibraryConfiguration

- (id)initSupportsPlayback:(BOOL)a3 supportsLocalMedia:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MTLibraryConfiguration;
  v6 = -[MTLibraryConfiguration init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    -[MTLibraryConfiguration setSupportsPlayback:](v6, "setSupportsPlayback:", v5);
    -[MTLibraryConfiguration setSupportsLocalMedia:](v7, "setSupportsLocalMedia:", v4);
  }

  return v7;
}

+ (id)defaultConfiguration
{
  return [objc_alloc((Class)a1) initSupportsPlayback:1 supportsLocalMedia:0];
}

- (BOOL)supportsPlayback
{
  return self->_supportsPlayback;
}

- (void)setSupportsPlayback:(BOOL)a3
{
  self->_supportsPlayback = a3;
}

- (BOOL)supportsLocalMedia
{
  return self->_supportsLocalMedia;
}

- (void)setSupportsLocalMedia:(BOOL)a3
{
  self->_supportsLocalMedia = a3;
}

@end