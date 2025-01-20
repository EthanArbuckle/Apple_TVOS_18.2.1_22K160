@interface ASCOfferContext
+ (BOOL)supportsSecureCoding;
- (ASCOfferContext)init;
- (ASCOfferContext)initWithCoder:(id)a3;
- (ASCOfferContext)initWithFlags:(int64_t)a3;
- (ASCOfferContext)initWithFlags:(int64_t)a3 presentingSceneIdentifier:(id)a4 presentingSceneBundleIdentifier:(id)a5 externalDeepLinkURL:(id)a6 paymentViewServiceListener:(id)a7;
- (ASCOfferContext)offerContextWithPresentingSceneIdentifier:(id)a3 presentingSceneBundleIdentifier:(id)a4 externalDeepLinkURL:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldInstallParentApp;
- (BOOL)supportsDSIDLessInstall;
- (BOOL)universalLinkRequired;
- (NSString)presentingSceneBundleIdentifier;
- (NSString)presentingSceneIdentifier;
- (NSURL)externalDeepLinkURL;
- (NSXPCListenerEndpoint)paymentViewServiceListener;
- (id)description;
- (id)offerContextByAddingFlags:(int64_t)a3;
- (int64_t)flags;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCOfferContext

- (ASCOfferContext)initWithFlags:(int64_t)a3 presentingSceneIdentifier:(id)a4 presentingSceneBundleIdentifier:(id)a5 externalDeepLinkURL:(id)a6 paymentViewServiceListener:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___ASCOfferContext;
  v16 = -[ASCOfferContext init](&v25, "init");
  v17 = v16;
  if (v16)
  {
    v16->_flags = a3;
    v18 = (NSString *)[v12 copy];
    presentingSceneIdentifier = v17->_presentingSceneIdentifier;
    v17->_presentingSceneIdentifier = v18;

    v20 = (NSString *)[v13 copy];
    presentingSceneBundleIdentifier = v17->_presentingSceneBundleIdentifier;
    v17->_presentingSceneBundleIdentifier = v20;

    v22 = (NSURL *)[v14 copy];
    externalDeepLinkURL = v17->_externalDeepLinkURL;
    v17->_externalDeepLinkURL = v22;

    objc_storeStrong((id *)&v17->_paymentViewServiceListener, a7);
  }

  return v17;
}

- (ASCOfferContext)initWithFlags:(int64_t)a3
{
  return -[ASCOfferContext initWithFlags:presentingSceneIdentifier:presentingSceneBundleIdentifier:externalDeepLinkURL:paymentViewServiceListener:]( self,  "initWithFlags:presentingSceneIdentifier:presentingSceneBundleIdentifier:externalDeepLinkURL:paymentViewServiceListener:",  a3,  0LL,  0LL,  0LL,  0LL);
}

- (ASCOfferContext)init
{
  return -[ASCOfferContext initWithFlags:](self, "initWithFlags:", 0LL);
}

- (BOOL)supportsDSIDLessInstall
{
  return -[ASCOfferContext flags](self, "flags") & 1;
}

- (BOOL)shouldInstallParentApp
{
  return ((unint64_t)-[ASCOfferContext flags](self, "flags") >> 1) & 1;
}

- (BOOL)universalLinkRequired
{
  return ((unint64_t)-[ASCOfferContext flags](self, "flags") >> 2) & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCOfferContext)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeIntegerForKey:@"flags"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"presentingSceneIdentifier"];
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"presentingSceneBundleIdentifier"];
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = [v4 decodeObjectOfClass:objc_opt_class(NSURL) forKey:@"externalDeepLinkURL"];
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = [v4 decodeObjectOfClass:objc_opt_class(NSXPCListenerEndpoint) forKey:@"paymentViewServiceListener"];
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  id v14 = -[ASCOfferContext initWithFlags:presentingSceneIdentifier:presentingSceneBundleIdentifier:externalDeepLinkURL:paymentViewServiceListener:]( self,  "initWithFlags:presentingSceneIdentifier:presentingSceneBundleIdentifier:externalDeepLinkURL:paymentViewServiceListener:",  v5,  v7,  v9,  v11,  v13);
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[ASCOfferContext flags](self, "flags"), @"flags");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferContext presentingSceneIdentifier](self, "presentingSceneIdentifier"));
  [v4 encodeObject:v5 forKey:@"presentingSceneIdentifier"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferContext presentingSceneBundleIdentifier](self, "presentingSceneBundleIdentifier"));
  [v4 encodeObject:v6 forKey:@"presentingSceneBundleIdentifier"];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferContext externalDeepLinkURL](self, "externalDeepLinkURL"));
  [v4 encodeObject:v7 forKey:@"externalDeepLinkURL"];

  id v8 = (id)objc_claimAutoreleasedReturnValue(-[ASCOfferContext paymentViewServiceListener](self, "paymentViewServiceListener"));
  [v4 encodeObject:v8 forKey:@"paymentViewServiceListener"];
}

- (id)offerContextByAddingFlags:(int64_t)a3
{
  unint64_t v4 = -[ASCOfferContext flags](self, "flags") | a3;
  id v5 = objc_alloc((Class)objc_opt_class(self));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferContext presentingSceneIdentifier](self, "presentingSceneIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferContext presentingSceneBundleIdentifier](self, "presentingSceneBundleIdentifier"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferContext externalDeepLinkURL](self, "externalDeepLinkURL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferContext paymentViewServiceListener](self, "paymentViewServiceListener"));
  id v10 = [v5 initWithFlags:v4 presentingSceneIdentifier:v6 presentingSceneBundleIdentifier:v7 externalDeepLinkURL:v8 paymentViewServiceListener:v9];

  return v10;
}

- (ASCOfferContext)offerContextWithPresentingSceneIdentifier:(id)a3 presentingSceneBundleIdentifier:(id)a4 externalDeepLinkURL:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc((Class)objc_opt_class(self));
  int64_t v12 = -[ASCOfferContext flags](self, "flags");
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferContext paymentViewServiceListener](self, "paymentViewServiceListener"));
  id v14 = [v11 initWithFlags:v12 presentingSceneIdentifier:v10 presentingSceneBundleIdentifier:v9 externalDeepLinkURL:v8 paymentViewServiceListener:v13];

  return (ASCOfferContext *)v14;
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(&OBJC_CLASS___ASCHasher);
  -[ASCHasher combineInteger:](v3, "combineInteger:", -[ASCOfferContext flags](self, "flags"));
  unint64_t v4 = -[ASCHasher finalizeHash](v3, "finalizeHash");

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___ASCOfferContext);
  id v6 = v4;
  v7 = v6;
  if (v6)
  {
    if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0) {
      id v8 = v7;
    }
    else {
      id v8 = 0LL;
    }
  }

  else
  {
    id v8 = 0LL;
  }

  id v9 = v8;

  if (v9)
  {
    unsigned int v10 = -[ASCOfferContext supportsDSIDLessInstall](self, "supportsDSIDLessInstall");
    if (v10 == [v9 supportsDSIDLessInstall])
    {
      unsigned int v11 = -[ASCOfferContext shouldInstallParentApp](self, "shouldInstallParentApp");
      if (v11 == [v9 shouldInstallParentApp])
      {
        id v14 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferContext presentingSceneIdentifier](self, "presentingSceneIdentifier"));
        uint64_t v15 = objc_claimAutoreleasedReturnValue([v9 presentingSceneIdentifier]);
        v16 = (void *)v15;
        if (v14 && v15)
        {
          if ([v14 isEqual:v15])
          {
LABEL_14:
            v17 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferContext presentingSceneBundleIdentifier](self, "presentingSceneBundleIdentifier"));
            uint64_t v18 = objc_claimAutoreleasedReturnValue([v9 presentingSceneBundleIdentifier]);
            v19 = (void *)v18;
            if (v17 && v18)
            {
              if ([v17 isEqual:v18])
              {
LABEL_17:
                v20 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferContext externalDeepLinkURL](self, "externalDeepLinkURL"));
                uint64_t v21 = objc_claimAutoreleasedReturnValue([v9 externalDeepLinkURL]);
                v22 = (void *)v21;
                if (v20 && v21)
                {
                }

                else if (v20 != (void *)v21)
                {
                  goto LABEL_27;
                }

                unsigned int v23 = -[ASCOfferContext universalLinkRequired](self, "universalLinkRequired");
                if (v23 == [v9 universalLinkRequired])
                {
                  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferContext paymentViewServiceListener](self, "paymentViewServiceListener"));
                  uint64_t v25 = objc_claimAutoreleasedReturnValue([v9 paymentViewServiceListener]);
                  v26 = (void *)v25;
                  v27 = v24;
                  if (v24 && v25) {
                    unsigned __int8 v12 = [v24 isEqual:v25];
                  }
                  else {
                    unsigned __int8 v12 = v24 == (void *)v25;
                  }

                  goto LABEL_33;
                }

- (id)description
{
  v3 = -[ASCDescriber initWithObject:](objc_alloc(&OBJC_CLASS___ASCDescriber), "initWithObject:", self);
  -[ASCDescriber addBool:withName:]( v3,  "addBool:withName:",  -[ASCOfferContext supportsDSIDLessInstall](self, "supportsDSIDLessInstall"),  @"supportsDSIDLessInstall");
  -[ASCDescriber addBool:withName:]( v3,  "addBool:withName:",  -[ASCOfferContext shouldInstallParentApp](self, "shouldInstallParentApp"),  @"shouldInstallParentApp");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferContext presentingSceneIdentifier](self, "presentingSceneIdentifier"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, @"presentingSceneIdentifier");

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferContext presentingSceneBundleIdentifier](self, "presentingSceneBundleIdentifier"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, @"presentingSceneBundleIdentifier");

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferContext externalDeepLinkURL](self, "externalDeepLinkURL"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v6, @"externalDeepLinkURL");

  -[ASCDescriber addBool:withName:]( v3,  "addBool:withName:",  -[ASCOfferContext universalLinkRequired](self, "universalLinkRequired"),  @"universalLinkRequired");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferContext paymentViewServiceListener](self, "paymentViewServiceListener"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v7, @"paymentViewServiceListener");

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDescriber finalizeDescription](v3, "finalizeDescription"));
  return v8;
}

- (int64_t)flags
{
  return self->_flags;
}

- (NSString)presentingSceneIdentifier
{
  return self->_presentingSceneIdentifier;
}

- (NSString)presentingSceneBundleIdentifier
{
  return self->_presentingSceneBundleIdentifier;
}

- (NSURL)externalDeepLinkURL
{
  return self->_externalDeepLinkURL;
}

- (NSXPCListenerEndpoint)paymentViewServiceListener
{
  return self->_paymentViewServiceListener;
}

- (void).cxx_destruct
{
}

@end