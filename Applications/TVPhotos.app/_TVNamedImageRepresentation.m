@interface _TVNamedImageRepresentation
- (CGImage)_originalImage;
- (_TVNamedImageRepresentation)initWithImageNamed:(id)a3 inBundle:(id)a4 compatibleWithTraitCollection:(id)a5;
- (id)_originalImageCacheKey;
@end

@implementation _TVNamedImageRepresentation

- (_TVNamedImageRepresentation)initWithImageNamed:(id)a3 inBundle:(id)a4 compatibleWithTraitCollection:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS____TVNamedImageRepresentation;
  v11 = -[_TVNamedImageRepresentation init](&v16, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_bundle, a4);
    v13 = (NSString *)[v8 copy];
    imageName = v12->_imageName;
    v12->_imageName = v13;

    objc_storeStrong((id *)&v12->_traitCollection, a5);
  }

  return v12;
}

- (CGImage)_originalImage
{
  id v2 = objc_claimAutoreleasedReturnValue( +[UIImage imageNamed:inBundle:compatibleWithTraitCollection:]( &OBJC_CLASS___UIImage, "imageNamed:inBundle:compatibleWithTraitCollection:", self->_imageName, self->_bundle, self->_traitCollection));
  v3 = CGImageRetain((CGImageRef)[v2 CGImage]);

  return v3;
}

- (id)_originalImageCacheKey
{
  v3 = self->_imageName;
  bundle = self->_bundle;
  if (bundle)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSBundle bundlePath](bundle, "bundlePath"));
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"(%@,%@)", v3, v5));

    v3 = (NSString *)v6;
  }

  return v3;
}

- (void).cxx_destruct
{
}

@end