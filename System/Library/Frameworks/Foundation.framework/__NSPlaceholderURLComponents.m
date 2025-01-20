@interface __NSPlaceholderURLComponents
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (_NSRange)rangeOfFragment;
- (_NSRange)rangeOfHost;
- (_NSRange)rangeOfPassword;
- (_NSRange)rangeOfPath;
- (_NSRange)rangeOfPort;
- (_NSRange)rangeOfQuery;
- (_NSRange)rangeOfScheme;
- (_NSRange)rangeOfUser;
- (__NSPlaceholderURLComponents)init;
- (__NSPlaceholderURLComponents)initWithString:(id)a3;
- (__NSPlaceholderURLComponents)initWithString:(id)a3 encodingInvalidCharacters:(BOOL)a4;
- (__NSPlaceholderURLComponents)initWithURL:(id)a3 resolvingAgainstBaseURL:(BOOL)a4;
- (id)URL;
- (id)URLRelativeToURL:(id)a3;
- (id)encodedHost;
- (id)fragment;
- (id)host;
- (id)password;
- (id)path;
- (id)percentEncodedFragment;
- (id)percentEncodedHost;
- (id)percentEncodedPassword;
- (id)percentEncodedPath;
- (id)percentEncodedQuery;
- (id)percentEncodedQueryItems;
- (id)percentEncodedUser;
- (id)port;
- (id)query;
- (id)queryItems;
- (id)scheme;
- (id)string;
- (id)user;
- (unint64_t)retainCount;
- (void)setEncodedHost:(id)a3;
- (void)setFragment:(id)a3;
- (void)setHost:(id)a3;
- (void)setPassword:(id)a3;
- (void)setPath:(id)a3;
- (void)setPercentEncodedFragment:(id)a3;
- (void)setPercentEncodedHost:(id)a3;
- (void)setPercentEncodedPassword:(id)a3;
- (void)setPercentEncodedPath:(id)a3;
- (void)setPercentEncodedQuery:(id)a3;
- (void)setPercentEncodedQueryItems:(id)a3;
- (void)setPercentEncodedUser:(id)a3;
- (void)setPort:(id)a3;
- (void)setQuery:(id)a3;
- (void)setQueryItems:(id)a3;
- (void)setScheme:(id)a3;
- (void)setUser:(id)a3;
@end

@implementation __NSPlaceholderURLComponents

- (__NSPlaceholderURLComponents)init
{
  return (__NSPlaceholderURLComponents *)+[NSURLComponents _components](&OBJC_CLASS___NSURLComponents, "_components");
}

- (__NSPlaceholderURLComponents)initWithURL:(id)a3 resolvingAgainstBaseURL:(BOOL)a4
{
  if (a3) {
    return (__NSPlaceholderURLComponents *) +[NSURLComponents _componentsWithUrl:resolvingAgainstBaseURL:]( &OBJC_CLASS___NSURLComponents,  "_componentsWithUrl:resolvingAgainstBaseURL:",  a3,  a4);
  }
  v5 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: nil URL parameter", _NSMethodExceptionProem( (objc_class *)-[__NSPlaceholderURLComponents superclass](self, "superclass", 0, a4), a2)), 0 reason userInfo];
  objc_exception_throw(v5);
  return -[__NSPlaceholderURLComponents initWithString:](v6, v7, v8);
}

- (__NSPlaceholderURLComponents)initWithString:(id)a3
{
  if (a3) {
    return -[__NSPlaceholderURLComponents initWithString:encodingInvalidCharacters:]( self,  "initWithString:encodingInvalidCharacters:",  a3,  1LL);
  }
  v4 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: nil URLString parameter", _NSMethodExceptionProem( (objc_class *)-[__NSPlaceholderURLComponents superclass](self, "superclass"), a2)), 0 reason userInfo];
  objc_exception_throw(v4);
  return -[__NSPlaceholderURLComponents initWithString:encodingInvalidCharacters:](v5, v6, v7, v8);
}

- (__NSPlaceholderURLComponents)initWithString:(id)a3 encodingInvalidCharacters:(BOOL)a4
{
  if (a3) {
    return (__NSPlaceholderURLComponents *) +[NSURLComponents _componentsWithString:encodingInvalidCharacters:]( &OBJC_CLASS___NSURLComponents,  "_componentsWithString:encodingInvalidCharacters:",  a3,  a4);
  }
  v5 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: nil URLString parameter", _NSMethodExceptionProem( (objc_class *)-[__NSPlaceholderURLComponents superclass](self, "superclass", 0, a4), a2)), 0 reason userInfo];
  objc_exception_throw(v5);
  return (__NSPlaceholderURLComponents *)+[__NSPlaceholderURLComponents automaticallyNotifiesObserversForKey:]( v6,  v7,  v8);
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (unint64_t)retainCount
{
  return -1LL;
}

- (id)URL
{
  v2 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v2);
  return -[__NSPlaceholderURLComponents URLRelativeToURL:](v3, v4, v5);
}

- (id)URLRelativeToURL:(id)a3
{
  v3 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v3);
  return -[__NSPlaceholderURLComponents string](v4, v5);
}

- (id)string
{
  v2 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v2);
  return -[__NSPlaceholderURLComponents scheme](v3, v4);
}

- (id)scheme
{
  v2 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v2);
  -[__NSPlaceholderURLComponents setScheme:](v3, v4, v5);
  return result;
}

- (void)setScheme:(id)a3
{
  v3 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v3);
  -[__NSPlaceholderURLComponents user](v4, v5);
}

- (id)user
{
  v2 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v2);
  -[__NSPlaceholderURLComponents setUser:](v3, v4, v5);
  return result;
}

- (void)setUser:(id)a3
{
  v3 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v3);
  -[__NSPlaceholderURLComponents password](v4, v5);
}

- (id)password
{
  v2 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v2);
  -[__NSPlaceholderURLComponents setPassword:](v3, v4, v5);
  return result;
}

- (void)setPassword:(id)a3
{
  v3 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v3);
  -[__NSPlaceholderURLComponents host](v4, v5);
}

- (id)host
{
  v2 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v2);
  -[__NSPlaceholderURLComponents setHost:](v3, v4, v5);
  return result;
}

- (void)setHost:(id)a3
{
  v3 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v3);
  -[__NSPlaceholderURLComponents port](v4, v5);
}

- (id)port
{
  v2 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v2);
  -[__NSPlaceholderURLComponents setPort:](v3, v4, v5);
  return result;
}

- (void)setPort:(id)a3
{
  v3 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v3);
  -[__NSPlaceholderURLComponents path](v4, v5);
}

- (id)path
{
  v2 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v2);
  -[__NSPlaceholderURLComponents setPath:](v3, v4, v5);
  return result;
}

- (void)setPath:(id)a3
{
  v3 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v3);
  -[__NSPlaceholderURLComponents query](v4, v5);
}

- (id)query
{
  v2 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v2);
  -[__NSPlaceholderURLComponents setQuery:](v3, v4, v5);
  return result;
}

- (void)setQuery:(id)a3
{
  v3 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v3);
  -[__NSPlaceholderURLComponents fragment](v4, v5);
}

- (id)fragment
{
  v2 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v2);
  -[__NSPlaceholderURLComponents setFragment:](v3, v4, v5);
  return result;
}

- (void)setFragment:(id)a3
{
  v3 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v3);
  -[__NSPlaceholderURLComponents percentEncodedUser](v4, v5);
}

- (id)percentEncodedUser
{
  v2 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v2);
  -[__NSPlaceholderURLComponents setPercentEncodedUser:](v3, v4, v5);
  return result;
}

- (void)setPercentEncodedUser:(id)a3
{
  v3 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v3);
  -[__NSPlaceholderURLComponents percentEncodedPassword](v4, v5);
}

- (id)percentEncodedPassword
{
  v2 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v2);
  -[__NSPlaceholderURLComponents setPercentEncodedPassword:](v3, v4, v5);
  return result;
}

- (void)setPercentEncodedPassword:(id)a3
{
  v3 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v3);
  -[__NSPlaceholderURLComponents percentEncodedHost](v4, v5);
}

- (id)percentEncodedHost
{
  v2 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v2);
  -[__NSPlaceholderURLComponents setPercentEncodedHost:](v3, v4, v5);
  return result;
}

- (void)setPercentEncodedHost:(id)a3
{
  v3 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v3);
  -[__NSPlaceholderURLComponents encodedHost](v4, v5);
}

- (id)encodedHost
{
  v2 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v2);
  -[__NSPlaceholderURLComponents setEncodedHost:](v3, v4, v5);
  return result;
}

- (void)setEncodedHost:(id)a3
{
  v3 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v3);
  -[__NSPlaceholderURLComponents percentEncodedPath](v4, v5);
}

- (id)percentEncodedPath
{
  v2 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v2);
  -[__NSPlaceholderURLComponents setPercentEncodedPath:](v3, v4, v5);
  return result;
}

- (void)setPercentEncodedPath:(id)a3
{
  v3 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v3);
  -[__NSPlaceholderURLComponents percentEncodedQuery](v4, v5);
}

- (id)percentEncodedQuery
{
  v2 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v2);
  -[__NSPlaceholderURLComponents setPercentEncodedQuery:](v3, v4, v5);
  return result;
}

- (void)setPercentEncodedQuery:(id)a3
{
  v3 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v3);
  -[__NSPlaceholderURLComponents percentEncodedFragment](v4, v5);
}

- (id)percentEncodedFragment
{
  v2 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v2);
  -[__NSPlaceholderURLComponents setPercentEncodedFragment:](v3, v4, v5);
  return result;
}

- (void)setPercentEncodedFragment:(id)a3
{
  v3 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v3);
  -[__NSPlaceholderURLComponents rangeOfScheme](v4, v5);
}

- (_NSRange)rangeOfScheme
{
  v2 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v2);
  _NSRange v7 = -[__NSPlaceholderURLComponents rangeOfUser](v3, v4);
  NSUInteger length = v7.length;
  NSUInteger location = v7.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (_NSRange)rangeOfUser
{
  v2 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v2);
  _NSRange v7 = -[__NSPlaceholderURLComponents rangeOfPassword](v3, v4);
  NSUInteger length = v7.length;
  NSUInteger location = v7.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (_NSRange)rangeOfPassword
{
  v2 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v2);
  _NSRange v7 = -[__NSPlaceholderURLComponents rangeOfHost](v3, v4);
  NSUInteger length = v7.length;
  NSUInteger location = v7.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (_NSRange)rangeOfHost
{
  v2 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v2);
  _NSRange v7 = -[__NSPlaceholderURLComponents rangeOfPort](v3, v4);
  NSUInteger length = v7.length;
  NSUInteger location = v7.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (_NSRange)rangeOfPort
{
  v2 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v2);
  _NSRange v7 = -[__NSPlaceholderURLComponents rangeOfPath](v3, v4);
  NSUInteger length = v7.length;
  NSUInteger location = v7.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (_NSRange)rangeOfPath
{
  v2 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v2);
  _NSRange v7 = -[__NSPlaceholderURLComponents rangeOfQuery](v3, v4);
  NSUInteger length = v7.length;
  NSUInteger location = v7.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (_NSRange)rangeOfQuery
{
  v2 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v2);
  _NSRange v7 = -[__NSPlaceholderURLComponents rangeOfFragment](v3, v4);
  NSUInteger length = v7.length;
  NSUInteger location = v7.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (_NSRange)rangeOfFragment
{
  v2 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v2);
  id v5 = -[__NSPlaceholderURLComponents queryItems](v3, v4);
  result.NSUInteger length = v6;
  result.NSUInteger location = (NSUInteger)v5;
  return result;
}

- (id)queryItems
{
  v2 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v2);
  -[__NSPlaceholderURLComponents setQueryItems:](v3, v4, v5);
  return result;
}

- (void)setQueryItems:(id)a3
{
  v3 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v3);
  -[__NSPlaceholderURLComponents percentEncodedQueryItems](v4, v5);
}

- (id)percentEncodedQueryItems
{
  v2 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v2);
  -[__NSPlaceholderURLComponents setPercentEncodedQueryItems:](v3, v4, v5);
  return result;
}

- (void)setPercentEncodedQueryItems:(id)a3
{
  v3 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v3);
  +[NSURLComponents componentsWithURL:resolvingAgainstBaseURL:](v4, v5, v6, v7);
}

@end