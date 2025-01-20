@interface PBAppSwitcherFocusLayoutAttributes
- (BOOL)isContentHidden;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHeaderHidden;
- (CGRect)blurRect;
- (CGRect)maskRect;
- (double)blurRadius;
- (double)contentAlpha;
- (double)contentOffset;
- (double)contentScale;
- (double)cornerRadius;
- (double)dimmingAlpha;
- (double)shadowAlpha;
- (double)shadowBlurRadius;
- (double)snapshotOffset;
- (double)textAlpha;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)setBlurRadius:(double)a3;
- (void)setBlurRect:(CGRect)a3;
- (void)setContentAlpha:(double)a3;
- (void)setContentHidden:(BOOL)a3;
- (void)setContentOffset:(double)a3;
- (void)setContentScale:(double)a3;
- (void)setCornerRadius:(double)a3;
- (void)setDimmingAlpha:(double)a3;
- (void)setHeaderHidden:(BOOL)a3;
- (void)setMaskRect:(CGRect)a3;
- (void)setShadowAlpha:(double)a3;
- (void)setShadowBlurRadius:(double)a3;
- (void)setSnapshotOffset:(double)a3;
- (void)setTextAlpha:(double)a3;
@end

@implementation PBAppSwitcherFocusLayoutAttributes

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PBAppSwitcherFocusLayoutAttributes;
  id v4 = -[PBAppSwitcherFocusLayoutAttributes copyWithZone:](&v6, "copyWithZone:", a3);
  -[PBAppSwitcherFocusLayoutAttributes contentOffset](self, "contentOffset");
  objc_msgSend(v4, "setContentOffset:");
  -[PBAppSwitcherFocusLayoutAttributes contentScale](self, "contentScale");
  objc_msgSend(v4, "setContentScale:");
  -[PBAppSwitcherFocusLayoutAttributes snapshotOffset](self, "snapshotOffset");
  objc_msgSend(v4, "setSnapshotOffset:");
  -[PBAppSwitcherFocusLayoutAttributes cornerRadius](self, "cornerRadius");
  objc_msgSend(v4, "setCornerRadius:");
  -[PBAppSwitcherFocusLayoutAttributes blurRadius](self, "blurRadius");
  objc_msgSend(v4, "setBlurRadius:");
  -[PBAppSwitcherFocusLayoutAttributes blurRect](self, "blurRect");
  objc_msgSend(v4, "setBlurRect:");
  -[PBAppSwitcherFocusLayoutAttributes maskRect](self, "maskRect");
  objc_msgSend(v4, "setMaskRect:");
  -[PBAppSwitcherFocusLayoutAttributes contentAlpha](self, "contentAlpha");
  objc_msgSend(v4, "setContentAlpha:");
  -[PBAppSwitcherFocusLayoutAttributes dimmingAlpha](self, "dimmingAlpha");
  objc_msgSend(v4, "setDimmingAlpha:");
  -[PBAppSwitcherFocusLayoutAttributes shadowAlpha](self, "shadowAlpha");
  objc_msgSend(v4, "setShadowAlpha:");
  -[PBAppSwitcherFocusLayoutAttributes shadowBlurRadius](self, "shadowBlurRadius");
  objc_msgSend(v4, "setShadowBlurRadius:");
  -[PBAppSwitcherFocusLayoutAttributes textAlpha](self, "textAlpha");
  objc_msgSend(v4, "setTextAlpha:");
  objc_msgSend(v4, "setHeaderHidden:", -[PBAppSwitcherFocusLayoutAttributes isHeaderHidden](self, "isHeaderHidden"));
  objc_msgSend(v4, "setContentHidden:", -[PBAppSwitcherFocusLayoutAttributes isContentHidden](self, "isContentHidden"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v63.receiver = self;
  v63.super_class = (Class)&OBJC_CLASS___PBAppSwitcherFocusLayoutAttributes;
  if (!-[PBAppSwitcherFocusLayoutAttributes isEqual:](&v63, "isEqual:", v4)) {
    goto LABEL_15;
  }
  -[PBAppSwitcherFocusLayoutAttributes contentOffset](self, "contentOffset");
  double v6 = v5;
  [v4 contentOffset];
  if (v6 != v7) {
    goto LABEL_15;
  }
  -[PBAppSwitcherFocusLayoutAttributes contentScale](self, "contentScale");
  double v9 = v8;
  [v4 contentScale];
  if (v9 != v10) {
    goto LABEL_15;
  }
  -[PBAppSwitcherFocusLayoutAttributes snapshotOffset](self, "snapshotOffset");
  double v12 = v11;
  [v4 snapshotOffset];
  if (v12 != v13) {
    goto LABEL_15;
  }
  -[PBAppSwitcherFocusLayoutAttributes cornerRadius](self, "cornerRadius");
  double v15 = v14;
  [v4 cornerRadius];
  if (v15 != v16) {
    goto LABEL_15;
  }
  -[PBAppSwitcherFocusLayoutAttributes blurRadius](self, "blurRadius");
  double v18 = v17;
  [v4 blurRadius];
  if (v18 != v19) {
    goto LABEL_15;
  }
  -[PBAppSwitcherFocusLayoutAttributes blurRect](self, "blurRect");
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  [v4 blurRect];
  v66.origin.x = v28;
  v66.origin.y = v29;
  v66.size.width = v30;
  v66.size.height = v31;
  v64.origin.x = v21;
  v64.origin.y = v23;
  v64.size.width = v25;
  v64.size.height = v27;
  if (!CGRectEqualToRect(v64, v66)) {
    goto LABEL_15;
  }
  -[PBAppSwitcherFocusLayoutAttributes maskRect](self, "maskRect");
  CGFloat v33 = v32;
  CGFloat v35 = v34;
  CGFloat v37 = v36;
  CGFloat v39 = v38;
  [v4 maskRect];
  v67.origin.x = v40;
  v67.origin.y = v41;
  v67.size.width = v42;
  v67.size.height = v43;
  v65.origin.x = v33;
  v65.origin.y = v35;
  v65.size.width = v37;
  v65.size.height = v39;
  if (!CGRectEqualToRect(v65, v67)) {
    goto LABEL_15;
  }
  -[PBAppSwitcherFocusLayoutAttributes contentAlpha](self, "contentAlpha");
  double v45 = v44;
  [v4 contentAlpha];
  if (v45 != v46) {
    goto LABEL_15;
  }
  -[PBAppSwitcherFocusLayoutAttributes dimmingAlpha](self, "dimmingAlpha");
  double v48 = v47;
  [v4 dimmingAlpha];
  if (v48 != v49) {
    goto LABEL_15;
  }
  -[PBAppSwitcherFocusLayoutAttributes shadowAlpha](self, "shadowAlpha");
  double v51 = v50;
  [v4 shadowAlpha];
  if (v51 != v52) {
    goto LABEL_15;
  }
  -[PBAppSwitcherFocusLayoutAttributes shadowBlurRadius](self, "shadowBlurRadius");
  double v54 = v53;
  [v4 shadowBlurRadius];
  if (v54 == v55
    && (-[PBAppSwitcherFocusLayoutAttributes textAlpha](self, "textAlpha"),
        double v57 = v56,
        [v4 textAlpha],
        v57 == v58)
    && (unsigned int v59 = -[PBAppSwitcherFocusLayoutAttributes isHeaderHidden](self, "isHeaderHidden"),
        v59 == [v4 isHeaderHidden]))
  {
    unsigned int v62 = -[PBAppSwitcherFocusLayoutAttributes isContentHidden](self, "isContentHidden");
    unsigned int v60 = v62 ^ [v4 isContentHidden] ^ 1;
  }

  else
  {
LABEL_15:
    LOBYTE(v60) = 0;
  }

  return v60;
}

- (unint64_t)hash
{
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___PBAppSwitcherFocusLayoutAttributes;
  id v31 = -[PBAppSwitcherFocusLayoutAttributes hash](&v32, "hash");
  -[PBAppSwitcherFocusLayoutAttributes contentOffset](self, "contentOffset");
  unint64_t v30 = (unint64_t)v3;
  -[PBAppSwitcherFocusLayoutAttributes contentScale](self, "contentScale");
  unint64_t v29 = (unint64_t)v4;
  -[PBAppSwitcherFocusLayoutAttributes snapshotOffset](self, "snapshotOffset");
  unint64_t v28 = (unint64_t)v5;
  -[PBAppSwitcherFocusLayoutAttributes cornerRadius](self, "cornerRadius");
  unint64_t v27 = (unint64_t)v6;
  -[PBAppSwitcherFocusLayoutAttributes blurRadius](self, "blurRadius");
  unint64_t v8 = (unint64_t)v7;
  -[PBAppSwitcherFocusLayoutAttributes shadowAlpha](self, "shadowAlpha");
  unint64_t v10 = (unint64_t)v9;
  -[PBAppSwitcherFocusLayoutAttributes shadowBlurRadius](self, "shadowBlurRadius");
  unint64_t v12 = (unint64_t)v11;
  -[PBAppSwitcherFocusLayoutAttributes textAlpha](self, "textAlpha");
  unint64_t v14 = (unint64_t)v13;
  -[PBAppSwitcherFocusLayoutAttributes dimmingAlpha](self, "dimmingAlpha");
  unint64_t v16 = (unint64_t)v15;
  -[PBAppSwitcherFocusLayoutAttributes contentAlpha](self, "contentAlpha");
  unint64_t v18 = (unint64_t)v17;
  -[PBAppSwitcherFocusLayoutAttributes blurRect](self, "blurRect");
  double v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](&OBJC_CLASS___NSValue, "valueWithCGRect:"));
  id v20 = [v19 hash];

  -[PBAppSwitcherFocusLayoutAttributes maskRect](self, "maskRect");
  CGFloat v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](&OBJC_CLASS___NSValue, "valueWithCGRect:"));
  id v22 = [v21 hash];

  unsigned int v23 = -[PBAppSwitcherFocusLayoutAttributes isHeaderHidden](self, "isHeaderHidden");
  unsigned int v24 = -[PBAppSwitcherFocusLayoutAttributes isContentHidden](self, "isContentHidden");
  uint64_t v25 = 5LL;
  if (!v24) {
    uint64_t v25 = 0LL;
  }
  return (unint64_t)v31
       + 450 * v18
       + 350 * v12
       + 300 * v14
       + 250 * v16
       + 250 * v10
       + 200 * v8
       + 150 * v27
       + 100 * v28
       + 50 * v29
       + 10 * v30
       + (unint64_t)v22
       + (void)v20
       + v23
       + v25;
}

- (id)description
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PBAppSwitcherFocusLayoutAttributes;
  id v3 = -[PBAppSwitcherFocusLayoutAttributes description](&v10, "description");
  double v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  -[PBAppSwitcherFocusLayoutAttributes contentOffset](self, "contentOffset");
  uint64_t v6 = v5;
  -[PBAppSwitcherFocusLayoutAttributes snapshotOffset](self, "snapshotOffset");
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@\n  contentOffset: %f\n  snapshotOffset: %f",  v4,  v6,  v7));

  return v8;
}

- (double)contentOffset
{
  return self->_contentOffset;
}

- (void)setContentOffset:(double)a3
{
  self->_contentOffset = a3;
}

- (double)contentScale
{
  return self->_contentScale;
}

- (void)setContentScale:(double)a3
{
  self->_contentScale = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (double)blurRadius
{
  return self->_blurRadius;
}

- (void)setBlurRadius:(double)a3
{
  self->_blurRadius = a3;
}

- (CGRect)blurRect
{
  double x = self->_blurRect.origin.x;
  double y = self->_blurRect.origin.y;
  double width = self->_blurRect.size.width;
  double height = self->_blurRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBlurRect:(CGRect)a3
{
  self->_blurRect = a3;
}

- (CGRect)maskRect
{
  double x = self->_maskRect.origin.x;
  double y = self->_maskRect.origin.y;
  double width = self->_maskRect.size.width;
  double height = self->_maskRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setMaskRect:(CGRect)a3
{
  self->_maskRect = a3;
}

- (double)contentAlpha
{
  return self->_contentAlpha;
}

- (void)setContentAlpha:(double)a3
{
  self->_contentAlpha = a3;
}

- (double)dimmingAlpha
{
  return self->_dimmingAlpha;
}

- (void)setDimmingAlpha:(double)a3
{
  self->_dimmingAlpha = a3;
}

- (double)shadowAlpha
{
  return self->_shadowAlpha;
}

- (void)setShadowAlpha:(double)a3
{
  self->_shadowAlpha = a3;
}

- (double)shadowBlurRadius
{
  return self->_shadowBlurRadius;
}

- (void)setShadowBlurRadius:(double)a3
{
  self->_shadowBlurRadius = a3;
}

- (double)textAlpha
{
  return self->_textAlpha;
}

- (void)setTextAlpha:(double)a3
{
  self->_textAlpha = a3;
}

- (double)snapshotOffset
{
  return self->_snapshotOffset;
}

- (void)setSnapshotOffset:(double)a3
{
  self->_snapshotOffset = a3;
}

- (BOOL)isHeaderHidden
{
  return self->_headerHidden;
}

- (void)setHeaderHidden:(BOOL)a3
{
  self->_headerHidden = a3;
}

- (BOOL)isContentHidden
{
  return self->_contentHidden;
}

- (void)setContentHidden:(BOOL)a3
{
  self->_contentHidden = a3;
}

@end