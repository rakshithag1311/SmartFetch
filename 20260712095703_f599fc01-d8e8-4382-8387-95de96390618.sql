
CREATE POLICY "Shop staff can insert items"
ON public.shop_items
FOR INSERT
TO authenticated
WITH CHECK (
  EXISTS (
    SELECT 1 FROM public.shop_staff
    WHERE shop_staff.user_id = auth.uid()
      AND shop_staff.shop_id = shop_items.shop_id
  )
);

CREATE POLICY "Shop staff can update items"
ON public.shop_items
FOR UPDATE
TO authenticated
USING (
  EXISTS (
    SELECT 1 FROM public.shop_staff
    WHERE shop_staff.user_id = auth.uid()
      AND shop_staff.shop_id = shop_items.shop_id
  )
);

CREATE POLICY "Shop staff can delete items"
ON public.shop_items
FOR DELETE
TO authenticated
USING (
  EXISTS (
    SELECT 1 FROM public.shop_staff
    WHERE shop_staff.user_id = auth.uid()
      AND shop_staff.shop_id = shop_items.shop_id
  )
);
