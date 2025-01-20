@interface TVHProductContentSectionItem
+ (TVHProductContentSectionItem)new;
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (TVHProductContentSectionItem)init;
- (TVHProductContentSectionItem)initWithViewController:(id)a3 spacing:(double)a4;
- (UIViewController)viewController;
- (double)spacing;
- (id)description;
- (unint64_t)hash;
@end

@implementation TVHProductContentSectionItem

+ (TVHProductContentSectionItem)new
{
  return 0LL;
}

- (TVHProductContentSectionItem)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHProductContentSectionItem)initWithViewController:(id)a3 spacing:(double)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVHProductContentSectionItem;
  v8 = -[TVHProductContentSectionItem init](&v13, "init");
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 UUIDString]);
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v10;

    objc_storeStrong((id *)&v8->_viewController, a3);
    v8->_spacing = a4;
  }

  return v8;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSHashBuilder builder](&OBJC_CLASS___BSHashBuilder, "builder"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductContentSectionItem identifier](self, "identifier"));
  id v5 = [v3 appendObject:v4];

  id v6 = [v3 hash];
  return (unint64_t)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  v4,  objc_opt_class(&OBJC_CLASS___TVHProductContentSectionItem));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductContentSectionItem identifier](self, "identifier"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100033374;
  v11[3] = &unk_1000FD6E8;
  id v12 = v4;
  id v8 = v4;
  id v9 = [v6 appendObject:v7 counterpart:v11];

  LOBYTE(v7) = [v6 isEqual];
  return (char)v7;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductContentSectionItem identifier](self, "identifier"));
  [v3 appendString:v4 withName:@"identifier"];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductContentSectionItem viewController](self, "viewController"));
  id v6 = [v3 appendObject:v5 withName:@"viewController"];

  -[TVHProductContentSectionItem spacing](self, "spacing");
  id v7 = objc_msgSend(v3, "appendFloat:withName:", @"spacing");
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (double)spacing
{
  return self->_spacing;
}

- (void).cxx_destruct
{
}

@end