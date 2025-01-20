@interface ASCOfferMetadata
+ (ASCOfferMetadata)emptyMetadata;
+ (ASCOfferMetadata)indeterminateProgressMetadata;
+ (ASCOfferMetadata)placeholderMetadata;
+ (ASCOfferMetadata)redownloadMetadata;
+ (BOOL)supportsSecureCoding;
+ (id)iconMetadataWithImageName:(id)a3 animationName:(id)a4;
+ (id)progressMetadataWithValue:(double)a3;
+ (id)progressMetadataWithValue:(double)a3 cancellable:(BOOL)a4;
+ (id)textMetadataWithTitle:(id)a3 subtitle:(id)a4;
- (ASCOfferMetadata)init;
- (ASCOfferMetadata)initWithCoder:(id)a3;
- (BOOL)isDeeplink;
- (BOOL)isEmpty;
- (BOOL)isIcon;
- (BOOL)isPlaceholder;
- (BOOL)isProgress;
- (BOOL)isText;
- (BOOL)isViewInAppStore;
- (id)_init;
@end

@implementation ASCOfferMetadata

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ASCOfferMetadata;
  return -[ASCOfferMetadata init](&v3, "init");
}

- (ASCOfferMetadata)init
{
  return 0LL;
}

+ (ASCOfferMetadata)emptyMetadata
{
  return (ASCOfferMetadata *)objc_alloc_init(&OBJC_CLASS___ASCEmptyOfferMetadata);
}

+ (id)textMetadataWithTitle:(id)a3 subtitle:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = -[ASCTextOfferMetadata initWithTitle:subtitle:]( objc_alloc(&OBJC_CLASS___ASCTextOfferMetadata),  "initWithTitle:subtitle:",  v6,  v5);

  return v7;
}

+ (id)iconMetadataWithImageName:(id)a3 animationName:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = -[ASCIconOfferMetadata initWithBaseImageName:animationName:]( objc_alloc(&OBJC_CLASS___ASCIconOfferMetadata),  "initWithBaseImageName:animationName:",  v6,  v5);

  return v7;
}

+ (ASCOfferMetadata)placeholderMetadata
{
  return (ASCOfferMetadata *)objc_alloc_init(&OBJC_CLASS___ASCPlaceholderOfferMetadata);
}

+ (ASCOfferMetadata)redownloadMetadata
{
  return (ASCOfferMetadata *)_[a1 iconMetadataWithImageName:@"OfferRedownload" animationName:@"none"];
}

+ (ASCOfferMetadata)indeterminateProgressMetadata
{
  return (ASCOfferMetadata *) -[ASCProgressOfferMetadata initIndeterminate]( objc_alloc(&OBJC_CLASS___ASCProgressOfferMetadata),  "initIndeterminate");
}

+ (id)progressMetadataWithValue:(double)a3
{
  return  -[ASCProgressOfferMetadata initWithPercent:cancellable:]( objc_alloc(&OBJC_CLASS___ASCProgressOfferMetadata),  "initWithPercent:cancellable:",  1LL,  a3);
}

+ (id)progressMetadataWithValue:(double)a3 cancellable:(BOOL)a4
{
  return  -[ASCProgressOfferMetadata initWithPercent:cancellable:]( objc_alloc(&OBJC_CLASS___ASCProgressOfferMetadata),  "initWithPercent:cancellable:",  a4,  a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCOfferMetadata)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___ASCOfferMetadata;
  return -[ASCOfferMetadata init](&v5, "init");
}

- (BOOL)isEmpty
{
  return 0;
}

- (BOOL)isText
{
  return 0;
}

- (BOOL)isIcon
{
  return 0;
}

- (BOOL)isProgress
{
  return 0;
}

- (BOOL)isPlaceholder
{
  return 0;
}

- (BOOL)isDeeplink
{
  return 0;
}

- (BOOL)isViewInAppStore
{
  return 0;
}

@end