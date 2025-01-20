@interface NSFileAccessNode
- (BOOL)_mayContainCriticalDebuggingInformationExcludingReactors:(BOOL)a3;
- (BOOL)itemIsFilePackage;
- (BOOL)itemIsInItemAtLocation:(id)a3;
- (BOOL)itemIsItemAtLocation:(id)a3;
- (BOOL)itemIsSubarbitrable;
- (BOOL)setProvider:(id)a3;
- (NSFileAccessNode)initWithParent:(id)a3 name:(id)a4 normalizedName:(id)a5;
- (id)_childrenExcludingExcessNodes:(BOOL)a3 excludingReactors:(BOOL)a4;
- (id)biggestFilePackageLocation;
- (id)childForRange:(_NSRange)a3 ofPath:(id)a4;
- (id)descendantAtPath:(id)a3 componentRange:(_NSRange)a4 create:(BOOL)a5;
- (id)descendantAtPath:(id)a3 componentRange:(_NSRange)a4 forAddingLeafNode:(id)a5 create:(BOOL)a6;
- (id)descendantForFileURL:(id)a3;
- (id)description;
- (id)descriptionWithIndenting:(id)a3 excludingExcessNodes:(BOOL)a4 excludingReactors:(BOOL)a5;
- (id)itemProvider;
- (id)name;
- (id)normalizationOfChildName:(id)a3;
- (id)parent;
- (id)pathExceptPrivate;
- (id)pathFromAncestor:(id)a3;
- (id)pathToDescendantForFileURL:(id)a3 componentRange:(_NSRange *)a4;
- (id)sensitiveDescription;
- (id)sensitiveSubarbiterDescription;
- (id)standardizedURL;
- (id)subarbiterDescription;
- (id)url;
- (id)urlOfSubitemAtPath:(id)a3 plusPath:(id)a4;
- (void)_forEachRelevantAccessClaimExcludingClaimsFromSuperarbiter:(BOOL)a3 performProcedure:(id)a4;
- (void)_setLinkDestination:(id)a3;
- (void)addAccessClaim:(id)a3;
- (void)addPresenter:(id)a3;
- (void)addProgressPublisher:(id)a3;
- (void)addProgressSubscriber:(id)a3;
- (void)assertDead;
- (void)assertDescendantsLive;
- (void)assertLive;
- (void)dealloc;
- (void)forEachAccessClaimOnItemOrContainedItemPerformProcedure:(id)a3;
- (void)forEachAccessClaimOnItemPerformProcedure:(id)a3;
- (void)forEachDescendantPerformProcedure:(id)a3;
- (void)forEachPresenterOfContainedItemPerformProcedure:(id)a3;
- (void)forEachPresenterOfContainingFilePackagePerformProcedure:(id)a3;
- (void)forEachPresenterOfContainingItemPerformProcedure:(id)a3;
- (void)forEachPresenterOfItemOrContainedItemPerformProcedure:(id)a3;
- (void)forEachPresenterOfItemOrContainingItemPerformProcedure:(id)a3;
- (void)forEachPresenterOfItemPerformProcedure:(id)a3;
- (void)forEachProgressPublisherOfItemOrContainedItemPerformProcedure:(id)a3;
- (void)forEachProgressPublisherOfItemPerformProcedure:(id)a3;
- (void)forEachProgressSubscriberOfItemOrContainingItemPerformProcedure:(id)a3;
- (void)forEachProgressSubscriberOfItemPerformProcedure:(id)a3;
- (void)forEachProgressThingOfItemOrContainedItemPerformProcedure:(id)a3;
- (void)forEachReactorToItemOrContainedItemPerformProcedure:(id)a3;
- (void)forEachRelevantAccessClaimForEvaluatingAgainstClaim:(id)a3 performProcedure:(id)a4;
- (void)forEachRelevantAccessClaimPerformProcedure:(id)a3;
- (void)removeAccessClaim:(id)a3;
- (void)removeChildForNormalizedName:(id)a3;
- (void)removePresenter:(id)a3;
- (void)removeProgressPublisher:(id)a3;
- (void)removeProgressSubscriber:(id)a3;
- (void)removeProvider:(id)a3;
- (void)removeSelfIfUseless;
- (void)setArbitrationBoundary;
- (void)setChild:(id)a3 forName:(id)a4 normalizedName:(id)a5;
- (void)setFirmlinkDestination:(id)a3;
- (void)setParent:(id)a3 name:(id)a4;
- (void)setSymbolicLinkDestination:(id)a3;
@end

@implementation NSFileAccessNode

- (NSFileAccessNode)initWithParent:(id)a3 name:(id)a4 normalizedName:(id)a5
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NSFileAccessNode;
  v8 = -[NSFileAccessNode init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_parent = (NSFileAccessNode *)a3;
    v8->_name = (NSString *)[a4 copy];
    v9->_normalizedName = (NSString *)[a5 copy];
  }

  return v9;
}

- (void)_setLinkDestination:(id)a3
{
  symbolicLinkDestination = self->_symbolicLinkDestination;
  if (symbolicLinkDestination != a3)
  {
    if (symbolicLinkDestination) {
      --symbolicLinkDestination->_symbolicLinkReferenceCount;
    }
    v6 = symbolicLinkDestination;
    if (a3)
    {
      v5 = (NSFileAccessNode *)a3;
      self->_symbolicLinkDestination = v5;
      ++v5->_symbolicLinkReferenceCount;
    }

    else
    {
      self->_symbolicLinkDestination = 0LL;
      -[NSFileAccessNode removeSelfIfUseless](self, "removeSelfIfUseless");
    }

    -[NSFileAccessNode removeSelfIfUseless](v6, "removeSelfIfUseless");
  }

- (void)setSymbolicLinkDestination:(id)a3
{
  self->_symbolicLinkIsFirmlink = 0;
}

- (void)setFirmlinkDestination:(id)a3
{
  self->_symbolicLinkIsFirmlink = a3 != 0LL;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSFileAccessNode;
  -[NSFileAccessNode dealloc](&v3, sel_dealloc);
}

- (id)pathToDescendantForFileURL:(id)a3 componentRange:(_NSRange *)a4
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (!-[NSString isEqualToString:](self->_normalizedName, "isEqualToString:", @"/"))
  {
    v10 = (os_log_s *)_NSFCLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v14) = 0;
      _os_log_error_impl( &dword_182EB1000,  v10,  OS_LOG_TYPE_ERROR,  "[NSFileAccessNode pathToDescendantForFileURL:componentRange:] was invoked in a surprising way.",  (uint8_t *)&v14,  2u);
    }

    return 0LL;
  }

  if (![a3 isFileURL])
  {
    objc_super v11 = (os_log_s *)_NSFCLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138477827;
      id v15 = a3;
      uint64_t v12 = "NSFileCoordinator only handles URLs that use the file: scheme. This one does not:\n%{private}@";
LABEL_15:
      _os_log_impl(&dword_182EB1000, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v14, 0xCu);
    }

    return 0LL;
  }

  v6 = (void *)objc_msgSend((id)objc_msgSend(a3, "path"), "pathComponents");
  if (!v6)
  {
    objc_super v11 = (os_log_s *)_NSFCLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138477827;
      id v15 = a3;
      uint64_t v12 = "NSFileCoordinator does not handle NSURLs that return nil when sent -path, like this one:\n%{private}@";
      goto LABEL_15;
    }

    return 0LL;
  }

  v7 = v6;
  uint64_t v8 = [v6 count];
  if (!v8
    || (uint64_t v9 = v8, !objc_msgSend( (id)objc_msgSend(v7, "objectAtIndex:", 0),  "isEqualToString:",  @"/")))
  {
    objc_super v11 = (os_log_s *)_NSFCLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138477827;
      id v15 = a3;
      uint64_t v12 = "NSFileCoordinator does not handle NSURLs that return relative paths when sent -path, like this one:\n"
            "%{private}@";
      goto LABEL_15;
    }

    return 0LL;
  }

  a4->location = 1LL;
  a4->length = v9 - 1;
  return v7;
}

- (void)setChild:(id)a3 forName:(id)a4 normalizedName:(id)a5
{
  childrenByNormalizedName = self->_childrenByNormalizedName;
  if (childrenByNormalizedName)
  {
    uint64_t v9 = (void *)-[NSMutableDictionary objectForKey:](childrenByNormalizedName, "objectForKey:", a5, a4);
    if (v9) {
      BOOL v10 = v9 == a3;
    }
    else {
      BOOL v10 = 1;
    }
    if (!v10) {
      v9[1] = 0LL;
    }
  }

  else
  {
    self->_childrenByNormalizedName = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  }

  -[NSMutableDictionary setObject:forKey:](self->_childrenByNormalizedName, "setObject:forKey:", a3, a5);

  self->_lastRequestedChildName = 0LL;
  self->_lastRequestedChild = 0LL;
}

- (void)removeChildForNormalizedName:(id)a3
{
  uint64_t v5 = -[NSMutableDictionary objectForKey:](self->_childrenByNormalizedName, "objectForKey:");
  if (v5)
  {
    if (*(NSFileAccessNode **)(v5 + 8) == self) {
      *(void *)(v5 + 8) = 0LL;
    }
    -[NSMutableDictionary removeObjectForKey:](self->_childrenByNormalizedName, "removeObjectForKey:", a3);
  }

  self->_lastRequestedChildName = 0LL;
  self->_lastRequestedChild = 0LL;
  -[NSFileAccessNode removeSelfIfUseless](self, "removeSelfIfUseless");
}

- (void)removeSelfIfUseless
{
  if (!self->_symbolicLinkDestination
    && !self->_symbolicLinkReferenceCount
    && !-[NSMutableDictionary count](self->_childrenByNormalizedName, "count")
    && !self->_presenterOrPresenters
    && !self->_provider
    && !self->_accessClaimOrClaims
    && !self->_isArbitrationBoundary
    && !self->_progressPublisherOrPublishers
    && !self->_progressSubscriberOrSubscribers)
  {
    -[NSFileAccessNode removeChildForNormalizedName:]( self->_parent,  "removeChildForNormalizedName:",  self->_normalizedName);
  }

- (id)normalizationOfChildName:(id)a3
{
  return a3;
}

- (id)descendantAtPath:(id)a3 componentRange:(_NSRange)a4 create:(BOOL)a5
{
  return -[NSFileAccessNode descendantAtPath:componentRange:forAddingLeafNode:create:]( self,  "descendantAtPath:componentRange:forAddingLeafNode:create:",  a3,  a4.location,  a4.length,  0LL,  a5);
}

- (id)descendantAtPath:(id)a3 componentRange:(_NSRange)a4 forAddingLeafNode:(id)a5 create:(BOOL)a6
{
  if (!a4.length) {
    goto LABEL_13;
  }
  BOOL v7 = a6;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v12 = _canonicalStringRepresentation([a3 objectAtIndex:a4.location]);
  id v13 = -[NSFileAccessNode normalizationOfChildName:](self, "normalizationOfChildName:", v12);
  uint64_t v14 = -[NSMutableDictionary objectForKey:](self->_childrenByNormalizedName, "objectForKey:", v13);
  if (v14)
  {
    if (*(void *)(v14 + 32)) {
      id v15 = *(NSFileAccessNode **)(v14 + 32);
    }
    else {
      id v15 = (NSFileAccessNode *)v14;
    }
    if (v15 != a5) {
      goto LABEL_9;
    }
    id v16 = a5;
  }

  id v15 = 0LL;
LABEL_9:
  if (!v15 && v7)
  {
    id v15 = -[NSFileAccessNode initWithParent:name:normalizedName:]( objc_alloc(&OBJC_CLASS___NSFileAccessNode),  "initWithParent:name:normalizedName:",  self,  v12,  v13);
    -[NSFileAccessNode setChild:forName:normalizedName:]( self,  "setChild:forName:normalizedName:",  v15,  v12,  v15->_normalizedName);
  }

  self = -[NSFileAccessNode descendantAtPath:componentRange:forAddingLeafNode:create:]( v15,  "descendantAtPath:componentRange:forAddingLeafNode:create:",  a3,  location + 1,  length - 1,  a5,  v7);
LABEL_13:
  if (self && self->_symbolicLinkIsFirmlink) {
    self = self->_symbolicLinkDestination;
  }
  return self;
}

- (id)childForRange:(_NSRange)a3 ofPath:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (a3.length == 2)
  {
    if ([a4 characterAtIndex:a3.location] == 46
      && [a4 characterAtIndex:location + 1] == 46)
    {
      return self->_parent;
    }
  }

  else if (a3.length == 1 && [a4 characterAtIndex:a3.location] == 46)
  {
    return self;
  }

  lastRequestedChildName = self->_lastRequestedChildName;
  if (lastRequestedChildName
    && !objc_msgSend(a4, "compare:options:range:", lastRequestedChildName, 2, location, length))
  {
    return self->_lastRequestedChild;
  }

  uint64_t v9 = (void *)objc_msgSend(a4, "substringWithRange:", location, length);
  id v10 = -[NSFileAccessNode normalizationOfChildName:](self, "normalizationOfChildName:", v9);
  objc_super v11 = (NSFileAccessNode *)-[NSMutableDictionary objectForKey:](self->_childrenByNormalizedName, "objectForKey:", v10);
  if (!v11)
  {
    objc_super v11 = -[NSFileAccessNode initWithParent:name:normalizedName:]( objc_alloc(&OBJC_CLASS___NSFileAccessNode),  "initWithParent:name:normalizedName:",  self,  v9,  v10);
    -[NSFileAccessNode setChild:forName:normalizedName:]( self,  "setChild:forName:normalizedName:",  v11,  v9,  v11->_normalizedName);
  }

  self->_lastRequestedChildName = (NSString *)v9;
  self->_lastRequestedChild = v11;
  return v11;
}

- (id)descendantForFileURL:(id)a3
{
  uint64_t v4 = self;
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (!-[NSString isEqualToString:](self->_normalizedName, "isEqualToString:", @"/"))
  {
    NSLog((NSString *)@"[NSFileAccessNode pathToDescendantForFileURL:componentRange:] was invoked in a surprising way.");
    return 0LL;
  }

  if (![a3 isFileURL])
  {
    id v16 = (os_log_s *)_NSFCLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138477827;
      id v20 = a3;
      v17 = "NSFileCoordinator only handles URLs that use the file: scheme. This one does not:\n%{private}@";
LABEL_27:
      _os_log_impl(&dword_182EB1000, v16, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v19, 0xCu);
    }

    return 0LL;
  }

  uint64_t v5 = (void *)_canonicalStringRepresentation([a3 path]);
  if (!v5)
  {
    id v16 = (os_log_s *)_NSFCLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138477827;
      id v20 = a3;
      v17 = "NSFileCoordinator does not handle NSURLs that return nil when sent -path, like this one:\n%{private}@";
      goto LABEL_27;
    }

    return 0LL;
  }

  v6 = v5;
  uint64_t v7 = [v5 length];
  if (!v7 || (uint64_t v8 = v7, [v6 characterAtIndex:0] != 47))
  {
    id v16 = (os_log_s *)_NSFCLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138477827;
      id v20 = a3;
      v17 = "NSFileCoordinator does not handle NSURLs that return relative or empty paths when sent -path, like this one:\n%{private}@";
      goto LABEL_27;
    }

    return 0LL;
  }

  uint64_t v9 = v8 - 1;
  if (v8 != 1)
  {
    uint64_t v10 = 1LL;
    while (1)
    {
      if (v4->_symbolicLinkDestination) {
        uint64_t v4 = v4->_symbolicLinkDestination;
      }
      uint64_t v11 = objc_msgSend(v6, "rangeOfString:options:range:", @"/", 0, v10, v9);
      if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      uint64_t v13 = v11;
      uint64_t v14 = v12;
      if (v11 != v10) {
        uint64_t v4 = -[NSFileAccessNode childForRange:ofPath:](v4, "childForRange:ofPath:", v10, v11 - v10, v6);
      }
      uint64_t v10 = v13 + v14;
      uint64_t v9 = v8 - (v13 + v14);
      if (v4) {
        BOOL v15 = v8 == v13 + v14;
      }
      else {
        BOOL v15 = 1;
      }
      if (v15)
      {
        if (v4) {
          goto LABEL_31;
        }
        return v4;
      }
    }

    uint64_t v4 = -[NSFileAccessNode childForRange:ofPath:](v4, "childForRange:ofPath:", v10, v9, v6);
    if (!v4) {
      return v4;
    }
  }

- (id)pathFromAncestor:(id)a3
{
  if (self == a3) {
    return (id)[MEMORY[0x189603F18] array];
  }
  parent = self->_parent;
  if (parent) {
    return (id)objc_msgSend( -[NSFileAccessNode pathFromAncestor:](parent, "pathFromAncestor:"),  "arrayByAddingObject:",  self->_name);
  }
  else {
    return (id)[MEMORY[0x189603F18] arrayWithObject:self->_name];
  }
}

- (void)setParent:(id)a3 name:(id)a4
{
  id v7 = -[NSFileAccessNode normalizationOfChildName:](self, "normalizationOfChildName:", a4);
  [a3 setChild:self forName:a4 normalizedName:v7];
  -[NSFileAccessNode removeChildForNormalizedName:]( self->_parent,  "removeChildForNormalizedName:",  self->_normalizedName);
  name = self->_name;
  if (name != a4)
  {

    self->_name = (NSString *)[a4 copy];
    self->_normalizedName = (NSString *)v7;
    self->_isFilePackageIsFigured = 0;
  }

  self->_parent = (NSFileAccessNode *)a3;
}

- (BOOL)itemIsFilePackage
{
  if (!self->_isFilePackageIsFigured)
  {
    objc_super v3 = -[NSString pathExtension](self->_name, "pathExtension");
    if (-[NSString rangeOfString:options:](v3, "rangeOfString:options:", @"weakpkg", 1LL) == 0x7FFFFFFFFFFFFFFFLL)
    {
      self->_isFilePackage = 0;
      parent = self->_parent;
      if (!parent
        || !-[NSString isEqualToString:](parent->_normalizedName, "isEqualToString:", @"volumes")
        || (uint64_t v5 = self->_parent->_parent) == 0LL
        || !-[NSString isEqualToString:](v5->_normalizedName, "isEqualToString:", @"/"))
      {
        if (-[NSString length](v3, "length"))
        {
          if (qword_18C497220 != -1) {
            dispatch_once(&qword_18C497220, &__block_literal_global_78);
          }
          uint64_t v6 = _MergedGlobals_149(qword_18C497210, v3, 0LL);
          if (v6)
          {
            id v7 = (const void *)v6;
            self->_isFilePackage = off_18C497208(v6, qword_18C497218) != 0;
            CFRelease(v7);
          }
        }
      }
    }

    else
    {
      self->_isFilePackage = 1;
    }

    self->_isFilePackageIsFigured = 1;
  }

  return self->_isFilePackage;
}

void __37__NSFileAccessNode_itemIsFilePackage__block_invoke()
{
  v0 = dlopen("/System/Library/Frameworks/MobileCoreServices.framework/MobileCoreServices", 256);
  if (v0)
  {
    v1 = v0;
    _MergedGlobals_149 = (uint64_t (*)(void, void, void))dlsym( v0,  "UTTypeCreatePreferredIdentifierForTag");
    off_18C497208 = (uint64_t (*)(void, void))dlsym(v1, "UTTypeConformsTo");
    qword_18C497210 = *(void *)dlsym(v1, "kUTTagClassFilenameExtension");
    uint64_t v2 = *(void *)dlsym(v1, "kUTTypePackage");
    qword_18C497218 = v2;
    if (_MergedGlobals_149) {
      BOOL v3 = off_18C497208 == 0LL;
    }
    else {
      BOOL v3 = 1;
    }
    if (v3 || qword_18C497210 == 0 || v2 == 0) {
      NSLog((NSString *)@"[NSFileAccessNode itemIsFilePackage] couldn't load a MobileCoreServices symbol.");
    }
  }

- (id)biggestFilePackageLocation
{
  if (!self) {
    return 0LL;
  }
  uint64_t v2 = self;
  BOOL v3 = 0LL;
  do
  {
    if (-[NSFileAccessNode itemIsFilePackage](v2, "itemIsFilePackage")) {
      BOOL v3 = v2;
    }
    uint64_t v2 = v2->_parent;
  }

  while (v2);
  return v3;
}

- (void)forEachDescendantPerformProcedure:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  childrenByNormalizedName = self->_childrenByNormalizedName;
  uint64_t v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( childrenByNormalizedName,  "countByEnumeratingWithState:objects:count:",  &v12,  v11,  16LL);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(childrenByNormalizedName);
        }
        uint64_t v10 = (void *)-[NSMutableDictionary objectForKey:]( self->_childrenByNormalizedName,  "objectForKey:",  *(void *)(*((void *)&v12 + 1) + 8 * i));
        (*((void (**)(id, void *))a3 + 2))(a3, v10);
        [v10 forEachDescendantPerformProcedure:a3];
      }

      uint64_t v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( childrenByNormalizedName,  "countByEnumeratingWithState:objects:count:",  &v12,  v11,  16LL);
    }

    while (v7);
  }

- (void)forEachAccessClaimOnItemPerformProcedure:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (_NSIsNSSet())
  {
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    id accessClaimOrClaims = self->_accessClaimOrClaims;
    uint64_t v6 = [accessClaimOrClaims countByEnumeratingWithState:&v11 objects:v10 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (uint64_t i = 0LL; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(accessClaimOrClaims);
          }
          (*((void (**)(id, void))a3 + 2))(a3, *(void *)(*((void *)&v11 + 1) + 8 * i));
        }

        uint64_t v7 = [accessClaimOrClaims countByEnumeratingWithState:&v11 objects:v10 count:16];
      }

      while (v7);
    }
  }

  else if (self->_accessClaimOrClaims)
  {
    (*((void (**)(id))a3 + 2))(a3);
  }

- (void)_forEachRelevantAccessClaimExcludingClaimsFromSuperarbiter:(BOOL)a3 performProcedure:(id)a4
{
  uint64_t v6 = self;
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t v7 = -[NSFileAccessNode biggestFilePackageLocation](self->_parent, "biggestFilePackageLocation");
  if (v7) {
    uint64_t v6 = v7;
  }
  parent = v6->_parent;
  for (uint64_t i = MEMORY[0x1895F87A8]; parent; parent = parent->_parent)
  {
    v12[0] = i;
    v12[1] = 3221225472LL;
    v12[2] = __96__NSFileAccessNode__forEachRelevantAccessClaimExcludingClaimsFromSuperarbiter_performProcedure___block_invoke;
    v12[3] = &unk_189CA5198;
    BOOL v13 = a3;
    v12[4] = a4;
    -[NSFileAccessNode forEachAccessClaimOnItemPerformProcedure:]( parent,  "forEachAccessClaimOnItemPerformProcedure:",  v12);
  }

  v10[0] = i;
  v10[1] = 3221225472LL;
  v10[2] = __96__NSFileAccessNode__forEachRelevantAccessClaimExcludingClaimsFromSuperarbiter_performProcedure___block_invoke_2;
  v10[3] = &unk_189CA51C0;
  BOOL v11 = a3;
  v10[4] = a4;
  -[NSFileAccessNode forEachAccessClaimOnItemOrContainedItemPerformProcedure:]( v6,  "forEachAccessClaimOnItemOrContainedItemPerformProcedure:",  v10);
}

uint64_t __96__NSFileAccessNode__forEachRelevantAccessClaimExcludingClaimsFromSuperarbiter_performProcedure___block_invoke( uint64_t a1,  void *a2)
{
  if (!*(_BYTE *)(a1 + 40)) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
  uint64_t result = [a2 cameFromSuperarbiter];
  if ((result & 1) == 0) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
  return result;
}

uint64_t __96__NSFileAccessNode__forEachRelevantAccessClaimExcludingClaimsFromSuperarbiter_performProcedure___block_invoke_2( uint64_t a1,  void *a2)
{
  if (!*(_BYTE *)(a1 + 40)) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
  uint64_t result = [a2 cameFromSuperarbiter];
  if ((result & 1) == 0) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
  return result;
}

- (void)forEachRelevantAccessClaimForEvaluatingAgainstClaim:(id)a3 performProcedure:(id)a4
{
}

- (void)forEachRelevantAccessClaimPerformProcedure:(id)a3
{
}

- (void)forEachReactorToItemOrContainedItemPerformProcedure:(id)a3
{
  v5[5] = *MEMORY[0x1895F89C0];
  if (self->_provider) {
    (*((void (**)(id))a3 + 2))(a3);
  }
  -[NSFileAccessNode forEachPresenterOfItemPerformProcedure:](self, "forEachPresenterOfItemPerformProcedure:", a3);
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __72__NSFileAccessNode_forEachReactorToItemOrContainedItemPerformProcedure___block_invoke;
  v5[3] = &unk_189CA51E8;
  v5[4] = a3;
  -[NSFileAccessNode forEachDescendantPerformProcedure:](self, "forEachDescendantPerformProcedure:", v5);
}

uint64_t __72__NSFileAccessNode_forEachReactorToItemOrContainedItemPerformProcedure___block_invoke( uint64_t a1,  void *a2)
{
  if (a2[8]) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
  return [a2 forEachPresenterOfItemPerformProcedure:*(void *)(a1 + 32)];
}

- (id)itemProvider
{
  if (!self) {
    return 0LL;
  }
  while (1)
  {
    provider = self->_provider;
    if (provider) {
      break;
    }
    self = self->_parent;
    if (!self) {
      return 0LL;
    }
  }

  return provider;
}

- (void)forEachPresenterOfContainingFilePackagePerformProcedure:(id)a3
{
  v6[6] = *MEMORY[0x1895F89C0];
  parent = self->_parent;
  if (parent)
  {
    uint64_t v5 = MEMORY[0x1895F87A8];
    do
    {
      if (-[NSFileAccessNode itemIsFilePackage](parent, "itemIsFilePackage"))
      {
        v6[0] = v5;
        v6[1] = 3221225472LL;
        v6[2] = __76__NSFileAccessNode_forEachPresenterOfContainingFilePackagePerformProcedure___block_invoke;
        v6[3] = &unk_189CA5210;
        v6[4] = parent;
        v6[5] = a3;
        -[NSFileAccessNode forEachPresenterOfItemPerformProcedure:]( parent,  "forEachPresenterOfItemPerformProcedure:",  v6);
      }

      parent = parent->_parent;
    }

    while (parent);
  }

uint64_t __76__NSFileAccessNode_forEachPresenterOfContainingFilePackagePerformProcedure___block_invoke( uint64_t a1,  uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  a2,  *(void *)(a1 + 32));
}

- (void)forEachPresenterOfItemPerformProcedure:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (_NSIsNSSet())
  {
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    id presenterOrPresenters = self->_presenterOrPresenters;
    uint64_t v6 = [presenterOrPresenters countByEnumeratingWithState:&v11 objects:v10 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (uint64_t i = 0LL; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(presenterOrPresenters);
          }
          (*((void (**)(id, void))a3 + 2))(a3, *(void *)(*((void *)&v11 + 1) + 8 * i));
        }

        uint64_t v7 = [presenterOrPresenters countByEnumeratingWithState:&v11 objects:v10 count:16];
      }

      while (v7);
    }
  }

  else if (self->_presenterOrPresenters)
  {
    (*((void (**)(id))a3 + 2))(a3);
  }

- (void)forEachPresenterOfContainedItemPerformProcedure:(id)a3
{
  v3[5] = *MEMORY[0x1895F89C0];
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __68__NSFileAccessNode_forEachPresenterOfContainedItemPerformProcedure___block_invoke;
  v3[3] = &unk_189CA51E8;
  v3[4] = a3;
  -[NSFileAccessNode forEachDescendantPerformProcedure:](self, "forEachDescendantPerformProcedure:", v3);
}

uint64_t __68__NSFileAccessNode_forEachPresenterOfContainedItemPerformProcedure___block_invoke( uint64_t a1,  void *a2)
{
  v3[5] = *MEMORY[0x1895F89C0];
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __68__NSFileAccessNode_forEachPresenterOfContainedItemPerformProcedure___block_invoke_2;
  v3[3] = &unk_189CA3900;
  v3[4] = *(void *)(a1 + 32);
  return [a2 forEachPresenterOfItemPerformProcedure:v3];
}

uint64_t __68__NSFileAccessNode_forEachPresenterOfContainedItemPerformProcedure___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)forEachPresenterOfItemOrContainedItemPerformProcedure:(id)a3
{
}

- (void)forEachPresenterOfItemOrContainingItemPerformProcedure:(id)a3
{
  v6[6] = *MEMORY[0x1895F89C0];
  if (self)
  {
    uint64_t v4 = self;
    uint64_t v5 = MEMORY[0x1895F87A8];
    do
    {
      v6[0] = v5;
      v6[1] = 3221225472LL;
      v6[2] = __75__NSFileAccessNode_forEachPresenterOfItemOrContainingItemPerformProcedure___block_invoke;
      v6[3] = &unk_189CA5210;
      v6[4] = v4;
      v6[5] = a3;
      -[NSFileAccessNode forEachPresenterOfItemPerformProcedure:](v4, "forEachPresenterOfItemPerformProcedure:", v6);
      uint64_t v4 = v4->_parent;
    }

    while (v4);
  }

uint64_t __75__NSFileAccessNode_forEachPresenterOfItemOrContainingItemPerformProcedure___block_invoke( uint64_t a1,  uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  a2,  *(void *)(a1 + 32));
}

- (void)forEachPresenterOfContainingItemPerformProcedure:(id)a3
{
  v6[5] = *MEMORY[0x1895F89C0];
  parent = self->_parent;
  if (parent)
  {
    uint64_t v5 = MEMORY[0x1895F87A8];
    do
    {
      v6[0] = v5;
      v6[1] = 3221225472LL;
      v6[2] = __69__NSFileAccessNode_forEachPresenterOfContainingItemPerformProcedure___block_invoke;
      v6[3] = &unk_189CA3900;
      v6[4] = a3;
      -[NSFileAccessNode forEachPresenterOfItemPerformProcedure:](parent, "forEachPresenterOfItemPerformProcedure:", v6);
      parent = parent->_parent;
    }

    while (parent);
  }

uint64_t __69__NSFileAccessNode_forEachPresenterOfContainingItemPerformProcedure___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)forEachAccessClaimOnItemOrContainedItemPerformProcedure:(id)a3
{
  v7[6] = *MEMORY[0x1895F89C0];
  uint64_t v5 = MEMORY[0x1895F87A8];
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __76__NSFileAccessNode_forEachAccessClaimOnItemOrContainedItemPerformProcedure___block_invoke;
  v7[3] = &unk_189CA5238;
  v7[4] = self;
  v7[5] = a3;
  -[NSFileAccessNode forEachAccessClaimOnItemPerformProcedure:](self, "forEachAccessClaimOnItemPerformProcedure:", v7);
  v6[0] = v5;
  v6[1] = 3221225472LL;
  v6[2] = __76__NSFileAccessNode_forEachAccessClaimOnItemOrContainedItemPerformProcedure___block_invoke_2;
  v6[3] = &unk_189CA51E8;
  v6[4] = a3;
  -[NSFileAccessNode forEachDescendantPerformProcedure:](self, "forEachDescendantPerformProcedure:", v6);
}

uint64_t __76__NSFileAccessNode_forEachAccessClaimOnItemOrContainedItemPerformProcedure___block_invoke( uint64_t a1,  uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  a2,  *(void *)(a1 + 32));
}

uint64_t __76__NSFileAccessNode_forEachAccessClaimOnItemOrContainedItemPerformProcedure___block_invoke_2( uint64_t a1,  void *a2)
{
  v4[6] = *MEMORY[0x1895F89C0];
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __76__NSFileAccessNode_forEachAccessClaimOnItemOrContainedItemPerformProcedure___block_invoke_3;
  v4[3] = &unk_189CA5238;
  uint64_t v2 = *(void *)(a1 + 32);
  v4[4] = a2;
  v4[5] = v2;
  return [a2 forEachAccessClaimOnItemPerformProcedure:v4];
}

uint64_t __76__NSFileAccessNode_forEachAccessClaimOnItemOrContainedItemPerformProcedure___block_invoke_3( uint64_t a1,  uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  a2,  *(void *)(a1 + 32));
}

- (void)setArbitrationBoundary
{
  self->_isArbitrationBoundary = 1;
}

- (BOOL)itemIsSubarbitrable
{
  if (!self) {
    return 0;
  }
  do
  {
    BOOL isArbitrationBoundary = self->_isArbitrationBoundary;
    if (self->_isArbitrationBoundary) {
      break;
    }
    self = self->_parent;
  }

  while (self);
  return isArbitrationBoundary;
}

- (BOOL)itemIsItemAtLocation:(id)a3
{
  if (a3 == self) {
    goto LABEL_5;
  }
  id v4 = -[NSFileAccessNode biggestFilePackageLocation](self, "biggestFilePackageLocation");
  if (v4)
  {
    if (v4 != a3)
    {
      LOBYTE(v4) = [a3 itemIsInItemAtLocation:v4];
      return (char)v4;
    }

- (BOOL)itemIsInItemAtLocation:(id)a3
{
  do
    self = self->_parent;
  while (self != a3 && self != 0LL);
  return self != 0LL;
}

- (void)addPresenter:(id)a3
{
  if (self->_presenterOrPresenters)
  {
    if (_NSIsNSSet())
    {
      [self->_presenterOrPresenters addObject:a3];
    }

    else
    {
      id presenterOrPresenters = self->_presenterOrPresenters;
      self->_id presenterOrPresenters = (id)objc_msgSend( objc_alloc(MEMORY[0x189603FE0]),  "initWithObjects:",  presenterOrPresenters,  a3,  0);
    }
  }

  else
  {
    self->_id presenterOrPresenters = a3;
  }

- (void)removePresenter:(id)a3
{
  id presenterOrPresenters = a3;
  if (self->_presenterOrPresenters == a3) {
    goto LABEL_5;
  }
  if (_NSIsNSSet())
  {
    [self->_presenterOrPresenters removeObject:presenterOrPresenters];
    if (![self->_presenterOrPresenters count])
    {
      id presenterOrPresenters = self->_presenterOrPresenters;
LABEL_5:

      self->_id presenterOrPresenters = 0LL;
    }
  }

  -[NSFileAccessNode removeSelfIfUseless](self, "removeSelfIfUseless");
}

- (BOOL)setProvider:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (!a3)
  {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"NSFileAccessNode.m",  881LL,  @"Invalid parameter not satisfying: %@",  @"inProvider != nil");
    goto LABEL_14;
  }

  provider = self->_provider;
  if (provider == a3)
  {
LABEL_14:
    BOOL v8 = 0;
    goto LABEL_15;
  }

  if (!provider
    || (uint64_t v6 = -[NSFileProviderProxy secureID](provider, "secureID"),
        uint64_t v7 = (void *)[a3 secureID],
        ([v7 isEqualToString:v6] & 1) != 0)
    || (!v6 ? (BOOL v9 = v7 == 0LL) : (BOOL v9 = 1), !v9 || _NSFCIP))
  {
    -[NSFileProviderProxy setItemLocation:](self->_provider, "setItemLocation:", 0LL);

    self->_provider = (NSFileProviderProxy *)a3;
    BOOL v8 = 1;
  }

  else
  {
    uint64_t v10 = (os_log_s *)_NSFCProviderLog();
    BOOL v8 = 0;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = objc_msgSend(-[NSFileReactorProxy client](self->_provider, "client"), "processIdentifier");
      *(_DWORD *)buf = 67109376;
      int v14 = v11;
      __int16 v15 = 1024;
      int v16 = objc_msgSend((id)objc_msgSend(a3, "client"), "processIdentifier");
      _os_log_impl( &dword_182EB1000,  v10,  OS_LOG_TYPE_DEFAULT,  "[NSFileAccessNode setProvider:] was invoked for a node that already has a provider (pid %d). Ignoring the new one (pid %d).",  buf,  0xEu);
      goto LABEL_14;
    }
  }

- (void)removeProvider:(id)a3
{
  if (self->_provider == a3)
  {

    self->_provider = 0LL;
  }

- (void)addAccessClaim:(id)a3
{
  if (self->_accessClaimOrClaims)
  {
    if (_NSIsNSSet())
    {
      [self->_accessClaimOrClaims addObject:a3];
    }

    else
    {
      id accessClaimOrClaims = self->_accessClaimOrClaims;
      self->_id accessClaimOrClaims = -[NSCountedSet initWithObjects:]( objc_alloc(&OBJC_CLASS___NSCountedSet),  "initWithObjects:",  accessClaimOrClaims,  a3,  0LL);
    }
  }

  else
  {
    self->_id accessClaimOrClaims = a3;
  }

- (void)removeAccessClaim:(id)a3
{
  id accessClaimOrClaims = a3;
  if (self->_accessClaimOrClaims == a3) {
    goto LABEL_5;
  }
  if (_NSIsNSSet())
  {
    [self->_accessClaimOrClaims removeObject:accessClaimOrClaims];
    if (![self->_accessClaimOrClaims count])
    {
      id accessClaimOrClaims = self->_accessClaimOrClaims;
LABEL_5:

      self->_id accessClaimOrClaims = 0LL;
    }
  }

  -[NSFileAccessNode removeSelfIfUseless](self, "removeSelfIfUseless");
}

- (id)url
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  uint64_t v2 = +[NSString pathWithComponents:]( &OBJC_CLASS___NSString,  "pathWithComponents:",  -[NSFileAccessNode pathFromAncestor:](self, "pathFromAncestor:", 0LL));
  BOOL v3 = (void *)[MEMORY[0x189604030] fileURLWithPath:v2];
  if (!v3)
  {
    id v4 = (os_log_s *)_NSFCLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_182EB1000, v4, OS_LOG_TYPE_DEFAULT, "-[NSFileAccessNode url] is returning nil.", v6, 2u);
    }
  }

  return v3;
}

- (id)pathExceptPrivate
{
  if (!self->_parent) {
    return (id)[MEMORY[0x189603F18] arrayWithObject:self->_name];
  }
  BOOL v3 = -[NSString isEqualToString:](self->_name, "isEqualToString:", @"private");
  parent = self->_parent;
  BOOL v5 = !v3 || parent == 0LL;
  if (v5 || parent->_parent) {
    return (id)objc_msgSend( -[NSFileAccessNode pathExceptPrivate](parent, "pathExceptPrivate"),  "arrayByAddingObject:",  self->_name);
  }
  else {
    return -[NSFileAccessNode pathExceptPrivate](parent, "pathExceptPrivate");
  }
}

- (id)standardizedURL
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  uint64_t v2 = +[NSString pathWithComponents:]( &OBJC_CLASS___NSString,  "pathWithComponents:",  -[NSFileAccessNode pathExceptPrivate](self, "pathExceptPrivate"));
  BOOL v3 = (void *)[MEMORY[0x189604030] fileURLWithPath:v2];
  if (!v3)
  {
    id v4 = (os_log_s *)_NSFCLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl( &dword_182EB1000,  v4,  OS_LOG_TYPE_DEFAULT,  "-[NSFileAccessNode standardizedURL] is returning nil.",  v6,  2u);
    }
  }

  return v3;
}

- (id)name
{
  return self->_name;
}

- (id)urlOfSubitemAtPath:(id)a3 plusPath:(id)a4
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v6 = -[NSFileAccessNode pathFromAncestor:](self, "pathFromAncestor:", 0LL);
  uint64_t v7 = v6;
  if (a3) {
    uint64_t v7 = (void *)[v6 arrayByAddingObjectsFromArray:a3];
  }
  if (a4) {
    uint64_t v7 = (void *)[v7 arrayByAddingObjectsFromArray:a4];
  }
  BOOL v8 = +[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v7);
  BOOL v9 = (void *)[MEMORY[0x189604030] fileURLWithPath:v8];
  if (!v9)
  {
    uint64_t v10 = (os_log_s *)_NSFCLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 v12 = 0;
      _os_log_impl( &dword_182EB1000,  v10,  OS_LOG_TYPE_DEFAULT,  "-[NSFileAccessNode urlOfSubitemAtPath:plusPath:] is returning nil.",  v12,  2u);
    }
  }

  return v9;
}

- (void)addProgressPublisher:(id)a3
{
  if (self->_progressPublisherOrPublishers)
  {
    if (_NSIsNSSet())
    {
      [self->_progressPublisherOrPublishers addObject:a3];
    }

    else
    {
      id progressPublisherOrPublishers = self->_progressPublisherOrPublishers;
      self->_id progressPublisherOrPublishers = (id)objc_msgSend( objc_alloc(MEMORY[0x189603FE0]),  "initWithObjects:",  progressPublisherOrPublishers,  a3,  0);
    }
  }

  else
  {
    self->_id progressPublisherOrPublishers = a3;
  }

- (void)removeProgressPublisher:(id)a3
{
  id progressPublisherOrPublishers = a3;
  if (self->_progressPublisherOrPublishers == a3) {
    goto LABEL_5;
  }
  if (_NSIsNSSet())
  {
    [self->_progressPublisherOrPublishers removeObject:progressPublisherOrPublishers];
    if (![self->_progressPublisherOrPublishers count])
    {
      id progressPublisherOrPublishers = self->_progressPublisherOrPublishers;
LABEL_5:

      self->_id progressPublisherOrPublishers = 0LL;
    }
  }

  -[NSFileAccessNode removeSelfIfUseless](self, "removeSelfIfUseless");
}

- (void)addProgressSubscriber:(id)a3
{
  if (self->_progressSubscriberOrSubscribers)
  {
    if (_NSIsNSSet())
    {
      [self->_progressSubscriberOrSubscribers addObject:a3];
    }

    else
    {
      id progressSubscriberOrSubscribers = self->_progressSubscriberOrSubscribers;
      self->_id progressSubscriberOrSubscribers = (id)objc_msgSend( objc_alloc(MEMORY[0x189603FE0]),  "initWithObjects:",  progressSubscriberOrSubscribers,  a3,  0);
    }
  }

  else
  {
    self->_id progressSubscriberOrSubscribers = a3;
  }

- (void)removeProgressSubscriber:(id)a3
{
  id progressSubscriberOrSubscribers = a3;
  if (self->_progressSubscriberOrSubscribers == a3) {
    goto LABEL_5;
  }
  if (_NSIsNSSet())
  {
    [self->_progressSubscriberOrSubscribers removeObject:progressSubscriberOrSubscribers];
    if (![self->_progressSubscriberOrSubscribers count])
    {
      id progressSubscriberOrSubscribers = self->_progressSubscriberOrSubscribers;
LABEL_5:

      self->_id progressSubscriberOrSubscribers = 0LL;
    }
  }

  -[NSFileAccessNode removeSelfIfUseless](self, "removeSelfIfUseless");
}

- (void)forEachProgressPublisherOfItemPerformProcedure:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (_NSIsNSSet())
  {
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    id progressPublisherOrPublishers = self->_progressPublisherOrPublishers;
    uint64_t v6 = [progressPublisherOrPublishers countByEnumeratingWithState:&v11 objects:v10 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (uint64_t i = 0LL; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(progressPublisherOrPublishers);
          }
          (*((void (**)(id, void))a3 + 2))(a3, *(void *)(*((void *)&v11 + 1) + 8 * i));
        }

        uint64_t v7 = [progressPublisherOrPublishers countByEnumeratingWithState:&v11 objects:v10 count:16];
      }

      while (v7);
    }
  }

  else if (self->_progressPublisherOrPublishers)
  {
    (*((void (**)(id))a3 + 2))(a3);
  }

- (void)forEachProgressPublisherOfItemOrContainedItemPerformProcedure:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  -[NSFileAccessNode forEachProgressPublisherOfItemPerformProcedure:]( self,  "forEachProgressPublisherOfItemPerformProcedure:");
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  childrenByNormalizedName = self->_childrenByNormalizedName;
  uint64_t v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( childrenByNormalizedName,  "countByEnumeratingWithState:objects:count:",  &v11,  v10,  16LL);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(childrenByNormalizedName);
        }
        objc_msgSend( (id)-[NSMutableDictionary objectForKey:]( self->_childrenByNormalizedName,  "objectForKey:",  *(void *)(*((void *)&v11 + 1) + 8 * i)),  "forEachProgressPublisherOfItemPerformProcedure:",  a3);
      }

      uint64_t v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( childrenByNormalizedName,  "countByEnumeratingWithState:objects:count:",  &v11,  v10,  16LL);
    }

    while (v7);
  }

- (void)forEachProgressSubscriberOfItemPerformProcedure:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  BOOL v5 = (void *)MEMORY[0x186E1FF60](self, a2);
  if (_NSIsNSSet())
  {
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    id progressSubscriberOrSubscribers = self->_progressSubscriberOrSubscribers;
    uint64_t v7 = [progressSubscriberOrSubscribers countByEnumeratingWithState:&v12 objects:v11 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0LL; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(progressSubscriberOrSubscribers);
          }
          (*((void (**)(id, void))a3 + 2))(a3, *(void *)(*((void *)&v12 + 1) + 8 * i));
        }

        uint64_t v8 = [progressSubscriberOrSubscribers countByEnumeratingWithState:&v12 objects:v11 count:16];
      }

      while (v8);
    }
  }

  else if (self->_progressSubscriberOrSubscribers)
  {
    (*((void (**)(id))a3 + 2))(a3);
  }

  objc_autoreleasePoolPop(v5);
}

- (void)forEachProgressSubscriberOfItemOrContainingItemPerformProcedure:(id)a3
{
  uint64_t v5 = MEMORY[0x1895F87A8];
  v8[5] = *MEMORY[0x1895F89C0];
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __84__NSFileAccessNode_forEachProgressSubscriberOfItemOrContainingItemPerformProcedure___block_invoke;
  v8[3] = &unk_189CA5260;
  v8[4] = a3;
  -[NSFileAccessNode forEachProgressSubscriberOfItemPerformProcedure:]( self,  "forEachProgressSubscriberOfItemPerformProcedure:",  v8);
  parent = self->_parent;
  v7[0] = v5;
  v7[1] = 3221225472LL;
  v7[2] = __84__NSFileAccessNode_forEachProgressSubscriberOfItemOrContainingItemPerformProcedure___block_invoke_2;
  v7[3] = &unk_189CA5260;
  v7[4] = a3;
  -[NSFileAccessNode forEachProgressSubscriberOfItemPerformProcedure:]( parent,  "forEachProgressSubscriberOfItemPerformProcedure:",  v7);
}

uint64_t __84__NSFileAccessNode_forEachProgressSubscriberOfItemOrContainingItemPerformProcedure___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __84__NSFileAccessNode_forEachProgressSubscriberOfItemOrContainingItemPerformProcedure___block_invoke_2( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)forEachProgressThingOfItemOrContainedItemPerformProcedure:(id)a3
{
  void v8[6] = *MEMORY[0x1895F89C0];
  uint64_t v5 = MEMORY[0x1895F87A8];
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __78__NSFileAccessNode_forEachProgressThingOfItemOrContainedItemPerformProcedure___block_invoke;
  v8[3] = &unk_189CA5288;
  v8[4] = self;
  v8[5] = a3;
  -[NSFileAccessNode forEachProgressPublisherOfItemPerformProcedure:]( self,  "forEachProgressPublisherOfItemPerformProcedure:",  v8);
  v7[0] = v5;
  v7[1] = 3221225472LL;
  v7[2] = __78__NSFileAccessNode_forEachProgressThingOfItemOrContainedItemPerformProcedure___block_invoke_2;
  v7[3] = &unk_189CA52B0;
  v7[4] = self;
  void v7[5] = a3;
  -[NSFileAccessNode forEachProgressSubscriberOfItemPerformProcedure:]( self,  "forEachProgressSubscriberOfItemPerformProcedure:",  v7);
  v6[0] = v5;
  v6[1] = 3221225472LL;
  v6[2] = __78__NSFileAccessNode_forEachProgressThingOfItemOrContainedItemPerformProcedure___block_invoke_3;
  v6[3] = &unk_189CA51E8;
  v6[4] = a3;
  -[NSFileAccessNode forEachDescendantPerformProcedure:](self, "forEachDescendantPerformProcedure:", v6);
}

uint64_t __78__NSFileAccessNode_forEachProgressThingOfItemOrContainedItemPerformProcedure___block_invoke( uint64_t a1,  uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  a2,  *(void *)(a1 + 32));
}

uint64_t __78__NSFileAccessNode_forEachProgressThingOfItemOrContainedItemPerformProcedure___block_invoke_2( uint64_t a1,  uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  a2,  *(void *)(a1 + 32));
}

uint64_t __78__NSFileAccessNode_forEachProgressThingOfItemOrContainedItemPerformProcedure___block_invoke_3( uint64_t a1,  void *a2)
{
  v9[6] = *MEMORY[0x1895F89C0];
  uint64_t v4 = MEMORY[0x1895F87A8];
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __78__NSFileAccessNode_forEachProgressThingOfItemOrContainedItemPerformProcedure___block_invoke_4;
  v9[3] = &unk_189CA5288;
  uint64_t v5 = *(void *)(a1 + 32);
  v9[4] = a2;
  v9[5] = v5;
  [a2 forEachProgressPublisherOfItemPerformProcedure:v9];
  v8[0] = v4;
  v8[1] = 3221225472LL;
  v8[2] = __78__NSFileAccessNode_forEachProgressThingOfItemOrContainedItemPerformProcedure___block_invoke_5;
  v8[3] = &unk_189CA52B0;
  uint64_t v6 = *(void *)(a1 + 32);
  v8[4] = a2;
  v8[5] = v6;
  return [a2 forEachProgressSubscriberOfItemPerformProcedure:v8];
}

uint64_t __78__NSFileAccessNode_forEachProgressThingOfItemOrContainedItemPerformProcedure___block_invoke_4( uint64_t a1,  uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  a2,  *(void *)(a1 + 32));
}

uint64_t __78__NSFileAccessNode_forEachProgressThingOfItemOrContainedItemPerformProcedure___block_invoke_5( uint64_t a1,  uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  a2,  *(void *)(a1 + 32));
}

- (id)parent
{
  return self->_parent;
}

- (void)assertDead
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if (self)
  {
    uint64_t v2 = self;
    int v3 = 0;
    do
    {
      v3 |= -[NSString isEqualToString:](v2->_normalizedName, "isEqualToString:", @"/");
      uint64_t v2 = v2->_parent;
    }

    while (v2);
    if ((v3 & 1) != 0)
    {
      uint64_t v4 = (os_log_s *)_NSFCLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v5 = 0;
        _os_log_impl( &dword_182EB1000,  v4,  OS_LOG_TYPE_DEFAULT,  "[NSFileAccessNode assertDead] found a surprisingly live node.",  v5,  2u);
      }
    }
  }

- (void)assertLive
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if (!self) {
    goto LABEL_5;
  }
  uint64_t v2 = self;
  int v3 = 0;
  do
  {
    v3 |= -[NSString isEqualToString:](v2->_normalizedName, "isEqualToString:", @"/");
    uint64_t v2 = v2->_parent;
  }

  while (v2);
  if ((v3 & 1) == 0)
  {
LABEL_5:
    uint64_t v4 = (os_log_s *)_NSFCLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl( &dword_182EB1000,  v4,  OS_LOG_TYPE_DEFAULT,  "[NSFileAccessNode assertLive] found a surprisingly dead node.",  v5,  2u);
    }
  }

- (void)assertDescendantsLive
{
}

uint64_t __41__NSFileAccessNode_assertDescendantsLive__block_invoke(uint64_t a1, id *a2)
{
  return [a2 assertLive];
}

- (BOOL)_mayContainCriticalDebuggingInformationExcludingReactors:(BOOL)a3
{
  if (self->_accessClaimOrClaims || self->_isArbitrationBoundary) {
    return 1;
  }
  BOOL v6 = -[NSFileAccessNode itemIsFilePackage](self, "itemIsFilePackage");
  BOOL result = !a3 || v6;
  if (!a3 && !v6)
  {
    if (!self->_presenterOrPresenters) {
      return self->_provider != 0LL;
    }
    return 1;
  }

  return result;
}

- (id)_childrenExcludingExcessNodes:(BOOL)a3 excludingReactors:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v21 = *MEMORY[0x1895F89C0];
  uint64_t v7 = (void *)[MEMORY[0x189603FA8] array];
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  childrenByNormalizedName = self->_childrenByNormalizedName;
  uint64_t v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( childrenByNormalizedName,  "countByEnumeratingWithState:objects:count:",  &v17,  v16,  16LL);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0LL; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(childrenByNormalizedName);
        }
        __int128 v13 = (void *)-[NSMutableDictionary objectForKey:]( self->_childrenByNormalizedName,  "objectForKey:",  *(void *)(*((void *)&v17 + 1) + 8 * i));
        __int128 v14 = v13;
        if (v5 && ![v13 _mayContainCriticalDebuggingInformationExcludingReactors:v4]) {
          objc_msgSend( v7,  "addObjectsFromArray:",  objc_msgSend(v14, "_childrenExcludingExcessNodes:excludingReactors:", 1, v4));
        }
        else {
          [v7 addObject:v14];
        }
      }

      uint64_t v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( childrenByNormalizedName,  "countByEnumeratingWithState:objects:count:",  &v17,  v16,  16LL);
    }

    while (v10);
  }

  return v7;
}

- (id)descriptionWithIndenting:(id)a3 excludingExcessNodes:(BOOL)a4 excludingReactors:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v37 = a4;
  uint64_t v63 = *MEMORY[0x1895F89C0];
  uint64_t v8 = (void *)[a3 stringByAppendingString:@"    "];
  uint64_t v9 = +[NSString string](&OBJC_CLASS___NSMutableString, "string");
  -[NSString appendFormat:]( v9,  "appendFormat:",  @"%@<%@ %p> parent: %p, name: \"%@\"",  a3,  objc_opt_class(),  self,  self->_parent,  self->_name);
  if (self->_symbolicLinkDestination) {
    -[NSString appendFormat:](v9, "appendFormat:", @" (link target to node %p)", self->_symbolicLinkDestination);
  }
  if (self->_symbolicLinkReferenceCount) {
    -[NSString appendString:](v9, "appendString:", @" (a link destination)");
  }
  if (self->_isArbitrationBoundary) {
    -[NSString appendString:](v9, "appendString:", @" - an arbitration boundary");
  }
  if (self->_provider && !v5)
  {
    -[NSString appendFormat:](v9, "appendFormat:", @"\n%@provider:", a3);
    -[NSString appendFormat:]( v9,  "appendFormat:",  @"\n%@",  -[NSFileReactorProxy descriptionWithIndenting:](self->_provider, "descriptionWithIndenting:", v8));
  }

  if (self->_presenterOrPresenters && !v5)
  {
    -[NSString appendFormat:](v9, "appendFormat:", @"\n%@presenters:", a3);
    if (_NSIsNSSet())
    {
      __int128 v61 = 0u;
      __int128 v62 = 0u;
      __int128 v59 = 0u;
      __int128 v60 = 0u;
      id presenterOrPresenters = self->_presenterOrPresenters;
      uint64_t v11 = [presenterOrPresenters countByEnumeratingWithState:&v59 objects:v58 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v60;
        do
        {
          for (uint64_t i = 0LL; i != v12; ++i)
          {
            if (*(void *)v60 != v13) {
              objc_enumerationMutation(presenterOrPresenters);
            }
            -[NSString appendFormat:]( v9,  "appendFormat:",  @"\n%@",  [*(id *)(*((void *)&v59 + 1) + 8 * i) descriptionWithIndenting:v8]);
          }

          uint64_t v12 = [presenterOrPresenters countByEnumeratingWithState:&v59 objects:v58 count:16];
        }

        while (v12);
      }
    }

    else
    {
      -[NSString appendFormat:]( v9,  "appendFormat:",  @"\n%@",  [self->_presenterOrPresenters descriptionWithIndenting:v8]);
    }
  }

  if (self->_accessClaimOrClaims)
  {
    -[NSString appendFormat:](v9, "appendFormat:", @"\n%@access claims:", a3);
    if (_NSIsNSSet())
    {
      __int128 v56 = 0u;
      __int128 v57 = 0u;
      __int128 v54 = 0u;
      __int128 v55 = 0u;
      id accessClaimOrClaims = self->_accessClaimOrClaims;
      uint64_t v16 = [accessClaimOrClaims countByEnumeratingWithState:&v54 objects:v53 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v55;
        do
        {
          for (uint64_t j = 0LL; j != v17; ++j)
          {
            if (*(void *)v55 != v18) {
              objc_enumerationMutation(accessClaimOrClaims);
            }
            -[NSString appendFormat:]( v9,  "appendFormat:",  @"\n%@",  [*(id *)(*((void *)&v54 + 1) + 8 * j) descriptionWithIndenting:v8]);
          }

          uint64_t v17 = [accessClaimOrClaims countByEnumeratingWithState:&v54 objects:v53 count:16];
        }

        while (v17);
      }
    }

    else
    {
      -[NSString appendFormat:]( v9,  "appendFormat:",  @"\n%@",  [self->_accessClaimOrClaims descriptionWithIndenting:v8]);
    }
  }

  if (self->_progressSubscriberOrSubscribers)
  {
    -[NSString appendFormat:](v9, "appendFormat:", @"\n%@progress subscribers:", a3);
    if (_NSIsNSSet())
    {
      __int128 v51 = 0u;
      __int128 v52 = 0u;
      __int128 v49 = 0u;
      __int128 v50 = 0u;
      id progressSubscriberOrSubscribers = self->_progressSubscriberOrSubscribers;
      uint64_t v21 = [progressSubscriberOrSubscribers countByEnumeratingWithState:&v49 objects:v48 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v50;
        do
        {
          for (uint64_t k = 0LL; k != v22; ++k)
          {
            if (*(void *)v50 != v23) {
              objc_enumerationMutation(progressSubscriberOrSubscribers);
            }
            -[NSString appendFormat:]( v9,  "appendFormat:",  @"\n%@",  [*(id *)(*((void *)&v49 + 1) + 8 * k) descriptionWithIndenting:v8]);
          }

          uint64_t v22 = [progressSubscriberOrSubscribers countByEnumeratingWithState:&v49 objects:v48 count:16];
        }

        while (v22);
      }
    }

    else
    {
      -[NSString appendFormat:]( v9,  "appendFormat:",  @"\n%@",  [self->_progressSubscriberOrSubscribers descriptionWithIndenting:v8]);
    }
  }

  if (self->_progressPublisherOrPublishers)
  {
    -[NSString appendFormat:](v9, "appendFormat:", @"\n%@progress publishers:", a3);
    if (_NSIsNSSet())
    {
      __int128 v46 = 0u;
      __int128 v47 = 0u;
      __int128 v44 = 0u;
      __int128 v45 = 0u;
      id progressPublisherOrPublishers = self->_progressPublisherOrPublishers;
      uint64_t v26 = [progressPublisherOrPublishers countByEnumeratingWithState:&v44 objects:v43 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v45;
        do
        {
          for (uint64_t m = 0LL; m != v27; ++m)
          {
            if (*(void *)v45 != v28) {
              objc_enumerationMutation(progressPublisherOrPublishers);
            }
            -[NSString appendFormat:]( v9,  "appendFormat:",  @"\n%@",  [*(id *)(*((void *)&v44 + 1) + 8 * m) descriptionWithIndenting:v8]);
          }

          uint64_t v27 = [progressPublisherOrPublishers countByEnumeratingWithState:&v44 objects:v43 count:16];
        }

        while (v27);
      }
    }

    else
    {
      -[NSString appendFormat:]( v9,  "appendFormat:",  @"\n%@",  [self->_progressPublisherOrPublishers descriptionWithIndenting:v8]);
    }
  }

  id v30 = -[NSFileAccessNode _childrenExcludingExcessNodes:excludingReactors:]( self,  "_childrenExcludingExcessNodes:excludingReactors:",  v37,  v5);
  if ([v30 count])
  {
    -[NSString appendFormat:](v9, "appendFormat:", @"\n%@children:", a3);
    uint64_t v31 = [v8 stringByAppendingString:@"    "];
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    uint64_t v32 = [v30 countByEnumeratingWithState:&v39 objects:v38 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v40;
      do
      {
        for (uint64_t n = 0LL; n != v33; ++n)
        {
          if (*(void *)v40 != v34) {
            objc_enumerationMutation(v30);
          }
          -[NSString appendFormat:]( v9,  "appendFormat:",  @"\n%@%@\n%@",  v8,  *(void *)(*(void *)(*((void *)&v39 + 1) + 8 * n) + 24),  [*(id *)(*((void *)&v39 + 1) + 8 * n) descriptionWithIndenting:v31 excludingExcessNodes:v37 excludingReactors:v5]);
        }

        uint64_t v33 = [v30 countByEnumeratingWithState:&v39 objects:v38 count:16];
      }

      while (v33);
    }
  }

  return v9;
}

- (id)sensitiveDescription
{
  return -[NSFileAccessNode descriptionWithIndenting:excludingExcessNodes:excludingReactors:]( self,  "descriptionWithIndenting:excludingExcessNodes:excludingReactors:",  &stru_189CA6A28,  1LL,  0LL);
}

- (id)description
{
  return -[NSFileAccessNode descriptionWithIndenting:excludingExcessNodes:excludingReactors:]( self,  "descriptionWithIndenting:excludingExcessNodes:excludingReactors:",  &stru_189CA6A28,  0LL,  0LL);
}

- (id)sensitiveSubarbiterDescription
{
  return -[NSFileAccessNode descriptionWithIndenting:excludingExcessNodes:excludingReactors:]( self,  "descriptionWithIndenting:excludingExcessNodes:excludingReactors:",  &stru_189CA6A28,  0LL,  1LL);
}

- (id)subarbiterDescription
{
  return -[NSFileAccessNode descriptionWithIndenting:excludingExcessNodes:excludingReactors:]( self,  "descriptionWithIndenting:excludingExcessNodes:excludingReactors:",  &stru_189CA6A28,  1LL,  1LL);
}

@end