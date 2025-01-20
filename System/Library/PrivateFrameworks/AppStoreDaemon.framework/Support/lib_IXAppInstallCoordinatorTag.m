@interface lib_IXAppInstallCoordinatorTag
- (BOOL)isEqual:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation lib_IXAppInstallCoordinatorTag

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p> { coordinatorID = %@; bundleID = %@ }",
                   v5,
                   self,
                   self->_coordinatorID,
                   self->_bundleID));

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (lib_IXAppInstallCoordinatorTag *)a3;
  if (self == v5)
  {
    unsigned __int8 v10 = 1;
  }

  else
  {
    uint64_t v6 = objc_opt_class(self, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = v5;
      if (self)
      {
        bundleID = self->_bundleID;
        v9 = v7->_bundleID;
        if (bundleID == v9) {
          goto LABEL_8;
        }
        unsigned __int8 v10 = 0;
        if (!bundleID || !v9)
        {
LABEL_16:

          goto LABEL_17;
        }

        if (-[NSString isEqual:](bundleID, "isEqual:"))
        {
LABEL_8:
          coordinatorID = self->_coordinatorID;
          v12 = v7->_coordinatorID;
          if (coordinatorID == v12)
          {
            unsigned __int8 v10 = 1;
          }

          else
          {
            unsigned __int8 v10 = 0;
            if (coordinatorID && v12) {
              unsigned __int8 v10 = -[NSUUID isEqual:](coordinatorID, "isEqual:");
            }
          }

          goto LABEL_16;
        }
      }

      unsigned __int8 v10 = 0;
      goto LABEL_16;
    }

    unsigned __int8 v10 = 0;
  }

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_bundleID, "hash");
  return (unint64_t)-[NSUUID hash](self->_coordinatorID, "hash") ^ v3;
}

- (void).cxx_destruct
{
}

@end