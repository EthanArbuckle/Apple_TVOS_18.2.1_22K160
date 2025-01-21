@interface BKDisplayAnnotation
+ (BKDisplayAnnotation)annotationWithEllipseSize:(CGSize)a3;
+ (BKDisplayAnnotation)annotationWithRectangleSize:(CGSize)a3;
+ (BKDisplayAnnotation)annotationWithString:(id)a3;
+ (BKDisplayAnnotation)new;
+ (id)subannotationWithString:(id)a3;
- (BKDisplayAnnotation)init;
- (BKDisplayAnnotationContent)content;
- (BKDisplayAnnotationController)annotationController;
- (BKDisplayAnnotationLocation)location;
- (BKDisplayAnnotationRenderer)renderer;
- (BKDisplayAnnotationStyleSheet)styleSheet;
- (BKNamespaceNode)namespaceNode;
- (BOOL)isEqual:(id)a3;
- (NSString)section;
- (id)_init;
- (id)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)subnodeScreenEdgeTreatment;
- (void)modifyStyleSheet:(id)a3;
- (void)setAnnotationController:(id)a3;
- (void)setContent:(id)a3;
- (void)setLocation:(id)a3;
- (void)setNamespaceNode:(id)a3;
- (void)setRenderer:(id)a3;
- (void)setSection:(id)a3;
- (void)setShapeSize:(CGSize)a3;
- (void)setString:(id)a3;
- (void)setStyleModifier:(id)a3;
- (void)setStyleSheet:(id)a3;
- (void)setSubnodeScreenEdgeTreatment:(int64_t)a3;
@end

@implementation BKDisplayAnnotation

- (BKDisplayAnnotation)init
{
  v4 = [NSString stringWithFormat:@"use one of the factory methods"];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v5 = NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v8 = [self class];
    v9 = NSStringFromClass(v8);
    v10 = [v9 autorelease];
    int v12 = 138544642;
    v13 = v6;
    __int16 v14 = 2114;
    v15 = v10;
    __int16 v16 = 2048;
    v17 = self;
    __int16 v18 = 2114;
    v19 = @"BKDisplayAnnotation.m";
    __int16 v20 = 1024;
    int v21 = 86;
    __int16 v22 = 2114;
    v23 = v4;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  (uint8_t *)&v12,  0x3Au);
  }

  result = (BKDisplayAnnotation *)_bs_set_crash_log_message([v4 UTF8String]);
  __break(0);
  return result;
}

- (id)_init
{
  v8.receiver = self;
  v8.super_class = [BKDisplayAnnotation class];
  BKDisplayAnnotation *v2 = [[BKDisplayAnnotation alloc] init];
  if (v2)
  {
    uint64_t v3 = [BKDisplayAnnotationLocation controlledBySupernode];
    location = v2->_location;
    v2->_location = (BKDisplayAnnotationLocation *)v3;

    BKDisplayAnnotationRenderer *v5 = [[BKDisplayAnnotationRenderer alloc] init];
    renderer = v2->_renderer;
    v2->_renderer = v5;

    [v2->_renderer setAnnotation:v2];
  }

  return v2;
}

- (id)succinctDescription
{
  v2 = [self succinctDescriptionBuilder];
  uint64_t v3 = (void *)[v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  BSDescriptionBuilder *returnValue = [BSDescriptionBuilder builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [BKDisplayAnnotation descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [self succinctDescriptionBuilder];
  id v5 = [v4 appendObject:self->_content withName:@"content"];
  id v6 = [v4 appendObject:self->_section withName:@"section" skipIfNil:1];
  return v4;
}

- (id)description
{
  return [self descriptionWithMultilinePrefix:0LL];
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  if (v5 && (uint64_t v6 = objc_opt_class(self, v4), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    content = self->_content;
    objc_super v8 = [v5 content];
    BOOL v9 = [content isEqual:v8];
  }

  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (void)setRenderer:(id)a3
{
  id v5 = (BKDisplayAnnotationRenderer *)a3;
  if (self->_renderer != v5)
  {
    uint64_t v6 = v5;
    self->_renderer = a3;
    [self->_renderer setAnnotation:self];
    id v5 = v6;
  }
}

- (void)setContent:(id)a3
{
  uint64_t v6 = (BKDisplayAnnotationContent *)a3;
  content = self->_content;
  if (content != v6)
  {
    if (content)
    {
      NSString *v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_content == ((void *)0)"];
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        unsigned __int8 v9 = NSStringFromSelector(a2);
        v10 = [v9 autorelease];
        int v12 = [self class];
        v13 = NSStringFromClass(v12);
        __int16 v14 = [v13 autorelease];
        *(_DWORD *)buf = 138544642;
        v17 = v10;
        __int16 v18 = 2114;
        v19 = v14;
        __int16 v20 = 2048;
        int v21 = self;
        __int16 v22 = 2114;
        v23 = @"BKDisplayAnnotation.m";
        __int16 v24 = 1024;
        int v25 = 162;
        __int16 v26 = 2114;
        v27 = v8;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
      }

      _bs_set_crash_log_message([v8 UTF8String]);
      __break(0);
      JUMPOUT(0x10006C2D0LL);
    }

    v15 = v6;
    self->_content = a3;
    [self->_renderer styleSheetDidChange];
    uint64_t v6 = v15;
  }
}

- (void)setLocation:(id)a3
{
  uint64_t v4 = (BKDisplayAnnotationLocation *)a3;
  location = self->_location;
  if (location != v4)
  {
    unsigned __int8 v9 = v4;
    BOOL v6 = [location isEqual:v4];
    uint64_t v4 = v9;
    if ((v6 & 1) == 0)
    {
      BKDisplayAnnotationLocation *v7 = [BKDisplayAnnotationLocation copy];
      objc_super v8 = self->_location;
      self->_location = v7;

      [self->_renderer locationDidChange];
      uint64_t v4 = v9;
    }
  }
}

- (void)setString:(id)a3
{
  content = self->_content;
  id v9 = a3;
  BKDisplayAnnotationStringContent *v6 = [BKDisplayAnnotationStringContent class];
  if ((objc_opt_isKindOfClass(content, v6) & 1) != 0)
  {
    [self->_content setString:v9];
    uint64_t v7 = v9;
  }

  else
  {
    uint64_t v8 = [BKDisplayAnnotationStringContent contentWithString:v9];

    [self setContent:v8];
    uint64_t v7 = (void *)v8;
  }
}

- (void)setShapeSize:(CGSize)a3
{
  BKDisplayAnnotationShapeContent *v4 = [BKDisplayAnnotationShapeContent contentWithSize:CGSizeMake(a3.width, a3.height)];
  [self setContent:v4];
}

- (void)modifyStyleSheet:(id)a3
{
}

- (void)setStyleModifier:(id)a3
{
}

- (BKDisplayAnnotationLocation)location
{
  return self->_location;
}

- (BKDisplayAnnotationRenderer)renderer
{
  return self->_renderer;
}

- (NSString)section
{
  return self->_section;
}

- (void)setSection:(id)a3
{
}

- (int64_t)subnodeScreenEdgeTreatment
{
  return self->_subnodeScreenEdgeTreatment;
}

- (void)setSubnodeScreenEdgeTreatment:(int64_t)a3
{
  self->_subnodeScreenEdgeTreatment = a3;
}

- (BKDisplayAnnotationContent)content
{
  return self->_content;
}

- (BKDisplayAnnotationController)annotationController
{
  return (BKDisplayAnnotationController *)self->_annotationController;
}

- (void)setAnnotationController:(id)a3
{
}

- (BKDisplayAnnotationStyleSheet)styleSheet
{
  return self->_styleSheet;
}

- (void)setStyleSheet:(id)a3
{
}

- (BKNamespaceNode)namespaceNode
{
  return (BKNamespaceNode *)self->_namespaceNode;
}

- (void)setNamespaceNode:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (BKDisplayAnnotation)annotationWithString:(id)a3
{
  id v4 = a3;
  id v5 = [[a1 alloc] init];
  [v5 setString:v4];

  BKDisplayAnnotationStyleSheet *v6 = [[BKDisplayAnnotationStyleSheet alloc] init];
  uint64_t v7 = [BKDisplayAnnotationStyle textStyle];
  [v6 setBaseStyle:v7];

  uint64_t v8 = [BKDisplayAnnotationStyle minimalStyle];
  [v6 setStyleModifier:v8];

  [v5 setStyleSheet:v6];
  return (BKDisplayAnnotation *)v5;
}

+ (id)subannotationWithString:(id)a3
{
  uint64_t v3 = (void *)[a1 annotationWithString:a3];
  BKDisplayAnnotationNullRenderer *v4 = [[BKDisplayAnnotationNullRenderer alloc] init];
  [v3 setRenderer:v4];

  return v3;
}

+ (BKDisplayAnnotation)annotationWithEllipseSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = [[a1 alloc] init];
  [v5 setShapeSize:CGSizeMake(width, height)];
  BKDisplayAnnotationStyleSheet *v6 = [[BKDisplayAnnotationStyleSheet alloc] init];
  uint64_t v7 = [BKDisplayAnnotationStyle ellipseStyle];
  [v6 setBaseStyle:v7];

  uint64_t v8 = [BKDisplayAnnotationStyle minimalStyle];
  [v6 setStyleModifier:v8];

  [v5 setStyleSheet:v6];
  return (BKDisplayAnnotation *)v5;
}

+ (BKDisplayAnnotation)annotationWithRectangleSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = [[a1 alloc] init];
  [v5 setShapeSize:CGSizeMake(width, height)];
  BKDisplayAnnotationStyleSheet *v6 = [[BKDisplayAnnotationStyleSheet alloc] init];
  uint64_t v7 = [BKDisplayAnnotationStyle rectangleStyle];
  [v6 setBaseStyle:v7];

  uint64_t v8 = [BKDisplayAnnotationStyle minimalStyle];
  [v6 setStyleModifier:v8];

  [v5 setStyleSheet:v6];
  return (BKDisplayAnnotation *)v5;
}

+ (BKDisplayAnnotation)new
{
  id v4 = [NSString stringWithFormat:@"use one of the factory methods"];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v5 = NSStringFromSelector(a2);
    uint64_t v6 = [v5 autorelease];
    uint64_t v8 = [a1 class];
    id v9 = NSStringFromClass(v8);
    v10 = (void *)[v9 autorelease];
    int v12 = 138544642;
    v13 = v6;
    __int16 v14 = 2114;
    v15 = v10;
    __int16 v16 = 2048;
    id v17 = a1;
    __int16 v18 = 2114;
    v19 = @"BKDisplayAnnotation.m";
    __int16 v20 = 1024;
    int v21 = 91;
    __int16 v22 = 2114;
    v23 = v4;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  (uint8_t *)&v12,  0x3Au);
  }

  result = (BKDisplayAnnotation *)_bs_set_crash_log_message([v4 UTF8String]);
  __break(0);
  return result;
}

@end