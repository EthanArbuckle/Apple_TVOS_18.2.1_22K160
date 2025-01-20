@interface _NSURLComponentsBridge
- (BOOL)_setEncodedHost:(id)a3;
- (BOOL)_setPercentEncodedFragment:(id)a3;
- (BOOL)_setPercentEncodedHost:(id)a3;
- (BOOL)_setPercentEncodedPassword:(id)a3;
- (BOOL)_setPercentEncodedPath:(id)a3;
- (BOOL)_setPercentEncodedQuery:(id)a3;
- (BOOL)_setPercentEncodedQueryItems:(id)a3;
- (BOOL)_setPercentEncodedUser:(id)a3;
- (BOOL)_setPort:(id)a3;
- (BOOL)_setScheme:(id)a3;
- (NSArray)_percentEncodedQueryItems;
- (NSNumber)_port;
- (NSString)_encodedHost;
- (NSString)_percentEncodedFragment;
- (NSString)_percentEncodedHost;
- (NSString)_percentEncodedPassword;
- (NSString)_percentEncodedPath;
- (NSString)_percentEncodedQuery;
- (NSString)_percentEncodedUser;
- (NSString)_scheme;
- (void)setEncodedHost:(id)a3;
- (void)setPercentEncodedFragment:(id)a3;
- (void)setPercentEncodedHost:(id)a3;
- (void)setPercentEncodedPassword:(id)a3;
- (void)setPercentEncodedPath:(id)a3;
- (void)setPercentEncodedQuery:(id)a3;
- (void)setPercentEncodedQueryItems:(id)a3;
- (void)setPercentEncodedUser:(id)a3;
- (void)setPort:(id)a3;
- (void)setScheme:(id)a3;
@end

@implementation _NSURLComponentsBridge

- (void)setScheme:(id)a3
{
  if (!-[_NSURLComponentsBridge _setScheme:](self, "_setScheme:", a3))
  {
    v5 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: invalid characters in scheme", _NSMethodExceptionProem((objc_class *)-[_NSURLComponentsBridge superclass](self, "superclass"), a2)), 0 reason userInfo];
    objc_exception_throw(v5);
    -[_NSURLComponentsBridge _setScheme:](v6, v7, v8);
  }

- (BOOL)_setScheme:(id)a3
{
  v5 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)setPercentEncodedUser:(id)a3
{
  if (!-[_NSURLComponentsBridge _setPercentEncodedUser:](self, "_setPercentEncodedUser:", a3))
  {
    v5 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: invalid characters in percentEncodedUser", _NSMethodExceptionProem((objc_class *)-[_NSURLComponentsBridge superclass](self, "superclass"), a2)), 0 reason userInfo];
    objc_exception_throw(v5);
    -[_NSURLComponentsBridge _setPercentEncodedUser:](v6, v7, v8);
  }

- (BOOL)_setPercentEncodedUser:(id)a3
{
  v5 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)setPercentEncodedPassword:(id)a3
{
  if (!-[_NSURLComponentsBridge _setPercentEncodedPassword:](self, "_setPercentEncodedPassword:", a3))
  {
    v5 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: invalid characters in percentEncodedPassword", _NSMethodExceptionProem((objc_class *)-[_NSURLComponentsBridge superclass](self, "superclass"), a2)), 0 reason userInfo];
    objc_exception_throw(v5);
    -[_NSURLComponentsBridge _setPercentEncodedPassword:](v6, v7, v8);
  }

- (BOOL)_setPercentEncodedPassword:(id)a3
{
  v5 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)setPercentEncodedHost:(id)a3
{
  if (!-[_NSURLComponentsBridge _setPercentEncodedHost:](self, "_setPercentEncodedHost:", a3))
  {
    v5 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: invalid characters in percentEncodedHost", _NSMethodExceptionProem((objc_class *)-[_NSURLComponentsBridge superclass](self, "superclass"), a2)), 0 reason userInfo];
    objc_exception_throw(v5);
    -[_NSURLComponentsBridge _setPercentEncodedHost:](v6, v7, v8);
  }

- (BOOL)_setPercentEncodedHost:(id)a3
{
  v5 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)setEncodedHost:(id)a3
{
  if (!-[_NSURLComponentsBridge _setEncodedHost:](self, "_setEncodedHost:", a3))
  {
    v5 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: invalid characters in encodedHost", _NSMethodExceptionProem((objc_class *)-[_NSURLComponentsBridge superclass](self, "superclass"), a2)), 0 reason userInfo];
    objc_exception_throw(v5);
    -[_NSURLComponentsBridge _setEncodedHost:](v6, v7, v8);
  }

- (BOOL)_setEncodedHost:(id)a3
{
  v5 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)setPort:(id)a3
{
  if (!-[_NSURLComponentsBridge _setPort:](self, "_setPort:", a3))
  {
    v5 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: negative port number", _NSMethodExceptionProem((objc_class *)-[_NSURLComponentsBridge superclass](self, "superclass"), a2)), 0 reason userInfo];
    objc_exception_throw(v5);
    -[_NSURLComponentsBridge _setPort:](v6, v7, v8);
  }

- (BOOL)_setPort:(id)a3
{
  v5 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)setPercentEncodedPath:(id)a3
{
  if (!-[_NSURLComponentsBridge _setPercentEncodedPath:](self, "_setPercentEncodedPath:", a3))
  {
    v5 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: invalid characters in percentEncodedPath", _NSMethodExceptionProem((objc_class *)-[_NSURLComponentsBridge superclass](self, "superclass"), a2)), 0 reason userInfo];
    objc_exception_throw(v5);
    -[_NSURLComponentsBridge _setPercentEncodedPath:](v6, v7, v8);
  }

- (BOOL)_setPercentEncodedPath:(id)a3
{
  v5 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)setPercentEncodedQuery:(id)a3
{
  if (!-[_NSURLComponentsBridge _setPercentEncodedQuery:](self, "_setPercentEncodedQuery:", a3))
  {
    v5 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: invalid characters in percentEncodedQuery", _NSMethodExceptionProem((objc_class *)-[_NSURLComponentsBridge superclass](self, "superclass"), a2)), 0 reason userInfo];
    objc_exception_throw(v5);
    -[_NSURLComponentsBridge _setPercentEncodedQuery:](v6, v7, v8);
  }

- (BOOL)_setPercentEncodedQuery:(id)a3
{
  v5 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)setPercentEncodedQueryItems:(id)a3
{
  if (!-[_NSURLComponentsBridge _setPercentEncodedQueryItems:](self, "_setPercentEncodedQueryItems:", a3))
  {
    v5 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: invalid characters in percentEncodedQueryItems", _NSMethodExceptionProem((objc_class *)-[_NSURLComponentsBridge superclass](self, "superclass"), a2)), 0 reason userInfo];
    objc_exception_throw(v5);
    -[_NSURLComponentsBridge _setPercentEncodedQueryItems:](v6, v7, v8);
  }

- (BOOL)_setPercentEncodedQueryItems:(id)a3
{
  v5 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)setPercentEncodedFragment:(id)a3
{
  if (!-[_NSURLComponentsBridge _setPercentEncodedFragment:](self, "_setPercentEncodedFragment:", a3))
  {
    v5 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: invalid characters in percentEncodedFragment", _NSMethodExceptionProem((objc_class *)-[_NSURLComponentsBridge superclass](self, "superclass"), a2)), 0 reason userInfo];
    objc_exception_throw(v5);
    -[_NSURLComponentsBridge _setPercentEncodedFragment:](v6, v7, v8);
  }

- (BOOL)_setPercentEncodedFragment:(id)a3
{
  v5 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSString)_scheme
{
  v4 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSString)_percentEncodedUser
{
  v4 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSString)_percentEncodedPassword
{
  v4 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSString)_percentEncodedHost
{
  v4 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSString)_encodedHost
{
  v4 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSNumber)_port
{
  v4 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSString)_percentEncodedPath
{
  v4 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSString)_percentEncodedQuery
{
  v4 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSArray)_percentEncodedQueryItems
{
  v4 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSString)_percentEncodedFragment
{
  v4 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

@end